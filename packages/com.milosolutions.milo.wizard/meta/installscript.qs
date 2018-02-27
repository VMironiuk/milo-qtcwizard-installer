/*******************************************************************************
Copyright (C) 2017 Milo Solutions
Contact: https://www.milosolutions.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*******************************************************************************/

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
