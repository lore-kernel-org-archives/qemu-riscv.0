Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nQkg5-0004QC-IV
	for mharc-qemu-riscv@gnu.org; Sun, 06 Mar 2022 01:47:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nQkg4-0004PB-Fw
 for qemu-riscv@nongnu.org; Sun, 06 Mar 2022 01:47:36 -0500
Received: from [2a00:1450:4864:20::62d] (port=35625
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nQkg1-0000uU-Um
 for qemu-riscv@nongnu.org; Sun, 06 Mar 2022 01:47:35 -0500
Received: by mail-ej1-x62d.google.com with SMTP id yy13so16838196ejb.2
 for <qemu-riscv@nongnu.org>; Sat, 05 Mar 2022 22:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w0+dNaztdHc7pmiNt2k2jWKbdSVXlsz2bMvCfDEkCfw=;
 b=NOdS7HJY91UvKEcyGDwZrApOoKmy86xracOS8VQepcPyTvZR2upfq/InjlcnVY5ZGc
 /5ZhdID+U3KB7Djh7zOeqWrQbrd0nHqs5DtfRFe2O7DLFQPpkJKtfy66vBSgQjxhq2Dx
 7jLFuw4+mCF4lGv7kht+YaWcwzuNxWbof/Wl7Nxcs9PWuUqCFy0k4IPES/UvFRr4DChP
 aVhhiZfJ7Ynx6LHWZzLhob4qdo+XJng0SzhFXnRUGosM6D/8/W2Sep6etExxtLZuUMaS
 goko4ILL2eCQBaqiuZpRe2wojs1AiP9BRQOxwnBndD6042+02PotQRUgKBcWrdOXWISL
 ACCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w0+dNaztdHc7pmiNt2k2jWKbdSVXlsz2bMvCfDEkCfw=;
 b=rZinBmTQtC5C1D7ZtNjAMSoUrBLlCdOsnl3jLZ+oM49pNc/u7qEF+teBpJvKgLPvIr
 bPtPvEj6TTFNgqKyX6/ad2S1baQKaM16bcQzWdcYmQJixipzQZ2wR/CSMOTIzilPCgT1
 EL+lBdJWI39K9lp/z758PewwWlQ+IE1cUF+jlZ9X8NFeiZn/YICDUxp38+vTh5L0g3ML
 LOdIxFIqvK/Kck135ls7Eb1iGJiP8dO38o1sg7tx5GoaSlP1IxqUpkjKesrw5P3shoXG
 Pq702fXDYla+o7Yzd0LO/OllPUQMeMFe+HYxgrFzE3YUUb5rq+WGYXDNqmcVInPNhOvP
 P70w==
X-Gm-Message-State: AOAM533UQcFUOAH37KuaCp3DxqE8CTCqXCS54ius2JchQ/wJr3tTEz3G
 GGeK7l5E3bcr4RtR/cNxz9Y4u7Bf2EbljMQQYZATfA==
X-Google-Smtp-Source: ABdhPJy+GPAwrcYY8Nvf2URgxWkkur80W1TCGUfjL/+k9ZGOhfHZvhXtuaE+ZokZPuMxVRVvWSu2XhfU1kJijuGFeTc=
X-Received: by 2002:a17:906:2486:b0:6cf:ced9:e4cc with SMTP id
 e6-20020a170906248600b006cfced9e4ccmr4970289ejb.201.1646549252556; Sat, 05
 Mar 2022 22:47:32 -0800 (PST)
MIME-Version: 1.0
References: <20220222223830.2319856-1-atishp@rivosinc.com>
 <CANzO1D05q8_-PSs5KJsnO+MPWVWLrFoYsvhPXGK2eUC8rwBqDw@mail.gmail.com>
In-Reply-To: <CANzO1D05q8_-PSs5KJsnO+MPWVWLrFoYsvhPXGK2eUC8rwBqDw@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 6 Mar 2022 14:47:21 +0800
Message-ID: <CAE_xrPjKd0NEz3ZiYA5w+noG2XDtY0sqQYKbo=wNjAHicRw+dQ@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Add isa extenstion strings to the device
 tree
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Heiko Stubner <heiko@sntech.de>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="0000000000004de51105d9871f61"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-ej1-x62d.google.com
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
X-List-Received-Date: Sun, 06 Mar 2022 06:47:36 -0000

--0000000000004de51105d9871f61
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Typo in patch title:
s/extenstion/extension/g

Regards,
Frank Chang

On Sat, Feb 26, 2022 at 3:45 PM Frank Chang <frank.chang@sifive.com> wrote:

>
>
> Atish Patra <atishp@rivosinc.com> =E6=96=BC 2022=E5=B9=B42=E6=9C=8823=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=886:39=E5=AF=AB=E9=81=93=EF=BC=9A
>
>> The Linux kernel parses the ISA extensions from "riscv,isa" DT
>> property. It used to parse only the single letter base extensions
>> until now. A generic ISA extension parsing framework was proposed[1]
>> recently that can parse multi-letter ISA extensions as well.
>>
>> Generate the extended ISA string by appending  the available ISA
>> extensions
>> to the "riscv,isa" string if it is enabled so that kernel can process it=
.
>>
>> [1] https://lkml.org/lkml/2022/2/15/263
>>
>> Suggested-by: Heiko Stubner <heiko@sntech.de>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>> Changes from v2->v3:
>> 1. Used g_strconcat to replace snprintf & a max isa string length as
>> suggested by Anup.
>> 2. I have not included the Tested-by Tag from Heiko because the
>> implementation changed from v2 to v3.
>>
>> Changes from v1->v2:
>> 1. Improved the code redability by using arrays instead of individual
>> check
>> ---
>>  target/riscv/cpu.c | 29 +++++++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index b0a40b83e7a8..2c7ff6ef555a 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -34,6 +34,12 @@
>>
>>  /* RISC-V CPU definitions */
>>
>> +/* This includes the null terminated character '\0' */
>> +struct isa_ext_data {
>> +        const char *name;
>> +        bool enabled;
>> +};
>> +
>>  static const char riscv_exts[26] =3D "IEMAFDQCLBJTPVNSUHKORWXYZG";
>>
>>  const char * const riscv_int_regnames[] =3D {
>> @@ -881,6 +887,28 @@ static void riscv_cpu_class_init(ObjectClass *c,
>> void *data)
>>      device_class_set_props(dc, riscv_cpu_properties);
>>  }
>>
>> +static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int
>> max_str_len)
>> +{
>> +    char *old =3D *isa_str;
>> +    char *new =3D *isa_str;
>> +    int i;
>> +    struct isa_ext_data isa_edata_arr[] =3D {
>> +        { "svpbmt", cpu->cfg.ext_svpbmt   },
>> +        { "svinval", cpu->cfg.ext_svinval },
>> +        { "svnapot", cpu->cfg.ext_svnapot },
>>
>
> We still have other sub-extensions, e.g. Zfh, Zba, Zbb, Zbc, Zbs... etc.
> Do you mind adding them as well?
>
> Also, I think the order of ISA strings should be alphabetical as describe=
d:
> https://github.com/riscv/riscv-isa-manual/blob/master/src/naming.tex#L96
>
> Regards,
> Frank Chang
>
>
>> +    };
>> +
>> +    for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
>> +        if (isa_edata_arr[i].enabled) {
>> +            new =3D g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
>> +            g_free(old);
>> +            old =3D new;
>> +        }
>> +    }
>> +
>> +    *isa_str =3D new;
>> +}
>> +
>>  char *riscv_isa_string(RISCVCPU *cpu)
>>  {
>>      int i;
>> @@ -893,6 +921,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
>>          }
>>      }
>>      *p =3D '\0';
>> +    riscv_isa_string_ext(cpu, &isa_str, maxlen);
>>      return isa_str;
>>  }
>>
>> --
>> 2.30.2
>>
>>

--0000000000004de51105d9871f61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Typo in patch title:</div><div>s/extenstion/extension=
/g</div><div><br></div><div>Regards,</div><div>Frank Chang</div><div dir=3D=
"ltr"><br></div><div dir=3D"ltr">On Sat, Feb 26, 2022 at 3:45 PM Frank Chan=
g &lt;<a href=3D"mailto:frank.chang@sifive.com">frank.chang@sifive.com</a>&=
gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Atish Patra &lt=
;<a href=3D"mailto:atishp@rivosinc.com" target=3D"_blank">atishp@rivosinc.c=
om</a>&gt; =E6=96=BC 2022=E5=B9=B42=E6=9C=8823=E6=97=A5 =E9=80=B1=E4=B8=89 =
=E4=B8=8A=E5=8D=886:39=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">The Linux kernel parses the ISA extension=
s from &quot;riscv,isa&quot; DT<br>
property. It used to parse only the single letter base extensions<br>
until now. A generic ISA extension parsing framework was proposed[1]<br>
recently that can parse multi-letter ISA extensions as well.<br>
<br>
Generate the extended ISA string by appending=C2=A0 the available ISA exten=
sions<br>
to the &quot;riscv,isa&quot; string if it is enabled so that kernel can pro=
cess it.<br>
<br>
[1] <a href=3D"https://lkml.org/lkml/2022/2/15/263" rel=3D"noreferrer" targ=
et=3D"_blank">https://lkml.org/lkml/2022/2/15/263</a><br>
<br>
Suggested-by: Heiko Stubner &lt;<a href=3D"mailto:heiko@sntech.de" target=
=3D"_blank">heiko@sntech.de</a>&gt;<br>
Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" targe=
t=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
---<br>
Changes from v2-&gt;v3:<br>
1. Used g_strconcat to replace snprintf &amp; a max isa string length as<br=
>
suggested by Anup.<br>
2. I have not included the Tested-by Tag from Heiko because the<br>
implementation changed from v2 to v3.<br>
<br>
Changes from v1-&gt;v2:<br>
1. Improved the code redability by using arrays instead of individual check=
<br>
---<br>
=C2=A0target/riscv/cpu.c | 29 +++++++++++++++++++++++++++++<br>
=C2=A01 file changed, 29 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index b0a40b83e7a8..2c7ff6ef555a 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -34,6 +34,12 @@<br>
<br>
=C2=A0/* RISC-V CPU definitions */<br>
<br>
+/* This includes the null terminated character &#39;\0&#39; */<br>
+struct isa_ext_data {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool enabled;<br>
+};<br>
+<br>
=C2=A0static const char riscv_exts[26] =3D &quot;IEMAFDQCLBJTPVNSUHKORWXYZG=
&quot;;<br>
<br>
=C2=A0const char * const riscv_int_regnames[] =3D {<br>
@@ -881,6 +887,28 @@ static void riscv_cpu_class_init(ObjectClass *c, void =
*data)<br>
=C2=A0 =C2=A0 =C2=A0device_class_set_props(dc, riscv_cpu_properties);<br>
=C2=A0}<br>
<br>
+static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_st=
r_len)<br>
+{<br>
+=C2=A0 =C2=A0 char *old =3D *isa_str;<br>
+=C2=A0 =C2=A0 char *new =3D *isa_str;<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 struct isa_ext_data isa_edata_arr[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;svpbmt&quot;, cpu-&gt;cfg.ext_svpbmt=
=C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;svinval&quot;, cpu-&gt;cfg.ext_svinval=
 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;svnapot&quot;, cpu-&gt;cfg.ext_svnapot=
 },<br></blockquote><div><br></div><div>We still have other sub-extensions,=
 e.g. Zfh, Zba, Zbb, Zbc, Zbs... etc.</div><div>Do you mind adding them as =
well?</div><div><br></div><div>Also, I think the order of ISA strings shoul=
d be alphabetical as described:</div><div><a href=3D"https://github.com/ris=
cv/riscv-isa-manual/blob/master/src/naming.tex#L96" target=3D"_blank">https=
://github.com/riscv/riscv-isa-manual/blob/master/src/naming.tex#L96</a><br>=
</div><div><br></div><div>Regards,</div><div>Frank Chang</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(isa_edata_arr); i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (isa_edata_arr[i].enabled) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new =3D g_strconcat(old, &quot;_=
&quot;, isa_edata_arr[i].name, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(old);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 old =3D new;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 *isa_str =3D new;<br>
+}<br>
+<br>
=C2=A0char *riscv_isa_string(RISCVCPU *cpu)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
@@ -893,6 +921,7 @@ char *riscv_isa_string(RISCVCPU *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0*p =3D &#39;\0&#39;;<br>
+=C2=A0 =C2=A0 riscv_isa_string_ext(cpu, &amp;isa_str, maxlen);<br>
=C2=A0 =C2=A0 =C2=A0return isa_str;<br>
=C2=A0}<br>
<br>
-- <br>
2.30.2<br>
<br></blockquote></div></div>
</blockquote></div></div>

--0000000000004de51105d9871f61--

