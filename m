Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1necLV-00033y-2H
	for mharc-qemu-riscv@gnu.org; Wed, 13 Apr 2022 08:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eop.chen@sifive.com>)
 id 1necLS-00031f-Pd
 for qemu-riscv@nongnu.org; Wed, 13 Apr 2022 08:43:38 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eop.chen@sifive.com>)
 id 1necLQ-0000Yp-Dh
 for qemu-riscv@nongnu.org; Wed, 13 Apr 2022 08:43:38 -0400
Received: by mail-pl1-x632.google.com with SMTP id q3so1877184plg.3
 for <qemu-riscv@nongnu.org>; Wed, 13 Apr 2022 05:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:mime-version:subject:date:references:to:in-reply-to:message-id;
 bh=JFh3ABAfOEKQLpywP4l+i4xxg6duwDS526FHjCph4VA=;
 b=iZ//7BbHaWvB9jgCv+o25XZwR39E+2Pu/cB1zTLXRDWZ88BqpnMY75dDrfZkTc//v6
 e71MnFgPinH/ruGlz7uDJtzPZHqRhAKmLgvCoQJTj97OsQK72h5/s0YHS6tTNuhOAiIR
 3BG7W6XFkYlGXubZx6vsjWIIRh9pzOXrgxqRkEUcra+iVmeXrxk1FlwkvTwmTMkpuhT6
 p53xxl9AyWl1/LZ3EzsREsC2KFyTBoSBbWtm0ER+o3DWESBYkhqOjOnyE0XBEHbyewWu
 Ai0hiEjiXHoFGHRpyICnjx11KO2vag5SF/Gda8/EAGM6VtvygIFf3iKqXwZ3f67Aiyg+
 FUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:subject:date:references:to
 :in-reply-to:message-id;
 bh=JFh3ABAfOEKQLpywP4l+i4xxg6duwDS526FHjCph4VA=;
 b=HhAC7ZGWk3n2VSDyMyXJR2oJbNcxbwBaMJk7knSicsEP46IS4t8YL6W4SYRTN3VTw1
 R7ElatNDpemvYlLJ9oFO4rvVhFr9mFMz5kueTpWyKB5qNba7mOYts7h9EtVDi5gLR1l8
 /HRrHI1ZshtQF1X9aEpARoafRvgfMlOVScZaX8UeTCDs5zN9g9k8oNHJVAMa4W8m4QOk
 AYh7VoQrstqFGrxRRn1rYSurVj9cAQIzeZuG4bZGMQbpyDUauv4V7xmj4fOIrdTYdBDP
 pnSO9H6ZtNQELMDM+A5TP4HvwGgNRvYUbgNLdWGKbEzW6FXWLfs23h82bbP2Uks8KijU
 fp8A==
X-Gm-Message-State: AOAM532KPKlRYWk+87WNGIXFGoR22NOdnl/w6Pu2BYLSkHZtVHf3goFD
 pe4tk7LNE223i7fvlwvHtHyotw==
X-Google-Smtp-Source: ABdhPJxUciGlVuYupAzq6S2zCjPHTaB4kp8Yi9b0IHL9kSfpZU4RbKyGSIkOcQ/1wMtDHT7O6/ss6A==
X-Received: by 2002:a17:902:dad0:b0:154:740a:9094 with SMTP id
 q16-20020a170902dad000b00154740a9094mr42415105plx.107.1649853814028; 
 Wed, 13 Apr 2022 05:43:34 -0700 (PDT)
Received: from smtpclient.apple
 (2001-b400-e45c-756e-7004-ba4f-f39d-a99d.emome-ip6.hinet.net.
 [2001:b400:e45c:756e:7004:ba4f:f39d:a99d])
 by smtp.gmail.com with ESMTPSA id
 16-20020a17090a005000b001c7511dc31esm2858479pjb.41.2022.04.13.05.43.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Apr 2022 05:43:33 -0700 (PDT)
From: eop Chen <eop.chen@sifive.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_22DFCD19-5F20-4993-9D8C-D0682E086D82"
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH qemu v7 00/14] Add tail agnostic behavior for rvv
 instructions
Date: Wed, 13 Apr 2022 20:43:31 +0800
References: <164863587444.17401.9965527486691250478-0@git.sr.ht>
 <937de10f-be69-247b-562f-be34c17ca945@iscas.ac.cn>
 <CAKmqyKPtyKub=MChc_C7JpoXP7+bBwTSX_c4WhuRXaoWwWjehg@mail.gmail.com>
 <1b4004ea-68f9-b0ff-58e1-581eca7be182@iscas.ac.cn>
 <CAKmqyKNch1gN+3ieHF5p15AZki3NZjrpMcwjfpuz6n91HJZ2AA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
In-Reply-To: <CAKmqyKNch1gN+3ieHF5p15AZki3NZjrpMcwjfpuz6n91HJZ2AA@mail.gmail.com>
Message-Id: <8F02B25E-B66A-45DE-8E72-059FE5DA1378@sifive.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=eop.chen@sifive.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 13 Apr 2022 12:43:39 -0000


--Apple-Mail=_22DFCD19-5F20-4993-9D8C-D0682E086D82
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Gentle ping, it is not picked to `riscv-to-apply.next` yet.

Thank you.

Yueh-Ting (eop) Chen

> Alistair Francis <alistair23@gmail.com> =E6=96=BC 2022=E5=B9=B43=E6=9C=88=
31=E6=97=A5 =E4=B8=8A=E5=8D=8811:18 =E5=AF=AB=E9=81=93=EF=BC=9A
>=20
> On Thu, Mar 31, 2022 at 11:24 AM Weiwei Li <liweiwei@iscas.ac.cn =
<mailto:liweiwei@iscas.ac.cn>> wrote:
>>=20
>>=20
>> =E5=9C=A8 2022/3/31 =E4=B8=8A=E5=8D=888:11, Alistair Francis =E5=86=99=E9=
=81=93:
>>> On Wed, Mar 30, 2022 at 10:52 PM Weiwei Li <liweiwei@iscas.ac.cn> =
wrote:
>>>>=20
>>>> =E5=9C=A8 2022/3/30 =E4=B8=8B=E5=8D=886:24, ~eopxd =E5=86=99=E9=81=93=
:
>>>>> According to v-spec, tail agnostic behavior can be either kept as
>>>>> undisturbed or set elements' bits to all 1s. To distinguish the
>>>>> difference of tail policies, QEMU should be able to simulate the =
tail
>>>>> agnostic behavior as "set tail elements' bits to all 1s". An =
option
>>>>> 'rvv_ta_all_1s' is added to enable the behavior, it is default as
>>>>> disabled.
>>>>>=20
>>>>> There are multiple possibility for agnostic elements according to
>>>>> v-spec. The main intent of this patch-set tries to add option that
>>>>> can distinguish between tail policies. Setting agnostic elements =
to
>>>>> all 1s makes things simple and allow QEMU to express this.
>>>>>=20
>>>>> We may explore other possibility of agnostic behavior by adding
>>>>> other options in the future. Please understand that this patch-set
>>>>> is limited.
>>>>>=20
>>>>> v2 updates:
>>>>> - Addressed comments from Weiwei Li
>>>>> - Added commit tail agnostic on load / store instructions (which
>>>>>     I forgot to include into the patch-set)
>>>>>=20
>>>>> v3 updates:
>>>>> - Missed the very 1st commit, adding it back
>>>>>=20
>>>>> v4 updates:
>>>>> - Renamed vlmax to total_elems
>>>>> - Deal with tail element when vl_eq_vlmax =3D=3D true
>>>>>=20
>>>>> v5 updates:
>>>>> - Let `vext_get_total_elems` take `desc` and `esz`
>>>>> - Utilize `simd_maxsz(desc)` to get `vlenb`
>>>>> - Fix alignments to code
>>>>>=20
>>>>> v6 updates:
>>>>> - Fix `vext_get_total_elems`
>>>>>=20
>>>>> v7 updates:
>>>>> - Reuse `max_elems` for vector load / store helper functions. The
>>>>>     translation sets desc's `lmul` to `min(1, lmul)`, making
>>>>> `vext_max_elems`
>>>>>     equivalent to `vext_get_total_elems`.
>>>>>=20
>>>>> eopXD (14):
>>>>>    target/riscv: rvv: Prune redundant ESZ, DSZ parameter passed
>>>>>    target/riscv: rvv: Rename ambiguous esz
>>>>>    target/riscv: rvv: Early exit when vstart >=3D vl
>>>>>    target/riscv: rvv: Add tail agnostic for vv instructions
>>>>>    target/riscv: rvv: Add tail agnostic for vector load / store
>>>>>      instructions
>>>>>    target/riscv: rvv: Add tail agnostic for vx, vvm, vxm =
instructions
>>>>>    target/riscv: rvv: Add tail agnostic for vector integer shift
>>>>>      instructions
>>>>>    target/riscv: rvv: Add tail agnostic for vector integer =
comparison
>>>>>      instructions
>>>>>    target/riscv: rvv: Add tail agnostic for vector integer merge =
and move
>>>>>      instructions
>>>>>    target/riscv: rvv: Add tail agnostic for vector fix-point =
arithmetic
>>>>>      instructions
>>>>>    target/riscv: rvv: Add tail agnostic for vector floating-point
>>>>>      instructions
>>>>>    target/riscv: rvv: Add tail agnostic for vector reduction =
instructions
>>>>>    target/riscv: rvv: Add tail agnostic for vector mask =
instructions
>>>>>    target/riscv: rvv: Add tail agnostic for vector permutation
>>>>>      instructions
>>>>>=20
>>>>>   target/riscv/cpu.c                      |    1 +
>>>>>   target/riscv/cpu.h                      |    2 +
>>>>>   target/riscv/cpu_helper.c               |    2 +
>>>>>   target/riscv/insn_trans/trans_rvv.c.inc |  164 +++
>>>>>   target/riscv/internals.h                |    5 +-
>>>>>   target/riscv/translate.c                |    2 +
>>>>>   target/riscv/vector_helper.c            | 1562 =
++++++++++++++---------
>>>>>   7 files changed, 1121 insertions(+), 617 deletions(-)
>>>>>=20
>>>> The patchset looks good to me.
>>> Do you want to add a reviewed-by or acked-by tag?
>>>=20
>>> Alistair
>>=20
>> Is there any other prerequirement to add these tags?  If not, It's OK
>> for me to add reviewed-by on this patchset.
>=20
> There is no single rule, it's a personal decision. Generally if you
> have read through the code, understand it and think it works (matches
> QEMU style and architecture, bug free, matches hardware spec, etc)
> then you review it.
>=20
>>=20
>> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn =
<mailto:liweiwei@iscas.ac.cn>>
>=20
> Thanks!
>=20
> Alistair
>=20
>>=20
>> Regards,
>>=20
>> Weiwei Li
>>=20
>>>> Regards,
>>>>=20
>>>> Weiwei Li


--Apple-Mail=_22DFCD19-5F20-4993-9D8C-D0682E086D82
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D""><div><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0);" class=3D"">Gentle ping, it is not picked to =
`riscv-to-apply.next` yet.</span></div><div><span style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><br =
class=3D""></span></div><div><div class=3D"" style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0);">Thank you.</div><div class=3D"" =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><br =
class=3D""></div><div class=3D"" style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);">Yueh-Ting (eop) Chen</div></div><div =
class=3D""><font color=3D"#000000" class=3D""><span style=3D"caret-color: =
rgb(0, 0, 0);" class=3D""><br class=3D""></span></font><blockquote =
type=3D"cite" class=3D""><div class=3D"">Alistair Francis &lt;<a =
href=3D"mailto:alistair23@gmail.com" =
class=3D"">alistair23@gmail.com</a>&gt; =E6=96=BC 2022=E5=B9=B43=E6=9C=883=
1=E6=97=A5 =E4=B8=8A=E5=8D=8811:18 =E5=AF=AB=E9=81=93=EF=BC=9A</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On Thu, Mar 31, 2022 at 11:24 AM Weiwei Li &lt;</span><a =
href=3D"mailto:liweiwei@iscas.ac.cn" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">liweiwei@iscas.ac.cn</a><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">&gt; wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
class=3D""><br class=3D"">=E5=9C=A8 2022/3/31 =E4=B8=8A=E5=8D=888:11, =
Alistair Francis =E5=86=99=E9=81=93:<br class=3D""><blockquote =
type=3D"cite" class=3D"">On Wed, Mar 30, 2022 at 10:52 PM Weiwei Li =
&lt;<a href=3D"mailto:liweiwei@iscas.ac.cn" =
class=3D"">liweiwei@iscas.ac.cn</a>&gt; wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D""><br class=3D"">=E5=9C=A8 2022/3/30 =E4=B8=8B=E5=8D=
=886:24, ~eopxd =E5=86=99=E9=81=93:<br class=3D""><blockquote =
type=3D"cite" class=3D"">According to v-spec, tail agnostic behavior can =
be either kept as<br class=3D"">undisturbed or set elements' bits to all =
1s. To distinguish the<br class=3D"">difference of tail policies, QEMU =
should be able to simulate the tail<br class=3D"">agnostic behavior as =
"set tail elements' bits to all 1s". An option<br =
class=3D"">'rvv_ta_all_1s' is added to enable the behavior, it is =
default as<br class=3D"">disabled.<br class=3D""><br class=3D"">There =
are multiple possibility for agnostic elements according to<br =
class=3D"">v-spec. The main intent of this patch-set tries to add option =
that<br class=3D"">can distinguish between tail policies. Setting =
agnostic elements to<br class=3D"">all 1s makes things simple and allow =
QEMU to express this.<br class=3D""><br class=3D"">We may explore other =
possibility of agnostic behavior by adding<br class=3D"">other options =
in the future. Please understand that this patch-set<br class=3D"">is =
limited.<br class=3D""><br class=3D"">v2 updates:<br class=3D"">- =
Addressed comments from Weiwei Li<br class=3D"">- Added commit tail =
agnostic on load / store instructions (which<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;I forgot to include into the =
patch-set)<br class=3D""><br class=3D"">v3 updates:<br class=3D"">- =
Missed the very 1st commit, adding it back<br class=3D""><br class=3D"">v4=
 updates:<br class=3D"">- Renamed vlmax to total_elems<br class=3D"">- =
Deal with tail element when vl_eq_vlmax =3D=3D true<br class=3D""><br =
class=3D"">v5 updates:<br class=3D"">- Let `vext_get_total_elems` take =
`desc` and `esz`<br class=3D"">- Utilize `simd_maxsz(desc)` to get =
`vlenb`<br class=3D"">- Fix alignments to code<br class=3D""><br =
class=3D"">v6 updates:<br class=3D"">- Fix `vext_get_total_elems`<br =
class=3D""><br class=3D"">v7 updates:<br class=3D"">- Reuse `max_elems` =
for vector load / store helper functions. The<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;translation sets desc's `lmul` to =
`min(1, lmul)`, making<br class=3D"">`vext_max_elems`<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;equivalent to =
`vext_get_total_elems`.<br class=3D""><br class=3D"">eopXD (14):<br =
class=3D"">&nbsp;&nbsp;&nbsp;target/riscv: rvv: Prune redundant ESZ, DSZ =
parameter passed<br class=3D"">&nbsp;&nbsp;&nbsp;target/riscv: rvv: =
Rename ambiguous esz<br class=3D"">&nbsp;&nbsp;&nbsp;target/riscv: rvv: =
Early exit when vstart &gt;=3D vl<br =
class=3D"">&nbsp;&nbsp;&nbsp;target/riscv: rvv: Add tail agnostic for vv =
instructions<br class=3D"">&nbsp;&nbsp;&nbsp;target/riscv: rvv: Add tail =
agnostic for vector load / store<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;instructions<br =
class=3D"">&nbsp;&nbsp;&nbsp;target/riscv: rvv: Add tail agnostic for =
vx, vvm, vxm instructions<br class=3D"">&nbsp;&nbsp;&nbsp;target/riscv: =
rvv: Add tail agnostic for vector integer shift<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;instructions<br =
class=3D"">&nbsp;&nbsp;&nbsp;target/riscv: rvv: Add tail agnostic for =
vector integer comparison<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;instructions<br =
class=3D"">&nbsp;&nbsp;&nbsp;target/riscv: rvv: Add tail agnostic for =
vector integer merge and move<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;instructions<br =
class=3D"">&nbsp;&nbsp;&nbsp;target/riscv: rvv: Add tail agnostic for =
vector fix-point arithmetic<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;instructions<br =
class=3D"">&nbsp;&nbsp;&nbsp;target/riscv: rvv: Add tail agnostic for =
vector floating-point<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;instructions<br =
class=3D"">&nbsp;&nbsp;&nbsp;target/riscv: rvv: Add tail agnostic for =
vector reduction instructions<br =
class=3D"">&nbsp;&nbsp;&nbsp;target/riscv: rvv: Add tail agnostic for =
vector mask instructions<br class=3D"">&nbsp;&nbsp;&nbsp;target/riscv: =
rvv: Add tail agnostic for vector permutation<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;instructions<br class=3D""><br =
class=3D"">&nbsp;&nbsp;target/riscv/cpu.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;&nbsp;&nbsp;1 +<br class=3D"">&nbsp;&nbsp;target/riscv/cpu.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;&nbsp;&nbsp;2 +<br class=3D"">&nbsp;&nbsp;target/riscv/cpu_helper.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;| &nbsp;&nbsp;&nbsp;2 +<br =
class=3D"">&nbsp;&nbsp;target/riscv/insn_trans/trans_rvv.c.inc | =
&nbsp;164 +++<br class=3D"">&nbsp;&nbsp;target/riscv/internals.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;5 +-<br =
class=3D"">&nbsp;&nbsp;target/riscv/translate.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;2 +<br =
class=3D"">&nbsp;&nbsp;target/riscv/vector_helper.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 1562 =
++++++++++++++---------<br class=3D"">&nbsp;&nbsp;7 files changed, 1121 =
insertions(+), 617 deletions(-)<br class=3D""><br =
class=3D""></blockquote>The patchset looks good to me.<br =
class=3D""></blockquote>Do you want to add a reviewed-by or acked-by =
tag?<br class=3D""><br class=3D"">Alistair<br class=3D""></blockquote><br =
class=3D"">Is there any other prerequirement to add these tags? &nbsp;If =
not, It's OK<br class=3D"">for me to add reviewed-by on this =
patchset.<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">There is no single rule, it's a personal decision. Generally =
if you</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">have read =
through the code, understand it and think it works (matches</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">QEMU style and architecture, bug =
free, matches hardware spec, etc)</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">then you review it.</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br class=3D"">Reviewed-by: Weiwei Li =
&lt;<a href=3D"mailto:liweiwei@iscas.ac.cn" =
class=3D"">liweiwei@iscas.ac.cn</a>&gt;<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Thanks!</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Alistair</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
class=3D"">Regards,<br class=3D""><br class=3D"">Weiwei Li<br =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D""><blockquote=
 type=3D"cite" class=3D"">Regards,<br class=3D""><br class=3D"">Weiwei =
Li</blockquote></blockquote></blockquote></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_22DFCD19-5F20-4993-9D8C-D0682E086D82--

