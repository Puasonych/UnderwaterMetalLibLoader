import XCTest
import RealityKit

@testable import UnderwaterMetalLibLoader

final class UnderwaterMetalLibLoaderTests: XCTestCase {
    
    override func tearDown() {
        super.tearDown()
        MetalLibLoader.isInitialized = false
        MetalLibLoader.textureCache = nil
        MetalLibLoader.mtlDevice = nil
        MetalLibLoader.library = nil
    }
    
    func testSetup() throws {
        XCTAssertNoThrow(try MetalLibLoader.setup())
        
        XCTAssertTrue(MetalLibLoader.isInitialized)
        XCTAssertNotNil(MetalLibLoader.textureCache)
        XCTAssertNotNil(MetalLibLoader.mtlDevice)
        XCTAssertNotNil(MetalLibLoader.library)
    }
    
    func testOctopusSurfaceShader() throws {
        XCTAssertNoThrow(try MetalLibLoader.setup())
        
        let surfaceShader = CustomMaterial.SurfaceShader(
            named: "octopusSurface",
            in: MetalLibLoader.library
        )
        
        XCTAssertNoThrow(try CustomMaterial(surfaceShader: surfaceShader, lightingModel: .clearcoat))
    }
    
    func testSeaweedGeometryShader() throws {
        XCTAssertNoThrow(try MetalLibLoader.setup())
        
        let surfaceShader = CustomMaterial.SurfaceShader(
            named: "octopusSurface",
            in: MetalLibLoader.library
        )
        let geometryShader = CustomMaterial.GeometryModifier(
            named: "seaweedGeometry",
            in: MetalLibLoader.library
        )
        
        XCTAssertNoThrow(
            try CustomMaterial(surfaceShader: surfaceShader, geometryModifier: geometryShader, lightingModel: .clearcoat)
        )
    }
}
