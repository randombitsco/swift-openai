/// Contains ``Call``s relating to encoding and decoding tokens.
public enum Tokens {}

// MARK: Encode

extension Tokens {
  
  /// Encodes the provided ``input`` `String`and encodes it into an array of ``Token``s.
  public struct Encode: ExecutableCall {
    /// Responds with an array of ``Token``s.
    public typealias Response = [Token]
    
    /// The input `String`.
    public let input: String
  }
}

extension Tokens.Encode {
  
  /// Executes the call with the provided ``Client``.
  /// - Parameter client: The ``Client`` details.
  /// - Returns: The list of tokens.
  func execute(with client: Client) async throws -> Response {
    let encoder = try TokenEncoder()
    return try encoder.encode(text: input).map(Token.init(_:))
  }
}

// MARK: Decode

extension Tokens {
  
  /// Decodes the provided list of ``Token``s into a `String`.
  public struct Decode: ExecutableCall {
    /// Responds with a `String.
    public typealias Response = String
    
    /// The input ``Token``s.
    public let input: [Token]
  }
}

extension Tokens.Decode {
  /// Executes the call with the provided ``Client``.
  /// - Parameter client: The ``Client`` details.
  /// - Returns: The `String` result.
  func execute(with client: Client) async throws -> String {
    let encoder = try TokenEncoder()
    let input = input.map(\.value)
    return try encoder.decode(tokens: input)
  }
}

// MARK: Count

extension Tokens {
  struct Count: ExecutableCall {
    typealias Response = Int
    
    public let input: String
    
    func execute(with client: Client) async throws -> Int {
      let encoder = try TokenEncoder()
      return try encoder.encode(text: input).count
    }
  }
}