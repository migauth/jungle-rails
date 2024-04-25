

describe("Home Page", () => {
  it("successfully loads", () => {
    // Visit the home page
    cy.visit("/");

    // Assertion to ensure the page loads successfully
    cy.url().should("eq", Cypress.config().baseUrl);
    cy.contains("Welcome", { timeout: 10000 }).should("be.visible");

  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});
