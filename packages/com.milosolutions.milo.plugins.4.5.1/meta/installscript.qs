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

Component.prototype.createOperations = function()
{
    try {
        // call the base create operations function
        component.createOperations();
        
        var dirToRemove = "@TargetDir@/4.5.1";
        var sourceFile = "@TargetDir@/4.5.1/libMilo.so";
        var targetPath;
        var targetFile;

        // specify target directory and target file for Windows OS
        if (systemInfo.kernelType == "winnt") {
            targetPath = QDesktopServices.storageLocation(QDesktopServices.HomeLocation)
                + "/AppData/Local/QtProject/qtcreator/plugins/4.5.1";
            targetFile = targetPath + "/Milo.dll";

        // specify target directory and target file for Linux OS    
        } else if (systemInfo.kernelType == "linux") {
            targetPath = QDesktopServices.storageLocation(QDesktopServices.HomeLocation)
                + "/.local/share/data/QtProject/qtcreator/plugins/4.5.1";
            targetFile = targetPath + "/libMilo.so";

        // specify target directory and target file for Mac OS            
        } else if (systemInfo.kernelType == "darwin") {
            targetPath = QDesktopServices.storageLocation(QDesktopServices.HomeLocation)
                + "/Library/Application Support/QtProject/Qt Creator/plugins/4.5.1";
            targetFile = targetPath + "/libMilo.so";
        }
        
        // move library to right place
        component.addOperation("Mkdir", targetPath);
        component.addOperation("Move", sourceFile, targetFile);
        component.addOperation("Rmdir", dirToRemove);


    } catch (e) {
        console.log(e);
    }
}
