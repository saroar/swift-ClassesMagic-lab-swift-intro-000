import Foundation

/// A Nimble matcher that succeeds when the actual expression evaluates to an
/// error from the specified case.
///
/// Errors are tried to be compared by their implementation of Equatable,
/// otherwise they fallback to comparision by _domain and _code.
public func matchError<T: Error>(_ error: T) -> NonNilMatcherFunc<Error> {
    return NonNilMatcherFunc { actualExpression, failureMessage in
        let actualError: Error? = try actualExpression.evaluate()

        setFailureMessageForException(failureMessage, postfixMessageVerb: "match", actualError: actualError, error: error, userInfo: <#NSDictionary?#>)
        return exceptionMatchesNonNilFieldsOrClosure(actualError, error: error, reason: <#String?#>)
    }
}

/// A Nimble matcher that succeeds when the actual expression evaluates to an
/// error of the specified type
public func matchError<T: Error>(_ errorType: T.Type) -> NonNilMatcherFunc<Error> {
    return NonNilMatcherFunc { actualExpression, failureMessage in
        let actualError: Error? = try actualExpression.evaluate()

        setFailureMessageForException(failureMessage, postfixMessageVerb: "match", actualError: actualError, errorType: errorType, userInfo: <#NSDictionary?#>)
        return exceptionMatchesNonNilFieldsOrClosure(actualError, errorType: errorType, reason: <#String?#>)
    }
}
