<?php

namespace App\Controllers;

use App\Controllers\BaseController;

class Laporan extends BaseController
{
	public function index()
	{
		return view('/petugas/laporan');
	}
	
	public function pengaduanTampil(){
			$this->tanggapan->join('pengaduan','pengaduan.id_pengaduan=tanggapan.id_pengaduan');
			$this->tanggapan->join('masyarakat','masyarakat.nik=pengaduan.nik');
			$this->tanggapan->join('petugas','petugas.id_petugas=tanggapan.id_petugas');
			$data['listPengaduan'] = 
			$this-> tanggapan ->where('tanggapan.tgl_tanggapan',$this->request->getPost('txtTglPengaduan'))->findAll();
		$arrBulan=[1=>'Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','Nopember','Desember'];
		
		$htmlData=null;
		$no=null;
		$htmlData .='<p>Berikut adalah laporan Pengaduan yang sudah selesai tanggal '.$this->request->getPost('txtTglPengaduan').' :</p>';

		$htmlData .='<table class="table table-sm">';
		$htmlData .='<thead class="bg-light">
						<tr>
						<th>No</th>
						<th>Nik</th>
						<th>Nama</th>
						<th>Petugas</th>
						<th>Tanggal Masuk</th>
						<th>Tanggal Ditanggapi</th>
						<th>Status</th>
						</tr>
					</thead>
					<tbody>';

		foreach ($data['listPengaduan'] as $row){
			$no++;
			$htmlData .='<tr>';
			$htmlData .='<td>'.$no.'</td>';
			$htmlData .='<td>'.$row['nik'].'</td>';
			$htmlData .='<td>'.$row['nama'].'</td>';
			$htmlData .='<td>'.$row['nama_petugas'].'</td>';
			$htmlData .='<td>'.$row['tgl_pengaduan'].'</td>';
			$htmlData .='<td>'.$row['tgl_tanggapan'].'</td>';
			$htmlData .='<td>'.$row['status'].'</td>';
			$htmlData .='</tr>';
		}
		$htmlData .='
					</tbody>
					</table>';

		$htmlData .='<p>
		<a href="/laporan/download-excel/'.$this->request->getPost('txtTglPengaduan').'"  </a>
		<a href="/laporan/download-pdf/'.$this->request->getPost('txtTglPengaduan').'class="btn btn-success btn-sm mr-2"> </a>
		<button href"print" onclick="window.print()" class="btn btn-warning btn-sm mr-2"<i class="fa fa-print"></i>Print</button>
		</p>';			
		echo $htmlData;	
	
	}	

}

