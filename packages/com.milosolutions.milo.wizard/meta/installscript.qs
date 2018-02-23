/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the FOO module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:GPL-EXCEPT$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 as published by the Free Software
** Foundation with exceptions as appearing in the file LICENSE.GPL3-EXCEPT
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

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
