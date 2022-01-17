Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9RYZ-0001Wv-AT
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 07:56:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9RYU-0001TB-9H
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 07:56:14 -0500
Received: from [2607:f8b0:4864:20::52d] (port=34776
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9RYR-0003s8-Rk
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 07:56:13 -0500
Received: by mail-pg1-x52d.google.com with SMTP id s15so4377594pgs.1
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 04:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VBP4F0Qb1NTxbFa/ly3w6QBIRc7baJNfIgHerPuVAxs=;
 b=jPx5B6W+YNwFmUQCW6wV8PEluOnwAPw5QNUgUdFg7ygObMyh6bBbNwoaFs431JVnP8
 4gcwdo7pdE+JKSV7Mg+bMVcQeY8yyOgwHlZM64r/9J4uWU9/EEp9aAb7GD4kZljuV15Z
 h3BldSvETZT1lFjiCKuqgyWlK9o+ThvS9Hy2DClwJfDSkkeCOPQZx6aK+cYMUN6o921X
 qDjbdpgvLHfglVYGJ+mDSQMgT3EV58DhEHY7pEBD9DU4pn+P1O/uqVRY2P6svk2Rpwac
 bi6JK5Ne8pV+JglHwE/1hBqTCFg9jjdqgZUadcwPUpRTO9jVJhWVSkrvIvIJgUrJwK0W
 SSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VBP4F0Qb1NTxbFa/ly3w6QBIRc7baJNfIgHerPuVAxs=;
 b=yiNm/F8CwD/6yFmeFE1+i1gHWJQluAM6ehgq9B0ckpvCIKr3IeW00ZBJboNGGIyoUV
 yLAWQakIHeN6VpNxo1zPRc0XM/5Vdq6PGKp64r+xApD+/iJRXnmZhTIdVihBWzVcEGxs
 gOgmhQ5NTCXWiU0KeAh4B63B7TQKxQ2gCDYDblE69XixY4/igUi0boCy41yKAm6toVCI
 Z35ymk+cI+vvMHkB43UR6d1Zsh02q8mTIR1CbbWXHGyMzSbw8jrxnw+cOJbi53Sy9MOA
 T2bcoRVVx2BUyiOTH01fRFoREYCF5ADBFN95s5YneDIZJGM8YkCUMwd8G0gSThjaZPXw
 KEWg==
X-Gm-Message-State: AOAM530xoMf3L2YdW9ZbfmQq/805EXZ/a17y2aHuGI0cf+E6H62pvTs5
 7lXe7/qRVly2iURJmlZ03EpLgA==
X-Google-Smtp-Source: ABdhPJwcOv77/XZYWGkMtokBOF0cgNCn6r3XbiQP5NkxAqOnd9SPtna/Up97frBZdQ+VsrKMgADRbQ==
X-Received: by 2002:a62:79c2:0:b0:4bd:e9da:c173 with SMTP id
 u185-20020a6279c2000000b004bde9dac173mr20983439pfc.65.1642424169594; 
 Mon, 17 Jan 2022 04:56:09 -0800 (PST)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com.
 [209.85.210.179])
 by smtp.gmail.com with ESMTPSA id u2sm583748pfi.98.2022.01.17.04.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 04:56:08 -0800 (PST)
Received: by mail-pf1-f179.google.com with SMTP id 128so10120542pfe.12;
 Mon, 17 Jan 2022 04:56:08 -0800 (PST)
X-Received: by 2002:a05:6a00:26c5:b0:4bd:4ad6:9c71 with SMTP id
 p5-20020a056a0026c500b004bd4ad69c71mr20854515pfw.45.1642424168205; Mon, 17
 Jan 2022 04:56:08 -0800 (PST)
MIME-Version: 1.0
References: <20211229023348.12606-1-frank.chang@sifive.com>
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 17 Jan 2022 20:55:57 +0800
X-Gmail-Original-Message-ID: <CANzO1D2MjL+d9Rconz4F9vtwzY9n2LOGChTZk_UW6F32TTMbuA@mail.gmail.com>
Message-ID: <CANzO1D2MjL+d9Rconz4F9vtwzY9n2LOGChTZk_UW6F32TTMbuA@mail.gmail.com>
Subject: Re: [PATCH 00/17] Add RISC-V RVV Zve32f and Zve64f extensions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000001dd13a05d5c6ad9a"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 17 Jan 2022 12:56:14 -0000

--0000000000001dd13a05d5c6ad9a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<frank.chang@sifive.com> =E6=96=BC 2021=E5=B9=B412=E6=9C=8829=E6=97=A5 =E9=
=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8810:35=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Frank Chang <frank.chang@sifive.com>
>
> In RVV v1.0 spec, several Zve* vector extensions for embedded processors
> are defined in Chapter 18.2:
>
> https://github.com/riscv/riscv-v-spec/blob/v1.0/v-spec.adoc#zve-vector-ex=
tensions-for-embedded-processors
>
> This patchset implements Zve32f and Zve64f extensions.
>
> The port is available at:
> https://github.com/sifive/qemu/tree/rvv-zve32f-zve64f-upstream
>
> Zve32f can be enabled with -cpu option: Zve32f=3Dtrue and
> Zve64f can be enabled with -cpu option: Zve64f=3Dtrue.
> V is not required to be enabled explicitly.
>
> Quote from the inclusion diagram for the six standard vector extensions
> from Nick Knight <nick.knight@sifive.com>:
>
>       V
>       |
>     Zve64d
>       |
>     Zve64f
>    /      \
> Zve64x   Zve32f
>    \      /
>     Zve32x
>
> Note: This patchset depends on other patchsets listed in Based-on
>       section below so it is not able to be built unless those patchsets
>       are applied.
>
> Based-on: <20211229021250.29804-1-frank.chang@sifive.com>
>
> Frank Chang (17):
>   target/riscv: rvv-1.0: Add Zve64f extension into RISC-V
>   target/riscv: rvv-1.0: Add Zve64f support for configuration insns
>   target/riscv: rvv-1.0: Add Zve64f support for load and store insns
>   target/riscv: rvv-1.0: Add Zve64f support for vmulh variant insns
>   target/riscv: rvv-1.0: Add Zve64f support for vsmul.vv and vsmul.vx
>     insns
>   target/riscv: rvv-1.0: Add Zve64f support for scalar fp insns
>   target/riscv: rvv-1.0: Add Zve64f support for single-width fp
>     reduction insns
>   target/riscv: rvv-1.0: Add Zve64f support for widening type-convert
>     insns
>   target/riscv: rvv-1.0: Add Zve64f support for narrowing type-convert
>     insns
>   target/riscv: rvv-1.0: Allow Zve64f extension to be turned on
>   target/riscv: rvv-1.0: Add Zve32f extension into RISC-V
>   target/riscv: rvv-1.0: Add Zve32f support for configuration insns
>   target/riscv: rvv-1.0: Add Zve32f support for scalar fp insns
>   target/riscv: rvv-1.0: Add Zve32f support for single-width fp
>     reduction insns
>   target/riscv: rvv-1.0: Add Zve32f support for widening type-convert
>     insns
>   target/riscv: rvv-1.0: Add Zve32f support for narrowing type-convert
>     insns
>   target/riscv: rvv-1.0: Allow Zve32f extension to be turned on
>
>  target/riscv/cpu.c                      |   6 +
>  target/riscv/cpu.h                      |   2 +
>  target/riscv/cpu_helper.c               |   5 +-
>  target/riscv/csr.c                      |   6 +-
>  target/riscv/insn_trans/trans_rvv.c.inc | 217 ++++++++++++++++++++----
>  target/riscv/translate.c                |   4 +
>  6 files changed, 203 insertions(+), 37 deletions(-)
>
> --
> 2.31.1
>
>
>
ping

--0000000000001dd13a05d5c6ad9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&lt;<a href=3D"mailto:frank.chang@sifive.=
com">frank.chang@sifive.com</a>&gt; =E6=96=BC 2021=E5=B9=B412=E6=9C=8829=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8810:35=E5=AF=AB=E9=81=93=EF=BC=
=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.c=
om" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
<br>
In RVV v1.0 spec, several Zve* vector extensions for embedded processors<br=
>
are defined in Chapter 18.2:<br>
<a href=3D"https://github.com/riscv/riscv-v-spec/blob/v1.0/v-spec.adoc#zve-=
vector-extensions-for-embedded-processors" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/riscv/riscv-v-spec/blob/v1.0/v-spec.adoc#zve-vector=
-extensions-for-embedded-processors</a><br>
<br>
This patchset implements Zve32f and Zve64f extensions.<br>
<br>
The port is available at:<br>
<a href=3D"https://github.com/sifive/qemu/tree/rvv-zve32f-zve64f-upstream" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/sifive/qemu/tree/rv=
v-zve32f-zve64f-upstream</a><br>
<br>
Zve32f can be enabled with -cpu option: Zve32f=3Dtrue and<br>
Zve64f can be enabled with -cpu option: Zve64f=3Dtrue.<br>
V is not required to be enabled explicitly.<br>
<br>
Quote from the inclusion diagram for the six standard vector extensions<br>
from Nick Knight &lt;<a href=3D"mailto:nick.knight@sifive.com" target=3D"_b=
lank">nick.knight@sifive.com</a>&gt;:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 V<br>
=C2=A0 =C2=A0 =C2=A0 |<br>
=C2=A0 =C2=A0 Zve64d<br>
=C2=A0 =C2=A0 =C2=A0 |<br>
=C2=A0 =C2=A0 Zve64f<br>
=C2=A0 =C2=A0/=C2=A0 =C2=A0 =C2=A0 \<br>
Zve64x=C2=A0 =C2=A0Zve32f<br>
=C2=A0 =C2=A0\=C2=A0 =C2=A0 =C2=A0 /<br>
=C2=A0 =C2=A0 Zve32x<br>
<br>
Note: This patchset depends on other patchsets listed in Based-on<br>
=C2=A0 =C2=A0 =C2=A0 section below so it is not able to be built unless tho=
se patchsets<br>
=C2=A0 =C2=A0 =C2=A0 are applied.<br>
<br>
Based-on: &lt;<a href=3D"mailto:20211229021250.29804-1-frank.chang@sifive.c=
om" target=3D"_blank">20211229021250.29804-1-frank.chang@sifive.com</a>&gt;=
<br>
<br>
Frank Chang (17):<br>
=C2=A0 target/riscv: rvv-1.0: Add Zve64f extension into RISC-V<br>
=C2=A0 target/riscv: rvv-1.0: Add Zve64f support for configuration insns<br=
>
=C2=A0 target/riscv: rvv-1.0: Add Zve64f support for load and store insns<b=
r>
=C2=A0 target/riscv: rvv-1.0: Add Zve64f support for vmulh variant insns<br=
>
=C2=A0 target/riscv: rvv-1.0: Add Zve64f support for vsmul.vv and vsmul.vx<=
br>
=C2=A0 =C2=A0 insns<br>
=C2=A0 target/riscv: rvv-1.0: Add Zve64f support for scalar fp insns<br>
=C2=A0 target/riscv: rvv-1.0: Add Zve64f support for single-width fp<br>
=C2=A0 =C2=A0 reduction insns<br>
=C2=A0 target/riscv: rvv-1.0: Add Zve64f support for widening type-convert<=
br>
=C2=A0 =C2=A0 insns<br>
=C2=A0 target/riscv: rvv-1.0: Add Zve64f support for narrowing type-convert=
<br>
=C2=A0 =C2=A0 insns<br>
=C2=A0 target/riscv: rvv-1.0: Allow Zve64f extension to be turned on<br>
=C2=A0 target/riscv: rvv-1.0: Add Zve32f extension into RISC-V<br>
=C2=A0 target/riscv: rvv-1.0: Add Zve32f support for configuration insns<br=
>
=C2=A0 target/riscv: rvv-1.0: Add Zve32f support for scalar fp insns<br>
=C2=A0 target/riscv: rvv-1.0: Add Zve32f support for single-width fp<br>
=C2=A0 =C2=A0 reduction insns<br>
=C2=A0 target/riscv: rvv-1.0: Add Zve32f support for widening type-convert<=
br>
=C2=A0 =C2=A0 insns<br>
=C2=A0 target/riscv: rvv-1.0: Add Zve32f support for narrowing type-convert=
<br>
=C2=A0 =C2=A0 insns<br>
=C2=A0 target/riscv: rvv-1.0: Allow Zve32f extension to be turned on<br>
<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0target/riscv/cpu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0target/riscv/insn_trans/trans_rvv.c.inc | 217 ++++++++++++++++++++---=
-<br>
=C2=A0target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A06 files changed, 203 insertions(+), 37 deletions(-)<br>
<br>
--<br>
2.31.1<br>
<br>
<br></blockquote><div><br></div><div>ping=C2=A0</div></div></div>

--0000000000001dd13a05d5c6ad9a--

