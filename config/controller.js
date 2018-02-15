function Controller()
{
    hideUnnecessaryPages();
    updateDefaultLocation();
}

function hideUnnecessaryPages()
{
    installer.setDefaultPageVisible(QInstaller.TargetDirectory, false);
    installer.setDefaultPageVisible(QInstaller.StartMenuSelection, false);
}

function updateDefaultLocation()
{
    var defaultLocation = systemInfo.productType == "windows"
        ? QDesktopServices.storageLocation(QDesktopServices.HomeLocation)
            + "/AppData/Roaming/QtProject/qtcreator/templates/wizards/milo-project-templates"
        : QDesktopServices.storageLocation(QDesktopServices.HomeLocation)
            + "/.config/QtProject/qtcreator/templates/wizards/milo-project-templates";
    installer.setValue("TargetDir", defaultLocation);
}
/*
Controller.prototype.IntroductionPageCallback = function()
{
    var widget = gui.currentPageWidget();
    if (widget != null) {
        var message = "Wizard will be located in subdirectories of the following directories:"
            + "<ul>"
              + "<li>"
                + "<font size=\"+1\" face=\"Monospace\">"
                  + "$HOME/.config/QtProject/qtcreator/templates/wizards"
                + "</font> on Linux and macOS"
              + "</li>"
              + "<li>"
                + "<font size=\"+1\" face=\"Monospace\">"
                  +"%APPDATA%\\QtProject\\qtcreator\\templates\\wizards"
                +" </font> on Windows"
              + "</li>"
            + "</ul>"
            
            + "Additional plugins will be located in subdirectories of the following directories:"
            + "<ul>"
              + "<li>"
                + "<font size=\"+1\" face=\"Monospace\">"
                  + "$HOME/.local/share/data/QtProject/qtcreator/plugins"
                + "</font> on Linux"
              + "</li>"
              + "<li>"
                + "<font size=\"+1\" face=\"Monospace\">"
                  + "$HOME/Library/Application Support/QtProject/Qt Creator/plugins"
                + "</font> on macOS"
              + "</li>"
              + "<li>"
                + "<font size=\"+1\" face=\"Monospace\">"
                  +"%LOCALAPPDATA%\\QtProject\\qtcreator\\plugins"
                +" </font> on Windows"
              + "</li>"
            + "</ul>";
        widget.MessageLabel.setText(message);
    }
}
*/