Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mnvQi-0000YW-Bl
	for mharc-qemu-riscv@gnu.org; Thu, 18 Nov 2021 23:23:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mnvQg-0000Ul-UN; Thu, 18 Nov 2021 23:23:14 -0500
Received: from [2607:f8b0:4864:20::12e] (port=46842
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mnvQc-0001uu-Pb; Thu, 18 Nov 2021 23:23:13 -0500
Received: by mail-il1-x12e.google.com with SMTP id j7so1687876ilk.13;
 Thu, 18 Nov 2021 20:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LyItgRRNqdA9+uKpXK4bnBiMkPyz6rmixizXX8KPRg0=;
 b=gLNeRCKS+Q24HMTiMzuq4ujdbf1TNlBKu/fA8S1vOmMxdv/3REgmsP5ygO8QQG+69S
 etKls4gXUGHZ6jn/28ujJy+P3TU78jugrePJUQh8uVSlmIE7BV08O3eS2gQQvJ+Bzquz
 QNg3Y3079mdw4sN0MWe7L2wf26C6aKAVV45SRYGJkcUeOc1h9Rabq/9iyoV9iy6molMJ
 mHOabJIiWIgBjPp+LA1dr2fiJ4CxgroGn+L3cKjoJzix/IkWUNhQEEYyYu2/OcNSWbp9
 4GUgF/5hthewOXzKEVZH+Oafpx/kYFgrKS2lEHaPeOJS3/bcYG3GiQhSm0U44rQO1NeQ
 CCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LyItgRRNqdA9+uKpXK4bnBiMkPyz6rmixizXX8KPRg0=;
 b=hZSyD9FVJf/9KK/yn7znISLXgL5uJFS+Fvwyl2yQ9IZt3c0yg1PtkL1YH3lp7KSfP7
 BbN4WS+r2vSOBlJb+Qh++aEasp4nzrxOGimaRby8o7/sGNU0IAvH2GmXGAcGw8t3wSwX
 IJ7TS9uQwNOlx8psaRZbTPdc8IinQeDgjdQP+0khILAMIiTFwERQ2UUOJVAV+VkbxbNT
 dm25AxqQ0pjpKKmLVugUU4kMF2mkmod02WxymRqE6qPQqkQ7AL53M/OK9B895pSdpzCB
 h1a6m56TIWjF38CBFMmMsxartIIqZ6V4aWSVCKcxZKRfmQM/Y5Vc8Z4xjngZ1DN8rQTO
 eobA==
X-Gm-Message-State: AOAM532Y9uZ1q2zYvw+lAjf4Q0dBA1jC7FCVkTP+fyhTxEFT/aBFJFVe
 kaenRMnLlvWSkBIQB8PJn2vJ1R4nkdUmMjMxOdw=
X-Google-Smtp-Source: ABdhPJxW0w8kXN82B1202sFQjU0ZhoKQaM2zpgtGLs+Tm3rdmClQGBOC5tVUFUJmAULJaEeqlohlrriWYZxedBblOLY=
X-Received: by 2002:a05:6e02:16c9:: with SMTP id
 9mr1147948ilx.221.1637295789031; 
 Thu, 18 Nov 2021 20:23:09 -0800 (PST)
MIME-Version: 1.0
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <20211111155149.58172-9-zhiwei_liu@c-sky.com>
In-Reply-To: <20211111155149.58172-9-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Nov 2021 14:22:42 +1000
Message-ID: <CAKmqyKOGUzqTRk9ORk3p_cvg7jP63PfZs30ymajoa7Y4KcH8rg@mail.gmail.com>
Subject: Re: [PATCH v4 08/20] target/riscv: Create current pm fields in env
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Fri, 19 Nov 2021 04:23:15 -0000

On Fri, Nov 12, 2021 at 2:00 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c        |  1 +
>  target/riscv/cpu.h        |  4 ++++
>  target/riscv/cpu_helper.c | 43 +++++++++++++++++++++++++++++++++++++++
>  target/riscv/csr.c        | 19 +++++++++++++++++
>  target/riscv/machine.c    | 10 +++++++++
>  5 files changed, 77 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0d2d175fa2..4f01abc989 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -393,6 +393,7 @@ static void riscv_cpu_reset(DeviceState *dev)
>      /* mmte is supposed to have pm.current hardwired to 1 */
>      env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
>  #endif
> +    riscv_cpu_update_mask(env);
>      cs->exception_index = RISCV_EXCP_NONE;
>      env->load_res = -1;
>      set_default_nan_mode(1, &env->fp_status);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 8befff0166..fa5a6ba1c8 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -250,6 +250,8 @@ struct CPURISCVState {
>      target_ulong upmmask;
>      target_ulong upmbase;
>  #endif
> +    target_ulong cur_pmmask;
> +    target_ulong cur_pmbase;
>
>      float_status fp_status;
>
> @@ -441,6 +443,8 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
>  void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>                            target_ulong *cs_base, uint32_t *pflags);
>
> +void riscv_cpu_update_mask(CPURISCVState *env);
> +
>  RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>                             target_ulong *ret_value,
>                             target_ulong new_value, target_ulong write_mask);
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 79aba9c880..8320f56d9f 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -133,6 +133,48 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>      *pflags = flags;
>  }
>
> +void riscv_cpu_update_mask(CPURISCVState *env)
> +{
> +    target_ulong mask = -1, base = 0;
> +    /*
> +     * TODO: Current RVJ spec does not specify
> +     * how the extension interacts with XLEN.
> +     */
> +#ifndef CONFIG_USER_ONLY
> +    if (riscv_has_ext(env, RVJ)) {
> +        switch (env->priv) {
> +        case PRV_M:
> +            if (env->mmte & M_PM_ENABLE) {
> +                mask = env->mpmmask;
> +                base = env->mpmbase;
> +            }
> +            break;
> +        case PRV_S:
> +            if (env->mmte & S_PM_ENABLE) {
> +                mask = env->spmmask;
> +                base = env->spmbase;
> +            }
> +            break;
> +        case PRV_U:
> +            if (env->mmte & U_PM_ENABLE) {
> +                mask = env->upmmask;
> +                base = env->upmbase;
> +            }
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +    }
> +#endif
> +    if (cpu_get_xl(env) == MXL_RV32) {
> +        env->cur_pmmask = mask & UINT32_MAX;
> +        env->cur_pmbase = base & UINT32_MAX;
> +    } else {
> +        env->cur_pmmask = mask;
> +        env->cur_pmbase = base;
> +    }
> +}
> +
>  #ifndef CONFIG_USER_ONLY
>  static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>  {
> @@ -331,6 +373,7 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
>      }
>      /* tlb_flush is unnecessary as mode is contained in mmu_idx */
>      env->priv = newpriv;
> +    riscv_cpu_update_mask(env);
>
>      /*
>       * Clear the load reservation - otherwise a reservation placed in one
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 74c0b788fd..6bb2d09519 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1496,6 +1496,7 @@ static RISCVException write_mmte(CPURISCVState *env, int csrno,
>      /* hardwiring pm.instruction bit to 0, since it's not supported yet */
>      wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
>      env->mmte = wpri_val | PM_EXT_DIRTY;
> +    riscv_cpu_update_mask(env);
>
>      /* Set XS and SD bits, since PM CSRs are dirty */
>      mstatus = env->mstatus | MSTATUS_XS;
> @@ -1571,6 +1572,9 @@ static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
>      uint64_t mstatus;
>
>      env->mpmmask = val;
> +    if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
> +        env->cur_pmmask = val;
> +    }
>      env->mmte |= PM_EXT_DIRTY;
>
>      /* Set XS and SD bits, since PM CSRs are dirty */
> @@ -1596,6 +1600,9 @@ static RISCVException write_spmmask(CPURISCVState *env, int csrno,
>          return RISCV_EXCP_NONE;
>      }
>      env->spmmask = val;
> +    if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
> +        env->cur_pmmask = val;
> +    }
>      env->mmte |= PM_EXT_DIRTY;
>
>      /* Set XS and SD bits, since PM CSRs are dirty */
> @@ -1621,6 +1628,9 @@ static RISCVException write_upmmask(CPURISCVState *env, int csrno,
>          return RISCV_EXCP_NONE;
>      }
>      env->upmmask = val;
> +    if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
> +        env->cur_pmmask = val;
> +    }
>      env->mmte |= PM_EXT_DIRTY;
>
>      /* Set XS and SD bits, since PM CSRs are dirty */
> @@ -1642,6 +1652,9 @@ static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
>      uint64_t mstatus;
>
>      env->mpmbase = val;
> +    if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
> +        env->cur_pmbase = val;
> +    }
>      env->mmte |= PM_EXT_DIRTY;
>
>      /* Set XS and SD bits, since PM CSRs are dirty */
> @@ -1667,6 +1680,9 @@ static RISCVException write_spmbase(CPURISCVState *env, int csrno,
>          return RISCV_EXCP_NONE;
>      }
>      env->spmbase = val;
> +    if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
> +        env->cur_pmbase = val;
> +    }
>      env->mmte |= PM_EXT_DIRTY;
>
>      /* Set XS and SD bits, since PM CSRs are dirty */
> @@ -1692,6 +1708,9 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
>          return RISCV_EXCP_NONE;
>      }
>      env->upmbase = val;
> +    if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
> +        env->cur_pmbase = val;
> +    }
>      env->mmte |= PM_EXT_DIRTY;
>
>      /* Set XS and SD bits, since PM CSRs are dirty */
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 7b4c739564..19e982d3f0 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -164,10 +164,20 @@ static const VMStateDescription vmstate_hyper = {
>      }
>  };
>
> +static int riscv_cpu_post_load(void *opaque, int version_id)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +
> +    riscv_cpu_update_mask(env);
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

