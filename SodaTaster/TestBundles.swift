//
//  TestBundles.swift
//  SodaTaster
//
//  Created by Roben Kleene on 1/30/19.
//  Copyright © 2019 Roben Kleene. All rights reserved.
//

import Foundation

public class TestBundles: AssetSource {
    // MARK: Public

    // Plugins
    public static let testPluginNameCat = "Cat"
    public static let testPluginCommandCat = "cat.sh"
    public static let testPluginNameHelloWorld = "HelloWorld"
    public static let testPluginNameInvalid = "Invalid"
    public static let testPluginNamePrint = "Print"
    public static let testPluginCommandPrint = "print.rb"
    public static let testPluginNameTestEnvironment = "TestEnvironment"
    public static let testPluginNameTestLog = "TestLog"
    public static let testPluginNameTestFileExtension = "FileExtension"
    public static let testPluginNameTestPromptInterrupt = "PromptInterrupt"

    // Special
    public static let testPluginNameNonexistent = "Nonexistent"

    // Metadata
    public static let testPluginFileExtension = "replabundle"

    // Collections
    public static let testPluginDirectoryNames = testPluginNames.map {
        "\($0).\(testPluginFileExtension)"
    }

    // Generic
    public static let testPluginName = testPluginNameCat
    public static let testPluginNameTwo = testPluginNamePrint
    public static let testPluginCommand = testPluginCommandCat
    public static let testPluginCommandTwo = testPluginCommandPrint
    public static let testPluginNameNoPlugin = "Not a Plugin Name"
    public static let testPluginDirectoryName = "\(testPluginName).\(testPluginFileExtension)"
    public static let testPluginDirectoryNameTwo = "\(testPluginNameTwo).\(testPluginFileExtension)"

    // MARK: Private

    static let testPluginNames = [
        testPluginNameCat,
        testPluginNameHelloWorld,
        testPluginNameInvalid,
        testPluginNamePrint,
        testPluginNameTestEnvironment,
        testPluginNameTestFileExtension,
        testPluginNameTestPromptInterrupt,
        testPluginNameTestLog
    ]
    static let rootTestBundlePluginsPathComponent = assetPathcomponent.appending("bundles")

    // Directories

    public static var testPluginsDirectoryURL: URL {
        return Bundle(for: TestBundles.self).url(forResource: rootTestBundlePluginsPathComponent,
                                                 withExtension: nil)!
    }

    public static var testPluginsDirectoryPath: String {
        return testPluginsDirectoryURL.path
    }

    // Plugins

    public class func pathForPlugin(withName name: String) -> String? {
        return urlForPlugin(withName: name)?.path
    }

    public class func urlForPlugin(withName name: String) -> URL? {
        let pluginURL = testPluginsDirectoryURL
            .appendingPathComponent(name)
            .appendingPathExtension(testPluginFileExtension)
        var isDir: ObjCBool = false

        guard
            FileManager.default.fileExists(atPath: pluginURL.path,
                                           isDirectory: &isDir),
            isDir.boolValue else {
            return nil
        }
        return pluginURL
    }

    // Helper

    private class func isTestPluginName(_ name: String) -> Bool {
        return testPluginNames.contains(name)
    }
}
