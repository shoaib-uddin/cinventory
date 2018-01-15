//
//  AppModel.swift
//  cinventory
//
//  Created by Xtreme Hardware on 23/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import Foundation
import UIKit
import EVReflection

class LoggedInModel : EVObject
{
    var MembershipId: String? = ""
    var EmployeeVendorId: NSNumber!
    var UserType: NSNumber!
    var UserDisplayImage: String? = ""
    var Email: String? = ""
    var FullName: String? = ""
    var EncEmpId: NSNumber!
    var StoreId: NSNumber!
    var StoreCode: String? = ""
    var GroupId: NSNumber!
    var GroupName: String? = ""
}

public class ResponseObject: EVObject {
    
    public var Message: String!
    public var Status: NSNumber!
    public var Data: NSArray!
}

class InvListModel: EVObject
{
    var id: NSNumber?
    var vin: String? = ""
    var make: String? = ""
    var model: String? = ""
    var year: NSNumber!
    var stockNo: String? = ""
    var actualLocation: String? = ""
    var milesIn: NSNumber!
    var purchaseDate: String? = ""
    var vechicleAge: NSNumber!
    var PurchasePrice: NSNumber!
}

class InvCostModel: EVObject
{
    var id: NSNumber?
    var InvDate: String? = ""
    var ExpenseType: String? = ""
    var Vendor: String? = ""
    var VendorInvNo: String? = ""
    var RefNo: String? = ""
    var InvAmount: String? = ""
    var OneTimePay: String? = ""
    var PayAmount: String? = ""
    var PayType: String? = ""
    var PayDate: String? = ""
    var PaidBy: String? = ""
    var InvBalance: NSNumber = 0
    var InvImage: String? = ""
    var Note: String? = ""
    var Actions: String? = ""
    var Debit: NSNumber = 0
    var Credit: NSNumber = 0
    
}

class EnInventoryBasicTab: EVObject
{
    var Id: NSNumber?
    var Make: String? = ""
    var Model: String? = ""
    var Year: NSNumber!
    var Vin: String? = ""
    var StoreName: [StoreLookup] = [StoreLookup]()
    var LandingLocation: NSNumber!
    var Locations: [InventoryLandingLocations] = [InventoryLandingLocations]()
    var BuyCategory: Bool? = false
    var VehicleSourceId: NSNumber!
    var AvailablityId: NSNumber!
    var BodyTypeId: NSNumber!
    var VehicleSource: [Vendor] = [Vendor]()
    var Buyers: [Vendor] = [Vendor]()
    var KeyAvailable: Bool? = false
    var DriveAble: Bool? = false
    var OdoScale: Bool? = false
    var EmissionDone: Bool? = false
    var SunRoof: Bool? = false
    var ActualLocation: String? = ""
    var EmissionDate: String? = ""
    var IsLuxury: Bool? = false
    var BodyType:  [InventoryDropdowns]!
    var ExteriorColor: [InventoryDropdowns] = [InventoryDropdowns]()
    var RoofColor: [InventoryDropdowns] = [InventoryDropdowns]()
    var InteriorColor: [InventoryDropdowns] = [InventoryDropdowns]()
    var MilesIn: NSNumber!
    var MilesExempt: Bool? = false
    var DoorId: NSNumber!
    var Cylenders: NSNumber!
    var UniCodeId: String? = ""
    var UniCode: [InventoryDropdowns] = [InventoryDropdowns]()
    var FuelType: [InventoryDropdowns] = [InventoryDropdowns]()
    var DriveTrain: [InventoryDropdowns] = [InventoryDropdowns]()
    var Doors: [InventoryDropdowns] = [InventoryDropdowns]()
    var OemColor: String? = ""
    var AvailabilityStatus: [InventoryDropdowns] = [InventoryDropdowns]()
    var Transmission: [InventoryDropdowns] = [InventoryDropdowns]()
    var RoofDetail: [InventoryDropdowns] = [InventoryDropdowns]()
    var EmissionType: [InventoryDropdowns] = [InventoryDropdowns]()
    var EmissionStates: [InventoryDropdowns] = [InventoryDropdowns]()
    var BodyFamily: [InventoryDropdowns] = [InventoryDropdowns]()
    var BodyFamilyId: NSNumber!
    var BuyerId: NSNumber!
    var EmissionTypeId: NSNumber!
    var BuyerIsVendor: Bool? = false
    var BuyNotes: String? = ""
    var DriveTrainId: NSNumber!
    var ExteriorColorId: NSNumber!
    var FuelTypeId: NSNumber!
    var InteriorColorId: NSNumber!
    var RoofColorId: NSNumber!
    var StoreId: NSNumber!
    var RoofDetailId: NSNumber!
    var LuxuryVehicle: Bool? = false
    var TransmissionId: NSNumber!
}

class StoreLookup: EVObject
{
    var StoreId: NSNumber?
    var StoreName: String? = ""
    var StoreCode: String? = ""
    var StoreGroupId: NSNumber!
}

class InventoryLandingLocations: EVObject
{
    var Id: NSNumber?
    var InventoryId: NSNumber!
    var Code: String? = ""
    var Street: String? = ""
    var City: String? = ""
    var State: String? = ""
    var Zip: String? = ""
}


class Vendor: EVObject
{
    var Id: NSNumber?
    var StoreId: NSNumber!
    var GroupId: NSNumber!
    var StoreName: String? = ""
    var GroupName: String? = ""
    var VendorType: Bool? = false
    var VendorTypeCategory: NSNumber!
    var TaxId: String? = ""
    var WorkPhone: String? = ""
    var CellPhone: String? = ""
    var CellProvider: String? = ""
    var FaxNumber: String? = ""
    var FirstName: String? = ""
    var MiddleName: String? = ""
    var LastName: String? = ""
    var HomePhone: String? = ""
    var ContactPerson: String? = ""
    var ContactPersonPhone: String? = ""
    var Address1: String? = ""
    var Address2: String? = ""
    var City1: String? = ""
    var City2: String? = ""
    var State1: String? = ""
    var State2: String? = ""
    var Zip1: String? = ""
    var Zip2: String? = ""
    var Country1: String? = ""
    var Country2: String? = ""
    var IsPhysical: Bool? = false
    var Email: String? = ""
    var Website: String? = ""
    var EnteredBy: NSNumber!
    var EntryDate: String? = ""
    var DefaultRate: String? = ""
    var Notes: String? = ""
    var VendorLicNumber: String? = ""
    var VendorLicState: String? = ""
    var VendorLicIssueDate: String? = ""
    var VendorLicExpDate: String? = ""
    var VendorImg: String? = ""
    var SSN: String? = ""
    var DateOfBirth: String? = ""
    var VendorInternalAccountNum: String? = ""
    var VendorDrivingLicImage: String? = ""
    var Gender: String? = ""
    var PreferredContactMethod: Bool? = false
    var AssignedGroupStores: [VendorAssingedStore] = [VendorAssingedStore]()
    var MembershipUserId: String? = ""
    var AssignedVendorCategories: [NSNumber] = [NSNumber]()
    var VendorAssignedAccountsList: [VendorAssignedAccount] = [VendorAssignedAccount]()
    var HasLogin: Bool? = false
    var IsDeleted: Bool? = false
    var VendorCategory: VendorCategory!
}
class InventoryDropdowns: EVObject
{
    var Id: NSNumber?
    var Name: String? = ""
}
class VendorAssingedStore: EVObject
{
    var Emp_Ven_Assigned_Group_Store_Id: NSNumber?
    var Emp_Ven_Id: NSNumber!
    var Group_Id: NSNumber!
    var Store_Id: NSNumber!
    var StoreName: NSNumber!
    var StoreCode: NSNumber!
    var GroupName: NSNumber!
}

class VendorAssignedAccount: EVObject
{
    var Id: NSNumber?
    var VendorId: NSNumber!
    var AccountId: NSNumber!
    var VendorGroupId: NSNumber!
    var VendorStoreId: NSNumber!
    var Vendor_Credit_Limit: NSNumber!
    var PayPlanType: NSNumber!
    var AccountDisplayName: String? = ""
}
class VendorCategory: EVObject
{
    var Id: NSNumber?
    var Name: String? = ""
}















