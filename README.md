# Design Patterns

## Creational Patterns
### Factory Method

What is it? 
* The factory method pattern selects an implementation class to satisfy a calling component’s request without requiring the component to know anything about the implementation classes or the way they relate to one another.

What are the benefits? 
* This pattern consolidates the logic that decides which implementation class is selected and prevents it from being diffused throughout the application. This also means that calling components rely only on the top-level protocol or base class and do not need any knowledge about the implementation classes or the process by which they are selected.

When should you use this pattern? 
* Use this pattern when you have several classes that implement a common protocol or that are derived from the same base class.

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/FactoryMethod/FactoryMethod.png)

### Abstract Factory

What is it? 
* The abstract factory pattern allows a calling component to create a group of related objects. The pattern hides the details of which classes are used to create the objects and the reason why they were selected from the calling component.

What are the benefits? 
* The calling component doesn’t know which classes are used to create the objects or why they were selected, which makes it possible to change the classes that are used without needing to change the components that consume them.

When should you use this pattern? 
* Use this pattern when you need to ensure that multiple compatible objects are used by a calling component without the component needing to know which objects are able to work together.

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/AbstractFactory/AbstractFactory.png)

### Builder

What is it? 
* The builder pattern puts the logic and default configuration values required to create an object into a builder class. This allows calling components to create objects with minimal configuration data and without needing to know the default values that will be used to create the object.

What are the benefits? 
* This pattern makes it easier to change the default configuration values used to create an object and to change the class from which instances are created.

When should you use this pattern? 
* Use this pattern when a complex configuration process is required to create an object and you don’t want the default configuration values to be disseminated throughout the application.

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Builder/Builder.png)

### Prototype

What is it? 
* The prototype pattern creates new objects by copying an existing object, known as the prototype.

What are the benefits? 
* The main benefit is to hide the code that creates objects from the components that use them; this means that components don’t need to know which class or struct is required to create a new object, don’t need to know the details of initializers, and don’t need to change when subclasses are created and instantiated. This pattern can also be used to avoid repeating expensive initialization each time a new object of a specific type is created.

When should you use this pattern? 
* This pattern is useful when you are writing a component that needs to create new instances of objects without creating a dependency on the class initializer.

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Prototype/Prototype.gif)

### Singleton

What is it? 
* The singleton pattern ensures that only one object of a given type exists in the application.

What are the benefits? 
* The singleton pattern can be used to manage objects that represent real-world resources or to encapsulate a shared resource.

When should you use this pattern? 
* The singleton pattern should be used when creating further objects doesn’t increase the number of real-world resources available or when you want to consolidate an activity such as logging.

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Singleton/Singleton.png)

## Structural Patterns
### Adapter

What is it? 
* The adapter pattern allows two components with incompatible APIs to work together by introducing an adapter that maps from one component to the other.

What are the benefits? 
* This pattern allows you to integrate components for which you cannot modify the source code into your application. This is a common problem when you use a third-party framework or when you are consuming the output from another project.

When should you use this pattern? 
* Use this pattern when you need to integrate a component that provides similar functionality to other components in the application but that uses an incompatible API to do so.

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Adapter/Adapter.png)

### Bridge

What is it? 
* The bridge pattern separates an abstraction from its implementation so that either can be changed without a corresponding change in the other. 

What are the benefits? 
* When the bridge pattern is applied to the exploding class hierarchy problem, the benefit is that adding a new feature to the application requires only a single class.

When should you use this pattern? 
* Use this pattern to resolve the exploding class hierarchy problem or to bridge between one API and another.

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Bridge/Bridge.png)

### Composite

What is it? 
* The composite pattern allows a tree of individual objects and collections of objects to be treated consistently. 

What are the benefits? 
* The consistency that the composite pattern brings means that components that operate on the tree structure are simpler and do not need to have knowledge of the different objects types that are in use.

When should you use this pattern? 
* Use this pattern when you have a tree structure that contains leaf nodes and collections of objects.

See also the UML class diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Composite/Composite.png)

### Decorator

What is it? 
* The decorator pattern allows the behavior of individual objects to be changed without requiring changes to the classes that are used to create them or the components that consume them. 

What are the benefits? 
* The changes in behavior defined with the decorator pattern can be combined to create complex effects without needing to create large numbers of subclasses.

When should you use this pattern? 
* Use this pattern when you need to change the behavior of objects without changing the class they are created from or the components that use them.

See also the UML class and sequence diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Decorator/Decorator.png)

### Facade

What is it?
* The facade pattern simplifies the use of complex APIs to perform common tasks.

What are the benefits? 
* The complexity required to use an API is consolidated into a single class, which minimizes the impact of changes in the API and simplifies the components that consume the API functionality.

When should you use this pattern? 
* Use the facade pattern when you are working with classes that need to be used together but that don’t have compatible APIs.

See also the UML class and sequence diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Facade/Facade.png)

### Proxy

What is it?
* The proxy pattern defines an object—the proxy—that represents some other resource, such as another object or a remote service. Calling components operate on the proxy, which in turn operates on the underlying resource.

What are the benefits? 
* Proxies allow close control over the way that the underlying resource is accessed, which is useful when you need to intercept and adapt operations.

When should you use this pattern? 
* Proxies are used in three main situations: to define an interface to a remote resource such as a web page or RESTful service, to manage the execution of expensive operations, and to restrict access to the methods and properties of other objects.

See also the UML class and sequence diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Proxy/Proxy.png)

### Flyweight

What is it?
* The flyweight pattern shares common data objects between multiple calling components.

What are the benefits? 
* The flyweight pattern reduces the amount of memory needed to create the data objects required by the calling components and the amount of work required to create them. The impact of implementing the pattern increases with the number of calling components that share the data.

When should you use this pattern? 
* Use this pattern when you are able to identify and isolate sets of identical data objects that are used by calling components.

See also the UML class and sequence diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Flyweight/Flyweight.png)

## Behavioral patterns
### Chain Of Responsibility

What is it?
* The chain of responsibility pattern organizes sequentially a set of objects that may be able to take responsibility for a request from a calling component. The sequence of objects is referred to as a chain, and each object in the chain is asked to take responsibility for the request. The request moves along the chain until one of the objects takes responsibility or the end of the chain is reached.

What are the benefits? 
* The chain of responsibility allows objects that can process requests to be ordered into a preferential sequence that can be reordered, extended, or reduced without any impact on the calling component, which has no insight into the objects that comprise the chain.

When should you use this pattern? 
* Use this pattern when there are several objects that can handle a request, only one of which should be used.

See also the UML class and sequence diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/ChainOfResponsibility/ChainOfResponsibility.png)

### Command

What is it?
* The command pattern is used to encapsulate details of how to invoke a method on an object in a way that allows the method to be invoked at a different time or by a different component.

What are the benefits? 
* There are lots of situations in which using a command is useful, but the most common ones are supporting undo operations and creating macros.

When should you use this pattern? 
* Use this pattern when you want to allow methods to be invoked by components that otherwise have no information about the object that will be used, the method that will be invoked, or the arguments that will be provided.

See also the UML class and sequence diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Command/Command.png)

### Iterator

What is it?
* In object-oriented programming, the iterator pattern is a design pattern in which an iterator is used to traverse a container and access the container's elements. The iterator pattern decouples algorithms from containers; in some cases, algorithms are necessarily container-specific and thus cannot be decoupled.

What are the benefits? 
* Define a separate (iterator) object that encapsulates accessing and traversing an aggregate object.
* Clients use an iterator to access and traverse an aggregate without knowing its representation (data structures).

When should you use this pattern? 
* For example, the hypothetical algorithm SearchForElement can be implemented generally using a specified type of iterator rather than implementing it as a container-specific algorithm. This allows SearchForElement to be used on any container that supports the required type of iterator.

See also the UML class and sequence diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Iterator/Iterator.png)

### Mediator

What is it?
* The mediator pattern simplifies peer-to-peer communication between objects by introducing a mediator object that acts as a communications broker between the objects.

What are the benefits? 
* Instead of having to keep track of and communicate with of all of its peers individually, an object just deals with the mediator.

When should you use this pattern? 
* Use this pattern when you are dealing with a group of objects that need to communicate freely between one another.

See also the UML class and sequence diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Mediator/Mediator.png)

### Memento

What is it?
* The memento pattern captures the complete state of an object into a memento that can be used to reset the object at a later date.

What are the benefits? 
* The memento pattern allows a complete reset of an object without the need to track and apply individual undo commands.

When should you use this pattern? 
* Use this pattern when there is a “known-good” point in an object’s life that you may want to return to at some point in the future.

See also the UML class and sequence diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Memento/Memento.png)

### Observer

What is it?
* The observer pattern allows one object to register to receive notifications about changes in another object without needing to depend on the implementation of that object.

What are the benefits? 
* This pattern simplifies application design by allowing objects that provide notifications to do so in a uniform way without needing to know how those notifications are processed and acted on by the recipients.

When should you use this pattern? 
* Use this pattern whenever one object needs to receive notifications about changes in another object but where the sender of the notifications does not depend on the recipient to complete its work.

See also the UML class and sequence diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Observer/Observer.png)

### State

What is it?
* State is a behavioral design pattern that lets an object alter its behavior when its internal state changes. It appears as if the object changed its class.

What are the benefits? 
* The State pattern suggests that you create new classes for all possible states of an object and extract all state-specific behaviors into these classes. Instead of implementing all behaviors on its own, the original object, called context, stores a reference to one of the state objects that represents its current state, and delegates all the state-related work to that object.

When should you use this pattern? 
* Use this pattern to encapsulate varying behavior for the same object, based on its internal state. This can be a cleaner way for an object to change its behavior at runtime without resorting to conditional statements and thus improve maintainability.

See also the UML class and sequence diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/State/State.png)

### Strategy

What is it?
* The strategy pattern is used to create classes that can be extended without modification, through the application of algorithm objects that conform to a well-defined protocol.

What are the benefits? 
* The strategy pattern allows third-party developers to change the behavior of classes without modifying them and can allow low-cost changes to be made in projects that have expensive and lengthy validation procedures for specific classes.

When should you use this pattern? 
* Use this pattern when you need classes that can be extended without being modified.

See also the UML class and sequence diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Strategy/Strategy.png)

### Template Method

What is it?
* The template method pattern allows specific steps in an algorithm to be replaced by implementations provided by a third-party, either by specifying functions as closures or by creating a subclass.

What are the benefits?
* This pattern is useful when you are writing frameworks that you want to allow other developers to extend and customize.

When should you use this pattern? 
*  Use this pattern to selectively permit steps in any algorithm to be changed without modifying the original class.

See also the UML class and sequence diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/TemplateMethod/TemplateMethod.png)

### Visitor

What is it?
* The visitor pattern allows new algorithms to operate on collections of heterogeneous objects without needing to modify or subclass the collection class.

What are the benefits?
* The visitor pattern is useful when you want to provide collection classes as part of frameworks without requiring third-party developers to modify the source code. This pattern is also useful in projects where modifying core classes triggers expensive testing procedures.

When should you use this pattern? 
*   Use this pattern when you have classes that manage collections of mismatched objects and you want to perform operations on them.

See also the UML class and sequence diagram below.

![](https://github.com/polurezov8/Patterns/blob/master/DesignPatterns/Visitor/Visitor.png)
