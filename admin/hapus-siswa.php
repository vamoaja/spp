<?php 
require("../app/core/App.php");
$levelUser = $_SESSION['level'];
// ambil data petugas yg login
$officerData = $app->getOfficerInfo($_SESSION['username']);
if ($officerData['level'] == 'petugas') {
  include '../error/403.html';
  die;
}
require("../app/core/Student.php");

$student->deleteStudent($_GET);
