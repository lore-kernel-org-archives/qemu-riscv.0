Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oDwi7-0003X6-BL
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jul 2022 19:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oDwi6-0003Wo-E1
 for qemu-riscv@nongnu.org; Tue, 19 Jul 2022 19:33:02 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:42714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oDwi4-0004IF-0r
 for qemu-riscv@nongnu.org; Tue, 19 Jul 2022 19:33:01 -0400
Received: by mail-ed1-x52e.google.com with SMTP id m8so8226707edd.9
 for <qemu-riscv@nongnu.org>; Tue, 19 Jul 2022 16:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DSECvvyHQq6PN9mbiMTy5I+owvkAQ2bXXkXlGJp9/VQ=;
 b=R9g5BU+oaRCVO0Hou+Aw6m36IVIKKLjLRGilTnwyNsYNCt+4/G5bqSLiq/nU4fDeDU
 1cuKENotatQ9KdRgNcTn+fl0pq8X+Q8H4l31qZwo1Kl6QT/7t+sLLM1b21eYUyafWpuM
 lv4LQnGI+IW8wF/XRRRjDftZyPfIM4Eb7b9H41PZLFpq3s0u2avqzer5Z8QhQ9rF8jau
 3lFQSBoDvDUhC4MKp70gtTsR08rNpU4NDsbO/YxhYr7jJdwG6/OXAFRtTKLpwJSy3xGW
 IH/U8P/DEsIN+teCTwfH/yMvTOKfMCxwpZwAwRrNNKUApMAWZmLVpktTE0XdznEcnHmw
 QjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DSECvvyHQq6PN9mbiMTy5I+owvkAQ2bXXkXlGJp9/VQ=;
 b=RAnFOTrytH2lZXBZNQfYtuUZuAMnwsYAAnaJJ7QYMbvtj0m8y8odQeQOj1onh1X5UV
 JVCkPCdR/usqysFL8hph9gEbKEQsmVWfyXhRz1YSr8rBgubkwtDdNotFPlVoYChOXDkS
 Jft2oCYUIG2xxFf5jDJUKp8Wg6V4r+2BTcjFijMEZ2EXmwdAbhTE6N9Cb13hvSY/wK2z
 8C8aiirQqNWIeXAzp8dIIs9Z0LIbtSmFCFL8ArScwzbWcZkF7e6lEZYp1sjmIXQozBgO
 BFTI4EWbx0MawVrMPYE7SBkwIG60F9jqCgt1kicl9gHtz5niiPbwBnhbTA1f/4p9eLUb
 J7Yg==
X-Gm-Message-State: AJIora9OhWcbigpjTiCLw+45zFYGL2D8r1oxeVGMELOpRpRm4v2iNC4c
 RgBlqf8sf9r3v+8eG+pmlEnlVc1mZ0sH9shAtUHBuA==
X-Google-Smtp-Source: AGRyM1sGcQzqvai5yVG0CcuvL9znIFJSoEaLgTlAls595Y0t+btIrLl02p3isV+dpEdItnMVAQr+qpFpzDM0GcX/SZ4=
X-Received: by 2002:a05:6402:500e:b0:43b:6f0:756b with SMTP id
 p14-20020a056402500e00b0043b06f0756bmr48100310eda.221.1658273576744; Tue, 19
 Jul 2022 16:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220718035249.17440-1-jim.shu@sifive.com>
 <CAAhSdy0XUp1KGvmiPhG0eaTk1bnzwVGrW83jDXSLsrzK_NtXDw@mail.gmail.com>
In-Reply-To: <CAAhSdy0XUp1KGvmiPhG0eaTk1bnzwVGrW83jDXSLsrzK_NtXDw@mail.gmail.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 20 Jul 2022 07:32:45 +0800
Message-ID: <CALw707qqVxROpindXhxPjAvccjTYaYoC_vTjtfkM+Do_pMLQRA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Support SW update of PTE A/D bits and
 Ssptwad extension
To: Anup Patel <anup@brainfault.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: multipart/alternative; boundary="0000000000007b926705e430e74b"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=jim.shu@sifive.com; helo=mail-ed1-x52e.google.com
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
X-List-Received-Date: Tue, 19 Jul 2022 23:33:02 -0000

--0000000000007b926705e430e74b
Content-Type: text/plain; charset="UTF-8"

Hi Anup,

Do you think it is OK if we only use ssptwad as a CPU option name
but not a RISC-V extension? just like MMU and PMP options of RISC-V.
(And we could change it to RISC-V extension in the future
if Ssptwad becomes the formal RISC-V extension)

Both HW/SW update schemes are already defined in RISC-V priv spec,
so I think it's reasonable to implement them in QEMU. The only issue here is
to choose a proper CPU option name to turn on/off HW update of A/D bits.

Regards,
Jim Shu

On Mon, Jul 18, 2022 at 12:02 PM Anup Patel <anup@brainfault.org> wrote:

> +Atish
>
> On Mon, Jul 18, 2022 at 9:23 AM Jim Shu <jim.shu@sifive.com> wrote:
> >
> > RISC-V priv spec v1.12 permits 2 PTE-update schemes of A/D-bit
> > (Access/Dirty bit): HW update or SW update. RISC-V profile defines the
> > extension name 'Ssptwad' for HW update to PTE A/D bits.
> > https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc
>
> The Ssptwad (even though used by profiles) is not a well defined RISC-V
> ISA extension. Rather, Ssptwad is just a name used in profiles to represent
> an optional feature.
>
> In fact, since it is not a well-defined ISA extension, QEMU cannot include
> Ssptwad in the ISA string as well.
>
> I think for such optionalities which are not well-defined ISA extensions,
> QEMU should treat it differently.
>
> Regards,
> Anup
>
> >
> > Current QEMU RISC-V implements HW update scheme, so this commit
> > introduces SW update scheme to QEMU and uses the 'Ssptwad' extension
> > as the CPU option to select 2 PTE-update schemes. QEMU RISC-V CPU still
> > uses HW update scheme (ext_ssptwad=true) by default to keep the backward
> > compatibility.
> >
> > SW update scheme implemention is based on priv spec v1.12:
> > "When a virtual page is accessed and the A bit is clear, or is written
> > and the D bit is clear, a page-fault exception (corresponding to the
> > original access type) is raised."
> >
> > Signed-off-by: Jim Shu <jim.shu@sifive.com>
> > Reviewed-by: Frank Chang <frank.chang@sifive.com>
> > ---
> >  target/riscv/cpu.c        | 2 ++
> >  target/riscv/cpu.h        | 1 +
> >  target/riscv/cpu_helper.c | 9 +++++++++
> >  3 files changed, 12 insertions(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 1bb3973806..1d38c1c1d2 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -857,6 +857,7 @@ static void riscv_cpu_init(Object *obj)
> >
> >      cpu->cfg.ext_ifencei = true;
> >      cpu->cfg.ext_icsr = true;
> > +    cpu->cfg.ext_ssptwad = true;
> >      cpu->cfg.mmu = true;
> >      cpu->cfg.pmp = true;
> >
> > @@ -900,6 +901,7 @@ static Property riscv_cpu_extensions[] = {
> >      DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
> >      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
> >      DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
> > +    DEFINE_PROP_BOOL("ssptwad", RISCVCPU, cfg.ext_ssptwad, true),
> >
> >      DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
> >      DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 5c7acc055a..2eee59af98 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -433,6 +433,7 @@ struct RISCVCPUConfig {
> >      bool ext_zve32f;
> >      bool ext_zve64f;
> >      bool ext_zmmul;
> > +    bool ext_ssptwad;
> >      bool rvv_ta_all_1s;
> >
> >      uint32_t mvendorid;
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 59b3680b1b..a8607c0d7b 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -981,6 +981,15 @@ restart:
> >
> >              /* Page table updates need to be atomic with MTTCG enabled
> */
> >              if (updated_pte != pte) {
> > +                if (!cpu->cfg.ext_ssptwad) {
> > +                    /*
> > +                     * If A/D bits are managed by SW, HW just raises the
> > +                     * page fault exception corresponding to the
> original
> > +                     * access type when A/D bits need to be updated.
> > +                     */
> > +                    return TRANSLATE_FAIL;
> > +                }
> > +
> >                  /*
> >                   * - if accessed or dirty bits need updating, and the
> PTE is
> >                   *   in RAM, then we do so atomically with a compare
> and swap.
> > --
> > 2.17.1
> >
> >
>

--0000000000007b926705e430e74b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Anup,<br><br>Do you think it is OK if =
we only use ssptwad as a CPU option name<br>but not a RISC-V extension? jus=
t like MMU and PMP options of RISC-V.<br>(And we could change it to RISC-V =
extension in the future<br>if Ssptwad becomes the formal RISC-V extension)<=
br><br>Both HW/SW update schemes are already defined in RISC-V priv spec,<b=
r>so I think it&#39;s reasonable to implement them in QEMU. The only issue =
here is</div><div dir=3D"ltr">to choose a proper CPU option name to turn on=
/off HW update of A/D bits.<br><br>Regards,<br>Jim Shu</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 18, 2022=
 at 12:02 PM Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">+Atish<br>
<br>
On Mon, Jul 18, 2022 at 9:23 AM Jim Shu &lt;<a href=3D"mailto:jim.shu@sifiv=
e.com" target=3D"_blank">jim.shu@sifive.com</a>&gt; wrote:<br>
&gt;<br>
&gt; RISC-V priv spec v1.12 permits 2 PTE-update schemes of A/D-bit<br>
&gt; (Access/Dirty bit): HW update or SW update. RISC-V profile defines the=
<br>
&gt; extension name &#39;Ssptwad&#39; for HW update to PTE A/D bits.<br>
&gt; <a href=3D"https://github.com/riscv/riscv-profiles/blob/main/profiles.=
adoc" rel=3D"noreferrer" target=3D"_blank">https://github.com/riscv/riscv-p=
rofiles/blob/main/profiles.adoc</a><br>
<br>
The Ssptwad (even though used by profiles) is not a well defined RISC-V<br>
ISA extension. Rather, Ssptwad is just a name used in profiles to represent=
<br>
an optional feature.<br>
<br>
In fact, since it is not a well-defined ISA extension, QEMU cannot include<=
br>
Ssptwad in the ISA string as well.<br>
<br>
I think for such optionalities which are not well-defined ISA extensions,<b=
r>
QEMU should treat it differently.<br>
<br>
Regards,<br>
Anup<br>
<br>
&gt;<br>
&gt; Current QEMU RISC-V implements HW update scheme, so this commit<br>
&gt; introduces SW update scheme to QEMU and uses the &#39;Ssptwad&#39; ext=
ension<br>
&gt; as the CPU option to select 2 PTE-update schemes. QEMU RISC-V CPU stil=
l<br>
&gt; uses HW update scheme (ext_ssptwad=3Dtrue) by default to keep the back=
ward<br>
&gt; compatibility.<br>
&gt;<br>
&gt; SW update scheme implemention is based on priv spec v1.12:<br>
&gt; &quot;When a virtual page is accessed and the A bit is clear, or is wr=
itten<br>
&gt; and the D bit is clear, a page-fault exception (corresponding to the<b=
r>
&gt; original access type) is raised.&quot;<br>
&gt;<br>
&gt; Signed-off-by: Jim Shu &lt;<a href=3D"mailto:jim.shu@sifive.com" targe=
t=3D"_blank">jim.shu@sifive.com</a>&gt;<br>
&gt; Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com"=
 target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 target/riscv/cpu_helper.c | 9 +++++++++<br>
&gt;=C2=A0 3 files changed, 12 insertions(+)<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index 1bb3973806..1d38c1c1d2 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -857,6 +857,7 @@ static void riscv_cpu_init(Object *obj)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.ext_ifencei =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.ext_icsr =3D true;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;cfg.ext_ssptwad =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.mmu =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.pmp =3D true;<br>
&gt;<br>
&gt; @@ -900,6 +901,7 @@ static Property riscv_cpu_extensions[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;svinval&quot;, RISCVCPU, cf=
g.ext_svinval, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;svnapot&quot;, RISCVCPU, cf=
g.ext_svnapot, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;svpbmt&quot;, RISCVCPU, cfg=
.ext_svpbmt, false),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;ssptwad&quot;, RISCVCPU, cfg.ext=
_ssptwad, true),<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;zba&quot;, RISCVCPU, cfg.ex=
t_zba, true),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;zbb&quot;, RISCVCPU, cfg.ex=
t_zbb, true),<br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index 5c7acc055a..2eee59af98 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -433,6 +433,7 @@ struct RISCVCPUConfig {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool ext_zve32f;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool ext_zve64f;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool ext_zmmul;<br>
&gt; +=C2=A0 =C2=A0 bool ext_ssptwad;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool rvv_ta_all_1s;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t mvendorid;<br>
&gt; diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
&gt; index 59b3680b1b..a8607c0d7b 100644<br>
&gt; --- a/target/riscv/cpu_helper.c<br>
&gt; +++ b/target/riscv/cpu_helper.c<br>
&gt; @@ -981,6 +981,15 @@ restart:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Page table updates =
need to be atomic with MTTCG enabled */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (updated_pte !=3D p=
te) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!cpu-&gt;=
cfg.ext_ssptwad) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0* If A/D bits are managed by SW, HW just raises the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0* page fault exception corresponding to the original<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0* access type when A/D bits need to be updated.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return TRANSLATE_FAIL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* =
- if accessed or dirty bits need updating, and the PTE is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=
=C2=A0 =C2=A0in RAM, then we do so atomically with a compare and swap.<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
</blockquote></div>
</div>

--0000000000007b926705e430e74b--

