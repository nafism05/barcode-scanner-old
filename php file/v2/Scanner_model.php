<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Scanner_model extends CI_Model {

	public function __construct()
	{
		parent::__construct();
		//Do your magic here
	}

	public function get_data($table, $cond = NULL, $limit = NULL, $offset = NULL) 
	{
		return $this->db->get_where($table, $cond, $limit, $offset);
	}

	public function insert_data($table = '', $data_post = array(), $escape = NULL)
	{
		$this->db->insert($table, $data_post);
		if ($this->db->affected_rows() > 0) {
			# code...
			// return $this->db->insert_id();
			return TRUE;
		} else {
			return FALSE;
		}
	}

	public function update_data($table = '', $data_post = array(), $condition = NULL, $limit = NULL)
	{
		$this->db->update($table, $data_post, $condition, $limit);
		if ($this->db->affected_rows() > 0) {
			# code...
			return TRUE;
		} else {
			return FALSE;
		}
	}

	public function check_data($table, $condition = NULL, $limit = NULL, $offset = NULL)
	{
		$data = $this->db->get_where($table, $condition, $limit, $offset);
		if ($data->num_rows() > 0) {
			# code...
			return TRUE;
		} else {
			return FALSE;
		}
	}

	public function check_data_optional($table, $optional_condition, $condition = NULL, $limit = NULL, $offset = NULL)
	{
		$this->db->where($optional_condition, NULL, FALSE);
		$data = $this->db->get_where($table, $condition, $limit, $offset);
		if ($data->num_rows() > 0) {
			# code...
			return TRUE;
		} else {
			return FALSE;
		}
	}

}

/* End of file Scanner_model.php */
/* Location: ./application/models/Scanner_model.php */