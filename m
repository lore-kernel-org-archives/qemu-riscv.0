Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7dTg-0001u6-My
	for mharc-qemu-riscv@gnu.org; Wed, 12 Jan 2022 08:15:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7dTW-0001rP-1f
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 08:15:39 -0500
Received: from [2607:f8b0:4864:20::102e] (port=55248
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7dTQ-0003bS-F8
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 08:15:35 -0500
Received: by mail-pj1-x102e.google.com with SMTP id oa15so4738438pjb.4
 for <qemu-riscv@nongnu.org>; Wed, 12 Jan 2022 05:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rkcBoyo+cXQbA0MPt5DL6NG6DvLFPBEHD2qMd/UT8yQ=;
 b=O+wXRnHtA8xh9dBjdJUKqnr+gjKD6Z7lDlI8JsjNjJlMYECjFXLjQdJKRriG34OxAO
 lvtztRp7lTFVYHNxlMEMqJot/zLysvng5awfr0mgJiweLownfvNQtDffTrpHeyrZaF3o
 WkWpoEMZ3ZwBJHVK/E3Ipu2ijwejPYAeMGkau0jEmRbmGYqff68VJsK158z6d7NkpzGO
 OhkMD2qxcWX8v4Mq04xv9Fe05TFeMsNqKtOqEydKXLe4sZlu+BqRQsbfAGMhtSxpHQ53
 5+9fotqDOBzQ6KCXk3sSUGhCs2rHAPRII32yuVc75RUWbx2ChJNmIQMwWk82bBjWm4xT
 GPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rkcBoyo+cXQbA0MPt5DL6NG6DvLFPBEHD2qMd/UT8yQ=;
 b=Rm5iNKAvG2Za7fTKl89Zn6+vy7pDb2VxV4VA88/PBn67qArNCcnPwlZj/FG/4hkQM/
 uLCCmVX5FCU4jtpprJlaFJB4a6YlF05JhpgHk4mUYpYqfRe8SxWWG/LSKZN5BEA/t81V
 d8QHul83mEOS0OuPCTLIErjUU81pkCud8l7EYEwQ2m2ty3BuVzA1N9yK8W7C0nfnM4uR
 EYMWz/w0l2LN9AcDwLUC4vSbujXwCsonpVN2FgMPv0Fd00UeLgKYbUN0U8+5WAoz+i22
 HfStyQlZcNFgDYFsNXpctsD3emZZF4z/SiSWwwoSaIIanuDX3/8Kezqq5WoFzs59dM+k
 O4DQ==
X-Gm-Message-State: AOAM531lhe3ys2Ku1vH+pjiCPykzQL1WXgsb9CHCV0tU+j7VUdPs42k/
 /nas73Ae0AQ7jjrb05KWFtVhSFnXPX3GLV1g
X-Google-Smtp-Source: ABdhPJxQQxTxrklzgt4OogZYL9rnwL59SLoFzFGDoqkNOaB6LGq8P8T5awoh0VbGEwOsELQe0fD7sw==
X-Received: by 2002:a05:6a00:2286:b0:4bb:3358:7ea0 with SMTP id
 f6-20020a056a00228600b004bb33587ea0mr9428149pfe.35.1641993330246; 
 Wed, 12 Jan 2022 05:15:30 -0800 (PST)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com.
 [209.85.214.169])
 by smtp.gmail.com with ESMTPSA id f10sm15524729pfj.145.2022.01.12.05.15.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 05:15:29 -0800 (PST)
Received: by mail-pl1-f169.google.com with SMTP id a7so1294477plh.1;
 Wed, 12 Jan 2022 05:15:29 -0800 (PST)
X-Received: by 2002:a05:6a00:88f:b0:4bc:3b4e:255a with SMTP id
 q15-20020a056a00088f00b004bc3b4e255amr9206828pfj.79.1641993328573; Wed, 12
 Jan 2022 05:15:28 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-12-anup@brainfault.org>
In-Reply-To: <20211230123539.52786-12-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 12 Jan 2022 21:15:17 +0800
X-Gmail-Original-Message-ID: <CANzO1D2yuux-O8U7s03r-nXq0kxK=cWkOja2qgorrtonyiT8CQ@mail.gmail.com>
Message-ID: <CANzO1D2yuux-O8U7s03r-nXq0kxK=cWkOja2qgorrtonyiT8CQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/23] target/riscv: Implement AIA hvictl and hviprioX
 CSRs
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000012bfeb05d5625d74"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Wed, 12 Jan 2022 13:15:39 -0000

--00000000000012bfeb05d5625d74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:41=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> The AIA hvictl and hviprioX CSRs allow hypervisor to control
> interrupts visible at VS-level. This patch implements AIA hvictl
> and hviprioX CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h     |   2 +
>  target/riscv/csr.c     | 126 +++++++++++++++++++++++++++++++++++++++++
>  target/riscv/machine.c |   2 +
>  3 files changed, 130 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 72d03aa126..721727c577 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -199,6 +199,7 @@ struct CPURISCVState {
>      uint64_t htimedelta;
>
>      /* Hypervisor controlled virtual interrupt priorities */
> +    target_ulong hvictl;
>      uint8_t hviprio[64];
>
>      /* Virtual CSRs */
> @@ -475,6 +476,7 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState
> *env)
>      return env->misa_mxl;
>  }
>  #endif
> +#define riscv_cpu_mxl_bits(env) (1UL << (4 + riscv_cpu_mxl(env)))
>
>  /*
>   * Encode LMUL to lmul as follows:
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 06db5ab1a8..decb0376fc 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -230,6 +230,15 @@ static RISCVException pointer_masking(CPURISCVState
> *env, int csrno)
>      return RISCV_EXCP_ILLEGAL_INST;
>  }
>
> +static int aia_hmode(CPURISCVState *env, int csrno)
> +{
> +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +     }
> +
> +     return hmode(env, csrno);
> +}
> +
>  static int aia_hmode32(CPURISCVState *env, int csrno)
>  {
>      if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> @@ -1070,6 +1079,9 @@ static RISCVException rmw_sie64(CPURISCVState *env,
> int csrno,
>      uint64_t mask =3D env->mideleg & S_MODE_INTERRUPTS;
>
>      if (riscv_cpu_virt_enabled(env)) {
> +        if (env->hvictl & HVICTL_VTI) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
>          ret =3D rmw_vsie64(env, CSR_VSIE, ret_val, new_val, wr_mask);
>      } else {
>          ret =3D rmw_mie64(env, csrno, ret_val, new_val, wr_mask & mask);
> @@ -1268,6 +1280,9 @@ static RISCVException rmw_sip64(CPURISCVState *env,
> int csrno,
>      uint64_t mask =3D env->mideleg & sip_writable_mask;
>
>      if (riscv_cpu_virt_enabled(env)) {
> +        if (env->hvictl & HVICTL_VTI) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
>          ret =3D rmw_vsip64(env, CSR_VSIP, ret_val, new_val, wr_mask);
>      } else {
>          ret =3D rmw_mip64(env, csrno, ret_val, new_val, wr_mask & mask);
> @@ -1654,6 +1669,110 @@ static RISCVException
> write_htimedeltah(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static int read_hvictl(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val =3D env->hvictl;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_hvictl(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->hvictl =3D val & HVICTL_VALID_MASK;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_hvipriox(CPURISCVState *env, int first_index,
> +                         uint8_t *iprio, target_ulong *val)
> +{
> +    int i, irq, rdzero, num_irqs =3D 4 * (riscv_cpu_mxl_bits(env) / 32);
> +
> +    /* First index has to be multiple of numbe of irqs per register */
>

typo: number


> +    if (first_index % num_irqs) {
> +        return (riscv_cpu_virt_enabled(env)) ?
> +               RISCV_EXCP_VIRT_INSTRUCTION_FAULT :
> RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    /* Fill-up return value */
> +    *val =3D 0;
> +    for (i =3D 0; i < num_irqs; i++) {
> +        if (riscv_cpu_hviprio_index2irq(first_index + i, &irq, &rdzero))=
 {
> +            continue;
> +        }
> +        if (rdzero) {
> +            continue;
> +        }
> +        *val |=3D ((target_ulong)iprio[irq]) << (i * 8);
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_hvipriox(CPURISCVState *env, int first_index,
> +                          uint8_t *iprio, target_ulong val)
> +{
> +    int i, irq, rdzero, num_irqs =3D 4 * (riscv_cpu_mxl_bits(env) / 32);
> +
> +    /* First index has to be multiple of numbe of irqs per register */
>

typo: number


> +    if (first_index % num_irqs) {
> +        return (riscv_cpu_virt_enabled(env)) ?
> +               RISCV_EXCP_VIRT_INSTRUCTION_FAULT :
> RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    /* Fill-up priority arrary */
> +    for (i =3D 0; i < num_irqs; i++) {
> +        if (riscv_cpu_hviprio_index2irq(first_index + i, &irq, &rdzero))=
 {
> +            continue;
> +        }
> +        if (rdzero) {
> +            iprio[irq] =3D 0;
> +        } else {
> +            iprio[irq] =3D (val >> (i * 8)) & 0xff;
> +        }
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_hviprio1(CPURISCVState *env, int csrno, target_ulong *va=
l)
> +{
> +    return read_hvipriox(env, 0, env->hviprio, val);
> +}
> +
> +static int write_hviprio1(CPURISCVState *env, int csrno, target_ulong va=
l)
> +{
> +    return write_hvipriox(env, 0, env->hviprio, val);
> +}
> +
> +static int read_hviprio1h(CPURISCVState *env, int csrno, target_ulong
> *val)
> +{
> +    return read_hvipriox(env, 4, env->hviprio, val);
> +}
> +
> +static int write_hviprio1h(CPURISCVState *env, int csrno, target_ulong
> val)
> +{
> +    return write_hvipriox(env, 4, env->hviprio, val);
> +}
> +
> +static int read_hviprio2(CPURISCVState *env, int csrno, target_ulong *va=
l)
> +{
> +    return read_hvipriox(env, 8, env->hviprio, val);
> +}
> +
> +static int write_hviprio2(CPURISCVState *env, int csrno, target_ulong va=
l)
> +{
> +    return write_hvipriox(env, 8, env->hviprio, val);
> +}
> +
> +static int read_hviprio2h(CPURISCVState *env, int csrno, target_ulong
> *val)
> +{
> +    return read_hvipriox(env, 12, env->hviprio, val);
> +}
> +
> +static int write_hviprio2h(CPURISCVState *env, int csrno, target_ulong
> val)
> +{
> +    return write_hvipriox(env, 12, env->hviprio, val);
> +}
> +
>  /* Virtual CSR Registers */
>  static RISCVException read_vsstatus(CPURISCVState *env, int csrno,
>                                      target_ulong *val)
> @@ -2308,9 +2427,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      [CSR_MTVAL2]      =3D { "mtval2",      hmode,   read_mtval2,
> write_mtval2      },
>      [CSR_MTINST]      =3D { "mtinst",      hmode,   read_mtinst,
> write_mtinst      },
>
> +    /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA=
)
> */
> +    [CSR_HVICTL]      =3D { "hvictl",      aia_hmode, read_hvictl,
> write_hvictl },
> +    [CSR_HVIPRIO1]    =3D { "hviprio1",    aia_hmode, read_hviprio1,
>  write_hviprio1 },
> +    [CSR_HVIPRIO2]    =3D { "hviprio2",    aia_hmode, read_hviprio2,
>  write_hviprio2 },
> +
>      /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
>      [CSR_HIDELEGH]    =3D { "hidelegh",    aia_hmode32, NULL, NULL,
> rmw_hidelegh },
>      [CSR_HVIPH]       =3D { "hviph",       aia_hmode32, NULL, NULL,
> rmw_hviph },
> +    [CSR_HVIPRIO1H]   =3D { "hviprio1h",   aia_hmode32, read_hviprio1h,
> write_hviprio1h },
> +    [CSR_HVIPRIO2H]   =3D { "hviprio2h",   aia_hmode32, read_hviprio2h,
> write_hviprio2h },
>      [CSR_VSIEH]       =3D { "vsieh",       aia_hmode32, NULL, NULL,
> rmw_vsieh },
>      [CSR_VSIPH]       =3D { "vsiph",       aia_hmode32, NULL, NULL,
> rmw_vsiph },
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 44dca84ded..f027d5e307 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -92,6 +92,8 @@ static const VMStateDescription vmstate_hyper =3D {
>          VMSTATE_UINTTL(env.hgeie, RISCVCPU),
>          VMSTATE_UINTTL(env.hgeip, RISCVCPU),
>          VMSTATE_UINT64(env.htimedelta, RISCVCPU),
> +
> +        VMSTATE_UINTTL(env.hvictl, RISCVCPU),
>          VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
>
>          VMSTATE_UINT64(env.vsstatus, RISCVCPU),
> --
> 2.25.1
>
>
>
Otherwise,
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--00000000000012bfeb05d5625d74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Anup Patel &lt;<a href=3D"mailto:anup@bra=
infault.org">anup@brainfault.org</a>&gt; =E6=96=BC 2021=E5=B9=B412=E6=9C=88=
30=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:41=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com=
" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
<br>
The AIA hvictl and hviprioX CSRs allow hypervisor to control<br>
interrupts visible at VS-level. This patch implements AIA hvictl<br>
and hviprioX CSRs.<br>
<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0| 126 +++++++++++++++++++++++++=
++++++++++++++++<br>
=C2=A0target/riscv/machine.c |=C2=A0 =C2=A02 +<br>
=C2=A03 files changed, 130 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index 72d03aa126..721727c577 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -199,6 +199,7 @@ struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0uint64_t htimedelta;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Hypervisor controlled virtual interrupt priorities *=
/<br>
+=C2=A0 =C2=A0 target_ulong hvictl;<br>
=C2=A0 =C2=A0 =C2=A0uint8_t hviprio[64];<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Virtual CSRs */<br>
@@ -475,6 +476,7 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env=
)<br>
=C2=A0 =C2=A0 =C2=A0return env-&gt;misa_mxl;<br>
=C2=A0}<br>
=C2=A0#endif<br>
+#define riscv_cpu_mxl_bits(env) (1UL &lt;&lt; (4 + riscv_cpu_mxl(env)))<br=
>
<br>
=C2=A0/*<br>
=C2=A0 * Encode LMUL to lmul as follows:<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index 06db5ab1a8..decb0376fc 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -230,6 +230,15 @@ static RISCVException pointer_masking(CPURISCVState *e=
nv, int csrno)<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_ILLEGAL_INST;<br>
=C2=A0}<br>
<br>
+static int aia_hmode(CPURISCVState *env, int csrno)<br>
+{<br>
+=C2=A0 =C2=A0 if (!riscv_feature(env, RISCV_FEATURE_AIA)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0return hmode(env, csrno);<br>
+}<br>
+<br>
=C2=A0static int aia_hmode32(CPURISCVState *env, int csrno)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (!riscv_feature(env, RISCV_FEATURE_AIA)) {<br>
@@ -1070,6 +1079,9 @@ static RISCVException rmw_sie64(CPURISCVState *env, i=
nt csrno,<br>
=C2=A0 =C2=A0 =C2=A0uint64_t mask =3D env-&gt;mideleg &amp; S_MODE_INTERRUP=
TS;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_cpu_virt_enabled(env)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;hvictl &amp; HVICTL_VTI) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_VIRT_INSTRUCTI=
ON_FAULT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D rmw_vsie64(env, CSR_VSIE, ret_val=
, new_val, wr_mask);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D rmw_mie64(env, csrno, ret_val, ne=
w_val, wr_mask &amp; mask);<br>
@@ -1268,6 +1280,9 @@ static RISCVException rmw_sip64(CPURISCVState *env, i=
nt csrno,<br>
=C2=A0 =C2=A0 =C2=A0uint64_t mask =3D env-&gt;mideleg &amp; sip_writable_ma=
sk;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_cpu_virt_enabled(env)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;hvictl &amp; HVICTL_VTI) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_VIRT_INSTRUCTI=
ON_FAULT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D rmw_vsip64(env, CSR_VSIP, ret_val=
, new_val, wr_mask);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D rmw_mip64(env, csrno, ret_val, ne=
w_val, wr_mask &amp; mask);<br>
@@ -1654,6 +1669,110 @@ static RISCVException write_htimedeltah(CPURISCVSta=
te *env, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
+static int read_hvictl(CPURISCVState *env, int csrno, target_ulong *val)<b=
r>
+{<br>
+=C2=A0 =C2=A0 *val =3D env-&gt;hvictl;<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+}<br>
+<br>
+static int write_hvictl(CPURISCVState *env, int csrno, target_ulong val)<b=
r>
+{<br>
+=C2=A0 =C2=A0 env-&gt;hvictl =3D val &amp; HVICTL_VALID_MASK;<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+}<br>
+<br>
+static int read_hvipriox(CPURISCVState *env, int first_index,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0uint8_t *iprio, target_ulong *val)<br>
+{<br>
+=C2=A0 =C2=A0 int i, irq, rdzero, num_irqs =3D 4 * (riscv_cpu_mxl_bits(env=
) / 32);<br>
+<br>
+=C2=A0 =C2=A0 /* First index has to be multiple of numbe of irqs per regis=
ter */<br></blockquote><div><br></div><div>typo: number</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 if (first_index % num_irqs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (riscv_cpu_virt_enabled(env)) ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RISCV_EXCP_VIRT_INS=
TRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Fill-up return value */<br>
+=C2=A0 =C2=A0 *val =3D 0;<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; num_irqs; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_cpu_hviprio_index2irq(first_index + =
i, &amp;irq, &amp;rdzero)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rdzero) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val |=3D ((target_ulong)iprio[irq]) &lt;&lt; =
(i * 8);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+}<br>
+<br>
+static int write_hvipriox(CPURISCVState *env, int first_index,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 uint8_t *iprio, target_ulong val)<br>
+{<br>
+=C2=A0 =C2=A0 int i, irq, rdzero, num_irqs =3D 4 * (riscv_cpu_mxl_bits(env=
) / 32);<br>
+<br>
+=C2=A0 =C2=A0 /* First index has to be multiple of numbe of irqs per regis=
ter */<br></blockquote><div><br></div><div>typo: number<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 if (first_index % num_irqs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (riscv_cpu_virt_enabled(env)) ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RISCV_EXCP_VIRT_INS=
TRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Fill-up priority arrary */<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; num_irqs; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_cpu_hviprio_index2irq(first_index + =
i, &amp;irq, &amp;rdzero)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rdzero) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio[irq] =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio[irq] =3D (val &gt;&gt; (i =
* 8)) &amp; 0xff;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+}<br>
+<br>
+static int read_hviprio1(CPURISCVState *env, int csrno, target_ulong *val)=
<br>
+{<br>
+=C2=A0 =C2=A0 return read_hvipriox(env, 0, env-&gt;hviprio, val);<br>
+}<br>
+<br>
+static int write_hviprio1(CPURISCVState *env, int csrno, target_ulong val)=
<br>
+{<br>
+=C2=A0 =C2=A0 return write_hvipriox(env, 0, env-&gt;hviprio, val);<br>
+}<br>
+<br>
+static int read_hviprio1h(CPURISCVState *env, int csrno, target_ulong *val=
)<br>
+{<br>
+=C2=A0 =C2=A0 return read_hvipriox(env, 4, env-&gt;hviprio, val);<br>
+}<br>
+<br>
+static int write_hviprio1h(CPURISCVState *env, int csrno, target_ulong val=
)<br>
+{<br>
+=C2=A0 =C2=A0 return write_hvipriox(env, 4, env-&gt;hviprio, val);<br>
+}<br>
+<br>
+static int read_hviprio2(CPURISCVState *env, int csrno, target_ulong *val)=
<br>
+{<br>
+=C2=A0 =C2=A0 return read_hvipriox(env, 8, env-&gt;hviprio, val);<br>
+}<br>
+<br>
+static int write_hviprio2(CPURISCVState *env, int csrno, target_ulong val)=
<br>
+{<br>
+=C2=A0 =C2=A0 return write_hvipriox(env, 8, env-&gt;hviprio, val);<br>
+}<br>
+<br>
+static int read_hviprio2h(CPURISCVState *env, int csrno, target_ulong *val=
)<br>
+{<br>
+=C2=A0 =C2=A0 return read_hvipriox(env, 12, env-&gt;hviprio, val);<br>
+}<br>
+<br>
+static int write_hviprio2h(CPURISCVState *env, int csrno, target_ulong val=
)<br>
+{<br>
+=C2=A0 =C2=A0 return write_hvipriox(env, 12, env-&gt;hviprio, val);<br>
+}<br>
+<br>
=C2=A0/* Virtual CSR Registers */<br>
=C2=A0static RISCVException read_vsstatus(CPURISCVState *env, int csrno,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *va=
l)<br>
@@ -2308,9 +2427,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<b=
r>
=C2=A0 =C2=A0 =C2=A0[CSR_MTVAL2]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;mtval2&quo=
t;,=C2=A0 =C2=A0 =C2=A0 hmode,=C2=A0 =C2=A0read_mtval2,=C2=A0 =C2=A0 =C2=A0=
 write_mtval2=C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MTINST]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;mtinst&quo=
t;,=C2=A0 =C2=A0 =C2=A0 hmode,=C2=A0 =C2=A0read_mtinst,=C2=A0 =C2=A0 =C2=A0=
 write_mtinst=C2=A0 =C2=A0 =C2=A0 },<br>
<br>
+=C2=A0 =C2=A0 /* Virtual Interrupts and Interrupt Priorities (H-extension =
with AIA) */<br>
+=C2=A0 =C2=A0 [CSR_HVICTL]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;hvictl&quot;,=
=C2=A0 =C2=A0 =C2=A0 aia_hmode, read_hvictl, write_hvictl },<br>
+=C2=A0 =C2=A0 [CSR_HVIPRIO1]=C2=A0 =C2=A0 =3D { &quot;hviprio1&quot;,=C2=
=A0 =C2=A0 aia_hmode, read_hviprio1,=C2=A0 =C2=A0write_hviprio1 },<br>
+=C2=A0 =C2=A0 [CSR_HVIPRIO2]=C2=A0 =C2=A0 =3D { &quot;hviprio2&quot;,=C2=
=A0 =C2=A0 aia_hmode, read_hviprio2,=C2=A0 =C2=A0write_hviprio2 },<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Hypervisor and VS-Level High-Half CSRs (H-extension =
with AIA) */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HIDELEGH]=C2=A0 =C2=A0 =3D { &quot;hidelegh&quot;,=
=C2=A0 =C2=A0 aia_hmode32, NULL, NULL, rmw_hidelegh },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HVIPH]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;hviph=
&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0aia_hmode32, NULL, NULL, rmw_hviph },<br>
+=C2=A0 =C2=A0 [CSR_HVIPRIO1H]=C2=A0 =C2=A0=3D { &quot;hviprio1h&quot;,=C2=
=A0 =C2=A0aia_hmode32, read_hviprio1h, write_hviprio1h },<br>
+=C2=A0 =C2=A0 [CSR_HVIPRIO2H]=C2=A0 =C2=A0=3D { &quot;hviprio2h&quot;,=C2=
=A0 =C2=A0aia_hmode32, read_hviprio2h, write_hviprio2h },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_VSIEH]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;vsieh=
&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0aia_hmode32, NULL, NULL, rmw_vsieh },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_VSIPH]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;vsiph=
&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0aia_hmode32, NULL, NULL, rmw_vsiph },<br>
<br>
diff --git a/target/riscv/machine.c b/target/riscv/machine.c<br>
index 44dca84ded..f027d5e307 100644<br>
--- a/target/riscv/machine.c<br>
+++ b/target/riscv/machine.c<br>
@@ -92,6 +92,8 @@ static const VMStateDescription vmstate_hyper =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.hgeie, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.hgeip, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(env.htimedelta, RISCVCPU),=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.hvictl, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU=
, 64),<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(env.vsstatus, RISCVCPU),<b=
r>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Otherwise,</div><div>Reviewed-by: Fran=
k Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" target=3D"_blank">fra=
nk.chang@sifive.com</a>&gt;=C2=A0</div></div></div>

--00000000000012bfeb05d5625d74--

