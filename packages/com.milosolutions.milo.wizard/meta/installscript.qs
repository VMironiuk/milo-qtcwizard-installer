function Component()
{
    // constructor
}

Component.prototype.isDefault = function()
{
    // select the component by default
    return true;
}

Component.prototype.createOperations = function()
{
    try {
        // Call default implementation of create operations function.
        // The default implementation calls createOperationsForArchive()
        // for all archives in this component.
        component.createOperations();
        
        // Registered custom operation.
        component.addOperation(
            "ReplaceAll",           // operation
            componentLocation(),    // target dir
            "\\",                   // before
            "\\\\",                 // after
            "*.cpp",                // name filters
            "*.h",
            "*.pro",
            "*.pri",
            "*.qml",
            "*.qrc",
            "*.md",
            "*.html",
            "*.css",
            "*.scss",
            "*.js",
            "*.xml",
            "*.txt",
            "*.doxyfile",
            "*.patch",
            "*.sh",
            "*.ini",
            "*.py",
            "*.ps1",
            "*.bat",
            "*.sample",
            "LICENSE",
            "*.example",
            "*.json"
        );
    } catch (e) {
        console.log(e);
    }
}

Component.prototype.createOperationsForArchive = function(archive)
{
    component.addOperation("Extract", archive, componentLocation());
}

function componentLocation()
{
    var defaultLocation = systemInfo.productType == "windows"
        ? QDesktopServices.storageLocation(QDesktopServices.HomeLocation)
            + "/AppData/Roaming/QtProject/qtcreator/templates/wizards/milo-project-templates"
        : QDesktopServices.storageLocation(QDesktopServices.HomeLocation)
            + "/.config/QtProject/qtcreator/templates/wizards/milo-project-templates";
    
    return defaultLocation;
}
