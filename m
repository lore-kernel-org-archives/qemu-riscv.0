Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKN8w-0008Di-If
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 12:31:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKN8r-0008CZ-KA
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 12:31:29 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKN8p-0000Xm-Jr
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 12:31:29 -0500
Received: by mail-wr1-x42b.google.com with SMTP id e3so14597887wru.13
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 09:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Pd4xwn7t+vRql5ciugXSa/3ZzrfRriKwhEgYAHyx0/A=;
 b=MdzmTHeg9bop+z5ks5sfVCDk63KLmKgfPcHmRCvCnbQxAVIqg8iWTPpLwUzJAN59tx
 /joDAPy8fsAVb0ogKjaMaaUM0ExeBj6bcKQyk36feXnQMBRq51MlcaJdoL9XfPHMRYTO
 peTqnrNBJDWFjxuBj+lnFMf1nRnc13k5jTr/2qjC9hTBUGiGqMI8kvIVo37KE4bzLYFx
 rQuTdtJEkKHXaEQTYeAVW8Uo6Cb3+R7A4b16p4QthX4lR6dG60qVdL0DbYbVX4OJbehC
 QsfSZyNaucZad6G3Rb4otn5PRjJHUsFbcO7VcWiQ1RbeSWHKKuHOrCYXK7EHg9UIMqa/
 H2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pd4xwn7t+vRql5ciugXSa/3ZzrfRriKwhEgYAHyx0/A=;
 b=p5W58YC1+4yE2bfd4YLpi5l3CrwSbMsEw6CB3dj1mB1F2WPZtnch6u9ephFtYZZ79D
 MzVIiB0jcZaOZso6tzji9srV4H+y5TSBSoxbAv6Fxr9YvCdFwLi6Z2JlKBtSZaOMYRBP
 pj3J0q+jSwcHM6M964yhgoX3WY84X8HZKrCfMDlcUqY4+p0vPPfxT4EnVAB2v7zMx8/d
 QAhztN8oOmMhLK7NeApaMXdj+B5HczW/LJfM/IZpP+KWerLdF329M1wnj9ZVksBAxSsu
 Q4CXlIdhp2aRwzTE1HjjBULoVZML/CO8wRWh21qeMVe2Aho2vKPSVYuEeVG8ybK9+v6M
 3jUQ==
X-Gm-Message-State: AFqh2koE+Es7NVQK6VnWUCQApHhXLnhZjObMNrFrmNO8fEJBl46eVvou
 zr1pzKgzzGW7fKp/rXuv/+A9TTv3krLcqp0X1+0bVQ==
X-Google-Smtp-Source: AMrXdXvP+N8FxA4uuFUzQfxJjPi9Fa/WsUEjH5sv8MoiCBJVemtre0HZhLBD/QsHBbHASl7yjoFSQ5KG19U6K0J3gDU=
X-Received: by 2002:adf:e64c:0:b0:2bc:8399:f994 with SMTP id
 b12-20020adfe64c000000b002bc8399f994mr874945wrn.674.1674581486422; Tue, 24
 Jan 2023 09:31:26 -0800 (PST)
MIME-Version: 1.0
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
 <20221223180016.2068508-12-christoph.muellner@vrull.eu>
 <CAKmqyKPPr_nkKZH9Z6r0H2E=TZ0Jz6EPbL--w_TSfbGJ+o55yg@mail.gmail.com>
In-Reply-To: <CAKmqyKPPr_nkKZH9Z6r0H2E=TZ0Jz6EPbL--w_TSfbGJ+o55yg@mail.gmail.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Tue, 24 Jan 2023 18:31:14 +0100
Message-ID: <CAEg0e7gn9Qd0S6xsGu+C2tVZZC+4ec_ia=rGoq8P=xiyR=NrxA@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] RISC-V: Adding T-Head XMAE support
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>, 
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>, 
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: multipart/alternative; boundary="000000000000a55f4805f305e2f0"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 24 Jan 2023 17:31:29 -0000

--000000000000a55f4805f305e2f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2023 at 12:49 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Sat, Dec 24, 2022 at 4:04 AM Christoph Muellner
> <christoph.muellner@vrull.eu> wrote:
> >
> > From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> >
> > This patch adds support for the T-Head specific extended memory
> > attributes. Similar like Svpbmt, this support does not have much effect
> > as most behaviour is not modelled in QEMU.
> >
> > We also don't set any EDATA information, because XMAE discovery is done
> > using the vendor ID in the Linux kernel.
> >
> > Changes in v2:
> > - Add ISA_EXT_DATA_ENTRY()
> >
> > Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> > Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> > ---
> >  target/riscv/cpu.c        | 2 ++
> >  target/riscv/cpu.h        | 1 +
> >  target/riscv/cpu_helper.c | 6 ++++--
> >  3 files changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 9c31a50e90..bb310755b1 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -118,6 +118,7 @@ static const struct isa_ext_data isa_edata_arr[] =
=3D {
> >      ISA_EXT_DATA_ENTRY(xtheadmemidx, true, PRIV_VERSION_1_11_0,
> ext_xtheadmemidx),
> >      ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0,
> ext_xtheadmempair),
> >      ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0,
> ext_xtheadsync),
> > +    ISA_EXT_DATA_ENTRY(xtheadxmae, true, PRIV_VERSION_1_11_0,
> ext_xtheadxmae),
> >      ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0,
> ext_XVentanaCondOps),
> >  };
> >
> > @@ -1080,6 +1081,7 @@ static Property riscv_cpu_extensions[] =3D {
> >      DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx,
> false),
> >      DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair,
> false),
> >      DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false=
),
> > +    DEFINE_PROP_BOOL("xtheadxmae", RISCVCPU, cfg.ext_xtheadxmae, false=
),
> >      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU,
> cfg.ext_XVentanaCondOps, false),
> >
> >      /* These are experimental so mark with 'x-' */
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index c97c1c0af0..897962f107 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -475,6 +475,7 @@ struct RISCVCPUConfig {
> >      bool ext_xtheadmemidx;
> >      bool ext_xtheadmempair;
> >      bool ext_xtheadsync;
> > +    bool ext_xtheadxmae;
> >      bool ext_XVentanaCondOps;
> >
> >      uint8_t pmu_num;
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 278d163803..345bb69b79 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -938,7 +938,8 @@ restart:
> >
> >          if (riscv_cpu_sxl(env) =3D=3D MXL_RV32) {
> >              ppn =3D pte >> PTE_PPN_SHIFT;
> > -        } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot) {
> > +        } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot ||
> > +                   cpu->cfg.ext_xtheadxmae) {
>
> I don't like this. This is some pretty core code that is now getting
> vendor extensions. I know this is very simple, but I'm worried we are
> opening the doors to other vendors adding their MMU changes.
>
> Can we just set ext_svpbmt instead?
>

Ok.
I will drop this patch.


>
> Alistair
>
> >              ppn =3D (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIF=
T;
> >          } else {
> >              ppn =3D pte >> PTE_PPN_SHIFT;
> > @@ -950,7 +951,8 @@ restart:
> >          if (!(pte & PTE_V)) {
> >              /* Invalid PTE */
> >              return TRANSLATE_FAIL;
> > -        } else if (!cpu->cfg.ext_svpbmt && (pte & PTE_PBMT)) {
> > +        } else if (!cpu->cfg.ext_svpbmt && (pte & PTE_PBMT) &&
> > +                   !cpu->cfg.ext_xtheadxmae) {
> >              return TRANSLATE_FAIL;
> >          } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
> >              /* Inner PTE, continue walking */
> > --
> > 2.38.1
> >
> >
>

--000000000000a55f4805f305e2f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 24, 2023 at 12:49 AM Alis=
tair Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Sat, Dec 24, 2022 at 4:04 AM Christoph Muellner<br>
&lt;<a href=3D"mailto:christoph.muellner@vrull.eu" target=3D"_blank">christ=
oph.muellner@vrull.eu</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Christoph M=C3=BCllner &lt;<a href=3D"mailto:christoph.muellner@=
vrull.eu" target=3D"_blank">christoph.muellner@vrull.eu</a>&gt;<br>
&gt;<br>
&gt; This patch adds support for the T-Head specific extended memory<br>
&gt; attributes. Similar like Svpbmt, this support does not have much effec=
t<br>
&gt; as most behaviour is not modelled in QEMU.<br>
&gt;<br>
&gt; We also don&#39;t set any EDATA information, because XMAE discovery is=
 done<br>
&gt; using the vendor ID in the Linux kernel.<br>
&gt;<br>
&gt; Changes in v2:<br>
&gt; - Add ISA_EXT_DATA_ENTRY()<br>
&gt;<br>
&gt; Co-developed-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@linux.ali=
baba.com" target=3D"_blank">zhiwei_liu@linux.alibaba.com</a>&gt;<br>
&gt; Signed-off-by: Christoph M=C3=BCllner &lt;<a href=3D"mailto:christoph.=
muellner@vrull.eu" target=3D"_blank">christoph.muellner@vrull.eu</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 target/riscv/cpu_helper.c | 6 ++++--<br>
&gt;=C2=A0 3 files changed, 7 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index 9c31a50e90..bb310755b1 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -118,6 +118,7 @@ static const struct isa_ext_data isa_edata_arr[] =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(xtheadmemidx, true, PRIV_VERSIO=
N_1_11_0, ext_xtheadmemidx),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSI=
ON_1_11_0, ext_xtheadmempair),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_=
1_11_0, ext_xtheadsync),<br>
&gt; +=C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(xtheadxmae, true, PRIV_VERSION_1_11_=
0, ext_xtheadxmae),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VER=
SION_1_12_0, ext_XVentanaCondOps),<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; @@ -1080,6 +1081,7 @@ static Property riscv_cpu_extensions[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;xtheadmemidx&quot;, RISCVCP=
U, cfg.ext_xtheadmemidx, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;xtheadmempair&quot;, RISCVC=
PU, cfg.ext_xtheadmempair, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;xtheadsync&quot;, RISCVCPU,=
 cfg.ext_xtheadsync, false),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;xtheadxmae&quot;, RISCVCPU, cfg.=
ext_xtheadxmae, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;xventanacondops&quot;, RISC=
VCPU, cfg.ext_XVentanaCondOps, false),<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* These are experimental so mark with &#39;x-&#39=
; */<br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index c97c1c0af0..897962f107 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -475,6 +475,7 @@ struct RISCVCPUConfig {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool ext_xtheadmemidx;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool ext_xtheadmempair;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool ext_xtheadsync;<br>
&gt; +=C2=A0 =C2=A0 bool ext_xtheadxmae;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool ext_XVentanaCondOps;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint8_t pmu_num;<br>
&gt; diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
&gt; index 278d163803..345bb69b79 100644<br>
&gt; --- a/target/riscv/cpu_helper.c<br>
&gt; +++ b/target/riscv/cpu_helper.c<br>
&gt; @@ -938,7 +938,8 @@ restart:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_cpu_sxl(env) =3D=3D MXL_RV=
32) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ppn =3D pte &gt;&gt; P=
TE_PPN_SHIFT;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (cpu-&gt;cfg.ext_svpbmt || cpu-=
&gt;cfg.ext_svnapot) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (cpu-&gt;cfg.ext_svpbmt || cpu-=
&gt;cfg.ext_svnapot ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
cpu-&gt;cfg.ext_xtheadxmae) {<br>
<br>
I don&#39;t like this. This is some pretty core code that is now getting<br=
>
vendor extensions. I know this is very simple, but I&#39;m worried we are<b=
r>
opening the doors to other vendors adding their MMU changes.<br>
<br>
Can we just set ext_svpbmt instead?<br></blockquote><div><br></div><div>Ok.=
</div><div>I will drop this patch.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Alistair<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ppn =3D (pte &amp; (ta=
rget_ulong)PTE_PPN_MASK) &gt;&gt; PTE_PPN_SHIFT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ppn =3D pte &gt;&gt; P=
TE_PPN_SHIFT;<br>
&gt; @@ -950,7 +951,8 @@ restart:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(pte &amp; PTE_V)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Invalid PTE */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return TRANSLATE_FAIL;=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!cpu-&gt;cfg.ext_svpbmt &amp;&=
amp; (pte &amp; PTE_PBMT)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!cpu-&gt;cfg.ext_svpbmt &amp;&=
amp; (pte &amp; PTE_PBMT) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
!cpu-&gt;cfg.ext_xtheadxmae) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return TRANSLATE_FAIL;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!(pte &amp; (PTE_R | PTE_=
W | PTE_X))) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Inner PTE, continue=
 walking */<br>
&gt; --<br>
&gt; 2.38.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--000000000000a55f4805f305e2f0--

