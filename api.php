<?php
//db credentials
$hostname = 'localhost';
$username = 'crystal';
$password = '12345678';
$database = 'code_test';

//error print with database
ini_set('display_errors', 1); 
ini_set('display_startup_errors', 1); 
error_reporting(E_ALL);

// Connect to the database
  try {
    $conn = new PDO("mysql:host=$hostname;dbname=$database", $username, $password);
  // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  } catch (PDOException $e) {
      echo "Connection failed: " . $e->getMessage();
  }

  


// Check if the request is an AJAX request
if ($_SERVER["REQUEST_METHOD"] == "GET") {
  // Return the people table as JSON
  $stmt = $conn->prepare('select p.name, p.id, p.height, p.dob, a.name as hobby from people as p 
  join(select h.name, x.* from hobbies as h 
  join (select h_i.hobby_id, p_i.* from hobby_interest as h_i
  join (select * from(select *,row_number() over(partition by person_id order by rand()) as rn
  from person_interest
  ) as t
  where person_id in (person_id) and rn <= 1) as p_i on h_i.interest_id=p_i.interest_id) as x
  on h.id=x.hobby_id) as a on p.id=a.person_id');
  $stmt->execute();
  $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
  header('Content-Type: application/json');
  echo json_encode($result);
  exit();
}

//Check if the request is Ajax Post request from button to Change Hobby
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $id = json_decode($_POST['field']);
  //echo "from php".$id;
  // Return the person by changing hobby as JSON
  $stmt = $conn->prepare('select p.name, p.id, p.height, p.dob, a.name as hobby from people as p
  join(select h.name, x.* from hobbies as h
  join (select h_i.hobby_id, p_i.* from hobby_interest as h_i
  join (select * from(select *,row_number() over(partition by person_id order by rand()) as rn
  from person_interest
  ) as t
  where person_id in (?) and rn <= 1) as p_i on h_i.interest_id=p_i.interest_id) as x
  on h.id=x.hobby_id) as a on p.id=a.person_id');
  $stmt->bindParam(1, $id, PDO::PARAM_INT);
  $stmt->execute();
  $result_post = $stmt->fetchAll(PDO::FETCH_ASSOC);
  header('Content-Type: application/json');
  echo json_encode($result_post);
  exit();
}

// Close the database connection

$conn = null;
?>