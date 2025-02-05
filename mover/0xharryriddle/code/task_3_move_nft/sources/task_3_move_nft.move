/*
/// Module: task_3_move_nft
module task_3_move_nft::task_3_move_nft;
*/

module task_3_move_nft::task_3_move_nft {
    use sui::url::{Self, Url};
    use std::string::{Self, String};

    const GITHUB_ID: vector<u8> = b"0xharryriddle";
    const URL: vector<u8> = b"https://avatars.githubusercontent.com/0xharryriddle";

    public struct MoveNft has key, store {
        id: UID,
        name: String,
        description: String,
        url: Url,
        github_id: String,
    }

    public fun name(nft: &MoveNft): &string::String {
        &nft.name
    }

    public fun description(nft: &MoveNft): &string::String {
        &nft.description
    }

    public fun url(nft: &MoveNft): &Url {
        &nft.url
    }

    public fun github_id(nft: &MoveNft): &string::String {
        &nft.github_id
    }

    public entry fun mint(name: vector<u8>, description: vector<u8>, recipient: address, ctx: &mut TxContext) {
        let mut nft_name = GITHUB_ID.to_string();
        nft_name.append(b" ".to_string());
        nft_name.append(name.to_string());
        let nft = MoveNft {
            id: object::new(ctx),
            name: nft_name,
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(URL),
            github_id: string::utf8(GITHUB_ID),
        };

        transfer::public_transfer(nft, recipient);
    }
}


