"use strict";

module.exports = {
  config: {
    fontSize: 16,
    fontFamily: '"JetBrainsMono Nerd Font", "Lilex Nerd Font", "VictorMono Nerd Font"',
    lineHeight: 1.15,
    letterSpacing: 1,
    cursorColor: "#b9b9b9",
    cursorAccentColor: "#252525",
    foregroundColor: "#b9b9b9",
    backgroundColor: "#000000",
    selectionColor: "#b9b9b9",
    borderColor: "#000000",
    modifierKeys: { altIsMeta: true },
    showWindowControls: false,
    padding: "8px 8px",
    colors: {
      black: "#252525",
      red: "#ed4a46",
      green: "#70b433",
      yellow: "#dbb32d",
      blue: "#368aeb",
      magenta: "#eb6eb7",
      cyan: "#3fc5b7",
      white: "#777777",
      lightBlack: "#3b3b3b",
      lightRed: "#ff5e56",
      lightGreen: "#83c746",
      lightYellow: "#efc541",
      lightBlue: "#4f9cfe",
      lightMagenta: "#ff81ca",
      lightCyan: "#56d8c9",
      lightWhite: "#dedede",
    },
    bell: "SOUND",
    // bellSoundURL: '/path/to/sound/file',
    disableLigatures: false,
    preserveCWD: false,
    hyperBorder: {
      borderColors: ["#83c746", "#4f9cfe"],
      borderWidth: "8px",
      animate: true,
    },
    hyperTabs: {
      border: true,
      tabIconsColored: true,
      activityColor: "#efc541",
      closeAlign: "right",
    },
  },
  plugins: [
    "hyperborder",
    "hypercwd",
    "hyper-dark-scrollbar",
    "hyper-highlight-active-pane",
    "hyper-letters",
    "hyperpower",
    "hyper-tabs-enhanced",
  ],
};
