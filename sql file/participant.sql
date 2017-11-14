-- phpMyAdmin SQL Dump
-- version 4.0.8
-- http://www.phpmyadmin.net
--
-- Inang: localhost
-- Waktu pembuatan: 20 Jul 2017 pada 21.16
-- Versi Server: 10.1.25-MariaDB
-- Versi PHP: 5.4.45

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `ismkmi_rakernas`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `participant`
--

CREATE TABLE IF NOT EXISTS `participant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `institution` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `line_wa` varchar(50) NOT NULL,
  `r_penyakit` varchar(200) NOT NULL,
  `r_alergi` varchar(200) NOT NULL,
  `date_arrival` date NOT NULL,
  `clock_arrival` varchar(20) NOT NULL,
  `return_clock` varchar(20) NOT NULL,
  `region` int(11) NOT NULL,
  `transport_departure` varchar(50) NOT NULL,
  `st_arrival` varchar(50) NOT NULL,
  `st_return` varchar(50) NOT NULL,
  `cek_registrasi` enum('0','1') NOT NULL DEFAULT '0',
  `cek_lunch` enum('0','1') NOT NULL DEFAULT '0',
  `cek_sertifikat` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=110 ;

--
-- Dumping data untuk tabel `participant`
--

INSERT INTO `participant` (`id`, `email`, `fullname`, `institution`, `phone`, `line_wa`, `r_penyakit`, `r_alergi`, `date_arrival`, `clock_arrival`, `return_clock`, `region`, `transport_departure`, `st_arrival`, `st_return`, `cek_registrasi`, `cek_lunch`, `cek_sertifikat`) VALUES
(9, 'nnahdyatul@gmail.com', 'Nahdyatul Nur Awalia ', 'Universitas Pembangunan Nasional "Veteran" Jakarta', '08157076792', 'nahdyatulna/08157076792', 'Asma', 'Udanh', '2017-07-19', '04:45 PM', '12:00 AM', 2, 'Pesawat Terbang', 'Semarang Tawang', 'Semarang Tawang', '1', '1', '1'),
(10, 'Ismatulatifah@gmail.com', 'Ismatul Atifah', 'STIKes Surya Global Yogyakarta', '085702552341', 'ID Line=  ismatulatifah_ifa   ,  Wa=085702552341', 'Tifus', 'Nanas', '2017-07-20', '08:00 PM', '06:00 PM', 3, 'Bus', '', '', '0', '1', '0'),
(12, 'anisjasun@gmail.com', 'Anis Hartini', 'STIKes Mitra RIA Husada', '089637622792', 'nishartini / 089637622792', '-', 'alergi dingin dan debu', '2017-07-21', '06:15 AM', '01:15 PM', 2, 'Kereta Api', 'SEMARANGPONCOL', 'SEMARANGPONCOL', '0', '0', '0'),
(13, 'izzatuljannah.icha@gmail.com', 'IZZATUL JANNAH', 'STIKes Mitra RIA Husada', '089513104316', '08112224080', 'magh', 'tidak ada', '2017-07-21', '06:15 AM', '01:15 PM', 2, 'Kereta Api', 'SEMARANGPONCOL', 'SEMARANGPONCOL', '0', '0', '0'),
(14, 'ama.ismkmi@gmail.com ', 'Nadilah Salma', 'Universitas Indonesia', '081389039258', 'nadilahsalma/081389039258 ', '-', '-', '2017-07-19', '06:15 AM', '08:00 PM', 2, 'Kereta Api', 'Semarang Poncol', 'Semarang Tawang', '0', '0', '0'),
(15, 'raodatulzannah9@gmail.com', 'Juhrati Raodatul Zannah', 'Universitas Ahmad Dahlan', '085974339577', 'ratihrz / 089601772123', 'typus', 'udang', '2017-07-22', '08:00 PM', '08:00 AM', 3, 'Bus', '', '', '0', '0', '0'),
(16, 'nhadiyahharmeilianti@gmail.com', 'Nurhadiyah Harmeilianti', 'Universitas Ahmad Dahlan', '083175008265', 'nhadiyahh', '-', '-', '2017-07-22', '08:00 PM', '10:30 AM', 3, 'Bus', 'Terminal', 'Terminal', '0', '0', '0'),
(17, 'alifinsan@ymail.com', 'Alif Insan Al-Farisi', 'Universitas Diponegoro', '08988928134', 'xxxxrdfxxxx / 08988928134', '-', '-', '2017-07-21', '05:30 PM', '05:30 PM', 3, 'Pesawat Terbang', '', '', '0', '0', '0'),
(18, 'rizkiambition@gmail.com', 'RIZKI PRIHARTONO', 'STIKes Surya Mitra Husada Kediri', '081515540309', 'rizkierpe / 081515540309', 'Tidak Ada', 'Tidak Ada', '2017-07-20', '09:00 PM', '09:00 PM', 3, 'Kereta Api', 'STASIUN SEMARANG TAWANG', 'STASIUN SEMARANG TAWANG', '0', '0', '0'),
(19, 'ekahasianda@gmail.com', 'hasianda eka lestari', 'univ jember', '085288988929', 'hasiandaa/ 085288988929', '-', '-', '2017-07-22', '05:00 PM', '11:00 AM', 3, 'Kereta Api', 'poncol', 'poncol', '0', '0', '0'),
(20, 'tuhinsdm@yahoo.com', 'moh nurmaftuhin u', 'univ jember', '082232316083', '082232316083', '-', '-', '2017-07-22', '05:00 PM', '07:00 AM', 3, 'Kereta Api', 'poncol', 'poncol', '0', '0', '0'),
(21, 'uliyabilkiss@gmail.com', 'BILQIS FIKROTUL ULIYA', 'Universitas Ngudi Waluyo', '085712481772', 'uliyabilqis/085712481772', '-', 'alergi dingin', '2017-07-21', '08:00 AM', '10:15 AM', 3, 'Pesawat Terbang', '-', '-', '0', '0', '0'),
(22, 'estypratiwi22@gmail.com', 'Esty Eka Wahyu Pratiwi', 'UI', '085217441523', 'pratiwiesty/085217441523', 'Maag', '-', '2017-07-20', '09:30 AM', '10:00 AM', 1, 'Bus', '', '-', '0', '0', '0'),
(23, 'maulidakhairunnisa9@gmail.com', 'Maulida Khairunnisa', 'UIN Jakarta', '081314346706', 'mldnisa_/081314346706', 'tidak ada', 'tidak ada', '2017-07-21', '06:15 AM', '01:00 PM', 2, 'Kereta Api', 'Semarang Poncol', 'semarang poncol', '0', '0', '0'),
(24, 'Khadijahqa@gmail.com ', 'Khadijah Qurrata Ayun', 'UIN Syarif Hidayatullah Jakarta', '081291043244', 'khadijahqurrataayun', 'Maagh', 'Asma,  dingin,  debu', '2017-07-21', '06:15 AM', '01:00 PM', 2, 'Kereta Api', 'Semarang Poncol', 'Semarang Poncol', '0', '0', '0'),
(25, 'ndivadz@gmail.com', 'Nadiva Dzikriyati', 'UIN Syarif Hidayatullah Jakarta', '085939808844', '085939808844', 'Tidak ada', 'Tidak ada', '2017-07-21', '11:00 AM', '01:00 PM', 2, 'Kereta Api', 'Semarang Poncol', 'Semarang Poncol', '0', '0', '0'),
(26, 'evadwiyantilestari9@gmail.com', 'Eva Dwiyanti Lestari', 'UIN Syarif Hidayatullah Jakarta', '087882594526', '087882594526', 'Tidak ada', 'Tidak ada', '2017-07-21', '06:15 AM', '01:00 PM', 2, 'Kereta Api', 'Stasiun Semarang poncol', 'Stasiun semarang poncol', '0', '0', '0'),
(27, 'nabilaraynanda@gmail.com', 'Nabila Raynanda', 'Universitas Diponegoro ', '081226639341', 'nabilable / 081226639341', 'DBD, Flek Paru-paru ringan', 'Asap dan Debu', '2017-07-21', '06:30 PM', '06:30 PM', 3, 'Bus', '-', '-', '0', '0', '0'),
(28, 'yulisaanggara@yahoo.com', 'Yulisa Anggara Kusumaningtyas', 'STIKES BHAKTI HUSADA MULIA MADIUN', '085736536919', 'yulisaanggara / 085736536919', 'Tidak ada', 'Tidak ada', '2028-01-07', '04:00 PM', '03:00 PM', 3, 'Bus', 'Stasiun besar semarang', 'Stasiun madiun', '0', '0', '0'),
(29, 'widyasafitri0301@gmail.com', 'Widya Safitri', 'universitas jember', '089689560820', 'widyasaf01 / 089689560820', '-', '-', '2017-07-20', '05:00 PM', '07:00 AM', 3, 'Pesawat Terbang', 'poncol', 'poncol', '0', '0', '0'),
(30, 'mutialutfi7@gmail.com', 'Mutia Luthfi Nur Hanifah', 'STIKES BHAKTI HUSADA MULIA MADIUN', '0857-8596-8595', 'mutia786 / 0857-8596-8595', 'Tidak Ada', 'Tidak Ada', '2017-07-22', '04:00 AM', '03:00 PM', 3, 'Pesawat Terbang', 'Stasiun besar semarang', 'Stasiun madiun', '0', '0', '0'),
(31, 'gedeb0803@gmail.com', 'i gede bayu perdana', 'universitas respati yogyakarta', '082113848695', 'byuprdn', 'asma', 'telur', '2017-07-22', '06:30 PM', '06:30 PM', 3, 'Kereta Api', 'stasiun tawang', 'stasiun tawang', '0', '0', '0'),
(32, 'sheptika.sherly@gmail.com', 'Sheptika Sherly Yanistian', 'Universitas Muhammadiyah Surakarta', '081226843186', '@sherlyyanistian / 081226843186', '-', 'Udang, Telur', '2017-07-20', '05:00 PM', '06:45 PM', 3, 'Bus', '', '', '0', '0', '0'),
(33, 'ulyakhns9@gmail.com', 'Ulya Khoirunnisa'' atin', 'Universitas Muhammadiyah Surakarta', '082325918686', 'ulyakhoirunnisa13 / 082325918686', '-', '-', '2017-07-20', '05:00 PM', '06:45 PM', 3, 'Bus', '', '', '0', '0', '0'),
(34, 'rendihendrawan1909@gmail.com', 'Rendi Hendrawan', 'Universitas Muhammadiyah Surakarta', '082284670903', '- / 082284670903', '-', '-', '2017-07-20', '05:00 PM', '06:45 PM', 3, 'Bus', '', '', '0', '0', '0'),
(35, 'anggipag@gmail.com', 'Anggi Putri Aria Gita', 'Universitas Muhammadiyah Surakarta', '08975406464', 'anggipag / 08975406464', '-', '-', '2017-07-20', '07:00 PM', '07:00 PM', 3, 'Bus', '', '', '0', '0', '0'),
(36, 'walidahalma@gmail.com', 'Tursiti', 'Universitas Muhammadiyah Surakarta', '085742595403', '@walidahilma / 085742595403', 'Tipes', 'Saos', '2017-07-20', '05:00 PM', '06:45 PM', 3, 'Bus', '', '', '0', '0', '0'),
(37, 'irabuana96@gmail.com', 'IRABUANA', 'Fakultas Kesehatan Masyarakat Universitas Hasanudd', '085399007835', 'irabuanaa / 085399007835', 'Tidak Ada', 'Tidak Ada', '2017-07-20', '05:15 PM', '08:00 PM', 4, 'Kereta Api', 'Stasiun Semarang Tawang', '', '0', '0', '0'),
(38, 'annisacitraislami@yahoo.com', 'Annisa Citra Islami', 'Universitas Hasanuddin', '081366323444', 'annisacitrai/081366323444', 'Tipus', '-', '2017-07-20', '05:00 PM', '08:00 PM', 4, 'Kereta Api', 'SMT =Stasiun Semarang Tawang ', 'SMT =Stasiun Semarang Tawang ', '0', '0', '0'),
(39, 'leerj03@gmail.com', 'Dewi Nur Mayasari', 'Universitas Jember', '082231561761', 'leerj03/082231561761', 'Mag, gejala tipes', 'Seafood, kacang', '2017-07-20', '05:00 PM', '07:00 AM', 3, 'Kereta Api', 'Semarangponcol', 'Semarangponcol', '0', '0', '0'),
(40, 'Alfriinaaa@gmail.com', 'Alfriina Puspa Lambang', 'Universitas Negeri Semarang', '-', 'Alfriin/085640239390', '-', '-', '2021-01-07', '09:00 AM', '09:00 AM', 3, 'Bus', '-', '-', '0', '0', '0'),
(41, 'mir4janna24@gmail.com', 'MIRA JANNA', 'UNHAS', '082349499516', 'mir4jj / 082349499516', 'Tipus', '-', '2017-07-20', '05:00 PM', '08:00 PM', 4, 'Kereta Api', 'SMT = Stasiun Semarang Tawang', 'SMT = Stasiun Semarang Tawang', '0', '0', '0'),
(42, 'fildzahnisa@gmail.com', 'Annisa Fildzah Defanty', 'Universitas Jenderal Soedirman', '081210641513', 'fildzahnisa', '-', '-', '2017-07-22', '02:36 PM', '01:15 PM', 3, 'Kereta Api', 'Stasiun Semarang Poncol', 'Stasiun Semarang Poncol', '0', '0', '0'),
(45, 'hamidah@students.unnes.ac.id', 'siti khamidah ', 'unnes', '085748824014', 'sitimidah/085848824014', 'thypus', 'alergi telur', '2017-07-21', '08:30 Am', '08:30 PM', 3, 'Bus', '', '', '0', '0', '0'),
(46, 'Rafiffauzan88@gmail.com', 'Rafif Elno Fauzan', 'Unsoed', '087776462618', 'Refauzan04', 'Tidak ada', 'Tidak ada', '0000-00-00', '02:30 PM', '01:15 PM', 3, 'Kereta Api', 'Semarang poncol', 'Semarang poncol', '0', '0', '0'),
(47, 'amaliaazhari@gmail.com', 'Amalia Azhari Jannah', 'Universitas Indonesia', '087808810468', 'amaliaazhari / 087808810468', 'Maag', 'Alergi debu', '2017-07-20', '06:45 PM', '09:45 PM', 2, 'Kereta Api', 'Stasiun Semarang Poncol', 'Stasiun Semarang Poncol', '0', '0', '0'),
(48, 'zulkarnainfirst@gmail.com', 'Muhammad Athtuur Zulkarnain', 'FKM Universitas Diponegoro', '081261781811', 'zulkarnain1109/081261781811', '-', '-', '2017-07-22', '01:30 PM', '08:15 PM', 3, 'Pesawat Terbang', '', '', '0', '0', '0'),
(49, 'Nurpurwaning97@gmail.com', 'Nur Purwaning Astuti', 'Universitas Muhammadiyah Semarang', '085740129772', 'Bapaksuroso', '-', 'Dingin tanpa pelukan', '0000-00-00', '07:00 AM', '07:00 AM', 3, 'Bus', '', '', '0', '0', '0'),
(50, 'Tamaramasyita@gmail.com', 'Masyita Tamara', 'Universitas Muhammadiyah Semarang', '0895324299382', 'Rawrtamara', '-', 'Ditinggalin doi', '2017-07-21', '07:00 PM', '09:00 PM', 3, 'Pesawat Terbang', '', '', '0', '0', '0'),
(51, 'annisa.ufiana@gmail.com', 'Annisa ufiana SAR', 'Universitas airlangga', '085730059488', '085730059488', 'Tidak ada', 'Tidk ada', '0000-00-00', '09:00 PM', '09:00 PM', 3, 'Kereta Api', 'Poncol', '', '0', '0', '0'),
(52, 'idatriksh@gmail.com', 'ida tri utami', 'universitas muhammadiyah jakarta', '08999936359', 'idatriutm/08999936359', 'tifus', 'tidak ada', '2017-07-20', '10:00 PM', '05:00 PM', 2, 'Kereta Api', 'stasiun semarang tawang', 'stasiun semarang tawang', '0', '0', '0'),
(53, 'tiarapakuintan12@gmail.com', 'Tiara Pakuintan', 'Universitas Jenderal Soedirman', '082221874492', 'Pakuintan/082221874492', 'Tidak Ada', 'Tidak Ada', '2028-01-07', '02:30 PM', '06:00 PM', 3, 'Kereta Api', 'Semarang Poncol', 'Semarang Poncol', '0', '0', '0'),
(54, 'vonnymrnd@gmail.com', 'Rr. Vonny Yulia Miranda', 'unair', '082198372837', 'vonnymrnd / 082198372837', 'maag', '-', '2017-07-20', '09:15 PM', '09:15 PM', 3, 'Kereta Api', 'stasiun poncol', '', '0', '0', '0'),
(55, 'manikmarganamahendra@gmail.com ', 'Manik Marganamahendra', 'Universitas Indonesia', '087874504520 ', 'manikmarganam/087874504520', '-', '-', '2017-07-21', '06:00 AM', '09:00 PM', 2, 'Kereta Api', 'Stasiun Semarang Poncol', 'Stasiun Semarang Poncol', '0', '0', '0'),
(56, 'wywindra@yahoo.com', 'Windra yanti', 'Universitas Jambi', '082186554175', 'windraa29/ 082186554175', '-', '-', '2017-07-20', '04:15 AM', '12:00 AM', 1, 'Pesawat Terbang', '', '', '0', '0', '0'),
(57, 'anggun.irna@gmail.com', 'IRNA ANGGUN FATIQA', 'UPN Veteran Jakarta', '081288386332', 'Line: irnaanggunfatiqaa / wa: 081288386332', '-', '-', '0000-00-00', '09:30 PM', '09:15 AM', 2, 'Kereta Api', 'Semarang Tawang', 'Semarang Tawang', '0', '0', '0'),
(58, 'Bianshabri1234@gmail.com', 'Bian Shabri Putri Irwanto', 'Universitas airlangga', '082245863556', '082245863556', 'Tidak ada', 'Tidak ada', '0000-00-00', '09:15 PM', '09:15 PM', 3, 'Kereta Api', '', '', '0', '0', '0'),
(59, 'Kmindrairmawan@gmail.co.', 'I Komang Indra Irmawan', 'Universitas airlangga', '082347966875', '082247966875', 'Tidak ada', 'Tidak ada', '0000-00-00', '09:30 PM', '09:30 PM', 3, 'Kereta Api', '', '', '0', '0', '0'),
(60, 'Baharudin.wisudawan@gmail.com', 'Muhammad baharudin wisudawan putra', 'Universitas airlangga', '085606551632', '085706551632', 'Tidak ada', 'Santan', '2026-01-07', '09:30 PM', '09:30 PM', 3, 'Kereta Api', '', '', '0', '0', '0'),
(61, 'anindyapf98@gmail.com', 'Anindya Parama Frihanggrahita', 'Universitas Airlangga', '081333335477', 'anindyaapf / 081333335477', '-', '-', '2017-07-20', '12:00 AM', '12:00 AM', 3, 'Kereta Api', '', '', '0', '0', '0'),
(62, 'aurazrl@gmail.com', 'Aura Azzughro Salsabila', 'UNAIR', '081232955079', 'aurazrl', 'Asma', 'Udang, NSAID.', '2017-07-20', '', '', 3, 'Kereta Api', 'Poncol', 'Poncol', '0', '0', '0'),
(63, 'doddydefriyana@gmail.com', 'Doddy Defriyana', 'Universitas Muhammadiyah Jakarta', '082147296097', 'doddy_defriyana / 082147296097', 'Tidak Ada', 'Tidak Ada', '2017-07-20', '10:00 PM', '12:00 PM', 2, 'Kereta Api', 'Stasiun Semarang Tawang', 'Stasiun Semarang Tawang', '0', '0', '0'),
(64, 'zulfikarosd@gmail.com', 'Acmad Zulfikar Badarudin Litiloly', 'Universitas Islam Negri Syarif Hidayatullah Jakart', '081298112556', '081298112556', 'Bronkitis', '-', '2017-07-21', '04:15 PM', '01:00 PM', 2, 'Kereta Api', 'Stasiun poncol', 'Stasiun poncol', '0', '0', '0'),
(65, 'bemutufkm@gmail.com', 'Muzakir', 'Universitas Teuku Umar', '085276338432', '085276338432', 'tidak ada', 'tidak ada', '2017-07-20', '09:45 PM', '09:45 PM', 1, 'Pesawat Terbang', 'Bandar Udara Achmad Yani', 'Bandar Udara Achmad Yani', '0', '0', '0'),
(66, 'risnip23@gmail.com', 'Risni Putri Indriawati', 'STIKes indramayu', '083816777036', '083816777036', 'tidak ada', 'tidak ada', '2017-07-21', '07:30 AM', '06:45 AM', 2, 'Kereta Api', 'semarang tawang', 'semarang tawang', '0', '0', '0'),
(67, 'zahrokamilah@gmail.com', 'ZAHROTUL KAMILAH', 'Universitas Airlangga Surabaya', '081217180636', 'zahrokamilah', 'Radang Tenggorokan', 'Alergi dingin.', '2017-07-22', '12:00 AM', '03:00 PM', 3, 'Pesawat Terbang', 'Naik bus', 'Belum tau', '0', '0', '0'),
(68, 'dwiseptiana13@gmail.com', 'dwi septiana', 'universitas diponegoro', '08988029277', 'dsa2113/08988029277', '0', '0', '0000-00-00', '14.00', '14.00', 3, 'Kereta Api', 'tawang', 'poncol', '0', '0', '0'),
(69, 'wildannuraiman@gmail.com', 'Wildan nur aiman', 'Fkm undip', '085694746713', 'wildannuraiman', '-', '-', '2027-01-07', '12:30 PM', '10:30 PM', 3, 'Bus', 'Naik motor (Domisili semarang)  ', 'Naik motot (domisili semarang) ', '0', '0', '0'),
(70, 'taufiqsetiajoy@gmail.com', 'Taufiq Setiawan', 'STIkes Indonesia Maju Jakarat', '081288370095', 'setiajoy/081288370095', '-', '-', '2017-07-20', '09:52 PM', '07:30 PM', 2, 'Kereta Api', 'Stasiun Semarang Tawang', 'Stasiun Semarang Tawang', '0', '0', '0'),
(71, 'Fajarunaminnochamad@gmail.com ', 'Mochamad Fajarun Amin ', 'UIN Syarif Hidayatullah Jakarta ', '085714958475', '085714958475', 'Maagh dan asma', 'Alergi dingin', '2017-07-18', '06:15 AM', '10:30 PM', 2, 'Kereta Api', 'Semarang poncol ', '', '0', '0', '0'),
(72, 'adheyuniar99@gmail.com', 'Adhe Yuniar Batari Lipu', 'Fakultas Kesehatan Masyarakat Universitas Hasanudd', '085256474234', 'adyunn_', 'Tidak Ada', 'Tidak Ada', '2017-07-20', '05:15 PM', '08:00 PM', 4, 'Kereta Api', 'Stasiun Semarang Tawang', '', '0', '0', '0'),
(73, 'abdullatifmustofaismkmi@gmail.com', 'Abdul Latif Mustofa', 'STIKes Hang Tuah Pekanbaru', '081365772089', 'abdullatifmustofa', '-', '-', '2017-07-19', '06:15 PM', '11:15 PM', 1, 'Kereta Api', 'Stasiun Semarang Poncol', 'Stasiun Poncol', '0', '0', '0'),
(74, 'Triplebarokah@gmail.com', 'Muhammad Miftahul Mubarok', 'Universitas Mulawarman', '082148618714', '@mmiftahulm/082148618714', 'Usus buntu', 'Alergi udang galah', '0000-00-00', '02:00 PM', '10:00 AM', 2, 'Pesawat Terbang', '', '', '0', '0', '0'),
(75, 'kawidianputri_bayualam@yahoo.co.id', 'Kawidiam Putri Bayu Alam', 'Universitas DIponegoro', '085721671497', 'kawidianp / 085721671497', 'Demam', 'Tidak Ada', '2017-07-21', '12:00 AM', '05:00 PM', 3, 'Bus', 'Banyumanik', 'Banyumanik', '0', '0', '0'),
(76, 'Nurnaeni37@gmail.com', 'Tinih Nurnaeni', 'STIKes Indramayu ', '089646724356', '08980215172', '-', '-', '2017-07-21', '09:00 PM', '02:00 AM', 2, 'Kereta Api', 'Semarang tawang', 'Stasiun tawang', '0', '0', '0'),
(77, 'mudhiahrts26@gmail.com', 'Mudhiah Ratnasari Pramadi', 'UPN ''Veteran'' Jakarta', '087777567355', 'mudhiahratnasari/087777567355', '-', '-', '2017-07-20', '10:00 AM', '09:00 PM', 2, 'Bus', 'Joglosemar pemuda', 'Semarang Tawang', '0', '0', '0'),
(78, 'Ayusriw1@gmail.com', 'Ayu Sri Wahyuni', 'Stikes Jenderal Achamd Yani Cimahi', '081222731372', '081222731372', '-', '-', '2017-07-20', '01:45 PM', '05:00 PM', 2, 'Kereta Api', 'Semarang Tawang', 'Semarang Tawang', '0', '0', '0'),
(79, 'Rosdianaharyanti07@gmail.com ', 'Rosdiana Haryanti', 'Stikes Jenderal Achamd Yani Cimahi', '081910036663', '081910036663', '-', '-', '2017-07-20', '01:45 PM', '05:00 PM', 2, 'Kereta Api', 'Semarang Tawang', 'Semarang Tawang', '0', '0', '0'),
(81, 'Sari.saftari@gmail.com', 'Sari', 'Universitas Siliwangi', '081909778289', 'Saftarisari/081909778289', 'Tidak ada', 'Alergi udara', '2017-07-20', '02:30 PM', '08:30 AM', 2, 'Pesawat Terbang', 'Terminal Terboyo', 'Terminal Terboyo', '0', '0', '0'),
(82, 'Saftarisari@yahoo.co.id', 'Rani luthfiani', 'Universitas Siliwangi', '081909778289', 'Saftarisari/081909778289', 'Tidak ada', 'Tidak ada', '2017-07-20', '02:30 PM', '08:30 AM', 2, 'Bus', 'Terminal Terboyo', 'Terminal Terboyo', '0', '0', '0'),
(83, 'indranurdiyanto60@gmail.com', 'Indra Nurdiyanto', 'UNUSA', '081249322647', 'Indra-nd', '', '', '0000-00-00', '11:30 AM', '11:30 AM', 3, 'Kereta Api', '', '', '0', '0', '0'),
(84, 'anggelavetania@gmail.com', 'Anggela Vetania Fernanda ', 'UNUSA', '082245631997', 'anggelavetania', 'Maag', '', '0000-00-00', '11:45 AM', '11:45 AM', 3, 'Kereta Api', '', '', '0', '0', '0'),
(85, 'nadyalitakuna@gmail.com', 'Nadya Litakuna Karima', 'UNUSA', '082244590243', 'Nadyaalit', '', '', '0000-00-00', '11:45 AM', '11:45 AM', 3, 'Kereta Api', '', '', '0', '0', '0'),
(86, 'tetehisty@yahoo.com', 'Amanatul Istifaiyah', 'UNUSA ', '', '085643411299', '', '', '0000-00-00', '11:45 AM', '11:45 AM', 3, 'Kereta Api', '', '', '0', '0', '0'),
(87, 'milawidatul@gmail.com', 'Widatul Mila', 'Universitas Airlangga', '089644253958', 'widat_mila/ 089644253958', '-', '-', '0000-00-00', '02:30 PM', '02:30 PM', 3, 'Pesawat Terbang', '', '', '0', '0', '0'),
(89, 'paulushamba hamba ora', 'paulus mbay hamba ora', 'universitas nusa cendana', '082359542550', 'id line.paulus. WA.082359542550', 'tidak ada', 'tidak ada', '2017-07-20', '03:00 PM', '03:00 PM', 3, 'Pesawat Terbang', 'ahmad yani', 'eltari kupang', '0', '0', '0'),
(90, 'Irlanivanti16@gmail.com', 'irlan ivanti koamesah', 'Universitas Nusa Cendana', '082340755436', '082340755436', 'Lambung', 'tidak ada', '2017-07-20', '05:15 PM', '05:15 PM', 3, 'Pesawat Terbang', 'Ahmad Yani', 'Eltari kupang', '0', '0', '0'),
(91, 'triput_ri@yahoo.co.id', 'Tri Putri Nur Milati ', 'Universitas Negeri Semarang ', '085701388327', '@triputriput / 085701388327', '-', '-', '2017-07-21', '06:00 PM', '06:00 PM', 3, 'Bus', '', '', '0', '0', '0'),
(92, 'Idaratnaningsih458@gmail.com', 'Ida Ratnaningsih', 'STIKes INDRAMAYU ', '089664150648', 'Irn2409', 'Tidak ada', 'Tidak ada', '2017-07-21', '08:45 PM', '02:30 AM', 2, 'Kereta Api', 'Semarang tawang ', 'Semarang tawang ', '0', '0', '0'),
(93, 'Inifsyah@gmail.com ', 'Firmansyah Kholiq Pradana P. H. ', 'UNNES', '085877554870 ', 'Inifsyah/085877554870 ', 'Tidak ada', 'Seafood', '2017-07-21', '07:45 PM', '07:45 PM', 3, 'Bus', '', '', '0', '0', '0'),
(94, 'shafierarosnia30@gmail.com', 'Shafiera Rosnia', 'Universitas Pembangunan Nasional "Veteran" Jakarta', '087877746725', 'shafiera__ / 087877746725', 'Magh', '-', '2017-07-20', '10:00 AM', '09:00 PM', 2, 'Bus', 'Joglosemar Pemuda', 'Semarang Tawang', '0', '0', '0'),
(95, 'adeilladyah16@gmail.com', 'Adeilla Dyah Safitri', 'Universitas Negeri Semarang', '089682269297', 'dilladys/089682269297', '-', '-', '2017-07-21', '07:30 AM', '07:31 AM', 3, 'Kapal Laut', '-', '-', '0', '0', '0'),
(96, 'ningrumarys@gmail.com', 'ARY''S KUSUMAAYU PURWONINGRUM', 'UNIVERSITAS AIRLANGGA', '085648973747', 'ningrumarys / 085648973747', 'Gastritis', 'Alergi dingin, biang keringat', '2017-07-20', '05:30 PM', '11:00 AM', 3, 'Kereta Api', 'SEMARANG PONCOL', 'SEMARANG PONCOL', '0', '0', '0'),
(97, 'Maslahhatul98@gmail.com', 'Maslahhatul Wardani', 'UHAMKA', '081907513011', 'Wardanii_18', '-', '-', '2017-07-20', '10:00 AM', '10:15 AM', 2, 'Pesawat Terbang', 'Stasiun senin', 'Stasiun Tawang', '0', '0', '0'),
(98, 'Vivimagfiroh14@gmail.com', 'Vivi Magfiroh', 'Universitas Muhammadiyah Dr Prof Hamka', '081286496230', 'Vivimaghfiroh', 'Tidak ada', 'Alergi dingin', '2017-07-20', '10:00 PM', '06:30 PM', 2, 'Pesawat Terbang', 'Tawang ', 'Tawang', '0', '0', '0'),
(99, 'Shafirans21@gmail.com', 'Shafira Nurmaningsih', 'Universitas muhammadiyah Dr. Prof. hamka ', '081316604170', 'sn21_', 'Tidak ada', 'Tidak ada', '2017-07-20', '10:00 PM', '05:00 PM', 2, 'Kereta Api', 'Tawang', 'Tawang', '0', '0', '0'),
(100, 'recehbetlu@gmail.com', 'Lundu Sanada', 'UPNVJ', '082299358158', 'lunduss', '-', '-', '2017-07-20', '10:00 AM', '09:00 PM', 2, 'Bus', 'Joglosemar Pemuda', 'Semarang Tawang', '0', '0', '0'),
(101, 'widiams1405@gmail.com  widiamaika Maag Alergi dete', 'Widia Maika sari', 'Universitas Ahmad Dahlan ', '0821-4048-9982', 'widiamaika', 'Maag', 'Alergi detergen ', '2017-07-22', '10:30 PM', '10:30 PM', 3, 'Bus', 'Terminal', 'Terminal', '0', '0', '0'),
(102, 'mpendifitriani@gmail.com', 'Monicha Pendi Fitriani', 'Sekolah Tinggi Ilmu Kesehatan Indonesia Maju', '083869137145', '085695411512', '-', 'makanan laut', '2017-07-22', '09:00 PM', '12:45 AM', 2, 'Kereta Api', '', '', '0', '0', '0'),
(103, 'Nurdianty4597@gmail.com', 'Nurdianty', 'Upn veteran jakarta', '085780843042', 'nurdianty_ / 085780843042', 'Magh', '-', '2020-07-17', '06:15 AM', '09:15 PM', 2, 'Kereta Api', 'Semarang poncol', 'Semarang Tawang', '0', '0', '0'),
(104, 'agehidayatmoh@gmail.com', 'Moh. Agei Hidayat', 'Sekolah Tinggi Ilmu Kesehatan Insan Unggul Surabay', '085606212678', 'stevenagedenis/ 085606212678', '-', '-', '2017-07-20', '01:00 PM', '09:15 PM', 3, 'Kereta Api', '-', '-', '0', '0', '0'),
(105, 'muhammaddwijayanto.unimus@gmail.com', 'M.DWI JAYANTO', 'SEKOLAH TINGGI ILMU KESEHATAN HARAPAN IBU JAMBI', '081272923056', '081272923056', 'Tidak ada', 'Tidak ada', '2017-07-22', '12:45 AM', '04:45 PM', 1, 'Pesawat Terbang', 'Ahmad Yani Airport', 'Ahmad Yani Airport', '0', '0', '0'),
(106, 'rifqifauzie@hotmail.com', 'Rifqie Fauzie', 'Universitas Muhammadiyah Surakarta', '082240131109', 'Rifqie Fauzie / 082240131109', '-', '-', '2017-07-21', '06:00 AM', '10:00 PM', 3, 'Bus', '', '', '0', '0', '0'),
(107, 'manggiardi@gmail.com', 'Manggiardi Brahma Wijaya Tirta', 'Univ Dian Nuswantoro', '87747915900', '7777777', 'Tidak Ada', 'Tidak Ada', '1996-07-21', '05:00 PM', '05:00 PM', 2, 'Kereta Api', 'Tawang', 'awang', '1', '1', '1'),
(108, 'Adiputrapratama764@yahoo.com', 'Adi putra pratama', 'FKM Universitas Muslim Indonesia', '081343831823', '081343831823', '-', '-', '2017-07-20', '10:00 PM', '10:00 PM', 4, 'Pesawat Terbang', '', '', '0', '0', '0'),
(109, 'nurazizahindriani37@gmail.com', 'Nurazizah indriani ', 'UIN ALAUDDIN MAKASSAR', '085342970953', '085342970953', 'Tidak ada', 'Tidak ada', '2017-07-21', '07:00 PM', '04:45 PM', 4, 'Pesawat Terbang', '', '', '0', '0', '0');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
