Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRtko-0003hv-Vo
	for mharc-qemu-riscv@gnu.org; Thu, 01 Apr 2021 05:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <0xc0de0125@gmail.com>)
 id 1lRtkn-0003fJ-AR; Thu, 01 Apr 2021 05:36:41 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:40805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <0xc0de0125@gmail.com>)
 id 1lRtkk-0006Fq-VJ; Thu, 01 Apr 2021 05:36:40 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 a22-20020a17090aa516b02900c1215e9b33so2769392pjq.5; 
 Thu, 01 Apr 2021 02:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R3pZVWUZsq0lfvQA1XeBZseC1FjiJbe7pK8DgkQJPwA=;
 b=YbtKmfiBuqPuVnDxfYgOq6TIjVBidCvESkmKr5QB5hqXJEZIBjSp/h8x+BVoRzl6S8
 BFP9twICe0kTG7bQI1QDvO7zPWiQJJIrr9l47qP6wAtzSXW0T27cyl4xSv2Ya6Z1sNrV
 HFGmhOCwMVW92lDnE5d4JHp9+8coBMzUhFCeANyYgFvZtr7XMTgvdDaeP2uzhKzNr5hM
 tk/vRbbQ+3JOOyuCIcgReMm+poCEXt+X8jG4M8nIVcBRtmkdw4fQ5Gy94m8vjMdLo68z
 /GTs6jQh+GqUWkyZ5R933EVN1fCi8bmczyDDcSUbAnhOid4KFJV7W771I2BTzC2X6U8S
 lDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R3pZVWUZsq0lfvQA1XeBZseC1FjiJbe7pK8DgkQJPwA=;
 b=BcK93i9PimwfgxN3PnQcFtHCbFQ06QT1KDasc85It8oxlORq5SKn+hwxEt0odx+tMU
 LSTkKqNdCtmJaRLZfbY8Il0K66ijwviz665hY45nepOWsT5sDMEyLh6HbfFvdmEoq7GN
 AXlmSj2S8QVVXRvH1nbzXuh16h3jHo5Y8M/6WbsMMrbDnoUYa5vs5KSSRBc5SvZ8GJHD
 52gwBFZMyh6SeuG8YPTolWy4iMNXIlRfd7MjWFtoO4OWDJ0ZsafQ8zfj6h15UiIFiFE2
 gpoB8rKSBq2st+A9vDqrsCYNKuYW99OZzYYm8yFAPZihh8gf1KPbk4q0qjWO/X0D9jab
 lJCA==
X-Gm-Message-State: AOAM530O33iEzkPI6/wCAujgv56SxdlYwdHw2g+yi7kI0GX/50XT0X5+
 1D+2bOzEAdHFFZoSzJr9nkP97lp8F7lJKfuvsww=
X-Google-Smtp-Source: ABdhPJwKU61CACGOnn5u1GFHMGV3f4gz5jKNKNod65sW9g7S6bo7ytbAasvDIn6qHeYdu2UZS7EYRIffgLr2yz5h0eI=
X-Received: by 2002:a17:902:da8d:b029:e5:c7d9:81f2 with SMTP id
 j13-20020a170902da8db02900e5c7d981f2mr7101745plx.21.1617269796519; Thu, 01
 Apr 2021 02:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210401092659.12014-1-frank.chang@sifive.com>
In-Reply-To: <20210401092659.12014-1-frank.chang@sifive.com>
From: Frank Chang <0xc0de0125@gmail.com>
Date: Thu, 1 Apr 2021 17:36:25 +0800
Message-ID: <CANzO1D18x0DWgWdw0eYnd3w=bUJLwf_mHQOXh9Z_Nodew=nPmg@mail.gmail.com>
Subject: Re: [RFC v2 0/4] target/riscv: add RNMI support
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ba416805bee5f7b1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=0xc0de0125@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Thu, 01 Apr 2021 09:36:41 -0000

--000000000000ba416805bee5f7b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<frank.chang@sifive.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=881=E6=97=A5 =E9=80=
=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:27=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Frank Chang <frank.chang@sifive.com>
>
> This patchset add suport of Resumable NMI (RNMI) in RISC-V.
>
> There are four new CSRs and one new instruction added to allow NMI to be
> resumable in RISC-V, which are:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   * mnscratch (0x350)
>   * mnepc     (0x351)
>   * mncause   (0x352)
>   * mnstatus  (0x353)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   * mnret: To return from RNMI interrupt/exception handler.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> RNMI also has higher priority than any other interrupts or exceptions
> and cannot be disable by software.
>
> RNMI may be used to route to other devices such as Bus Error Unit or
> Watchdog Timer in the future.
>
> The interrupt/exception trap handler addresses of RNMI are
> implementation defined.
>
> The technical proposal of RNMI can be found:
> https://lists.riscv.org/g/tech-privileged/message/421
>
> The port is available here:
> https://github.com/sifive/qemu/tree/nmi-upstream-v2
>
> To test RNMI, we have created another QEMU branch to have
> RNMI feature enabled and also both SiFive Bus Error Unit and
> Error Device included on sifive_e machine.
>
> Bus Error Unit (BEU) is routed to RNMI with mncause value set to 3.
> When any reads or writes to Error Device, it will drive BEU RNMI.
> A freedom-e-sdk RNMI example is also provided for testing.
> (We will also upstream BEU and Error Device in the near future.)
>
> Two -cpu options are added for RNMI and BEU:
>   * rnmi=3Dtrue to enable RNMI feature
>   * beu=3Dtrue to enable BEU feature
>
> Download and build freedom-e-sdk rnmi example:
>
> 1. git clone git@github.com:sifive/freedom-e-sdk.git
> 2. cd freedom-e-sdk
> 3. git checkout origin/dev/yihaoc/nmi -b nmi
> 4. git submodule init
> 5. git submodule update --recursive
> 6. Follow freedom-e-sdk guide to install freedom-e-sdk:
>    https://sifive.github.io/freedom-e-sdk-docs/index.html
> 7. make PROGRAM=3Dexample-rnmi TARGET=3Dqemu-sifive-e31 \
>     CONFIGURATION=3Drelease software
>

freedom-e-sdk RNMI example code is available at:
https://github.com/sifive/freedom-e-sdk/tree/dev/yihaoc/nmi/software/exampl=
e-rnmi


>
> Download, build and run freedom-e-sdk RNMI example on QEMU:
>
> 1. git clone git@github.com:sifive/qemu.git
> 2. cd qemu
> 3. git checkout origin/upstream-nmi-beu-error-device -b
> nmi-beu-error-device
> 4. git submodule init
> 5. git submodule update --recursive
> 6. ./configure --target-list=3Driscv32-softmmu
> 7. make -j
> 8. <path to qemu-system-riscv32> -nographic -M sifive_e \
>     -cpu rv32,rnmi=3Dtrue,beu=3Dtrue \
>     --bios none -kernel <path to example-rnmi.elf>
>
> Output example:
>
> RNMI Driver Example.
> Cleared accrued bus error
> Enter RNMI interrupt ISR.
> mnscratch: 0x00000000
> mnepc: 0x20401178
> mncause: 0x00000003
> mnstatus: 0x00001800
> Try to trigger illegal instruction exception.
> Enter RNMI exception ISR.
> mscratch: 0x00000000
> mepc: 0x20401208
> mcause: 0x00000002
> mstatus: 0x80007800
> Return from RNMI exception ISR.
> Handled TileLink bus error
> Return from RNMI interrupt ISR.
> Test passed!!
>
> Changelog:
>
> v2
>   * split up the series into more commits for convenience of review.
>   * add missing rnmi_irqvec and rnmi_excpvec properties to riscv_harts.
>
> Frank Chang (4):
>   target/riscv: add RNMI cpu feature
>   target/riscv: add RNMI CSRs
>   target/riscv: handle RNMI interrupt and exception
>   target/riscv: add RNMI mnret instruction
>
>  hw/riscv/riscv_hart.c                         |  8 +++
>  include/hw/riscv/riscv_hart.h                 |  2 +
>  target/riscv/cpu.c                            | 40 +++++++++++++
>  target/riscv/cpu.h                            | 16 ++++-
>  target/riscv/cpu_bits.h                       | 19 ++++++
>  target/riscv/cpu_helper.c                     | 49 +++++++++++++--
>  target/riscv/csr.c                            | 59 +++++++++++++++++++
>  target/riscv/helper.h                         |  1 +
>  target/riscv/insn32.decode                    |  3 +
>  .../riscv/insn_trans/trans_privileged.c.inc   | 13 ++++
>  target/riscv/op_helper.c                      | 31 ++++++++++
>  11 files changed, 236 insertions(+), 5 deletions(-)
>
> --
> 2.17.1
>
>
>

--000000000000ba416805bee5f7b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&lt;<a href=3D"mailto:frank.chang@sifive.=
com">frank.chang@sifive.com</a>&gt; =E6=96=BC 2021=E5=B9=B44=E6=9C=881=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:27=E5=AF=AB=E9=81=93=EF=BC=9A=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com"=
 target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
<br>
This patchset add suport of Resumable NMI (RNMI) in RISC-V.<br>
<br>
There are four new CSRs and one new instruction added to allow NMI to be<br=
>
resumable in RISC-V, which are:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
=C2=A0 * mnscratch (0x350)<br>
=C2=A0 * mnepc=C2=A0 =C2=A0 =C2=A0(0x351)<br>
=C2=A0 * mncause=C2=A0 =C2=A0(0x352)<br>
=C2=A0 * mnstatus=C2=A0 (0x353)<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
=C2=A0 * mnret: To return from RNMI interrupt/exception handler.<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
RNMI also has higher priority than any other interrupts or exceptions<br>
and cannot be disable by software.<br>
<br>
RNMI may be used to route to other devices such as Bus Error Unit or<br>
Watchdog Timer in the future.<br>
<br>
The interrupt/exception trap handler addresses of RNMI are<br>
implementation defined.<br>
<br>
The technical proposal of RNMI can be found:<br>
<a href=3D"https://lists.riscv.org/g/tech-privileged/message/421" rel=3D"no=
referrer" target=3D"_blank">https://lists.riscv.org/g/tech-privileged/messa=
ge/421</a><br>
<br>
The port is available here:<br>
<a href=3D"https://github.com/sifive/qemu/tree/nmi-upstream-v2" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/sifive/qemu/tree/nmi-upstream-=
v2</a><br>
<br>
To test RNMI, we have created another QEMU branch to have<br>
RNMI feature enabled and also both SiFive Bus Error Unit and<br>
Error Device included on sifive_e machine.<br>
<br>
Bus Error Unit (BEU) is routed to RNMI with mncause value set to 3.<br>
When any reads or writes to Error Device, it will drive BEU RNMI.<br>
A freedom-e-sdk RNMI example is also provided for testing.<br>
(We will also upstream BEU and Error Device in the near future.)<br>
<br>
Two -cpu options are added for RNMI and BEU:<br>
=C2=A0 * rnmi=3Dtrue to enable RNMI feature<br>
=C2=A0 * beu=3Dtrue to enable BEU feature<br>
<br>
Download and build freedom-e-sdk rnmi example:<br>
<br>
1. git clone git@github.com:sifive/freedom-e-sdk.git<br>
2. cd freedom-e-sdk<br>
3. git checkout origin/dev/yihaoc/nmi -b nmi<br>
4. git submodule init<br>
5. git submodule update --recursive<br>
6. Follow freedom-e-sdk guide to install freedom-e-sdk:<br>
=C2=A0 =C2=A0<a href=3D"https://sifive.github.io/freedom-e-sdk-docs/index.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://sifive.github.io/freedom-=
e-sdk-docs/index.html</a><br>
7. make PROGRAM=3Dexample-rnmi TARGET=3Dqemu-sifive-e31 \<br>
=C2=A0 =C2=A0 CONFIGURATION=3Drelease software<br></blockquote><div><br></d=
iv><div>freedom-e-sdk RNMI example code is available at:</div><div><a href=
=3D"https://github.com/sifive/freedom-e-sdk/tree/dev/yihaoc/nmi/software/ex=
ample-rnmi">https://github.com/sifive/freedom-e-sdk/tree/dev/yihaoc/nmi/sof=
tware/example-rnmi</a><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
Download, build and run freedom-e-sdk RNMI example on QEMU:<br>
<br>
1. git clone git@github.com:sifive/qemu.git<br>
2. cd qemu<br>
3. git checkout origin/upstream-nmi-beu-error-device -b nmi-beu-error-devic=
e<br>
4. git submodule init<br>
5. git submodule update --recursive<br>
6. ./configure --target-list=3Driscv32-softmmu<br>
7. make -j<br>
8. &lt;path to qemu-system-riscv32&gt; -nographic -M sifive_e \<br>
=C2=A0 =C2=A0 -cpu rv32,rnmi=3Dtrue,beu=3Dtrue \<br>
=C2=A0 =C2=A0 --bios none -kernel &lt;path to example-rnmi.elf&gt;<br>
<br>
Output example:<br>
<br>
RNMI Driver Example.<br>
Cleared accrued bus error<br>
Enter RNMI interrupt ISR.<br>
mnscratch: 0x00000000<br>
mnepc: 0x20401178<br>
mncause: 0x00000003<br>
mnstatus: 0x00001800<br>
Try to trigger illegal instruction exception.<br>
Enter RNMI exception ISR.<br>
mscratch: 0x00000000<br>
mepc: 0x20401208<br>
mcause: 0x00000002<br>
mstatus: 0x80007800<br>
Return from RNMI exception ISR.<br>
Handled TileLink bus error<br>
Return from RNMI interrupt ISR.<br>
Test passed!!<br>
<br>
Changelog:<br>
<br>
v2<br>
=C2=A0 * split up the series into more commits for convenience of review.<b=
r>
=C2=A0 * add missing rnmi_irqvec and rnmi_excpvec properties to riscv_harts=
.<br>
<br>
Frank Chang (4):<br>
=C2=A0 target/riscv: add RNMI cpu feature<br>
=C2=A0 target/riscv: add RNMI CSRs<br>
=C2=A0 target/riscv: handle RNMI interrupt and exception<br>
=C2=A0 target/riscv: add RNMI mnret instruction<br>
<br>
=C2=A0hw/riscv/riscv_hart.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +++<br>
=C2=A0include/hw/riscv/riscv_hart.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 40 +++++++++++++<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 ++++-<br>
=C2=A0target/riscv/cpu_bits.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 ++++++<br>
=C2=A0target/riscv/cpu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 49 +++++++++++++--<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 59 +++++++++++++++++++<b=
r>
=C2=A0target/riscv/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
=C2=A0.../riscv/insn_trans/trans_privileged.c.inc=C2=A0 =C2=A0| 13 ++++<br>
=C2=A0target/riscv/op_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 31 ++++++++++<br>
=C2=A011 files changed, 236 insertions(+), 5 deletions(-)<br>
<br>
--<br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000ba416805bee5f7b1--

