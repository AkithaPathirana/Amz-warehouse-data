<html>
 <head>
   <title>MySQL-PHP Connectivity</title>
 </head>

 <body>
   <?php

   $dbhost='localhost:3306';
   $dbuser='root';
   $dbpass='root';
   $conn=mysqli_connect($dbhost,$dbuser,$dbpass);

   if(! $conn){
     die('Connection Unsuccessful'.mysqli_connect_error());
   }
   echo 'Connection Successful';

   mysqli_close($conn);
   ?>
 </body>
 </html> 
