//
// Copyright (c) Vatsal Manot
//

import Foundation

public final class FirebaseSPM {
    public static let shared = FirebaseSPM()
    
    private var DatabaseType: DatabaseProtocol.Type? = nil
    private var DataSnapshotType: DataSnapshotProtocol.Type? = nil
    private var ServerValueType: ServerValueProtocol.Type? = nil
    
    public static var DatabaseType: DatabaseProtocol.Type! {
        get {
            shared.DatabaseType
        } set {
            shared.DatabaseType = newValue
        }
    }
    
    public static var DataSnapshotType: DataSnapshotProtocol.Type! {
        get {
            shared.DataSnapshotType
        } set {
            shared.DataSnapshotType = newValue
        }
    }
    
    public static var ServerValueType: ServerValueProtocol.Type! {
        get {
            shared.ServerValueType
        } set {
            shared.ServerValueType = newValue
        }
    }
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

public protocol ServerValueProtocol: class {
    static func timestamp() ->  [AnyHashable: Any]
}

public enum _DataEventType {
    case childAdded
    case childRemoved
    case childChanged
    case childMoved
    case value
}
