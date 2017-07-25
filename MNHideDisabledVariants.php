<?php
namespace MNHideDisabledVariants;

use Shopware\Components\Plugin\Context\ActivateContext;
use Shopware\Components\Plugin\Context\DeactivateContext;
use Shopware\Components\Plugin\Context\InstallContext;
use Shopware\Components\Plugin\Context\UpdateContext;
use Shopware\Components\Plugin\Context\UninstallContext;

class MNHideDisabledVariants extends \Shopware\Components\Plugin
{
	public function install(InstallContext $context)
    {
    }

    public function update(UpdateContext $context)
    {
    }

    public function activate(ActivateContext $context)
    {
    }

    public function deactivate(DeactivateContext $context)
    {
    }

    public function uninstall(UninstallContext $context)
    {
    }

    public static function getSubscribedEvents()
    {
        return [
            'Enlight_Controller_Action_PostDispatchSecure_Frontend_Detail' => 'onFrontendPostDispatchDetail'
        ];
    }

    public function onFrontendPostDispatchDetail(\Enlight_Controller_ActionEventArgs $args)
    {
        $HideDisabledVariants = Shopware()->Config()->getByNamespace('MNHideDisabledVariants', 'HideDisabledVariants');

        if ($HideDisabledVariants == 'true')
        {
            $this->container->get('Template')->addTemplateDir(
                $this->getPath() . '/Resources/views/'
            );
        }
    }
}
