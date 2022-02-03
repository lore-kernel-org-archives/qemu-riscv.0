Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nFitZ-0006am-6y
	for mharc-qemu-riscv@gnu.org; Thu, 03 Feb 2022 15:39:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nFitW-0006XZ-Iw
 for qemu-riscv@nongnu.org; Thu, 03 Feb 2022 15:39:54 -0500
Received: from [2a00:1450:4864:20::531] (port=39829
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nFitU-0005B5-HI
 for qemu-riscv@nongnu.org; Thu, 03 Feb 2022 15:39:54 -0500
Received: by mail-ed1-x531.google.com with SMTP id u18so8479274edt.6
 for <qemu-riscv@nongnu.org>; Thu, 03 Feb 2022 12:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cn3JBOPTkmzWDDsQcJOrN9rQ7hIGilL1vixPseHwSKY=;
 b=tQUCT14j4CoRFoRa7iKEkX4AaZRbqEaRoUAeSEj83hfVYk4QUzfdr7YVcYxm4no8Yi
 M4ubjNwUbME7O/0guJOgeVk8V6nspwKbm95hjuUtmMCPcqTuvq8kR8nHHToG6p5u9lxf
 q44Y8LN2Cc/nZBfhm1gtrDifH8seCfSlHTc27mAspyp/irdiiAcKeUSoB8h3e5RWnp7p
 JmOagO/Sym51xCmLvjB8esKVitpV3HQnfcBu+VmRjJyZ7WS4X8eGQ+gR+KGadkAwryNq
 MfY/TYlByO1Fl0k1nJw/XOiOFq+icgYKrn0uCaZ9gCzp8yNP2wvm7jcagdQ4HaixqbFq
 qp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cn3JBOPTkmzWDDsQcJOrN9rQ7hIGilL1vixPseHwSKY=;
 b=ahj0wq2eS1Q5xFT6pdSPaIc72I9SKYxBwl8gT84BpaznsylyChZqjvKl4tdMdzqrw4
 axW14BdVaF409b/MjPGH6uvhKKVrEnnNMpSb2Sj6b7toGutxAdMrqhsF2iVd2TZi4lee
 qVZG5l50AeFPjhPs3QqGre3TFod2OaliWKtS661/14lGk+21TBTKICXK+MnYXf7y5211
 F3aO5m81dbCP08cOFZ5hqE745AkGMtOl3TXCcNFk6YK+iekjqhjSKWw99RqH1jRg1VSm
 7uIGwCsibyoXHyRilIN3853UK+FtofVrLMMQTYjtkha4SFkmZa5VmL3Pi79hi8wK6Kxw
 nxIg==
X-Gm-Message-State: AOAM531Jbg+/L9wmOv0GH4pUdv6DXB/ruVdy59W1+CIj32XowObDpPzb
 U3hgyEbqHxSa49o84SM4o2uyVK0fI9QU0lW/vT7bwQ==
X-Google-Smtp-Source: ABdhPJwcyNH9cX59BRjdGSW1Z78sJjisPQ0a6DEOX+Pa9C3W83DmdMLzySRlY1ypjsWdHxLs4lPl8RbHv9+8fB/4rBY=
X-Received: by 2002:a05:6402:19a9:: with SMTP id
 o9mr37099905edz.295.1643920790299; 
 Thu, 03 Feb 2022 12:39:50 -0800 (PST)
MIME-Version: 1.0
References: <20220120200735.2739543-1-atishp@rivosinc.com>
 <20220120200735.2739543-5-atishp@rivosinc.com>
 <2696860.3DGziXre4Q@diego>
In-Reply-To: <2696860.3DGziXre4Q@diego>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 3 Feb 2022 12:39:39 -0800
Message-ID: <CAHBxVyESyQqLi0bvRUcH=4UCSfs5ZzN+EK5Uxjc71okXu2Nk1A@mail.gmail.com>
Subject: Re: [RFC 4/5] target/riscv: Add *envcfg* CSRs support
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Anup Patel <anup@brainfault.org>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="000000000000beb7f705d7232237"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=atishp@rivosinc.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 03 Feb 2022 20:39:55 -0000

--000000000000beb7f705d7232237
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 3, 2022 at 4:23 AM Heiko St=C3=BCbner <heiko@sntech.de> wrote:

> Hi Atish,
>
> Am Donnerstag, 20. Januar 2022, 21:07:34 CET schrieb Atish Patra:
> > The RISC-V privileged specification v1.12 defines few execution
> > environment configuration CSRs that can be used enable/disable
> > extensions per privilege levels.
> >
> > Add the basic support for these CSRs.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  target/riscv/cpu.h      |  8 ++++
> >  target/riscv/cpu_bits.h | 31 +++++++++++++++
> >  target/riscv/csr.c      | 84 +++++++++++++++++++++++++++++++++++++++++
> >  target/riscv/machine.c  | 26 +++++++++++++
> >  4 files changed, 149 insertions(+)
> >
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index f6f90b5cbd52..afb237c2313b 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
>
> [...]
>
> > @@ -578,6 +589,26 @@ typedef enum RISCVException {
> >  #define PM_EXT_CLEAN    0x00000002ULL
> >  #define PM_EXT_DIRTY    0x00000003ULL
> >
> > +/* Execution enviornment configuration bits */
> > +#define MENVCFG_FIOM                       (1 << 0)
>
> > +#define MENVCFG_CBE                        0x30000ULL
>
> Looking both at the cmo spec as well as the most recent privileged spec
> (draft) the field is called CBIE it seems.
>
> Also the shift looks wrong. Both cmo as well as privileged spec show
> it at bits [5:4] and _not_ [17:16].
>
>
This looks like a typo from my side. These bits are reserved in the spec!
Apologies for such a silly mistake. Fixed it in v2.


> Also wouldn't doing it like (_UL(3) << 4) be better to catch such things?
>
>
Of course.


> > +#define MENVCFG_CBCFE                      (1 << 6)
> > +#define MENVCFG_CBZE                       (1 << 7)
> > +#define MENVCFG_PBMTE                      (1 << 62)
> > +#define MENVCFG_STCE                       (1 << 63)
> > +
> > +#define SENVCFG_FIOM                       MENVCFG_FIOM
> > +#define SENVCFG_CBE                        MENVCFG_CBE
> > +#define SENVCFG_CBCFE                      MENVCFG_CBCFE
> > +#define SENVCFG_CBZE                       MENVCFG_CBZE
> > +
> > +#define HENVCFG_FIOM                       MENVCFG_FIOM
> > +#define HENVCFG_CBE                        MENVCFG_CBE
> > +#define HENVCFG_CBCFE                      MENVCFG_CBCFE
> > +#define HENVCFG_CBZE                       MENVCFG_CBZE
> > +#define HENVCFG_PBMTE                      MENVCFG_PBMTE
> > +#define HENVCFG_STCE                       MENVCFG_STCE
> > +
> >  /* Offsets for every pair of control bits per each priv level */
> >  #define XS_OFFSET    0ULL
> >  #define U_OFFSET     2ULL
>
>
> Heiko
>
>
>

--000000000000beb7f705d7232237
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 3, 2022 at 4:23 AM Heiko =
St=C3=BCbner &lt;<a href=3D"mailto:heiko@sntech.de">heiko@sntech.de</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Atish=
,<br>
<br>
Am Donnerstag, 20. Januar 2022, 21:07:34 CET schrieb Atish Patra:<br>
&gt; The RISC-V privileged specification v1.12 defines few execution<br>
&gt; environment configuration CSRs that can be used enable/disable<br>
&gt; extensions per privilege levels.<br>
&gt; <br>
&gt; Add the basic support for these CSRs.<br>
&gt; <br>
&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" =
target=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++<br>
&gt;=C2=A0 target/riscv/cpu_bits.h | 31 +++++++++++++++<br>
&gt;=C2=A0 target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 | 84 ++++++++++++++++++++=
+++++++++++++++++++++<br>
&gt;=C2=A0 target/riscv/machine.c=C2=A0 | 26 +++++++++++++<br>
&gt;=C2=A0 4 files changed, 149 insertions(+)<br>
&gt; <br>
&gt; diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
&gt; index f6f90b5cbd52..afb237c2313b 100644<br>
&gt; --- a/target/riscv/cpu_bits.h<br>
&gt; +++ b/target/riscv/cpu_bits.h<br>
<br>
[...]<br>
<br>
&gt; @@ -578,6 +589,26 @@ typedef enum RISCVException {<br>
&gt;=C2=A0 #define PM_EXT_CLEAN=C2=A0 =C2=A0 0x00000002ULL<br>
&gt;=C2=A0 #define PM_EXT_DIRTY=C2=A0 =C2=A0 0x00000003ULL<br>
&gt;=C2=A0 <br>
&gt; +/* Execution enviornment configuration bits */<br>
&gt; +#define MENVCFG_FIOM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0)<br>
<br>
&gt; +#define MENVCFG_CBE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x30000ULL<br>
<br>
Looking both at the cmo spec as well as the most recent privileged spec<br>
(draft) the field is called CBIE it seems.<br>
<br>
Also the shift looks wrong. Both cmo as well as privileged spec show<br>
it at bits [5:4] and _not_ [17:16].<br>
<br></blockquote><div><br></div><div>This looks like a typo from my side. T=
hese bits are reserved in the spec!</div><div>Apologies for such a silly mi=
stake. Fixed it in v2.</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
Also wouldn&#39;t doing it like (_UL(3) &lt;&lt; 4) be better to catch such=
 things?<br>
<br></blockquote><div><br></div><div>Of course.</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
&gt; +#define MENVCFG_CBCFE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 6)<br>
&gt; +#define MENVCFG_CBZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 7)<br>
&gt; +#define MENVCFG_PBMTE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 62)<br>
&gt; +#define MENVCFG_STCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 63)<br>
&gt; +<br>
&gt; +#define SENVCFG_FIOM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MENVCFG_FIOM<br>
&gt; +#define SENVCFG_CBE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MENVCFG_CBE<br>
&gt; +#define SENVCFG_CBCFE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MENVCFG_CBCFE<br>
&gt; +#define SENVCFG_CBZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MENVCFG_CBZE<br>
&gt; +<br>
&gt; +#define HENVCFG_FIOM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MENVCFG_FIOM<br>
&gt; +#define HENVCFG_CBE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MENVCFG_CBE<br>
&gt; +#define HENVCFG_CBCFE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MENVCFG_CBCFE<br>
&gt; +#define HENVCFG_CBZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MENVCFG_CBZE<br>
&gt; +#define HENVCFG_PBMTE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MENVCFG_PBMTE<br>
&gt; +#define HENVCFG_STCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MENVCFG_STCE<br>
&gt; +<br>
&gt;=C2=A0 /* Offsets for every pair of control bits per each priv level */=
<br>
&gt;=C2=A0 #define XS_OFFSET=C2=A0 =C2=A0 0ULL<br>
&gt;=C2=A0 #define U_OFFSET=C2=A0 =C2=A0 =C2=A02ULL<br>
<br>
<br>
Heiko<br>
<br>
<br>
</blockquote></div></div>

--000000000000beb7f705d7232237--

