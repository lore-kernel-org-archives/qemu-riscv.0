Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nQe2a-00011c-Gu
	for mharc-qemu-riscv@gnu.org; Sat, 05 Mar 2022 18:42:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nQe2Y-00011C-MS
 for qemu-riscv@nongnu.org; Sat, 05 Mar 2022 18:42:22 -0500
Received: from [2a00:1450:4864:20::634] (port=37678
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nQe2W-00014L-61
 for qemu-riscv@nongnu.org; Sat, 05 Mar 2022 18:42:22 -0500
Received: by mail-ej1-x634.google.com with SMTP id bg10so24711853ejb.4
 for <qemu-riscv@nongnu.org>; Sat, 05 Mar 2022 15:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5FrL/EdIH80yL5qbNrhxOdW2I6oBqFL2u9otYKp+Ct4=;
 b=evO56H+xUhtpMXFXySuGZK3WjXLrDm4GJpUJFVpINtXhEccNaVu1ynQfa15aCQ2qmv
 2GRLrFtYcF44BSvhOc0Iose2GvyGY7vAv8Odh9+E/16UThwMkrRMYxoXYb0Var0jo/tn
 1Urky7vvXWEYaWGio90lsEQYA3xtodYTeDZ4Cd1gBQlqWkOQTrTdwSFvpk9IekqsLOuQ
 OFilmSlcVX9FypKecNxaIYzh5mpQi3P1pn4Sh5Kcm1zGq2w5IUiDVRXQ/mgIVfZZyfc0
 3rbM5oRBnZVkV8aiNlyGCe6XYEQAoNZwwGAeR03d1FDBOsSwclXxyqYRWsurvNpMNjnV
 pfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5FrL/EdIH80yL5qbNrhxOdW2I6oBqFL2u9otYKp+Ct4=;
 b=VX/r863PGAxc7cjMnuRUwlV9/0bqrNVjqHcwL6QpTKcB5BWeUDURxoDLgx2p06l1x+
 w/y5c443pvgopl9ImdJbtcGm91Zhsh9mqB2F0V2C/2bE91dg9W3pV8NPnM5rbZOovPA5
 W9C65V0aIqdj/wZYUiVbid+Q9RXN4y3zH3dbSMfEJWA90VcLju7po9oJWv8GV5Mq+oy8
 N8oCKT03pWcUKRalhQRH2YJHyXVTR3kTNGA+sTcOMZfg8gfaas8roJtLAUa6TSYdBAgt
 tk3HoMvN4z0TpTBxKOsuqAePT1p2H1t4OeJxe2l/pgP4B5UJUDx5N1CrJshDmf26vJO/
 OolA==
X-Gm-Message-State: AOAM532yUb3ZFDvOevCcC0xdpXQXl8MIr2vFM0MMkOyIIk0Oc0U0Gd52
 AtGKwQEFO41sam5uIXEo4IUzS+oGZSlaksbaJPdt9Q==
X-Google-Smtp-Source: ABdhPJwVeekxWHWbpgq1+3Zo1VFg26MaGMsHH770UplyYuPDn+anFXrzl5LRZ2H7/XRSqLkgR/Jbnnt59xdzllkoeRI=
X-Received: by 2002:a17:906:7307:b0:6da:92e1:9c83 with SMTP id
 di7-20020a170906730700b006da92e19c83mr4213358ejc.459.1646523737391; Sat, 05
 Mar 2022 15:42:17 -0800 (PST)
MIME-Version: 1.0
References: <20220222223830.2319856-1-atishp@rivosinc.com>
 <CANzO1D05q8_-PSs5KJsnO+MPWVWLrFoYsvhPXGK2eUC8rwBqDw@mail.gmail.com>
 <CAOnJCULn7BbyfyeHpPQkyLTQyTcXrfu9wBheMAXDdFTnnRMphA@mail.gmail.com>
 <5780243.1I65i12eNQ@phil>
In-Reply-To: <5780243.1I65i12eNQ@phil>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Sat, 5 Mar 2022 15:42:06 -0800
Message-ID: <CAHBxVyE2QRE8+W36AzgQ5=0GJMuPCgcGVzmS-VOLqDWHxPWkug@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Add isa extenstion strings to the device
 tree
To: Heiko Stuebner <heiko@sntech.de>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000007b5aba05d9812e20"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=atishp@rivosinc.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
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
X-List-Received-Date: Sat, 05 Mar 2022 23:42:22 -0000

--0000000000007b5aba05d9812e20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 5, 2022 at 10:05 AM Heiko Stuebner <heiko@sntech.de> wrote:

> Hi,
>
> Am Donnerstag, 3. M=C3=A4rz 2022, 19:58:38 CET schrieb Atish Patra:
> > On Fri, Feb 25, 2022 at 11:46 PM Frank Chang <frank.chang@sifive.com>
> wrote:
> > > Atish Patra <atishp@rivosinc.com> =E6=96=BC 2022=E5=B9=B42=E6=9C=8823=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=886:39=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > >>
> > >> The Linux kernel parses the ISA extensions from "riscv,isa" DT
> > >> property. It used to parse only the single letter base extensions
> > >> until now. A generic ISA extension parsing framework was proposed[1]
> > >> recently that can parse multi-letter ISA extensions as well.
> > >>
> > >> Generate the extended ISA string by appending  the available ISA
> extensions
> > >> to the "riscv,isa" string if it is enabled so that kernel can proces=
s
> it.
> > >>
> > >> [1] https://lkml.org/lkml/2022/2/15/263
> > >>
> > >> Suggested-by: Heiko Stubner <heiko@sntech.de>
> > >> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > >> ---
> > >> Changes from v2->v3:
> > >> 1. Used g_strconcat to replace snprintf & a max isa string length as
> > >> suggested by Anup.
> > >> 2. I have not included the Tested-by Tag from Heiko because the
> > >> implementation changed from v2 to v3.
> > >>
> > >> Changes from v1->v2:
> > >> 1. Improved the code redability by using arrays instead of individua=
l
> check
> > >> ---
> > >>  target/riscv/cpu.c | 29 +++++++++++++++++++++++++++++
> > >>  1 file changed, 29 insertions(+)
> > >>
> > >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > >> index b0a40b83e7a8..2c7ff6ef555a 100644
> > >> --- a/target/riscv/cpu.c
> > >> +++ b/target/riscv/cpu.c
> > >> @@ -34,6 +34,12 @@
> > >>
> > >>  /* RISC-V CPU definitions */
> > >>
> > >> +/* This includes the null terminated character '\0' */
> > >> +struct isa_ext_data {
> > >> +        const char *name;
> > >> +        bool enabled;
> > >> +};
> > >> +
> > >>  static const char riscv_exts[26] =3D "IEMAFDQCLBJTPVNSUHKORWXYZG";
> > >>
> > >>  const char * const riscv_int_regnames[] =3D {
> > >> @@ -881,6 +887,28 @@ static void riscv_cpu_class_init(ObjectClass *c=
,
> void *data)
> > >>      device_class_set_props(dc, riscv_cpu_properties);
> > >>  }
> > >>
> > >> +static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int
> max_str_len)
> > >> +{
> > >> +    char *old =3D *isa_str;
> > >> +    char *new =3D *isa_str;
> > >> +    int i;
> > >> +    struct isa_ext_data isa_edata_arr[] =3D {
> > >> +        { "svpbmt", cpu->cfg.ext_svpbmt   },
> > >> +        { "svinval", cpu->cfg.ext_svinval },
> > >> +        { "svnapot", cpu->cfg.ext_svnapot },
> > >
> > >
> > > We still have other sub-extensions, e.g. Zfh, Zba, Zbb, Zbc, Zbs...
> etc.
> > > Do you mind adding them as well?
> > >
> >
> > Do we really need it ? Does any OS actually parse it from the device
> tree ?
> > AFAIK, Linux kernel doesn't use them. As the device tree is intended
> > to keep the information useful
> > for supervisor software,
>
> That actually isn't true ;-) .
>
> The devicetree is intended to _describe_ the hardware present in full
> and has really nothing to do with what the userspace needs.
> So the argument "Linux doesn't need this" is never true when talking
> about devicetrees ;-) .
>

Yes. I didn=E2=80=99t mean that way. I was simply asking if these extension=
s
currently in use. I just mentioned Linux as an example.

The larger point I was trying to make if we should add all the supported
extensions when they are added to Qemu or on a need basis.

I don=E2=80=99t feel strongly either way. So I am okay with the former appr=
oach if
that=E2=80=99s what everyone prefers!

>
> On the other hand the devicetree user doesn't need to parse everything
> from DT. So adding code to parse things only really is needed if you
> need that information.
>

Agreed.


> So if some part of the kernel needs to know about those additional
> extensions, the array entries for them can also be added in a later patch=
.
>

Yes. That was the idea in isa extension framework series where the
extension specific array entries will only be added when support for that
extension is enabled.

>
>
> Heiko
>
> > > Also, I think the order of ISA strings should be alphabetical as
> described:
> > >
> https://github.com/riscv/riscv-isa-manual/blob/master/src/naming.tex#L96
> > >
> >
> > Ahh yes. I will order them in alphabetical order and leave a big
> > comment for future reference as well.
> >
> > > Regards,
> > > Frank Chang
> > >
> > >>
> > >> +    };
> > >> +
> > >> +    for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> > >> +        if (isa_edata_arr[i].enabled) {
> > >> +            new =3D g_strconcat(old, "_", isa_edata_arr[i].name, NU=
LL);
> > >> +            g_free(old);
> > >> +            old =3D new;
> > >> +        }
> > >> +    }
> > >> +
> > >> +    *isa_str =3D new;
> > >> +}
> > >> +
> > >>  char *riscv_isa_string(RISCVCPU *cpu)
> > >>  {
> > >>      int i;
> > >> @@ -893,6 +921,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
> > >>          }
> > >>      }
> > >>      *p =3D '\0';
> > >> +    riscv_isa_string_ext(cpu, &isa_str, maxlen);
> > >>      return isa_str;
> > >>  }
> > >>
> > >> --
> > >> 2.30.2
> > >>
> >
> >
> >
>
>
>
>
>

--0000000000007b5aba05d9812e20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Mar 5, 2022 at 10:05 AM Heiko Stuebner &lt;<a href=
=3D"mailto:heiko@sntech.de">heiko@sntech.de</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Hi,<br>
<br>
Am Donnerstag, 3. M=C3=A4rz 2022, 19:58:38 CET schrieb Atish Patra:<br>
&gt; On Fri, Feb 25, 2022 at 11:46 PM Frank Chang &lt;<a href=3D"mailto:fra=
nk.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt; wrote=
:<br>
&gt; &gt; Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" target=3D"=
_blank">atishp@rivosinc.com</a>&gt; =E6=96=BC 2022=E5=B9=B42=E6=9C=8823=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=886:39=E5=AF=AB=E9=81=93=EF=BC=9A=
<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The Linux kernel parses the ISA extensions from &quot;riscv,i=
sa&quot; DT<br>
&gt; &gt;&gt; property. It used to parse only the single letter base extens=
ions<br>
&gt; &gt;&gt; until now. A generic ISA extension parsing framework was prop=
osed[1]<br>
&gt; &gt;&gt; recently that can parse multi-letter ISA extensions as well.<=
br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Generate the extended ISA string by appending=C2=A0 the avail=
able ISA extensions<br>
&gt; &gt;&gt; to the &quot;riscv,isa&quot; string if it is enabled so that =
kernel can process it.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; [1] <a href=3D"https://lkml.org/lkml/2022/2/15/263" rel=3D"no=
referrer" target=3D"_blank">https://lkml.org/lkml/2022/2/15/263</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Suggested-by: Heiko Stubner &lt;<a href=3D"mailto:heiko@sntec=
h.de" target=3D"_blank">heiko@sntech.de</a>&gt;<br>
&gt; &gt;&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivos=
inc.com" target=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt; Changes from v2-&gt;v3:<br>
&gt; &gt;&gt; 1. Used g_strconcat to replace snprintf &amp; a max isa strin=
g length as<br>
&gt; &gt;&gt; suggested by Anup.<br>
&gt; &gt;&gt; 2. I have not included the Tested-by Tag from Heiko because t=
he<br>
&gt; &gt;&gt; implementation changed from v2 to v3.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Changes from v1-&gt;v2:<br>
&gt; &gt;&gt; 1. Improved the code redability by using arrays instead of in=
dividual check<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 target/riscv/cpu.c | 29 +++++++++++++++++++++++++++++<b=
r>
&gt; &gt;&gt;=C2=A0 1 file changed, 29 insertions(+)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; &gt;&gt; index b0a40b83e7a8..2c7ff6ef555a 100644<br>
&gt; &gt;&gt; --- a/target/riscv/cpu.c<br>
&gt; &gt;&gt; +++ b/target/riscv/cpu.c<br>
&gt; &gt;&gt; @@ -34,6 +34,12 @@<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 /* RISC-V CPU definitions */<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; +/* This includes the null terminated character &#39;\0&#39; =
*/<br>
&gt; &gt;&gt; +struct isa_ext_data {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *name;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool enabled;<br>
&gt; &gt;&gt; +};<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt;=C2=A0 static const char riscv_exts[26] =3D &quot;IEMAFDQCLBJT=
PVNSUHKORWXYZG&quot;;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 const char * const riscv_int_regnames[] =3D {<br>
&gt; &gt;&gt; @@ -881,6 +887,28 @@ static void riscv_cpu_class_init(ObjectC=
lass *c, void *data)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 device_class_set_props(dc, riscv_cpu_prop=
erties);<br>
&gt; &gt;&gt;=C2=A0 }<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; +static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_s=
tr, int max_str_len)<br>
&gt; &gt;&gt; +{<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 char *old =3D *isa_str;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 char *new =3D *isa_str;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 struct isa_ext_data isa_edata_arr[] =3D {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;svpbmt&quot;, cpu-&gt;cf=
g.ext_svpbmt=C2=A0 =C2=A0},<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;svinval&quot;, cpu-&gt;c=
fg.ext_svinval },<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;svnapot&quot;, cpu-&gt;c=
fg.ext_svnapot },<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; We still have other sub-extensions, e.g. Zfh, Zba, Zbb, Zbc, Zbs.=
.. etc.<br>
&gt; &gt; Do you mind adding them as well?<br>
&gt; &gt;<br>
&gt; <br>
&gt; Do we really need it ? Does any OS actually parse it from the device t=
ree ?<br>
&gt; AFAIK, Linux kernel doesn&#39;t use them. As the device tree is intend=
ed<br>
&gt; to keep the information useful<br>
&gt; for supervisor software,<br>
<br>
That actually isn&#39;t true ;-) .<br>
<br>
The devicetree is intended to _describe_ the hardware present in full<br>
and has really nothing to do with what the userspace needs.<br>
So the argument &quot;Linux doesn&#39;t need this&quot; is never true when =
talking<br>
about devicetrees ;-) .<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes. I didn=E2=
=80=99t mean that way. I was simply asking if these extensions currently in=
 use. I just mentioned Linux as an example.=C2=A0</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">The larger point I was trying to make if we shoul=
d add all the supported extensions when they are added to Qemu or on a need=
 basis.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">I don=E2=
=80=99t feel strongly either way. So I am okay with the former approach if =
that=E2=80=99s what everyone prefers!</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
br>
On the other hand the devicetree user doesn&#39;t need to parse everything<=
br>
from DT. So adding code to parse things only really is needed if you<br>
need that information.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Agreed.=C2=A0</d=
iv><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
So if some part of the kernel needs to know about those additional<br>
extensions, the array entries for them can also be added in a later patch.<=
br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes. That was th=
e idea in isa extension framework series where the extension specific array=
 entries will only be added when support for that extension is enabled.</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><br>
<br>
Heiko<br>
<br>
&gt; &gt; Also, I think the order of ISA strings should be alphabetical as =
described:<br>
&gt; &gt; <a href=3D"https://github.com/riscv/riscv-isa-manual/blob/master/=
src/naming.tex#L96" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/riscv/riscv-isa-manual/blob/master/src/naming.tex#L96</a><br>
&gt; &gt;<br>
&gt; <br>
&gt; Ahh yes. I will order them in alphabetical order and leave a big<br>
&gt; comment for future reference as well.<br>
&gt; <br>
&gt; &gt; Regards,<br>
&gt; &gt; Frank Chang<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 };<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(isa_edata_arr)=
; i++) {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (isa_edata_arr[i].enabled) {<=
br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new =3D g_strconca=
t(old, &quot;_&quot;, isa_edata_arr[i].name, NULL);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(old);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 old =3D new;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 *isa_str =3D new;<br>
&gt; &gt;&gt; +}<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt;=C2=A0 char *riscv_isa_string(RISCVCPU *cpu)<br>
&gt; &gt;&gt;=C2=A0 {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt; &gt;&gt; @@ -893,6 +921,7 @@ char *riscv_isa_string(RISCVCPU *cpu)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 *p =3D &#39;\0&#39;;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 riscv_isa_string_ext(cpu, &amp;isa_str, maxlen=
);<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 return isa_str;<br>
&gt; &gt;&gt;=C2=A0 }<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 2.30.2<br>
&gt; &gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000007b5aba05d9812e20--

