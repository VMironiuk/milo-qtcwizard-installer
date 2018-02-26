function Controller()
{
    installer.setDefaultPageVisible(QInstaller.StartMenuSelection, false);
    
    // Update target dir for Windows
    if (systemInfo.productType === "windows")
        installer.setValue("TargetDir", "@ApplicationsDirX86@/Milo/qtcwizard/");
}
