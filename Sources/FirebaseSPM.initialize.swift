//
// Copyright (c) Vatsal Manot
//

#if canImport(Firebase)

import Dispatch
import Firebase
import FirebaseSPM
import Foundation

extension FirebaseSPM {
    public static func initialize() {
        DatabaseType = Database.self
        DataSnapshotType = DataSnapshot.self
    }
}

extension Database: DatabaseProtocol {
    public var _app: FirebaseAppProtocol? {
        app
    }
    
    public static func database() -> DatabaseProtocol {
        self.database() as Database
    }
    
    public static func database(url: String) -> DatabaseProtocol? {
        database(url: url) as Database
    }
    
    public static func database(app: FirebaseAppProtocol, url: String) -> DatabaseProtocol {
        database(app: app as! FirebaseApp, url: url)
    }
    
    public static func database(app: FirebaseAppProtocol) -> DatabaseProtocol {
        database(app: app as! FirebaseApp) as DatabaseProtocol
    }
    
    public func reference() -> DatabaseReferenceProtocol {
        reference() as DatabaseReference
    }
    
    public func reference(withPath path: String) -> DatabaseReferenceProtocol{
        reference(withPath: path) as DatabaseReference
    }
    
    public func reference(fromURL databaseUrl: String) -> DatabaseReferenceProtocol {
        reference(fromURL: databaseUrl) as DatabaseReference
    }
}

extension DatabaseReference: DatabaseReferenceProtocol {
    public func child(_ pathString: String) -> DatabaseReferenceProtocol {
        child(pathString) as DatabaseReference
    }
    
    public func observe(_ eventType: _DataEventType, with block: @escaping (DataSnapshotProtocol) -> ()) {
        observe(DataEventType(eventType)) {
            block($0)
        }
    }
}

extension DataSnapshot: DataSnapshotProtocol {
    
}

extension FirebaseApp: FirebaseAppProtocol {
    
}

extension DataEventType {
    public init(_ eventType: _DataEventType) {
        switch eventType {
            case .childAdded:
                self = .childAdded
            case .childRemoved:
                self = .childRemoved
            case .childChanged:
                self = .childChanged
            case .childMoved:
                self = .childMoved
            case .value:
                self = .value
        }
    }
}

#endif
