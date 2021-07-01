Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lysKQ-0002TN-AB
	for mharc-qemu-riscv@gnu.org; Thu, 01 Jul 2021 04:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lysKF-0002QR-MX
 for qemu-riscv@nongnu.org; Thu, 01 Jul 2021 04:45:42 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lysKB-00077L-AM
 for qemu-riscv@nongnu.org; Thu, 01 Jul 2021 04:45:35 -0400
Received: by mail-pl1-x634.google.com with SMTP id n9so825662plf.7
 for <qemu-riscv@nongnu.org>; Thu, 01 Jul 2021 01:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3yZe339rBBCb9ap2oGJ9Egr/Vyz28UQekAkxRXK160M=;
 b=a3ce4/H5RWDXig7I/ABTy+x/61xbQ+scRYspS9sy/TMH6n9jo8GGv51svasOB+nsc8
 YCTky80aW4z3OoIQ/cKWmKOQzG7aY+8CdprjivshohHFrZpwcCrWyRs2ZhfW5YcCez/U
 hvXwNcKVHs2rb738jdqB6AyoXFd0kpkoci1HIVkh0ynZhoXKhq66ZBz4zF39PKuT2Ih+
 0RJu6Hbq2/UUkOXCgusGbJr2nLOB0tSS3TVd4bwMDcKV2QAod0gunSrFYukt8q3dFOTm
 gOjhqPyl/ixg3tLyz2PPqT/sxuteee+VLfkbHVW7vHSCVzdoovt/yDcxTiFnl8xfVy1y
 aWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3yZe339rBBCb9ap2oGJ9Egr/Vyz28UQekAkxRXK160M=;
 b=KKSgY4tAh2JVnrGp2W0gBqA++tp7bTtfcjnwJfHwOnWxTzjMEo7YH++R+r/YmJlg63
 iJOFBvSYDyhOhQnDjQ6bhnyyjJpIYIkFvEmQxnNExmBumzYQ82sMKgHh3Ag+iXchfnHI
 V/+10pWXwHvF4qQMAcsxutKPQEJ649yD8A/MQce6nVn/rIOqlCL05gMWd7ju2z8kEINy
 7uBi5QjcInL6CNqvHNE2kO4IJw/AoaiG79+mGnaahWdwXgwDchdhr3l0w4nhd8gQbkqj
 rnOQUFNMZ1AnSpqVvE083nZli/FnvGJx4jMAoUJXYy/7XslLddAukTlXh9NGNqCdayTJ
 xnbQ==
X-Gm-Message-State: AOAM5339OcuTXawBeX2Pn3MfuBm+lmFhXK23Sp5nAEOErT86X84wFG4W
 RU2+HBRoHeXjPM4JXl4vf+DGfXz0M5JBgw==
X-Google-Smtp-Source: ABdhPJz8N+TDnize/+tYNOQMY+IZYDiUA0lSvKXJuZgO1w9oZwd7tRtCh7auYStu6AlkGpL1z586yw==
X-Received: by 2002:a17:90b:3612:: with SMTP id
 ml18mr8918510pjb.209.1625129129134; 
 Thu, 01 Jul 2021 01:45:29 -0700 (PDT)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com.
 [209.85.210.176])
 by smtp.gmail.com with ESMTPSA id 21sm23328534pfh.103.2021.07.01.01.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 01:45:28 -0700 (PDT)
Received: by mail-pf1-f176.google.com with SMTP id i6so5322442pfq.1;
 Thu, 01 Jul 2021 01:45:28 -0700 (PDT)
X-Received: by 2002:a63:5b0e:: with SMTP id p14mr37904719pgb.110.1625129128125; 
 Thu, 01 Jul 2021 01:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-2-zhiwei_liu@c-sky.com>
 <CAKmqyKMc4TiKgJKM8nUpGR+hWAyUAdjh8bG7chBAdsXq57-V5A@mail.gmail.com>
 <20304ba9-6f87-f7b9-a24d-15d4b3d3f75a@c-sky.com>
In-Reply-To: <20304ba9-6f87-f7b9-a24d-15d4b3d3f75a@c-sky.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 1 Jul 2021 16:45:17 +0800
X-Gmail-Original-Message-ID: <CANzO1D0zjHowQp46fWmnoPB=ChUuh5-=Q+ajWxpv2yFzONP9gg@mail.gmail.com>
Message-ID: <CANzO1D0zjHowQp46fWmnoPB=ChUuh5-=Q+ajWxpv2yFzONP9gg@mail.gmail.com>
Subject: Re: [RFC PATCH 01/11] target/riscv: Add CLIC CSR mintstatus
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com
Content-Type: multipart/alternative; boundary="000000000000656bf105c60bdce0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Thu, 01 Jul 2021 08:45:42 -0000

--000000000000656bf105c60bdce0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=8820=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=888:49=E5=AF=AB=E9=81=93=EF=BC=9A

>
> On 2021/4/20 =E4=B8=8A=E5=8D=887:23, Alistair Francis wrote:
> > On Fri, Apr 9, 2021 at 5:52 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
> >> CSR mintstatus holds the active interrupt level for each supported
> >> privilege mode. sintstatus, and user, uintstatus, provide restricted
> >> views of mintstatus.
> >>
> >> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> >> ---
> >>   target/riscv/cpu.h      |  2 ++
> >>   target/riscv/cpu_bits.h | 11 +++++++++++
> >>   target/riscv/csr.c      | 26 ++++++++++++++++++++++++++
> >>   3 files changed, 39 insertions(+)
> >>
> >> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >> index 0a33d387ba..1a44ca62c7 100644
> >> --- a/target/riscv/cpu.h
> >> +++ b/target/riscv/cpu.h
> >> @@ -159,6 +159,7 @@ struct CPURISCVState {
> >>       target_ulong mip;
> >>
> >>       uint32_t miclaim;
> >> +    uint32_t mintstatus; /* clic-spec */
> >>
> >>       target_ulong mie;
> >>       target_ulong mideleg;
> >> @@ -243,6 +244,7 @@ struct CPURISCVState {
> >>
> >>       /* Fields from here on are preserved across CPU reset. */
> >>       QEMUTimer *timer; /* Internal timer */
> >> +    void *clic;       /* clic interrupt controller */
> > This should be the CLIC type.
>
> OK.
>
> Actually there are many versions of CLIC in my branch as different
> devices. But it is better to use CLIC type for the upstream version.
>

Hi Alistair and Zhiwei,

Replacing void *clic with RISCVCLICState *clic may create a circular loop
because CPURISCVState is also referenced in riscv_clic.h.

However, I would like to ask what is the best approach to add
the reference of CLIC device in CPURISCVState struct?

There may be different kinds of CLIC devices.
AFAK, there was another RFC patchset trying to add void *eclic
for Nuclei processor into CPURISCVState struct:
https://patchwork.kernel.org/project/qemu-devel/patch/20210507081654.11056-=
2-wangjunqiang@iscas.ac.cn/

Is it okay to add the device reference directly into CPURISCVState struct
like that,
or we should create some abstraction for these CLIC devices?
(However, I'm not sure how big the differences are for these CLIC
devices...)

Thanks,
Frank Chang


>
> >
> >>   };
> >>
> >>   OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
> >> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> >> index caf4599207..c4ce6ec3d9 100644
> >> --- a/target/riscv/cpu_bits.h
> >> +++ b/target/riscv/cpu_bits.h
> >> @@ -165,6 +165,7 @@
> >>   #define CSR_MCAUSE          0x342
> >>   #define CSR_MTVAL           0x343
> >>   #define CSR_MIP             0x344
> >> +#define CSR_MINTSTATUS      0x346 /* clic-spec-draft */
> >>
> >>   /* Legacy Machine Trap Handling (priv v1.9.1) */
> >>   #define CSR_MBADADDR        0x343
> >> @@ -183,6 +184,7 @@
> >>   #define CSR_SCAUSE          0x142
> >>   #define CSR_STVAL           0x143
> >>   #define CSR_SIP             0x144
> >> +#define CSR_SINTSTATUS      0x146 /* clic-spec-draft */
> >>
> >>   /* Legacy Supervisor Trap Handling (priv v1.9.1) */
> >>   #define CSR_SBADADDR        0x143
> >> @@ -585,6 +587,15 @@
> >>   #define SIP_STIP                           MIP_STIP
> >>   #define SIP_SEIP                           MIP_SEIP
> >>
> >> +/* mintstatus */
> >> +#define MINTSTATUS_MIL                     0xff000000 /* mil[7:0] */
> >> +#define MINTSTATUS_SIL                     0x0000ff00 /* sil[7:0] */
> >> +#define MINTSTATUS_UIL                     0x000000ff /* uil[7:0] */
> >> +
> >> +/* sintstatus */
> >> +#define SINTSTATUS_SIL                     0x0000ff00 /* sil[7:0] */
> >> +#define SINTSTATUS_UIL                     0x000000ff /* uil[7:0] */
> > The bit fields in the comments are out of date.
>
> I didn't notice it.   Fix it in next version.
>
> Thanks.
>
> Zhiwei
>
> >
> > Alistair
> >
> >> +
> >>   /* MIE masks */
> >>   #define MIE_SEIE                           (1 << IRQ_S_EXT)
> >>   #define MIE_UEIE                           (1 << IRQ_U_EXT)
> >> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> >> index d2585395bf..320b18ab60 100644
> >> --- a/target/riscv/csr.c
> >> +++ b/target/riscv/csr.c
> >> @@ -188,6 +188,12 @@ static int pmp(CPURISCVState *env, int csrno)
> >>   {
> >>       return -!riscv_feature(env, RISCV_FEATURE_PMP);
> >>   }
> >> +
> >> +static int clic(CPURISCVState *env, int csrno)
> >> +{
> >> +    return !!env->clic;
> >> +}
> >> +
> >>   #endif
> >>
> >>   /* User Floating-Point CSRs */
> >> @@ -734,6 +740,12 @@ static int rmw_mip(CPURISCVState *env, int csrno,
> target_ulong *ret_value,
> >>       return 0;
> >>   }
> >>
> >> +static int read_mintstatus(CPURISCVState *env, int csrno, target_ulon=
g
> *val)
> >> +{
> >> +    *val =3D env->mintstatus;
> >> +    return 0;
> >> +}
> >> +
> >>   /* Supervisor Trap Setup */
> >>   static int read_sstatus(CPURISCVState *env, int csrno, target_ulong
> *val)
> >>   {
> >> @@ -893,6 +905,13 @@ static int rmw_sip(CPURISCVState *env, int csrno,
> target_ulong *ret_value,
> >>       return ret;
> >>   }
> >>
> >> +static int read_sintstatus(CPURISCVState *env, int csrno, target_ulon=
g
> *val)
> >> +{
> >> +    target_ulong mask =3D SINTSTATUS_SIL | SINTSTATUS_UIL;
> >> +    *val =3D env->mintstatus & mask;
> >> +    return 0;
> >> +}
> >> +
> >>   /* Supervisor Protection and Translation */
> >>   static int read_satp(CPURISCVState *env, int csrno, target_ulong *va=
l)
> >>   {
> >> @@ -1644,5 +1663,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
=3D {
> >>       [CSR_MHPMCOUNTER29H] =3D { "mhpmcounter29h", any32,  read_zero }=
,
> >>       [CSR_MHPMCOUNTER30H] =3D { "mhpmcounter30h", any32,  read_zero }=
,
> >>       [CSR_MHPMCOUNTER31H] =3D { "mhpmcounter31h", any32,  read_zero }=
,
> >> +
> >> +    /* Machine Mode Core Level Interrupt Controller */
> >> +    [CSR_MINTSTATUS] =3D { "mintstatus", clic,  read_mintstatus },
> >> +
> >> +    /* Supervisor Mode Core Level Interrupt Controller */
> >> +    [CSR_SINTSTATUS] =3D { "sintstatus", clic,  read_sintstatus },
> >> +
> >>   #endif /* !CONFIG_USER_ONLY */
> >>   };
> >> --
> >> 2.25.1
> >>
> >>
>
>

--000000000000656bf105c60bdce0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_l=
iu@c-sky.com" target=3D"_blank">zhiwei_liu@c-sky.com</a>&gt; =E6=96=BC 2021=
=E5=B9=B44=E6=9C=8820=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=888:49=E5=
=AF=AB=E9=81=93=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><br>
On 2021/4/20 =E4=B8=8A=E5=8D=887:23, Alistair Francis wrote:<br>
&gt; On Fri, Apr 9, 2021 at 5:52 PM LIU Zhiwei &lt;<a href=3D"mailto:zhiwei=
_liu@c-sky.com" target=3D"_blank">zhiwei_liu@c-sky.com</a>&gt; wrote:<br>
&gt;&gt; CSR mintstatus holds the active interrupt level for each supported=
<br>
&gt;&gt; privilege mode. sintstatus, and user, uintstatus, provide restrict=
ed<br>
&gt;&gt; views of mintstatus.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.c=
om" target=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br=
>
&gt;&gt;=C2=A0 =C2=A0target/riscv/cpu_bits.h | 11 +++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 | 26 ++++++++++=
++++++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A03 files changed, 39 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt;&gt; index 0a33d387ba..1a44ca62c7 100644<br>
&gt;&gt; --- a/target/riscv/cpu.h<br>
&gt;&gt; +++ b/target/riscv/cpu.h<br>
&gt;&gt; @@ -159,6 +159,7 @@ struct CPURISCVState {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong mip;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t miclaim;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t mintstatus; /* clic-spec */<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong mie;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong mideleg;<br>
&gt;&gt; @@ -243,6 +244,7 @@ struct CPURISCVState {<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fields from here on are preserved acr=
oss CPU reset. */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUTimer *timer; /* Internal timer */<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 void *clic;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* clic inter=
rupt controller */<br>
&gt; This should be the CLIC type.<br>
<br>
OK.<br>
<br>
Actually there are many versions of CLIC in my branch as different <br>
devices. But it is better to use CLIC type for the upstream version.<br></b=
lockquote><div><br></div><div>Hi Alistair and Zhiwei,</div><div><br></div><=
div>Replacing void *clic with=C2=A0RISCVCLICState *clic may create a circul=
ar loop</div><div>because CPURISCVState is also referenced in riscv_clic.h.=
</div><div><br></div><div>However, I would like to ask what is the best app=
roach to add</div><div>the reference of CLIC device in CPURISCVState struct=
?</div><div><br></div><div>There may be different kinds of CLIC devices.</d=
iv><div>AFAK, there was another RFC patchset trying to add void *eclic</div=
><div>for Nuclei processor into CPURISCVState struct:</div><div><a href=3D"=
https://patchwork.kernel.org/project/qemu-devel/patch/20210507081654.11056-=
2-wangjunqiang@iscas.ac.cn/">https://patchwork.kernel.org/project/qemu-deve=
l/patch/20210507081654.11056-2-wangjunqiang@iscas.ac.cn/</a><br></div><div>=
<br></div><div>Is it okay to add the device reference directly into CPURISC=
VState struct like that,</div><div>or we should create some abstraction for=
 these CLIC devices?</div><div>(However, I&#39;m not sure how big the diffe=
rences are for these CLIC devices...)<br></div><div><br></div><div>Thanks,<=
/div><div>Frank Chang</div><div>=C2=A0<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
&gt;<br>
&gt;&gt;=C2=A0 =C2=A0};<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,<br>
&gt;&gt; diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
&gt;&gt; index caf4599207..c4ce6ec3d9 100644<br>
&gt;&gt; --- a/target/riscv/cpu_bits.h<br>
&gt;&gt; +++ b/target/riscv/cpu_bits.h<br>
&gt;&gt; @@ -165,6 +165,7 @@<br>
&gt;&gt;=C2=A0 =C2=A0#define CSR_MCAUSE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=
x342<br>
&gt;&gt;=C2=A0 =C2=A0#define CSR_MTVAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x343<br>
&gt;&gt;=C2=A0 =C2=A0#define CSR_MIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x344<br>
&gt;&gt; +#define CSR_MINTSTATUS=C2=A0 =C2=A0 =C2=A0 0x346 /* clic-spec-dra=
ft */<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0/* Legacy Machine Trap Handling (priv v1.9.1) */<br>
&gt;&gt;=C2=A0 =C2=A0#define CSR_MBADADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x343<=
br>
&gt;&gt; @@ -183,6 +184,7 @@<br>
&gt;&gt;=C2=A0 =C2=A0#define CSR_SCAUSE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=
x142<br>
&gt;&gt;=C2=A0 =C2=A0#define CSR_STVAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x143<br>
&gt;&gt;=C2=A0 =C2=A0#define CSR_SIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x144<br>
&gt;&gt; +#define CSR_SINTSTATUS=C2=A0 =C2=A0 =C2=A0 0x146 /* clic-spec-dra=
ft */<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0/* Legacy Supervisor Trap Handling (priv v1.9.1) */<br=
>
&gt;&gt;=C2=A0 =C2=A0#define CSR_SBADADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x143<=
br>
&gt;&gt; @@ -585,6 +587,15 @@<br>
&gt;&gt;=C2=A0 =C2=A0#define SIP_STIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIP_STIP<br>
&gt;&gt;=C2=A0 =C2=A0#define SIP_SEIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIP_SEIP<br>
&gt;&gt;<br>
&gt;&gt; +/* mintstatus */<br>
&gt;&gt; +#define MINTSTATUS_MIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xff000000 /* mil[7:0] */<br>
&gt;&gt; +#define MINTSTATUS_SIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0000ff00 /* sil[7:0] */<br>
&gt;&gt; +#define MINTSTATUS_UIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x000000ff /* uil[7:0] */<br>
&gt;&gt; +<br>
&gt;&gt; +/* sintstatus */<br>
&gt;&gt; +#define SINTSTATUS_SIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0000ff00 /* sil[7:0] */<br>
&gt;&gt; +#define SINTSTATUS_UIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x000000ff /* uil[7:0] */<br>
&gt; The bit fields in the comments are out of date.<br>
<br>
I didn&#39;t notice it.=C2=A0=C2=A0 Fix it in next version.<br>
<br>
Thanks.<br>
<br>
Zhiwei<br>
<br>
&gt;<br>
&gt; Alistair<br>
&gt;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0/* MIE masks */<br>
&gt;&gt;=C2=A0 =C2=A0#define MIE_SEIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_=
S_EXT)<br>
&gt;&gt;=C2=A0 =C2=A0#define MIE_UEIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_=
U_EXT)<br>
&gt;&gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
&gt;&gt; index d2585395bf..320b18ab60 100644<br>
&gt;&gt; --- a/target/riscv/csr.c<br>
&gt;&gt; +++ b/target/riscv/csr.c<br>
&gt;&gt; @@ -188,6 +188,12 @@ static int pmp(CPURISCVState *env, int csrno)=
<br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return -!riscv_feature(env, RISCV_FEATUR=
E_PMP);<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +static int clic(CPURISCVState *env, int csrno)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 return !!env-&gt;clic;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0#endif<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0/* User Floating-Point CSRs */<br>
&gt;&gt; @@ -734,6 +740,12 @@ static int rmw_mip(CPURISCVState *env, int cs=
rno, target_ulong *ret_value,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; +static int read_mintstatus(CPURISCVState *env, int csrno, target_=
ulong *val)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 *val =3D env-&gt;mintstatus;<br>
&gt;&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0/* Supervisor Trap Setup */<br>
&gt;&gt;=C2=A0 =C2=A0static int read_sstatus(CPURISCVState *env, int csrno,=
 target_ulong *val)<br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt; @@ -893,6 +905,13 @@ static int rmw_sip(CPURISCVState *env, int cs=
rno, target_ulong *ret_value,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; +static int read_sintstatus(CPURISCVState *env, int csrno, target_=
ulong *val)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 target_ulong mask =3D SINTSTATUS_SIL | SINTSTATUS_U=
IL;<br>
&gt;&gt; +=C2=A0 =C2=A0 *val =3D env-&gt;mintstatus &amp; mask;<br>
&gt;&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0/* Supervisor Protection and Translation */<br>
&gt;&gt;=C2=A0 =C2=A0static int read_satp(CPURISCVState *env, int csrno, ta=
rget_ulong *val)<br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt; @@ -1644,5 +1663,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE=
] =3D {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[CSR_MHPMCOUNTER29H] =3D { &quot;mhpmcou=
nter29h&quot;, any32,=C2=A0 read_zero },<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[CSR_MHPMCOUNTER30H] =3D { &quot;mhpmcou=
nter30h&quot;, any32,=C2=A0 read_zero },<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[CSR_MHPMCOUNTER31H] =3D { &quot;mhpmcou=
nter31h&quot;, any32,=C2=A0 read_zero },<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Machine Mode Core Level Interrupt Controller */<=
br>
&gt;&gt; +=C2=A0 =C2=A0 [CSR_MINTSTATUS] =3D { &quot;mintstatus&quot;, clic=
,=C2=A0 read_mintstatus },<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Supervisor Mode Core Level Interrupt Controller =
*/<br>
&gt;&gt; +=C2=A0 =C2=A0 [CSR_SINTSTATUS] =3D { &quot;sintstatus&quot;, clic=
,=C2=A0 read_sintstatus },<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0#endif /* !CONFIG_USER_ONLY */<br>
&gt;&gt;=C2=A0 =C2=A0};<br>
&gt;&gt; --<br>
&gt;&gt; 2.25.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
<br>
</blockquote></div></div>

--000000000000656bf105c60bdce0--

