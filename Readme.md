# Ingame Item Rental Markets

## Introduction
**Ingame Item Rental Markets** is a decentralized smart contract built on the Aptos blockchain. This contract enables users to list in-game items for rent and allows others to rent these items for a specified duration. The platform is designed to automate the rental process, ensuring fairness and transparency for both item owners and renters.

The contract includes essential features like listing items, calculating rental costs, and tracking active rentals with time-based availability.

---

## Vision
The vision of **Ingame Item Rental Markets** is to:
- **Empower Players**: Allow players to monetize their in-game assets seamlessly.
- **Foster Trust**: Create a trustless and decentralized platform for in-game item rentals.
- **Promote Accessibility**: Provide an ecosystem where users can temporarily access items they cannot afford to own permanently.
- **Lay the Foundation for the Metaverse Economy**: Enable a decentralized economy for in-game assets, ensuring cross-game interoperability and financial inclusivity.

---

## Future Goals
1. **Enhanced Rental Functionality**:
   - Implement automatic return of items after the rental period ends.
   - Add penalties for late returns or damage to rented items (if applicable).

2. **User Rating System**:
   - Introduce a reputation system for both renters and item owners to build trust within the ecosystem.

3. **Support for Multiple Payment Tokens**:
   - Extend support to accept payments in multiple cryptocurrencies and tokens.

4. **Cross-Platform Integration**:
   - Enable rental services for items from different games, making the platform compatible across various gaming ecosystems.

5. **Frontend User Interface**:
   - Develop a user-friendly interface for gamers to interact with the smart contract easily.

6. **Event Tracking**:
   - Add event logs for every action (e.g., item listing, rental start, and end) for improved transparency and easier debugging.

---

## Deployed Address
The contract is deployed on the Aptos blockchain at the following address:0x95abe24a3101e44366c7c9257804c270e19ac571dfdbfc76a2ab3150a55a31d4

---

## How to Use
### **1. List an Item for Rent**
Owners can list an item for rent by calling the `list_item` function:
```bash
list_item(owner, item_id, price_per_hour)
```
- `owner`: The account listing the item.
- `item_id`: A unique identifier for the item.
- `price_per_hour`: The rental cost per hour (in Aptos Coins).

### **2. Rent an Item**
Renters can rent an item by calling the `rent_item` function:
```bash
rent_item(renter, owner_addr, rental_hours)
```
- `renter`: The account renting the item.
- `owner_addr`: The address of the item's owner.
- `rental_hours`: The number of hours for which the item will be rented.

---

## Contributing
We welcome contributions from developers, designers, and gamers to help improve the project. If you have ideas, feedback, or code contributions, feel free to submit a pull request or reach out to the development team.

---

## License
This project is open-source and distributed under the MIT License.
