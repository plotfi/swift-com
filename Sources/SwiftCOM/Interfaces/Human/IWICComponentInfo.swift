/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICComponentInfo: IUnknown {
  override public class var IID: IID { IID_IWICComponentInfo }

  public func GetAuthor() throws -> String? {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICComponentInfo.self, capacity: 1)

    var cchActual: UINT = UINT(0)
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetAuthor(pThis, 0, nil, &cchActual)
    guard hr == S_OK else { throw COMError(hr: hr) }

    guard cchActual > 0 else { return nil }

    let buffer: [WCHAR] =
        try Array<WCHAR>(unsafeUninitializedCapacity: Int(cchActual)) {
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetAuthor(pThis, UINT($0.count),
                                                 $0.baseAddress, &cchActual)
      guard hr == S_OK else { throw COMError(hr: hr) }
      $1 = Int(cchActual)
    }
    return String(decoding: buffer, as: UTF16.self)
  }

  public func GetCLSID() throws -> CLSID {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICComponentInfo.self, capacity: 1)

    var clsid: CLSID = CLSID()
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetCLSID(pThis, &clsid)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return clsid
  }

  public func GetComponentType() throws -> WICComponentType {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICComponentInfo.self, capacity: 1)

    var Type: WICComponentType = WICComponentType(0)
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetComponentType(pThis, &Type)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return Type
  }

  public func GetFriendlyName() throws -> String {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICComponentInfo.self, capacity: 1)

    var cchActual: UINT = UINT(0)
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetFriendlyName(pThis, 0, nil, &cchActual)
    guard hr == S_OK else { throw COMError(hr: hr) }

    let buffer: [WCHAR] =
        try Array<WCHAR>(unsafeUninitializedCapacity: Int(cchActual)) {
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetFriendlyName(pThis, UINT($0.count),
                                                       $0.baseAddress,
                                                       &cchActual)
      guard hr == S_OK else { throw COMError(hr: hr) }
      $1 = Int(cchActual)
    }
    return String(decoding: buffer, as: UTF16.self)
  }

  public func GetSigningStatus() throws -> DWORD {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICComponentInfo.self, capacity: 1)

    var Status: DWORD = DWORD(0)
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetSigningStatus(pThis, &Status)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return Status
  }

  public func GetSpecVersion() throws -> String {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICComponentInfo.self, capacity: 1)

    var cchActual: UINT = UINT(0)
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetSpecVersion(pThis, 0, nil, &cchActual)
    guard hr == S_OK else { throw COMError(hr: hr) }

    let buffer: [WCHAR] =
        try Array<WCHAR>(unsafeUninitializedCapacity: Int(cchActual)) {
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetSpecVersion(pThis, UINT($0.count),
                                                      $0.baseAddress, &cchActual)
      guard hr == S_OK else { throw COMError(hr: hr) }
      $1 = Int(cchActual)
    }
    return String(decoding: buffer, as: UTF16.self)
  }

  public func GetVendorGUID() throws -> GUID {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICComponentInfo.self, capacity: 1)

    var guidVendor: GUID = GUID()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetVendorGUID(pThis, &guidVendor)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return guidVendor
  }

  public func GetVersion() throws -> String {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICComponentInfo.self, capacity: 1)

    var cchActual: UINT = UINT(0)
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetVersion(pThis, 0, nil, &cchActual)
    guard hr == S_OK else { throw COMError(hr: hr) }

    let buffer: [WCHAR] =
        try Array<WCHAR>(unsafeUninitializedCapacity: Int(cchActual)) {
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetVersion(pThis, UINT($0.count),
                                                  $0.baseAddress, &cchActual)
      guard hr == S_OK else { throw COMError(hr: hr) }
      $1 = Int(cchActual)
    }
    return String(decoding: buffer, as: UTF16.self)
  }
}