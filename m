Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nkfk8-0006NG-CJ
	for mharc-qemu-riscv@gnu.org; Sat, 30 Apr 2022 01:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nkfk6-0006Jn-MC
 for qemu-riscv@nongnu.org; Sat, 30 Apr 2022 01:34:06 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:37387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nkfk2-000726-RQ
 for qemu-riscv@nongnu.org; Sat, 30 Apr 2022 01:34:05 -0400
Received: by mail-ed1-x52c.google.com with SMTP id k27so11167885edk.4
 for <qemu-riscv@nongnu.org>; Fri, 29 Apr 2022 22:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mYtK/9ObfBzy4Wm98WZwJJW/RBU/zx3F8I0Fa0KHgx4=;
 b=Qqmd7L5NS/echj0yjHXDCsNSUhyIwFvx5ZKHg+a6T5o7V7yR/T3iYT00ZGzDoYlJG7
 UDkgW0KgcVV6BJ4cKRibmzLU04yMMMeB2Oy9+bqdna4UaqZKt96mGVvE8dcuScSLTW+I
 6dbTJD3WEKCO+zV5KdOb5pMmg+WFPyG7g0SwWpkb551/AmcGZE1rkg5y5h/zElOmCHtQ
 FKVqz/IH1r3q4I5KkUHKRzEkeH9FnWuQ2fpy8FJE2vf0eJmXgEcb4EKnkF0a8qY66q3T
 5dbduYOlGnRE/C/wk/m5yUxpy2uvN7gDApWe97FEjcJEk96f4QvPdIcpv575hTgZ+3II
 UUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mYtK/9ObfBzy4Wm98WZwJJW/RBU/zx3F8I0Fa0KHgx4=;
 b=zl8Yxhzy8h9xXPiK8K4bULPyVUryHKvKG2vLlZJ69irdub7NhVmqlexHO7sg/rdz63
 I8tgKPOFSuaZ8HgtYC5/U9m7TBvATCIVWhcqPfDHeNJGno3quUpGtSYhHYlZxXB5Etxu
 Zb9q8qkH1bzXiBB7XM4jKSnWCoTDJXUzz8g9kupPsITYpQov0FxxWuDu48pirOlLnmOw
 xq3mzi8kxDWdhttm5Ct8dsV9mjsLhdbUoq91O7twp2HWlLQIkFNRdC/u47AdJy4N+Buk
 i4FxGcxlmYKeIZEeUViYhs/iEWlUwF6SW0SM6ebA0BqCnWmLOK2Fkqf23NAgXkLzfqeF
 BdCA==
X-Gm-Message-State: AOAM531Ymir54W/Psz2s8zXq2LrlXmSz5RDFndh7Fv2v4Vbxc9fHsTwm
 9Gzu5lm7errz5BMlJvsvU/LruiGHy2tLwyI7D430EQ==
X-Google-Smtp-Source: ABdhPJywsiwAzh4D+p5p4IT958HjQr47xWoWYUGWQDdu+TcUSHg2M4G8Or2lJdfsUGxk38JW+/JtwlNEtKyOOpPkhUg=
X-Received: by 2002:a05:6402:1e88:b0:412:fc6b:f271 with SMTP id
 f8-20020a0564021e8800b00412fc6bf271mr2890134edf.345.1651296837628; Fri, 29
 Apr 2022 22:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220429153431.308829-1-apatel@ventanamicro.com>
 <20220429153431.308829-4-apatel@ventanamicro.com>
 <CANzO1D1M-wH-r-T58E9qJ7X5MTruiAXP87UdYikWanrXgswuJA@mail.gmail.com>
 <CAAhSdy27e84WXJ8fKjzN9RxRoPvz5gmwUN3na2cMFGuJ5TpjAg@mail.gmail.com>
In-Reply-To: <CAAhSdy27e84WXJ8fKjzN9RxRoPvz5gmwUN3na2cMFGuJ5TpjAg@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sat, 30 Apr 2022 13:33:45 +0800
Message-ID: <CAE_xrPgxurTsym2oNt_4iXGYyZHL9O1i2k9BZ+Cnipt9PdjNEQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/riscv: Consider priv spec version when
 generating ISA string
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: multipart/alternative; boundary="0000000000006d08b005ddd88104"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=frank.chang@sifive.com; helo=mail-ed1-x52c.google.com
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
X-List-Received-Date: Sat, 30 Apr 2022 05:34:07 -0000

--0000000000006d08b005ddd88104
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 30, 2022 at 12:30 PM Anup Patel <anup@brainfault.org> wrote:

> On Sat, Apr 30, 2022 at 8:39 AM Frank Chang <frank.chang@sifive.com>
> wrote:
> >
> > Hi Anup,
> >
> > If we want to limit the generated ISA string to/after a specific
> privilege spec version.
> > Shouldn't we also check the privilege spec version when these extensions
> are enabled?
> > Otherwise, it's possible that one extension is enabled,
> > but the privilege spec version is smaller than the one in which the
> extension is supported.
> > (This is possible if user specifies the privileged spec version through
> the command line.)
> > The ISA string therefore won't include the enabled extension.
>
> This patch is only a temporary fix for the sifive_u machine where I am
> seeing some
> of these new extensions available in ISA string.
>
> We need a separate series to have the priv spec version influence
> individual extension
> enabling/disabling.
>

If that's the case,
Reviewed-by: Frank Chang <frank.chang@sifive.com>


>
> Regards,
> Anup
>
> >
> > Regards,
> > Frank Chang
> >
> >
> > On Fri, Apr 29, 2022 at 11:49 PM Anup Patel <apatel@ventanamicro.com>
> wrote:
> >>
> >> Most of the multi-letter extensions (such as Svpbmt, Svnapot, Svinval,
> >> etc) are only available after Priv spec v1.12 so ISA string generation
> >> should check the minimum required priv spec version for all extensions.
> >>
> >> Fixes: a775398be2e ("target/riscv: Add isa extenstion strings to the
> >> device tree")
> >> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> >> ---
> >>  target/riscv/cpu.c | 36 +++++++++++++++++++-----------------
> >>  1 file changed, 19 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index 02ee7d45d8..d8c88b96bc 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -44,6 +44,7 @@ static const char riscv_single_letter_exts[] =
> "IEMAFDQCPVH";
> >>  struct isa_ext_data {
> >>      const char *name;
> >>      bool enabled;
> >> +    uint32_t min_priv_ver;
> >>  };
> >>
> >>  const char * const riscv_int_regnames[] = {
> >> @@ -974,7 +975,7 @@ static void riscv_cpu_class_init(ObjectClass *c,
> void *data)
> >>      device_class_set_props(dc, riscv_cpu_properties);
> >>  }
> >>
> >> -#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
> >> +#define ISA_EDATA_ENTRY(name, prop, priv) {#name, cpu->cfg.prop, priv}
> >>
> >>  static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int
> max_str_len)
> >>  {
> >> @@ -1000,25 +1001,26 @@ static void riscv_isa_string_ext(RISCVCPU *cpu,
> char **isa_str, int max_str_len)
> >>       *    extensions by an underscore.
> >>       */
> >>      struct isa_ext_data isa_edata_arr[] = {
> >> -        ISA_EDATA_ENTRY(zfh, ext_zfh),
> >> -        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
> >> -        ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> >> -        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
> >> -        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
> >> -        ISA_EDATA_ENTRY(zdinx, ext_zdinx),
> >> -        ISA_EDATA_ENTRY(zba, ext_zba),
> >> -        ISA_EDATA_ENTRY(zbb, ext_zbb),
> >> -        ISA_EDATA_ENTRY(zbc, ext_zbc),
> >> -        ISA_EDATA_ENTRY(zbs, ext_zbs),
> >> -        ISA_EDATA_ENTRY(zve32f, ext_zve32f),
> >> -        ISA_EDATA_ENTRY(zve64f, ext_zve64f),
> >> -        ISA_EDATA_ENTRY(svinval, ext_svinval),
> >> -        ISA_EDATA_ENTRY(svnapot, ext_svnapot),
> >> -        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
> >> +        ISA_EDATA_ENTRY(zfh, ext_zfh, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zfinx, ext_zfinx, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zhinx, ext_zhinx, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zdinx, ext_zdinx, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zba, ext_zba, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zbb, ext_zbb, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zbc, ext_zbc, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zbs, ext_zbs, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zve32f, ext_zve32f, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zve64f, ext_zve64f, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(svinval, ext_svinval, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(svnapot, ext_svnapot, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt, PRIV_VERSION_1_12_0),
> >>      };
> >>
> >>      for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> >> -        if (isa_edata_arr[i].enabled) {
> >> +        if (isa_edata_arr[i].enabled &&
> >> +            cpu->env.priv_ver >= isa_edata_arr[i].min_priv_ver) {
> >>              new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
> >>              g_free(old);
> >>              old = new;
> >> --
> >> 2.34.1
> >>
> >>
>

--0000000000006d08b005ddd88104
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Apr 30, 2022 at 12:30 PM Anup Pat=
el &lt;<a href=3D"mailto:anup@brainfault.org">anup@brainfault.org</a>&gt; w=
rote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Sat, Apr 30, 2022 at 8:39 AM Frank Chang &lt;<a href=3D=
"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a=
>&gt; wrote:<br>
&gt;<br>
&gt; Hi Anup,<br>
&gt;<br>
&gt; If we want to limit the generated ISA string to/after a specific privi=
lege spec version.<br>
&gt; Shouldn&#39;t we also check the privilege spec version when these exte=
nsions are enabled?<br>
&gt; Otherwise, it&#39;s possible that one extension is enabled,<br>
&gt; but the privilege spec version is smaller than the one in which the ex=
tension is supported.<br>
&gt; (This is possible if user specifies the privileged spec version throug=
h the command line.)<br>
&gt; The ISA string therefore won&#39;t include the enabled extension.<br>
<br>
This patch is only a temporary fix for the sifive_u machine where I am<br>
seeing some<br>
of these new extensions available in ISA string.<br>
<br>
We need a separate series to have the priv spec version influence<br>
individual extension<br>
enabling/disabling.<br></blockquote><div><br></div><div>If that&#39;s the c=
ase,</div><div>Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@s=
ifive.com">frank.chang@sifive.com</a>&gt;</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
Anup<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Frank Chang<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Apr 29, 2022 at 11:49 PM Anup Patel &lt;<a href=3D"mailto:apat=
el@ventanamicro.com" target=3D"_blank">apatel@ventanamicro.com</a>&gt; wrot=
e:<br>
&gt;&gt;<br>
&gt;&gt; Most of the multi-letter extensions (such as Svpbmt, Svnapot, Svin=
val,<br>
&gt;&gt; etc) are only available after Priv spec v1.12 so ISA string genera=
tion<br>
&gt;&gt; should check the minimum required priv spec version for all extens=
ions.<br>
&gt;&gt;<br>
&gt;&gt; Fixes: a775398be2e (&quot;target/riscv: Add isa extenstion strings=
 to the<br>
&gt;&gt; device tree&quot;)<br>
&gt;&gt; Signed-off-by: Anup Patel &lt;<a href=3D"mailto:apatel@ventanamicr=
o.com" target=3D"_blank">apatel@ventanamicro.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 target/riscv/cpu.c | 36 +++++++++++++++++++-----------------=
<br>
&gt;&gt;=C2=A0 1 file changed, 19 insertions(+), 17 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt;&gt; index 02ee7d45d8..d8c88b96bc 100644<br>
&gt;&gt; --- a/target/riscv/cpu.c<br>
&gt;&gt; +++ b/target/riscv/cpu.c<br>
&gt;&gt; @@ -44,6 +44,7 @@ static const char riscv_single_letter_exts[] =3D=
 &quot;IEMAFDQCPVH&quot;;<br>
&gt;&gt;=C2=A0 struct isa_ext_data {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 const char *name;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 bool enabled;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t min_priv_ver;<br>
&gt;&gt;=C2=A0 };<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 const char * const riscv_int_regnames[] =3D {<br>
&gt;&gt; @@ -974,7 +975,7 @@ static void riscv_cpu_class_init(ObjectClass *=
c, void *data)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 device_class_set_props(dc, riscv_cpu_propertie=
s);<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; -#define ISA_EDATA_ENTRY(name, prop) {#name, cpu-&gt;cfg.prop}<br>
&gt;&gt; +#define ISA_EDATA_ENTRY(name, prop, priv) {#name, cpu-&gt;cfg.pro=
p, priv}<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_s=
tr, int max_str_len)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; @@ -1000,25 +1001,26 @@ static void riscv_isa_string_ext(RISCVCPU =
*cpu, char **isa_str, int max_str_len)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 extensions by an undersco=
re.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 struct isa_ext_data isa_edata_arr[] =3D {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfh, ext_zfh),<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),<=
br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfinx, ext_zfinx),<br=
>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zhinx, ext_zhinx),<br=
>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmi=
n),<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zdinx, ext_zdinx),<br=
>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zba, ext_zba),<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbb, ext_zbb),<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbc, ext_zbc),<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbs, ext_zbs),<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zve32f, ext_zve32f),<=
br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zve64f, ext_zve64f),<=
br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svinval, ext_svinval)=
,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svnapot, ext_svnapot)=
,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfh, ext_zfh, PRIV_VE=
RSION_1_12_0),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfhmin, ext_zfhmin, P=
RIV_VERSION_1_12_0),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfinx, ext_zfinx, PRI=
V_VERSION_1_12_0),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zhinx, ext_zhinx, PRI=
V_VERSION_1_12_0),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmi=
n, PRIV_VERSION_1_12_0),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zdinx, ext_zdinx, PRI=
V_VERSION_1_12_0),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zba, ext_zba, PRIV_VE=
RSION_1_12_0),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbb, ext_zbb, PRIV_VE=
RSION_1_12_0),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbc, ext_zbc, PRIV_VE=
RSION_1_12_0),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbs, ext_zbs, PRIV_VE=
RSION_1_12_0),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zve32f, ext_zve32f, P=
RIV_VERSION_1_12_0),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zve64f, ext_zve64f, P=
RIV_VERSION_1_12_0),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svinval, ext_svinval,=
 PRIV_VERSION_1_12_0),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svnapot, ext_svnapot,=
 PRIV_VERSION_1_12_0),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svpbmt, ext_svpbmt, P=
RIV_VERSION_1_12_0),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(isa_edata_arr)=
; i++) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (isa_edata_arr[i].enabled) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (isa_edata_arr[i].enabled &amp;&am=
p;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;env.priv_ver &g=
t;=3D isa_edata_arr[i].min_priv_ver) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new =3D g_strconca=
t(old, &quot;_&quot;, isa_edata_arr[i].name, NULL);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(old);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 old =3D new;<br>
&gt;&gt; --<br>
&gt;&gt; 2.34.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
</blockquote></div></div>

--0000000000006d08b005ddd88104--

