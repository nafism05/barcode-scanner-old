<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Scanner extends CI_Controller {

	private $response = array();
	private $table = array(
			'name' => 'participant',
			'field_id' => 'id',
			'field_registrasi' => 'cek_registrasi',
			'field_istirahat' => 'cek_lunch',
			'field_sertifikat' => 'cek_sertifikat',
		);
	private $absensi = array(
			'name' => 'absensi',
			'field_participant' => 'participant_id',
			'field_registrasi' => 'cek_registrasi',
			'field_istirahat' => 'cek_makan',
			'field_sertifikat' => 'cek_sertifikat',
			'field_sesi' => 'sesi',
			'field_date' => 'created_at',
		);

	public function __construct()
	{
		parent::__construct();
		//Do your magic here
		$this->load->model('Scanner_model', 'scanner', TRUE);
		date_default_timezone_set("Asia/Jakarta");
	}

	public function registrasi()
	{
		# code...
		$datetime = date('Y-m-d H:i:s');

		if (!$id_peserta = $this->input->post("id_peserta") OR !$sesi = $this->input->post('sesi')) {
			# code...
			$this->response = [
				'sukses' => FALSE,
				'pesan' => 'Data yang dimasukkan belum lengkap.',
			];

			echo json_encode($this->response);
			die();
		}

		$condition = array($this->table['field_id'] => $id_peserta);
		if (!$this->scanner->check_data($this->table['name'], $condition)) {
			# code...
			$this->response = [
				'sukses' => FALSE,
				'pesan' => 'Peserta tidak terdaftar.',
			];

			echo json_encode($this->response);
			die();
		}

		$condition = array(
			$this->absensi['field_participant'] => $id_peserta,
			$this->absensi['field_registrasi'] => '1',
			$this->absensi['field_sesi'] => $sesi,
		);
		$condition_date = array(
			"DATE(".$this->absensi['field_date'].")" => "DATE('".$datetime."')"
		);
		if ($this->scanner->check_data_optional($this->absensi['name'], $condition_date, $condition)) {
			# code...
			$this->response = [
				'sukses' => FALSE,
				'pesan' => 'Peserta sudah melakukan scan registrasi sebelumnya. (Sesi '.$sesi.')',
			];

			echo json_encode($this->response);
			die();
		}

		$data_post = array(
			$this->absensi['field_participant'] => $id_peserta,
			$this->absensi['field_registrasi'] => '1',
			$this->absensi['field_sesi'] => $sesi,
		);
		if (!$this->scanner->insert_data($this->absensi['name'], $data_post)) {
			# code...
			$this->response = [
				'sukses' => FALSE,
				'pesan' => 'Proses scan registrasi gagal, harap ulangi kembali. (Sesi '.$sesi.')',
			];

			echo json_encode($this->response);
			die();
		}

		$condition = array($this->table['field_id'] => $id_peserta);
		$peserta = $this->scanner->get_data($this->table['name'], $condition)->row_array();

		$this->response = [
			'sukses' => TRUE,
			'pesan' => 'Proses scan registrasi berhasil, terimakasih. (Sesi '.$sesi.')',
			'peserta' => $peserta,
		];

		echo json_encode($this->response);
	}

	public function istirahat()
	{
		# code...
		$datetime = date('Y-m-d H:i:s');

		if (!$id_peserta = $this->input->post("id_peserta") OR !$sesi = $this->input->post('sesi')) {
			# code...
			$this->response = [
				'sukses' => FALSE,
				'pesan' => 'Data yang dimasukkan belum lengkap.',
			];

			echo json_encode($this->response);
			die();
		}

		$condition = array($this->table['field_id'] => $id_peserta);
		if (!$this->scanner->check_data($this->table['name'], $condition)) {
			# code...
			$this->response = [
				'sukses' => FALSE,
				'pesan' => 'Peserta tidak terdaftar.',
			];

			echo json_encode($this->response);
			die();
		}

		$condition = array(
			$this->absensi['field_participant'] => $id_peserta,
			$this->absensi['field_istirahat'] => '1',
			$this->absensi['field_sesi'] => $sesi,
		);
		$condition_date = array(
			"DATE(".$this->absensi['field_date'].")" => "DATE('".$datetime."')"
		);
		if ($this->scanner->check_data_optional($this->absensi['name'], $condition_date, $condition)) {
			# code...
			$this->response = [
				'sukses' => FALSE,
				'pesan' => 'Peserta sudah melakukan scan istirahat sebelumnya. (Sesi '.$sesi.')',
			];

			echo json_encode($this->response);
			die();
		}

		$data_post = array(
			$this->absensi['field_participant'] => $id_peserta,
			$this->absensi['field_istirahat'] => '1',
			$this->absensi['field_sesi'] => $sesi,
		);
		if (!$this->scanner->insert_data($this->absensi['name'], $data_post)) {
			# code...
			$this->response = [
				'sukses' => FALSE,
				'pesan' => 'Proses scan istirahat gagal, harap ulangi kembali. (Sesi '.$sesi.')',
			];

			echo json_encode($this->response);
			die();
		}

		$condition = array($this->table['field_id'] => $id_peserta);
		$peserta = $this->scanner->get_data($this->table['name'], $condition)->row_array();

		$this->response = [
			'sukses' => TRUE,
			'pesan' => 'Proses scan istirahat berhasil, terimakasih. (Sesi '.$sesi.')',
			'peserta' => $peserta,
		];

		echo json_encode($this->response);
	}

	public function sertifikat()
	{
		# code...
		if (!$id_peserta = $this->input->post("id_peserta")) {
			# code...
			$this->response = [
				'sukses' => FALSE,
				'pesan' => 'Data yang dimasukkan belum lengkap.',
			];

			echo json_encode($this->response);
			die();
		}

		$condition = array($this->table['field_id'] => $id_peserta);
		if (!$this->scanner->check_data($this->table['name'], $condition)) {
			# code...
			$this->response = [
				'sukses' => FALSE,
				'pesan' => 'Peserta tidak terdaftar.',
			];

			echo json_encode($this->response);
			die();
		}

		$condition = array(
			$this->absensi['field_participant'] => $id_peserta,
			$this->absensi['field_sertifikat'] => '1',
		);
		if ($this->scanner->check_data($this->absensi['name'], $condition)) {
			# code...
			$this->response = [
				'sukses' => FALSE,
				'pesan' => 'Peserta sudah melakukan scan sertifikat sebelumnya.',
			];

			echo json_encode($this->response);
			die();
		}

		$data_post = array(
			$this->absensi['field_participant'] => $id_peserta,
			$this->absensi['field_sertifikat'] => '1',
		);
		if (!$this->scanner->insert_data($this->absensi['name'], $data_post)) {
			# code...
			$this->response = [
				'sukses' => FALSE,
				'pesan' => 'Proses scan sertifikat gagal, harap ulangi kembali.',
			];

			echo json_encode($this->response);
			die();
		}

		$condition = array($this->table['field_id'] => $id_peserta);
		$peserta = $this->scanner->get_data($this->table['name'], $condition)->row_array();

		$this->response = [
			'sukses' => TRUE,
			'pesan' => 'Proses scan sertifikat berhasil, terimakasih.',
			'peserta' => $peserta,
		];

		echo json_encode($this->response);
	}

}

/* End of file scanner.php */
/* Location: ./application/controllers/scanner.php */