function Controller()
{
    hideUnnecessaryPages();
}

function hideUnnecessaryPages()
{
    installer.setDefaultPageVisible(QInstaller.StartMenuSelection, false);
}
