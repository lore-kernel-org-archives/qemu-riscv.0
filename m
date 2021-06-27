Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lxX8V-0001dC-6R
	for mharc-qemu-riscv@gnu.org; Sun, 27 Jun 2021 11:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxX8T-0001am-Mr
 for qemu-riscv@nongnu.org; Sun, 27 Jun 2021 11:55:53 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:39649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxX8Q-0006SI-5l
 for qemu-riscv@nongnu.org; Sun, 27 Jun 2021 11:55:53 -0400
Received: by mail-pg1-x533.google.com with SMTP id a2so13079026pgi.6
 for <qemu-riscv@nongnu.org>; Sun, 27 Jun 2021 08:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ASiRu2WUs+uIt1JaMEZbmtMIF3dvDvoZRWRq8lWOOa8=;
 b=noGx42PgnU/5k+1cO31TtUSWeQh0qX1bHMFn28Y7a7GgqQ9NYqPEbLtBQ+ynAwx1qh
 VFYVewViWh4CXlte9AwtwE3JWPLkFTlgLa22NBdEHH/Stawzf4XeXDCp/BKUJAgLD/1d
 L0NDheZCl7xPyl7Xl1TwDhhJzOEY5Z9ffBFJF3KF0CoRcHLgAhffu/h7ct3FXUSbEguL
 WwcRy0QrRCeEeUrkfN38tstrvYgOEPQR9XuVmL2qWNQ70YZDyB1XyCcPD2PWaN7KEd8X
 XbYjNt1uY1H3OtbDwlOEk7JOjG4WuE6vbs9IZ8XuyotV9bbSadXZRgmnDs17U4M8vXdu
 ncVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ASiRu2WUs+uIt1JaMEZbmtMIF3dvDvoZRWRq8lWOOa8=;
 b=ndO3aA2NYKDu5FJgQ9/TuBq4XaIAzBEkLD+2f7ZVhiEkLfNGuLpbHfLz24bkajSVWF
 tOjDLpqMHGizJBd2FMoYgRWudWzlHxn3qJ9lB2cfOlnNLNRLJVAFny8sDe8oKnKJ4rHc
 gd5Norbcc1byyNWpZo3VY/ZGdVeINzxaUxFf1VmGfp4av25Re0837hldZ6uxrj5PGQHV
 I/zg76lZ9GVKS/VzPSd3vAWqAPuRekg1Oapcp+DRCJZ7+Jkohvjo5ROBILtqLEuxet6k
 bvAbNgpPNpBeZzRWK/eWwpT8suR9J85uS22sqJ8LMkwx2gX+V8ZmJeDrp9R4Fwqvx20t
 h2mQ==
X-Gm-Message-State: AOAM530oKywKQKg2bmOTrt3AZABEpRRov6X9u0bpGkpIkaDX7aZy+Re8
 eXzUsGC4yGxUJKGOYEoUxdPr1g==
X-Google-Smtp-Source: ABdhPJxfpj34jrts1UruhaUrRiNrVwaH8sYHqpXA/rtQwj8Gyz10Ug89Fhrc9oqD/cPunmW8ZJCAMQ==
X-Received: by 2002:a62:774b:0:b029:308:b858:b1fa with SMTP id
 s72-20020a62774b0000b0290308b858b1famr16492078pfc.34.1624809346662; 
 Sun, 27 Jun 2021 08:55:46 -0700 (PDT)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com.
 [209.85.214.169])
 by smtp.gmail.com with ESMTPSA id m1sm17772884pjk.35.2021.06.27.08.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jun 2021 08:55:46 -0700 (PDT)
Received: by mail-pl1-f169.google.com with SMTP id h1so7478676plt.1;
 Sun, 27 Jun 2021 08:55:46 -0700 (PDT)
X-Received: by 2002:a17:90a:6be6:: with SMTP id
 w93mr22509260pjj.171.1624809346006; 
 Sun, 27 Jun 2021 08:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
In-Reply-To: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 27 Jun 2021 23:55:35 +0800
X-Gmail-Original-Message-ID: <CANzO1D3O-i2HZKV7vQ-DAJkaUGE=yvOVhN+oJShbA6HdqqBH-Q@mail.gmail.com>
Message-ID: <CANzO1D3O-i2HZKV7vQ-DAJkaUGE=yvOVhN+oJShbA6HdqqBH-Q@mail.gmail.com>
Subject: Re: [RFC PATCH 00/11] RISC-V: support clic v0.9 specification
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
Content-Type: multipart/alternative; boundary="000000000000e5853905c5c1670d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 27 Jun 2021 15:55:54 -0000

--000000000000e5853905c5c1670d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:58=E5=AF=AB=E9=81=93=EF=BC=9A

> This patch set gives an implementation of "RISC-V Core-Local Interrupt
> Controller(CLIC) Version 0.9-draft-20210217". It comes from [1], where
> you can find the pdf format or the source code.
>
> I take over the job from Michael Clark, who gave the first implementation
> of clic-v0.7 specification. If there is any copyright question, please
> let me know.
>
> Features:
> 1. support four kinds of trigger types.
> 2. Preserve the CSR WARL/WPRI semantics.
> 3. Option to select different modes, such as M/S/U or M/U.
> 4. At most 4096 interrupts.
> 5. At most 1024 apertures.
>
> Todo:
> 1. Encode the interrupt trigger information to exccode.
> 2. Support complete CSR mclicbase when its number is fixed.
> 3. Gave each aperture an independend address.
>
> It have passed my qtest case and freertos test. Welcome to have a try
> for your hardware.
>
> Any advice is welcomed. Thanks very much.
>
> Zhiwei
>
> [1] specification website: https://github.com/riscv/riscv-fast-interrupt.
> [2] Michael Clark origin work:
> https://github.com/sifive/riscv-qemu/tree/sifive-clic.
>
>
> LIU Zhiwei (11):
>   target/riscv: Add CLIC CSR mintstatus
>   target/riscv: Update CSR xintthresh in CLIC mode
>   hw/intc: Add CLIC device
>   target/riscv: Update CSR xie in CLIC mode
>   target/riscv: Update CSR xip in CLIC mode
>   target/riscv: Update CSR xtvec in CLIC mode
>   target/riscv: Update CSR xtvt in CLIC mode
>   target/riscv: Update CSR xnxti in CLIC mode
>   target/riscv: Update CSR mclicbase in CLIC mode
>   target/riscv: Update interrupt handling in CLIC mode
>   target/riscv: Update interrupt return in CLIC mode
>
>  default-configs/devices/riscv32-softmmu.mak |   1 +
>  default-configs/devices/riscv64-softmmu.mak |   1 +
>  hw/intc/Kconfig                             |   3 +
>  hw/intc/meson.build                         |   1 +
>  hw/intc/riscv_clic.c                        | 836 ++++++++++++++++++++
>  include/hw/intc/riscv_clic.h                | 103 +++
>  target/riscv/cpu.h                          |   9 +
>  target/riscv/cpu_bits.h                     |  32 +
>  target/riscv/cpu_helper.c                   | 117 ++-
>  target/riscv/csr.c                          | 247 +++++-
>  target/riscv/op_helper.c                    |  25 +
>  11 files changed, 1363 insertions(+), 12 deletions(-)
>  create mode 100644 hw/intc/riscv_clic.c
>  create mode 100644 include/hw/intc/riscv_clic.h
>
> --
> 2.25.1
>
>
>
After reviewing this patchset.
I found that CLIC v0.8 spec is quite incomplete.
It lacks all S-mode related CSRs.

If you think that it's just the v0.8 spec issue for not covering
all the required S-mode related CSRs -- and we should include them
in CLIC v0.8 implementation even it's not documented explicitly.
You can just ignore my comments in regard to S-mode CSRs for v0.8 CLIC.
(Besides mintthresh, v0.8 spec does say that it holds the 8-bit field
interrupt thresholds for each privilege mode.)

Regards,
Frank Chang

--000000000000e5853905c5c1670d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_l=
iu@c-sky.com">zhiwei_liu@c-sky.com</a>&gt; =E6=96=BC 2021=E5=B9=B44=E6=9C=
=889=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:58=E5=AF=AB=E9=81=93=
=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">This patch set gives an implementation of &quot;RISC-V=
 Core-Local Interrupt<br>
Controller(CLIC) Version 0.9-draft-20210217&quot;. It comes from [1], where=
<br>
you can find the pdf format or the source code.<br>
<br>
I take over the job from Michael Clark, who gave the first implementation<b=
r>
of clic-v0.7 specification. If there is any copyright question, please<br>
let me know.<br>
<br>
Features:<br>
1. support four kinds of trigger types.<br>
2. Preserve the CSR WARL/WPRI semantics. <br>
3. Option to select different modes, such as M/S/U or M/U.<br>
4. At most 4096 interrupts.<br>
5. At most 1024 apertures.<br>
<br>
Todo:<br>
1. Encode the interrupt trigger information to exccode.<br>
2. Support complete CSR mclicbase when its number is fixed. <br>
3. Gave each aperture an independend address.<br>
<br>
It have passed my qtest case and freertos test. Welcome to have a try<br>
for your hardware.<br>
<br>
Any advice is welcomed. Thanks very much.<br>
<br>
Zhiwei<br>
<br>
[1] specification website: <a href=3D"https://github.com/riscv/riscv-fast-i=
nterrupt" rel=3D"noreferrer" target=3D"_blank">https://github.com/riscv/ris=
cv-fast-interrupt</a>.<br>
[2] Michael Clark origin work: <a href=3D"https://github.com/sifive/riscv-q=
emu/tree/sifive-clic" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/sifive/riscv-qemu/tree/sifive-clic</a>.<br>
<br>
<br>
LIU Zhiwei (11):<br>
=C2=A0 target/riscv: Add CLIC CSR mintstatus<br>
=C2=A0 target/riscv: Update CSR xintthresh in CLIC mode<br>
=C2=A0 hw/intc: Add CLIC device<br>
=C2=A0 target/riscv: Update CSR xie in CLIC mode<br>
=C2=A0 target/riscv: Update CSR xip in CLIC mode<br>
=C2=A0 target/riscv: Update CSR xtvec in CLIC mode<br>
=C2=A0 target/riscv: Update CSR xtvt in CLIC mode<br>
=C2=A0 target/riscv: Update CSR xnxti in CLIC mode<br>
=C2=A0 target/riscv: Update CSR mclicbase in CLIC mode<br>
=C2=A0 target/riscv: Update interrupt handling in CLIC mode<br>
=C2=A0 target/riscv: Update interrupt return in CLIC mode<br>
<br>
=C2=A0default-configs/devices/riscv32-softmmu.mak |=C2=A0 =C2=A01 +<br>
=C2=A0default-configs/devices/riscv64-softmmu.mak |=C2=A0 =C2=A01 +<br>
=C2=A0hw/intc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0hw/intc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0hw/intc/riscv_clic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 836 ++++++++++++++++++++<br>
=C2=A0include/hw/intc/riscv_clic.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 103 +++<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +<br>
=C2=A0target/riscv/cpu_bits.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 32 +<br>
=C2=A0target/riscv/cpu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 117 ++-<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 247 +++++-<br>
=C2=A0target/riscv/op_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 25 +<br>
=C2=A011 files changed, 1363 insertions(+), 12 deletions(-)<br>
=C2=A0create mode 100644 hw/intc/riscv_clic.c<br>
=C2=A0create mode 100644 include/hw/intc/riscv_clic.h<br>
<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>After reviewing this patchset.</div><d=
iv>I found that CLIC v0.8 spec is quite incomplete.</div><div>It lacks all =
S-mode related CSRs.<br></div><div><br></div><div>If you think that it&#39;=
s just the v0.8 spec issue for not covering</div><div>all the required S-mo=
de related CSRs -- and we should include them</div><div>in CLIC v0.8 implem=
entation even it&#39;s not documented explicitly.</div><div>You can just ig=
nore my comments in regard to S-mode CSRs for v0.8 CLIC.</div><div>(Besides=
=C2=A0mintthresh, v0.8 spec does say that it holds the 8-bit field</div><di=
v>interrupt thresholds for each privilege mode.)</div><div><br></div><div>R=
egards,</div><div>Frank Chang</div></div></div>

--000000000000e5853905c5c1670d--

