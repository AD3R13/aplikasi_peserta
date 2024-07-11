<?php
session_start();
include 'config/config.php';

// Memastikan user telah login sebelum mengakses halaman ini
if (!isset($_SESSION['nama'])) {
    header("Location:index.php?error-access-failed");
    exit();
}

// Memproses aksi tambah data jurusan
if (isset($_POST['simpan'])) {
    $nama_jurusan = $_POST['nama_jurusan'];
    $insertUser = mysqli_query($koneksi, "INSERT INTO jurusan (nama_jurusan) VALUES('$nama_jurusan')");
    if ($insertUser) {
        header("location:jurusan.php?notif=tambah-success");
    } else {
        die("Error: " . mysqli_error($koneksi));
    }
}

// Memproses aksi hapus data jurusan
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $delete = mysqli_query($koneksi, "DELETE FROM jurusan WHERE id='$id'");
    if ($delete) {
        header('location:jurusan.php?notif=delete-success');
    } else {
        die("Error: " . mysqli_error($koneksi));
    }
}

// Menyiapkan data untuk operasi edit
if (isset($_GET['edit'])) {
    $id = $_GET['edit'];
    $queryEdit = mysqli_query($koneksi, "SELECT * FROM jurusan WHERE id='$id'");
    $dataEdit = mysqli_fetch_assoc($queryEdit);
}

// Memproses aksi edit data jurusan
if (isset($_POST['edit'])) {
    $nama_jurusan = $_POST['nama_jurusan'];
    $id = $_GET['edit'];
    // Mengubah data di tabel jurusan, di mana nilai nama_jurusan diambil dari inputan nama_jurusan
    // dan nilai id jurusan diambil dari parameter edit
    $editUser = mysqli_query($koneksi, "UPDATE jurusan SET nama_jurusan= '$nama_jurusan' WHERE id = '$id' ");
    if (!$editUser) {
        die("Error: " . mysqli_error($koneksi));
    } else {
        header("location:jurusan.php?notif=edit-success");
    }
}
?>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Blank</title>

    <!-- Custom fonts for this template-->
    <link href="assets/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="assets/admin/https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this admin-->
    <link href="assets/admin/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <?php include 'inc/sidebar.php'; ?>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <?php include 'inc/navbar.php'; ?>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <?php if (isset($_GET['edit'])) { ?>

                        <h1 class="h3 mb-4 text-gray-800">Edit Jurusan</h1>
                    <?php } else { ?>


                        <div class="card-header">Tambah Jurusan</div>
                    <?php } ?>

                    <?php if (isset($_GET['edit'])) { ?>

                        <div class="card">
                            <div class="card-body">
                                <form action="tambah-jurusan.php?edit=<?php echo $dataEdit['id']; ?>" method="post">

                                    <label for="">Nama Jurusan</label>
                                    <input type="text" class="form-control" name="nama_jurusan" placeholder='Masukan nama Jurusan' value="<?php echo $dataEdit['nama_jurusan']; ?>">


                                    <input type="submit" class="btn btn-primary" name="edit" value="Simpan">
                                    <a href="jurusan.php" class="btn btn-danger">Keluar</a>

                                </form>
                            </div>
                        </div>
                    <?php } else { ?>

                        <div class="card">
                            <div class="card-body">
                                <form action="tambah-jurusan.php" method="post">

                                    <label for="">Nama Jurusan</label>
                                    <input type="text" class="form-control" name="nama_jurusan" placeholder='Masukkan nama jurusan anda...'>
                                    <br>
                                    <input type="submit" class="btn btn-primary" name="simpan" value="Simpan">
                                    <a href="jurusan.php" class="btn btn-danger">Keluar</a>

                                </form>
                            </div>
                        </div>
                    <?php } ?>
                </div>
            </div>
            <!-- /.container-fluid -->
        </div>
    </div>
    <!-- End of Main Content -->
    <!-- Footer -->
    <?php include 'inc/footer.php' ?>
    <!-- End of Footer -->
    </div>
    <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <?php include 'inc/modal_logout.php' ?>

    <!-- Bootstrap core JavaScript-->
    <script src="assets/admin/vendor/jquery/jquery.min.js"></script>
    <script src="assets/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="assets/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="assets/admin/  js/sb-admin-2.min.js"></script>

</body>

</html>