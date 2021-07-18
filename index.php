<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
$data_arr = array();

//connection
$conn = mysqli_connect("localhost", "root","","cricket_tournament") or die(mysql_error("database"));  


if(isset($_GET['key'])){

	//check token
	$key	=	$_GET['key'];
	$query_token = mysqli_query($conn, "SELECT token from api_token where token='$key' AND status='1'");
	$count 	=	mysqli_num_rows($query_token);
	if($count > 0){
		//players array
		$player_arr =array();
		$players_arr_query 	=	mysqli_query($conn, "SELECT id,Name from player");
		while($data_players_arr	= 	mysqli_fetch_assoc($players_arr_query)){
			$player_arr[$data_players_arr['id']]	=	$data_players_arr['Name'];
		}

		//Teams array
		$team_arr =array();
		$team_arr_query 	=	mysqli_query($conn, "SELECT id,Name from team");
		while($data_team_arr	= 	mysqli_fetch_assoc($team_arr_query)){
			$team_arr[$data_team_arr['id']]	=	$data_team_arr['Name'];
		}

		$request_method = $_SERVER['REQUEST_METHOD'];


		switch ($request_method) {
			case 'GET':
				json_format("true",DoGet());
				break;
			case 'POST':
				//DoPost();
				break;
			
		}
	}else{
		json_format("false","Token is invalid/ inactive");
	}
}else{
	json_format("false","Please Provide Api key");

}

function DoGet(){
	global $conn,$data_arr,$player_arr,$team_arr;
	$where='';
	unset($_GET['key']);
	//country
	if(empty($_GET) || isset($_GET['country'])){
		if(isset($_GET['country'])){
			$where 	= "where id=".$_GET['country'];
		}
		$query_country 	=	mysqli_query($conn, "SELECT name from country $where");
		while($data_country	= 	mysqli_fetch_assoc($query_country)){
			$data_arr['Countries'][]	=	$data_country;
		}
	}
	//team
	if(empty($_GET) || isset($_GET['team'])){
		if(isset($_GET['team'])){
			$where 	= "where t.id=".$_GET['team'];
		}
		$query_team 	=	mysqli_query($conn, "SELECT t.id,t.name,t.abb,p.name as captain from team as t left join player as p on t.captain=p.id $where");
		while($data_team	= 	mysqli_fetch_assoc($query_team)){
			$data_arr['Teams'][]	=	$data_team;
		}
	}

	//players
	if(empty($_GET) || isset($_GET['player'])){
		if(isset($_GET['player'])){
			$where 	= "where p.id=".$_GET['player'];
		}
		$query_player 	=	mysqli_query($conn, "SELECT p.id,p.name,p.age,t.name as team,p.matches_played as matches,p.wickets,p.runs from player as p left join team as t on p.teamid=t.id $where");
		while($data_player	= 	mysqli_fetch_assoc($query_player)){
			$data_arr['Players'][]	=	$data_player;
		}
	}

	//venue
	if(empty($_GET) || isset($_GET['venue'])){
		if(isset($_GET['venue'])){
			$where 	= "where v.id=".$_GET['venue'];
		}
		$query_venue 	=	mysqli_query($conn, "SELECT v.id,v.name,v.city,v.state,v.postcode,c.name as country from venue as v left join country as c on v.countryid=c.id $where");
		while($data_venue	= 	mysqli_fetch_assoc($query_venue)){
			$data_arr['Venues'][]	=	$data_venue;
		}
	}

	//matches
	if(empty($_GET) || @$_GET['matches']== "on" ){
		
		$query_match 	=	mysqli_query($conn, "SELECT date,winner,looser,man_of_match,bowler_of_match,best_fielder from matches ");
		while($data_match	= 	mysqli_fetch_assoc($query_match)){
			$winner=$looser=$man_fm=$bowler_fm=$fieder_fm=$match_details="";
			$winner	= $team_arr[$data_match['winner']];
			$looser	= $team_arr[$data_match['looser']];
			$man_fm	= $player_arr[$data_match['man_of_match']];
			$bowler_fm= $player_arr[$data_match['bowler_of_match']];
			$fieder_fm= $player_arr[$data_match['best_fielder']];
			$match_details = "$winner VS $looser - ".$data_match['date'];

			$data_arr['matches'][] =array('team details'=>$match_details,'Winner'=>$winner,'Looser'=>$looser,'Man of match'=>$man_fm,'Bowler of match'=>$bowler_fm,'Best fielder'=>$fieder_fm) ;
			
		}
	}
	//Tournament result
	if(empty($_GET) || @$_GET['scoreboard']== "on" ){
		$query_tour 	=	mysqli_query($conn, "SELECT u.id,t.Name as team,u.points,u.won,u.lost,u.rank from tournament_score_table as u left join team as t on u.teamid=t.id");
		while($data_tour	= 	mysqli_fetch_assoc($query_tour)){
			$data_arr['tournament table'][]	=	$data_tour;
		}
	}

	return $data_arr;
}

function DoPost(){
	global $conn;
	echo "*Post Method Called*<br>";
}

function json_format($status,$data_arr){
	header('Content-Type: application/json');
	if(empty($data_arr)){
		echo json_encode(array('status'=>$status,'data'=>"No Results Found/Check parameters"));
	}else{
		echo json_encode(array('status'=>$status,'data'=>$data_arr));
	}
}

/*class Data{

	// connect to DB
	private $host = "localhost"; // your host name  
	private $username = "root"; // your user name  
	private $password = ""; // your password  
	private $db = "cricket_tournament"; // your database name  
	  
	public function __construct()  
	{  
		mysql_connect($this -> host, $this -> username, $this -> password) or die(mysql_error("database"));  
		mysql_select_db($this -> db) or die(mysql_error("database"));  
	}  

}
*/
?>