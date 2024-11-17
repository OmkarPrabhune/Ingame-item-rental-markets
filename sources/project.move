module IngameItemRentalMarkets::ItemRental {
    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;
    use aptos_framework::timestamp;
    use std::error;

    const EINVALID_RENTAL_PERIOD: u64 = 1;
    const EITEM_NOT_AVAILABLE: u64 = 2;
    const EINSUFFICIENT_PAYMENT: u64 = 3;

    struct RentalListing has key {
        item_id: u64,
        owner: address,
        price_per_hour: u64,
        is_available: bool,
        current_renter: address,
        rental_end_time: u64
    }

    /// List an item for rental
    public entry fun list_item(
        owner: &signer,
        item_id: u64,
        price_per_hour: u64
    ) {
        let rental = RentalListing {
            item_id,
            owner: signer::address_of(owner),
            price_per_hour,
            is_available: true,
            current_renter: @0x0,
            rental_end_time: 0
        };
        move_to(owner, rental);
    }

    /// Rent an item
    public entry fun rent_item(
        renter: &signer,
        owner_addr: address,
        rental_hours: u64
    ) acquires RentalListing {
        let rental = borrow_global_mut<RentalListing>(owner_addr);
        
        assert!(rental.is_available, error::not_found(EITEM_NOT_AVAILABLE));
        assert!(rental_hours > 0, error::invalid_argument(EINVALID_RENTAL_PERIOD));
        
        let total_cost = rental.price_per_hour * rental_hours;
        let payment = coin::withdraw<AptosCoin>(renter, total_cost);
        coin::deposit(owner_addr, payment);

        rental.is_available = false;
        rental.current_renter = signer::address_of(renter);
        rental.rental_end_time = timestamp::now_seconds() + (rental_hours * 3600);
    }
}
