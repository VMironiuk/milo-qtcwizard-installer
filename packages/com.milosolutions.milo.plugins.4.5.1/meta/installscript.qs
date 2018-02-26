function Component()
{
    // constructor
}

Component.prototype.createOperationsForArchive = function(archive)
{
    if (systemInfo.kernelType == "winnt") {
        component.addOperation("Extract", archive, windowsComponentLocation());
    } else if (systemInfo.kernelType == "linux") {
        component.addOperation("Extract", archive, linuxComponentLocation());
    } else {
        component.addOperation("Extract", archive, macComponentLocation());
    }
}

function windowsComponentLocation()
{
    return QDesktopServices.storageLocation(QDesktopServices.HomeLocation)
            + "/AppData/Local/QtProject/qtcreator/plugins";
}

function linuxComponentLocation()
{
    return QDesktopServices.storageLocation(QDesktopServices.HomeLocation)
            + "/.local/share/data/QtProject/qtcreator/plugins";
}

function macComponentLocation()
{
    return QDesktopServices.storageLocation(QDesktopServices.HomeLocation)
            + "/Library/Application Support/QtProject/Qt Creator/plugins";
}
