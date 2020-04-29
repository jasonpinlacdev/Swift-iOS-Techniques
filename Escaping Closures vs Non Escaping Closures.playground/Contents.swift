import UIKit


// when a closure is passed as a parameter to a function, that closure can be defined to behave in one of two ways

// non escaping - closure must be executed within the scope of the executing function. In other words, the program flow is not allowed to exit the scope of the function until the closure parameter has finished execution. Synchronous behavior. A closure parameter is non escaping by default

// escaping - closure will outlive the scope of the function. In other words, the program flow will exit the scope of the function before the closure parameter has finished execution. Asynchronous behavior. An escaping closure parameter must the prefixed with @escaping

func execute(action: @escaping () -> Void) {
    action()
}

// *** When a closure references any property or method of its type self must be explicitly used. This means a strong reference to self and the ARC +1 for the self object. Use capture lists to prevent strong reference cycles in closures. Also if a closure references any object that lives outside of its scope you should consider using a capture list to prevent strong reference cycles. Think how the closure is being used. Does the referenced object have a strong reference hold of the closure? If so then the closure will contain a strong reference to the outside object and vice versa thus creating the strong reference cycle.



