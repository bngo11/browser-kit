#!/usr/bin/env python3

import json

async def generate(hub, **pkginfo):
	json_data = await hub.pkgtools.fetch.get_page("https://api.github.com/repos/tats/w3m/tags", is_json=True)
	version = None
	commit = None

	for item in json_data:
		try:
			version, gitver = item["name"].lstrip("v").split("+")
			list(map(int, version.split(".")))
			commit = item["commit"]["sha"]
			break

		except (KeyError, IndexError, ValueError):
			continue

	if version and commit:
		url = f"https://github.com/tats/w3m/tarball/{commit}"
		final_version = f"{version}_{gitver.replace('git', 'p')}"
		final_name = f"w3m-{final_version}-{commit[:7]}.tar.gz"
		ebuild = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			version=final_version,
			artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=final_name)]
		)
		ebuild.push()

# vim: ts=4 sw=4 noet
