import { USER_ROLE } from "../types";

export class User {
    constructor(
        private id: string,
        private nickname: string,
        private email: string,
        private password: string,
        private role: USER_ROLE,
        private createdAt: string
    ) {}

    public getId() : string {
        return this.id
    }
 
    public setId (value : string): void {
        this.id = value
    }

    public getNickname() : string {
        return this.nickname
    }
 
    public setNickname (value : string): void {
        this.nickname = value
    }

    public getEmail() : string {
        return this.email
    }
 
    public setEmail (value : string): void {
        this.email = value
    }

    public getPassword() : string {
        return this.password
    }
 
    public setPassword (value : string): void {
        this.password = value
    }

    public getRole() : USER_ROLE {
        return this.role
    }
 
    public setRole (value : USER_ROLE): void {
        this.role = value
    }

    public getCreatedAt() : string {
        return this.createdAt
    }
 
    public setCreatedAt (value : string): void {
        this.createdAt = value
    }  
    
}