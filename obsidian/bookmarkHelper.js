function jumpToBookmark({ index, title }) {
  if (index === undefined && !title) {
    return;
  }

  (async () => {
    const result = await app.vault.readConfigJson("bookmarks");
    const item = result.find(
      (v, i) =>
        (index !== undefined && i === index) ||
        (title !== undefined && v.title === title)
    );

    !!item && app.workspace.openLinkText(item.title, item.path);
  })();
}
