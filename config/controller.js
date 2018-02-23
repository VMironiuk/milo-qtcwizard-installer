function Controller()
{
    hideUnnecessaryPages();
	
    if (systemInfo.productType === "windows")
        updateTargetDirForWindows();
}

function hideUnnecessaryPages()
{
    installer.setDefaultPageVisible(QInstaller.StartMenuSelection, false);
}

function updateTargetDirForWindows()
{
    installer.setValue("TargetDir", "@ApplicationsDirX86@/Milo/qtcwizard/");
}