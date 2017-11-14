<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Scanner extends CI_Controller {

	private $response = array();
	private $table = array(
			'name' => 'table_name',
			'field_id' => 'id_field_name',
			'field_registrasi' => 'registrasi_field_name',
			'field_istirahat' => 'istirahat_field_name',
			'field_sertifikat' => 'sertifikat_field_name',
		);

	public function __construct()
	{
		parent::__construct();
		//Do your magic here
		$this->load->model('Scanner_model', 'scanner', TRUE);
	}

	public function registrasi()
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
			$this->table['field_id'] => $id_peserta,
			$this->table['field_registrasi'] => '1',
		);
		if ($this->scanner->check_data($this->table['name'], $condition)) {
			# code...
			$this->response = [
				'sukses' => FALSE,
				'pesan' => 'Peserta sudah melakukan scan registrasi sebelumnya.',
			];

			echo json_encode($this->response);
			die();
		}

		$data_post = array($this->table['field_registrasi'] => '1');
		$condition = array($this->table['field_id'] => $id_peserta);
		if (!$this->scanner->update_data($this->table['name'], $data_post, $condition)) {
			# code...
			$this->response = [
				'sukses' => FALSE,
				'pesan' => 'Proses scan registrasi gagal, harap ulangi kembali.',
			];

			echo json_encode($this->response);
			die();
		}

		$condition = array($this->table['field_id'] => $id_peserta);
		$peserta = $this->scanner->get_data($this->table['name'], $condition)->row_array();

		$this->response = [
			'sukses' => TRUE,
			'pesan' => 'Proses scan registrasi berhasil, terimakasih.',
			'peserta' => $peserta,
		];

		echo json_encode($this->response);
	}

	public function istirahat()
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
			$this->table['field_id'] => $id_peserta,
			$this->table['field_istirahat'] => '1',
		);
		if ($this->scanner->check_data($this->table['name'], $condition)) {
			# code...
			$this->response = [
				'sukses' => FALSE,
				'pesan' => 'Peserta sudah melakukan scan istirahat sebelumnya.',
			];

			echo json_encode($this->response);
			die();
		}

		$data_post = array($this->table['field_istirahat'] => '1');
		$condition = array($this->table['field_id'] => $id_peserta);
		if (!$this->scanner->update_data($this->table['name'], $data_post, $condition)) {
			# code...
			$this->response = [
				'sukses' => FALSE,
				'pesan' => 'Proses scan istirahat gagal, harap ulangi kembali.',
			];

			echo json_encode($this->response);
			die();
		}

		$condition = array($this->table['field_id'] => $id_peserta);
		$peserta = $this->scanner->get_data($this->table['name'], $condition)->row_array();

		$this->response = [
			'sukses' => TRUE,
			'pesan' => 'Proses scan istirahat berhasil, terimakasih.',
			'peserta' => $peserta,
		];

		echo json_encode($this->response);
	}

	public function registrasi()
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
			$this->table['field_id'] => $id_peserta,
			$this->table['field_sertifikat'] => '1',
		);
		if ($this->scanner->check_data($this->table['name'], $condition)) {
			# code...
			$this->response = [
				'sukses' => FALSE,
				'pesan' => 'Peserta sudah melakukan scan sertifikat sebelumnya.',
			];

			echo json_encode($this->response);
			die();
		}

		$data_post = array($this->table['field_sertifikat'] => '1');
		$condition = array($this->table['field_id'] => $id_peserta);
		if (!$this->scanner->update_data($this->table['name'], $data_post, $condition)) {
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