<?php
session_start();
include 'config/config.php';

// mencari sebuah email di dalam tabel user, jika ada dapat data
// jika tidak ada kembali ke login dengan pesan data tidak ditemukan
// $_POST[] = Variable sistem untuk mengambil nilai dari input dengan method post

if (isset($_POST['login'])) {
    $id_level = $_POST['id_level'];
    $nama = $_POST['nama'];
    $email = $_POST['email'];
    $hp = $_POST['hp'];
    $gender = $_POST['gender'];
    $alamat = $_POST['alamat'];
    $pendidikan = $_POST['pendidikan'];
    $id_jurusan = $_POST['id_jurusan'];
    $id_gelombang = $_POST['id_gelombang'];
    $tahun_pelatihan = date("Y");

    $insertPeserta = mysqli_query($koneksi, "INSERT INTO peserta (nik, nama, email, hp, gender, alamat, pendidikan, id_jurusan, id_gelombang, tahun_pelatihan) 
        VALUES ('$nik', '$nama', '$email', '$hp', '$gender', '$alamat', '$pendidikan', '$id_jurusan' '$id_gelombang', '$tahun_pelatihan')");
    if ($insertPeserta) {
        // redirect
        header("location:daftar.php?succes=daftar");
    }
}

$gelombang = mysqli_query($koneksi, "SELECT * FROM gelombang WHERE aktif = 1 ORDER BY id DESC");
$dataGelombang = mysqli_fetch_assoc($gelombang);


?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Daftar Pelatihan Gelombang 1 - PPKD Jakarta Pusat</title>

    <!-- Custom fonts for this template-->
    <link href="assets/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="assets/admin/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-5 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <?php if (isset($_GET['success'])) : ?>
                                        <div class="alert alert-success"><b>Terimakasih sudah mendaftar di PPKD JAKARTA PUSAT</b></div>
                                    <?php endif ?>
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Daftar Pelatihan - PPKD JAKARTA PUSAT</h1>
                                    </div>
                                    <form class="user" method="post">
                                        <div class="form-group">
                                            <input name="nik" type="text" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Masukkan NIK KTP Anda...">
                                        </div>
                                        <div class="form-group">
                                            <input name="nama" type="text" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Masukkan nama lengkap anda...">
                                        </div>
                                        <div class="form-group">
                                            <input name="email" type="email" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Masukkan Email Anda....">
                                        </div>
                                        <div class="form-group">
                                            <input name="hp" type="number" class="form-control" placeholder="Masukkan nomor Telepon Anda...">
                                        </div>
                                        <div class="form-group">
                                            <input name="gender" type="radio" id="exampleInput" value="Laki-Laki"> Laki-Laki
                                            <input name="gender" type="radio" id="exampleInput" value="Perempuan"> Perempuan
                                        </div>
                                        <div class="form-group">
                                            <textarea name="alamat" id="" class="form-control form-control-user" placeholder="Masukkan Alamat anda...">
                                            </textarea>
                                        </div>
                                        <div class="form-group">
                                            <input name="pendidikan" type="text" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Masukkan Pendidikan Terakhir Anda...">
                                        </div>
                                        <div class="form-group">
                                            <select name="id_jurusan" id="" class="form-control">
                                                <option value="">Pilih Jurusan</option>
                                                <?php
                                                $queryJurusan = mysqli_query($koneksi, "SELECT * FROM jurusan");
                                                ?>
                                                <?php while ($dataJurusan = mysqli_fetch_assoc(($queryJurusan))) { ?>
                                                    <option value="<?php echo $dataJurusan['id'] ?>"><?php echo $dataJurusan['nama_jurusan'] ?></option>
                                                <?php } ?>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <input type="text" readonly value="<?= $dataGelombang['nama_gelombang'] ?>" class="form-control" placeholder="Nama Gelombang">
                                            <input type="hidden" name="id_gelombang" value="<?= $dataGelombang['id'] ?>">
                                        </div>

                                        <div class="form-group">
                                            <input name="password" type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div>
                                        <button name="login" type="submit" class="btn btn-primary btn-user btn-block">
                                            Daftar
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="assets/admin/vendor/jquery/jquery.min.js"></script>
    <script src="assets/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="assets/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="assets/admin/js/sb-admin-2.min.js"></script>

</body>

</html>