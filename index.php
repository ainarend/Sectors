<?php

require_once("libs.php");

if(isset($_POST['save'])) {
    storeData($db);
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css">

    <title>Sectors</title>

</head>
<body>

<div class="container">
    <h1>Sectors</h1>

    <p>Please enter your name and pick the Sectors you are currently involved in.</p>

    <?php getErrors(); ?>

    <form method="POST" action="#">

        <div class="form-group<?php if(isset($_POST['save']) && (!isset($_POST['inputName']) || $_POST['inputName'] == "")) echo " has-warning"; ?>">
            <label for="inputName">Name:</label>
            <input type="text" class="form-control" name="inputName" id="inputName" <?php echo (isset($_SESSION['name'])? 'value="'.$_SESSION['name'].'"' : 'placeholder="Your name"'); ?> required>
        </div>

        <div class="form-group<?php if(isset($_POST['save']) && (!isset($_POST['inputSectors']) || $_POST['inputSectors'] == "")) echo " has-warning"; ?>">
            <label for="inputSectors">Sectors:</label>
            <select multiple size="5" class="form-control" name="inputSectors[]" id="inputSectors" required>
                <?php getOptions($db); ?>
            </select>
        </div>

        <div class="form-check<?php if(isset($_POST['save']) && (!isset($_POST['inputChecked']) || $_POST['inputChecked'] == "")) echo " has-warning"; ?>">
            <label class="form-check-label">
                <input type="checkbox" name="inputChecked[]" id="inputChecked" class="form-check-input" <?php echo (isset($_SESSION['checked'])? 'checked="'.$_SESSION['checked'][0].'"':''); ?> required>
                Agree to terms
            </label>
        </div>

        <input type="submit" class="btn btn-primary" value="Save" name="save" />

    </form>

</div>

<!-- jQuery first, then Tether, then Bootstrap JS. -->
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>

<script type="text/javascript">
    jQuery(function() {
        jQuery("#inputSectors").select2({
            placeholder: "Select categories"
        });
    });
</script>

</html>