<?php

namespace App\Actions;

use TCG\Voyager\Actions\AbstractAction;

class ChangeStatus extends AbstractAction{
	public function getTitle(){
		return 'Status';
	}

	public function getIcon(){
		return 'voyager-pen';
	}

	public function getPolicy(){
		return 'edit';
	}

	public function getAttributes(){
		return [
			'class' => 'btn btn-sm btn-export-excel pull-right',
			'style' => 'margin-right:5px',
			'id' => 'btn-editstat'
		];
	}

	public function getDefaultRoute(){
		return route('transaction.status.edit', array("id"=>$this->data->{$this->data->getKeyName()}));
	}

	public function shouldActionDisplayOnDataType(){
		return $this->dataType->slug == 'transaction';
	}
}