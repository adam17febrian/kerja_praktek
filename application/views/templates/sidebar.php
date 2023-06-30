<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">
    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="">
        <div class="sidebar-brand-icon">
            <i class="fas fa-car"></i>
        </div>
        <div class="sidebar-brand-text mx-3">BODY REPAIR H. MAHDUM</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Beranda
    </div>

    <?php if ($this->session->userdata('role_id')  == 'Admin' && $this->session->userdata('id_user')) { ?>
        <!-- Nav Item - Dashboard -->
        <li class="nav-item <?= $this->uri->segment(1) == 'admin' ? 'active' : '' ?>">
            <a class="nav-link" href="<?= base_url('admin') ?>">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Beranda</span>
            </a>
        </li>
    <?php } ?>

    <?php if ($this->session->userdata('role_id') == 'Owner') { ?>
        <!-- Nav Item - Dashboard -->
        <li class="nav-item <?= $this->uri->segment(1) == 'owner' ? 'active' : '' ?>">
            <a class="nav-link" href="<?= base_url('owner') ?>">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Beranda</span>
            </a>
        </li>
    <?php } ?>

    <?php if ($this->session->userdata('role_id') == 'Kasir') { ?>
        <!-- Nav Item - Dashboard -->
        <li class="nav-item <?= $this->uri->segment(1) == 'kasir' ? 'active' : '' ?>">
            <a class="nav-link" href="<?= base_url('kasir') ?>">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Beranda</span>
            </a>
        </li>
    <?php } ?>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <?php if ($this->session->userdata('role_id')  == 'Admin') { ?>
        <!-- Heading -->
        <div class="sidebar-heading">
            Transaksi
        </div>
        
        <!-- Nav Item - Transaksi penjualan -->
        <li class="nav-item <?= $this->uri->segment(1) == 'transaksi' && $this->uri->segment(2) == '' ? 'active' : '' ?>">
            <a class="nav-link" href="<?= base_url('transaksi'); ?>">
                <i class="fas fa-coins"></i>
                <span>Input Order</span>
            </a>
        </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

        <div class="sidebar-heading">
            Data Master
        </div>

        <!-- Nav Item - Pelanggan -->
        <li class="nav-item <?= $this->uri->segment(1) == 'supplier' && $this->uri->segment(2) == 'pelanggan' ? 'active' : '' ?>">
            <a class="nav-link" href="<?= base_url('supplier/pelanggan'); ?>">
                <i class="fas fa-fw fa-address-book"></i>
                <span>Pelanggan</span>
            </a>
        </li>

        <!-- Nav Item - Produk -->
        <li class="nav-item <?= $this->uri->segment(1) == 'data' && $this->uri->segment(2) == '' ? 'active' : '' ?>">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-folder"></i>
                <span>Daftar</span>
            </a>
            <div id="collapseUtilities" class="collapse <?= $this->uri->segment(1) == 'data' && $this->uri->segment(2) == 'barang' ? 'active' : '' ?>" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Daftar</h6>
                    <a class="collapse-item <?= $this->uri->segment(1) == 'data' && $this->uri->segment(2) == '' ? 'active' : '' ?>" href="<?= base_url('data'); ?>">Kategori</a>
                    <a class="collapse-item <?= $this->uri->segment(1) == 'data' && $this->uri->segment(2) == 'satuan' ? 'active' : '' ?>" href="<?= base_url('data/satuan'); ?>">Satuan</a>
                    <a class="collapse-item <?= $this->uri->segment(1) == 'data' && $this->uri->segment(2) == 'barang' ? 'active' : '' ?>" href="<?= base_url('data/barang'); ?>">Perbaikan</a>
                </div>
            </div>
        </li>

    <?php } ?>

    <?php if ($this->session->userdata('role_id') == 'Owner') { ?>
        <!-- Heading -->
        <div class="sidebar-heading">
            Data Master
        </div>
        
        <!-- Nav Item - Transaksi penjualan -->
       
        <!-- Nav Item - Riwayat Transaksi -->
        <li class="nav-item <?= $this->uri->segment(1) == 'transaksi' && $this->uri->segment(2) == 'riwayat' ? 'active' : '' ?>">
            <a class="nav-link" href="<?= base_url('/transaksi/riwayat'); ?>">
                <i class="fas fa-history"></i>
                <span>Daftar Order</span>
            </a>
        </li>
        
        <!-- Divider -->
        <hr class="sidebar-divider"> 
    <?php } ?>

    <?php if ($this->session->userdata('role_id') == 'Admin') { ?>
        <!-- Divider -->
        <hr class="sidebar-divider">
    <?php } ?>


    <?php if ($this->session->userdata('role_id')  == 'Owner') { ?>
        <!-- Heading -->
        <div class="sidebar-heading">
            Laporan
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item <?= $this->uri->segment(1) == 'laporan' ? 'active' : '' ?>">
            <a class="nav-link" href="<?= base_url('/laporan'); ?>">
                <i class="fas fa-fw fa-print"></i>
                <span>Cetak Laporan</span>
            </a>
        </li>

        <!-- Heading -->
        <div class="sidebar-heading">
            SETTINGS
        </div>

        <!-- Nav Item - User Management -->
        <li class="nav-item <?= $this->uri->segment(1) == 'user' ? 'active' : '' ?>">
            <a class="nav-link" href="<?= base_url('user'); ?>">
                <i class="fas fa-users-cog"></i>
                <span>Manajemen Pengguna</span>
            </a>
        </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

        <?php } ?>
    </ul>
    <!-- End of Sidebar -->
