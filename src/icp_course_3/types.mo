import Text "mo:base/Text";

module Types {
    public type HeaderField = (Text, Text);

    public type HttpRequest = {
        url: Text;
        method: Text;
        body: [Nat8];
        headers: [HeaderField];
    };

    public type HttpResponse = {
        body: [Nat8];
        headers: [HeaderField];
        streaming_strategy: ?StreamingStrategy;
        status_code: Nat16;
    };

    public type Key = Text;
    public type ChunkId = Nat;

    public type StreamingCallbackToken = {
    key : Key;
    sha256 : ?[Nat8];
    index : Nat;
    content_encoding : Text;
    };

    public type SetAssetContentArguments = {
    key : Key;
    sha256 : ?[Nat8];
    chunk_ids : [ChunkId];
    content_encoding : Text;
    };

    public type StreamingCallbackHttpResponse = {
    token : ?StreamingCallbackToken;
    body : [Nat8];
    };

    public type StreamingStrategy = {
        #Callback : {
            token : StreamingCallbackToken;
            callback : shared query StreamingCallbackToken -> async ?StreamingCallbackHttpResponse;
        };
    };
}