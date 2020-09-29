# Objective-C Property Attributes

## Strong
Strong is the newer form of retain. Till iOS 4, we were using retain in place of strong. Strong simply defines ownership of the object. Lifecycle of the object will be remain until owner itself didn’t dealloc the object. We generally use strong with the parent of objects i.e., in case of UI Elements, we use strong with UIViewController.

## Retain
Retain also owns the object property. In general scenario, retain is used when we want to remove the previous value once new setter come for the same object.

## Weak
Weak is simply a pointer and will work only if the object is being owned by some strong property. We generally use weak to avoid Retain Cycle. Retain cycle simply says that if A points to B strongly, B points to C strongly and if in any scenario C also seems to point A strongly then it will create a deadlock in between all A,B,C property. To avoid retain cycle, we generally make our either transition weak in place of strong. Weak property are generally used with IBOutlets, Delegates and other Objective-C references.

## Assign
Assign is the older version of weak attribute. Till iOS 4, we were using assign in place of weak attribute. Assign is majorly used with primitive datatypes like int, float etc.

## Atomic
Atomic property is default in case of thread safety but can be override with nonatomic. Atomic attribute defines that, property is thread safe and will always return a true value. Probability of a garbage value is very least. Since, its a thread safe attribute so it takes a large time in execution than its competitor nonatomic.

## NonAtomic
NonAtomic property is not thread safe and doesn’t guarantee a true result but it will always gives a result. Simple scenario to understand, if A is setting B as “Srijan” and C is setting B as “Kumar” then it may happen if D wants to get the value of B, it may gives a garbage result something like “Srimar” or “janKum” but nonatomic always gives the result. Since, it’s not a thread safe attribute so, it’s fast than **atomic**. For almost class objects, we use nonatomic blindly.

## ReadOnly
As the name suggests, readonly attribute enhance the interface of the property that, other objects can only able to read the property but not able to set the value of the property. We use **readonly**, where we doesn’t want to allow other class to set the value of the property.

## Read-Write
This is also a default behavioural. Once u synthesise a property it makes a getter and setter of the property.Only thing we have to write **@synthesize** in the implementation block.