function jumpToBookmark({ index, title }) {
  if (index === undefined && !title) {
    return;
  }

  (async () => {
    const { items } = await app.vault.readConfigJson("bookmarks");
    console.log("bookmark", items);
    const item = items?.find(
      (v, i) =>
        (index !== undefined && i === index) ||
        (title !== undefined && v.title === title)
    );
    console.log("bookmark exists?", !!item);

    if (item) {
      const { name, path } = splitNoteName(item);
      app.workspace.openLinkText(name, path, false);
    }
  })();
}

function splitNoteName({ path }) {
  const [_, ...parts] = path.split("/").last().split(".").reverse();
  return { name: parts.reverse().join("."), path };
}
