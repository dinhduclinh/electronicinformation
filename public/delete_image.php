<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['image_url'])) {
    $imageUrl = $_POST['image_url'];
    $imagePath = 'D:/wampserver/www/ProjectOJT/img/' . basename($imageUrl);

    if (file_exists($imagePath)) {
        if (unlink($imagePath)) {
            echo json_encode(['success' => true]);
        } else {
            echo json_encode(['success' => false, 'error' => 'Failed to delete image']);
        }
    } else {
        echo json_encode(['success' => false, 'error' => 'Image not found']);
    }
} else {
    echo json_encode(['success' => false, 'error' => 'Invalid request']);
}
?>