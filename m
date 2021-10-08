Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYfco-0000Sv-Lj
	for mharc-qemu-riscv@gnu.org; Thu, 07 Oct 2021 22:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mYfcn-0000S6-6h; Thu, 07 Oct 2021 22:28:41 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:41523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mYfcl-0000o4-NV; Thu, 07 Oct 2021 22:28:40 -0400
Received: by mail-il1-x136.google.com with SMTP id d11so8416186ilc.8;
 Thu, 07 Oct 2021 19:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bsH3tnQWvM9f9eUY4fs7hpyrA9zVR0n/8H6NSchJgEM=;
 b=E/FEt/kcwH8OHNYSsJzPZy1GM1s0N39hrCA/hPkPYTMIqfQ5x5yMmSwuzPTGVDaqo1
 R34kcMRwep7lGheC+49uzTDtl6L4Lg2AkHA65oItF8zEz31xbrvUjC6kBSe8q5m7ACp3
 aK4P9a/OPnwyXS94jw3yix8UbBRrzVI/DxiTGSsK1uJX1i4/VFtSD8UMv6AlBEPQdNGD
 zCyK7rVXFYNlYtWLI/WUdArW0w170r8JHi18kgHGkeaptD2I1aba9rhqGKjS1mf8L+xX
 lfP1IIs5mujvZRJnepUHyL8bOL6H9XpPFnmUsIdHP9t7wfZyjfqkNcnUI1ijmonXxNxt
 eZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bsH3tnQWvM9f9eUY4fs7hpyrA9zVR0n/8H6NSchJgEM=;
 b=8AFueucG1NTemF6CNL2KPEzH8RrPq/Okpy7y9wpHjaejTsJpk7UAmy66fzVYfdO8pw
 mg5CS4iGK4xC2Aiw+nwjMPZQfSTz8RMMXLzVm6EuSQuy8UY+VrbdUtYxovqWMmEhGSge
 HD+tjULzGoOueLkTLNVJyc72EVUxAo3ERomeqaRykf1iaavqLTZgu7IOZLG02pPomj4P
 DECUkAaY4q5xr7lZA4X9bA6V/q1pWzDsVgAFK6+CbHBvFln4UpZSrqtgVI4Vu9SdbWdq
 VvbK3KclRznuAdDcad4vo8QfPav69yrAqTrCcD6rDiMM+hpgJzZcXSlbNr8dl95PvN2S
 lGdw==
X-Gm-Message-State: AOAM531WcttjuK6UXk9sAvUlPDdOijAiwK+H3oLi8KRq6CK0ifajBIjq
 TQSgt+3fLNl3qn2lijEpdmf5ZGBxhF/swJXsBbI=
X-Google-Smtp-Source: ABdhPJwasBjFOm6u4tyWP8/lwpHcuoKLwO4qojatEdljr3kjz96Gjfihsh//XZqDafS0a8mpBDD0JsVX6d98ZUsfR10=
X-Received: by 2002:a05:6e02:2143:: with SMTP id
 d3mr5959694ilv.290.1633660116767; 
 Thu, 07 Oct 2021 19:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211007174722.929993-1-richard.henderson@linaro.org>
 <20211007174722.929993-2-richard.henderson@linaro.org>
In-Reply-To: <20211007174722.929993-2-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 8 Oct 2021 12:28:10 +1000
Message-ID: <CAKmqyKNHVRd4RrcN9UrD8=U1bmyBNp4y0kUHwBE_194YgCJkwQ@mail.gmail.com>
Subject: Re: [PATCH 01/13] target/riscv: Move cpu_get_tb_cpu_state out of line
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Fabien Portas <fabien.portas@grenoble-inp.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Oct 2021 02:28:41 -0000

On Fri, Oct 8, 2021 at 3:52 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move the function to cpu_helper.c, as it is large and growing.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h        | 47 ++-------------------------------------
>  target/riscv/cpu_helper.c | 46 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+), 45 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 9e55b2f5b1..7084efc452 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -413,51 +413,8 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
>      return cpu->cfg.vlen >> (sew + 3 - lmul);
>  }
>
> -static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
> -                                        target_ulong *cs_base, uint32_t *pflags)
> -{
> -    uint32_t flags = 0;
> -
> -    *pc = env->pc;
> -    *cs_base = 0;
> -
> -    if (riscv_has_ext(env, RVV)) {
> -        uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
> -        bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl);
> -        flags = FIELD_DP32(flags, TB_FLAGS, VILL,
> -                    FIELD_EX64(env->vtype, VTYPE, VILL));
> -        flags = FIELD_DP32(flags, TB_FLAGS, SEW,
> -                    FIELD_EX64(env->vtype, VTYPE, VSEW));
> -        flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
> -                    FIELD_EX64(env->vtype, VTYPE, VLMUL));
> -        flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
> -    } else {
> -        flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
> -    }
> -
> -#ifdef CONFIG_USER_ONLY
> -    flags |= TB_FLAGS_MSTATUS_FS;
> -#else
> -    flags |= cpu_mmu_index(env, 0);
> -    if (riscv_cpu_fp_enabled(env)) {
> -        flags |= env->mstatus & MSTATUS_FS;
> -    }
> -
> -    if (riscv_has_ext(env, RVH)) {
> -        if (env->priv == PRV_M ||
> -            (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
> -            (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
> -                get_field(env->hstatus, HSTATUS_HU))) {
> -            flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
> -        }
> -
> -        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
> -                           get_field(env->mstatus_hs, MSTATUS_FS));
> -    }
> -#endif
> -
> -    *pflags = flags;
> -}
> +void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
> +                          target_ulong *cs_base, uint32_t *pflags);
>
>  RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>                             target_ulong *ret_value,
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index d41d5cd27c..14d1d3cb72 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -35,6 +35,52 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>  #endif
>  }
>
> +void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
> +                          target_ulong *cs_base, uint32_t *pflags)
> +{
> +    uint32_t flags = 0;
> +
> +    *pc = env->pc;
> +    *cs_base = 0;
> +
> +    if (riscv_has_ext(env, RVV)) {
> +        uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
> +        bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl);
> +        flags = FIELD_DP32(flags, TB_FLAGS, VILL,
> +                    FIELD_EX64(env->vtype, VTYPE, VILL));
> +        flags = FIELD_DP32(flags, TB_FLAGS, SEW,
> +                    FIELD_EX64(env->vtype, VTYPE, VSEW));
> +        flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
> +                    FIELD_EX64(env->vtype, VTYPE, VLMUL));
> +        flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
> +    } else {
> +        flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
> +    }
> +
> +#ifdef CONFIG_USER_ONLY
> +    flags |= TB_FLAGS_MSTATUS_FS;
> +#else
> +    flags |= cpu_mmu_index(env, 0);
> +    if (riscv_cpu_fp_enabled(env)) {
> +        flags |= env->mstatus & MSTATUS_FS;
> +    }
> +
> +    if (riscv_has_ext(env, RVH)) {
> +        if (env->priv == PRV_M ||
> +            (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
> +            (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
> +                get_field(env->hstatus, HSTATUS_HU))) {
> +            flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
> +        }
> +
> +        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
> +                           get_field(env->mstatus_hs, MSTATUS_FS));
> +    }
> +#endif
> +
> +    *pflags = flags;
> +}
> +
>  #ifndef CONFIG_USER_ONLY
>  static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>  {
> --
> 2.25.1
>
>

