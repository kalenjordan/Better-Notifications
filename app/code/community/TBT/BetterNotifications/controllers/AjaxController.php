<?php

class TBT_BetterNotifications_AjaxController extends Mage_Adminhtml_Controller_Action
{
    public function markAsReadAction()
    {
        $id = $this->getRequest()->getParam('id');

        $session = Mage::getSingleton('adminhtml/session');
        $model = Mage::getModel('adminnotification/inbox')->load($id);

        $response = array();
        if (!$model->getId()) {
            $response['error'] = Mage::helper('adminnotification')->__('Unable to proceed. Please, try again.');
        }

        try {
            $model->setIsRead(1)
                ->save();
            $response['status'] = "success";            
        } 
        catch (Exception $e)
        {
            $response['error'] = $e->getMessage();
        }

        $json = Mage::helper('core')->jsonEncode($response);
        $this->getResponse()->setHeader('Content-type', 'application/json');
        $this->getResponse()->setBody($json);        

    }
}
