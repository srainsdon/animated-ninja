<?php
$servername = "localhost";
$username = "Sdx-Read";
$password = "";
$dbname = "Sodexo_15Min";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "SELECT * FROM Transaction WHERE StoreID = 9;";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo $row["TransactionTime"] . " " . $row["TransactionNumber"]. " " . $row["StoreID"]. "<br>";
		$Store[$row["TransactionTime"]] = $row["TransactionNumber"];
    }
} else {
    echo "0 results";
}
$conn->close();
?>