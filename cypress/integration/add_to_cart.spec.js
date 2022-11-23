describe("Add to cart", () => {
  it("should visit homepage", () => {
    cy.visit("/");
  });

  it("add product to cart and counter the quantity increment", () => {
    cy.contains(".btn", "Add").first().click({ force: true});
    cy.contains("My Cart").should("contain", "1");
  });
})