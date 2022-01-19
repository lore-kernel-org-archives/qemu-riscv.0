Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA1aW-00008V-64
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 22:24:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nA1aU-00005R-SG; Tue, 18 Jan 2022 22:24:42 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=42791
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nA1aT-0002t1-2d; Tue, 18 Jan 2022 22:24:42 -0500
Received: by mail-io1-xd2e.google.com with SMTP id a12so1180944iod.9;
 Tue, 18 Jan 2022 19:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lDkCNjzyvwIOp1EcBfMd3P6JpjYfFMp3M624pBQsqBI=;
 b=PuL4GmRye0GbeyIEhz5DNoHPrOCaMi17PN7HiCRJgC0c0EtNkiqZJ7TE9kmAuobcXV
 sr8afoEJjo6VYP3X6vGAkZGA5selpdSzr5M1mVJjuh6lpqkeU9DfBN/XcGMGOGy2fAG9
 NO5VZx9yuYAKQ+NHX6YVfdr7gNR8aRhkrRIkIH1tPxy+K2YTEtmPup9g/WXgDh+U9V1B
 8n+f978W33UCqddVF7DBwtLSKB63opY3e91GxYnPrPoJOBMgrgM2xPaXQS/AvZDGE7gR
 eabpk0DnDg5AuLCKQzA8DphVu68kNSzIoA3hUpfsj5IUvhFRNJUoQFnTqn+LDhrkSij7
 Se2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lDkCNjzyvwIOp1EcBfMd3P6JpjYfFMp3M624pBQsqBI=;
 b=SmBiCMXzIPZ2yihlGUL/+N6MWhXECokemX5Tl5s9nC8kRHeKx8ruM4AlQ8WCRv7XOs
 tUsnDCKrk7YRa/3P5OCaiZnMwkjLTCPqKbvO6wQ8eyUlkotTxnJfbaOXlyjHaffCc989
 m3t+/gGgZRHUHtR5X/G4d2A4oamydZ7yPSuHfy96DQYvo4K/5cBBiDffw4uvM/nPh58u
 aJ0gumZDQheDxUFm3agq0HLKlBBJqgCKFrDnXo/Pz2v0YfSJfxn2q7tIMgQVrlWcZ0kf
 N+BRsthBF/KtPMZeybKpq1UTgvul4R+NjUryuALSjzFSu4+Q9J283e6hPtCd3NOxVM16
 lOCA==
X-Gm-Message-State: AOAM533aTxJ4Qxf7Oa8R86Yo3eULkN8rR7dGDyILb5YbHgrUHbOlSJvR
 NVykF6IfBWGg68/LhZiGEGdv2MxNd95hne8CErM=
X-Google-Smtp-Source: ABdhPJzurtzQW/jZlqLKo61se1PLhnN9HOlI0mzXMy56QIzQYFcS0dpBvywX12x4sqfu5BCrF8hJkdIveO/8Dz9a4r8=
X-Received: by 2002:a05:6602:15c5:: with SMTP id
 f5mr7275893iow.16.1642562679246; 
 Tue, 18 Jan 2022 19:24:39 -0800 (PST)
MIME-Version: 1.0
References: <20220113114004.286796-1-zhiwei_liu@c-sky.com>
 <20220113114004.286796-6-zhiwei_liu@c-sky.com>
In-Reply-To: <20220113114004.286796-6-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jan 2022 13:24:13 +1000
Message-ID: <CAKmqyKPcst5Xg5T5_Py0KyCBf8zYmc7FdWWJDZz0dsjcWThE8A@mail.gmail.com>
Subject: Re: [PATCH v6 05/22] target/riscv: Create xl field in env
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 guoren@linux.alibaba.com, Bin Meng <bin.meng@windriver.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
X-List-Received-Date: Wed, 19 Jan 2022 03:24:43 -0000

On Thu, Jan 13, 2022 at 9:50 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

I'm not clear on why this is better?

Alistair

> ---
>  target/riscv/cpu.c        |  1 +
>  target/riscv/cpu.h        | 31 +++++++++++++++++++++++++++++++
>  target/riscv/cpu_helper.c | 34 ++--------------------------------
>  target/riscv/csr.c        |  2 ++
>  target/riscv/machine.c    | 10 ++++++++++
>  5 files changed, 46 insertions(+), 32 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9bc25d3055..54c1cf8ec5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -399,6 +399,7 @@ static void riscv_cpu_reset(DeviceState *dev)
>      /* mmte is supposed to have pm.current hardwired to 1 */
>      env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
>  #endif
> +    env->xl = riscv_cpu_mxl(env);
>      cs->exception_index = RISCV_EXCP_NONE;
>      env->load_res = -1;
>      set_default_nan_mode(1, &env->fp_status);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4d63086765..65fd849bef 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -145,6 +145,7 @@ struct CPURISCVState {
>      uint32_t misa_mxl_max;  /* max mxl for this cpu */
>      uint32_t misa_ext;      /* current extensions */
>      uint32_t misa_ext_mask; /* max ext for this cpu */
> +    uint32_t xl;            /* current xlen */
>
>      /* 128-bit helpers upper part return value */
>      target_ulong retxh;
> @@ -443,6 +444,36 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
>  }
>  #endif
>
> +#if defined(TARGET_RISCV32)
> +#define cpu_recompute_xl(env)  ((void)(env), MXL_RV32)
> +#else
> +static inline RISCVMXL cpu_recompute_xl(CPURISCVState *env)
> +{
> +    RISCVMXL xl = env->misa_mxl;
> +#if !defined(CONFIG_USER_ONLY)
> +    /*
> +     * When emulating a 32-bit-only cpu, use RV32.
> +     * When emulating a 64-bit cpu, and MXL has been reduced to RV32,
> +     * MSTATUSH doesn't have UXL/SXL, therefore XLEN cannot be widened
> +     * back to RV64 for lower privs.
> +     */
> +    if (xl != MXL_RV32) {
> +        switch (env->priv) {
> +        case PRV_M:
> +            break;
> +        case PRV_U:
> +            xl = get_field(env->mstatus, MSTATUS64_UXL);
> +            break;
> +        default: /* PRV_S | PRV_H */
> +            xl = get_field(env->mstatus, MSTATUS64_SXL);
> +            break;
> +        }
> +    }
> +#endif
> +    return xl;
> +}
> +#endif
> +
>  /*
>   * Encode LMUL to lmul as follows:
>   *     LMUL    vlmul    lmul
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 434a83e66a..32ea066ef0 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -35,37 +35,6 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>  #endif
>  }
>
> -static RISCVMXL cpu_get_xl(CPURISCVState *env)
> -{
> -#if defined(TARGET_RISCV32)
> -    return MXL_RV32;
> -#elif defined(CONFIG_USER_ONLY)
> -    return MXL_RV64;
> -#else
> -    RISCVMXL xl = riscv_cpu_mxl(env);
> -
> -    /*
> -     * When emulating a 32-bit-only cpu, use RV32.
> -     * When emulating a 64-bit cpu, and MXL has been reduced to RV32,
> -     * MSTATUSH doesn't have UXL/SXL, therefore XLEN cannot be widened
> -     * back to RV64 for lower privs.
> -     */
> -    if (xl != MXL_RV32) {
> -        switch (env->priv) {
> -        case PRV_M:
> -            break;
> -        case PRV_U:
> -            xl = get_field(env->mstatus, MSTATUS64_UXL);
> -            break;
> -        default: /* PRV_S | PRV_H */
> -            xl = get_field(env->mstatus, MSTATUS64_SXL);
> -            break;
> -        }
> -    }
> -    return xl;
> -#endif
> -}
> -
>  void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>                            target_ulong *cs_base, uint32_t *pflags)
>  {
> @@ -145,7 +114,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>      }
>  #endif
>
> -    flags = FIELD_DP32(flags, TB_FLAGS, XL, cpu_get_xl(env));
> +    flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
>
>      *pflags = flags;
>  }
> @@ -361,6 +330,7 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
>      }
>      /* tlb_flush is unnecessary as mode is contained in mmu_idx */
>      env->priv = newpriv;
> +    env->xl = cpu_recompute_xl(env);
>
>      /*
>       * Clear the load reservation - otherwise a reservation placed in one
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index e7578f3e0f..b282a642f5 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -585,6 +585,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>          mstatus = set_field(mstatus, MSTATUS64_UXL, xl);
>      }
>      env->mstatus = mstatus;
> +    env->xl = cpu_recompute_xl(env);
>
>      return RISCV_EXCP_NONE;
>  }
> @@ -700,6 +701,7 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>      /* flush translation cache */
>      tb_flush(env_cpu(env));
>      env->misa_ext = val;
> +    env->xl = riscv_cpu_mxl(env);
>      return RISCV_EXCP_NONE;
>  }
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 13b9ab375b..e1d1029e88 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -185,10 +185,20 @@ static const VMStateDescription vmstate_rv128 = {
>      }
>  };
>
> +static int riscv_cpu_post_load(void *opaque, int version_id)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +
> +    env->xl = cpu_recompute_xl(env);
> +    return 0;
> +}
> +
>  const VMStateDescription vmstate_riscv_cpu = {
>      .name = "cpu",
>      .version_id = 3,
>      .minimum_version_id = 3,
> +    .post_load = riscv_cpu_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
>          VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
> --
> 2.25.1
>
>

