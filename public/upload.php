<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_FILES['upload'])) {
        $uploadDir = 'D:/wampserver/www/ProjectOJT/img/';
        $uploadFile = $uploadDir . basename($_FILES['upload']['name']);

        if (move_uploaded_file($_FILES['upload']['tmp_name'], $uploadFile)) {
            $response = [
                'url' => 'http://localhost/ProjectOJT/img/' . basename($_FILES['upload']['name'])
            ];
            echo json_encode($response);
        } else {
            $response = [
                'error' => 'Failed to upload file.'
            ];
            echo json_encode($response);
        }
    } else {
        $response = [
            'error' => 'No file uploaded.'
        ];
        echo json_encode($response);
    }
} else {
    $response = [
        'error' => 'Invalid request method.'
    ];
    echo json_encode($response);
}
?>