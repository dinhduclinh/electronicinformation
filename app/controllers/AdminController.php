<?php

require_once __DIR__ . '/../models/AdminModel.php';

class AdminController {
    public $model;

    public function __construct() {
        $this->model = new AdminModel();
    }

    public function handleRequest() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (isset($_POST['action'])) {
                switch ($_POST['action']) {
                    case 'add':
                        $this->addNews();
                        break;
                    case 'edit':
                        $this->editNews();
                        break;
                    case 'delete':
                        $this->deleteNews();
                        break;
                }
            }
        }
    }

    public function addNews() {
        $title = $_POST['title'];
        $slug = $this->generateSlug($title);  
        $image_url = $_POST['image_url'];
        $content = $_POST['content'];
        $category = $_POST['category'];
        $is_featured = $_POST['is_featured'] === "true" ? true : false;
        $excerpt = $_POST['excerpt'];
        $this->model->addNews($title, $slug, $image_url, $content, $category, $is_featured, $excerpt);
    }
    public function generateSlug($title) {
        $slug = strtolower($title);

        $slug = preg_replace('/(á|à|ả|ã|ạ|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ)/', 'a', $slug);
        $slug = preg_replace('/(é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ)/', 'e', $slug);
        $slug = preg_replace('/(í|ì|ỉ|ĩ|ị)/', 'i', $slug);
        $slug = preg_replace('/(ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ)/', 'o', $slug);
        $slug = preg_replace('/(ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự)/', 'u', $slug);
        $slug = preg_replace('/(ý|ỳ|ỷ|ỹ|ỵ)/', 'y', $slug);
        $slug = preg_replace('/(đ)/', 'd', $slug);

        $slug = preg_replace('/[^a-z0-9\s-]/', '', $slug);

        $slug = preg_replace('/[\s-]+/', '-', $slug);

        $slug = trim($slug, '-');

        return $slug;
    }

    public function deleteNews() {
        $id = $_POST['id'];
        $category = $_POST['category'];
        $this->model->deleteNews($id, $category);
    }

    public function editNews() {
        $id = $_POST['id'];
        $title = $_POST['title'];
        $image_url = $_POST['image_url'];
        $content = $_POST['content'];
        $category = $_POST['category'];
        $is_featured = $_POST['is_featured'] === "true" ? true : false;
        $excerpt = $_POST['excerpt'];
        $oldCategory = $_POST['oldCategory']; 
        $this->model->editNews($id, $title, $image_url, $content, $category, $is_featured, $excerpt, $oldCategory);
    }

    public function getNewsByCategory($category) {
        return $this->model->getNewsByCategory($category);
    }

    public function getNewsById($id) {
        return $this->model->getNewsById($id);
    }

    public function getAllNews() {
        return $this->model->getAllNews();
    }

    public function getAllCategories() {
        return $this->model->getAllCategories();
    }

    public function editCategory($id, $name) {
        return $this->model->editCategory($id, $name);
    }
}