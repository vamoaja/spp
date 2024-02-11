<?php 
require("../app/core/Class.php");

$levelUser = $_SESSION['level'];
// ambil data petugas yg login
$officerData = $app->getOfficerInfo($_SESSION['username']);
if (isset($officerData['level']) && $officerData['level'] == 'petugas') {
  // Lakukan sesuatu jika level adalah 'petugas'
  include '../error/403.html';
  die;
}

// cek status login
if (!$_SESSION['login']) {
  header("Location: ../");
}
if (isset($_POST['update'])) {
  $class->updateClass($_POST);
}

$id = $_GET['id'];

$kelas = $conn->query("SELECT * FROM kelas WHERE id_kelas = '$id'");
$dataKelas = $kelas->fetch_assoc();

?>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <!-- mycss -->
    <link rel="stylesheet" href="assets/css/style.css">

    <!-- google fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;700&display=swap" rel="stylesheet">
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- sweetalert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <title>Update kelas - Aplikasi SPP</title>
  </head>
  <body>

  <div class="preloader">
       <div class="spinner-container">
         <div class="spinner-border" role="status">
          <span class="visually-hidden">Loading...</span>
         </div>
       </div>
    </div>

  <aside class="nav flex-column" style="background-color: orange">

    <div class="header-sidebar text-center">
      <div class="title">
         <h2>Aplikasi SPP</h2>
        <h4>Prestasi Prima</h4>
      </div>
    </div>


    <a class="nav-link" href="dashboard"><i class="fa fa-qrcode me-2"></i>Dashboard</a>
    <a class="nav-link" href="pembayaran"><span><i class="fa fa-money-check-alt me-2"></i>Pembayaran</span> </a>
    <?php if ($levelUser == 'admin'): ?>
      <a class="nav-link" href="data-petugas"><span class="d-flex align-items-center"><i class="fa fa-user me-2"></i> Data petugas</span></a>
      <a class="nav-link" href="data-siswa"><span class="d-flex align-items-center"><i class="fa fa-users me-2"></i> Data siswa</span></a>
      <a class="nav-link active" href="data-kelas"><span class="d-flex align-items-center"><i class="fa fa-school me-2"></i> Data kelas</span></a>
      <a class="nav-link" href="data-spp"><span class="d-flex align-items-center"><i class="fa fa-university me-2"></i> Data SPP</span></a>
    <?php endif ?>
    <a class="nav-link" href="history-pembayaran"><span class="d-flex align-items-center"><i class="fa fa-history me-2"></i> History pembayaran</span></a>
  </aside>

  <main>

   <nav class="navbar shadow-sm">
     <span id="navbar-toggler" class="ms-2">
       <span class="fa fa-bars"></span>
     </span>

     <div class="dropdown me-2">
        <span class="dropdown-toggle" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
        <?= $officerData['username'] ?? '' ?>
        </span>

        <ul class="dropdown-menu " aria-labelledby="dropdownMenuLink">
          <li><a class="dropdown-item" href="profile.php?user=<?= $officerData['username'] ?>">Profile</a></li>
          <li><a class="dropdown-item" href="logout">Logout</a></li>
        </ul>
      </div>
   </nav>



   <section id="today-transaction" class="mx-3">
     
    <h2 class="my-3">Update data kelas</h2>
    <?php 
      if (isset($_SESSION['status'])) {
        if ($_SESSION['status'] == 'gagal diubah') {
            echo "<script>
                Swal.fire({
                  title: 'Gagal',
                  text: 'Data kelas gagal diubah',
                  icon: 'error',
                  confirmButtonColor :'#2b2f78'
                  })
                </script>";
              unset($_SESSION['status']);
          }elseif($_SESSION['status'] == 'tersedia'){
              echo "<script>
                    Swal.fire({
                      title: 'Gagal',
                      text: 'Data kelas {$_POST['nama-kelas']} sudah tersedia',
                      icon: 'warning',
                      confirmButtonColor :'#2b2f78'
                      })
                    </script>";
                unset($_SESSION['status']);
            }
      }
     ?>

    <form action="" method="post">
      <input type="hidden" value="<?= $dataKelas['nama_kelas'] ?>" name="currentClassName">

      <input type="hidden" name="id_kelas" value="<?= $dataKelas['id_kelas'] ?>">
      <label for="nama-kelas">Nama kelas</label>
      <input type="text" value="<?= $dataKelas['nama_kelas'] ?>" class="form-control mb-4 mt-2" name="nama-kelas" id="nama-kelas" required>

      <label for="komp-keahlian">Kompetensi keahlian</label>
      <select name="komp-keahlian" class="form-select mt-2 mb-3" id="komp-keahlian">
        <option selected value="<?= $dataKelas['kompetensi_keahlian'] ?>"><?= $dataKelas['kompetensi_keahlian'] ?></option>
        <option value="RPL">Rekayasa Perangkat Lunak</option>
        <option value="TKJ">Teknik Komputer Jaringan</option>
        <option value="MM">Multimedia</option>
        <option value="BC">Broadcasting</option>
      </select>

      <a href="data-kelas" class="btn btn-secondary me-3">Kembali</a>
      <button type="submit" class="btn btn-primary" name="update">Update</button>

    </form>

   </section>


  </main>


    <script src="assets/js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
  </body>
</html>