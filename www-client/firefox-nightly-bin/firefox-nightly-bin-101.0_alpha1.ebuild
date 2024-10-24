# Distributed under the terms of the GNU General Public License v2

EAPI=7

MOZ_LANGS=( ach af an ar ast az be bg bn bo br brx bs ca-valencia ca cak ckb cs cy da de dsb el en-CA en-GB eo es-AR es-CL es-ES es-MX et eu fa ff fi fr fy-NL ga-IE gd gl gn gu-IN he hi-IN hr hsb hu hy-AM hye ia id is it ja ka kab kk km kn ko lij lo lt ltg lv meh mk mr ms my nb-NO ne-NP nl nn-NO oc pa-IN pl pt-BR pt-PT rm ro ru sat sc scn sco si sk sl son sq sr sv-SE szl ta te tg th tl tr trs uk ur uz vi wo xh zh-CN zh-TW )

# Convert the ebuild version to the upstream mozilla version, used by mozlinguas
MOZ_PV="${PV/_beta/b}" # Handle beta for SRC_URI
MOZ_PV="${MOZ_PV/_rc/rc}" # Handle rc for SRC_URI
MY_PN="${PN/-bin}"
MOZ_PN="${MY_PN/-nightly}"

MOZ_P="${MOZ_PN}-${MOZ_PV}"

inherit desktop linux-info pax-utils xdg

DESCRIPTION="Firefox Web Browser (nightly)"
SRC_URI="
	amd64? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central/firefox-101.0a1.en-US.linux-x86_64.tar.bz2 -> firefox-nightly-bin_x86_64-101.0_alpha1.tar.bz2 )
	x86? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central/firefox-101.0a1.en-US.linux-i686.tar.bz2 -> firefox-nightly-bin_i686-101.0_alpha1.tar.bz2 )
	l10n_ach? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.ach.langpack.xpi -> firefox-101.0a1-ach.xpi )
	l10n_af? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.af.langpack.xpi -> firefox-101.0a1-af.xpi )
	l10n_an? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.an.langpack.xpi -> firefox-101.0a1-an.xpi )
	l10n_ar? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.ar.langpack.xpi -> firefox-101.0a1-ar.xpi )
	l10n_ast? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.ast.langpack.xpi -> firefox-101.0a1-ast.xpi )
	l10n_az? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.az.langpack.xpi -> firefox-101.0a1-az.xpi )
	l10n_be? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.be.langpack.xpi -> firefox-101.0a1-be.xpi )
	l10n_bg? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.bg.langpack.xpi -> firefox-101.0a1-bg.xpi )
	l10n_bn? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.bn.langpack.xpi -> firefox-101.0a1-bn.xpi )
	l10n_bo? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.bo.langpack.xpi -> firefox-101.0a1-bo.xpi )
	l10n_br? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.br.langpack.xpi -> firefox-101.0a1-br.xpi )
	l10n_brx? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.brx.langpack.xpi -> firefox-101.0a1-brx.xpi )
	l10n_bs? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.bs.langpack.xpi -> firefox-101.0a1-bs.xpi )
	l10n_ca-valencia? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.ca-valencia.langpack.xpi -> firefox-101.0a1-ca-valencia.xpi )
	l10n_ca? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.ca.langpack.xpi -> firefox-101.0a1-ca.xpi )
	l10n_cak? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.cak.langpack.xpi -> firefox-101.0a1-cak.xpi )
	l10n_ckb? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.ckb.langpack.xpi -> firefox-101.0a1-ckb.xpi )
	l10n_cs? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.cs.langpack.xpi -> firefox-101.0a1-cs.xpi )
	l10n_cy? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.cy.langpack.xpi -> firefox-101.0a1-cy.xpi )
	l10n_da? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.da.langpack.xpi -> firefox-101.0a1-da.xpi )
	l10n_de? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.de.langpack.xpi -> firefox-101.0a1-de.xpi )
	l10n_dsb? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.dsb.langpack.xpi -> firefox-101.0a1-dsb.xpi )
	l10n_el? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.el.langpack.xpi -> firefox-101.0a1-el.xpi )
	l10n_en-CA? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.en-CA.langpack.xpi -> firefox-101.0a1-en-CA.xpi )
	l10n_en-GB? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.en-GB.langpack.xpi -> firefox-101.0a1-en-GB.xpi )
	l10n_eo? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.eo.langpack.xpi -> firefox-101.0a1-eo.xpi )
	l10n_es-AR? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.es-AR.langpack.xpi -> firefox-101.0a1-es-AR.xpi )
	l10n_es-CL? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.es-CL.langpack.xpi -> firefox-101.0a1-es-CL.xpi )
	l10n_es-ES? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.es-ES.langpack.xpi -> firefox-101.0a1-es-ES.xpi )
	l10n_es-MX? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.es-MX.langpack.xpi -> firefox-101.0a1-es-MX.xpi )
	l10n_et? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.et.langpack.xpi -> firefox-101.0a1-et.xpi )
	l10n_eu? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.eu.langpack.xpi -> firefox-101.0a1-eu.xpi )
	l10n_fa? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.fa.langpack.xpi -> firefox-101.0a1-fa.xpi )
	l10n_ff? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.ff.langpack.xpi -> firefox-101.0a1-ff.xpi )
	l10n_fi? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.fi.langpack.xpi -> firefox-101.0a1-fi.xpi )
	l10n_fr? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.fr.langpack.xpi -> firefox-101.0a1-fr.xpi )
	l10n_fy-NL? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.fy-NL.langpack.xpi -> firefox-101.0a1-fy-NL.xpi )
	l10n_ga-IE? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.ga-IE.langpack.xpi -> firefox-101.0a1-ga-IE.xpi )
	l10n_gd? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.gd.langpack.xpi -> firefox-101.0a1-gd.xpi )
	l10n_gl? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.gl.langpack.xpi -> firefox-101.0a1-gl.xpi )
	l10n_gn? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.gn.langpack.xpi -> firefox-101.0a1-gn.xpi )
	l10n_gu-IN? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.gu-IN.langpack.xpi -> firefox-101.0a1-gu-IN.xpi )
	l10n_he? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.he.langpack.xpi -> firefox-101.0a1-he.xpi )
	l10n_hi-IN? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.hi-IN.langpack.xpi -> firefox-101.0a1-hi-IN.xpi )
	l10n_hr? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.hr.langpack.xpi -> firefox-101.0a1-hr.xpi )
	l10n_hsb? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.hsb.langpack.xpi -> firefox-101.0a1-hsb.xpi )
	l10n_hu? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.hu.langpack.xpi -> firefox-101.0a1-hu.xpi )
	l10n_hy-AM? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.hy-AM.langpack.xpi -> firefox-101.0a1-hy-AM.xpi )
	l10n_hye? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.hye.langpack.xpi -> firefox-101.0a1-hye.xpi )
	l10n_ia? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.ia.langpack.xpi -> firefox-101.0a1-ia.xpi )
	l10n_id? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.id.langpack.xpi -> firefox-101.0a1-id.xpi )
	l10n_is? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.is.langpack.xpi -> firefox-101.0a1-is.xpi )
	l10n_it? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.it.langpack.xpi -> firefox-101.0a1-it.xpi )
	l10n_ja? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.ja.langpack.xpi -> firefox-101.0a1-ja.xpi )
	l10n_ka? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.ka.langpack.xpi -> firefox-101.0a1-ka.xpi )
	l10n_kab? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.kab.langpack.xpi -> firefox-101.0a1-kab.xpi )
	l10n_kk? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.kk.langpack.xpi -> firefox-101.0a1-kk.xpi )
	l10n_km? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.km.langpack.xpi -> firefox-101.0a1-km.xpi )
	l10n_kn? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.kn.langpack.xpi -> firefox-101.0a1-kn.xpi )
	l10n_ko? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.ko.langpack.xpi -> firefox-101.0a1-ko.xpi )
	l10n_lij? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.lij.langpack.xpi -> firefox-101.0a1-lij.xpi )
	l10n_lo? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.lo.langpack.xpi -> firefox-101.0a1-lo.xpi )
	l10n_lt? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.lt.langpack.xpi -> firefox-101.0a1-lt.xpi )
	l10n_ltg? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.ltg.langpack.xpi -> firefox-101.0a1-ltg.xpi )
	l10n_lv? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.lv.langpack.xpi -> firefox-101.0a1-lv.xpi )
	l10n_meh? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.meh.langpack.xpi -> firefox-101.0a1-meh.xpi )
	l10n_mk? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.mk.langpack.xpi -> firefox-101.0a1-mk.xpi )
	l10n_mr? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.mr.langpack.xpi -> firefox-101.0a1-mr.xpi )
	l10n_ms? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.ms.langpack.xpi -> firefox-101.0a1-ms.xpi )
	l10n_my? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.my.langpack.xpi -> firefox-101.0a1-my.xpi )
	l10n_nb-NO? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.nb-NO.langpack.xpi -> firefox-101.0a1-nb-NO.xpi )
	l10n_ne-NP? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.ne-NP.langpack.xpi -> firefox-101.0a1-ne-NP.xpi )
	l10n_nl? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.nl.langpack.xpi -> firefox-101.0a1-nl.xpi )
	l10n_nn-NO? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.nn-NO.langpack.xpi -> firefox-101.0a1-nn-NO.xpi )
	l10n_oc? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.oc.langpack.xpi -> firefox-101.0a1-oc.xpi )
	l10n_pa-IN? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.pa-IN.langpack.xpi -> firefox-101.0a1-pa-IN.xpi )
	l10n_pl? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.pl.langpack.xpi -> firefox-101.0a1-pl.xpi )
	l10n_pt-BR? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.pt-BR.langpack.xpi -> firefox-101.0a1-pt-BR.xpi )
	l10n_pt-PT? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.pt-PT.langpack.xpi -> firefox-101.0a1-pt-PT.xpi )
	l10n_rm? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.rm.langpack.xpi -> firefox-101.0a1-rm.xpi )
	l10n_ro? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.ro.langpack.xpi -> firefox-101.0a1-ro.xpi )
	l10n_ru? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.ru.langpack.xpi -> firefox-101.0a1-ru.xpi )
	l10n_sat? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.sat.langpack.xpi -> firefox-101.0a1-sat.xpi )
	l10n_sc? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.sc.langpack.xpi -> firefox-101.0a1-sc.xpi )
	l10n_scn? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.scn.langpack.xpi -> firefox-101.0a1-scn.xpi )
	l10n_sco? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.sco.langpack.xpi -> firefox-101.0a1-sco.xpi )
	l10n_si? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.si.langpack.xpi -> firefox-101.0a1-si.xpi )
	l10n_sk? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.sk.langpack.xpi -> firefox-101.0a1-sk.xpi )
	l10n_sl? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.sl.langpack.xpi -> firefox-101.0a1-sl.xpi )
	l10n_son? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.son.langpack.xpi -> firefox-101.0a1-son.xpi )
	l10n_sq? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.sq.langpack.xpi -> firefox-101.0a1-sq.xpi )
	l10n_sr? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.sr.langpack.xpi -> firefox-101.0a1-sr.xpi )
	l10n_sv-SE? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.sv-SE.langpack.xpi -> firefox-101.0a1-sv-SE.xpi )
	l10n_szl? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.szl.langpack.xpi -> firefox-101.0a1-szl.xpi )
	l10n_ta? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.ta.langpack.xpi -> firefox-101.0a1-ta.xpi )
	l10n_te? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.te.langpack.xpi -> firefox-101.0a1-te.xpi )
	l10n_tg? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.tg.langpack.xpi -> firefox-101.0a1-tg.xpi )
	l10n_th? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.th.langpack.xpi -> firefox-101.0a1-th.xpi )
	l10n_tl? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.tl.langpack.xpi -> firefox-101.0a1-tl.xpi )
	l10n_tr? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.tr.langpack.xpi -> firefox-101.0a1-tr.xpi )
	l10n_trs? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.trs.langpack.xpi -> firefox-101.0a1-trs.xpi )
	l10n_uk? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.uk.langpack.xpi -> firefox-101.0a1-uk.xpi )
	l10n_ur? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.ur.langpack.xpi -> firefox-101.0a1-ur.xpi )
	l10n_uz? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.uz.langpack.xpi -> firefox-101.0a1-uz.xpi )
	l10n_vi? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.vi.langpack.xpi -> firefox-101.0a1-vi.xpi )
	l10n_wo? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.wo.langpack.xpi -> firefox-101.0a1-wo.xpi )
	l10n_xh? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.xh.langpack.xpi -> firefox-101.0a1-xh.xpi )
	l10n_zh-CN? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.zh-CN.langpack.xpi -> firefox-101.0a1-zh-CN.xpi )
	l10n_zh-TW? ( https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/firefox-101.0a1.zh-TW.langpack.xpi -> firefox-101.0a1-zh-TW.xpi )
	
"
HOMEPAGE="https://www.mozilla.org/en-US/firefox/"
RESTRICT="strip mirror"

KEYWORDS="-* ~amd64 ~x86"
SLOT="0"
LICENSE="MPL-2.0 GPL-2 LGPL-2.1"
IUSE="+alsa +ffmpeg geckodriver +pulseaudio selinux wayland startup-notification l10n_ach l10n_af l10n_an l10n_ar l10n_ast l10n_az l10n_be l10n_bg l10n_bn l10n_bo l10n_br l10n_brx l10n_bs l10n_ca-valencia l10n_ca l10n_cak l10n_ckb l10n_cs l10n_cy l10n_da l10n_de l10n_dsb l10n_el l10n_en-CA l10n_en-GB l10n_eo l10n_es-AR l10n_es-CL l10n_es-ES l10n_es-MX l10n_et l10n_eu l10n_fa l10n_ff l10n_fi l10n_fr l10n_fy-NL l10n_ga-IE l10n_gd l10n_gl l10n_gn l10n_gu-IN l10n_he l10n_hi-IN l10n_hr l10n_hsb l10n_hu l10n_hy-AM l10n_hye l10n_ia l10n_id l10n_is l10n_it l10n_ja l10n_ka l10n_kab l10n_kk l10n_km l10n_kn l10n_ko l10n_lij l10n_lo l10n_lt l10n_ltg l10n_lv l10n_meh l10n_mk l10n_mr l10n_ms l10n_my l10n_nb-NO l10n_ne-NP l10n_nl l10n_nn-NO l10n_oc l10n_pa-IN l10n_pl l10n_pt-BR l10n_pt-PT l10n_rm l10n_ro l10n_ru l10n_sat l10n_sc l10n_scn l10n_sco l10n_si l10n_sk l10n_sl l10n_son l10n_sq l10n_sr l10n_sv-SE l10n_szl l10n_ta l10n_te l10n_tg l10n_th l10n_tl l10n_tr l10n_trs l10n_uk l10n_ur l10n_uz l10n_vi l10n_wo l10n_xh l10n_zh-CN l10n_zh-TW"

DEPEND="app-arch/unzip
	alsa? (
		!pulseaudio? (
			dev-util/patchelf
			media-sound/apulse
		)
	)"
RDEPEND="dev-libs/atk
	>=sys-apps/dbus-0.60
	>=dev-libs/dbus-glib-0.72
	>=dev-libs/glib-2.26:2
	media-libs/fontconfig
	>=media-libs/freetype-2.4.10
	>=x11-libs/cairo-1.10[X]
	x11-libs/gdk-pixbuf
	>=x11-libs/gtk+-2.18:2
	>=x11-libs/gtk+-3.4.0:3
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrender
	x11-libs/libXt
	>=x11-libs/pango-1.22.0
	virtual/freedesktop-icon-theme
	alsa? (
		!pulseaudio? ( media-sound/apulse )
	)
	geckodriver? ( www-apps/geckodriver )
	pulseaudio? ( media-sound/pulseaudio )
	ffmpeg? ( media-video/ffmpeg )
	selinux? ( sec-policy/selinux-mozilla )
"

QA_PREBUILT="
	opt/${MOZ_PN}/*.so
	opt/${MOZ_PN}/${MOZ_PN}
	opt/${MOZ_PN}/${PN}
	opt/${MOZ_PN}/crashreporter
	opt/${MOZ_PN}/webapprt-stub
	opt/${MOZ_PN}/plugin-container
	opt/${MOZ_PN}/mozilla-xremote-client
	opt/${MOZ_PN}/updater
	opt/${MOZ_PN}/minidump-analyzer
	opt/${MOZ_PN}/pingsender
"

# Allow MOZ_GMP_PLUGIN_LIST to be set in an eclass or
# overridden in the enviromnent (advanced hackers only)
if [[ -z "${MOZ_GMP_PLUGIN_LIST+set}" ]] ; then
	MOZ_GMP_PLUGIN_LIST=( gmp-gmpopenh264 gmp-widevinecdm )
fi

S="${WORKDIR}/${MOZ_PN}"

moz_install_xpi() {
	debug-print-function ${FUNCNAME} "$@"

	
	if [[ ${#} -lt 2 ]] ; then
		die "${FUNCNAME} requires at least two arguments"
	fi
	

	local DESTDIR=${1}
	shift

	insinto "${DESTDIR}"

	local emid xpi_file xpi_tmp_dir
	for xpi_file in "${@}" ; do
		emid=
		xpi_tmp_dir=$(mktemp -d --tmpdir="${T}")

		# Unpack XPI
		unzip -qq "${xpi_file}" -d "${xpi_tmp_dir}" || die

		# Determine extension ID
		if [[ -f "${xpi_tmp_dir}/install.rdf" ]] ; then
			emid=$(
				sed -n -e '/install-manifest/,$ { /em:id/!d; s/.*[\">]\([^\"<>]*\)[\"<].*/\1/; p; q }' \
				"${xpi_tmp_dir}/install.rdf")
			[[ -z "${emid}" ]] && die "failed to determine extension id from install.rdf"
		elif [[ -f "${xpi_tmp_dir}/manifest.json" ]] ; then
			emid=$(sed -n -e 's/.*"id": "\([^"]*\)".*/\1/p' "${xpi_tmp_dir}/manifest.json")
			[[ -z "${emid}" ]] && die "failed to determine extension id from manifest.json"
		else
			die "failed to determine extension id"
		fi

		einfo "Installing ${emid}.xpi into ${ED}/${DESTDIR} ..."
		newins "${xpi_file}" "${emid}.xpi"
	done
}

pkg_setup() {
	CONFIG_CHECK="~SECCOMP"
	WARNING_SECCOMP="CONFIG_SECCOMP not set! This system will be unable to play DRM-protected content."

	linux-info_pkg_setup
}

src_unpack() {
	einfo "${A}"
	local _lp_dir="${WORKDIR}/language_packs"
	local _src_file

	if [[ ! -d "${_lp_dir}" ]] ; then
		mkdir "${_lp_dir}" || die
	fi

	for _src_file in ${A} ; do
		if [[ ${_src_file} == *.xpi ]]; then
			cp "${DISTDIR}/${_src_file}" "${_lp_dir}" || die "Failed to copy '${_src_file}' to '${_lp_dir}'!"
		else
			unpack ${_src_file}
		fi
	done
}


src_install() {
	local MOZILLA_FIVE_HOME=/opt/${MY_PN}

	dodir /opt
	cd "${ED}"/opt &>/dev/null || die
	mv "${S}" "${ED}"/${MOZILLA_FIVE_HOME} || die


	pax-mark m "${ED}/"${MOZILLA_FIVE_HOME}/{firefox,firefox-bin,plugin-container}

	# Patch alsa support
	local apulselib=
	if use alsa && ! use pulseaudio ; then
		apulselib="${EPREFIX}/usr/$(get_libdir)/apulse"
		patchelf --set-rpath "${apulselib}" "${ED}${MOZILLA_FIVE_HOME}/libxul.so" || die
	fi

	# Install policy (currently only used to disable application updates)
	insinto "${MOZILLA_FIVE_HOME}/distribution"
	newins "${FILESDIR}"/disable-auto-update.policy.json policies.json

	# Install system-wide preferences
	local PREFS_DIR="${MOZILLA_FIVE_HOME}/browser/defaults/preferences"
	insinto "${PREFS_DIR}"
	newins "${FILESDIR}"/all-gentoo-3.js all-gentoo.js

	# Fix prefs that make no sense for a system-wide install
	insinto ${MOZILLA_FIVE_HOME}/defaults/pref/
	doins "${FILESDIR}"/local-settings.js

	local GENTOO_PREFS="${ED}${PREFS_DIR}/all-gentoo.js"

	for plugin in "${MOZ_GMP_PLUGIN_LIST[@]}" ; do
		einfo "Disabling auto-update for ${plugin} plugin ..."
		cat >>"${GENTOO_PREFS}" <<-EOF || die "failed to disable autoupdate for ${plugin} media plugin"
		pref("media.${plugin}.autoupdate",   false);
		EOF
	done

	# Install language packs
	local langpacks=( $(find "${WORKDIR}/language_packs" -type f -name '*.xpi') )
	if [[ -n "${langpacks}" ]] ; then
		moz_install_xpi "${MOZILLA_FIVE_HOME}/distribution/extensions" "${langpacks[@]}"
	fi

	# Install SVG icons
	# local icon_symbolic_file="${FILESDIR}/firefox-symbolic.svg"
	# insinto /usr/share/icons/hicolor/symbolic/apps
	# newins "${icon_symbolic_file}" ${PN}-symbolic.svg

	# Install icons
	local icon_srcdir="${ED}/${MOZILLA_FIVE_HOME}/browser/chrome/icons/default"
	local icon size
	for icon in "${icon_srcdir}"/default*.png ; do
		size=${icon%.png}
		size=${size##*/default}

		if [[ ${size} -eq 48 ]] ; then
			newicon "${icon}" ${PN}.png
		fi

		newicon -s ${size} "${icon}" ${PN}.png
	done

	# Install menu
	local app_name="Mozilla ${MOZ_PN^} (bin)"
	local desktop_file="${FILESDIR}/${PN}.desktop"
	local desktop_filename="${PN}.desktop"
	local exec_command="${PN}"
	local icon="${PN}"
	local use_wayland="false"

	if use wayland ; then
		use_wayland="true"
	fi

	cp "${desktop_file}" "${WORKDIR}/${PN}.desktop-template" || die

	sed -i \
		-e "s:@NAME@:${app_name}:" \
		-e "s:@EXEC@:${exec_command}:" \
		-e "s:@ICON@:${icon}:" \
		"${WORKDIR}/${PN}.desktop-template" \
		|| die

	newmenu "${WORKDIR}/${PN}.desktop-template" "${desktop_filename}"

	rm "${WORKDIR}/${PN}.desktop-template" || die

	# Create /usr/bin/firefox-bin or /usr/bin/firefox-dev-bin
	[[ -f "${ED}/usr/bin/${PN}" ]] && rm "${ED}/usr/bin/${PN}"

	# Update wrapper
	#sed -i \
	#	-e "s:@PREFIX@:${EPREFIX}/usr:" \
	#	-e "s:@MOZ_FIVE_HOME@:${MOZILLA_FIVE_HOME}:" \
	#	-e "s:@APULSELIB_DIR@:${apulselib}:" \
	#	-e "s:@DEFAULT_WAYLAND@:${use_wayland}:" \
	#	"${ED}/usr/bin/${PN}" \
	#	|| die


	dodir /usr/bin/
	local apulselib=$(usex pulseaudio "" $(usex alsa "/usr/$(get_libdir)/apulse:" ""))
	cat <<-EOF >"${ED}/"usr/bin/${PN}
	#!/bin/sh
	unset LD_PRELOAD
	LD_LIBRARY_PATH="${apulselib}${MOZILLA_FIVE_HOME}/" \\
	GTK_PATH=/usr/$(get_libdir)/gtk-3.0/ \\
	exec ${MOZILLA_FIVE_HOME}/${MOZ_PN} "\$@"
	EOF
	fperms 0755 /usr/bin/${PN}

	# revdep-rebuild entry
	insinto /etc/revdep-rebuild
	echo "SEARCH_DIRS_MASK=${MOZILLA_FIVE_HOME}" >> ${T}/10${PN}
	doins "${T}"/10${PN}
}

pkg_postinst() {
	# Update mimedb for the new .desktop file
	xdg_desktop_database_update
	xdg_icon_cache_update

	if ! has_version 'gnome-base/gconf' || ! has_version 'gnome-base/orbit' \
		|| ! has_version 'net-misc/curl'; then
		einfo
		einfo "For using the crashreporter, you need gnome-base/gconf,"
		einfo "gnome-base/orbit and net-misc/curl emerged."
		einfo
	fi

	use ffmpeg || ewarn "USE=-ffmpeg : HTML5 video will not render without media-video/ffmpeg installed"

	local HAS_AUDIO=0
	if use alsa || use pulseaudio; then
		HAS_AUDIO=1
	fi

	if [[ ${HAS_AUDIO} -eq 0 ]] ; then
		ewarn "USE=-pulseaudio & USE=-alsa : For audio please either set USE=pulseaudio or USE=alsa!"
	fi

	local show_doh_information

	if [[ -z "${REPLACING_VERSIONS}" ]] ; then
		# New install; Tell user that DoH is disabled by default
		show_doh_information=yes
	else
		local replacing_version
		for replacing_version in ${REPLACING_VERSIONS} ; do
			if ver_test "${replacing_version}" -lt 70 ; then
				# Tell user only once about our DoH default
				show_doh_information=yes
				break
			fi
		done
	fi

	if [[ -n "${show_doh_information}" ]] ; then
		elog
		elog "Note regarding Trusted Recursive Resolver aka DNS-over-HTTPS (DoH):"
		elog "Due to privacy concerns (encrypting DNS might be a good thing, sending all"
		elog "DNS traffic to Cloudflare by default is not a good idea and applications"
		elog "should respect OS configured settings), \"network.trr.mode\" was set to 5"
		elog "(\"Off by choice\") by default."
		elog "You can enable DNS-over-HTTPS in ${PN^}'s preferences."
	fi
}

pkg_postrm() {
	xdg_icon_cache_update
}