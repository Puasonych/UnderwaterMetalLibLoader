import MetalKit

public typealias MetalLibLoader = UnderwaterMetalLibLoader

public enum UnderwaterMetalLibLoader {
    
    public enum Error: Swift.Error {
        case cannotCreateDefaultMetalDeviceObject
        case cannotCreateTextureCache
    }
    
    public static var isInitialized = false
    public static var textureCache: CVMetalTextureCache!
    public static var mtlDevice: MTLDevice!
    public static var library: MTLLibrary!
    
    public static func setup() throws {
        guard !isInitialized else { return }
        
        guard let device = MTLCreateSystemDefaultDevice() else {
            throw Error.cannotCreateDefaultMetalDeviceObject
        }
        mtlDevice = device
        
        if CVMetalTextureCacheCreate(nil, nil, device, nil, &textureCache) != kCVReturnSuccess {
            throw Error.cannotCreateTextureCache
        }
        
        self.library = try device.makeDefaultLibrary(bundle: Bundle.module)
        isInitialized = true
    }
}
