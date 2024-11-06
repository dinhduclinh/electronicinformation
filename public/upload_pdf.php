<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_FILES['upload'])) {
        $uploadDir = 'D:/wampserver/www/ProjectOJT/pdf/';
        $uploadFile = $uploadDir . basename($_FILES['upload']['name']);

        // Kiểm tra phần mở rộng của file
        $fileType = strtolower(pathinfo($uploadFile, PATHINFO_EXTENSION));
        if ($fileType == "pdf") {
            if (move_uploaded_file($_FILES['upload']['tmp_name'], $uploadFile)) {
                $response = [
                    'url' => 'http://localhost/ProjectOJT/pdf/' . basename($_FILES['upload']['name'])
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
                'error' => 'Invalid file type. Only PDF files are allowed.'
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