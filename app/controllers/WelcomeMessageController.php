<?php

class WelcomeMessageController
{
    private $db;

    public function __construct($dbConnection)
    {
        $this->db = $dbConnection;
    }

    public function getWelcomeMessage()
    {
        $query = "SELECT message FROM welcome_message LIMIT 1";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        return $stmt->fetchColumn();
    }

    public function updateWelcomeMessage($message)
    {
        $query = "UPDATE welcome_message SET message = :message";
        $stmt = $this->db->prepare($query);
        $stmt->bindParam(':message', $message);
        return $stmt->execute();
    }
}