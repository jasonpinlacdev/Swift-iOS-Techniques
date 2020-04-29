import UIKit

// MARK:- STRONG, WEAK, UNOWNED DEFINITIONS

// strong reference means that the holder of the reference on an object will never release/let go of the object its refering to within its life span. the strong reference increases the arc count of the referenced object by 1.

// weak reference means that the holder is not responsible of the object they are referencing and are willing to be okay with operating on the referenced object whether its there or nil. In other words a weak reference on an object exists until there are no longer and strong references to that object. A weak reference does not increment the arc count of the object. Think optional operator ?

// unowned reference is similar to weak reference in that it does not keep a strong hold on an object its referencing. The difference however is that the holder expects the referenced object to exist and will not be de allocated or nil as it will cause a crash. Think similar to the crash operator/force unwrap !

// strong reference cycle causes a memory leak. These occur when two objects hold strong references to each other thus increasing the arc count of both objects by 1. When either objects become nil they will not de allocate because the other object still contains a strong reference to the object IE ARC count will still be 1. This means that the object in memory will persist and take up space even when the program is not using the object.


// MARK:- STRONG REFERENCE CYCLE

//class Band {
//    var singer: Singer?
//
//    init(singer: Singer? = nil) {
//        self.singer = singer
//    }
//
//    deinit {
//        print(Self.self, #function)
//    }
//
//}
//
//
//
//class Singer {
//    var name: String
//    var band: Band?
//
//    init(name: String, band: Band? = nil) {
//        self.name = name
//        self.band = band
//    }
//
//    deinit {
//        print(Self.self, #function)
//    }
//}
//
//
//var motleyCrue: Band? = Band()
//var nikkiSixx: Singer? = Singer(name: "Nikki Sixx")
//
//motleyCrue?.singer = nikkiSixx
//nikkiSixx?.band = motleyCrue
//
//motleyCrue = nil
//nikkiSixx = nil


// this is a strong reference cycle and memory leak here. As you can see when the references are set to nil for both the band and the singer the deinit method does not get invoked because each of these references hold a strong reference to the other. IE the band holds a strong reference to the singer and the singer holds a strong reference to the band. The arc count for earch of these objects will never hit 0 this these objects never get deallocated




// MARK:- PREVENTING STRONG REFERENCE CYCLE USING WEAK OR UNOWNED REFERENCE FOR ATLEAST 1 HOLDER

class Band {
    var singer: Singer?
    
    init(singer: Singer? = nil) {
        self.singer = singer
    }
    
    deinit {
        print(Self.self, #function)
    }
    
}

class Singer {
    var name: String
    weak var band: Band?
    
    init(name: String, band: Band? = nil) {
        self.name = name
        self.band = band
    }
    
    deinit {
        print(Self.self, #function)
    }
}


var motleyCrue: Band? = Band()
var nikkiSixx: Singer? = Singer(name: "Nikki Sixx")

motleyCrue?.singer = nikkiSixx
nikkiSixx?.band = motleyCrue

nikkiSixx = nil
motleyCrue = nil


