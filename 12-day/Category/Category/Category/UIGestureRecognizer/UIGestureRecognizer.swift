//
//  UIGestureRecognizer.swift
//  Category
//
//  Created by user on 16/5/6.
//  Copyright © 2016年 mobin. All rights reserved.
//

import UIKit
typealias MBTrailingClosure = @convention(block) () -> ()
typealias MBGestureRecognizer = @convention(block) (gestureClosure:UIGestureRecognizer)->()
private var targer_trailing_key: Void?
private var targer_gestureRecognizer_key: Void?
extension UIGestureRecognizer{

    convenience init(trailingClosure:MBTrailingClosure) {
        self.init()
        addActionClosure(trailingClosure)
        self.addTarget(self, action: #selector(invokeTrailingClosure))
    }
    private func addActionClosure(trailingClosure:MBTrailingClosure){
        let dealObject: AnyObject = unsafeBitCast(trailingClosure, AnyObject.self)
        objc_setAssociatedObject(self, &targer_trailing_key, dealObject, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
    
    
    convenience init(gestureClosure:MBGestureRecognizer) {
        self.init()
        addTargetClosure(gestureClosure)
        addTarget(self, action: #selector(invokeGestureClosure(_:)))
    }
    
    private func addTargetClosure(gestureClosure:MBGestureRecognizer){
        let dealObject: AnyObject = unsafeBitCast(gestureClosure, AnyObject.self)
        objc_setAssociatedObject(self, &targer_gestureRecognizer_key, dealObject, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
   
    
    
    @objc private func invokeTrailingClosure() {
        
        let closureObject: AnyObject  = objc_getAssociatedObject(self, &targer_trailing_key)
        let closure = unsafeBitCast(closureObject, MBTrailingClosure.self)
        closure()
    }
    
    @objc private func invokeGestureClosure(recognizer:UIGestureRecognizer){
        let closureObjct: AnyObject = objc_getAssociatedObject(self, &targer_gestureRecognizer_key)
        let closure = unsafeBitCast(closureObjct, MBGestureRecognizer.self)
        closure(gestureClosure: recognizer)
    }
    
   
}

