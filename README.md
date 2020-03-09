# Patterns

## Creation Patterns
## Factory Method

What is it? 
* The factory method pattern selects an implementation class to satisfy a calling component’s request without requiring the component to know anything about the implementation classes or the way they relate to one another.

What are the benefits? 
* This pattern consolidates the logic that decides which implementation class is selected and prevents it from being diffused throughout the application. This also means that calling components rely only on the top-level protocol or base class and do not need any knowledge about the implementation classes or the process by which they are selected.

When should you use this pattern? 
* Use this pattern when you have several classes that implement a common protocol or that are derived from the same base class.

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/FactoryMethod/FactoryMethod.png)

## Abstract Factory

What is it? 
* The abstract factory pattern allows a calling component to create a group of related objects. The pattern hides the details of which classes are used to create the objects and the reason why they were selected from the calling component.

What are the benefits? 
* The calling component doesn’t know which classes are used to create the objects or why they were selected, which makes it possible to change the classes that are used without needing to change the components that consume them.

When should you use this pattern? 
* Use this pattern when you need to ensure that multiple compatible objects are used by a calling component without the component needing to know which objects are able to work together.

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/AbstractFactory/AbstractFactory.png)

## Builder

What is it? 
* The builder pattern puts the logic and default configuration values required to create an object into a builder class. This allows calling components to create objects with minimal configuration data and without needing to know the default values that will be used to create the object.

What are the benefits? 
* This pattern makes it easier to change the default configuration values used to create an object and to change the class from which instances are created.

When should you use this pattern? 
* Use this pattern when a complex configuration process is required to create an object and you don’t want the default configuration values to be disseminated throughout the application.

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Builder/Builder.png)

## Prototype

What is it? 
* The prototype pattern creates new objects by copying an existing object, known as the prototype.

What are the benefits? 
* The main benefit is to hide the code that creates objects from the components that use them; this means that components don’t need to know which class or struct is required to create a new object, don’t need to know the details of initializers, and don’t need to change when subclasses are created and instantiated. This pattern can also be used to avoid repeating expensive initialization each time a new object of a specific type is created.

When should you use this pattern? 
* This pattern is useful when you are writing a component that needs to create new instances of objects without creating a dependency on the class initializer.

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Prototype/Prototype.gif)

## Singleton

What is it? 
* The singleton pattern ensures that only one object of a given type exists in the application.

What are the benefits? 
* The singleton pattern can be used to manage objects that represent real-world resources or to encapsulate a shared resource.

When should you use this pattern? 
* The singleton pattern should be used when creating further objects doesn’t increase the number of real-world resources available or when you want to consolidate an activity such as logging.

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Singleton/Singleton.png)

## Structural Patterns
## Adapter

What is it? 
* The adapter pattern allows two components with incompatible APIs to work together by introducing an adapter that maps from one component to the other.

What are the benefits? 
* This pattern allows you to integrate components for which you cannot modify the source code into your application. This is a common problem when you use a third-party framework or when you are consuming the output from another project.

When should you use this pattern? 
* Use this pattern when you need to integrate a component that provides similar functionality to other components in the application but that uses an incompatible API to do so.

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Adapter/Adapter.png)

## Bridge
The bridge pattern is a design pattern used in software engineering that is meant to "decouple an abstraction from its implementation so that the two can vary independently", introduced by the Gang of Four.[1] The bridge uses encapsulation, aggregation, and can use inheritance to separate responsibilities into different classes.

When a class varies often, the features of object-oriented programming become very useful because changes to a program's code can be made easily with minimal prior knowledge about the program. The bridge pattern is useful when both the class and what it does vary often. The class itself can be thought of as the abstraction and what the class can do as the implementation. The bridge pattern can also be thought of as two layers of abstraction.

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Bridge/Bridge.png)

## Composite
The composite pattern allows a tree of individual objects and collections of objects to be treated consistently.
The consistency that the composite pattern brings means that components that operate on the tree structure are simpler and do not need to have knowledge of the different objects types that are in use.

Use this pattern when you have a tree structure that contains leaf nodes and collections of objects.
This pattern is applicable only to tree data structures.

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Composite/Composite.png)

## Decorator

The decorator pattern allows the behavior of individual objects to be changed without requiring changes to the classes that are used to create them or the components that consume them.

The changes in behavior defined with the decorator pattern can be combined to create complex effects without needing to create large numbers of subclasses.

Use this pattern when you need to change the behavior of objects without changing the class they are created from or the components that use them.

Don''t use this pattern when you are able to change the class that creates the objects you want to modify. It is usually simpler and easier to modify the class directly.

See also the UML class and sequence diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Decorator/Decorator.png)

## Facade

The Facade design pattern is one of the twenty-three well-known GoF design patterns that describe how to solve recurring design problems to design flexible and reusable object-oriented software, that is, objects that are easier to implement, change, test, and reuse.

What problems can the Facade design pattern solve?

* To make a complex subsystem easier to use, a simple interface should be provided for a set of interfaces in the subsystem.
* The dependencies on a subsystem should be minimized.
Clients that access a complex subsystem directly refer to (depend on) many different objects having different interfaces (tight coupling), which makes the clients hard to implement, change, test, and reuse.

What solution does the Facade design pattern describe?

Define a Facade object that:

* Implements a simple interface in terms of (by delegating to) the interfaces in the subsystem.
* May perform additional functionality before/after forwarding a request.
This enables to work through a Facade object to minimize the dependencies on a subsystem.

See also the UML class and sequence diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/Facade/facade.png)

## Behavioral Patterns
## Iterator

The Iterator design pattern is one of the twenty-three well-known GoF design patterns that describe how to solve recurring design problems to design flexible and reusable object-oriented software, that is, objects that are easier to implement, change, test, and reuse.

What problems can the Iterator design pattern solve?

* The elements of an aggregate object should be accessed and traversed without exposing its representation (data structures).
* New traversal operations should be defined for an aggregate object without changing its interface.
Defining access and traversal operations in the aggregate interface is inflexible because it commits the aggregate to particular access and traversal operations and makes it impossible to add new operations later without having to change the aggregate interface.

What solution does the Iterator design pattern describe?

* Define a separate (iterator) object that encapsulates accessing and traversing an aggregate object.
* Clients use an iterator to access and traverse an aggregate without knowing its representation (data structures).
Different iterators can be used to access and traverse an aggregate in different ways.
New access and traversal operations can be defined independently by defining new iterators.

See also the UML class and sequence diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/Iterator/Iterator.png)
