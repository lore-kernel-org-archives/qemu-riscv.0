Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nh5C4-000274-7K
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 03:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nh5C3-00025q-CV
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 03:56:07 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:42633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nh5Bz-0007mw-9j
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 03:56:07 -0400
Received: by mail-ej1-x62d.google.com with SMTP id i27so1772136ejd.9
 for <qemu-riscv@nongnu.org>; Wed, 20 Apr 2022 00:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wy/V4/ITPLBx0CCMVYtmeSh7ahlpuCm3KbrN/i32Cyo=;
 b=kdVkBpal0IxGQc1pHeT7f4XC1MRoWTuPHCEV/HOuIk4Abi7QPHCA5XlM9JUKIPUqQn
 Aa1GLe21OFnbNAHo/n9wvuqpyZVQG4Ht6vfV+As3yYPzb6yXkJ0Yf56Hm9hlM7I/ALDg
 11bqiLaU2Qr5FG1uoeu7F81T8mE+0Yfl/g3V/S/4xzLC/i71GTWueH9QgoE9QE+lAVnO
 FoC710eZHTwbHIp9XQOHQG72R7H0H1FoJ0LSJ6sKEwc9JApCwKWCGeQ5QWNpfHQYsA2x
 5YAZWkq2evcy6CdyBjP0iAQPn30uCUbdhmuOX2aQugid3xhEcn/78QBmmStefR310Q7J
 LxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wy/V4/ITPLBx0CCMVYtmeSh7ahlpuCm3KbrN/i32Cyo=;
 b=ZrmOZ+/7NGfp/kd7ynMIgo/4VTpMahZZZUGxa1aUe6JDdNytrw/RNHYPJJgNemKRpM
 Cmd0zxZutlOtAXw6R0gIYEaIEeHcfegkcDF1fuC3iROaWsHj9GzjGyeBn1X7dye080sn
 v9h6uaFgdfxUkdy7kuoemmnyHcKuUh0ignDg7n8sUB/GvMYL/z+fEtp4zSIhb1bhqCil
 aCAq+h+KoveMiWhjuGmVXcXPHc/WZPz+STG57nQjVTZkM7sMIqMHSB4UvtqNdJprLvq3
 Op17g0hxq09BjTrCOO6j7zr27ZuEY1uwyd0rzyIBJ85Qjm/fMgM6SjID70p+SNmw02Es
 J5Tw==
X-Gm-Message-State: AOAM531hTCVMQEqPjR0Fx1pr9uaAGvBHCr33s3YoTDyYYbyEm9+A3cYL
 aMIVsbpmNd4e0IqZgBfEvHPlRAR7ssJmn0yiGWmzsA==
X-Google-Smtp-Source: ABdhPJwbk2hvV9LbxeXQS9wrHutIixIhcedGj7v40K737iy+rXW7jIjaoeMe9ZIzQUalxGHvC7xtltAaw3DwdnFXSRU=
X-Received: by 2002:a17:907:e8d:b0:6ec:d77:43bc with SMTP id
 ho13-20020a1709070e8d00b006ec0d7743bcmr17135393ejc.201.1650441361818; Wed, 20
 Apr 2022 00:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220415093727.15323-1-frank.chang@sifive.com>
 <CAKmqyKP=kgiH05o_h1FS=acz_fsU9QkvAQ-yHa05knrnh9H-Jg@mail.gmail.com>
 <CAK9=C2UF4mR17a2---02==MaSZJLCS1Fnryd2yg_u45T9rm4mg@mail.gmail.com>
 <CAE_xrPiK6uigny61dFOFcUiNN8w3ohOba0Vo26NSyQjOb30PSg@mail.gmail.com>
 <CAE_xrPjhNC2-XHydZ-1GBZSMvz-+qCm_ohVR16Z7WjRFRCQrKw@mail.gmail.com>
 <CAKmqyKOp0WJifR4VeCv-q3O58EXmvC684c6Td79Oe4m665s0gw@mail.gmail.com>
In-Reply-To: <CAKmqyKOp0WJifR4VeCv-q3O58EXmvC684c6Td79Oe4m665s0gw@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 20 Apr 2022 15:55:50 +0800
Message-ID: <CAE_xrPg5C=-7XSDVhhLpOoCPeUAhO9VBZxtjgr1JX2jg0iHBpw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Support configuarable marchid, mvendorid,
 mipid CSR values
To: Alistair Francis <alistair23@gmail.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jim Shu <jim.shu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: multipart/alternative; boundary="00000000000018233805dd1153f8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-ej1-x62d.google.com
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
X-List-Received-Date: Wed, 20 Apr 2022 07:56:07 -0000

--00000000000018233805dd1153f8
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 20, 2022 at 3:47 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Tue, Apr 19, 2022 at 5:04 PM Frank Chang <frank.chang@sifive.com>
> wrote:
> >
> > On Tue, Apr 19, 2022 at 2:00 PM Frank Chang <frank.chang@sifive.com>
> wrote:
> >>
> >> On Tue, Apr 19, 2022 at 1:27 PM Anup Patel <apatel@ventanamicro.com>
> wrote:
> >>>
> >>> On Tue, Apr 19, 2022 at 10:52 AM Alistair Francis <
> alistair23@gmail.com> wrote:
> >>> >
> >>> > On Fri, Apr 15, 2022 at 7:37 PM <frank.chang@sifive.com> wrote:
> >>> > >
> >>> > > From: Frank Chang <frank.chang@sifive.com>
> >>> > >
> >>> > > Allow user to set core's marchid, mvendorid, mipid CSRs through
> >>> > > -cpu command line option.
> >>> > >
> >>> > > Signed-off-by: Frank Chang <frank.chang@sifive.com>
> >>> > > Reviewed-by: Jim Shu <jim.shu@sifive.com>
> >>> > > ---
> >>> > >  target/riscv/cpu.c |  4 ++++
> >>> > >  target/riscv/cpu.h |  4 ++++
> >>> > >  target/riscv/csr.c | 38 ++++++++++++++++++++++++++++++++++----
> >>> > >  3 files changed, 42 insertions(+), 4 deletions(-)
> >>> > >
> >>> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >>> > > index ddda4906ff..2eea0f9be7 100644
> >>> > > --- a/target/riscv/cpu.c
> >>> > > +++ b/target/riscv/cpu.c
> >>> > > @@ -786,6 +786,10 @@ static Property riscv_cpu_properties[] = {
> >>> > >      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> >>> > >      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> >>> > >
> >>> > > +    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
> >>> > > +    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, 0),
> >>> > > +    DEFINE_PROP_UINT64("mipid", RISCVCPU, cfg.mipid, 0),
> >>> >
> >>> > Should we have non-zero defaults here?
> >>>
> >>> To do that, we need mvendorid for QEMU RISC-V.
> >>>
> >>> The marchid and mipid can be based on the QEMU version number.
> >>>
> >>> Regards,
> >>> Anup
> >>
> >>
> >> The original intention for this patch is to allow users to define
> >> their own $mvendorid, $marchid, and $mipid through the command line
> >> when they initiate QEMU.
> >>
> >> If we want to provide the default values for QEMU RISC-V CPU,
> >> just like what Anup said.
> >> We need to define our own mvendorid, which should be a JEDEC
> manufacturer ID.
> >> (Perhaps it's fine to just give some random legal JEDEC manufacturer ID
> >> as I don't think we would really want to spend the money on that.)
>
> This is fine as zero I think.
>
> >>
> >> For $marchid and $mipid,
> >> I agree that it could base on QEMU's version from the QEMU_FULL_VERSION
> macro.
> >> (and $marchid should have MSB set to 1 for open-source projects.)
>
> There could be some use in setting this to the QEMU version by
> default. It doesn't really get us much though, but might be useful.
>
> I'll take this patch as is, feel free to send a new patch if you want
> to add a default value
>
> Alistair
>

Sure, I'll set QEMU version by default in the next version patchset.

Regards,
Frank Chang


>
> >>
> >> Regards,
> >> Frank Chang
> >
> >
> > Another simpler way is to stick with the current approach
> > and leave $mvendorid, $marchid and $mipid default to 0.
> > Which is still legal as RISC-V privilege spec says:
> > "A value of 0 can be returned to indicate the field is not implemented."
> >
> > Regards,
> > Frank Chang
> >
> >>
> >>
> >>>
> >>>
> >>> >
> >>> > Alistair
> >>> >
> >>> > > +
> >>> > >      DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
> >>> > >      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
> >>> > >      DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
> >>> > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >>> > > index c069fe85fa..3ab92deb4b 100644
> >>> > > --- a/target/riscv/cpu.h
> >>> > > +++ b/target/riscv/cpu.h
> >>> > > @@ -370,6 +370,10 @@ struct RISCVCPUConfig {
> >>> > >      bool ext_zve32f;
> >>> > >      bool ext_zve64f;
> >>> > >
> >>> > > +    uint32_t mvendorid;
> >>> > > +    uint64_t marchid;
> >>> > > +    uint64_t mipid;
> >>> > > +
> >>> > >      /* Vendor-specific custom extensions */
> >>> > >      bool ext_XVentanaCondOps;
> >>> > >
> >>> > > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> >>> > > index 341c2e6f23..9a02038adb 100644
> >>> > > --- a/target/riscv/csr.c
> >>> > > +++ b/target/riscv/csr.c
> >>> > > @@ -603,6 +603,36 @@ static RISCVException
> write_ignore(CPURISCVState *env, int csrno,
> >>> > >      return RISCV_EXCP_NONE;
> >>> > >  }
> >>> > >
> >>> > > +static RISCVException read_mvendorid(CPURISCVState *env, int
> csrno,
> >>> > > +                                     target_ulong *val)
> >>> > > +{
> >>> > > +    CPUState *cs = env_cpu(env);
> >>> > > +    RISCVCPU *cpu = RISCV_CPU(cs);
> >>> > > +
> >>> > > +    *val = cpu->cfg.mvendorid;
> >>> > > +    return RISCV_EXCP_NONE;
> >>> > > +}
> >>> > > +
> >>> > > +static RISCVException read_marchid(CPURISCVState *env, int csrno,
> >>> > > +                                   target_ulong *val)
> >>> > > +{
> >>> > > +    CPUState *cs = env_cpu(env);
> >>> > > +    RISCVCPU *cpu = RISCV_CPU(cs);
> >>> > > +
> >>> > > +    *val = cpu->cfg.marchid;
> >>> > > +    return RISCV_EXCP_NONE;
> >>> > > +}
> >>> > > +
> >>> > > +static RISCVException read_mipid(CPURISCVState *env, int csrno,
> >>> > > +                                 target_ulong *val)
> >>> > > +{
> >>> > > +    CPUState *cs = env_cpu(env);
> >>> > > +    RISCVCPU *cpu = RISCV_CPU(cs);
> >>> > > +
> >>> > > +    *val = cpu->cfg.mipid;
> >>> > > +    return RISCV_EXCP_NONE;
> >>> > > +}
> >>> > > +
> >>> > >  static RISCVException read_mhartid(CPURISCVState *env, int csrno,
> >>> > >                                     target_ulong *val)
> >>> > >  {
> >>> > > @@ -3098,10 +3128,10 @@ riscv_csr_operations
> csr_ops[CSR_TABLE_SIZE] = {
> >>> > >      [CSR_MINSTRETH] = { "minstreth", any32, read_instreth },
> >>> > >
> >>> > >      /* Machine Information Registers */
> >>> > > -    [CSR_MVENDORID] = { "mvendorid", any,   read_zero    },
> >>> > > -    [CSR_MARCHID]   = { "marchid",   any,   read_zero    },
> >>> > > -    [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
> >>> > > -    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
> >>> > > +    [CSR_MVENDORID] = { "mvendorid", any,   read_mvendorid },
> >>> > > +    [CSR_MARCHID]   = { "marchid",   any,   read_marchid   },
> >>> > > +    [CSR_MIMPID]    = { "mimpid",    any,   read_mipid     },
> >>> > > +    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid   },
> >>> > >
> >>> > >      /* Machine Trap Setup */
> >>> > >      [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,
>  write_mstatus, NULL,
> >>> > > --
> >>> > > 2.35.1
> >>> > >
> >>> > >
> >>> >
>

--00000000000018233805dd1153f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Apr 20, 2022 at 3:47 PM Alistair =
Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Tue, Apr 19, 2022 at 5:04 PM Frank Chang &lt;<a =
href=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive=
.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Apr 19, 2022 at 2:00 PM Frank Chang &lt;<a href=3D"mailto:fran=
k.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Apr 19, 2022 at 1:27 PM Anup Patel &lt;<a href=3D"mailto:a=
patel@ventanamicro.com" target=3D"_blank">apatel@ventanamicro.com</a>&gt; w=
rote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Tue, Apr 19, 2022 at 10:52 AM Alistair Francis &lt;<a href=
=3D"mailto:alistair23@gmail.com" target=3D"_blank">alistair23@gmail.com</a>=
&gt; wrote:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; On Fri, Apr 15, 2022 at 7:37 PM &lt;<a href=3D"mailto:fra=
nk.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt; wrote=
:<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; From: Frank Chang &lt;<a href=3D"mailto:frank.chang@=
sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; Allow user to set core&#39;s marchid, mvendorid, mip=
id CSRs through<br>
&gt;&gt;&gt; &gt; &gt; -cpu command line option.<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; Signed-off-by: Frank Chang &lt;<a href=3D"mailto:fra=
nk.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt;&gt;&gt; &gt; &gt; Reviewed-by: Jim Shu &lt;<a href=3D"mailto:jim.shu@s=
ifive.com" target=3D"_blank">jim.shu@sifive.com</a>&gt;<br>
&gt;&gt;&gt; &gt; &gt; ---<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 target/riscv/cpu.c |=C2=A0 4 ++++<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 target/riscv/cpu.h |=C2=A0 4 ++++<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 target/riscv/csr.c | 38 ++++++++++++++++++++++=
++++++++++++----<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 3 files changed, 42 insertions(+), 4 deletions=
(-)<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c=
<br>
&gt;&gt;&gt; &gt; &gt; index ddda4906ff..2eea0f9be7 100644<br>
&gt;&gt;&gt; &gt; &gt; --- a/target/riscv/cpu.c<br>
&gt;&gt;&gt; &gt; &gt; +++ b/target/riscv/cpu.c<br>
&gt;&gt;&gt; &gt; &gt; @@ -786,6 +786,10 @@ static Property riscv_cpu_prope=
rties[] =3D {<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_UINT16(&quot;vlen&qu=
ot;, RISCVCPU, cfg.vlen, 128),<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_UINT16(&quot;elen&qu=
ot;, RISCVCPU, cfg.elen, 64),<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;mvendorid&qu=
ot;, RISCVCPU, cfg.mvendorid, 0),<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;marchid&quot=
;, RISCVCPU, cfg.marchid, 0),<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;mipid&quot;,=
 RISCVCPU, cfg.mipid, 0),<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Should we have non-zero defaults here?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; To do that, we need mvendorid for QEMU RISC-V.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The marchid and mipid can be based on the QEMU version number.=
<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt; Anup<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; The original intention for this patch is to allow users to define<=
br>
&gt;&gt; their own $mvendorid, $marchid, and $mipid through the command lin=
e<br>
&gt;&gt; when they initiate QEMU.<br>
&gt;&gt;<br>
&gt;&gt; If we want to provide the default values for QEMU RISC-V CPU,<br>
&gt;&gt; just like what Anup said.<br>
&gt;&gt; We need to define our own mvendorid, which should be a JEDEC manuf=
acturer ID.<br>
&gt;&gt; (Perhaps it&#39;s fine to just give some random legal JEDEC manufa=
cturer ID<br>
&gt;&gt; as I don&#39;t think we would really want to spend the money on th=
at.)<br>
<br>
This is fine as zero I think.<br>
<br>
&gt;&gt;<br>
&gt;&gt; For $marchid and $mipid,<br>
&gt;&gt; I agree that it could base on QEMU&#39;s version from the QEMU_FUL=
L_VERSION macro.<br>
&gt;&gt; (and $marchid should have MSB set to 1 for open-source projects.)<=
br>
<br>
There could be some use in setting this to the QEMU version by<br>
default. It doesn&#39;t really get us much though, but might be useful.<br>
<br>
I&#39;ll take this patch as is, feel free to send a new patch if you want<b=
r>
to add a default value<br>
<br>
Alistair<br></blockquote><div><br></div><div>Sure, I&#39;ll set QEMU versio=
n by default in the next version patchset.</div><div><br></div><div>Regards=
,</div><div>Frank Chang</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Frank Chang<br>
&gt;<br>
&gt;<br>
&gt; Another simpler way is to stick with the current approach<br>
&gt; and leave $mvendorid, $marchid and $mipid default to 0.<br>
&gt; Which is still legal as RISC-V privilege spec says:<br>
&gt; &quot;A value of 0 can be returned to indicate the field is not implem=
ented.&quot;<br>
&gt;<br>
&gt; Regards,<br>
&gt; Frank Chang<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Alistair<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; +<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;svinval&q=
uot;, RISCVCPU, cfg.ext_svinval, false),<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;svnapot&q=
uot;, RISCVCPU, cfg.ext_svnapot, false),<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;svpbmt&qu=
ot;, RISCVCPU, cfg.ext_svpbmt, false),<br>
&gt;&gt;&gt; &gt; &gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h=
<br>
&gt;&gt;&gt; &gt; &gt; index c069fe85fa..3ab92deb4b 100644<br>
&gt;&gt;&gt; &gt; &gt; --- a/target/riscv/cpu.h<br>
&gt;&gt;&gt; &gt; &gt; +++ b/target/riscv/cpu.h<br>
&gt;&gt;&gt; &gt; &gt; @@ -370,6 +370,10 @@ struct RISCVCPUConfig {<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 bool ext_zve32f;<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 bool ext_zve64f;<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 uint32_t mvendorid;<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 uint64_t marchid;<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 uint64_t mipid;<br>
&gt;&gt;&gt; &gt; &gt; +<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* Vendor-specific custom extens=
ions */<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 bool ext_XVentanaCondOps;<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c=
<br>
&gt;&gt;&gt; &gt; &gt; index 341c2e6f23..9a02038adb 100644<br>
&gt;&gt;&gt; &gt; &gt; --- a/target/riscv/csr.c<br>
&gt;&gt;&gt; &gt; &gt; +++ b/target/riscv/csr.c<br>
&gt;&gt;&gt; &gt; &gt; @@ -603,6 +603,36 @@ static RISCVException write_ign=
ore(CPURISCVState *env, int csrno,<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 }<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; +static RISCVException read_mvendorid(CPURISCVState =
*env, int csrno,<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0target_ulong *val)<br>
&gt;&gt;&gt; &gt; &gt; +{<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
&gt;&gt;&gt; &gt; &gt; +<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 *val =3D cpu-&gt;cfg.mvendorid;<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;&gt;&gt; &gt; &gt; +}<br>
&gt;&gt;&gt; &gt; &gt; +<br>
&gt;&gt;&gt; &gt; &gt; +static RISCVException read_marchid(CPURISCVState *e=
nv, int csrno,<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0target_ulong *val)<br>
&gt;&gt;&gt; &gt; &gt; +{<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
&gt;&gt;&gt; &gt; &gt; +<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 *val =3D cpu-&gt;cfg.marchid;<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;&gt;&gt; &gt; &gt; +}<br>
&gt;&gt;&gt; &gt; &gt; +<br>
&gt;&gt;&gt; &gt; &gt; +static RISCVException read_mipid(CPURISCVState *env=
, int csrno,<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=
_ulong *val)<br>
&gt;&gt;&gt; &gt; &gt; +{<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
&gt;&gt;&gt; &gt; &gt; +<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 *val =3D cpu-&gt;cfg.mipid;<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;&gt;&gt; &gt; &gt; +}<br>
&gt;&gt;&gt; &gt; &gt; +<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 static RISCVException read_mhartid(CPURISCVSta=
te *env, int csrno,<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0target_ulong *val)<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 {<br>
&gt;&gt;&gt; &gt; &gt; @@ -3098,10 +3128,10 @@ riscv_csr_operations csr_ops=
[CSR_TABLE_SIZE] =3D {<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 [CSR_MINSTRETH] =3D { &quot;mins=
treth&quot;, any32, read_instreth },<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* Machine Information Registers=
 */<br>
&gt;&gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 [CSR_MVENDORID] =3D { &quot;mvendorid=
&quot;, any,=C2=A0 =C2=A0read_zero=C2=A0 =C2=A0 },<br>
&gt;&gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 [CSR_MARCHID]=C2=A0 =C2=A0=3D { &quot=
;marchid&quot;,=C2=A0 =C2=A0any,=C2=A0 =C2=A0read_zero=C2=A0 =C2=A0 },<br>
&gt;&gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 [CSR_MIMPID]=C2=A0 =C2=A0 =3D { &quot=
;mimpid&quot;,=C2=A0 =C2=A0 any,=C2=A0 =C2=A0read_zero=C2=A0 =C2=A0 },<br>
&gt;&gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 [CSR_MHARTID]=C2=A0 =C2=A0=3D { &quot=
;mhartid&quot;,=C2=A0 =C2=A0any,=C2=A0 =C2=A0read_mhartid },<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 [CSR_MVENDORID] =3D { &quot;mvendorid=
&quot;, any,=C2=A0 =C2=A0read_mvendorid },<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 [CSR_MARCHID]=C2=A0 =C2=A0=3D { &quot=
;marchid&quot;,=C2=A0 =C2=A0any,=C2=A0 =C2=A0read_marchid=C2=A0 =C2=A0},<br=
>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 [CSR_MIMPID]=C2=A0 =C2=A0 =3D { &quot=
;mimpid&quot;,=C2=A0 =C2=A0 any,=C2=A0 =C2=A0read_mipid=C2=A0 =C2=A0 =C2=A0=
},<br>
&gt;&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 [CSR_MHARTID]=C2=A0 =C2=A0=3D { &quot=
;mhartid&quot;,=C2=A0 =C2=A0any,=C2=A0 =C2=A0read_mhartid=C2=A0 =C2=A0},<br=
>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* Machine Trap Setup */<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 [CSR_MSTATUS]=C2=A0 =C2=A0 =C2=
=A0=3D { &quot;mstatus&quot;,=C2=A0 =C2=A0 any,=C2=A0 =C2=A0read_mstatus,=
=C2=A0 =C2=A0 =C2=A0write_mstatus, NULL,<br>
&gt;&gt;&gt; &gt; &gt; --<br>
&gt;&gt;&gt; &gt; &gt; 2.35.1<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt;<br>
</blockquote></div></div>

--00000000000018233805dd1153f8--

