<?php

//report everything, except notices.
error_reporting(E_ALL & ~E_NOTICE);
//start the session
session_start();
if (!isset($_SESSION['CREATED'])) {
    $_SESSION['CREATED'] = time();
}
// session started more than 30 minutes ago
else if (time() - $_SESSION['CREATED'] > 1800) {
    session_regenerate_id(true); // change session ID for the current session and invalidate old session ID
    $_SESSION['CREATED'] = time();
}

//Using autoloader to fetch models
spl_autoload_register(function ($class_name) {
    include $class_name . '.php';
});


// Initialize db using medoo - a PHP library for DB
//http://medoo.in/
$db = new medoo([
    'database_type' => 'mysql',
    'database_name' => 'sector',
    'server' => 'localhost',
    'username' => 'root',
    'password' => '',
    'charset' => 'utf8'
]);

/**
 * Check what should we do with the request
 *
 * @param $db
 */
function storeData($db) {
    if((isset($_POST['inputName']) && $_POST['inputName'] !== "")
        && (isset($_POST['inputSectors']) && $_POST['inputSectors'] !== "")
        && (isset($_POST['inputChecked']) && $_POST['inputChecked'] !== ""))
    {
        if(isset($_SESSION['data'])) {

            updateData($db);

        } else {

            createData($db);

        }
    }
}


/**
 * Update user or user_categories
 *
 * @param $db
 */
function updateData($db) {
    //update user
    if($_POST['inputName'] !== $_SESSION['name']) {
        if((new Category($db))->updateUserName($_SESSION['data']['user'],$_POST['inputName'])) {
            $_SESSION['name'] = $_POST['inputName'];
        }
    }
    //update user_categories
    if($_POST['inputSectors'] !== $_SESSION['sectors']) {
        //find which ID's are different
        $adding = array_diff($_POST['inputSectors'],$_SESSION['data']['categories']);
        $deleting = array_diff($_SESSION['data']['categories'],$_POST['inputSectors']);
        if(!empty($adding)) $toAdd = array_diff($adding,$_SESSION['data']['categories']);
        if(!empty($deleting)) $toDelete = array_diff($deleting,$_POST['inputSectors']);

        //there are some ID's that we have to remove
        if(!empty($toDelete)) {
            if(!(new Category($db))->deleteCategories($_SESSION['data'],$toDelete)) {
                //die(var_dump($toDelete));
                $_SESSION['data']['categories'] = array_diff($_SESSION['data']['categories'],$toDelete);
            }
        }
        //there are ID's we have to add
        if(!empty($toAdd)) {
            if((new Category($db))->insertCategories($_SESSION['data'],$toAdd)) {
                array_push($_SESSION['data']['categories'],$toAdd);
            }
        }
        //update the data we have in the session
        $_SESSION['sectors'] = $_POST['inputSectors'];
    }
}

/**
 * Creates a new record in the db and init session data
 *
 * @param $db
 */
function createData($db) {
    $success = (new Category($db))->store($_POST['inputName'], $_POST['inputSectors'], (($_POST['inputChecked'][0] === "on") ? 1 : 0));
    $_SESSION['data'] = $success;
    $_SESSION['name'] = $_POST['inputName'];
    $_SESSION['sectors'] = $_POST['inputSectors'];
    $_SESSION['checked'] = $_POST['inputChecked'];
}

/**
 * Display errors or success messages
 */
function getErrors() {
    if(isset($_POST['save']) && isset($success)) {
        if($success) {
            echo '<div class="alert alert-success" role="alert"><strong>Well done!</strong> Your data is stored.</div>';
        } else if(!$success) {
            echo '<div class="alert alert-warning" role="alert"><strong>Oops!</strong> There is an error in your form.</div>';
        }
    }
}

/**
 * Populate select with options
 *
 * @param $db
 */
function getOptions($db) {

    $cat = new Category($db);

    //parent category
    foreach($cat->getCategories(['parentID' => null, 'ORDER' => 'name']) as $parent) {

        $level = 0; //because a optgroup can't be nested, use css padding fix

        echo "<optgroup value='".$parent['ID']."' style='padding-left:". (15 * $level). "px' label='".$parent['name']."'>";

        //child category
        foreach($cat->getCategories(['parentID' => $parent['ID'], 'ORDER' => 'name']) as $child) {

            $level = 1;
            $data = $cat->getCategories(['parentID' => $child['ID'], 'ORDER' => 'name']);

            //grandchild category
            if($data) {

                echo "<optgroup value='".$child['ID']."' style='padding-left:". (15 * $level). "px'  label='".$child['name']."'>";

                foreach($data as $grandChild) {

                    //check if the option is in the session
                    echo "<option value='".$grandChild['ID']."'";
                    if(isset($_SESSION['sectors'])) {
                        if(in_array($grandChild['ID'],$_SESSION['sectors'])) {
                            echo " selected='selected'";
                        }
                    }
                    echo ">".$grandChild['name']."</option>";
                }

                echo "</optgroup>";

            } else {

                echo "<option value='".$child['ID']."'";
                if(isset($_SESSION['sectors'])) {
                    if(in_array($child['ID'],$_SESSION['sectors'])) {
                        echo " selected='selected'";
                    }
                }
                echo ">".$child['name']."</option>";
            }
        }

        echo "</optgroup>";

    }
}