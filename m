Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n8JCf-0007uF-UO
	for mharc-qemu-riscv@gnu.org; Fri, 14 Jan 2022 04:49:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n8JCe-0007t1-HA
 for qemu-riscv@nongnu.org; Fri, 14 Jan 2022 04:49:00 -0500
Received: from [2607:f8b0:4864:20::42e] (port=33412
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n8JCX-0000Ru-Qj
 for qemu-riscv@nongnu.org; Fri, 14 Jan 2022 04:48:59 -0500
Received: by mail-pf1-x42e.google.com with SMTP id x83so2304879pfc.0
 for <qemu-riscv@nongnu.org>; Fri, 14 Jan 2022 01:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wrHk3vyFidj5vMRY5KtkOBBu7MB+g56tE7Q7BRNeov0=;
 b=SVg2Qt/OAY7miwCplQvYQRnx8uHOsWTHZ9HWGmdo/Cr2RD8XTjkyQM6U4g7yZ6mHKD
 YvulpOVLgGVReKOk3+CeDWwJLkEn4VyUV5aHbfp/x5Y7m9kKAZm29gf65+nGLm+MuNlq
 p0FwZFgzY2eZ5zEWK7MlCXQgh01qK8ZGYCUmonX79rgsJR3Tyjv4QpPQjJ1CToSEgzj5
 UHAE40g5ZLThBSmmdC1CBL25f8Px1olW0jC7N8U5G67JVAl4ypqqfOwSxtx++Vr4Y+oY
 5nZbJHmJD8OSNXy22PiDGvkHogqg5nVfwhY/yIqfuZClmG0FOja4X93TbRiK3okotEc9
 Z+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wrHk3vyFidj5vMRY5KtkOBBu7MB+g56tE7Q7BRNeov0=;
 b=NTckUCPRiSvZJ0B3tkepKzDgIP7BMI+Xydqqn1oDlPldytBHiTjc2R+S2wqomul8l5
 pPLGevt1ySLqo1/oD+6e88P4B9SIk5Cvr31t7BHyLFGIfd5fsO8cKdeBs2ZVwPy+l3HQ
 EFIMoEsmbI4RISaP5q8mEPQOIYGrHEx+lybIl5k5gGh3IArKb+Z/b7qC/W41LXYWwQN/
 cCUUVIaBEW49V5K9/W6TmtyvHpjx2oD0TeezgYRBRtPuEG7jbnYatbnTNaN97R2bga6j
 RgPIVvRxSV16MjCmILEOllhSRMXkLW8NKLgl+Em8P6NJWT+8/86EDXULO+Hi4oBcqhGI
 vgWg==
X-Gm-Message-State: AOAM5326zSoaQu+QRViIfYahacP+lXWRYdpxlOAhiODzidX4bgYEYzLM
 /ctz3kiRps+0efqwJxrQY4BX+yX3dpmm7ytM
X-Google-Smtp-Source: ABdhPJx8NILYJVPkr/L4mB67GskgMdC6sV4x1nzGPf1GVmUsV1bJt6p6XnXkNyCgnRSCyKyEjgukzw==
X-Received: by 2002:a63:6bca:: with SMTP id g193mr6602562pgc.26.1642153731447; 
 Fri, 14 Jan 2022 01:48:51 -0800 (PST)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com.
 [209.85.216.47])
 by smtp.gmail.com with ESMTPSA id y9sm5128377pfm.140.2022.01.14.01.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 01:48:50 -0800 (PST)
Received: by mail-pj1-f47.google.com with SMTP id
 a1-20020a17090a688100b001b3fd52338eso12530143pjd.1; 
 Fri, 14 Jan 2022 01:48:50 -0800 (PST)
X-Received: by 2002:a17:90b:1bcc:: with SMTP id
 oa12mr9977617pjb.4.1642153729642; 
 Fri, 14 Jan 2022 01:48:49 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-11-anup@brainfault.org>
In-Reply-To: <20211230123539.52786-11-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 14 Jan 2022 17:48:38 +0800
X-Gmail-Original-Message-ID: <CANzO1D2kdm5r4PoEoVsTQt3GPqom=MW4nhBK=6zJVn0WZAZ2_w@mail.gmail.com>
Message-ID: <CANzO1D2kdm5r4PoEoVsTQt3GPqom=MW4nhBK=6zJVn0WZAZ2_w@mail.gmail.com>
Subject: Re: [PATCH v6 10/23] target/riscv: Implement AIA CSRs for 64 local
 interrupts on RV32
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b8d58705d587b52d"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 14 Jan 2022 09:49:00 -0000

--000000000000b8d58705d587b52d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:55=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> The AIA specification adds new CSRs for RV32 so that RISC-V hart can
> support 64 local interrupts on both RV32 and RV64.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h        |  14 +-
>  target/riscv/cpu_helper.c |  10 +-
>  target/riscv/csr.c        | 560 +++++++++++++++++++++++++++++++-------
>  target/riscv/machine.c    |  10 +-
>  4 files changed, 474 insertions(+), 120 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 140fabfdf9..72d03aa126 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -162,12 +162,12 @@ struct CPURISCVState {
>       */
>      uint64_t mstatus;
>
> -    target_ulong mip;
> +    uint64_t mip;
>
> -    uint32_t miclaim;
> +    uint64_t miclaim;
>
> -    target_ulong mie;
> -    target_ulong mideleg;
> +    uint64_t mie;
> +    uint64_t mideleg;
>
>      target_ulong satp;   /* since: priv-1.10.0 */
>      target_ulong stval;
> @@ -189,7 +189,7 @@ struct CPURISCVState {
>      /* Hypervisor CSRs */
>      target_ulong hstatus;
>      target_ulong hedeleg;
> -    target_ulong hideleg;
> +    uint64_t hideleg;
>      target_ulong hcounteren;
>      target_ulong htval;
>      target_ulong htinst;
> @@ -420,8 +420,8 @@ void riscv_cpu_list(void);
>  #ifndef CONFIG_USER_ONLY
>  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
>  void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
> -int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
> -uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t
> value);
> +int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
> +uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t
> value);
>  #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip valu=
e
> */
>  void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t=
),
>                               uint32_t arg);
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index e3532de4cf..e97d51fbd0 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -534,7 +534,7 @@ bool riscv_cpu_two_stage_lookup(int mmu_idx)
>      return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
>  }
>
> -int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
> +int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
>  {
>      CPURISCVState *env =3D &cpu->env;
>      if (env->miclaim & interrupts) {
> @@ -545,11 +545,11 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu,
> uint32_t interrupts)
>      }
>  }
>
> -uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t
> value)
> +uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t
> value)
>  {
>      CPURISCVState *env =3D &cpu->env;
>      CPUState *cs =3D CPU(cpu);
> -    uint32_t gein, vsgein =3D 0, old =3D env->mip;
> +    uint64_t gein, vsgein =3D 0, old =3D env->mip;
>      bool locked =3D false;
>
>      if (riscv_cpu_virt_enabled(env)) {
> @@ -1252,7 +1252,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>       */
>      bool async =3D !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
>      target_ulong cause =3D cs->exception_index & RISCV_EXCP_INT_MASK;
> -    target_ulong deleg =3D async ? env->mideleg : env->medeleg;
> +    uint64_t deleg =3D async ? env->mideleg : env->medeleg;
>      bool write_tval =3D false;
>      target_ulong tval =3D 0;
>      target_ulong htval =3D 0;
> @@ -1317,7 +1317,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>              cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
>          /* handle the trap in S-mode */
>          if (riscv_has_ext(env, RVH)) {
> -            target_ulong hdeleg =3D async ? env->hideleg : env->hedeleg;
> +            uint64_t hdeleg =3D async ? env->hideleg : env->hedeleg;
>
>              if (env->two_stage_lookup && write_tval) {
>                  /*
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 50424a8344..06db5ab1a8 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -154,6 +154,15 @@ static RISCVException any32(CPURISCVState *env, int
> csrno)
>
>  }
>
> +static int aia_any32(CPURISCVState *env, int csrno)
> +{
> +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return any32(env, csrno);
> +}
> +
>  static RISCVException smode(CPURISCVState *env, int csrno)
>  {
>      if (riscv_has_ext(env, RVS)) {
> @@ -163,6 +172,24 @@ static RISCVException smode(CPURISCVState *env, int
> csrno)
>      return RISCV_EXCP_ILLEGAL_INST;
>  }
>
> +static int smode32(CPURISCVState *env, int csrno)
> +{
> +    if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return smode(env, csrno);
> +}
> +
> +static int aia_smode32(CPURISCVState *env, int csrno)
> +{
> +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return smode32(env, csrno);
> +}
> +
>  static RISCVException hmode(CPURISCVState *env, int csrno)
>  {
>      if (riscv_has_ext(env, RVS) &&
> @@ -203,6 +230,15 @@ static RISCVException pointer_masking(CPURISCVState
> *env, int csrno)
>      return RISCV_EXCP_ILLEGAL_INST;
>  }
>
> +static int aia_hmode32(CPURISCVState *env, int csrno)
> +{
> +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return hmode32(env, csrno);
> +}
> +
>  static RISCVException pmp(CPURISCVState *env, int csrno)
>  {
>      if (riscv_feature(env, RISCV_FEATURE_PMP)) {
> @@ -443,15 +479,15 @@ static RISCVException read_timeh(CPURISCVState *env=
,
> int csrno,
>
>  /* Machine constants */
>
> -#define M_MODE_INTERRUPTS  (MIP_MSIP | MIP_MTIP | MIP_MEIP)
> -#define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP)
> -#define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
> -#define HS_MODE_INTERRUPTS (MIP_SGEIP | VS_MODE_INTERRUPTS)
> +#define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP))
> +#define S_MODE_INTERRUPTS  ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP))
> +#define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP=
))
> +#define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))
>
> -static const target_ulong delegable_ints =3D S_MODE_INTERRUPTS |
> +static const uint64_t delegable_ints =3D S_MODE_INTERRUPTS |
>                                             VS_MODE_INTERRUPTS;
> -static const target_ulong vs_delegable_ints =3D VS_MODE_INTERRUPTS;
> -static const target_ulong all_ints =3D M_MODE_INTERRUPTS |
> S_MODE_INTERRUPTS |
> +static const uint64_t vs_delegable_ints =3D VS_MODE_INTERRUPTS;
> +static const uint64_t all_ints =3D M_MODE_INTERRUPTS | S_MODE_INTERRUPTS=
 |
>                                       HS_MODE_INTERRUPTS;
>  #define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
>                           (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) | \
> @@ -701,40 +737,107 @@ static RISCVException write_medeleg(CPURISCVState
> *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> -static RISCVException read_mideleg(CPURISCVState *env, int csrno,
> -                                   target_ulong *val)
> +static RISCVException rmw_mideleg64(CPURISCVState *env, int csrno,
> +                                    uint64_t *ret_val,
> +                                    uint64_t new_val, uint64_t wr_mask)
>  {
> -    *val =3D env->mideleg;
> -    return RISCV_EXCP_NONE;
> -}
> +    uint64_t mask =3D wr_mask & delegable_ints;
> +
> +    if (ret_val) {
> +        *ret_val =3D env->mideleg;
> +    }
> +
> +    env->mideleg =3D (env->mideleg & ~mask) | (new_val & mask);
>
> -static RISCVException write_mideleg(CPURISCVState *env, int csrno,
> -                                    target_ulong val)
> -{
> -    env->mideleg =3D (env->mideleg & ~delegable_ints) | (val &
> delegable_ints);
>      if (riscv_has_ext(env, RVH)) {
>          env->mideleg |=3D HS_MODE_INTERRUPTS;
>      }
> +
>      return RISCV_EXCP_NONE;
>  }
>
> -static RISCVException read_mie(CPURISCVState *env, int csrno,
> -                               target_ulong *val)
> +static RISCVException rmw_mideleg(CPURISCVState *env, int csrno,
> +                                  target_ulong *ret_val,
> +                                  target_ulong new_val, target_ulong
> wr_mask)
>  {
> -    *val =3D env->mie;
> -    return RISCV_EXCP_NONE;
> +    uint64_t rval;
> +    RISCVException ret;
> +
> +    ret =3D rmw_mideleg64(env, csrno, &rval, new_val, wr_mask);
> +    if (ret_val) {
> +        *ret_val =3D rval;
> +    }
> +
> +    return ret;
>  }
>
> -static RISCVException write_mie(CPURISCVState *env, int csrno,
> -                                target_ulong val)
> +static RISCVException rmw_midelegh(CPURISCVState *env, int csrno,
> +                                   target_ulong *ret_val,
> +                                   target_ulong new_val,
> +                                   target_ulong wr_mask)
>  {
> -    env->mie =3D (env->mie & ~all_ints) | (val & all_ints);
> +    uint64_t rval;
> +    RISCVException ret;
> +
> +    ret =3D rmw_mideleg64(env, csrno, &rval,
> +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> +    if (ret_val) {
> +        *ret_val =3D rval >> 32;
> +    }
> +
> +    return ret;
> +}
> +
> +static RISCVException rmw_mie64(CPURISCVState *env, int csrno,
> +                                uint64_t *ret_val,
> +                                uint64_t new_val, uint64_t wr_mask)
> +{
> +    uint64_t mask =3D wr_mask & all_ints;
> +
> +    if (ret_val) {
> +        *ret_val =3D env->mie;
> +    }
> +
> +    env->mie =3D (env->mie & ~mask) | (new_val & mask);
> +
>      if (!riscv_has_ext(env, RVH)) {
> -        env->mie &=3D ~MIP_SGEIP;
> +        env->mie &=3D ~((uint64_t)MIP_SGEIP);
>      }
> +
>      return RISCV_EXCP_NONE;
>  }
>
> +static RISCVException rmw_mie(CPURISCVState *env, int csrno,
> +                              target_ulong *ret_val,
> +                              target_ulong new_val, target_ulong wr_mask=
)
> +{
> +    uint64_t rval;
> +    RISCVException ret;
> +
> +    ret =3D rmw_mie64(env, csrno, &rval, new_val, wr_mask);
> +    if (ret_val) {
> +        *ret_val =3D rval;
> +    }
> +
> +    return ret;
> +}
> +
> +static RISCVException rmw_mieh(CPURISCVState *env, int csrno,
> +                               target_ulong *ret_val,
> +                               target_ulong new_val, target_ulong wr_mas=
k)
> +{
> +    uint64_t rval;
> +    RISCVException ret;
> +
> +    ret =3D rmw_mie64(env, csrno, &rval,
> +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> +    if (ret_val) {
> +        *ret_val =3D rval >> 32;
> +    }
> +
> +    return ret;
> +}
> +
>  static RISCVException read_mtvec(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>  {
> @@ -825,17 +928,17 @@ static RISCVException write_mtval(CPURISCVState
> *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> -static RISCVException rmw_mip(CPURISCVState *env, int csrno,
> -                              target_ulong *ret_value,
> -                              target_ulong new_value, target_ulong
> write_mask)
> +static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
> +                                uint64_t *ret_val,
> +                                uint64_t new_val, uint64_t wr_mask)
>  {
>      RISCVCPU *cpu =3D env_archcpu(env);
>      /* Allow software control of delegable interrupts not claimed by
> hardware */
> -    target_ulong mask =3D write_mask & delegable_ints & ~env->miclaim;
> -    uint32_t gin, old_mip;
> +    uint64_t old_mip, mask =3D wr_mask & delegable_ints & ~env->miclaim;
> +    uint32_t gin;
>
>      if (mask) {
> -        old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_value & mask));
> +        old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_val & mask));
>      } else {
>          old_mip =3D env->mip;
>      }
> @@ -845,13 +948,44 @@ static RISCVException rmw_mip(CPURISCVState *env,
> int csrno,
>          old_mip |=3D (env->hgeip & ((target_ulong)1 << gin)) ? MIP_VSEIP=
 :
> 0;
>      }
>
> -    if (ret_value) {
> -        *ret_value =3D old_mip;
> +    if (ret_val) {
> +        *ret_val =3D old_mip;
>      }
>
>      return RISCV_EXCP_NONE;
>  }
>
> +static RISCVException rmw_mip(CPURISCVState *env, int csrno,
> +                              target_ulong *ret_val,
> +                              target_ulong new_val, target_ulong wr_mask=
)
> +{
> +    uint64_t rval;
> +    RISCVException ret;
> +
> +    ret =3D rmw_mip64(env, csrno, &rval, new_val, wr_mask);
> +    if (ret_val) {
> +        *ret_val =3D rval;
> +    }
> +
> +    return ret;
> +}
> +
> +static RISCVException rmw_miph(CPURISCVState *env, int csrno,
> +                               target_ulong *ret_val,
> +                               target_ulong new_val, target_ulong wr_mas=
k)
> +{
> +    uint64_t rval;
> +    RISCVException ret;
> +
> +    ret =3D rmw_mip64(env, csrno, &rval,
> +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> +    if (ret_val) {
> +        *ret_val =3D rval >> 32;
> +    }
> +
> +    return ret;
> +}
> +
>  /* Supervisor Trap Setup */
>  static RISCVException read_sstatus(CPURISCVState *env, int csrno,
>                                     target_ulong *val)
> @@ -871,45 +1005,112 @@ static RISCVException write_sstatus(CPURISCVState
> *env, int csrno,
>      return write_mstatus(env, CSR_MSTATUS, newval);
>  }
>
> -static RISCVException read_vsie(CPURISCVState *env, int csrno,
> -                                target_ulong *val)
> +static RISCVException rmw_vsie64(CPURISCVState *env, int csrno,
> +                                 uint64_t *ret_val,
> +                                 uint64_t new_val, uint64_t wr_mask)
>  {
> -    /* Shift the VS bits to their S bit location in vsie */
> -    *val =3D (env->mie & env->hideleg & VS_MODE_INTERRUPTS) >> 1;
> -    return RISCV_EXCP_NONE;
> +    RISCVException ret;
> +    uint64_t rval, vsbits, mask =3D env->hideleg & VS_MODE_INTERRUPTS;
> +
> +    /* Bring VS-level bits to correct position */
> +    vsbits =3D new_val & (VS_MODE_INTERRUPTS >> 1);
> +    new_val &=3D ~(VS_MODE_INTERRUPTS >> 1);
> +    new_val |=3D vsbits << 1;
> +    vsbits =3D wr_mask & (VS_MODE_INTERRUPTS >> 1);
> +    wr_mask &=3D ~(VS_MODE_INTERRUPTS >> 1);
> +    wr_mask |=3D vsbits << 1;
> +
> +    ret =3D rmw_mie64(env, csrno, &rval, new_val, wr_mask & mask);
> +    if (ret_val) {
> +        rval &=3D mask;
> +        vsbits =3D rval & VS_MODE_INTERRUPTS;
> +        rval &=3D ~VS_MODE_INTERRUPTS;
> +        *ret_val =3D rval | (vsbits >> 1);
> +    }
> +
> +    return ret;
>  }
>
> -static RISCVException read_sie(CPURISCVState *env, int csrno,
> -                               target_ulong *val)
> +static RISCVException rmw_vsie(CPURISCVState *env, int csrno,
> +                               target_ulong *ret_val,
> +                               target_ulong new_val, target_ulong wr_mas=
k)
>  {
> -    if (riscv_cpu_virt_enabled(env)) {
> -        read_vsie(env, CSR_VSIE, val);
> -    } else {
> -        *val =3D env->mie & env->mideleg;
> +    uint64_t rval;
> +    RISCVException ret;
> +
> +    ret =3D rmw_vsie64(env, csrno, &rval, new_val, wr_mask);
> +    if (ret_val) {
> +        *ret_val =3D rval;
>      }
> -    return RISCV_EXCP_NONE;
> +
> +    return ret;
>  }
>
> -static RISCVException write_vsie(CPURISCVState *env, int csrno,
> -                                 target_ulong val)
> +static RISCVException rmw_vsieh(CPURISCVState *env, int csrno,
> +                                target_ulong *ret_val,
> +                                target_ulong new_val, target_ulong
> wr_mask)
>  {
> -    /* Shift the S bits to their VS bit location in mie */
> -    target_ulong newval =3D (env->mie & ~VS_MODE_INTERRUPTS) |
> -                          ((val << 1) & env->hideleg &
> VS_MODE_INTERRUPTS);
> -    return write_mie(env, CSR_MIE, newval);
> +    uint64_t rval;
> +    RISCVException ret;
> +
> +    ret =3D rmw_vsie64(env, csrno, &rval,
> +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> +    if (ret_val) {
> +        *ret_val =3D rval >> 32;
> +    }
> +
> +    return ret;
>  }
>
> -static int write_sie(CPURISCVState *env, int csrno, target_ulong val)
> +static RISCVException rmw_sie64(CPURISCVState *env, int csrno,
> +                                uint64_t *ret_val,
> +                                uint64_t new_val, uint64_t wr_mask)
>  {
> +    RISCVException ret;
> +    uint64_t mask =3D env->mideleg & S_MODE_INTERRUPTS;
> +
>      if (riscv_cpu_virt_enabled(env)) {
> -        write_vsie(env, CSR_VSIE, val);
> +        ret =3D rmw_vsie64(env, CSR_VSIE, ret_val, new_val, wr_mask);
>      } else {
> -        target_ulong newval =3D (env->mie & ~S_MODE_INTERRUPTS) |
> -                              (val & S_MODE_INTERRUPTS);
> -        write_mie(env, CSR_MIE, newval);
> +        ret =3D rmw_mie64(env, csrno, ret_val, new_val, wr_mask & mask);
>      }
>
> -    return RISCV_EXCP_NONE;
> +    if (ret_val) {
> +        *ret_val &=3D mask;
> +    }
> +
> +    return ret;
> +}
> +
> +static RISCVException rmw_sie(CPURISCVState *env, int csrno,
> +                              target_ulong *ret_val,
> +                              target_ulong new_val, target_ulong wr_mask=
)
> +{
> +    uint64_t rval;
> +    RISCVException ret;
> +
> +    ret =3D rmw_sie64(env, csrno, &rval, new_val, wr_mask);
> +    if (ret_val) {
> +        *ret_val =3D rval;
> +    }
> +
> +    return ret;
> +}
> +
> +static RISCVException rmw_sieh(CPURISCVState *env, int csrno,
> +                               target_ulong *ret_val,
> +                               target_ulong new_val, target_ulong wr_mas=
k)
> +{
> +    uint64_t rval;
> +    RISCVException ret;
> +
> +    ret =3D rmw_sie64(env, csrno, &rval,
> +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> +    if (ret_val) {
> +        *ret_val =3D rval >> 32;
> +    }
> +
> +    return ret;
>  }
>
>  static RISCVException read_stvec(CPURISCVState *env, int csrno,
> @@ -1002,38 +1203,111 @@ static RISCVException write_stval(CPURISCVState
> *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static RISCVException rmw_vsip64(CPURISCVState *env, int csrno,
> +                                 uint64_t *ret_val,
> +                                 uint64_t new_val, uint64_t wr_mask)
> +{
> +    RISCVException ret;
> +    uint64_t rval, vsbits, mask =3D env->hideleg & vsip_writable_mask;
> +
> +    /* Bring VS-level bits to correct position */
> +    vsbits =3D new_val & (VS_MODE_INTERRUPTS >> 1);
> +    new_val &=3D ~(VS_MODE_INTERRUPTS >> 1);
> +    new_val |=3D vsbits << 1;
> +    vsbits =3D wr_mask & (VS_MODE_INTERRUPTS >> 1);
> +    wr_mask &=3D ~(VS_MODE_INTERRUPTS >> 1);
> +    wr_mask |=3D vsbits << 1;
> +
> +    ret =3D rmw_mip64(env, csrno, &rval, new_val, wr_mask & mask);
> +    if (ret_val) {
> +        rval &=3D mask;
> +        vsbits =3D rval & VS_MODE_INTERRUPTS;
> +        rval &=3D ~VS_MODE_INTERRUPTS;
> +        *ret_val =3D rval | (vsbits >> 1);
> +    }
> +
> +    return ret;
> +}
> +
>  static RISCVException rmw_vsip(CPURISCVState *env, int csrno,
> -                               target_ulong *ret_value,
> -                               target_ulong new_value, target_ulong
> write_mask)
> +                               target_ulong *ret_val,
> +                               target_ulong new_val, target_ulong wr_mas=
k)
>  {
> -    /* Shift the S bits to their VS bit location in mip */
> -    int ret =3D rmw_mip(env, csrno, ret_value, new_value << 1,
> -                      (write_mask << 1) & vsip_writable_mask &
> env->hideleg);
> +    uint64_t rval;
> +    RISCVException ret;
>
> -    if (ret_value) {
> -        *ret_value &=3D VS_MODE_INTERRUPTS;
> -        /* Shift the VS bits to their S bit location in vsip */
> -        *ret_value >>=3D 1;
> +    ret =3D rmw_vsip64(env, csrno, &rval, new_val, wr_mask);
> +    if (ret_val) {
> +        *ret_val =3D rval;
>      }
> +
>      return ret;
>  }
>
> -static RISCVException rmw_sip(CPURISCVState *env, int csrno,
> -                              target_ulong *ret_value,
> -                              target_ulong new_value, target_ulong
> write_mask)
> +static RISCVException rmw_vsiph(CPURISCVState *env, int csrno,
> +                                target_ulong *ret_val,
> +                                target_ulong new_val, target_ulong
> wr_mask)
>  {
> -    int ret;
> +    uint64_t rval;
> +    RISCVException ret;
> +
> +    ret =3D rmw_vsip64(env, csrno, &rval,
> +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> +    if (ret_val) {
> +        *ret_val =3D rval >> 32;
> +    }
> +
> +    return ret;
> +}
> +
> +static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
> +                                uint64_t *ret_val,
> +                                uint64_t new_val, uint64_t wr_mask)
> +{
> +    RISCVException ret;
> +    uint64_t mask =3D env->mideleg & sip_writable_mask;
>
>      if (riscv_cpu_virt_enabled(env)) {
> -        ret =3D rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask=
);
> +        ret =3D rmw_vsip64(env, CSR_VSIP, ret_val, new_val, wr_mask);
>      } else {
> -        ret =3D rmw_mip(env, csrno, ret_value, new_value,
> -                      write_mask & env->mideleg & sip_writable_mask);
> +        ret =3D rmw_mip64(env, csrno, ret_val, new_val, wr_mask & mask);
>      }
>
> -    if (ret_value) {
> -        *ret_value &=3D env->mideleg & S_MODE_INTERRUPTS;
> +    if (ret_val) {
> +        *ret_val &=3D env->mideleg & S_MODE_INTERRUPTS;
> +    }
> +
> +    return ret;
> +}
> +
> +static RISCVException rmw_sip(CPURISCVState *env, int csrno,
> +                              target_ulong *ret_val,
> +                              target_ulong new_val, target_ulong wr_mask=
)
> +{
> +    uint64_t rval;
> +    RISCVException ret;
> +
> +    ret =3D rmw_sip64(env, csrno, &rval, new_val, wr_mask);
> +    if (ret_val) {
> +        *ret_val =3D rval;
>      }
> +
> +    return ret;
> +}
> +
> +static RISCVException rmw_siph(CPURISCVState *env, int csrno,
> +                               target_ulong *ret_val,
> +                               target_ulong new_val, target_ulong wr_mas=
k)
> +{
> +    uint64_t rval;
> +    RISCVException ret;
> +
> +    ret =3D rmw_sip64(env, csrno, &rval,
> +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> +    if (ret_val) {
> +        *ret_val =3D rval >> 32;
> +    }
> +
>      return ret;
>  }
>
> @@ -1128,30 +1402,94 @@ static RISCVException write_hedeleg(CPURISCVState
> *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> -static RISCVException read_hideleg(CPURISCVState *env, int csrno,
> -                                   target_ulong *val)
> +static RISCVException rmw_hideleg64(CPURISCVState *env, int csrno,
> +                                    uint64_t *ret_val,
> +                                    uint64_t new_val, uint64_t wr_mask)
>  {
> -    *val =3D env->hideleg;
> +    uint64_t mask =3D wr_mask & vs_delegable_ints;
> +
> +    if (ret_val) {
> +        *ret_val =3D env->hideleg & vs_delegable_ints;
> +    }
> +
> +    env->hideleg =3D (env->hideleg & ~mask) | (new_val & mask);
>      return RISCV_EXCP_NONE;
>  }
>
> -static RISCVException write_hideleg(CPURISCVState *env, int csrno,
> -                                    target_ulong val)
> +static RISCVException rmw_hideleg(CPURISCVState *env, int csrno,
> +                                  target_ulong *ret_val,
> +                                  target_ulong new_val, target_ulong
> wr_mask)
>  {
> -    env->hideleg =3D val & vs_delegable_ints;
> -    return RISCV_EXCP_NONE;
> +    uint64_t rval;
> +    RISCVException ret;
> +
> +    ret =3D rmw_hideleg64(env, csrno, &rval, new_val, wr_mask);
> +    if (ret_val) {
> +        *ret_val =3D rval;
> +    }
> +
> +    return ret;
> +}
> +
> +static RISCVException rmw_hidelegh(CPURISCVState *env, int csrno,
> +                                   target_ulong *ret_val,
> +                                   target_ulong new_val, target_ulong
> wr_mask)
> +{
> +    uint64_t rval;
> +    RISCVException ret;
> +
> +    ret =3D rmw_hideleg64(env, csrno, &rval,
> +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> +    if (ret_val) {
> +        *ret_val =3D rval >> 32;
> +    }
> +
> +    return ret;
> +}
> +
> +static RISCVException rmw_hvip64(CPURISCVState *env, int csrno,
> +                                 uint64_t *ret_val,
> +                                 uint64_t new_val, uint64_t wr_mask)
> +{
> +    RISCVException ret;
> +
> +    ret =3D rmw_mip64(env, csrno, ret_val, new_val,
> +                    wr_mask & hvip_writable_mask);
> +    if (ret_val) {
> +        *ret_val &=3D VS_MODE_INTERRUPTS;
> +    }
> +
> +    return ret;
>  }
>
>  static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
> -                               target_ulong *ret_value,
> -                               target_ulong new_value, target_ulong
> write_mask)
> +                               target_ulong *ret_val,
> +                               target_ulong new_val, target_ulong wr_mas=
k)
>  {
> -    int ret =3D rmw_mip(env, csrno, ret_value, new_value,
> -                      write_mask & hvip_writable_mask);
> +    uint64_t rval;
> +    RISCVException ret;
>
> -    if (ret_value) {
> -        *ret_value &=3D VS_MODE_INTERRUPTS;
> +    ret =3D rmw_hvip64(env, csrno, &rval, new_val, wr_mask);
> +    if (ret_val) {
> +        *ret_val =3D rval;
> +    }
> +
> +    return ret;
> +}
> +
> +static RISCVException rmw_hviph(CPURISCVState *env, int csrno,
> +                                target_ulong *ret_val,
> +                                target_ulong new_val, target_ulong
> wr_mask)
> +{
> +    uint64_t rval;
> +    RISCVException ret;
> +
> +    ret =3D rmw_hvip64(env, csrno, &rval,
> +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> +    if (ret_val) {
> +        *ret_val =3D rval >> 32;
>      }
> +
>      return ret;
>  }
>
> @@ -1168,18 +1506,19 @@ static RISCVException rmw_hip(CPURISCVState *env,
> int csrno,
>      return ret;
>  }
>
> -static RISCVException read_hie(CPURISCVState *env, int csrno,
> -                               target_ulong *val)
> +static RISCVException rmw_hie(CPURISCVState *env, int csrno,
> +                              target_ulong *ret_val,
> +                              target_ulong new_val, target_ulong wr_mask=
)
>  {
> -    *val =3D env->mie & HS_MODE_INTERRUPTS;
> -    return RISCV_EXCP_NONE;
> -}
> +    uint64_t rval;
> +    RISCVException ret;
>
> -static RISCVException write_hie(CPURISCVState *env, int csrno,
> -                                target_ulong val)
> -{
> -    target_ulong newval =3D (env->mie & ~HS_MODE_INTERRUPTS) | (val &
> HS_MODE_INTERRUPTS);
> -    return write_mie(env, CSR_MIE, newval);
> +    ret =3D rmw_mie64(env, csrno, &rval, new_val, wr_mask &
> HS_MODE_INTERRUPTS);
> +    if (ret_val) {
> +        *ret_val =3D rval & HS_MODE_INTERRUPTS;
> +    }
> +
> +    return ret;
>  }
>
>  static RISCVException read_hcounteren(CPURISCVState *env, int csrno,
> @@ -1901,9 +2240,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      /* Machine Trap Setup */
>      [CSR_MSTATUS]     =3D { "mstatus",    any,   read_mstatus,
>  write_mstatus     },
>      [CSR_MISA]        =3D { "misa",       any,   read_misa,
> write_misa        },
> -    [CSR_MIDELEG]     =3D { "mideleg",    any,   read_mideleg,
>  write_mideleg     },
> +    [CSR_MIDELEG]     =3D { "mideleg",    any,   NULL,    NULL,
> rmw_mideleg       },
>      [CSR_MEDELEG]     =3D { "medeleg",    any,   read_medeleg,
>  write_medeleg     },
> -    [CSR_MIE]         =3D { "mie",        any,   read_mie,
>  write_mie         },
> +    [CSR_MIE]         =3D { "mie",        any,   NULL,    NULL,    rmw_m=
ie
>          },
>      [CSR_MTVEC]       =3D { "mtvec",      any,   read_mtvec,
>  write_mtvec       },
>      [CSR_MCOUNTEREN]  =3D { "mcounteren", any,   read_mcounteren,
> write_mcounteren  },
>
> @@ -1916,9 +2255,14 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      [CSR_MTVAL]    =3D { "mtval",    any,  read_mtval,    write_mtval   =
 },
>      [CSR_MIP]      =3D { "mip",      any,  NULL,    NULL, rmw_mip       =
 },
>
> +    /* Machine-Level High-Half CSRs (AIA) */
> +    [CSR_MIDELEGH] =3D { "midelegh", aia_any32, NULL, NULL, rmw_midelegh=
 },
> +    [CSR_MIEH]     =3D { "mieh",     aia_any32, NULL, NULL, rmw_mieh    =
 },
> +    [CSR_MIPH]     =3D { "miph",     aia_any32, NULL, NULL, rmw_miph    =
 },
> +
>      /* Supervisor Trap Setup */
>      [CSR_SSTATUS]    =3D { "sstatus",    smode, read_sstatus,
> write_sstatus    },
> -    [CSR_SIE]        =3D { "sie",        smode, read_sie,        write_s=
ie
>       },
> +    [CSR_SIE]        =3D { "sie",        smode, NULL,   NULL,    rmw_sie
>       },
>      [CSR_STVEC]      =3D { "stvec",      smode, read_stvec,
> write_stvec      },
>      [CSR_SCOUNTEREN] =3D { "scounteren", smode, read_scounteren,
> write_scounteren },
>
> @@ -1932,12 +2276,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
>      /* Supervisor Protection and Translation */
>      [CSR_SATP]     =3D { "satp",     smode, read_satp,    write_satp    =
  },
>
> +    /* Supervisor-Level High-Half CSRs (AIA) */
> +    [CSR_SIEH]       =3D { "sieh",   aia_smode32, NULL, NULL, rmw_sieh }=
,
> +    [CSR_SIPH]       =3D { "siph",   aia_smode32, NULL, NULL, rmw_siph }=
,
> +
>      [CSR_HSTATUS]     =3D { "hstatus",     hmode,   read_hstatus,
>  write_hstatus     },
>      [CSR_HEDELEG]     =3D { "hedeleg",     hmode,   read_hedeleg,
>  write_hedeleg     },
> -    [CSR_HIDELEG]     =3D { "hideleg",     hmode,   read_hideleg,
>  write_hideleg     },
> +    [CSR_HIDELEG]     =3D { "hideleg",     hmode,   NULL,   NULL,
>  rmw_hideleg       },
>      [CSR_HVIP]        =3D { "hvip",        hmode,   NULL,   NULL,
>  rmw_hvip          },
>      [CSR_HIP]         =3D { "hip",         hmode,   NULL,   NULL,
>  rmw_hip           },
> -    [CSR_HIE]         =3D { "hie",         hmode,   read_hie,
>  write_hie         },
> +    [CSR_HIE]         =3D { "hie",         hmode,   NULL,   NULL,
>  rmw_hie           },
>      [CSR_HCOUNTEREN]  =3D { "hcounteren",  hmode,   read_hcounteren,
> write_hcounteren  },
>      [CSR_HGEIE]       =3D { "hgeie",       hmode,   read_hgeie,
>  write_hgeie       },
>      [CSR_HTVAL]       =3D { "htval",       hmode,   read_htval,
>  write_htval       },
> @@ -1949,7 +2297,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>
>      [CSR_VSSTATUS]    =3D { "vsstatus",    hmode,   read_vsstatus,
> write_vsstatus    },
>      [CSR_VSIP]        =3D { "vsip",        hmode,   NULL,    NULL,
> rmw_vsip          },
> -    [CSR_VSIE]        =3D { "vsie",        hmode,   read_vsie,
> write_vsie        },
> +    [CSR_VSIE]        =3D { "vsie",        hmode,   NULL,    NULL,
> rmw_vsie          },
>      [CSR_VSTVEC]      =3D { "vstvec",      hmode,   read_vstvec,
> write_vstvec      },
>      [CSR_VSSCRATCH]   =3D { "vsscratch",   hmode,   read_vsscratch,
>  write_vsscratch   },
>      [CSR_VSEPC]       =3D { "vsepc",       hmode,   read_vsepc,
>  write_vsepc       },
> @@ -1960,6 +2308,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      [CSR_MTVAL2]      =3D { "mtval2",      hmode,   read_mtval2,
> write_mtval2      },
>      [CSR_MTINST]      =3D { "mtinst",      hmode,   read_mtinst,
> write_mtinst      },
>
> +    /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
> +    [CSR_HIDELEGH]    =3D { "hidelegh",    aia_hmode32, NULL, NULL,
> rmw_hidelegh },
> +    [CSR_HVIPH]       =3D { "hviph",       aia_hmode32, NULL, NULL,
> rmw_hviph },
> +    [CSR_VSIEH]       =3D { "vsieh",       aia_hmode32, NULL, NULL,
> rmw_vsieh },
> +    [CSR_VSIPH]       =3D { "vsiph",       aia_hmode32, NULL, NULL,
> rmw_vsiph },
> +
>      /* Physical Memory Protection */
>      [CSR_MSECCFG]    =3D { "mseccfg",  epmp, read_mseccfg, write_mseccfg=
 },
>      [CSR_PMPCFG0]    =3D { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg =
 },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index cffc444969..44dca84ded 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -84,7 +84,7 @@ static const VMStateDescription vmstate_hyper =3D {
>      .fields =3D (VMStateField[]) {
>          VMSTATE_UINTTL(env.hstatus, RISCVCPU),
>          VMSTATE_UINTTL(env.hedeleg, RISCVCPU),
> -        VMSTATE_UINTTL(env.hideleg, RISCVCPU),
> +        VMSTATE_UINT64(env.hideleg, RISCVCPU),
>          VMSTATE_UINTTL(env.hcounteren, RISCVCPU),
>          VMSTATE_UINTTL(env.htval, RISCVCPU),
>          VMSTATE_UINTTL(env.htinst, RISCVCPU),
> @@ -194,10 +194,10 @@ const VMStateDescription vmstate_riscv_cpu =3D {
>          VMSTATE_UINTTL(env.resetvec, RISCVCPU),
>          VMSTATE_UINTTL(env.mhartid, RISCVCPU),
>          VMSTATE_UINT64(env.mstatus, RISCVCPU),
> -        VMSTATE_UINTTL(env.mip, RISCVCPU),
> -        VMSTATE_UINT32(env.miclaim, RISCVCPU),
> -        VMSTATE_UINTTL(env.mie, RISCVCPU),
> -        VMSTATE_UINTTL(env.mideleg, RISCVCPU),
> +        VMSTATE_UINT64(env.mip, RISCVCPU),
> +        VMSTATE_UINT64(env.miclaim, RISCVCPU),
> +        VMSTATE_UINT64(env.mie, RISCVCPU),
> +        VMSTATE_UINT64(env.mideleg, RISCVCPU),
>          VMSTATE_UINTTL(env.satp, RISCVCPU),
>          VMSTATE_UINTTL(env.stval, RISCVCPU),
>          VMSTATE_UINTTL(env.medeleg, RISCVCPU),
> --
> 2.25.1
>
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--000000000000b8d58705d587b52d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Anup Patel &lt;<a href=3D"mailto:anup@bra=
infault.org">anup@brainfault.org</a>&gt; =E6=96=BC 2021=E5=B9=B412=E6=9C=88=
30=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:55=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com=
" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
<br>
The AIA specification adds new CSRs for RV32 so that RISC-V hart can<br>
support 64 local interrupts on both RV32 and RV64.<br>
<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 +-<br>
=C2=A0target/riscv/cpu_helper.c |=C2=A0 10 +-<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 560 +++++++++++++++++=
++++++++++++++-------<br>
=C2=A0target/riscv/machine.c=C2=A0 =C2=A0 |=C2=A0 10 +-<br>
=C2=A04 files changed, 474 insertions(+), 120 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index 140fabfdf9..72d03aa126 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -162,12 +162,12 @@ struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0uint64_t mstatus;<br>
<br>
-=C2=A0 =C2=A0 target_ulong mip;<br>
+=C2=A0 =C2=A0 uint64_t mip;<br>
<br>
-=C2=A0 =C2=A0 uint32_t miclaim;<br>
+=C2=A0 =C2=A0 uint64_t miclaim;<br>
<br>
-=C2=A0 =C2=A0 target_ulong mie;<br>
-=C2=A0 =C2=A0 target_ulong mideleg;<br>
+=C2=A0 =C2=A0 uint64_t mie;<br>
+=C2=A0 =C2=A0 uint64_t mideleg;<br>
<br>
=C2=A0 =C2=A0 =C2=A0target_ulong satp;=C2=A0 =C2=A0/* since: priv-1.10.0 */=
<br>
=C2=A0 =C2=A0 =C2=A0target_ulong stval;<br>
@@ -189,7 +189,7 @@ struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0/* Hypervisor CSRs */<br>
=C2=A0 =C2=A0 =C2=A0target_ulong hstatus;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong hedeleg;<br>
-=C2=A0 =C2=A0 target_ulong hideleg;<br>
+=C2=A0 =C2=A0 uint64_t hideleg;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong hcounteren;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong htval;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong htinst;<br>
@@ -420,8 +420,8 @@ void riscv_cpu_list(void);<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
=C2=A0bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);<b=
r>
=C2=A0void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);<br>
-int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);<br>
-uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value=
);<br>
+int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);<br>
+uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value=
);<br>
=C2=A0#define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip v=
alue */<br>
=C2=A0void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint3=
2_t),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t arg);<br>
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
index e3532de4cf..e97d51fbd0 100644<br>
--- a/target/riscv/cpu_helper.c<br>
+++ b/target/riscv/cpu_helper.c<br>
@@ -534,7 +534,7 @@ bool riscv_cpu_two_stage_lookup(int mmu_idx)<br>
=C2=A0 =C2=A0 =C2=A0return mmu_idx &amp; TB_FLAGS_PRIV_HYP_ACCESS_MASK;<br>
=C2=A0}<br>
<br>
-int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)<br>
+int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
=C2=A0 =C2=A0 =C2=A0if (env-&gt;miclaim &amp; interrupts) {<br>
@@ -545,11 +545,11 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_=
t interrupts)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value=
)<br>
+uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value=
)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D CPU(cpu);<br>
-=C2=A0 =C2=A0 uint32_t gein, vsgein =3D 0, old =3D env-&gt;mip;<br>
+=C2=A0 =C2=A0 uint64_t gein, vsgein =3D 0, old =3D env-&gt;mip;<br>
=C2=A0 =C2=A0 =C2=A0bool locked =3D false;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_cpu_virt_enabled(env)) {<br>
@@ -1252,7 +1252,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0bool async =3D !!(cs-&gt;exception_index &amp; RISCV_EX=
CP_INT_FLAG);<br>
=C2=A0 =C2=A0 =C2=A0target_ulong cause =3D cs-&gt;exception_index &amp; RIS=
CV_EXCP_INT_MASK;<br>
-=C2=A0 =C2=A0 target_ulong deleg =3D async ? env-&gt;mideleg : env-&gt;med=
eleg;<br>
+=C2=A0 =C2=A0 uint64_t deleg =3D async ? env-&gt;mideleg : env-&gt;medeleg=
;<br>
=C2=A0 =C2=A0 =C2=A0bool write_tval =3D false;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong tval =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong htval =3D 0;<br>
@@ -1317,7 +1317,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cause &lt; TARGET_LONG_BITS=
 &amp;&amp; ((deleg &gt;&gt; cause) &amp; 1)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* handle the trap in S-mode */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (riscv_has_ext(env, RVH)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong hdeleg =3D async ? =
env-&gt;hideleg : env-&gt;hedeleg;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t hdeleg =3D async ? env-=
&gt;hideleg : env-&gt;hedeleg;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (env-&gt;two_stage_looku=
p &amp;&amp; write_tval) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index 50424a8344..06db5ab1a8 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -154,6 +154,15 @@ static RISCVException any32(CPURISCVState *env, int cs=
rno)<br>
<br>
=C2=A0}<br>
<br>
+static int aia_any32(CPURISCVState *env, int csrno)<br>
+{<br>
+=C2=A0 =C2=A0 if (!riscv_feature(env, RISCV_FEATURE_AIA)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return any32(env, csrno);<br>
+}<br>
+<br>
=C2=A0static RISCVException smode(CPURISCVState *env, int csrno)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_has_ext(env, RVS)) {<br>
@@ -163,6 +172,24 @@ static RISCVException smode(CPURISCVState *env, int cs=
rno)<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_ILLEGAL_INST;<br>
=C2=A0}<br>
<br>
+static int smode32(CPURISCVState *env, int csrno)<br>
+{<br>
+=C2=A0 =C2=A0 if (riscv_cpu_mxl(env) !=3D MXL_RV32) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return smode(env, csrno);<br>
+}<br>
+<br>
+static int aia_smode32(CPURISCVState *env, int csrno)<br>
+{<br>
+=C2=A0 =C2=A0 if (!riscv_feature(env, RISCV_FEATURE_AIA)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return smode32(env, csrno);<br>
+}<br>
+<br>
=C2=A0static RISCVException hmode(CPURISCVState *env, int csrno)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_has_ext(env, RVS) &amp;&amp;<br>
@@ -203,6 +230,15 @@ static RISCVException pointer_masking(CPURISCVState *e=
nv, int csrno)<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_ILLEGAL_INST;<br>
=C2=A0}<br>
<br>
+static int aia_hmode32(CPURISCVState *env, int csrno)<br>
+{<br>
+=C2=A0 =C2=A0 if (!riscv_feature(env, RISCV_FEATURE_AIA)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return hmode32(env, csrno);<br>
+}<br>
+<br>
=C2=A0static RISCVException pmp(CPURISCVState *env, int csrno)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_feature(env, RISCV_FEATURE_PMP)) {<br>
@@ -443,15 +479,15 @@ static RISCVException read_timeh(CPURISCVState *env, =
int csrno,<br>
<br>
=C2=A0/* Machine constants */<br>
<br>
-#define M_MODE_INTERRUPTS=C2=A0 (MIP_MSIP | MIP_MTIP | MIP_MEIP)<br>
-#define S_MODE_INTERRUPTS=C2=A0 (MIP_SSIP | MIP_STIP | MIP_SEIP)<br>
-#define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)<br>
-#define HS_MODE_INTERRUPTS (MIP_SGEIP | VS_MODE_INTERRUPTS)<br>
+#define M_MODE_INTERRUPTS=C2=A0 ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP=
))<br>
+#define S_MODE_INTERRUPTS=C2=A0 ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP=
))<br>
+#define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP))=
<br>
+#define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))<br=
>
<br>
-static const target_ulong delegable_ints =3D S_MODE_INTERRUPTS |<br>
+static const uint64_t delegable_ints =3D S_MODE_INTERRUPTS |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 VS_MODE_INTERRUPTS;<br>
-static const target_ulong vs_delegable_ints =3D VS_MODE_INTERRUPTS;<br>
-static const target_ulong all_ints =3D M_MODE_INTERRUPTS | S_MODE_INTERRUP=
TS |<br>
+static const uint64_t vs_delegable_ints =3D VS_MODE_INTERRUPTS;<br>
+static const uint64_t all_ints =3D M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HS_MODE_INTERRU=
PTS;<br>
=C2=A0#define DELEGABLE_EXCPS ((1ULL &lt;&lt; (RISCV_EXCP_INST_ADDR_MIS)) |=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (1ULL &lt;&lt; (RISCV_EXCP_INST_ACCESS_FAULT)) | \<br>
@@ -701,40 +737,107 @@ static RISCVException write_medeleg(CPURISCVState *e=
nv, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
-static RISCVException read_mideleg(CPURISCVState *env, int csrno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<br>
+static RISCVException rmw_mideleg64(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t new_val, uint=
64_t wr_mask)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 *val =3D env-&gt;mideleg;<br>
-=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
-}<br>
+=C2=A0 =C2=A0 uint64_t mask =3D wr_mask &amp; delegable_ints;<br>
+<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D env-&gt;mideleg;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 env-&gt;mideleg =3D (env-&gt;mideleg &amp; ~mask) | (new_val=
 &amp; mask);<br>
<br>
-static RISCVException write_mideleg(CPURISCVState *env, int csrno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<br>
-{<br>
-=C2=A0 =C2=A0 env-&gt;mideleg =3D (env-&gt;mideleg &amp; ~delegable_ints) =
| (val &amp; delegable_ints);<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_has_ext(env, RVH)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;mideleg |=3D HS_MODE_INTERRUPTS;<=
br>
=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
-static RISCVException read_mie(CPURISCVState *env, int csrno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<br>
+static RISCVException rmw_mideleg(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong new_val, target_=
ulong wr_mask)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 *val =3D env-&gt;mie;<br>
-=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+=C2=A0 =C2=A0 uint64_t rval;<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D rmw_mideleg64(env, csrno, &amp;rval, new_val, wr_mas=
k);<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
-static RISCVException write_mie(CPURISCVState *env, int csrno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<br>
+static RISCVException rmw_midelegh(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *ret_val,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong new_val,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong wr_mask)<b=
r>
=C2=A0{<br>
-=C2=A0 =C2=A0 env-&gt;mie =3D (env-&gt;mie &amp; ~all_ints) | (val &amp; a=
ll_ints);<br>
+=C2=A0 =C2=A0 uint64_t rval;<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D rmw_mideleg64(env, csrno, &amp;rval,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)new_val) &lt;&lt; 32, ((uint64_t)wr=
_mask) &lt;&lt; 32);<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval &gt;&gt; 32;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static RISCVException rmw_mie64(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t new_val, uint64_t wr_mask)<=
br>
+{<br>
+=C2=A0 =C2=A0 uint64_t mask =3D wr_mask &amp; all_ints;<br>
+<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D env-&gt;mie;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 env-&gt;mie =3D (env-&gt;mie &amp; ~mask) | (new_val &amp; m=
ask);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (!riscv_has_ext(env, RVH)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mie &amp;=3D ~MIP_SGEIP;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mie &amp;=3D ~((uint64_t)MIP_SGEIP);<b=
r>
=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
+static RISCVException rmw_mie(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong new_val, target_ulong wr_mask)=
<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t rval;<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D rmw_mie64(env, csrno, &amp;rval, new_val, wr_mask);<=
br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static RISCVException rmw_mieh(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong new_val, target_ulong wr=
_mask)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t rval;<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D rmw_mie64(env, csrno, &amp;rval,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)new_val) &lt;&lt; 32, ((uint64_t)wr=
_mask) &lt;&lt; 32);<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval &gt;&gt; 32;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
=C2=A0static RISCVException read_mtvec(CPURISCVState *env, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *val)<br>
=C2=A0{<br>
@@ -825,17 +928,17 @@ static RISCVException write_mtval(CPURISCVState *env,=
 int csrno,<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
-static RISCVException rmw_mip(CPURISCVState *env, int csrno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *ret_value,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong new_value, target_ulong write_=
mask)<br>
+static RISCVException rmw_mip64(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t new_val, uint64_t wr_mask)<=
br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D env_archcpu(env);<br>
=C2=A0 =C2=A0 =C2=A0/* Allow software control of delegable interrupts not c=
laimed by hardware */<br>
-=C2=A0 =C2=A0 target_ulong mask =3D write_mask &amp; delegable_ints &amp; =
~env-&gt;miclaim;<br>
-=C2=A0 =C2=A0 uint32_t gin, old_mip;<br>
+=C2=A0 =C2=A0 uint64_t old_mip, mask =3D wr_mask &amp; delegable_ints &amp=
; ~env-&gt;miclaim;<br>
+=C2=A0 =C2=A0 uint32_t gin;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (mask) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 old_mip =3D riscv_cpu_update_mip(cpu, mask, (n=
ew_value &amp; mask));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 old_mip =3D riscv_cpu_update_mip(cpu, mask, (n=
ew_val &amp; mask));<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_mip =3D env-&gt;mip;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -845,13 +948,44 @@ static RISCVException rmw_mip(CPURISCVState *env, int=
 csrno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_mip |=3D (env-&gt;hgeip &amp; ((targe=
t_ulong)1 &lt;&lt; gin)) ? MIP_VSEIP : 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (ret_value) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_value =3D old_mip;<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D old_mip;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
+static RISCVException rmw_mip(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong new_val, target_ulong wr_mask)=
<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t rval;<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D rmw_mip64(env, csrno, &amp;rval, new_val, wr_mask);<=
br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static RISCVException rmw_miph(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong new_val, target_ulong wr=
_mask)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t rval;<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D rmw_mip64(env, csrno, &amp;rval,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)new_val) &lt;&lt; 32, ((uint64_t)wr=
_mask) &lt;&lt; 32);<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval &gt;&gt; 32;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
=C2=A0/* Supervisor Trap Setup */<br>
=C2=A0static RISCVException read_sstatus(CPURISCVState *env, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *val)<br>
@@ -871,45 +1005,112 @@ static RISCVException write_sstatus(CPURISCVState *=
env, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0return write_mstatus(env, CSR_MSTATUS, newval);<br>
=C2=A0}<br>
<br>
-static RISCVException read_vsie(CPURISCVState *env, int csrno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *val)<br>
+static RISCVException rmw_vsie64(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t new_val, uint64_t wr_=
mask)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 /* Shift the VS bits to their S bit location in vsie */<br>
-=C2=A0 =C2=A0 *val =3D (env-&gt;mie &amp; env-&gt;hideleg &amp; VS_MODE_IN=
TERRUPTS) &gt;&gt; 1;<br>
-=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+=C2=A0 =C2=A0 uint64_t rval, vsbits, mask =3D env-&gt;hideleg &amp; VS_MOD=
E_INTERRUPTS;<br>
+<br>
+=C2=A0 =C2=A0 /* Bring VS-level bits to correct position */<br>
+=C2=A0 =C2=A0 vsbits =3D new_val &amp; (VS_MODE_INTERRUPTS &gt;&gt; 1);<br=
>
+=C2=A0 =C2=A0 new_val &amp;=3D ~(VS_MODE_INTERRUPTS &gt;&gt; 1);<br>
+=C2=A0 =C2=A0 new_val |=3D vsbits &lt;&lt; 1;<br>
+=C2=A0 =C2=A0 vsbits =3D wr_mask &amp; (VS_MODE_INTERRUPTS &gt;&gt; 1);<br=
>
+=C2=A0 =C2=A0 wr_mask &amp;=3D ~(VS_MODE_INTERRUPTS &gt;&gt; 1);<br>
+=C2=A0 =C2=A0 wr_mask |=3D vsbits &lt;&lt; 1;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D rmw_mie64(env, csrno, &amp;rval, new_val, wr_mask &a=
mp; mask);<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rval &amp;=3D mask;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vsbits =3D rval &amp; VS_MODE_INTERRUPTS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rval &amp;=3D ~VS_MODE_INTERRUPTS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval | (vsbits &gt;&gt; 1);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
-static RISCVException read_sie(CPURISCVState *env, int csrno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<br>
+static RISCVException rmw_vsie(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong new_val, target_ulong wr=
_mask)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 read_vsie(env, CSR_VSIE, val);<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D env-&gt;mie &amp; env-&gt;mideleg;<br=
>
+=C2=A0 =C2=A0 uint64_t rval;<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D rmw_vsie64(env, csrno, &amp;rval, new_val, wr_mask);=
<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
-static RISCVException write_vsie(CPURISCVState *env, int csrno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong val)<br>
+static RISCVException rmw_vsieh(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong new_val, target_ulong w=
r_mask)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 /* Shift the S bits to their VS bit location in mie */<br>
-=C2=A0 =C2=A0 target_ulong newval =3D (env-&gt;mie &amp; ~VS_MODE_INTERRUP=
TS) |<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ((val &lt;&lt; 1) &amp; env-&gt;hideleg &amp; VS_MODE_INT=
ERRUPTS);<br>
-=C2=A0 =C2=A0 return write_mie(env, CSR_MIE, newval);<br>
+=C2=A0 =C2=A0 uint64_t rval;<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D rmw_vsie64(env, csrno, &amp;rval,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)new_val) &lt;&lt; 32, ((uint64_t)wr=
_mask) &lt;&lt; 32);<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval &gt;&gt; 32;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
-static int write_sie(CPURISCVState *env, int csrno, target_ulong val)<br>
+static RISCVException rmw_sie64(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t new_val, uint64_t wr_mask)<=
br>
=C2=A0{<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+=C2=A0 =C2=A0 uint64_t mask =3D env-&gt;mideleg &amp; S_MODE_INTERRUPTS;<b=
r>
+<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_cpu_virt_enabled(env)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_vsie(env, CSR_VSIE, val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D rmw_vsie64(env, CSR_VSIE, ret_val, new=
_val, wr_mask);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong newval =3D (env-&gt;mie &amp; ~S_=
MODE_INTERRUPTS) |<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (val &amp; S_MODE_INTERRUPTS);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_mie(env, CSR_MIE, newval);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D rmw_mie64(env, csrno, ret_val, new_val=
, wr_mask &amp; mask);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val &amp;=3D mask;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static RISCVException rmw_sie(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong new_val, target_ulong wr_mask)=
<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t rval;<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D rmw_sie64(env, csrno, &amp;rval, new_val, wr_mask);<=
br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static RISCVException rmw_sieh(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong new_val, target_ulong wr=
_mask)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t rval;<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D rmw_sie64(env, csrno, &amp;rval,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)new_val) &lt;&lt; 32, ((uint64_t)wr=
_mask) &lt;&lt; 32);<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval &gt;&gt; 32;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
=C2=A0static RISCVException read_stvec(CPURISCVState *env, int csrno,<br>
@@ -1002,38 +1203,111 @@ static RISCVException write_stval(CPURISCVState *e=
nv, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
+static RISCVException rmw_vsip64(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t new_val, uint64_t wr_=
mask)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+=C2=A0 =C2=A0 uint64_t rval, vsbits, mask =3D env-&gt;hideleg &amp; vsip_w=
ritable_mask;<br>
+<br>
+=C2=A0 =C2=A0 /* Bring VS-level bits to correct position */<br>
+=C2=A0 =C2=A0 vsbits =3D new_val &amp; (VS_MODE_INTERRUPTS &gt;&gt; 1);<br=
>
+=C2=A0 =C2=A0 new_val &amp;=3D ~(VS_MODE_INTERRUPTS &gt;&gt; 1);<br>
+=C2=A0 =C2=A0 new_val |=3D vsbits &lt;&lt; 1;<br>
+=C2=A0 =C2=A0 vsbits =3D wr_mask &amp; (VS_MODE_INTERRUPTS &gt;&gt; 1);<br=
>
+=C2=A0 =C2=A0 wr_mask &amp;=3D ~(VS_MODE_INTERRUPTS &gt;&gt; 1);<br>
+=C2=A0 =C2=A0 wr_mask |=3D vsbits &lt;&lt; 1;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D rmw_mip64(env, csrno, &amp;rval, new_val, wr_mask &a=
mp; mask);<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rval &amp;=3D mask;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vsbits =3D rval &amp; VS_MODE_INTERRUPTS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rval &amp;=3D ~VS_MODE_INTERRUPTS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval | (vsbits &gt;&gt; 1);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
=C2=A0static RISCVException rmw_vsip(CPURISCVState *env, int csrno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *ret_value,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong new_value, target_ulong =
write_mask)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong new_val, target_ulong wr=
_mask)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 /* Shift the S bits to their VS bit location in mip */<br>
-=C2=A0 =C2=A0 int ret =3D rmw_mip(env, csrno, ret_value, new_value &lt;&lt=
; 1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (write_mask &lt;&lt; 1) &amp; vsip_writable_mask &amp; env-&gt;hideleg)=
;<br>
+=C2=A0 =C2=A0 uint64_t rval;<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
<br>
-=C2=A0 =C2=A0 if (ret_value) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_value &amp;=3D VS_MODE_INTERRUPTS;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Shift the VS bits to their S bit location i=
n vsip */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_value &gt;&gt;=3D 1;<br>
+=C2=A0 =C2=A0 ret =3D rmw_vsip64(env, csrno, &amp;rval, new_val, wr_mask);=
<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
-static RISCVException rmw_sip(CPURISCVState *env, int csrno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *ret_value,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong new_value, target_ulong write_=
mask)<br>
+static RISCVException rmw_vsiph(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong new_val, target_ulong w=
r_mask)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 int ret;<br>
+=C2=A0 =C2=A0 uint64_t rval;<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D rmw_vsip64(env, csrno, &amp;rval,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)new_val) &lt;&lt; 32, ((uint64_t)wr=
_mask) &lt;&lt; 32);<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval &gt;&gt; 32;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static RISCVException rmw_sip64(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t new_val, uint64_t wr_mask)<=
br>
+{<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+=C2=A0 =C2=A0 uint64_t mask =3D env-&gt;mideleg &amp; sip_writable_mask;<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_cpu_virt_enabled(env)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D rmw_vsip(env, CSR_VSIP, ret_value, new=
_value, write_mask);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D rmw_vsip64(env, CSR_VSIP, ret_val, new=
_val, wr_mask);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D rmw_mip(env, csrno, ret_value, new_val=
ue,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 write_mask &amp; env-&gt;mideleg &amp; sip_writable_mask);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D rmw_mip64(env, csrno, ret_val, new_val=
, wr_mask &amp; mask);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (ret_value) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_value &amp;=3D env-&gt;mideleg &amp; S_MO=
DE_INTERRUPTS;<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val &amp;=3D env-&gt;mideleg &amp; S_MODE=
_INTERRUPTS;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static RISCVException rmw_sip(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong new_val, target_ulong wr_mask)=
<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t rval;<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D rmw_sip64(env, csrno, &amp;rval, new_val, wr_mask);<=
br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static RISCVException rmw_siph(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong new_val, target_ulong wr=
_mask)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t rval;<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D rmw_sip64(env, csrno, &amp;rval,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)new_val) &lt;&lt; 32, ((uint64_t)wr=
_mask) &lt;&lt; 32);<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval &gt;&gt; 32;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
@@ -1128,30 +1402,94 @@ static RISCVException write_hedeleg(CPURISCVState *=
env, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
-static RISCVException read_hideleg(CPURISCVState *env, int csrno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<br>
+static RISCVException rmw_hideleg64(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t new_val, uint=
64_t wr_mask)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 *val =3D env-&gt;hideleg;<br>
+=C2=A0 =C2=A0 uint64_t mask =3D wr_mask &amp; vs_delegable_ints;<br>
+<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D env-&gt;hideleg &amp; vs_delegabl=
e_ints;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 env-&gt;hideleg =3D (env-&gt;hideleg &amp; ~mask) | (new_val=
 &amp; mask);<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
-static RISCVException write_hideleg(CPURISCVState *env, int csrno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<br>
+static RISCVException rmw_hideleg(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong new_val, target_=
ulong wr_mask)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 env-&gt;hideleg =3D val &amp; vs_delegable_ints;<br>
-=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+=C2=A0 =C2=A0 uint64_t rval;<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D rmw_hideleg64(env, csrno, &amp;rval, new_val, wr_mas=
k);<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static RISCVException rmw_hidelegh(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *ret_val,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong new_val, t=
arget_ulong wr_mask)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t rval;<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D rmw_hideleg64(env, csrno, &amp;rval,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)new_val) &lt;&lt; 32, ((uint64_t)wr=
_mask) &lt;&lt; 32);<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval &gt;&gt; 32;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static RISCVException rmw_hvip64(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t new_val, uint64_t wr_=
mask)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D rmw_mip64(env, csrno, ret_val, new_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wr_m=
ask &amp; hvip_writable_mask);<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val &amp;=3D VS_MODE_INTERRUPTS;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
=C2=A0static RISCVException rmw_hvip(CPURISCVState *env, int csrno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *ret_value,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong new_value, target_ulong =
write_mask)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong new_val, target_ulong wr=
_mask)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 int ret =3D rmw_mip(env, csrno, ret_value, new_value,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 write_mask &amp; hvip_writable_mask);<br>
+=C2=A0 =C2=A0 uint64_t rval;<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
<br>
-=C2=A0 =C2=A0 if (ret_value) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_value &amp;=3D VS_MODE_INTERRUPTS;<br>
+=C2=A0 =C2=A0 ret =3D rmw_hvip64(env, csrno, &amp;rval, new_val, wr_mask);=
<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static RISCVException rmw_hviph(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong new_val, target_ulong w=
r_mask)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t rval;<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D rmw_hvip64(env, csrno, &amp;rval,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)new_val) &lt;&lt; 32, ((uint64_t)wr=
_mask) &lt;&lt; 32);<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval &gt;&gt; 32;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
@@ -1168,18 +1506,19 @@ static RISCVException rmw_hip(CPURISCVState *env, i=
nt csrno,<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
-static RISCVException read_hie(CPURISCVState *env, int csrno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<br>
+static RISCVException rmw_hie(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *ret_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong new_val, target_ulong wr_mask)=
<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 *val =3D env-&gt;mie &amp; HS_MODE_INTERRUPTS;<br>
-=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
-}<br>
+=C2=A0 =C2=A0 uint64_t rval;<br>
+=C2=A0 =C2=A0 RISCVException ret;<br>
<br>
-static RISCVException write_hie(CPURISCVState *env, int csrno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<br>
-{<br>
-=C2=A0 =C2=A0 target_ulong newval =3D (env-&gt;mie &amp; ~HS_MODE_INTERRUP=
TS) | (val &amp; HS_MODE_INTERRUPTS);<br>
-=C2=A0 =C2=A0 return write_mie(env, CSR_MIE, newval);<br>
+=C2=A0 =C2=A0 ret =3D rmw_mie64(env, csrno, &amp;rval, new_val, wr_mask &a=
mp; HS_MODE_INTERRUPTS);<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D rval &amp; HS_MODE_INTERRUPTS;<br=
>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
=C2=A0static RISCVException read_hcounteren(CPURISCVState *env, int csrno,<=
br>
@@ -1901,9 +2240,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<br=
>
=C2=A0 =C2=A0 =C2=A0/* Machine Trap Setup */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MSTATUS]=C2=A0 =C2=A0 =C2=A0=3D { &quot;mstatus&qu=
ot;,=C2=A0 =C2=A0 any,=C2=A0 =C2=A0read_mstatus,=C2=A0 =C2=A0 =C2=A0write_m=
status=C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MISA]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D { &quot;misa&=
quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0any,=C2=A0 =C2=A0read_misa,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 write_misa=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
-=C2=A0 =C2=A0 [CSR_MIDELEG]=C2=A0 =C2=A0 =C2=A0=3D { &quot;mideleg&quot;,=
=C2=A0 =C2=A0 any,=C2=A0 =C2=A0read_mideleg,=C2=A0 =C2=A0 =C2=A0write_midel=
eg=C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 [CSR_MIDELEG]=C2=A0 =C2=A0 =C2=A0=3D { &quot;mideleg&quot;,=
=C2=A0 =C2=A0 any,=C2=A0 =C2=A0NULL,=C2=A0 =C2=A0 NULL,=C2=A0 =C2=A0 rmw_mi=
deleg=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MEDELEG]=C2=A0 =C2=A0 =C2=A0=3D { &quot;medeleg&qu=
ot;,=C2=A0 =C2=A0 any,=C2=A0 =C2=A0read_medeleg,=C2=A0 =C2=A0 =C2=A0write_m=
edeleg=C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 [CSR_MIE]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;mie&q=
uot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 any,=C2=A0 =C2=A0read_mie,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0write_mie=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 [CSR_MIE]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;mie&q=
uot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 any,=C2=A0 =C2=A0NULL,=C2=A0 =C2=A0 NULL,=
=C2=A0 =C2=A0 rmw_mie=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MTVEC]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;mtvec=
&quot;,=C2=A0 =C2=A0 =C2=A0 any,=C2=A0 =C2=A0read_mtvec,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0write_mtvec=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MCOUNTEREN]=C2=A0 =3D { &quot;mcounteren&quot;, an=
y,=C2=A0 =C2=A0read_mcounteren,=C2=A0 write_mcounteren=C2=A0 },<br>
<br>
@@ -1916,9 +2255,14 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<b=
r>
=C2=A0 =C2=A0 =C2=A0[CSR_MTVAL]=C2=A0 =C2=A0 =3D { &quot;mtval&quot;,=C2=A0=
 =C2=A0 any,=C2=A0 read_mtval,=C2=A0 =C2=A0 write_mtval=C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MIP]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;mip&quot;,=C2=
=A0 =C2=A0 =C2=A0 any,=C2=A0 NULL,=C2=A0 =C2=A0 NULL, rmw_mip=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 },<br>
<br>
+=C2=A0 =C2=A0 /* Machine-Level High-Half CSRs (AIA) */<br>
+=C2=A0 =C2=A0 [CSR_MIDELEGH] =3D { &quot;midelegh&quot;, aia_any32, NULL, =
NULL, rmw_midelegh },<br>
+=C2=A0 =C2=A0 [CSR_MIEH]=C2=A0 =C2=A0 =C2=A0=3D { &quot;mieh&quot;,=C2=A0 =
=C2=A0 =C2=A0aia_any32, NULL, NULL, rmw_mieh=C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 [CSR_MIPH]=C2=A0 =C2=A0 =C2=A0=3D { &quot;miph&quot;,=C2=A0 =
=C2=A0 =C2=A0aia_any32, NULL, NULL, rmw_miph=C2=A0 =C2=A0 =C2=A0},<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Supervisor Trap Setup */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_SSTATUS]=C2=A0 =C2=A0 =3D { &quot;sstatus&quot;,=
=C2=A0 =C2=A0 smode, read_sstatus,=C2=A0 =C2=A0 write_sstatus=C2=A0 =C2=A0 =
},<br>
-=C2=A0 =C2=A0 [CSR_SIE]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D { &quot;sie&quot;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 smode, read_sie,=C2=A0 =C2=A0 =C2=A0 =C2=A0 wri=
te_sie=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [CSR_SIE]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D { &quot;sie&quot;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 smode, NULL,=C2=A0 =C2=A0NULL,=C2=A0 =C2=A0 rmw=
_sie=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_STVEC]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;stvec&quot;=
,=C2=A0 =C2=A0 =C2=A0 smode, read_stvec,=C2=A0 =C2=A0 =C2=A0 write_stvec=C2=
=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_SCOUNTEREN] =3D { &quot;scounteren&quot;, smode, r=
ead_scounteren, write_scounteren },<br>
<br>
@@ -1932,12 +2276,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<=
br>
=C2=A0 =C2=A0 =C2=A0/* Supervisor Protection and Translation */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_SATP]=C2=A0 =C2=A0 =C2=A0=3D { &quot;satp&quot;,=
=C2=A0 =C2=A0 =C2=A0smode, read_satp,=C2=A0 =C2=A0 write_satp=C2=A0 =C2=A0 =
=C2=A0 },<br>
<br>
+=C2=A0 =C2=A0 /* Supervisor-Level High-Half CSRs (AIA) */<br>
+=C2=A0 =C2=A0 [CSR_SIEH]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;sieh&quot;,=
=C2=A0 =C2=A0aia_smode32, NULL, NULL, rmw_sieh },<br>
+=C2=A0 =C2=A0 [CSR_SIPH]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;siph&quot;,=
=C2=A0 =C2=A0aia_smode32, NULL, NULL, rmw_siph },<br>
+<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HSTATUS]=C2=A0 =C2=A0 =C2=A0=3D { &quot;hstatus&qu=
ot;,=C2=A0 =C2=A0 =C2=A0hmode,=C2=A0 =C2=A0read_hstatus,=C2=A0 =C2=A0 =C2=
=A0write_hstatus=C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HEDELEG]=C2=A0 =C2=A0 =C2=A0=3D { &quot;hedeleg&qu=
ot;,=C2=A0 =C2=A0 =C2=A0hmode,=C2=A0 =C2=A0read_hedeleg,=C2=A0 =C2=A0 =C2=
=A0write_hedeleg=C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 [CSR_HIDELEG]=C2=A0 =C2=A0 =C2=A0=3D { &quot;hideleg&quot;,=
=C2=A0 =C2=A0 =C2=A0hmode,=C2=A0 =C2=A0read_hideleg,=C2=A0 =C2=A0 =C2=A0wri=
te_hideleg=C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 [CSR_HIDELEG]=C2=A0 =C2=A0 =C2=A0=3D { &quot;hideleg&quot;,=
=C2=A0 =C2=A0 =C2=A0hmode,=C2=A0 =C2=A0NULL,=C2=A0 =C2=A0NULL,=C2=A0 =C2=A0=
 =C2=A0rmw_hideleg=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HVIP]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D { &quot;hvip&=
quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 hmode,=C2=A0 =C2=A0NULL,=C2=A0 =C2=A0NULL=
,=C2=A0 =C2=A0 =C2=A0rmw_hvip=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HIP]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;=
hip&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hmode,=C2=A0 =C2=A0NULL,=C2=A0 =
=C2=A0NULL,=C2=A0 =C2=A0 =C2=A0rmw_hip=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0},<br>
-=C2=A0 =C2=A0 [CSR_HIE]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;hie&q=
uot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hmode,=C2=A0 =C2=A0read_hie,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0write_hie=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br=
>
+=C2=A0 =C2=A0 [CSR_HIE]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;hie&q=
uot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hmode,=C2=A0 =C2=A0NULL,=C2=A0 =C2=
=A0NULL,=C2=A0 =C2=A0 =C2=A0rmw_hie=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0},<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HCOUNTEREN]=C2=A0 =3D { &quot;hcounteren&quot;,=C2=
=A0 hmode,=C2=A0 =C2=A0read_hcounteren,=C2=A0 write_hcounteren=C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HGEIE]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;hgeie=
&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0hmode,=C2=A0 =C2=A0read_hgeie,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0write_hgeie=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HTVAL]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;htval=
&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0hmode,=C2=A0 =C2=A0read_htval,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0write_htval=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
@@ -1949,7 +2297,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0[CSR_VSSTATUS]=C2=A0 =C2=A0 =3D { &quot;vsstatus&quot;,=
=C2=A0 =C2=A0 hmode,=C2=A0 =C2=A0read_vsstatus,=C2=A0 =C2=A0 write_vsstatus=
=C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_VSIP]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D { &quot;vsip&=
quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 hmode,=C2=A0 =C2=A0NULL,=C2=A0 =C2=A0 NUL=
L,=C2=A0 =C2=A0 rmw_vsip=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
-=C2=A0 =C2=A0 [CSR_VSIE]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D { &quot;vsie&quot;=
,=C2=A0 =C2=A0 =C2=A0 =C2=A0 hmode,=C2=A0 =C2=A0read_vsie,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 write_vsie=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [CSR_VSIE]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D { &quot;vsie&quot;=
,=C2=A0 =C2=A0 =C2=A0 =C2=A0 hmode,=C2=A0 =C2=A0NULL,=C2=A0 =C2=A0 NULL,=C2=
=A0 =C2=A0 rmw_vsie=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_VSTVEC]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;vstvec&quo=
t;,=C2=A0 =C2=A0 =C2=A0 hmode,=C2=A0 =C2=A0read_vstvec,=C2=A0 =C2=A0 =C2=A0=
 write_vstvec=C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_VSSCRATCH]=C2=A0 =C2=A0=3D { &quot;vsscratch&quot;=
,=C2=A0 =C2=A0hmode,=C2=A0 =C2=A0read_vsscratch,=C2=A0 =C2=A0write_vsscratc=
h=C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0[CSR_VSEPC]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;vsepc=
&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0hmode,=C2=A0 =C2=A0read_vsepc,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0write_vsepc=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
@@ -1960,6 +2308,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<b=
r>
=C2=A0 =C2=A0 =C2=A0[CSR_MTVAL2]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;mtval2&quo=
t;,=C2=A0 =C2=A0 =C2=A0 hmode,=C2=A0 =C2=A0read_mtval2,=C2=A0 =C2=A0 =C2=A0=
 write_mtval2=C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MTINST]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;mtinst&quo=
t;,=C2=A0 =C2=A0 =C2=A0 hmode,=C2=A0 =C2=A0read_mtinst,=C2=A0 =C2=A0 =C2=A0=
 write_mtinst=C2=A0 =C2=A0 =C2=A0 },<br>
<br>
+=C2=A0 =C2=A0 /* Hypervisor and VS-Level High-Half CSRs (H-extension with =
AIA) */<br>
+=C2=A0 =C2=A0 [CSR_HIDELEGH]=C2=A0 =C2=A0 =3D { &quot;hidelegh&quot;,=C2=
=A0 =C2=A0 aia_hmode32, NULL, NULL, rmw_hidelegh },<br>
+=C2=A0 =C2=A0 [CSR_HVIPH]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;hviph&quot=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0aia_hmode32, NULL, NULL, rmw_hviph },<br>
+=C2=A0 =C2=A0 [CSR_VSIEH]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;vsieh&quot=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0aia_hmode32, NULL, NULL, rmw_vsieh },<br>
+=C2=A0 =C2=A0 [CSR_VSIPH]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;vsiph&quot=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0aia_hmode32, NULL, NULL, rmw_vsiph },<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Physical Memory Protection */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MSECCFG]=C2=A0 =C2=A0 =3D { &quot;mseccfg&quot;,=
=C2=A0 epmp, read_mseccfg, write_mseccfg },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_PMPCFG0]=C2=A0 =C2=A0 =3D { &quot;pmpcfg0&quot;,=
=C2=A0 =C2=A0pmp, read_pmpcfg,=C2=A0 write_pmpcfg=C2=A0 },<br>
diff --git a/target/riscv/machine.c b/target/riscv/machine.c<br>
index cffc444969..44dca84ded 100644<br>
--- a/target/riscv/machine.c<br>
+++ b/target/riscv/machine.c<br>
@@ -84,7 +84,7 @@ static const VMStateDescription vmstate_hyper =3D {<br>
=C2=A0 =C2=A0 =C2=A0.fields =3D (VMStateField[]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.hstatus, RISCVCPU),<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.hedeleg, RISCVCPU),<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.hideleg, RISCVCPU),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT64(env.hideleg, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.hcounteren, RISCVCPU),=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.htval, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.htinst, RISCVCPU),<br>
@@ -194,10 +194,10 @@ const VMStateDescription vmstate_riscv_cpu =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.resetvec, RISCVCPU),<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.mhartid, RISCVCPU),<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(env.mstatus, RISCVCPU),<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.mip, RISCVCPU),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(env.miclaim, RISCVCPU),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.mie, RISCVCPU),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.mideleg, RISCVCPU),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT64(env.mip, RISCVCPU),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT64(env.miclaim, RISCVCPU),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT64(env.mie, RISCVCPU),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT64(env.mideleg, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.satp, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.stval, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.medeleg, RISCVCPU),<br=
>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com=
</a>&gt;=C2=A0</div></div></div>

--000000000000b8d58705d587b52d--

