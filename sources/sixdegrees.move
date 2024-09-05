module sixdegrees::refferal {

    public struct ReferralCampaignStorageBase has store {
        cap_start_timestamp: u256,
        cap_distributed_amount: u256,
        total_distributed_amount: u256,
        start_date: u64,
        end_date: u64,
        name: std::string::String,
    }

    public struct ReferralCampaignStorage has key, store {
        id: UID,
        base: ReferralCampaignStorageBase,
    }

    fun init(ctx: &mut TxContext) {
        let campaign = ReferralCampaignStorage {
            id: object::new(ctx),
            base: ReferralCampaignStorageBase {
                cap_start_timestamp: 0,
                cap_distributed_amount: 0,
                total_distributed_amount: 0,
                start_date: 0,
                end_date: 0,
                name: std::string::utf8(b"Hello, SUI Move!"),
            },
        };
        transfer::transfer(campaign, ctx.sender());
    }

    public fun init_params(
        self: &mut ReferralCampaignStorage,
        cap_start_timestamp: u256,
        cap_distributed_amount: u256,
        total_distributed_amount: u256,
        start_date: u64,
        end_date: u64,
        name: std::string::String,
    ) {
        self.base.cap_start_timestamp = cap_start_timestamp;
        self.base.cap_distributed_amount = cap_distributed_amount;
        self.base.total_distributed_amount = total_distributed_amount;
        self.base.start_date = start_date;
        self.base.end_date = end_date;
        self.base.name = name;
    }

    public fun get_campaign(self: ReferralCampaignStorage): ReferralCampaignStorage {
         self
    }
}
