Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGY8U-0003WH-Ov
	for mharc-qemu-riscv@gnu.org; Tue, 26 Jul 2022 23:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGY8S-0003VJ-A0
 for qemu-riscv@nongnu.org; Tue, 26 Jul 2022 23:55:00 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:39589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGY8Q-0007uq-8M
 for qemu-riscv@nongnu.org; Tue, 26 Jul 2022 23:54:59 -0400
Received: by mail-pl1-x630.google.com with SMTP id iw1so1026915plb.6
 for <qemu-riscv@nongnu.org>; Tue, 26 Jul 2022 20:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Q3T/z125hqshkNOgoBmPYOqwJJdbCPnO7Lrzo1El2lY=;
 b=MdgAhNdO1xW5RU/kM+ulWb9dDodFz/utgRrhZdmMbLQSUU2ubYVdzNV/Q687GZ2OIa
 bcqZ+TGszVXv/gLHjD9MlNJvkxL1GFKTxwZbbd+0y7F05epXe/5IyxRn+VxEUvcAlaXr
 xiV5+A/x6RDJVqEwNdc6EEpwL7Y4/m8t3Q8reE+Ryl/+gGkaG77bZnmI4PW5KVKZC5Qw
 28fHC4+fOrTxUCCxtZ7O+P6HgLw3afMNXu6XR+xWHW8jKGK/J9mMNRzZcdCIrv5WCu4G
 F1R9cKsuZfuCNygM2BAT1oRzzwtHdgQQot48mXzFvuf+eXzaAogqda5Ff8zSvT1VL9g8
 4AOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q3T/z125hqshkNOgoBmPYOqwJJdbCPnO7Lrzo1El2lY=;
 b=1RdtciW4YjNxjtUT4PLVhyAenxCU29NzwHDG3a198nAb8HvaiVWvAq7uV417W7tdCn
 hUh5U4BjadLEppOdWX4ckKP7t8S0ZpgpIBhwsa2/g/dxYIWAvSMRmVsy2h4G6pQeHVCZ
 OVyVKgYZzPqmdflKR+Wh8gD6//qDlNO0Pf0oaHrZw67OmGxMRffwZ4BbJk+eEUV0F1S6
 Hb9atXm2vPJ9LxxD1qavKNtsC8hIO7HIsZDdC1PZkY0rU7WpkcmUgnHy5MnZEcz+yO2j
 x+j2/VsZx36AuNVpoGxhsQXZXtVlOHgHBYGZ0+ckOhU8X6EjTA+/46/ZrpVPooA9eEuV
 xt1g==
X-Gm-Message-State: AJIora9FwcqfiFgeoIQjasyJR7fN1PnGbqMWtj05FNxMGtpSjbDmXPNn
 3/+4FCnbm46kPInvm3ZVB1GD9w==
X-Google-Smtp-Source: AGRyM1t459XKqZqL2QWLWMNS4/lZYW6ekyLPWQB97d4OpjrEjuDKNYhITRId/rMRRBe+A3WBAc3T5A==
X-Received: by 2002:a17:90b:4d92:b0:1f0:47e4:f36 with SMTP id
 oj18-20020a17090b4d9200b001f047e40f36mr2337277pjb.194.1658894096536; 
 Tue, 26 Jul 2022 20:54:56 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:4e4e:de15:7ffb:6b9b?
 ([2602:ae:1549:801:4e4e:de15:7ffb:6b9b])
 by smtp.gmail.com with ESMTPSA id
 125-20020a621883000000b005289a50e4c2sm12450892pfy.23.2022.07.26.20.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 20:54:55 -0700 (PDT)
Message-ID: <ae29e548-c3a6-dca1-81aa-68c4cad27384@linaro.org>
Date: Tue, 26 Jul 2022 20:54:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/riscv: Ensure opcode is saved for every instruction
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20220727032524.101280-1-apatel@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220727032524.101280-1-apatel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 27 Jul 2022 03:55:00 -0000

On 7/26/22 20:25, Anup Patel wrote:
> We should call decode_save_opc() for every decoded instruction
> because generating transformed instruction upon guest page faults
> expects opcode to be available. Without this, hypervisor sees
> transformed instruction as zero in htinst CSR for guest MMIO
> emulation which makes MMIO emulation in hypervisor slow and
> also breaks nested virtualization.

Then just add decode_save_opc to load/store insns, not everything including plain 
arithmetic...


r~


> 
> Fixes: a9814e3e08d2 ("target/riscv: Minimize the calls to decode_save_opc")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   target/riscv/insn_trans/trans_privileged.c.inc |  4 ----
>   target/riscv/insn_trans/trans_rvh.c.inc        |  2 --
>   target/riscv/insn_trans/trans_rvi.c.inc        |  2 --
>   target/riscv/translate.c                       | 10 ++++------
>   4 files changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
> index 46f96ad74d..53613682e8 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -75,7 +75,6 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
>   {
>   #ifndef CONFIG_USER_ONLY
>       if (has_ext(ctx, RVS)) {
> -        decode_save_opc(ctx);
>           gen_helper_sret(cpu_pc, cpu_env);
>           tcg_gen_exit_tb(NULL, 0); /* no chaining */
>           ctx->base.is_jmp = DISAS_NORETURN;
> @@ -91,7 +90,6 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
>   static bool trans_mret(DisasContext *ctx, arg_mret *a)
>   {
>   #ifndef CONFIG_USER_ONLY
> -    decode_save_opc(ctx);
>       gen_helper_mret(cpu_pc, cpu_env);
>       tcg_gen_exit_tb(NULL, 0); /* no chaining */
>       ctx->base.is_jmp = DISAS_NORETURN;
> @@ -104,7 +102,6 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
>   static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
>   {
>   #ifndef CONFIG_USER_ONLY
> -    decode_save_opc(ctx);
>       gen_set_pc_imm(ctx, ctx->pc_succ_insn);
>       gen_helper_wfi(cpu_env);
>       return true;
> @@ -116,7 +113,6 @@ static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
>   static bool trans_sfence_vma(DisasContext *ctx, arg_sfence_vma *a)
>   {
>   #ifndef CONFIG_USER_ONLY
> -    decode_save_opc(ctx);
>       gen_helper_tlb_flush(cpu_env);
>       return true;
>   #endif
> diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
> index 4f8aecddc7..cebcb3f8f6 100644
> --- a/target/riscv/insn_trans/trans_rvh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvh.c.inc
> @@ -169,7 +169,6 @@ static bool trans_hfence_gvma(DisasContext *ctx, arg_sfence_vma *a)
>   {
>       REQUIRE_EXT(ctx, RVH);
>   #ifndef CONFIG_USER_ONLY
> -    decode_save_opc(ctx);
>       gen_helper_hyp_gvma_tlb_flush(cpu_env);
>       return true;
>   #endif
> @@ -180,7 +179,6 @@ static bool trans_hfence_vvma(DisasContext *ctx, arg_sfence_vma *a)
>   {
>       REQUIRE_EXT(ctx, RVH);
>   #ifndef CONFIG_USER_ONLY
> -    decode_save_opc(ctx);
>       gen_helper_hyp_tlb_flush(cpu_env);
>       return true;
>   #endif
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index c49dbec0eb..1f318ffbef 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -834,8 +834,6 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
>   
>   static bool do_csr_post(DisasContext *ctx)
>   {
> -    /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
> -    decode_save_opc(ctx);
>       /* We may have changed important cpu state -- exit to main loop. */
>       gen_set_pc_imm(ctx, ctx->pc_succ_insn);
>       tcg_gen_exit_tb(NULL, 0);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index a79d0cd95b..5425d19846 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -207,10 +207,10 @@ static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
>       tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
>   }
>   
> -static void decode_save_opc(DisasContext *ctx)
> +static void decode_save_opc(DisasContext *ctx, target_ulong opc)
>   {
>       assert(ctx->insn_start != NULL);
> -    tcg_set_insn_start_param(ctx->insn_start, 1, ctx->opcode);
> +    tcg_set_insn_start_param(ctx->insn_start, 1, opc);
>       ctx->insn_start = NULL;
>   }
>   
> @@ -240,8 +240,6 @@ static void generate_exception(DisasContext *ctx, int excp)
>   
>   static void gen_exception_illegal(DisasContext *ctx)
>   {
> -    tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
> -                   offsetof(CPURISCVState, bins));
>       generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
>   }
>   
> @@ -643,8 +641,6 @@ static void gen_set_rm(DisasContext *ctx, int rm)
>           return;
>       }
>   
> -    /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
> -    decode_save_opc(ctx);
>       gen_helper_set_rounding_mode(cpu_env, tcg_constant_i32(rm));
>   }
>   
> @@ -1055,6 +1051,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>   
>       /* Check for compressed insn */
>       if (extract16(opcode, 0, 2) != 3) {
> +        decode_save_opc(ctx, opcode);
>           if (!has_ext(ctx, RVC)) {
>               gen_exception_illegal(ctx);
>           } else {
> @@ -1071,6 +1068,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>                                                ctx->base.pc_next + 2));
>           ctx->opcode = opcode32;
>           ctx->pc_succ_insn = ctx->base.pc_next + 4;
> +        decode_save_opc(ctx, opcode32);
>   
>           for (size_t i = 0; i < ARRAY_SIZE(decoders); ++i) {
>               if (decoders[i].guard_func(ctx) &&


