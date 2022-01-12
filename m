Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7cpg-0005Q5-T2
	for mharc-qemu-riscv@gnu.org; Wed, 12 Jan 2022 07:34:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7cpb-0005M7-V7
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 07:34:24 -0500
Received: from [2607:f8b0:4864:20::1033] (port=47016
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7cpZ-0005QV-L6
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 07:34:23 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so4412580pjb.5
 for <qemu-riscv@nongnu.org>; Wed, 12 Jan 2022 04:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IgTyd5K7dUGa98vSL8GCnaNsTSPyf2gPaaAIZQ+Abxg=;
 b=MzcAvj5Z+dl6kgty6aY2DrlshP2eXrZXRcVanLdJExtgeARjE0GAT738at+ZOifl0I
 m0/G3cOBAODLCQvKuuDaTn1rg44nUdKq0tjxa18v4uT5ZI9ZqO206ueeXJfCzRCVQLYU
 SGEqLcA57WER01Udw1+gdMKiJuGXCEPQ3BjqTLMuan/+qVCT6OojN8PRbn2EITanCwwN
 0YBA+v+8RFkV9Hf7r0d937AIA+hmO+5HZ/soXZLg+86RL9g+GLuGdMdmNTbd4t+cWQc+
 DNVQIjRpBX8Inv/MHn+bKDIuDd6WvaTsKQh2uedDXBPPBvS6zA6GpfcNjQJ9LI0X+0dS
 EBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IgTyd5K7dUGa98vSL8GCnaNsTSPyf2gPaaAIZQ+Abxg=;
 b=Hvu5vX4jDNw3ojJ4KPXfiunoyYdmn2p1fsuEXwm4bRtaTJw1IgTLQFXdX5mHzWWie4
 T1PdPndxl5Hnizp0NLJYxa7XBXHFaWT+gTJrmwYUAXsk0MAwkEQ3oUAPRv7PBc7dTbg0
 Cd23OG5SNLucuFaPpyMRhRrSuKmOrPUoE501W1m9+H24aOE60jaTPIwKKFcGvLN2gu5g
 EHrLadMxFaUaNs0I/ub85NCj6X4ir4eDB27vYPpwSC8xhRO+QPzsLHTosVom1teEQf+5
 FSbgCgtb8FEDDdrjXpfypYKhT+Oaw5JE0UuFrLW053gu61YA1oDOHVjZxtQNIpxncWAS
 ZM0A==
X-Gm-Message-State: AOAM532rp7HlBUWpkeVWbX+IH3334DoDgYDxZ7NgMDMDs9PwOtKC30vJ
 5NRJFelb6qN5DHxZKImAHJdb/6X1QHNsCu7G
X-Google-Smtp-Source: ABdhPJzDrfcIbjMZQDPuLpK9LjSFZeHrr3VLlb0jMLdBM2j9xCRqI7GofkCIUkzP542/8wI9wlvIOw==
X-Received: by 2002:a62:64cf:0:b0:4bf:2e95:373a with SMTP id
 y198-20020a6264cf000000b004bf2e95373amr9122143pfb.41.1641990859497; 
 Wed, 12 Jan 2022 04:34:19 -0800 (PST)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com.
 [209.85.216.48])
 by smtp.gmail.com with ESMTPSA id v11sm11300279pfi.191.2022.01.12.04.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 04:34:19 -0800 (PST)
Received: by mail-pj1-f48.google.com with SMTP id
 ie23-20020a17090b401700b001b38a5318easo4470819pjb.2; 
 Wed, 12 Jan 2022 04:34:18 -0800 (PST)
X-Received: by 2002:a65:6ab8:: with SMTP id x24mr8265601pgu.50.1641990858274; 
 Wed, 12 Jan 2022 04:34:18 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-6-anup@brainfault.org>
In-Reply-To: <20211230123539.52786-6-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 12 Jan 2022 20:34:07 +0800
X-Gmail-Original-Message-ID: <CANzO1D1YeMXr-7iEF_F=YzH6YtsO=mk+D5_pRT5C1SBujLN+DA@mail.gmail.com>
Message-ID: <CANzO1D1YeMXr-7iEF_F=YzH6YtsO=mk+D5_pRT5C1SBujLN+DA@mail.gmail.com>
Subject: Re: [PATCH v6 05/23] target/riscv: Allow setting CPU feature from
 machine/device emulation
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d4fa6605d561c9ab"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 12 Jan 2022 12:34:24 -0000

--000000000000d4fa6605d561c9ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:36=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> The machine or device emulation should be able to force set certain
> CPU features because:
> 1) We can have certain CPU features which are in-general optional
>    but implemented by RISC-V CPUs on the machine.
> 2) We can have devices which require a certain CPU feature. For example,
>    AIA IMSIC devices expect AIA CSRs implemented by RISC-V CPUs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 11 +++--------
>  target/riscv/cpu.h |  5 +++++
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f4dbc766c2..9f1a4d1088 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -124,11 +124,6 @@ static void set_vext_version(CPURISCVState *env, int
> vext_ver)
>      env->vext_ver =3D vext_ver;
>  }
>
> -static void set_feature(CPURISCVState *env, int feature)
> -{
> -    env->features |=3D (1ULL << feature);
> -}
> -
>  static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
>  {
>  #ifndef CONFIG_USER_ONLY
> @@ -434,18 +429,18 @@ static void riscv_cpu_realize(DeviceState *dev,
> Error **errp)
>      }
>
>      if (cpu->cfg.mmu) {
> -        set_feature(env, RISCV_FEATURE_MMU);
> +        riscv_set_feature(env, RISCV_FEATURE_MMU);
>      }
>
>      if (cpu->cfg.pmp) {
> -        set_feature(env, RISCV_FEATURE_PMP);
> +        riscv_set_feature(env, RISCV_FEATURE_PMP);
>
>          /*
>           * Enhanced PMP should only be available
>           * on harts with PMP support
>           */
>          if (cpu->cfg.epmp) {
> -            set_feature(env, RISCV_FEATURE_EPMP);
> +            riscv_set_feature(env, RISCV_FEATURE_EPMP);
>          }
>      }
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 6895ac138c..1bdd03731f 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -344,6 +344,11 @@ static inline bool riscv_feature(CPURISCVState *env,
> int feature)
>      return env->features & (1ULL << feature);
>  }
>
> +static inline void riscv_set_feature(CPURISCVState *env, int feature)
> +{
> +    env->features |=3D (1ULL << feature);
> +}
> +
>  #include "cpu_user.h"
>
>  extern const char * const riscv_int_regnames[];
> --
> 2.25.1
>
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--000000000000d4fa6605d561c9ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Anup Patel &lt;<a href=3D"mailto:anup@bra=
infault.org">anup@brainfault.org</a>&gt; =E6=96=BC 2021=E5=B9=B412=E6=9C=88=
30=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:36=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com=
" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
<br>
The machine or device emulation should be able to force set certain<br>
CPU features because:<br>
1) We can have certain CPU features which are in-general optional<br>
=C2=A0 =C2=A0but implemented by RISC-V CPUs on the machine.<br>
2) We can have devices which require a certain CPU feature. For example,<br=
>
=C2=A0 =C2=A0AIA IMSIC devices expect AIA CSRs implemented by RISC-V CPUs.<=
br>
<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
Reviewed-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D"_=
blank">bmeng.cn@gmail.com</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c | 11 +++--------<br>
=C2=A0target/riscv/cpu.h |=C2=A0 5 +++++<br>
=C2=A02 files changed, 8 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index f4dbc766c2..9f1a4d1088 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -124,11 +124,6 @@ static void set_vext_version(CPURISCVState *env, int v=
ext_ver)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;vext_ver =3D vext_ver;<br>
=C2=A0}<br>
<br>
-static void set_feature(CPURISCVState *env, int feature)<br>
-{<br>
-=C2=A0 =C2=A0 env-&gt;features |=3D (1ULL &lt;&lt; feature);<br>
-}<br>
-<br>
=C2=A0static void set_resetvec(CPURISCVState *env, target_ulong resetvec)<b=
r>
=C2=A0{<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
@@ -434,18 +429,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (cpu-&gt;cfg.mmu) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_MMU);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_set_feature(env, RISCV_FEATURE_MMU);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (cpu-&gt;cfg.pmp) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_PMP);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_set_feature(env, RISCV_FEATURE_PMP);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Enhanced PMP should only be available<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * on harts with PMP support<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu-&gt;cfg.epmp) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_E=
PMP);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_set_feature(env, RISCV_FEA=
TURE_EPMP);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index 6895ac138c..1bdd03731f 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -344,6 +344,11 @@ static inline bool riscv_feature(CPURISCVState *env, i=
nt feature)<br>
=C2=A0 =C2=A0 =C2=A0return env-&gt;features &amp; (1ULL &lt;&lt; feature);<=
br>
=C2=A0}<br>
<br>
+static inline void riscv_set_feature(CPURISCVState *env, int feature)<br>
+{<br>
+=C2=A0 =C2=A0 env-&gt;features |=3D (1ULL &lt;&lt; feature);<br>
+}<br>
+<br>
=C2=A0#include &quot;cpu_user.h&quot;<br>
<br>
=C2=A0extern const char * const riscv_int_regnames[];<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com=
</a>&gt;=C2=A0=C2=A0</div></div></div>

--000000000000d4fa6605d561c9ab--

