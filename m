Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nQkc2-0002zO-Rh
	for mharc-qemu-riscv@gnu.org; Sun, 06 Mar 2022 01:43:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nQkbv-0002yS-4w
 for qemu-riscv@nongnu.org; Sun, 06 Mar 2022 01:43:19 -0500
Received: from [2a00:1450:4864:20::62c] (port=38696
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nQkbr-0000BA-2f
 for qemu-riscv@nongnu.org; Sun, 06 Mar 2022 01:43:18 -0500
Received: by mail-ej1-x62c.google.com with SMTP id r13so25704949ejd.5
 for <qemu-riscv@nongnu.org>; Sat, 05 Mar 2022 22:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C7zM6IHEDSCu+DJM/Nh8fGY4RFwF3y2UzaUxDQmnzMw=;
 b=K1Oj21gQMforetOamlggtmwTF2kXS8sYSzHVjb3Kmb8iUQ/BU4F1P3kVyM9KECvENN
 krlYUeCnFDQ6IuJgbCSKZL7nzyK682iQJBVLcoCRDfRBuGvjFd2hFg51UGvj/W2h6BxX
 eH7sEmDrTTG8UqpCot2U+YmsORj57XacNiMYwJfLP4R5FXU5f2ZAFi4InITQx1ptTQsD
 1fNo6rFgDN2piAWpHJdMqqd8SsGN9Mfnf0dybhdWuF55kU3TAzxgOVHTl4XuF0oqhf+A
 XX+lru4zcsruisRjf9KaJHesKbJzaft+Ehk71sWcTU11Z50FzXnKIoFcyqUpR8P5g72H
 47Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C7zM6IHEDSCu+DJM/Nh8fGY4RFwF3y2UzaUxDQmnzMw=;
 b=3Uap0lMbh/lhHOudlsKT2NE0zQL3drB70GnwP1AlHRnPHwUq8ejPSblTmvOel9bpPU
 87V565gwl4HFqWQBmhnDklyDysbcJFiK6CFsEg7IgrQuhDuZWawrUZ1HRuljEXZgLVaD
 7e2JEsEcvPWY3y3U6ef2TYdiw1nuR88WK6AZysum3Uj1PZ23k8O2I7BzdlIsZz2lxERw
 1JURKkNCF3O/W6Tu55dXpg6QxjWbHtoOgHdPTINiH5HScNMO5pMmWD72RIYFXcfpsUVF
 rA1A56RDHqEmJBZ1mFWHT1+xHIM2RqKmNbgAGVbEOgfse+sG+pyPgTyCmqGd81Wc5dX/
 HuLQ==
X-Gm-Message-State: AOAM533iGtoCM8sfWA18kMM7zfo6V3Yv39Dnh6ku6Wa7RAdf/V5cj4sd
 si8oXudvSYMxRJrv6/4kK3cQWnI8bSrZ2afSmLB6DA==
X-Google-Smtp-Source: ABdhPJz3MyqI1fYiHmXuq6PcSO0A2AqlK2AyPAwBziJqWJCMLCX0ePgKfczd0XtSrOyArnUfOHeBvRKiBhHIl1+X2/o=
X-Received: by 2002:a17:906:58d3:b0:6da:bdb2:2727 with SMTP id
 e19-20020a17090658d300b006dabdb22727mr4788254ejs.549.1646548991694; Sat, 05
 Mar 2022 22:43:11 -0800 (PST)
MIME-Version: 1.0
References: <20220222223830.2319856-1-atishp@rivosinc.com>
 <CANzO1D05q8_-PSs5KJsnO+MPWVWLrFoYsvhPXGK2eUC8rwBqDw@mail.gmail.com>
 <CAOnJCULn7BbyfyeHpPQkyLTQyTcXrfu9wBheMAXDdFTnnRMphA@mail.gmail.com>
 <5780243.1I65i12eNQ@phil>
 <CAHBxVyE2QRE8+W36AzgQ5=0GJMuPCgcGVzmS-VOLqDWHxPWkug@mail.gmail.com>
 <CAE_xrPhd4L9C_oTTn_Zc==NQ_TeBk+0OBZ7h3cxH7cRXY835BQ@mail.gmail.com>
 <CAHBxVyEe=ecBJOj457U2PKj0RcX23JYurEbhO4_PS-oF-FpaJQ@mail.gmail.com>
In-Reply-To: <CAHBxVyEe=ecBJOj457U2PKj0RcX23JYurEbhO4_PS-oF-FpaJQ@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 6 Mar 2022 14:43:00 +0800
Message-ID: <CAE_xrPjkPjdBvH-+DfmLYZwboFPpxtvQb3upSdE6mMUz+ZwfnQ@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Add isa extenstion strings to the device
 tree
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, 
 Bin Meng <bin.meng@windriver.com>, Heiko Stuebner <heiko@sntech.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000c1748305d9870f6f"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=frank.chang@sifive.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 06 Mar 2022 06:43:19 -0000

--000000000000c1748305d9870f6f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 6, 2022 at 2:12 PM Atish Kumar Patra <atishp@rivosinc.com>
wrote:

>
>
> On Sat, Mar 5, 2022 at 9:36 PM Frank Chang <frank.chang@sifive.com> wrote=
:
>
>> On Sun, Mar 6, 2022 at 7:42 AM Atish Kumar Patra <atishp@rivosinc.com>
>> wrote:
>>
>>>
>>>
>>> On Sat, Mar 5, 2022 at 10:05 AM Heiko Stuebner <heiko@sntech.de> wrote:
>>>
>>>> Hi,
>>>>
>>>> Am Donnerstag, 3. M=C3=A4rz 2022, 19:58:38 CET schrieb Atish Patra:
>>>> > On Fri, Feb 25, 2022 at 11:46 PM Frank Chang <frank.chang@sifive.com=
>
>>>> wrote:
>>>> > > Atish Patra <atishp@rivosinc.com> =E6=96=BC 2022=E5=B9=B42=E6=9C=
=8823=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=886:39=E5=AF=AB=E9=81=93=
=EF=BC=9A
>>>> > >>
>>>> > >> The Linux kernel parses the ISA extensions from "riscv,isa" DT
>>>> > >> property. It used to parse only the single letter base extensions
>>>> > >> until now. A generic ISA extension parsing framework was
>>>> proposed[1]
>>>> > >> recently that can parse multi-letter ISA extensions as well.
>>>> > >>
>>>> > >> Generate the extended ISA string by appending  the available ISA
>>>> extensions
>>>> > >> to the "riscv,isa" string if it is enabled so that kernel can
>>>> process it.
>>>> > >>
>>>> > >> [1] https://lkml.org/lkml/2022/2/15/263
>>>> > >>
>>>> > >> Suggested-by: Heiko Stubner <heiko@sntech.de>
>>>> > >> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>>> > >> ---
>>>> > >> Changes from v2->v3:
>>>> > >> 1. Used g_strconcat to replace snprintf & a max isa string length
>>>> as
>>>> > >> suggested by Anup.
>>>> > >> 2. I have not included the Tested-by Tag from Heiko because the
>>>> > >> implementation changed from v2 to v3.
>>>> > >>
>>>> > >> Changes from v1->v2:
>>>> > >> 1. Improved the code redability by using arrays instead of
>>>> individual check
>>>> > >> ---
>>>> > >>  target/riscv/cpu.c | 29 +++++++++++++++++++++++++++++
>>>> > >>  1 file changed, 29 insertions(+)
>>>> > >>
>>>> > >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>>> > >> index b0a40b83e7a8..2c7ff6ef555a 100644
>>>> > >> --- a/target/riscv/cpu.c
>>>> > >> +++ b/target/riscv/cpu.c
>>>> > >> @@ -34,6 +34,12 @@
>>>> > >>
>>>> > >>  /* RISC-V CPU definitions */
>>>> > >>
>>>> > >> +/* This includes the null terminated character '\0' */
>>>> > >> +struct isa_ext_data {
>>>> > >> +        const char *name;
>>>> > >> +        bool enabled;
>>>> > >> +};
>>>> > >> +
>>>> > >>  static const char riscv_exts[26] =3D "IEMAFDQCLBJTPVNSUHKORWXYZG=
";
>>>> > >>
>>>> > >>  const char * const riscv_int_regnames[] =3D {
>>>> > >> @@ -881,6 +887,28 @@ static void riscv_cpu_class_init(ObjectClass
>>>> *c, void *data)
>>>> > >>      device_class_set_props(dc, riscv_cpu_properties);
>>>> > >>  }
>>>> > >>
>>>> > >> +static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
>>>> int max_str_len)
>>>> > >> +{
>>>> > >> +    char *old =3D *isa_str;
>>>> > >> +    char *new =3D *isa_str;
>>>> > >> +    int i;
>>>> > >> +    struct isa_ext_data isa_edata_arr[] =3D {
>>>> > >> +        { "svpbmt", cpu->cfg.ext_svpbmt   },
>>>> > >> +        { "svinval", cpu->cfg.ext_svinval },
>>>> > >> +        { "svnapot", cpu->cfg.ext_svnapot },
>>>> > >
>>>> > >
>>>> > > We still have other sub-extensions, e.g. Zfh, Zba, Zbb, Zbc, Zbs..=
.
>>>> etc.
>>>> > > Do you mind adding them as well?
>>>> > >
>>>> >
>>>> > Do we really need it ? Does any OS actually parse it from the device
>>>> tree ?
>>>> > AFAIK, Linux kernel doesn't use them. As the device tree is intended
>>>> > to keep the information useful
>>>> > for supervisor software,
>>>>
>>>> That actually isn't true ;-) .
>>>>
>>>> The devicetree is intended to _describe_ the hardware present in full
>>>> and has really nothing to do with what the userspace needs.
>>>> So the argument "Linux doesn't need this" is never true when talking
>>>> about devicetrees ;-) .
>>>>
>>>
>>> Yes. I didn=E2=80=99t mean that way. I was simply asking if these exten=
sions
>>> currently in use. I just mentioned Linux as an example.
>>>
>>> The larger point I was trying to make if we should add all the supporte=
d
>>> extensions when they are added to Qemu or on a need basis.
>>>
>>> I don=E2=80=99t feel strongly either way. So I am okay with the former =
approach
>>> if that=E2=80=99s what everyone prefers!
>>>
>>
>> Linux Kernel itself might not,
>> but userspace applications may query /proc/cpuinfo to get core's
>> capabilities, e.g. for those vector applications.
>> It really depends on how the application is written.
>>
>> I still think adding all the enabled extensions into the isa string woul=
d
>> be a proper solution, no matter they are used or not.
>> However, we can leave that beyond this patch.
>>
>
>
> Fair enough. I will update the patch to include all the extension
> available.
>

Thanks, that would be great.

BTW, I think current QEMU RISC-V isa string includes both "s" and "u":
https://github.com/qemu/qemu/blob/master/target/riscv/cpu.c#L37
But in fact, they should not be presented in the DTS isa string.
Do you think we should exclude them as well?

Regards,
Frank Chang


>
>> Regards,
>> Frank Chang
>>
>>
>>>
>>>> On the other hand the devicetree user doesn't need to parse everything
>>>> from DT. So adding code to parse things only really is needed if you
>>>> need that information.
>>>>
>>>
>>> Agreed.
>>>
>>>
>>>> So if some part of the kernel needs to know about those additional
>>>> extensions, the array entries for them can also be added in a later
>>>> patch.
>>>>
>>>
>>> Yes. That was the idea in isa extension framework series where the
>>> extension specific array entries will only be added when support for th=
at
>>> extension is enabled.
>>>
>>>>
>>>>
>>>> Heiko
>>>>
>>>> > > Also, I think the order of ISA strings should be alphabetical as
>>>> described:
>>>> > >
>>>> https://github.com/riscv/riscv-isa-manual/blob/master/src/naming.tex#L=
96
>>>> > >
>>>> >
>>>> > Ahh yes. I will order them in alphabetical order and leave a big
>>>> > comment for future reference as well.
>>>> >
>>>> > > Regards,
>>>> > > Frank Chang
>>>> > >
>>>> > >>
>>>> > >> +    };
>>>> > >> +
>>>> > >> +    for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
>>>> > >> +        if (isa_edata_arr[i].enabled) {
>>>> > >> +            new =3D g_strconcat(old, "_", isa_edata_arr[i].name,
>>>> NULL);
>>>> > >> +            g_free(old);
>>>> > >> +            old =3D new;
>>>> > >> +        }
>>>> > >> +    }
>>>> > >> +
>>>> > >> +    *isa_str =3D new;
>>>> > >> +}
>>>> > >> +
>>>> > >>  char *riscv_isa_string(RISCVCPU *cpu)
>>>> > >>  {
>>>> > >>      int i;
>>>> > >> @@ -893,6 +921,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
>>>> > >>          }
>>>> > >>      }
>>>> > >>      *p =3D '\0';
>>>> > >> +    riscv_isa_string_ext(cpu, &isa_str, maxlen);
>>>> > >>      return isa_str;
>>>> > >>  }
>>>> > >>
>>>> > >> --
>>>> > >> 2.30.2
>>>> > >>
>>>> >
>>>> >
>>>> >
>>>>
>>>>
>>>>
>>>>
>>>>

--000000000000c1748305d9870f6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Mar 6, 2022 at 2:12 PM Atish Kuma=
r Patra &lt;<a href=3D"mailto:atishp@rivosinc.com">atishp@rivosinc.com</a>&=
gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div><br></div><div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 5, 2022 at 9:36 PM Frank Ch=
ang &lt;<a href=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.c=
hang@sifive.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"></div><div dir=3D"ltr"><div dir=3D"ltr">On =
Sun, Mar 6, 2022 at 7:42 AM Atish Kumar Patra &lt;<a href=3D"mailto:atishp@=
rivosinc.com" target=3D"_blank">atishp@rivosinc.com</a>&gt; wrote:<br></div=
></div><div dir=3D"ltr"><div class=3D"gmail_quote"></div></div><div dir=3D"=
ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, Mar 5, 2022 at 10:05 AM Heiko Stuebner &lt;<a =
href=3D"mailto:heiko@sntech.de" target=3D"_blank">heiko@sntech.de</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
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
that=E2=80=99s what everyone prefers!</div></div></div></blockquote><div><b=
r></div></div></div><div dir=3D"ltr"><div class=3D"gmail_quote"><div>Linux =
Kernel itself might not,</div><div>but userspace applications may query /pr=
oc/cpuinfo to get core&#39;s capabilities, e.g. for those vector applicatio=
ns.</div><div>It really depends on how the application is written.</div><di=
v><br></div><div>I still think adding all the enabled extensions into the i=
sa string would be a proper=C2=A0solution, no matter they are used or not.<=
/div><div>However, we can leave that beyond this patch.</div><div></div></d=
iv></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Fair enough. I will update the patch to include all th=
e extension available.</div></div></div></blockquote><div><br></div><div>Th=
anks, that would be great.</div><div><br></div><div>BTW, I think current QE=
MU RISC-V isa string includes both &quot;s&quot; and &quot;u&quot;:</div><d=
iv><a href=3D"https://github.com/qemu/qemu/blob/master/target/riscv/cpu.c#L=
37">https://github.com/qemu/qemu/blob/master/target/riscv/cpu.c#L37</a><br>=
</div><div>But in fact, they should not be presented=C2=A0in the DTS isa st=
ring.</div><div>Do you think we should exclude them as well?</div><div><br>=
</div><div>Regards,</div><div>Frank Chang</div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div><div class=3D"gmail_quote"><div d=
ir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>Regards,</div>=
<div>Frank Chang</div></div></div><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><br>
On the other hand the devicetree user doesn&#39;t need to parse everything<=
br>
from DT. So adding code to parse things only really is needed if you<br>
need that information.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Agreed.=C2=A0</d=
iv><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>
So if some part of the kernel needs to know about those additional<br>
extensions, the array entries for them can also be added in a later patch.<=
br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes. That was th=
e idea in isa extension framework series where the extension specific array=
 entries will only be added when support for that extension is enabled.</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
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
</blockquote></div></div>
</blockquote></div></div>
</blockquote></div></div>

--000000000000c1748305d9870f6f--

