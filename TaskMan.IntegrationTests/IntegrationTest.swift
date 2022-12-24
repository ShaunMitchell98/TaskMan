import Foundation
import Swinject
import XCTest
import TaskMan

public class IntegrationTest : XCTestCase {
    
    private var assembler: Assembler?
    internal var Context: TaskManContext?
    
    public override func setUp() async throws {
        
        let configuration: NSDictionary = [ "TaskManDatabasePath": "/Users/shaunmitchell/DEV/TaskMan/TaskMan.IntegrationTests/TestDatabase.sqlite" ]
        
        assembler = AssemblerBuilder.Build(configuration: configuration)
        Context = getService()
    }
    
    internal func getService<TService>() -> TService {
        return assembler!.resolver.resolve(TService.self)!
    }
}

