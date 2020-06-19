//
// Copyright (c) Vatsal Manot
//

import Foundation

public struct FirebaseSPM {
    public static var DatabaseType: DatabaseProtocol.Type!
    public static var DataSnapshotType: DataSnapshotProtocol.Type!
}

public protocol FirebaseAppProtocol: class {
    
}

public protocol DatabaseProtocol: class {
    static func _database() -> DatabaseProtocol
    static func _database(url: String) -> DatabaseProtocol?
    static func _database(app: FirebaseAppProtocol, url: String) -> DatabaseProtocol
    static func _database(app: FirebaseAppProtocol) -> DatabaseProtocol
    
    static func setLoggingEnabled(_ enabled: Bool)
    static func sdkVersion() -> String
    
    var _app: FirebaseAppProtocol? { get }
    var isPersistenceEnabled: Bool { get set }
    var persistenceCacheSizeBytes: UInt { get set }
    var callbackQueue: DispatchQueue { get set }
    
    func _reference() -> DatabaseReferenceProtocol
    func _reference(withPath _: String) -> DatabaseReferenceProtocol
    func _reference(fromURL _: String) -> DatabaseReferenceProtocol
    
    func purgeOutstandingWrites()
    func goOffline()
    func goOnline()
}

public protocol DatabaseReferenceProtocol: class {
    func _child(_: String) -> DatabaseReferenceProtocol
    func _observe(_: _DataEventType, with _: @escaping (DataSnapshotProtocol) -> ()) 
    func removeAllObservers()
}

public protocol DataSnapshotProtocol: class {
    var value: Any? { get }
    
    func exists() -> Bool
}

public enum _DataEventType {
    case childAdded
    case childRemoved
    case childChanged
    case childMoved
    case value
}
