Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mTetg-0002F8-C3
	for mharc-qemu-riscv@gnu.org; Fri, 24 Sep 2021 02:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mTete-0002CB-MC; Fri, 24 Sep 2021 02:41:22 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:41748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mTetc-0004GB-VU; Fri, 24 Sep 2021 02:41:22 -0400
Received: by mail-il1-x130.google.com with SMTP id d11so9226030ilc.8;
 Thu, 23 Sep 2021 23:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MM/sHgjYQ5ViPtnEgwieUbDNTXAT6og8BQfOlZI7des=;
 b=e9YvE6sDrEFVPU3lC9DCHbogSPBn+ShHajZupHHMvIf3SMcGNr+YIyizz7uvoUQQ50
 VLF9mxfrAN/lH5c3IHrxf7PS3TyA4B8jDVi7LjWofnP4EccnUFfVNLH3tW1fPs6nG3zi
 EcuKj06tT7dYNBMAAqru2snc2Y21SHR8Sb9i3LRuUysCIjIMsAUsKGHYa5fA0XlWQ74C
 hf86WYNXssizNtTFeUSxPNAaUJRwOQ1+A5kkCnAz0MlmQxJ5ZNJkfSnixajWekl977Un
 SqeZg8NJdEyNFW0MZwlbILRgmsMFDpEpC668jD+gp1f9cop+piN5+6CB9ISdMhiLu7J5
 VF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MM/sHgjYQ5ViPtnEgwieUbDNTXAT6og8BQfOlZI7des=;
 b=VKhqATW/9geSuXk9MvOG72m27fCJUUg1ySJ2ob4wg6iJ5Nb4Gp5d93rVbDOFz/kIJD
 Cn1GbxKd73RVMX8pFGPHbdXIUVgZRHk0j4SwMrjFn/oVzV0o8k52RWJv/Wr501nfvfOx
 JbF79kxoFgjERxtVCPJY2OJNzVUaIl4dONSazaKWFJHaAvfEnIc58l544bDa7PK3yFai
 /m4SVj3EKRxG9Nk704b6uu1OgP05JAz3L4y0IrrmyHlebfk55GBXdMgOQzECtK8TMmlP
 XZBV/DGrYQHty2tGEGEskovG+avsUOGs30vCFicVQSpc6ZWBuNHiv6gX2kN3kiWF9r2D
 stDA==
X-Gm-Message-State: AOAM532j5W8gkhpB3uzngTewSAanEx/xONlgjjj+yIUORcwtWBvTz9fZ
 RxUYRb9eQoNRqL7ORZ8pFkY2FKZQ3SbOUjYXhAE=
X-Google-Smtp-Source: ABdhPJzZegB1vXnetEnYtCOHYJXl7qjJzHi9zB7ip6Am9Xyc6h0kBj17fBrIwrY/czX4wFcALIY0JcqbPL5PUJ2iFg4=
X-Received: by 2002:a92:280f:: with SMTP id l15mr6548500ilf.74.1632465679476; 
 Thu, 23 Sep 2021 23:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210921020234.123448-1-frank.chang@sifive.com>
In-Reply-To: <20210921020234.123448-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 24 Sep 2021 16:40:52 +1000
Message-ID: <CAKmqyKOwLSSOGZqijc6RUEnVupHkeHeRHtLYa4g1CV9-Z01Ehg@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Set mstatus_hs.[SD|FS] bits if Clean and
 V=1 in mark_fs_dirty()
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Vincent Chen <vincent.chen@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
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
X-List-Received-Date: Fri, 24 Sep 2021 06:41:23 -0000

On Tue, Sep 21, 2021 at 12:03 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> When V=1, both vsstauts.FS and HS-level sstatus.FS are in effect.
> Modifying the floating-point state when V=1 causes both fields to
> be set to 3 (Dirty).
>
> However, it's possible that HS-level sstatus.FS is Clean and VS-level
> vsstatus.FS is Dirty at the time mark_fs_dirty() is called when V=1.
> We can't early return for this case because we still need to set
> sstatus.FS to Dirty according to spec.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
> Tested-by: Vincent Chen <vincent.chen@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h       |  4 ++++
>  target/riscv/translate.c | 30 +++++++++++++++++-------------
>  2 files changed, 21 insertions(+), 13 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index e735e53e26c..bef7c551646 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -394,6 +394,7 @@ FIELD(TB_FLAGS, SEW, 5, 3)
>  FIELD(TB_FLAGS, VILL, 8, 1)
>  /* Is a Hypervisor instruction load/store allowed? */
>  FIELD(TB_FLAGS, HLSX, 9, 1)
> +FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
>
>  bool riscv_cpu_is_32bit(CPURISCVState *env);
>
> @@ -450,6 +451,9 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>                  get_field(env->hstatus, HSTATUS_HU))) {
>              flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
>          }
> +
> +        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
> +                           get_field(env->mstatus_hs, MSTATUS_FS));
>      }
>  #endif
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 74b33fa3c90..6be22347426 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -58,6 +58,7 @@ typedef struct DisasContext {
>      target_ulong misa;
>      uint32_t opcode;
>      uint32_t mstatus_fs;
> +    uint32_t mstatus_hs_fs;
>      uint32_t mem_idx;
>      /* Remember the rounding mode encoded in the previous fp instruction,
>         which we have already installed into env->fp_status.  Or -1 for
> @@ -280,27 +281,29 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>  static void mark_fs_dirty(DisasContext *ctx)
>  {
>      TCGv tmp;
> -    target_ulong sd;
> +    target_ulong sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
>
> -    if (ctx->mstatus_fs == MSTATUS_FS) {
> -        return;
> -    }
> -    /* Remember the state change for the rest of the TB.  */
> -    ctx->mstatus_fs = MSTATUS_FS;
> +    if (ctx->mstatus_fs != MSTATUS_FS) {
> +        /* Remember the state change for the rest of the TB. */
> +        ctx->mstatus_fs = MSTATUS_FS;
>
> -    tmp = tcg_temp_new();
> -    sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
> +        tmp = tcg_temp_new();
> +        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> +        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
> +        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> +        tcg_temp_free(tmp);
> +    }
>
> -    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> -    tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
> -    tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> +    if (ctx->virt_enabled && ctx->mstatus_hs_fs != MSTATUS_FS) {
> +        /* Remember the stage change for the rest of the TB. */
> +        ctx->mstatus_hs_fs = MSTATUS_FS;
>
> -    if (ctx->virt_enabled) {
> +        tmp = tcg_temp_new();
>          tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
>          tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
>          tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> +        tcg_temp_free(tmp);
>      }
> -    tcg_temp_free(tmp);
>  }
>  #else
>  static inline void mark_fs_dirty(DisasContext *ctx) { }
> @@ -533,6 +536,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->frm = -1;  /* unknown rounding mode */
>      ctx->ext_ifencei = cpu->cfg.ext_ifencei;
>      ctx->vlen = cpu->cfg.vlen;
> +    ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
>      ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
>      ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
>      ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
> --
> 2.25.1
>
>

