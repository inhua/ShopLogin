// LoginModel.swift
import Foundation
import ShopBase

public struct LoginRequest {
    public var phone: String
    public var password: String

    public init(phone: String, password: String) {
        self.phone = phone
        self.password = password
    }
}

public struct LoginResponse: Decodable {
    public var token: String
    public var user: UserModel
}
