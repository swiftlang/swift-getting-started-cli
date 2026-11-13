import Testing
@testable import MyCLI

@Test func parsesArguments() throws {
    let command = try MyCLI.parse(["Hello", "--count", "3", "--uppercase"])
    #expect(command.message == "Hello")
    #expect(command.count == 3)
    #expect(command.uppercase)
}

@Test func rejectsInvalidCount() {
    #expect(throws: (any Error).self) {
        try MyCLI.parse(["Hello", "--count", "0"])
    }
}
