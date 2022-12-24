import CoreData
import Foundation
import Swinject
import XCTest
import TaskMan

public class IntegrationTest : XCTestCase {
    
    private var assembler: Assembler = Assembler()
    internal var Context: TaskManContext = TaskManContext(NSManagedObjectContext.ConcurrencyType.mainQueue)
    
    public override func setUp() async throws {
        
        let configuration: NSDictionary = [ "TaskManDatabasePath": "/Users/shaunmitchell/DEV/TaskMan/TaskMan.IntegrationTests/Database/TestDatabase.sqlite" ]
        
        assembler = AssemblerBuilder.Build(configuration: configuration)
        Context = getService()
        Context.deleteBackingFiles()
        
        // Perform query to initialise sqlite database
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskItem")
        _ = Context.fetchResults(request: fetchRequest)
    }
    
    internal func getService<TService>() -> TService {
        return assembler.resolver.resolve(TService.self)!
    }
    
    internal func insertAsync() async {
        await Context.perform {
            self.Context.saveChanges()
        }
    }
}

