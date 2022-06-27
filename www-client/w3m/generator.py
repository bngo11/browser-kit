#!/usr/bin/python3

from packaging.version import Version

async def generate(hub, **pkginfo):
    github_user = pkginfo.get("github_user")
    github_repo = pkginfo.get("github_repo") or pkginfo.get("name")
    github = f"https://api.github.com/repos/{github_user}/{github_repo}"

    pkgmetadata = await hub.pkgtools.fetch.get_page(github, is_json=True)
    newpkginfo = await hub.pkgtools.github.tag_gen(hub, github_user, github_repo)

    ebuild = hub.pkgtools.ebuild.BreezyBuild(
        **pkginfo,
        description=pkgmetadata["description"],
        version=newpkginfo['version'],
        artifacts=[newpkginfo['artifacts'][0]]
    )

    ebuild.push()


# vim: ts=4 sw=4 noet

