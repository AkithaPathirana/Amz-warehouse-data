<html>

<body>
    <h1>
        Your Information System
    </h1>

    <?php

    $fName = $_POST["fName"];
    $lName = $_POST["lName"];
    $Address1 = $_POST["Address1"];
    $Address2 = $_POST["Address2"];
    $Address3 = $_POST["Address3"];
    $description = $_POST["description"];

    $colour = $_POST["colours"];
    $size = $_POST["size"];
    $extra = $_POST["Item"];

    echo "Thank you $fName for your perches from our web site <br><br>";
    echo "Your item colour is : $colours & T-Shirt size is : $size <br><br>";
    echo "Your selected items are : <br><br>";

    foreach ($extra as $Item) {
        echo "*Item .<br />";
    }

    echo "<br>Your itens will be sent to :<br><br>";
    echo "<i>$fName $lName,</i><br>";
    echo "<i>$Address1,</i><br>";
    echo "<i>$Address2,<br></i>";
    echo "<i>$Address3,</i><br><br>";

    echo "Thank you for submitting your comments. We appriciate it. You said <br><br>";
    echo "<i>$description</i>";


    ?>



</body>

</html>
