//
//  Notes+CoreDataProperties.swift
//  FunZone
//
//  Created by James Suresh on 2022-06-06.
//
//

import Foundation
import CoreData


extension Notes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notes> {
        return NSFetchRequest<Notes>(entityName: "Notes")
    }

    @NSManaged public var title: String?
    @NSManaged public var body: String?

}

extension Notes : Identifiable {

}
