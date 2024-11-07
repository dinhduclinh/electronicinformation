<?php
class VoteModel {
    private $db;

    public function __construct($dbConnection) {
        $this->db = $dbConnection; 
    }

    public function getResults() {
        $query = "SELECT vo.id AS option_id, vo.option_name, COALESCE(v.vote_count, 0) AS vote_count
                  FROM vote_options vo
                  LEFT JOIN votes v ON vo.id = v.option_id";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function addVote($optionId) {
    $stmt = $this->db->prepare("INSERT INTO votes (option_id, vote_count) VALUES (:option_id, 1) ON DUPLICATE KEY UPDATE vote_count = vote_count + 1");
    $stmt->bindParam(':option_id', $optionId);
    return $stmt->execute();
}





    

}