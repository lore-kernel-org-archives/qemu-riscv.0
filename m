Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcxMS-00046M-I9
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 18:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcxMN-00043U-Ov; Tue, 19 Oct 2021 18:13:27 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:33686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcxMM-0003hC-58; Tue, 19 Oct 2021 18:13:27 -0400
Received: by mail-io1-xd33.google.com with SMTP id n7so22277428iod.0;
 Tue, 19 Oct 2021 15:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WCXqgqkAxEJCStM4cmnqOOymy8aIiRnU6Nv5PrFLrdE=;
 b=bXi2aA6EhrLcFAnkcHp8qVnI7pez0SL8teQuF7HqNEPsnKDzKdN6tRX+toV3/W67Rf
 MeQVgN64nhIOQv3T1PqW8wulRpT3aUEx11S2Y2Bku5tMsF70s/PlT70wtcno/qva+Zjs
 6sLydBYtJTh4r8SsVi99VRfub1DOeaO3cGv70ptaYUzQo/a4YFJgh7Npmh8XOY1ulVeu
 wKa9irnMr+0/fhVR62fjT3b+119X6v3QjNzfWxAoIXh+GTcDiJN9U2J2jaIMiijpGFBh
 2I8REt4DrIy2cBPDnATraTsMGT/r9xSYCX+QtAziixEWmP6oISZ2aN2blUa0KW4RNxkP
 4tFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WCXqgqkAxEJCStM4cmnqOOymy8aIiRnU6Nv5PrFLrdE=;
 b=u+zOCHo1VspURlSALNkUcZQB3SdzZN7Fq5RMSHkyJK4gCX7CgPcpHFGmvVkpSvwP/4
 JmQ86BGkUlXVDc6HMCHSe1fY+jow6wife5UiZTq1GJeoXMCCbr7bLSOdK0ZV0cRSFaWm
 R/8pvqzV7/yDqLX3Vc9qb1HFKfv8fOM9Kni6dkrQJGhRavwPUBqX4kpU2XiYM/zfpE6v
 +9sIw5izxgTMTpfT+Y/0kwfk3QjFLAOXEW3AO3de1r3H57S8XA36e+E+GdIsg4TpRUXT
 b0c1ExvmNwDJYpC1XI0j8godq5G1/HTqICQRl+6IP8CO2hIj+HZY6ut6Vo6AsXiEORVi
 9aww==
X-Gm-Message-State: AOAM533Wqum0+hUqeYCb7P8X69tDTjBkv4J5LQ/yfgGLY43Hhh4efCXO
 5DSTYst913M5jR0pWHgDOObJ6Qa7AdHw1VsDHWYcADejTwJQmg==
X-Google-Smtp-Source: ABdhPJyNKkbis/SH2ou5ROXNc0C3ApLzlQmN+arT7RDcOON3r85XJm+yBVGsdbZB/Yke7Zmm2d/Tfc/6ilD80RjFuEU=
X-Received: by 2002:a5e:9612:: with SMTP id a18mr20287580ioq.57.1634681604825; 
 Tue, 19 Oct 2021 15:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211019152438.269077-1-richard.henderson@linaro.org>
 <20211019152438.269077-17-richard.henderson@linaro.org>
In-Reply-To: <20211019152438.269077-17-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Oct 2021 08:12:59 +1000
Message-ID: <CAKmqyKNGYH9ztkc0FOB=vqpnVCOppn5BvBTyiCdpb+5FOtVqrw@mail.gmail.com>
Subject: Re: [PATCH v5 16/16] target/riscv: Compute mstatus.sd on demand
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 22:13:28 -0000

On Wed, Oct 20, 2021 at 2:52 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The position of this read-only field is dependent on the
> current cpu width.  Rather than having to compute that
> difference in many places, compute it only on read.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c |  3 +--
>  target/riscv/csr.c        | 37 ++++++++++++++++++++++---------------
>  target/riscv/translate.c  |  5 ++---
>  3 files changed, 25 insertions(+), 20 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 429afd1f48..0d1132f39d 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -185,10 +185,9 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
>
>  void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
>  {
> -    uint64_t sd = riscv_cpu_mxl(env) == MXL_RV32 ? MSTATUS32_SD : MSTATUS64_SD;
>      uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
>                              MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
> -                            MSTATUS64_UXL | sd;
> +                            MSTATUS64_UXL;
>      bool current_virt = riscv_cpu_virt_enabled(env);
>
>      g_assert(riscv_has_ext(env, RVH));
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index c4a479ddd2..69e4d65fcd 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -477,10 +477,28 @@ static RISCVException read_mhartid(CPURISCVState *env, int csrno,
>  }
>
>  /* Machine Trap Setup */
> +
> +/* We do not store SD explicitly, only compute it on demand. */
> +static uint64_t add_status_sd(RISCVMXL xl, uint64_t status)
> +{
> +    if ((status & MSTATUS_FS) == MSTATUS_FS ||
> +        (status & MSTATUS_XS) == MSTATUS_XS) {
> +        switch (xl) {
> +        case MXL_RV32:
> +            return status | MSTATUS32_SD;
> +        case MXL_RV64:
> +            return status | MSTATUS64_SD;
> +        default:
> +            g_assert_not_reached();
> +        }
> +    }
> +    return status;
> +}
> +
>  static RISCVException read_mstatus(CPURISCVState *env, int csrno,
>                                     target_ulong *val)
>  {
> -    *val = env->mstatus;
> +    *val = add_status_sd(riscv_cpu_mxl(env), env->mstatus);
>      return RISCV_EXCP_NONE;
>  }
>
> @@ -498,7 +516,6 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>  {
>      uint64_t mstatus = env->mstatus;
>      uint64_t mask = 0;
> -    int dirty;
>
>      /* flush tlb on mstatus fields that affect VM */
>      if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
> @@ -520,12 +537,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>
>      mstatus = (mstatus & ~mask) | (val & mask);
>
> -    dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
> -            ((mstatus & MSTATUS_XS) == MSTATUS_XS);
> -    if (riscv_cpu_mxl(env) == MXL_RV32) {
> -        mstatus = set_field(mstatus, MSTATUS32_SD, dirty);
> -    } else {
> -        mstatus = set_field(mstatus, MSTATUS64_SD, dirty);
> +    if (riscv_cpu_mxl(env) == MXL_RV64) {
>          /* SXL and UXL fields are for now read only */
>          mstatus = set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
>          mstatus = set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
> @@ -798,13 +810,8 @@ static RISCVException read_sstatus(CPURISCVState *env, int csrno,
>  {
>      target_ulong mask = (sstatus_v1_10_mask);
>
> -    if (riscv_cpu_mxl(env) == MXL_RV32) {
> -        mask |= SSTATUS32_SD;
> -    } else {
> -        mask |= SSTATUS64_SD;
> -    }
> -
> -    *val = env->mstatus & mask;
> +    /* TODO: Use SXL not MXL. */
> +    *val = add_status_sd(riscv_cpu_mxl(env), env->mstatus & mask);
>      return RISCV_EXCP_NONE;
>  }
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index de013fbf9b..35245aafa7 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -280,7 +280,6 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>  static void mark_fs_dirty(DisasContext *ctx)
>  {
>      TCGv tmp;
> -    target_ulong sd = get_xl(ctx) == MXL_RV32 ? MSTATUS32_SD : MSTATUS64_SD;
>
>      if (ctx->mstatus_fs != MSTATUS_FS) {
>          /* Remember the state change for the rest of the TB. */
> @@ -288,7 +287,7 @@ static void mark_fs_dirty(DisasContext *ctx)
>
>          tmp = tcg_temp_new();
>          tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> -        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
> +        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
>          tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
>          tcg_temp_free(tmp);
>      }
> @@ -299,7 +298,7 @@ static void mark_fs_dirty(DisasContext *ctx)
>
>          tmp = tcg_temp_new();
>          tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> -        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
> +        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
>          tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
>          tcg_temp_free(tmp);
>      }
> --
> 2.25.1
>
>

