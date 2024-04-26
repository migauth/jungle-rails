describe("Adding items to cart", () => {
  it("should add an item to the cart", () => {
    // Visit the home page
    cy.visit("/");

    // Get the initial cart count
    let initialCartCount;
    cy.get(".nav-link:contains('My Cart')").invoke("text").then((text) => {
      initialCartCount = parseInt(text.match(/\d+/)[0]);
    });

    // Click the "Add" button
    cy.contains("Add").click({ force: true });

    // Wait for the cart count to update
    cy.get(".nav-link:contains('My Cart')")
      .invoke("text")
      .should("not.contain", initialCartCount);

    // Visit the cart page
    cy.get(".nav-link").contains("My Cart").click();

    // Check that the added item is present in the cart content
    cy.get(".nav-link:contains('My Cart (1)')")
  });
});
