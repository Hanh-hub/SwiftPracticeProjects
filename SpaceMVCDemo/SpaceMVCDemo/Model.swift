import Foundation



let jsonData = """
[{
    "fairings": {
      "reused": false,
      "recovery_attempt": false,
      "recovered": false,
      "ships": []},
"rocket": "5e9d0d95eda69955f709d1eb",
"success": false,
"details": "Engine failure at 33 seconds and loss of vehicle"
},

{
    "fairings": {
      "reused": true,
      "recovery_attempt": false,
      "recovered": false,
      "ships": []},
"rocket": "sdgsdf23524234dfsfvsd",
"success": true,
"details": "Engine started at 44 seconds and loss of vehicle"
},

{
    "fairings": {
      "reused": true,
      "recovery_attempt": false,
      "recovered": false,
      "ships": []},
"rocket": "3424kdmgseg3454",
"success": false,
"details": "Engine failure at 40 seconds and loss of vehicle"
}
]
"""

struct JSONData: Codable {
    struct Fairings: Codable {
        let reused: Bool
        let recoveryAttempt: Bool
        let recovered: Bool
        let ships: [String]
        
        private enum CodingKeys: String, CodingKey {
            case reused
            case recoveryAttempt = "recovery_attempt"
            case recovered
            case ships
        }
    }
    
    let fairings: Fairings
       let rocket: String
       let success: Bool
       let details: String

       private enum CodingKeys: String, CodingKey {
           case fairings
           case rocket
           case success
           case details
       }
}
/*
 coding key: enumeration. Conform to the Coding key protocol
 it is used to map the properties of the struct or class and the keys in json 
 */
