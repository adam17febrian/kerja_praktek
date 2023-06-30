<!DOCTYPE html>
<html>

<head>
    <title><?= $judul; ?></title>
    <link href="<?= base_url('assets/'); ?>css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body>
    <style type="text/css">
        .table-data {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        .table-data tr th,
        .table-data tr td {
            border: 1px solid black;
            font-size: 16pt;
            font-family: Verdana;
            padding: 10px 10px 10px 10px;
        }

        .table-data th {
            background-color: grey;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        .table tr th,
        .table tr td {
            border: 1px solid black;
            font-size: 16pt;
            font-family: Verdana;
            padding: 10px 10px 10px 10px;
        }

        .table th {
            background-color: red;
        }

        h3 {
            font-family: Verdana;
        }
    </style>
    <h3>
        <center><?= $title; ?></center>
    </h3>
    <br />
    <table class="table-data">
        <thead>
            <tr>
                <th>No</th>
                <th>Invoice</th>
                <th>Pelanggan</th>
                <th>Tanggal</th>
                <th>Bayar</th>               
                <th>Kembali</th>
                <th>Pendapatan</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $no = 1;
            $totalSum = 0; // Variabel untuk mengakumulasi nilai total
            foreach ($filterbytanggal as $f) {
            $totalSum += $f['total']; // Menambahkan nilai total ke variabel totalSum
            ?>
                <tr>
                    <th><?= $no++; ?></th>
                    <td><?= $f['invoice']; ?></td>
                    <td><?= $f['nama']; ?></td>                    
                    <td><?= $f['tanggal']; ?></td>
                    <td>Rp. <?= $f['bayar']; ?></td>
                    <td>Rp. <?= $f['kembalian']; ?></td>
                    <td>Rp. <?= $f['total']; ?></td>
                </tr>
            <?php
            }
            ?>
            <tr>
                <th colspan="6">Total Seluruh pendapatan</th>
                <td colspan="1">Rp. <?= $totalSum; ?></td> // Menampilkan jumlah total
            </tr>
        </tbody>
    </table>
</body>

</html>