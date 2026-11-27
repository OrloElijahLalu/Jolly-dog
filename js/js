//javascript here
document.addEventListener("DOMContentLoaded", function () {

    let cart = JSON.parse(localStorage.getItem("cart")) || [];

    function saveCart() {
        localStorage.setItem("cart", JSON.stringify(cart));
    }

    function formatPrice(price) {
        return "₱" + price.toFixed(2);
    }

    //menu peyj//

    const cartItemsContainer = document.querySelector(".cart-items");

    if (cartItemsContainer) {

        const cartSummary = document.querySelector(".cart-summary");
        const clearCartBtn = document.querySelector(".cart-section button");
        const checkoutLink = document.querySelector(".cart-section a[href='checkout.html']");

        function updateTotals() {

            const subtotal = cart.reduce(function (sum, item) {
                return sum + item.price * item.quantity;
            }, 0);

            const spans = cartSummary.querySelectorAll("p span");

            spans[0].textContent = formatPrice(subtotal);
            spans[1].textContent = formatPrice(subtotal);
        }

        function renderCart() {

            cartItemsContainer.innerHTML = "";

            if (cart.length === 0) {

                cartItemsContainer.innerHTML =
                    '<p class="empty-cart-msg">Your order is currently empty.</p>';

            } else {

                cart.forEach(function (item) {

                    const div = document.createElement("div");
                    div.classList.add("cart-item");

                    div.innerHTML = `
                        <div class="cart-item-info">
                            <h4>${item.name}</h4>
                            <p>${formatPrice(item.price)}</p>
                        </div>

                        <div class="quantity-controls">
                            <button type="button" class="minus-btn">-</button>
                            <span>${item.quantity}</span>
                            <button type="button" class="plus-btn">+</button>
                        </div>

                        <p class="item-total">
                            ${formatPrice(item.price * item.quantity)}
                        </p>
                    `;

                    div.querySelector(".plus-btn").addEventListener("click", function () {
                        updateQuantity(item.name, 1);
                    });

                    div.querySelector(".minus-btn").addEventListener("click", function () {
                        updateQuantity(item.name, -1);
                    });

                    cartItemsContainer.appendChild(div);
                });
            }

            updateTotals();
            saveCart();
        }

        function updateQuantity(name, change) {

            const item = cart.find(function (item) {
                return item.name === name;
            });

            if (!item) return;

            item.quantity += change;

            if (item.quantity <= 0) {
                cart = cart.filter(function (item) {
                    return item.name !== name;
                });
            }

            renderCart();
        }

        // button para mag add ng order
        document.querySelectorAll(".food-card button").forEach(function (button) {

            button.addEventListener("click", function () {

                const card = button.closest(".food-card");
                const name = card.querySelector("h3").textContent.trim();
                const price = parseFloat(
                    card.querySelector(".price").textContent.replace(/[₱,\s]/g, "")
                );

                const existingItem = cart.find(function (item) {
                    return item.name === name;
                });

                if (existingItem) {
                    existingItem.quantity++;
                } else {
                    cart.push({
                        name: name,
                        price: price,
                        quantity: 1
                    });
                }

                renderCart();
            });
        });

        // para iclear ung cart
        clearCartBtn.addEventListener("click", function () {
            cart = [];
            renderCart();
        });

        // iblock yung checkout pag walang binili hmphh!
        checkoutLink.addEventListener("click", function (event) {

            if (cart.length === 0) {
                event.preventDefault();
                alert("Your cart is empty! Please add items first.");
            }
        });

        renderCart();
    }

    // checkout na yahooo //

    const checkoutItems = document.getElementById("checkout-items");

    if (checkoutItems) {

        const checkoutTotalPrice = document.getElementById("checkout-total-price");
        const checkoutForm = document.getElementById("checkout-form");

        function displayCheckoutCart() {

            checkoutItems.innerHTML = "";

            if (cart.length === 0) {

                checkoutItems.innerHTML = "<p>Your cart is empty.</p>";
                checkoutTotalPrice.textContent = formatPrice(0);

                checkoutForm.querySelector(".confirm-btn").disabled = true;
                return;
            }

            let total = 0;

            cart.forEach(function (item) {

                const itemTotal = item.price * item.quantity;
                total += itemTotal;

                const div = document.createElement("div");
                div.classList.add("summary-item");

                div.innerHTML = `
                    <span>${item.quantity}x ${item.name}</span>
                    <span>${formatPrice(itemTotal)}</span>
                `;

                checkoutItems.appendChild(div);
            });

            checkoutTotalPrice.textContent = formatPrice(total);

           
            const cartJsonField = document.getElementById("cart_json");
            const totalAmountField = document.getElementById("total_amount");

            if (cartJsonField) {
                cartJsonField.value = JSON.stringify(cart);
            }

            if (totalAmountField) {
                totalAmountField.value = total;
            }
        }

        displayCheckoutCart();

        checkoutForm.addEventListener("submit", function (event) {

            event.preventDefault();

            if (cart.length === 0) {
                alert("Your cart is empty!");
                return;
            }

            const total = cart.reduce(function (sum, item) {
                return sum + item.price * item.quantity;
            }, 0);

            document.getElementById("confirm-name").textContent =
                document.getElementById("customer-name").value;

            document.getElementById("confirm-time").textContent =
                document.getElementById("pickup-time").value;

            document.getElementById("confirm-total").textContent =
                formatPrice(total);

            document.getElementById("confirm-ref").textContent =
                "JD-" + Math.floor(10000 + Math.random() * 90000);

            localStorage.removeItem("cart");

            document.getElementById("checkout-view").hidden = true;
            document.getElementById("confirmation-view").hidden = false;

            window.scrollTo(0, 0);
        });
    }

});
