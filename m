Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nBzSV-0002Gl-7y
	for mharc-qemu-riscv@gnu.org; Mon, 24 Jan 2022 08:32:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nBzST-0002DJ-DX; Mon, 24 Jan 2022 08:32:33 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:43773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nBzSR-000679-Ja; Mon, 24 Jan 2022 08:32:33 -0500
Received: by mail-ua1-f51.google.com with SMTP id 2so30982493uax.10;
 Mon, 24 Jan 2022 05:32:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AS7DMLXhYyb9l2U/N7ez5nzYK9IGA/8ZG2W5/wB/wUI=;
 b=MfRSAEGugcAIdNdmI46+XK2met41b41OQXzZqHLJZoaGwxe8vlVcKrbpXGS3jCBqvT
 TDaABZK3HJYP3zNxqrUc8nMYbvKQ4Os9Nb/HLe0WirTeCGA2BF8jfPBfICY89ptWgQE4
 5rr7NzGivnCf32LytuLR+vCWFc2eZIBMTHtXQ+HT6gWHR2g13ZkUrJkOPTJX5//yUIuu
 aKM1aaslsqu+qkAftXJxKnRYbyk/ccE2MJDht5MSWFPL+VWxDuiX/WR6sfjfTYzqVM6Z
 +djNnfUHeINsS8lzLsm8ZGKT8r5uCcvzIOtAl7js42N316BX5aDIJdjrbXE9nRmFEBTC
 eK6w==
X-Gm-Message-State: AOAM530KX2VtcdKgtYneyTmCiBH1Azwzo7Cgx+nVNlxyZPbqwdEUoJ8X
 InnWANxFvTWaNvuzSnO+3cyirPhNjqi+inMqDbg=
X-Google-Smtp-Source: ABdhPJz9BakWplEIPuVeAS1bLziI3r4pAgQi3dOrQFW4gpuJsAK/ZWmdezf7rOW7thcSzB5QFbelzg==
X-Received: by 2002:a9f:2e18:: with SMTP id t24mr5348385uaj.21.1643031149778; 
 Mon, 24 Jan 2022 05:32:29 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49])
 by smtp.gmail.com with ESMTPSA id e13sm2775545ual.17.2022.01.24.05.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 05:32:29 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id c36so30916262uae.13;
 Mon, 24 Jan 2022 05:32:29 -0800 (PST)
X-Received: by 2002:a05:6102:7a3:: with SMTP id x3mr3749279vsg.4.1643031148847; 
 Mon, 24 Jan 2022 05:32:28 -0800 (PST)
MIME-Version: 1.0
References: <20220120200735.2739543-1-atishp@rivosinc.com>
 <20220120200735.2739543-6-atishp@rivosinc.com>
In-Reply-To: <20220120200735.2739543-6-atishp@rivosinc.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <cmuellner@linux.com>
Date: Mon, 24 Jan 2022 14:32:17 +0100
X-Gmail-Original-Message-ID: <CAHB2gtQxLo=UuGnGtJPaNqA-Tc19vJCHnyqUmjNV6mAU6hPZ3w@mail.gmail.com>
Message-ID: <CAHB2gtQxLo=UuGnGtJPaNqA-Tc19vJCHnyqUmjNV6mAU6hPZ3w@mail.gmail.com>
Subject: Re: [RFC 5/5] target/riscv: Enable privileged spec version 1.12
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Anup Patel <anup@brainfault.org>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="000000000000fb665805d653ffd3"
Received-SPF: pass client-ip=209.85.222.51;
 envelope-from=christophm30@gmail.com; helo=mail-ua1-f51.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 24 Jan 2022 13:32:33 -0000

--000000000000fb665805d653ffd3
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 21, 2022 at 12:16 AM Atish Patra <atishp@rivosinc.com> wrote:

> Virt machine uses privileged specification version 1.12 now.
> All other machine continue to use the default one defined for that
> machine unless changed to 1.12 by the user explicitly.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  target/riscv/cpu.c |  8 +++++---
>  target/riscv/csr.c | 10 ++++++++++
>  2 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9bc25d3055d4..cec5791151e7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -153,7 +153,7 @@ static void riscv_any_cpu_init(Object *obj)
>  #elif defined(TARGET_RISCV64)
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
>  #endif
> -    set_priv_version(env, PRIV_VERSION_1_11_0);
> +    set_priv_version(env, PRIV_VERSION_1_12_0);
>  }
>
>  #if defined(TARGET_RISCV64)
> @@ -439,7 +439,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error
> **errp)
>      }
>
>      if (cpu->cfg.priv_spec) {
> -        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
> +        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
> +            priv_version = PRIV_VERSION_1_12_0;
> +        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
>              priv_version = PRIV_VERSION_1_11_0;
>          } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
>              priv_version = PRIV_VERSION_1_10_0;
> @@ -454,7 +456,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error
> **errp)
>      if (priv_version) {
>          set_priv_version(env, priv_version);
>      } else if (!env->priv_ver) {
> -        set_priv_version(env, PRIV_VERSION_1_11_0);
> +        set_priv_version(env, PRIV_VERSION_1_12_0);
>      }
>
>      if (cpu->cfg.mmu) {
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index a4bbae7a1bbd..62d429cc3f17 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1874,6 +1874,12 @@ static inline RISCVException
> riscv_csrrw_check(CPURISCVState *env,
>      int read_only = get_field(csrno, 0xC00) == 3;
>  #if !defined(CONFIG_USER_ONLY)
>      int effective_priv = env->priv;
> +    int csr_min_priv = csr_ops[csrno].min_priv_ver;
> +
> +    /* The default privilege specification version supported is 1.10 */
> +    if (!csr_min_priv) {
> +        csr_min_priv = PRIV_VERSION_1_10_0;
> +    }
>
>      if (riscv_has_ext(env, RVH) &&
>          env->priv == PRV_S &&
> @@ -1904,6 +1910,10 @@ static inline RISCVException
> riscv_csrrw_check(CPURISCVState *env,
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> +    if (env->priv_ver < csr_min_priv) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
>

This does not compile if CONFIG_USER_ONLY is defined.


> +
>      return csr_ops[csrno].predicate(env, csrno);
>  }
>
> --
> 2.30.2
>
>

--000000000000fb665805d653ffd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 21, 2022 at 12:16 AM Atis=
h Patra &lt;<a href=3D"mailto:atishp@rivosinc.com">atishp@rivosinc.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Virt =
machine uses privileged specification version 1.12 now.<br>
All other machine continue to use the default one defined for that<br>
machine unless changed to 1.12 by the user explicitly.<br>
<br>
Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" targe=
t=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c |=C2=A0 8 +++++---<br>
=C2=A0target/riscv/csr.c | 10 ++++++++++<br>
=C2=A02 files changed, 15 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 9bc25d3055d4..cec5791151e7 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -153,7 +153,7 @@ static void riscv_any_cpu_init(Object *obj)<br>
=C2=A0#elif defined(TARGET_RISCV64)<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | R=
VC | RVU);<br>
=C2=A0#endif<br>
-=C2=A0 =C2=A0 set_priv_version(env, PRIV_VERSION_1_11_0);<br>
+=C2=A0 =C2=A0 set_priv_version(env, PRIV_VERSION_1_12_0);<br>
=C2=A0}<br>
<br>
=C2=A0#if defined(TARGET_RISCV64)<br>
@@ -439,7 +439,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error *=
*errp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (cpu-&gt;cfg.priv_spec) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!g_strcmp0(cpu-&gt;cfg.priv_spec, &quot;v1=
.11.0&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!g_strcmp0(cpu-&gt;cfg.priv_spec, &quot;v1=
.12.0&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv_version =3D PRIV_VERSION_1_=
12_0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!g_strcmp0(cpu-&gt;cfg.priv_spec, &=
quot;v1.11.0&quot;)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv_version =3D PRIV_VERSI=
ON_1_11_0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (!g_strcmp0(cpu-&gt;cfg.priv_sp=
ec, &quot;v1.10.0&quot;)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv_version =3D PRIV_VERSI=
ON_1_10_0;<br>
@@ -454,7 +456,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error *=
*errp)<br>
=C2=A0 =C2=A0 =C2=A0if (priv_version) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_priv_version(env, priv_version);<br>
=C2=A0 =C2=A0 =C2=A0} else if (!env-&gt;priv_ver) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_priv_version(env, PRIV_VERSION_1_11_0);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_priv_version(env, PRIV_VERSION_1_12_0);<br=
>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (cpu-&gt;cfg.mmu) {<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index a4bbae7a1bbd..62d429cc3f17 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -1874,6 +1874,12 @@ static inline RISCVException riscv_csrrw_check(CPURI=
SCVState *env,<br>
=C2=A0 =C2=A0 =C2=A0int read_only =3D get_field(csrno, 0xC00) =3D=3D 3;<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
=C2=A0 =C2=A0 =C2=A0int effective_priv =3D env-&gt;priv;<br>
+=C2=A0 =C2=A0 int csr_min_priv =3D csr_ops[csrno].min_priv_ver;<br>
+<br>
+=C2=A0 =C2=A0 /* The default privilege specification version supported is =
1.10 */<br>
+=C2=A0 =C2=A0 if (!csr_min_priv) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 csr_min_priv =3D PRIV_VERSION_1_10_0;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_has_ext(env, RVH) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;priv =3D=3D PRV_S &amp;&amp;<br>
@@ -1904,6 +1910,10 @@ static inline RISCVException riscv_csrrw_check(CPURI=
SCVState *env,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_ILLEGAL_INST;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (env-&gt;priv_ver &lt; csr_min_priv) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>This does not compile =
if CONFIG_USER_ONLY is defined.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
+<br>
=C2=A0 =C2=A0 =C2=A0return csr_ops[csrno].predicate(env, csrno);<br>
=C2=A0}<br>
<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div></div>

--000000000000fb665805d653ffd3--

