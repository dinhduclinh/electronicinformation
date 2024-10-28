<?php

require_once '../app/models/FooterModel.php';

class FooterController {
    private $footerModel;

    public function __construct($db) {
        $this->footerModel = new FooterModel($db);
    }

    public function getFooter() {
        return $this->footerModel->getFooterContent();
    }

    public function updateFooter($content) {
        return $this->footerModel->updateFooterContent($content);
    }
}