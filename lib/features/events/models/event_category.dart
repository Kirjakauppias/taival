/// Taivalin tukemat tapahtumakategoriat.
/// enum on Dartin lueteltu tietotyyppi. Sillä määritellään ennalta sallitut arvot.
enum EventCategory {
  /// Käyttäjä A:n työvuorot.
  workShift,

  /// Käyttäjä A:n henkilökohtaiset menot.
  personalA,

  /// Käyttäjä B:n henkilökohtaiset menot.
  personalB,

  /// Molempien yhteiset menot.
  shared,
}
