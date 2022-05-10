Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noT8w-0007fg-L8
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 12:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eop.chen@sifive.com>)
 id 1noT8u-0007aR-RZ
 for qemu-riscv@nongnu.org; Tue, 10 May 2022 12:55:24 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:42506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eop.chen@sifive.com>)
 id 1noT8s-0006IH-Ei
 for qemu-riscv@nongnu.org; Tue, 10 May 2022 12:55:24 -0400
Received: by mail-pf1-x436.google.com with SMTP id x23so15414214pff.9
 for <qemu-riscv@nongnu.org>; Tue, 10 May 2022 09:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=GFIi1fWkGtjEUehiRevRWeEUQz8R3XalaFu54mBmAX8=;
 b=EBkuFwUOj46947/RXySGwzvCfsSJhNQSLvfHxELpNvuSCPY9WD2YVfS0HlnR0uO+uj
 vE2vSHi1s+5G8msQ1x/y3ZoxWktv+NuhVzRcDp+aavEuivwwauQD6lb2EjREc9KPoOQW
 WN8fMT18URsKDOM3o7/Et8pHSeT2CA6Kex8UjiVvhcSeCjdttN5OWrAaTNC8BLuSPjLn
 MpabM1DBlRj9ea8H3XjJk/+8t35RZ7gcPJFLcDVGq1MuHaZP6B11czofVWaGzBQ9/eCf
 ewDRrq4RFTPjYv8zVT7MrHMLJ4T3CqBndRdG7VTNtdmA7e5FkFQLs3yK8akuGGOq3+7n
 yHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=GFIi1fWkGtjEUehiRevRWeEUQz8R3XalaFu54mBmAX8=;
 b=07a4KZsLOlujNLnTU8dfayLH4P+Cw+5vgFuvFeHgmkxqzv3ojaCgEJ7SvSBpa2JxCo
 InqhjTs77JLWgfWv8QxmtD1fxeFyBawauOL2hb4WgspsQwpSxei/ysbEsDIHe2mzHe4u
 yvzpp1OW1KQ7e4tjis10Gsrvj0b1IkI14Wgmz+64at7vfdLt17rNCoWV7pzg62PhOlLI
 FjqezWTKDOMsoiBYhgvCcGp17Iur0CZIYcYdbub0CyDJjDY9pFl/t2mQpn17Nyjs9VJ6
 6gYTilv3wcEvcgb5fMbFqtjmztkfMTYfEuAUkITi3wEigYU25lPtqHMHHaaFm8FiSb+W
 WKtw==
X-Gm-Message-State: AOAM533H36a9VA227EJCJ41Ynj9x5YO2UjOdjGD/JxRjGrTwyMMoHsoi
 6i86acyeSbePbNpCjRgp1LiI1A==
X-Google-Smtp-Source: ABdhPJzXl0uRt9WS7+ne958iyP5CYYJOwZpo+xLKuRiV93plt1PeVZIxZi+PIsVeLzuHr7D5kNYm2g==
X-Received: by 2002:a63:165f:0:b0:3c6:ab6b:a6d2 with SMTP id
 31-20020a63165f000000b003c6ab6ba6d2mr9895450pgw.610.1652201720537; 
 Tue, 10 May 2022 09:55:20 -0700 (PDT)
Received: from smtpclient.apple
 (2001-b400-e439-2c04-fce1-6211-0011-e34e.emome-ip6.hinet.net.
 [2001:b400:e439:2c04:fce1:6211:11:e34e])
 by smtp.gmail.com with ESMTPSA id
 io9-20020a17090b410900b001dd11e4b927sm2077473pjb.39.2022.05.10.09.55.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 May 2022 09:55:20 -0700 (PDT)
From: eop Chen <eop.chen@sifive.com>
Message-Id: <A86484C2-EC9B-4890-9664-FEED13E681A2@sifive.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_6A75FA43-DE37-41A2-8736-FEA5A8F698D5"
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH qemu v15 00/15] Add tail agnostic behavior for rvv
 instructions
Date: Wed, 11 May 2022 00:55:15 +0800
In-Reply-To: <165220137795.17881.11560413809338015947-0@git.sr.ht>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
To: qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <165220137795.17881.11560413809338015947-0@git.sr.ht>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=eop.chen@sifive.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2022 16:55:25 -0000


--Apple-Mail=_6A75FA43-DE37-41A2-8736-FEA5A8F698D5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> ~eopxd <eopxd@git.sr.ht> =E6=96=BC 2022=E5=B9=B45=E6=9C=8811=E6=97=A5 =
=E4=B8=8A=E5=8D=8812:49 =E5=AF=AB=E9=81=93=EF=BC=9A
>=20
> According to v-spec, tail agnostic behavior can be either kept as
> undisturbed or set elements' bits to all 1s. To distinguish the
> difference of tail policies, QEMU should be able to simulate the tail
> agnostic behavior as "set tail elements' bits to all 1s". An option
> 'rvv_ta_all_1s' is added to enable the behavior, it is default as
> disabled.
>=20
> There are multiple possibility for agnostic elements according to
> v-spec. The main intent of this patch-set tries to add option that
> can distinguish between tail policies. Setting agnostic elements to
> all 1s makes things simple and allow QEMU to express this.
>=20
> We may explore other possibility of agnostic behavior by adding
> other options in the future. Please understand that this patch-set
> is limited.
>=20
> v2 updates:
> - Addressed comments from Weiwei Li
> - Added commit tail agnostic on load / store instructions (which
>  I forgot to include into the patch-set)
>=20
> v3 updates:
> - Missed the very 1st commit, adding it back
>=20
> v4 updates:
> - Renamed vlmax to total_elems
> - Deal with tail element when vl_eq_vlmax =3D=3D true
>=20
> v5 updates:
> - Let `vext_get_total_elems` take `desc` and `esz`
> - Utilize `simd_maxsz(desc)` to get `vlenb`
> - Fix alignments to code
>=20
> v6 updates:
> - Fix `vext_get_total_elems`
>=20
> v7 updates:
> - Reuse `max_elems` for vector load / store helper functions. The
>  translation sets desc's `lmul` to `min(1, lmul)`, making
>  `vext_max_elems` equivalent to `vext_get_total_elems`.
>=20
> v8 updates:
> - Simplify `vext_set_elems_1s`, don't need `vext_set_elems_1s_fns`
> - Fix `vext_get_total_elems`, it should derive upon EMUL instead
>  of LMUL
>=20
> v9 updates:
> - Let instructions that is tail agnostic regardless of vta respect the
>  option and not the vta.
>=20
> v10 updates:
> - Correct range to set element to 1s for load instructions
>=20
> v11 updates:
> - Separate addition of option 'rvv_ta_all_1s' as a new (last) commit
> - Add description to show intent of the option in first commit for the
>  optional tail agnostic behavior
> - Tag WeiWei as Reviewed-by for all commits
> - Tag Alistair as Reviewed-by for commit 01, 02
> - Tag Alistair as Acked-by for commit 03
>=20
> v12 updates:
> - Add missing space in WeiWei's "Reviewed-by" tag
>=20
> v13 updates:
> - Fix tail agnostic for vext_ldst_us. The function operates on input
>  parameter 'evl' rather than 'env->vl'.
> - Fix tail elements for vector segment load / store instructions
>  A vector segment load / store instruction may contain fractional
>  lmul with nf * lmul > 1. The rest of the elements in the last
>  register should be treated as tail elements.
> - Fix tail agnostic length for instructions with mask destination
>  register. Instructions with mask destination register should have
>  'vlen - vl' tail elements.
>=20
> v14 updates:
> - Pass lmul information to into vector helper function.
>  `vext_get_total_elems` needs it.
>=20
> v15 updates:
> - Rebase to latest `master`
> - Tag Alistair as Acked by for commit 04 ~ 14

---
> - Tag Alistair as Acked by for commit 15
>=20
Sorry, type-o here.
This should be =E2=80=9C- Tag Alistair as Acked by Reviewed by for =
commit 15"

Regards,

cop Chen



--Apple-Mail=_6A75FA43-DE37-41A2-8736-FEA5A8F698D5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div class=3D"">

</div>
<div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">~eopxd &lt;<a href=3D"mailto:eopxd@git.sr.ht" =
class=3D"">eopxd@git.sr.ht</a>&gt; =E6=96=BC 2022=E5=B9=B45=E6=9C=8811=E6=97=
=A5 =E4=B8=8A=E5=8D=8812:49 =E5=AF=AB=E9=81=93=EF=BC=9A</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">According to v-spec, tail agnostic behavior can be either =
kept as<br class=3D"">undisturbed or set elements' bits to all 1s. To =
distinguish the<br class=3D"">difference of tail policies, QEMU should =
be able to simulate the tail<br class=3D"">agnostic behavior as "set =
tail elements' bits to all 1s". An option<br class=3D"">'rvv_ta_all_1s' =
is added to enable the behavior, it is default as<br =
class=3D"">disabled.<br class=3D""><br class=3D"">There are multiple =
possibility for agnostic elements according to<br class=3D"">v-spec. The =
main intent of this patch-set tries to add option that<br class=3D"">can =
distinguish between tail policies. Setting agnostic elements to<br =
class=3D"">all 1s makes things simple and allow QEMU to express this.<br =
class=3D""><br class=3D"">We may explore other possibility of agnostic =
behavior by adding<br class=3D"">other options in the future. Please =
understand that this patch-set<br class=3D"">is limited.<br class=3D""><br=
 class=3D"">v2 updates:<br class=3D"">- Addressed comments from Weiwei =
Li<br class=3D"">- Added commit tail agnostic on load / store =
instructions (which<br class=3D""> &nbsp;I forgot to include into the =
patch-set)<br class=3D""><br class=3D"">v3 updates:<br class=3D"">- =
Missed the very 1st commit, adding it back<br class=3D""><br class=3D"">v4=
 updates:<br class=3D"">- Renamed vlmax to total_elems<br class=3D"">- =
Deal with tail element when vl_eq_vlmax =3D=3D true<br class=3D""><br =
class=3D"">v5 updates:<br class=3D"">- Let `vext_get_total_elems` take =
`desc` and `esz`<br class=3D"">- Utilize `simd_maxsz(desc)` to get =
`vlenb`<br class=3D"">- Fix alignments to code<br class=3D""><br =
class=3D"">v6 updates:<br class=3D"">- Fix `vext_get_total_elems`<br =
class=3D""><br class=3D"">v7 updates:<br class=3D"">- Reuse `max_elems` =
for vector load / store helper functions. The<br class=3D""> =
&nbsp;translation sets desc's `lmul` to `min(1, lmul)`, making<br =
class=3D""> &nbsp;`vext_max_elems` equivalent to =
`vext_get_total_elems`.<br class=3D""><br class=3D"">v8 updates:<br =
class=3D"">- Simplify `vext_set_elems_1s`, don't need =
`vext_set_elems_1s_fns`<br class=3D"">- Fix `vext_get_total_elems`, it =
should derive upon EMUL instead<br class=3D""> &nbsp;of LMUL<br =
class=3D""><br class=3D"">v9 updates:<br class=3D"">- Let instructions =
that is tail agnostic regardless of vta respect the<br class=3D""> =
&nbsp;option and not the vta.<br class=3D""><br class=3D"">v10 =
updates:<br class=3D"">- Correct range to set element to 1s for load =
instructions<br class=3D""><br class=3D"">v11 updates:<br class=3D"">- =
Separate addition of option 'rvv_ta_all_1s' as a new (last) commit<br =
class=3D"">- Add description to show intent of the option in first =
commit for the<br class=3D""> &nbsp;optional tail agnostic behavior<br =
class=3D"">- Tag WeiWei as Reviewed-by for all commits<br class=3D"">- =
Tag Alistair as Reviewed-by for commit 01, 02<br class=3D"">- Tag =
Alistair as Acked-by for commit 03<br class=3D""><br class=3D"">v12 =
updates:<br class=3D"">- Add missing space in WeiWei's "Reviewed-by" =
tag<br class=3D""><br class=3D"">v13 updates:<br class=3D"">- Fix tail =
agnostic for vext_ldst_us. The function operates on input<br class=3D""> =
&nbsp;parameter 'evl' rather than 'env-&gt;vl'.<br class=3D"">- Fix tail =
elements for vector segment load / store instructions<br class=3D""> =
&nbsp;A vector segment load / store instruction may contain =
fractional<br class=3D""> &nbsp;lmul with nf * lmul &gt; 1. The rest of =
the elements in the last<br class=3D""> &nbsp;register should be treated =
as tail elements.<br class=3D"">- Fix tail agnostic length for =
instructions with mask destination<br class=3D""> &nbsp;register. =
Instructions with mask destination register should have<br class=3D""> =
&nbsp;'vlen - vl' tail elements.<br class=3D""><br class=3D"">v14 =
updates:<br class=3D"">- Pass lmul information to into vector helper =
function.<br class=3D""> &nbsp;`vext_get_total_elems` needs it.<br =
class=3D""><br class=3D"">v15 updates:<br class=3D"">- Rebase to latest =
`master`<br class=3D"">- Tag Alistair as Acked by for commit 04 ~ 14<br =
class=3D""></div></div></blockquote><div style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D""><br class=3D""></div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">---</div><blockquote type=3D"cite" class=3D""><div =
class=3D""><div class=3D"">- Tag Alistair as Acked by for commit 15<br =
class=3D""><br class=3D""></div></div></blockquote><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">Sorry, type-o here.</div><div style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D"">This should be =E2=80=9C- Tag =
Alistair as <strike class=3D"">Acked by</strike> Reviewed by for commit =
15"</div><div class=3D""><br class=3D""></div><div =
class=3D"">Regards,</div><div class=3D""><br class=3D""></div><div =
class=3D"">cop Chen</div><div class=3D""><br class=3D""></div></div><div =
class=3D""><br class=3D""></div></body></html>=

--Apple-Mail=_6A75FA43-DE37-41A2-8736-FEA5A8F698D5--

