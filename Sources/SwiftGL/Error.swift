//
//  OpenGLError.swift
//  SwiftGL
//
//  Created by Alsey Coleman Miller on 1/21/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import OpenGLES
#endif

/// OpenGL Errors
public enum OpenGLError: GLenum, ErrorType {
    
    case InvalidEnum        = 0x500
    
    case InvalidValue       = 0x501
    
    case InvalidOperation   = 0x502
    
    #if os(OSX)
    
    case StackOverflow      = 0x503
    
    case StackUnderflow     = 0x504
    
    #endif
    
    case OutOfMemory        = 0x505
    
    public static func currentError() throws {
        
        let rawValue = glGetError()
        
        guard rawValue != 0 else { return }
        
        throw OpenGLError(rawValue: rawValue)!
    }
}