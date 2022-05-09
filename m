Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1no8or-0001yl-9l
	for mharc-qemu-riscv@gnu.org; Mon, 09 May 2022 15:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1no8op-0001yF-Vp
 for qemu-riscv@nongnu.org; Mon, 09 May 2022 15:13:20 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:42659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1no8oo-0007Mc-1w
 for qemu-riscv@nongnu.org; Mon, 09 May 2022 15:13:19 -0400
Received: by mail-yb1-xb32.google.com with SMTP id i11so4703236ybq.9
 for <qemu-riscv@nongnu.org>; Mon, 09 May 2022 12:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9OqDkRRuvVTI2G4Jm93FQeyym7FQ71vx2PHKq8by+Ec=;
 b=KHE5KQLNvafD44CEMDsiNMDsvYWIRRWfVphhc0+lDgb8Qy5K0cF4IVnjwcOC7HA/D4
 UCaNRTA29U0pZbrrD9wcaj28/ldj7w2Zx2GfydUt4FyruIj4ab6TGMfQddYGCkAODIR2
 LP4K63ubYwKliqTXrwZzuQBn5pp54vhl9u0F8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9OqDkRRuvVTI2G4Jm93FQeyym7FQ71vx2PHKq8by+Ec=;
 b=2MntYULi2JvPRKz7AREddmE0ylKbbSOLYusbo2As1qQIHnwAQXVLGuJip3D1BUkDzv
 ltyxPsN1Mk5DHYia96m9wkugPy/MSq8p4nAvCzWbCUxCyVGUOlRT2xp4McTzLocqhvG4
 FJpvFomRMYr7mDDS6OztSQ4hvJUlpECLRvvFBaxc9cmnH+z/69sSAbrzw8/SZ+DJ42F0
 GJaSbMcIyes9QbA6ccYNht2qgspHocHV8wu/dnG+ob9bSitcef6C/jpVCLmkQ3D+fFpv
 EmqjDkzZRQs57Z2sqeNiDFXtbNkwJwYvTKKDfc7iuP9PWtLVp7QFBL542hsjTsB+yraL
 MX7A==
X-Gm-Message-State: AOAM533n/+3X8gGopSDusLuRqQjOMubR8oZZblmeuHVa//qoCOkAogP9
 cfIw+JSlkL8KwP4pdZ649Uf+20m2yekVlwLeTmoz
X-Google-Smtp-Source: ABdhPJyj1OFDeJa7TiMWgT4Meg7t7pqee5ERU/Wh12DXlpMQYSa+6a0xU+vXKPjJfOISKc2tLy9MA5OI3LFeoZN9r38=
X-Received: by 2002:a25:9247:0:b0:645:ddd5:a182 with SMTP id
 e7-20020a259247000000b00645ddd5a182mr14460943ybo.289.1652123596522; Mon, 09
 May 2022 12:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220429033409.258707-1-apatel@ventanamicro.com>
 <20220429033409.258707-2-apatel@ventanamicro.com>
 <CANzO1D1RvmXF-BdZ1iMhwLwikcVveCYjtXtgT5KEcrXF++xXrA@mail.gmail.com>
In-Reply-To: <CANzO1D1RvmXF-BdZ1iMhwLwikcVveCYjtXtgT5KEcrXF++xXrA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 9 May 2022 12:13:05 -0700
Message-ID: <CAOnJCUKE2iAshXKvuiGPA+eK5fAO91FvR50OnV-=JKwztqFo7g@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/riscv: Fix csr number based privilege checking
To: Frank Chang <frank.chang@sifive.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000189ccd05de9900d5"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb32.google.com
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
X-List-Received-Date: Mon, 09 May 2022 19:13:20 -0000

--000000000000189ccd05de9900d5
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 29, 2022 at 8:20 PM Frank Chang <frank.chang@sifive.com> wrote:

> Reviewed-by: Frank Chang <frank.chang@sifive.com>
>
> On Fri, Apr 29, 2022 at 11:34 AM Anup Patel <apatel@ventanamicro.com>
> wrote:
>
>> When hypervisor and VS CSRs are accessed from VS-mode or VU-mode,
>> the riscv_csrrw_check() function should generate virtual instruction
>> trap instead illegal instruction trap.
>>
>> Fixes: 533c91e8f22c ("target/riscv: Use RISCVException enum for
>> CSR access")
>>
>
This is not the correct Fixes tag. This patch just changed the error code
to enum.
The above said issue exists before this patch.

I think the correct fix should be 0a42f4c44088 (" target/riscv: Fix CSR
perm checking for HS mode"). No ?


> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>> ---
>>  target/riscv/csr.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 3500e07f92..2bf0a97196 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -3139,7 +3139,7 @@ static inline RISCVException
>> riscv_csrrw_check(CPURISCVState *env,
>>      int read_only = get_field(csrno, 0xC00) == 3;
>>      int csr_min_priv = csr_ops[csrno].min_priv_ver;
>>  #if !defined(CONFIG_USER_ONLY)
>> -    int effective_priv = env->priv;
>> +    int csr_priv, effective_priv = env->priv;
>>
>>      if (riscv_has_ext(env, RVH) &&
>>          env->priv == PRV_S &&
>> @@ -3152,7 +3152,11 @@ static inline RISCVException
>> riscv_csrrw_check(CPURISCVState *env,
>>          effective_priv++;
>>      }
>>
>> -    if (!env->debugger && (effective_priv < get_field(csrno, 0x300))) {
>> +    csr_priv = get_field(csrno, 0x300);
>> +    if (!env->debugger && (effective_priv < csr_priv)) {
>> +        if (csr_priv == (PRV_S + 1) && riscv_cpu_virt_enabled(env)) {
>> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> +        }
>>          return RISCV_EXCP_ILLEGAL_INST;
>>      }
>>  #endif
>> --
>> 2.34.1
>>
>>
>>

-- 
Regards,
Atish

--000000000000189ccd05de9900d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 29, 2022 at 8:20 PM Frank=
 Chang &lt;<a href=3D"mailto:frank.chang@sifive.com">frank.chang@sifive.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div dir=3D"ltr"><img src=3D"https://ssl.gstatic.com/ui/v1=
/icons/mail/images/cleardot.gif">Reviewed-by: Frank Chang &lt;<a href=3D"ma=
ilto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&g=
t;</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Fri, Apr 29, 2022 at 11:34 AM Anup Patel &lt;<a href=3D"mailto:apatel@=
ventanamicro.com" target=3D"_blank">apatel@ventanamicro.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">When hypervisor =
and VS CSRs are accessed from VS-mode or VU-mode,<br>
the riscv_csrrw_check() function should generate virtual instruction<br>
trap instead illegal instruction trap.<br>
<br>
Fixes: 533c91e8f22c (&quot;target/riscv: Use RISCVException enum for<br>
CSR access&quot;)<br></blockquote></div></div></blockquote><div><br></div><=
div>This is not the correct Fixes tag. This patch just changed the error co=
de to enum.<br>The above said issue exists before this patch.</div><div><br=
></div><div>I think the correct fix should be=C2=A00a42f4c44088 (&quot; tar=
get/riscv: Fix CSR perm checking for HS mode&quot;). No ?</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:apatel@ventanamicro.com" ta=
rget=3D"_blank">apatel@ventanamicro.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/csr.c | 8 ++++++--<br>
=C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index 3500e07f92..2bf0a97196 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -3139,7 +3139,7 @@ static inline RISCVException riscv_csrrw_check(CPURIS=
CVState *env,<br>
=C2=A0 =C2=A0 =C2=A0int read_only =3D get_field(csrno, 0xC00) =3D=3D 3;<br>
=C2=A0 =C2=A0 =C2=A0int csr_min_priv =3D csr_ops[csrno].min_priv_ver;<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
-=C2=A0 =C2=A0 int effective_priv =3D env-&gt;priv;<br>
+=C2=A0 =C2=A0 int csr_priv, effective_priv =3D env-&gt;priv;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_has_ext(env, RVH) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;priv =3D=3D PRV_S &amp;&amp;<br>
@@ -3152,7 +3152,11 @@ static inline RISCVException riscv_csrrw_check(CPURI=
SCVState *env,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0effective_priv++;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; (effective_priv &lt; get_fi=
eld(csrno, 0x300))) {<br>
+=C2=A0 =C2=A0 csr_priv =3D get_field(csrno, 0x300);<br>
+=C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; (effective_priv &lt; csr_pr=
iv)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (csr_priv =3D=3D (PRV_S + 1) &amp;&amp; ris=
cv_cpu_virt_enabled(env)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_VIRT_INSTRUCTI=
ON_FAULT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_ILLEGAL_INST;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Atish</div></div><=
/div></div>

--000000000000189ccd05de9900d5--

