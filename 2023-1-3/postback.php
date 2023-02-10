<?php
//postback.php 
//adding the name of the file is good practice. You may need to review a hard copy of this code, so that name up there is helpful.

if (isset($POST['FirstName'])) {
    // show data
    echo $POST['FirstName'];
} else {
    //show the form
    echo '
    <form action="" method="POST">
        <p>First Name <input type="text" name="FirstName" /></p>
        <input type="submit" value="Submit Data" />
  </form>
    
    ';
}
