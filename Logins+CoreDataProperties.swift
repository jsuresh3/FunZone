//
//  Logins+CoreDataProperties.swift
//  FunZone
//
//  Created by James Suresh on 2022-06-06.
//
//

import Foundation
import CoreData


extension Logins {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Logins> {
        return NSFetchRequest<Logins>(entityName: "Logins")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?

}

extension Logins : Identifiable {

}
