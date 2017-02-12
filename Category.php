<?php

/**
 * Class Category
 * Handles category db manipulation
 *
 */
class Category {

    /**
     * @var $db - medoo database object
     */
    private $db;

    /**
     * @param $db - medoo database object
     */
    public function __construct($db) {
        $this->db = $db;
    }


    /**
     * Gets all the category records
     *
     * @param null $where
     * @return
     */
    public function getCategories($where = null) {
        return $this->db->select('categories',['ID','parentID','name'],$where);
    }


    /**
     * Add the form data to db
     *
     * @param $name - user name
     * @param $categs - user selected categories
     * @param $agreed - user agreed to terms
     * @return array|bool - db data or false
     */
    public function store($name, $categs, $agreed) {
        $data = [];
        $user = $this->db->insert('users', ['name' => $name, 'agreed' => $agreed]);
        $data['user'] = $user;
        $data['categories'] = [];
        foreach($categs as $cat) {
            if(!$this->db->insert('user_categories', ['userID' => $user, 'categoryID' => $cat]))
                return false;
            array_push($data['categories'],$cat);
        }
        return $data;
    }

    /**
     * Update user name
     *
     * @param $id - id which user to update
     * @param $name - change the name to this
     * @return bool - success or fail
     */
    public function updateUserName($id, $name) {
        if($this->db->update('users',['name' => $name],['ID' => $id])) {
            return true;
        }
        return false;
    }

    /**
     * Loops through given categories and inserts them to db
     *
     * @param $data - user data
     * @param $categs - categories to add
     * @return bool
     */
    public function insertCategories($data, $categs) {
        foreach($categs as $cat) {
            if(!$this->db->insert('user_categories', ['userID' => $data['user'], 'categoryID' => $cat])) {
                return false;
            }
        }
        return true;
    }

    /**
     * Loops through given categories and deletes them from db
     *
     * @param $data - user data
     * @param $categs - categories to delete
     * @return bool
     */
    public function deleteCategories($data, $categs) {
        foreach($categs as $cat) {
            if(!$this->db->delete('user_categories', ['AND' => ['userID' => $data['user'], 'categoryID' => $cat]])) {
                return false;
            }
        }
        return true;
    }

} 