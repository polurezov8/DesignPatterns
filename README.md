# Patterns

## Creation Patterns
## Factory Method

The Factory Method design pattern is one of the twenty-three well-known "Gang of Four" design patterns that describe how to solve recurring design problems to design flexible and reusable object-oriented software, that is, objects that are easier to implement, change, test, and reuse.

The Factory Method design pattern solves problems like:
* How can an object be created so that subclasses can redefine which class to instantiate?
* How can a class defer instantiation to subclasses?
Creating an object directly within the class that requires (uses) the object is inflexible because it commits the class to a particular object and makes it impossible to change the instantiation independently from (without having to change) the class.

The Factory Method design pattern describes how to solve such problems:
Define a separate operation (factory method) for creating an object.
Create an object by calling a factory method.
This enables writing of subclasses to change the way an object is created (to redefine which class to instantiate).

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/FactoryMethod/FactoryMethod.png)

## Abstract Factory

The abstract factory pattern provides a way to encapsulate a group of individual factories that have a common theme without specifying their concrete classes. In normal usage, the client software creates a concrete implementation of the abstract factory and then uses the generic interface of the factory to create the concrete objects that are part of the theme. The client doesn't know (or care) which concrete objects it gets from each of these internal factories, since it uses only the generic interfaces of their products. This pattern separates the details of implementation of a set of objects from their general usage and relies on object composition, as object creation is implemented in methods exposed in the factory interface.

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/AbstractFactory/AbstractFactory.png)

## Builder

The builder pattern is a design pattern designed to provide a flexible solution to various object creation problems in object-oriented programming. The intent of the Builder design pattern is to separate the construction of a complex object from its representation.

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Builder/Builder.png)

## Prototype

* What is it?
The prototype pattern creates new objects by copying an existing object, known as the prototype.

* What are the benefits?
The main benefit is to hide the code that creates objects from the components that use them; this means that components don’t need to know which class or struct is required to create a new object, don’t need to know the details of initializers, and don’t need to change when subclasses are created and instantiated. This pattern can also be used to avoid repeating expensive initialization each time a new object of a specific type is created.

* When should you use this pattern?
This pattern is useful when you are writing a component that needs to create new instances of objects without creating a dependency on the class initializer.

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Prototype/Prototype.gif)

## Singleton

* What is it?
The singleton pattern ensures that only one object of a given type exists in the application.

* What are the benefits?
The singleton pattern can be used to manage objects that represent real-world resources or to encapsulate a shared resource.

* When should you use this pattern?
The singleton pattern should be used when creating further objects doesn’t increase the number of real-world resources available or when you want to consolidate an activity such as logging.

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Singleton/Singleton.png)

## Structural Patterns
## Adapter

The adapter design pattern is one of the twenty-three well-known GoF design patterns that describe how to solve recurring design problems to design flexible and reusable object-oriented software, that is, objects that are easier to implement, change, test, and reuse.

The adapter design pattern solves problems like:

* How can a class be reused that does not have an interface that a client requires?
* How can classes that have incompatible interfaces work together?
* How can an alternative interface be provided for a class?
Often an (already existing) class can't be reused only because its interface doesn't conform to the interface clients require.

The adapter design pattern describes how to solve such problems:

Define a separate adapter class that converts the (incompatible) interface of a class (adaptee) into another interface (target) clients require.
Work through an adapter to work with (reuse) classes that do not have the required interface.
The key idea in this pattern is to work through a separate adapter that adapts the interface of an (already existing) class without changing it.

Clients don't know whether they work with a target class directly or through an adapter with a class that does not have the target interface.

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
