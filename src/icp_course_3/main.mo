import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Types "types";

actor Counter {
    stable var currentValue: Nat = 0;

    public func increment(): async () {
        currentValue += 1;
    };

    public query func get(): async Nat {
        currentValue
    };

    public func set(n: Nat): async () {
        currentValue := n;
    };

    public shared query func http_request(request: Types.HttpRequest): async Types.HttpResponse {
        {
            body = Text.encodeUtf8("<html><body><h1>" # Nat.toText(currentValue) # "</h1><body></html>");
            headers = [];
            streaming_strategy = null;
            status_code = 200;
        }
    }

};
