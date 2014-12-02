<?php
$servername = "localhost";
$username = "Sdx-Read";
$password = "";
$dbname = "Sodexo_15Min";

$ReportDate = $_GET["Date"];
$date = date_create();
sscanf($ReportDate,"%d-%d-%d",$year,$month,$day);
date_date_set($date,$year,$month,$day);
echo date_format($date,"Y/m/d");
echo '<head>
<link rel="stylesheet" type="text/css" href="main.css">
<title>Sdx-Reporting</title>
</head>';

/* $Times = array("00:00","00:15","00:30","00:45","01:00","01:15","01:30","01:45","02:00","02:15","02:30",
"02:45","03:00","03:15","03:30","03:45","04:00","04:15","04:30","04:45","05:00","05:15",
"05:30","05:45","06:00","06:15","06:30","06:45","07:00","07:15","07:30","07:45","08:00",
"08:15","08:30","08:45","09:00","09:15","09:30","09:45","10:00","10:15","10:30","10:45",
"11:00","11:15","11:30","11:45","12:00","12:15","12:30","12:45","13:00","13:15","13:30",
"13:45","14:00","14:15","14:30","14:45","15:00","15:15","15:30","15:45","16:00","16:15",
"16:30","16:45","17:00","17:15","17:30","17:45","18:00","18:15","18:30","18:45","19:00",
"19:15","19:30","19:45","20:00","20:15","20:30","20:45","21:00","21:15","21:30","21:45",
"22:00","22:15","22:30","22:45","23:00","23:15","23:30","23:45"); */

$Times = array("06:00","06:15","06:30","06:45","07:00","07:15","07:30","07:45","08:00",
"08:15","08:30","08:45","09:00","09:15","09:30","09:45","10:00","10:15","10:30","10:45",
"11:00","11:15","11:30","11:45","12:00","12:15","12:30","12:45","13:00","13:15","13:30",
"13:45","14:00","14:15","14:30","14:45","15:00","15:15","15:30","15:45","16:00","16:15",
"16:30","16:45","17:00","17:15","17:30","17:45","18:00","18:15","18:30","18:45","19:00",
"19:15","19:30","19:45","20:00","20:15","20:30","20:45","21:00","21:15","21:30","21:45",
"22:00","22:15","22:30","22:45","23:00","23:15","23:30","23:45","00:00","00:15","00:30",
"00:45","01:00","01:15","01:30","01:45","02:00");

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

//$sql = "SELECT * FROM Transaction WHERE StoreID = 9;";
$sql = "SELECT * FROM Transaction WHERE TransactionTime between '2013-08-30 00:00:00' and '2013-08-31 02:59:59';";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
		$time = substr($row["TransactionTime"], 11, 5);
        // echo $time . " " . $row["TransactionNumber"] . " " . $row["StoreID"]. "<br>";
		switch ($row['StoreID']) {
			case 1:
				$Jamba[$time] = $row["TransactionNumber"];
				break;
			case 2:
				$SubCo[$time] = $row["TransactionNumber"];
				break;
			case 3:
				$Pizza[$time] = $row["TransactionNumber"];
				break;
			case 4:
				$Stovers[$time] = $row["TransactionNumber"];
				break;
			case 5:
				$Traders[$time] = $row["TransactionNumber"];
				break;
			case 9:
				$Dennys[$time] = $row["TransactionNumber"];
				break;
			case 10:
				$Grill[$time] = $row["TransactionNumber"];
				break;
			case 11:
				$Bowl[$time] = $row["TransactionNumber"];
				break;
			case 12:
				$EBB1[$time] = $row["TransactionNumber"];
				break;
			case 13:
				$EBB2[$time] = $row["TransactionNumber"];
				break;
			case 14:
				$Bogeys[$time] = $row["TransactionNumber"];
				break;
			case 15:
				$Joes[$time] = $row["TransactionNumber"];
				break;
		}
    }
} else {
    echo "0 results";
}
$arrlength = count($Times);

echo '<table><tr>';
echo '<th>Time</th>';
echo"<th>Sub Co</th><th>Grill</th><th>Pizza</th><th>Joes</th><th>Jamba</th><th>Stovers</th><th>Salad Bar</th>
	<th>Bogeys</th><th>Mein Bowl</th><th>Denny's</th><th>Traders</th><th>EBB</th></tr>";
for($x = 0; $x < $arrlength; $x++) {
    echo "<tr><td>$Times[$x]</td>";
	if (array_key_exists($Times[$x],$SubCo))
		  {
		  echo "<td>" . $SubCo[$Times[$x]] . "</td>"; // </tr>
		  }
		else
		  {
		  echo "<td>-</td>";
		  }
	if (array_key_exists($Times[$x],$Grill))
		  {
		  echo "<td>" . $Grill[$Times[$x]] . "</td>"; // </tr>
		  }
		else
		  {
		  echo "<td>-</td>";
		  }
	if (array_key_exists($Times[$x],$Pizza))
		  {
		  echo "<td>" . $Pizza[$Times[$x]] . "</td>"; // </tr>
		  }
		else
		  {
		  echo "<td>-</td>";
		  }
	  if (array_key_exists($Times[$x],$Joes))
	  		{
	  		  echo "<td>" . $Joes[$Times[$x]] . "</td>"; // </tr>
	  		}
	  else
	  		{
	  		  echo "<td>-</td>";
	  		}
	if (array_key_exists($Times[$x],$Jamba))
		  {
		  echo "<td>" . $Jamba[$Times[$x]] . "</td>"; // </tr>
		  }
		else
		  {
		  echo "<td>-</td>";
		  }
	if (array_key_exists($Times[$x],$Stovers))
		  {
		  echo "<td>" . $Stovers[$Times[$x]] . "</td>"; // </tr>
		  }
		else
		  {
		  echo "<td>-</td>";
		  }
		  echo "<td>-</td>"; // Salad Bar
	if (array_key_exists($Times[$x],$Bogeys))
		  {
		  echo "<td>" . $Bogeys[$Times[$x]] . "</td>"; // </tr>
		  }
		else
		  {
		  echo "<td>-</td>";
		  }
	if (array_key_exists($Times[$x],$Bowl))
		  {
		  echo "<td>" . $Bowl[$Times[$x]] . "</td>"; // </tr>
		  }
		else
		  {
		  echo "<td>-</td>";
		  }
	if (array_key_exists($Times[$x],$Dennys))
		  {
		  echo "<td>" . $Dennys[$Times[$x]] . "</td>"; // </tr>
		  }
		else
		  {
		  echo "<td>-</td>";
		  }
	if (array_key_exists($Times[$x],$Traders))
		  {
		  echo "<td>" . $Traders[$Times[$x]] . "</td>"; // </tr>
		  }
		else
		  {
		  echo "<td>-</td>";
		  }
 	if (array_key_exists($Times[$x],$EBB1) || array_key_exists($Times[$x],$EBB2))
		  {
			  $EBBTot = $EBB1[$Times[$x]] + $EBB2[$Times[$x]];
		  	  echo "<td>" . $EBBTot . "</td>"; // </tr>
		  }
		else
		  {
		  echo "<td>-</td>";
		  }
	echo "</tr>";
}
?>
</table>
<?php
$conn->close();
//var_dump($Times);
//var_dump($Dennys);
?>