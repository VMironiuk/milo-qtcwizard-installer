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

        if (systemInfo.kernelType == "winnt") {
            deployOnWindows();
        } else {
            deployOnNix();
        }
    } catch (e) {
        console.log(e);
    }
}

function deployOnWindows()
{
    // prepare locations
    var targetPath = QDesktopServices.storageLocation(QDesktopServices.HomeLocation)
            + "/AppData/Local/QtProject/qtcreator/plugins/4.5.0";

    var targetDllFile = QDesktopServices.storageLocation(QDesktopServices.HomeLocation)
            + "/AppData/Local/QtProject/qtcreator/plugins/4.5.0/Milo4.dll";
    var targetExpFile = QDesktopServices.storageLocation(QDesktopServices.HomeLocation)
            + "/AppData/Local/QtProject/qtcreator/plugins/4.5.0/Milo4.exp";
    var targetLibFile = QDesktopServices.storageLocation(QDesktopServices.HomeLocation)
            + "/AppData/Local/QtProject/qtcreator/plugins/4.5.0/Milo4.lib";

    var sourceDllFile = "@TargetDir@/4.5.0/Milo4.dll";
    var sourceExpFile = "@TargetDir@/4.5.0/Milo4.exp";
    var sourceLibFile = "@TargetDir@/4.5.0/Milo4.lib";

    var dirToRemove = "@TargetDir@/4.5.0";

    // do deployment
    component.addOperation("Mkdir", targetPath);
    component.addOperation("Move", sourceDllFile, targetDllFile);
    component.addOperation("Move", sourceExpFile, targetExpFile);
    component.addOperation("Move", sourceLibFile, targetLibFile);
    component.addOperation("Rmdir", dirToRemove);
}

function deployOnNix()
{
    var targetPath;

    // specify target directory for Linux OS
    if (systemInfo.kernelType == "linux") {
        targetPath = QDesktopServices.storageLocation(QDesktopServices.HomeLocation)
                + "/.local/share/data/QtProject/qtcreator/plugins/4.5.0";

    // specify target directory for Mac OS
    } else if (systemInfo.kernelType == "darwin") {
        targetPath = QDesktopServices.storageLocation(QDesktopServices.HomeLocation)
                + "/Library/Application Support/QtProject/Qt Creator/plugins/4.5.0";

    // something wrong
    } else {
        console.log("Cannot fetch correct target path.");
        return;
    }

    var dirToRemove = "@TargetDir@/4.5.0";
    var sourceFile = "@TargetDir@/4.5.0/libMilo.so";
    var targetFile = targetPath + "/libMilo.so";

    // do deployment
    component.addOperation("Mkdir", targetPath);
    component.addOperation("Move", sourceFile, targetFile);
    component.addOperation("Rmdir", dirToRemove);
}
