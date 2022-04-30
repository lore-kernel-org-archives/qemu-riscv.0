Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nkdec-0004w8-W7
	for mharc-qemu-riscv@gnu.org; Fri, 29 Apr 2022 23:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nkdeb-0004tg-BV
 for qemu-riscv@nongnu.org; Fri, 29 Apr 2022 23:20:17 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d]:34441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nkdeX-00078W-Et
 for qemu-riscv@nongnu.org; Fri, 29 Apr 2022 23:20:15 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id b81so4567643vkf.1
 for <qemu-riscv@nongnu.org>; Fri, 29 Apr 2022 20:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GZnZMu5kQ6mBoMM17ZJMl59sUVbOB24EAPfD4+O46fs=;
 b=muC3dKTtfquUuoTgcCgSQQZjTbmNPq8p7FPmlLTC7X//nw8klxz8LjCPLPE+BI/F7s
 NYZHVVC63WvD88DeXPqWdTU9X/d6gGJGgpV65nmRAHPDKx/AoQ6inn/HRc3OjBDRPfgm
 D6MD18KMh22Rh1S2/SxKBU4oAhrPWgFlRB+67sDP2OKZJNx4v1S+1y3q7gy5V4p9eiNk
 HebtS8F6m7WKI31P+JBOVXRUC/ht6ZY2GrgLmuGXFVjI3nlCMAixUemHxXNiml8nPQ6B
 iwZAlwiS2PuevNHEiQweGnBg40t5fUm1+Q9w5sxjQJfZ+k3VQOqANG4zUl1kk6ewWLjY
 AWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GZnZMu5kQ6mBoMM17ZJMl59sUVbOB24EAPfD4+O46fs=;
 b=geKrqA3MsFTbQ4L2kprHdsgVCK5nTDl0jC+xr4aLErcOAMGPL+H8rOdJkaYKz34/9S
 0rHf1Cwa2OVPzGhc2kSZYzW7ZpHngy5+BElyvUX6UmngQ8W6NXvWkABAKoMGfoQp3h9l
 gs9nyTeMAo+ZQa+1PQMvy/M/WumrNE/ji6zyah+TZkZF39tZIL8VnV9tWTATD83J8U/H
 ECTu1ENe7f4KeloF8acnjGuPabut6SnKW+6+RyRT9+rl1K+9eFBpJh6217jhUXih6la2
 IdtvAexzoeCwNlWS2AovKh5jAQnwUtuGW5uCoRUWX0BF3mKaRzp2iuhPo/VZXy6ZSVBL
 rBFw==
X-Gm-Message-State: AOAM5325Q9js9eSIdlILjewBot7xREUfAjGmGDPOTjqM2tj3uv7nVg0F
 3yE6kNXcOuiycDeCkDQPvgXHqRdGRxGb4/aTQsg=
X-Google-Smtp-Source: ABdhPJx6tEKcWziL1eDnw8fqSvNIIAxOrLRVA2k+FfBJ1r09mAVMMuiGy8TJfn0ASRWRmtLMw/fslw==
X-Received: by 2002:a1f:1184:0:b0:345:15de:73a with SMTP id
 126-20020a1f1184000000b0034515de073amr591821vkr.23.1651288808348; 
 Fri, 29 Apr 2022 20:20:08 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com.
 [209.85.221.174]) by smtp.gmail.com with ESMTPSA id
 x5-20020ab07805000000b003626f894ddbsm1849808uaq.9.2022.04.29.20.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 20:20:06 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id n135so4545524vkn.7;
 Fri, 29 Apr 2022 20:20:06 -0700 (PDT)
X-Received: by 2002:a05:6122:2229:b0:32d:1642:b58b with SMTP id
 bb41-20020a056122222900b0032d1642b58bmr608891vkb.27.1651288806399; Fri, 29
 Apr 2022 20:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220429033409.258707-1-apatel@ventanamicro.com>
 <20220429033409.258707-2-apatel@ventanamicro.com>
In-Reply-To: <20220429033409.258707-2-apatel@ventanamicro.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sat, 30 Apr 2022 11:19:55 +0800
X-Gmail-Original-Message-ID: <CANzO1D1RvmXF-BdZ1iMhwLwikcVveCYjtXtgT5KEcrXF++xXrA@mail.gmail.com>
Message-ID: <CANzO1D1RvmXF-BdZ1iMhwLwikcVveCYjtXtgT5KEcrXF++xXrA@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/riscv: Fix csr number based privilege checking
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: multipart/alternative; boundary="000000000000ba23c505ddd6a2e1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=frank.chang@sifive.com; helo=mail-vk1-xa2d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_IMAGE_ONLY_24=1.618, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_REMOTE_IMAGE=0.01,
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
X-List-Received-Date: Sat, 30 Apr 2022 03:20:17 -0000

--000000000000ba23c505ddd6a2e1
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Fri, Apr 29, 2022 at 11:34 AM Anup Patel <apatel@ventanamicro.com> wrote:

> When hypervisor and VS CSRs are accessed from VS-mode or VU-mode,
> the riscv_csrrw_check() function should generate virtual instruction
> trap instead illegal instruction trap.
>
> Fixes: 533c91e8f22c ("target/riscv: Use RISCVException enum for
> CSR access")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  target/riscv/csr.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 3500e07f92..2bf0a97196 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3139,7 +3139,7 @@ static inline RISCVException
> riscv_csrrw_check(CPURISCVState *env,
>      int read_only = get_field(csrno, 0xC00) == 3;
>      int csr_min_priv = csr_ops[csrno].min_priv_ver;
>  #if !defined(CONFIG_USER_ONLY)
> -    int effective_priv = env->priv;
> +    int csr_priv, effective_priv = env->priv;
>
>      if (riscv_has_ext(env, RVH) &&
>          env->priv == PRV_S &&
> @@ -3152,7 +3152,11 @@ static inline RISCVException
> riscv_csrrw_check(CPURISCVState *env,
>          effective_priv++;
>      }
>
> -    if (!env->debugger && (effective_priv < get_field(csrno, 0x300))) {
> +    csr_priv = get_field(csrno, 0x300);
> +    if (!env->debugger && (effective_priv < csr_priv)) {
> +        if (csr_priv == (PRV_S + 1) && riscv_cpu_virt_enabled(env)) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>  #endif
> --
> 2.34.1
>
>
>

--000000000000ba23c505ddd6a2e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><img class=3D"gmail-ajT" src=3D"https://s=
sl.gstatic.com/ui/v1/icons/mail/images/cleardot.gif">Reviewed-by: Frank Cha=
ng &lt;<a href=3D"mailto:frank.chang@sifive.com">frank.chang@sifive.com</a>=
&gt;</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Fri, Apr 29, 2022 at 11:34 AM Anup Patel &lt;<a href=3D"mailto:apate=
l@ventanamicro.com">apatel@ventanamicro.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">When hypervisor and VS CSRs are =
accessed from VS-mode or VU-mode,<br>
the riscv_csrrw_check() function should generate virtual instruction<br>
trap instead illegal instruction trap.<br>
<br>
Fixes: 533c91e8f22c (&quot;target/riscv: Use RISCVException enum for<br>
CSR access&quot;)<br>
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

--000000000000ba23c505ddd6a2e1--

