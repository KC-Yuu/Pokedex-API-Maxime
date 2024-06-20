document.addEventListener("DOMContentLoaded", () => {
  const exportForm = document.getElementById("export-form");
  const pokemonIdsField = document.getElementById("pokemon_ids_field");

  exportForm.addEventListener("submit", (event) => {
    const checkboxes = document.querySelectorAll("input[name='pokemon_ids[]']:checked");
    const selectedIds = Array.from(checkboxes).map(checkbox => checkbox.value);
    pokemonIdsField.value = selectedIds.join(",");
  });
});
