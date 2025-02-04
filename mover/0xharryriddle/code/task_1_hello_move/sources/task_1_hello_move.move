/*
/// Module: task_1_hello_move
module task_1_hello_move::task_1_hello_move;
*/

module task_1_hello_move::task_1_hello_move{

    use std::string;

    public struct HelloMoveObj has key, store{
        id:UID,
        text: string::String,
    }
    #[lint_allow(self_transfer)]
    public entry fun hello_move(ctx: &mut TxContext){
        let object = HelloMoveObj{
            id: object::new(ctx),
            text: string::utf8(b"Hello, Move!"),
        };
        transfer::public_transfer(object,tx_context::sender(ctx));
    }
}
