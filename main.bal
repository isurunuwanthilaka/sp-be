import ballerinax/mongodb;

configurable string user = ?;
configurable string pass = ?;

public function main() returns error? {

    mongodb:ConnectionConfig mongoConfig = {
        connection: {url: "mongodb+srv://" + user + ":" + pass + "@salary-planner-db.o5sgraj.mongodb.net/?retryWrites=true&w=majority&appName=salary-planner-db"},
        databaseName: "sp-db"
    };
    mongodb:Client mongoClient = check new (mongoConfig);
    string collection = "items";
    map<json> doc = {"fname": "isuru", "lname": "nuwanthilaka"};

    check mongoClient->insert(doc, collection);
    mongoClient->close();
}
