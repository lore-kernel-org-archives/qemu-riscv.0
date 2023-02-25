Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVsAh-0002H9-AI
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 05:52:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pVsAf-0002GA-7d; Sat, 25 Feb 2023 05:52:53 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pVsAa-0002UY-TH; Sat, 25 Feb 2023 05:52:52 -0500
Received: by mail-ot1-x32d.google.com with SMTP id
 cc12-20020a05683061cc00b00693daa9016fso1039438otb.2; 
 Sat, 25 Feb 2023 02:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3VzaAaeudhlFEvw2tOt9c75AGbhRcVZA0m3igq2QaR8=;
 b=iVgq8iiad4ciiyg2QgGK036AUgna/Mbnu4HfIRxInP0rNH8FAHD3pVqZ1vTBWpQi91
 spbX5r492GZByEDCBNN8SRPrhjez8Trd7zXIY303fQoau1n/Ug7LeDCl7hGYpZgmczfa
 7CS6mxNhTbR6SWZrupoKjbjmGzq8XgFg9/nxCRcii2M/javJAb3zNIyBPzmSv267i+gz
 ukCKGwkiydjFZSvIdtJAsOTbUFc0hXCcb1FRjc8pmXLv5fgnBJ3f8os3HcRmRzoucemJ
 9+5ONV56rwVYE8MYzsfOigB6BpYTSN1StD7TvcPtrs8tJin4UzJ6hAivN77iQ1LywGWc
 2Vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3VzaAaeudhlFEvw2tOt9c75AGbhRcVZA0m3igq2QaR8=;
 b=57tTMWrntkG3Hbh/m1JRUWyHGz0+9zxxnUP1RsDvi5BHuP/KJJmBEFZotcKHZQgR6O
 0kjbttHglOSUjk9WQBnRClrDldVbH4BW4XSBYE0yyU2xZlr2dCnRl0MYCwu12zJmI82F
 vd+18RXZGf2xbiDtI09hWXfs6OC4SDhkkvWa1GnnA0h7qBe0Br/tqJ0+MVEzb3sGnI+K
 tPkLCeG0oTEyonw/sgaNWG5LK4nKf9d0xMVexv94fKQ+lqEKQ0rjqD/OjatNS+ci8bih
 Ivwvl371x5iDBc4QbN4h+3xybXmRwS6WAhJ45WyyBNy7+s4QSFNFXk1jyh0txgapkFcb
 DCcg==
X-Gm-Message-State: AO0yUKWz+cKcoBpBamHDyev9QYKIl/1NmMh7ZiPVoAM58r6dWZlThQFL
 jnn3nohGI5IXJpeXHSKD3sI=
X-Google-Smtp-Source: AK7set8LAK5gax0gefFvAiZux9YB6FW2cvwaDIaR4NOsRBZANK6jop/0m5vYTHibFLWrnkfanyW4rQ==
X-Received: by 2002:a05:6830:43a0:b0:693:cffa:a6c6 with SMTP id
 s32-20020a05683043a000b00693cffaa6c6mr1425602otv.15.1677322364549; 
 Sat, 25 Feb 2023 02:52:44 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a9d7308000000b0068bce6239a3sm502491otk.38.2023.02.25.02.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 02:52:44 -0800 (PST)
Message-ID: <e84d195e-d1e3-5cf2-5d6d-d37d3f013af9@gmail.com>
Date: Sat, 25 Feb 2023 07:52:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 50/76] target/ppc: Drop tcg_temp_free
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-51-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230225091427.1817156-51-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 25 Feb 2023 10:52:54 -0000



On 2/25/23 06:14, Richard Henderson wrote:
> Translators are no longer required to free tcg temporaries.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/translate.c                       | 283 ------------------
>   target/ppc/power8-pmu-regs.c.inc             |  16 -
>   target/ppc/translate/dfp-impl.c.inc          |  20 --
>   target/ppc/translate/fixedpoint-impl.c.inc   |  16 -
>   target/ppc/translate/fp-impl.c.inc           | 122 +-------
>   target/ppc/translate/spe-impl.c.inc          |  59 ----
>   target/ppc/translate/storage-ctrl-impl.c.inc |   2 -
>   target/ppc/translate/vmx-impl.c.inc          | 296 +------------------
>   target/ppc/translate/vsx-impl.c.inc          | 287 +-----------------
>   9 files changed, 7 insertions(+), 1094 deletions(-)
> 
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index c179f26f64..f74f3b8f0d 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -266,8 +266,6 @@ static void gen_exception_err(DisasContext *ctx, uint32_t excp, uint32_t error)
>       t0 = tcg_const_i32(excp);
>       t1 = tcg_const_i32(error);
>       gen_helper_raise_exception_err(cpu_env, t0, t1);
> -    tcg_temp_free_i32(t0);
> -    tcg_temp_free_i32(t1);
>       ctx->base.is_jmp = DISAS_NORETURN;
>   }
>   
> @@ -282,7 +280,6 @@ static void gen_exception(DisasContext *ctx, uint32_t excp)
>       gen_update_nip(ctx, ctx->cia);
>       t0 = tcg_const_i32(excp);
>       gen_helper_raise_exception(cpu_env, t0);
> -    tcg_temp_free_i32(t0);
>       ctx->base.is_jmp = DISAS_NORETURN;
>   }
>   
> @@ -294,7 +291,6 @@ static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
>       gen_update_nip(ctx, nip);
>       t0 = tcg_const_i32(excp);
>       gen_helper_raise_exception(cpu_env, t0);
> -    tcg_temp_free_i32(t0);
>       ctx->base.is_jmp = DISAS_NORETURN;
>   }
>   
> @@ -341,7 +337,6 @@ static uint32_t gen_prep_dbgex(DisasContext *ctx)
>           gen_load_spr(t0, SPR_BOOKE_DBSR);
>           tcg_gen_ori_tl(t0, t0, dbsr);
>           gen_store_spr(SPR_BOOKE_DBSR, t0);
> -        tcg_temp_free(t0);
>           return POWERPC_EXCP_DEBUG;
>       } else {
>           return POWERPC_EXCP_TRACE;
> @@ -393,7 +388,6 @@ static void spr_load_dump_spr(int sprn)
>   #ifdef PPC_DUMP_SPR_ACCESSES
>       TCGv_i32 t0 = tcg_const_i32(sprn);
>       gen_helper_load_dump_spr(cpu_env, t0);
> -    tcg_temp_free_i32(t0);
>   #endif
>   }
>   
> @@ -408,7 +402,6 @@ static void spr_store_dump_spr(int sprn)
>   #ifdef PPC_DUMP_SPR_ACCESSES
>       TCGv_i32 t0 = tcg_const_i32(sprn);
>       gen_helper_store_dump_spr(cpu_env, t0);
> -    tcg_temp_free_i32(t0);
>   #endif
>   }
>   
> @@ -437,7 +430,6 @@ void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
>       TCGv t0 = tcg_temp_new();
>       tcg_gen_ext32u_tl(t0, cpu_gpr[gprn]);
>       gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
>       spr_store_dump_spr(sprn);
>   #else
>       spr_write_generic(ctx, sprn, gprn);
> @@ -452,8 +444,6 @@ void spr_write_clear(DisasContext *ctx, int sprn, int gprn)
>       tcg_gen_neg_tl(t1, cpu_gpr[gprn]);
>       tcg_gen_and_tl(t0, t0, t1);
>       gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
>   }
>   
>   void spr_access_nop(DisasContext *ctx, int sprn, int gprn)
> @@ -483,9 +473,6 @@ void spr_read_xer(DisasContext *ctx, int gprn, int sprn)
>           tcg_gen_shli_tl(t0, cpu_ca32, XER_CA32);
>           tcg_gen_or_tl(dst, dst, t0);
>       }
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    tcg_temp_free(t2);
>   }
>   
>   void spr_write_xer(DisasContext *ctx, int sprn, int gprn)
> @@ -687,28 +674,24 @@ void spr_write_ibatu(DisasContext *ctx, int sprn, int gprn)
>   {
>       TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0U) / 2);
>       gen_helper_store_ibatu(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
>   }
>   
>   void spr_write_ibatu_h(DisasContext *ctx, int sprn, int gprn)
>   {
>       TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_IBAT4U) / 2) + 4);
>       gen_helper_store_ibatu(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
>   }
>   
>   void spr_write_ibatl(DisasContext *ctx, int sprn, int gprn)
>   {
>       TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0L) / 2);
>       gen_helper_store_ibatl(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
>   }
>   
>   void spr_write_ibatl_h(DisasContext *ctx, int sprn, int gprn)
>   {
>       TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_IBAT4L) / 2) + 4);
>       gen_helper_store_ibatl(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
>   }
>   
>   /* DBAT0U...DBAT7U */
> @@ -731,28 +714,24 @@ void spr_write_dbatu(DisasContext *ctx, int sprn, int gprn)
>   {
>       TCGv_i32 t0 = tcg_const_i32((sprn - SPR_DBAT0U) / 2);
>       gen_helper_store_dbatu(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
>   }
>   
>   void spr_write_dbatu_h(DisasContext *ctx, int sprn, int gprn)
>   {
>       TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_DBAT4U) / 2) + 4);
>       gen_helper_store_dbatu(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
>   }
>   
>   void spr_write_dbatl(DisasContext *ctx, int sprn, int gprn)
>   {
>       TCGv_i32 t0 = tcg_const_i32((sprn - SPR_DBAT0L) / 2);
>       gen_helper_store_dbatl(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
>   }
>   
>   void spr_write_dbatl_h(DisasContext *ctx, int sprn, int gprn)
>   {
>       TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_DBAT4L) / 2) + 4);
>       gen_helper_store_dbatl(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
>   }
>   
>   /* SDR1 */
> @@ -784,7 +763,6 @@ void spr_write_hior(DisasContext *ctx, int sprn, int gprn)
>       TCGv t0 = tcg_temp_new();
>       tcg_gen_andi_tl(t0, cpu_gpr[gprn], 0x3FFFFF00000ULL);
>       tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_prefix));
> -    tcg_temp_free(t0);
>   }
>   void spr_write_ptcr(DisasContext *ctx, int sprn, int gprn)
>   {
> @@ -855,7 +833,6 @@ void spr_write_40x_pid(DisasContext *ctx, int sprn, int gprn)
>       TCGv t0 = tcg_temp_new();
>       tcg_gen_andi_tl(t0, cpu_gpr[gprn], 0xFF);
>       gen_helper_store_40x_pid(cpu_env, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn)
> @@ -878,7 +855,6 @@ void spr_write_pir(DisasContext *ctx, int sprn, int gprn)
>       TCGv t0 = tcg_temp_new();
>       tcg_gen_andi_tl(t0, cpu_gpr[gprn], 0xF);
>       gen_store_spr(SPR_PIR, t0);
> -    tcg_temp_free(t0);
>   }
>   #endif
>   
> @@ -888,7 +864,6 @@ void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn)
>       TCGv_i32 t0 = tcg_temp_new_i32();
>       tcg_gen_ld_i32(t0, cpu_env, offsetof(CPUPPCState, spe_fscr));
>       tcg_gen_extu_i32_tl(cpu_gpr[gprn], t0);
> -    tcg_temp_free_i32(t0);
>   }
>   
>   void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn)
> @@ -896,7 +871,6 @@ void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn)
>       TCGv_i32 t0 = tcg_temp_new_i32();
>       tcg_gen_trunc_tl_i32(t0, cpu_gpr[gprn]);
>       tcg_gen_st_i32(t0, cpu_env, offsetof(CPUPPCState, spe_fscr));
> -    tcg_temp_free_i32(t0);
>   }
>   
>   #if !defined(CONFIG_USER_ONLY)
> @@ -908,7 +882,6 @@ void spr_write_excp_prefix(DisasContext *ctx, int sprn, int gprn)
>       tcg_gen_and_tl(t0, t0, cpu_gpr[gprn]);
>       tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_prefix));
>       gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   void spr_write_excp_vector(DisasContext *ctx, int sprn, int gprn)
> @@ -933,7 +906,6 @@ void spr_write_excp_vector(DisasContext *ctx, int sprn, int gprn)
>       tcg_gen_and_tl(t0, t0, cpu_gpr[gprn]);
>       tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_vectors[sprn_offs]));
>       gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
>   }
>   #endif
>   
> @@ -968,10 +940,6 @@ void spr_write_amr(DisasContext *ctx, int sprn, int gprn)
>       tcg_gen_or_tl(t0, t0, t2);
>       gen_store_spr(SPR_AMR, t0);
>       spr_store_dump_spr(SPR_AMR);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    tcg_temp_free(t2);
>   }
>   
>   void spr_write_uamor(DisasContext *ctx, int sprn, int gprn)
> @@ -999,10 +967,6 @@ void spr_write_uamor(DisasContext *ctx, int sprn, int gprn)
>       tcg_gen_or_tl(t0, t0, t2);
>       gen_store_spr(SPR_UAMOR, t0);
>       spr_store_dump_spr(SPR_UAMOR);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    tcg_temp_free(t2);
>   }
>   
>   void spr_write_iamr(DisasContext *ctx, int sprn, int gprn)
> @@ -1030,10 +994,6 @@ void spr_write_iamr(DisasContext *ctx, int sprn, int gprn)
>       tcg_gen_or_tl(t0, t0, t2);
>       gen_store_spr(SPR_IAMR, t0);
>       spr_store_dump_spr(SPR_IAMR);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    tcg_temp_free(t2);
>   }
>   #endif
>   #endif
> @@ -1054,7 +1014,6 @@ void spr_write_e500_l1csr0(DisasContext *ctx, int sprn, int gprn)
>   
>       tcg_gen_andi_tl(t0, cpu_gpr[gprn], L1CSR0_DCE | L1CSR0_CPE);
>       gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   void spr_write_e500_l1csr1(DisasContext *ctx, int sprn, int gprn)
> @@ -1063,7 +1022,6 @@ void spr_write_e500_l1csr1(DisasContext *ctx, int sprn, int gprn)
>   
>       tcg_gen_andi_tl(t0, cpu_gpr[gprn], L1CSR1_ICE | L1CSR1_CPE);
>       gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   void spr_write_e500_l2csr0(DisasContext *ctx, int sprn, int gprn)
> @@ -1073,7 +1031,6 @@ void spr_write_e500_l2csr0(DisasContext *ctx, int sprn, int gprn)
>       tcg_gen_andi_tl(t0, cpu_gpr[gprn],
>                       ~(E500_L2CSR0_L2FI | E500_L2CSR0_L2FL | E500_L2CSR0_L2LFC));
>       gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   void spr_write_booke206_mmucsr0(DisasContext *ctx, int sprn, int gprn)
> @@ -1085,7 +1042,6 @@ void spr_write_booke_pid(DisasContext *ctx, int sprn, int gprn)
>   {
>       TCGv_i32 t0 = tcg_const_i32(sprn);
>       gen_helper_booke_setpid(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
>   }
>   void spr_write_eplc(DisasContext *ctx, int sprn, int gprn)
>   {
> @@ -1106,7 +1062,6 @@ void spr_write_mas73(DisasContext *ctx, int sprn, int gprn)
>       gen_store_spr(SPR_BOOKE_MAS3, val);
>       tcg_gen_shri_tl(val, cpu_gpr[gprn], 32);
>       gen_store_spr(SPR_BOOKE_MAS7, val);
> -    tcg_temp_free(val);
>   }
>   
>   void spr_read_mas73(DisasContext *ctx, int gprn, int sprn)
> @@ -1117,8 +1072,6 @@ void spr_read_mas73(DisasContext *ctx, int gprn, int sprn)
>       tcg_gen_shli_tl(mas7, mas7, 32);
>       gen_load_spr(mas3, SPR_BOOKE_MAS3);
>       tcg_gen_or_tl(cpu_gpr[gprn], mas3, mas7);
> -    tcg_temp_free(mas3);
> -    tcg_temp_free(mas7);
>   }
>   
>   #endif
> @@ -1132,10 +1085,6 @@ static void gen_fscr_facility_check(DisasContext *ctx, int facility_sprn,
>       TCGv_i32 t3 = tcg_const_i32(cause);
>   
>       gen_helper_fscr_facility_check(cpu_env, t1, t2, t3);
> -
> -    tcg_temp_free_i32(t3);
> -    tcg_temp_free_i32(t2);
> -    tcg_temp_free_i32(t1);
>   }
>   
>   static void gen_msr_facility_check(DisasContext *ctx, int facility_sprn,
> @@ -1146,10 +1095,6 @@ static void gen_msr_facility_check(DisasContext *ctx, int facility_sprn,
>       TCGv_i32 t3 = tcg_const_i32(cause);
>   
>       gen_helper_msr_facility_check(cpu_env, t1, t2, t3);
> -
> -    tcg_temp_free_i32(t3);
> -    tcg_temp_free_i32(t2);
> -    tcg_temp_free_i32(t1);
>   }
>   
>   void spr_read_prev_upper32(DisasContext *ctx, int gprn, int sprn)
> @@ -1160,9 +1105,6 @@ void spr_read_prev_upper32(DisasContext *ctx, int gprn, int sprn)
>       gen_load_spr(spr, sprn - 1);
>       tcg_gen_shri_tl(spr_up, spr, 32);
>       tcg_gen_ext32u_tl(cpu_gpr[gprn], spr_up);
> -
> -    tcg_temp_free(spr);
> -    tcg_temp_free(spr_up);
>   }
>   
>   void spr_write_prev_upper32(DisasContext *ctx, int sprn, int gprn)
> @@ -1172,8 +1114,6 @@ void spr_write_prev_upper32(DisasContext *ctx, int sprn, int gprn)
>       gen_load_spr(spr, sprn - 1);
>       tcg_gen_deposit_tl(spr, spr, cpu_gpr[gprn], 32, 32);
>       gen_store_spr(sprn - 1, spr);
> -
> -    tcg_temp_free(spr);
>   }
>   
>   #if !defined(CONFIG_USER_ONLY)
> @@ -1185,7 +1125,6 @@ void spr_write_hmer(DisasContext *ctx, int sprn, int gprn)
>       tcg_gen_and_tl(hmer, cpu_gpr[gprn], hmer);
>       gen_store_spr(sprn, hmer);
>       spr_store_dump_spr(sprn);
> -    tcg_temp_free(hmer);
>   }
>   
>   void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn)
> @@ -1269,8 +1208,6 @@ void spr_read_dexcr_ureg(DisasContext *ctx, int gprn, int sprn)
>   
>       gen_load_spr(t0, sprn + 16);
>       tcg_gen_ext32u_tl(cpu_gpr[gprn], t0);
> -
> -    tcg_temp_free(t0);
>   }
>   #endif
>   
> @@ -1447,17 +1384,12 @@ static inline void gen_op_cmp(TCGv arg0, TCGv arg1, int s, int crf)
>       tcg_gen_trunc_tl_i32(t, t0);
>       tcg_gen_trunc_tl_i32(cpu_crf[crf], cpu_so);
>       tcg_gen_or_i32(cpu_crf[crf], cpu_crf[crf], t);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    tcg_temp_free_i32(t);
>   }
>   
>   static inline void gen_op_cmpi(TCGv arg0, target_ulong arg1, int s, int crf)
>   {
>       TCGv t0 = tcg_const_tl(arg1);
>       gen_op_cmp(arg0, t0, s, crf);
> -    tcg_temp_free(t0);
>   }
>   
>   static inline void gen_op_cmp32(TCGv arg0, TCGv arg1, int s, int crf)
> @@ -1473,15 +1405,12 @@ static inline void gen_op_cmp32(TCGv arg0, TCGv arg1, int s, int crf)
>           tcg_gen_ext32u_tl(t1, arg1);
>       }
>       gen_op_cmp(t0, t1, s, crf);
> -    tcg_temp_free(t1);
> -    tcg_temp_free(t0);
>   }
>   
>   static inline void gen_op_cmpi32(TCGv arg0, target_ulong arg1, int s, int crf)
>   {
>       TCGv t0 = tcg_const_tl(arg1);
>       gen_op_cmp32(arg0, t0, s, crf);
> -    tcg_temp_free(t0);
>   }
>   
>   static inline void gen_set_Rc0(DisasContext *ctx, TCGv reg)
> @@ -1525,10 +1454,6 @@ static void gen_cmprb(DisasContext *ctx)
>           tcg_gen_or_i32(crf, crf, src2lo);
>       }
>       tcg_gen_shli_i32(crf, crf, CRF_GT_BIT);
> -    tcg_temp_free_i32(src1);
> -    tcg_temp_free_i32(src2);
> -    tcg_temp_free_i32(src2lo);
> -    tcg_temp_free_i32(src2hi);
>   }
>   
>   #if defined(TARGET_PPC64)
> @@ -1555,8 +1480,6 @@ static void gen_isel(DisasContext *ctx)
>       tcg_gen_movcond_tl(TCG_COND_NE, cpu_gpr[rD(ctx->opcode)], t0, zr,
>                          rA(ctx->opcode) ? cpu_gpr[rA(ctx->opcode)] : zr,
>                          cpu_gpr[rB(ctx->opcode)]);
> -    tcg_temp_free(zr);
> -    tcg_temp_free(t0);
>   }
>   
>   /* cmpb: PowerPC 2.05 specification */
> @@ -1580,7 +1503,6 @@ static inline void gen_op_arith_compute_ov(DisasContext *ctx, TCGv arg0,
>       } else {
>           tcg_gen_andc_tl(cpu_ov, cpu_ov, t0);
>       }
> -    tcg_temp_free(t0);
>       if (NARROW_MODE(ctx)) {
>           tcg_gen_extract_tl(cpu_ov, cpu_ov, 31, 1);
>           if (is_isa300(ctx)) {
> @@ -1613,7 +1535,6 @@ static inline void gen_op_arith_compute_ca32(DisasContext *ctx,
>       }
>       tcg_gen_xor_tl(t0, t0, res);
>       tcg_gen_extract_tl(ca32, t0, 32, 1);
> -    tcg_temp_free(t0);
>   }
>   
>   /* Common add function */
> @@ -1642,7 +1563,6 @@ static inline void gen_op_arith_add(DisasContext *ctx, TCGv ret, TCGv arg1,
>                   tcg_gen_add_tl(t0, t0, ca);
>               }
>               tcg_gen_xor_tl(ca, t0, t1);        /* bits changed w/ carry */
> -            tcg_temp_free(t1);
>               tcg_gen_extract_tl(ca, ca, 32, 1);
>               if (is_isa300(ctx)) {
>                   tcg_gen_mov_tl(ca32, ca);
> @@ -1656,7 +1576,6 @@ static inline void gen_op_arith_add(DisasContext *ctx, TCGv ret, TCGv arg1,
>                   tcg_gen_add2_tl(t0, ca, arg1, zero, arg2, zero);
>               }
>               gen_op_arith_compute_ca32(ctx, t0, arg1, arg2, ca32, 0);
> -            tcg_temp_free(zero);
>           }
>       } else {
>           tcg_gen_add_tl(t0, arg1, arg2);
> @@ -1674,7 +1593,6 @@ static inline void gen_op_arith_add(DisasContext *ctx, TCGv ret, TCGv arg1,
>   
>       if (t0 != ret) {
>           tcg_gen_mov_tl(ret, t0);
> -        tcg_temp_free(t0);
>       }
>   }
>   /* Add functions with two operands */
> @@ -1696,7 +1614,6 @@ static void glue(gen_, name)(DisasContext *ctx)                               \
>                        cpu_gpr[rA(ctx->opcode)], t0,                            \
>                        ca, glue(ca, 32),                                        \
>                        add_ca, compute_ca, compute_ov, Rc(ctx->opcode));        \
> -    tcg_temp_free(t0);                                                        \
>   }
>   
>   /* add  add.  addo  addo. */
> @@ -1722,7 +1639,6 @@ static inline void gen_op_addic(DisasContext *ctx, bool compute_rc0)
>       TCGv c = tcg_const_tl(SIMM(ctx->opcode));
>       gen_op_arith_add(ctx, cpu_gpr[rD(ctx->opcode)], cpu_gpr[rA(ctx->opcode)],
>                        c, cpu_ca, cpu_ca32, 0, 1, 0, compute_rc0);
> -    tcg_temp_free(c);
>   }
>   
>   static void gen_addic(DisasContext *ctx)
> @@ -1769,10 +1685,6 @@ static inline void gen_op_arith_divw(DisasContext *ctx, TCGv ret, TCGv arg1,
>           }
>           tcg_gen_or_tl(cpu_so, cpu_so, cpu_ov);
>       }
> -    tcg_temp_free_i32(t0);
> -    tcg_temp_free_i32(t1);
> -    tcg_temp_free_i32(t2);
> -    tcg_temp_free_i32(t3);
>   
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           gen_set_Rc0(ctx, ret);
> @@ -1800,7 +1712,6 @@ static void gen_##name(DisasContext *ctx)                                     \
>       TCGv_i32 t0 = tcg_const_i32(compute_ov);                                  \
>       gen_helper_##hlpr(cpu_gpr[rD(ctx->opcode)], cpu_env,                      \
>                        cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)], t0); \
> -    tcg_temp_free_i32(t0);                                                    \
>       if (unlikely(Rc(ctx->opcode) != 0)) {                                     \
>           gen_set_Rc0(ctx, cpu_gpr[rD(ctx->opcode)]);                           \
>       }                                                                         \
> @@ -1844,10 +1755,6 @@ static inline void gen_op_arith_divd(DisasContext *ctx, TCGv ret, TCGv arg1,
>           }
>           tcg_gen_or_tl(cpu_so, cpu_so, cpu_ov);
>       }
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -    tcg_temp_free_i64(t2);
> -    tcg_temp_free_i64(t3);
>   
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           gen_set_Rc0(ctx, ret);
> @@ -1894,19 +1801,13 @@ static inline void gen_op_arith_modw(DisasContext *ctx, TCGv ret, TCGv arg1,
>           tcg_gen_movcond_i32(TCG_COND_NE, t1, t2, t3, t2, t1);
>           tcg_gen_rem_i32(t3, t0, t1);
>           tcg_gen_ext_i32_tl(ret, t3);
> -        tcg_temp_free_i32(t2);
> -        tcg_temp_free_i32(t3);
>       } else {
>           TCGv_i32 t2 = tcg_const_i32(1);
>           TCGv_i32 t3 = tcg_const_i32(0);
>           tcg_gen_movcond_i32(TCG_COND_EQ, t1, t1, t3, t2, t1);
>           tcg_gen_remu_i32(t3, t0, t1);
>           tcg_gen_extu_i32_tl(ret, t3);
> -        tcg_temp_free_i32(t2);
> -        tcg_temp_free_i32(t3);
>       }
> -    tcg_temp_free_i32(t0);
> -    tcg_temp_free_i32(t1);
>   }
>   
>   #define GEN_INT_ARITH_MODW(name, opc3, sign)                                \
> @@ -1940,18 +1841,12 @@ static inline void gen_op_arith_modd(DisasContext *ctx, TCGv ret, TCGv arg1,
>           tcg_gen_movi_i64(t3, 0);
>           tcg_gen_movcond_i64(TCG_COND_NE, t1, t2, t3, t2, t1);
>           tcg_gen_rem_i64(ret, t0, t1);
> -        tcg_temp_free_i64(t2);
> -        tcg_temp_free_i64(t3);
>       } else {
>           TCGv_i64 t2 = tcg_const_i64(1);
>           TCGv_i64 t3 = tcg_const_i64(0);
>           tcg_gen_movcond_i64(TCG_COND_EQ, t1, t1, t3, t2, t1);
>           tcg_gen_remu_i64(ret, t0, t1);
> -        tcg_temp_free_i64(t2);
> -        tcg_temp_free_i64(t3);
>       }
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
>   }
>   
>   #define GEN_INT_ARITH_MODD(name, opc3, sign)                            \
> @@ -1976,8 +1871,6 @@ static void gen_mulhw(DisasContext *ctx)
>       tcg_gen_trunc_tl_i32(t1, cpu_gpr[rB(ctx->opcode)]);
>       tcg_gen_muls2_i32(t0, t1, t0, t1);
>       tcg_gen_extu_i32_tl(cpu_gpr[rD(ctx->opcode)], t1);
> -    tcg_temp_free_i32(t0);
> -    tcg_temp_free_i32(t1);
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           gen_set_Rc0(ctx, cpu_gpr[rD(ctx->opcode)]);
>       }
> @@ -1993,8 +1886,6 @@ static void gen_mulhwu(DisasContext *ctx)
>       tcg_gen_trunc_tl_i32(t1, cpu_gpr[rB(ctx->opcode)]);
>       tcg_gen_mulu2_i32(t0, t1, t0, t1);
>       tcg_gen_extu_i32_tl(cpu_gpr[rD(ctx->opcode)], t1);
> -    tcg_temp_free_i32(t0);
> -    tcg_temp_free_i32(t1);
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           gen_set_Rc0(ctx, cpu_gpr[rD(ctx->opcode)]);
>       }
> @@ -2010,8 +1901,6 @@ static void gen_mullw(DisasContext *ctx)
>       tcg_gen_ext32s_tl(t0, cpu_gpr[rA(ctx->opcode)]);
>       tcg_gen_ext32s_tl(t1, cpu_gpr[rB(ctx->opcode)]);
>       tcg_gen_mul_i64(cpu_gpr[rD(ctx->opcode)], t0, t1);
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
>   #else
>       tcg_gen_mul_i32(cpu_gpr[rD(ctx->opcode)], cpu_gpr[rA(ctx->opcode)],
>                       cpu_gpr[rB(ctx->opcode)]);
> @@ -2044,8 +1933,6 @@ static void gen_mullwo(DisasContext *ctx)
>       }
>       tcg_gen_or_tl(cpu_so, cpu_so, cpu_ov);
>   
> -    tcg_temp_free_i32(t0);
> -    tcg_temp_free_i32(t1);
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           gen_set_Rc0(ctx, cpu_gpr[rD(ctx->opcode)]);
>       }
> @@ -2065,7 +1952,6 @@ static void gen_mulhd(DisasContext *ctx)
>       TCGv lo = tcg_temp_new();
>       tcg_gen_muls2_tl(lo, cpu_gpr[rD(ctx->opcode)],
>                        cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)]);
> -    tcg_temp_free(lo);
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           gen_set_Rc0(ctx, cpu_gpr[rD(ctx->opcode)]);
>       }
> @@ -2077,7 +1963,6 @@ static void gen_mulhdu(DisasContext *ctx)
>       TCGv lo = tcg_temp_new();
>       tcg_gen_mulu2_tl(lo, cpu_gpr[rD(ctx->opcode)],
>                        cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)]);
> -    tcg_temp_free(lo);
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           gen_set_Rc0(ctx, cpu_gpr[rD(ctx->opcode)]);
>       }
> @@ -2110,9 +1995,6 @@ static void gen_mulldo(DisasContext *ctx)
>       }
>       tcg_gen_or_tl(cpu_so, cpu_so, cpu_ov);
>   
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           gen_set_Rc0(ctx, cpu_gpr[rD(ctx->opcode)]);
>       }
> @@ -2148,9 +2030,7 @@ static inline void gen_op_arith_subf(DisasContext *ctx, TCGv ret, TCGv arg1,
>               }
>               tcg_gen_xor_tl(t1, arg2, inv1);         /* add without carry */
>               tcg_gen_add_tl(t0, t0, inv1);
> -            tcg_temp_free(inv1);
>               tcg_gen_xor_tl(cpu_ca, t0, t1);         /* bits changes w/ carry */
> -            tcg_temp_free(t1);
>               tcg_gen_extract_tl(cpu_ca, cpu_ca, 32, 1);
>               if (is_isa300(ctx)) {
>                   tcg_gen_mov_tl(cpu_ca32, cpu_ca);
> @@ -2162,8 +2042,6 @@ static inline void gen_op_arith_subf(DisasContext *ctx, TCGv ret, TCGv arg1,
>               tcg_gen_add2_tl(t0, cpu_ca, arg2, zero, cpu_ca, zero);
>               tcg_gen_add2_tl(t0, cpu_ca, t0, cpu_ca, inv1, zero);
>               gen_op_arith_compute_ca32(ctx, t0, inv1, arg2, cpu_ca32, 0);
> -            tcg_temp_free(zero);
> -            tcg_temp_free(inv1);
>           } else {
>               tcg_gen_setcond_tl(TCG_COND_GEU, cpu_ca, arg2, arg1);
>               tcg_gen_sub_tl(t0, arg2, arg1);
> @@ -2190,7 +2068,6 @@ static inline void gen_op_arith_subf(DisasContext *ctx, TCGv ret, TCGv arg1,
>   
>       if (t0 != ret) {
>           tcg_gen_mov_tl(ret, t0);
> -        tcg_temp_free(t0);
>       }
>   }
>   /* Sub functions with Two operands functions */
> @@ -2210,7 +2087,6 @@ static void glue(gen_, name)(DisasContext *ctx)                               \
>       gen_op_arith_subf(ctx, cpu_gpr[rD(ctx->opcode)],                          \
>                         cpu_gpr[rA(ctx->opcode)], t0,                           \
>                         add_ca, compute_ca, compute_ov, Rc(ctx->opcode));       \
> -    tcg_temp_free(t0);                                                        \
>   }
>   /* subf  subf.  subfo  subfo. */
>   GEN_INT_ARITH_SUBF(subf, 0x01, 0, 0, 0)
> @@ -2234,7 +2110,6 @@ static void gen_subfic(DisasContext *ctx)
>       TCGv c = tcg_const_tl(SIMM(ctx->opcode));
>       gen_op_arith_subf(ctx, cpu_gpr[rD(ctx->opcode)], cpu_gpr[rA(ctx->opcode)],
>                         c, 0, 1, 0, 0);
> -    tcg_temp_free(c);
>   }
>   
>   /* neg neg. nego nego. */
> @@ -2243,7 +2118,6 @@ static inline void gen_op_arith_neg(DisasContext *ctx, bool compute_ov)
>       TCGv zero = tcg_const_tl(0);
>       gen_op_arith_subf(ctx, cpu_gpr[rD(ctx->opcode)], cpu_gpr[rA(ctx->opcode)],
>                         zero, 0, 0, compute_ov, Rc(ctx->opcode));
> -    tcg_temp_free(zero);
>   }
>   
>   static void gen_neg(DisasContext *ctx)
> @@ -2306,7 +2180,6 @@ static void gen_cntlzw(DisasContext *ctx)
>       tcg_gen_trunc_tl_i32(t, cpu_gpr[rS(ctx->opcode)]);
>       tcg_gen_clzi_i32(t, t, 32);
>       tcg_gen_extu_i32_tl(cpu_gpr[rA(ctx->opcode)], t);
> -    tcg_temp_free_i32(t);
>   
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
> @@ -2321,7 +2194,6 @@ static void gen_cnttzw(DisasContext *ctx)
>       tcg_gen_trunc_tl_i32(t, cpu_gpr[rS(ctx->opcode)]);
>       tcg_gen_ctzi_i32(t, t, 32);
>       tcg_gen_extu_i32_tl(cpu_gpr[rA(ctx->opcode)], t);
> -    tcg_temp_free_i32(t);
>   
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
> @@ -2345,7 +2217,6 @@ static void gen_pause(DisasContext *ctx)
>       TCGv_i32 t0 = tcg_const_i32(0);
>       tcg_gen_st_i32(t0, cpu_env,
>                      -offsetof(PowerPCCPU, env) + offsetof(CPUState, halted));
> -    tcg_temp_free_i32(t0);
>   
>       /* Stop translation, this gives other CPUs a chance to run */
>       gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
> @@ -2424,7 +2295,6 @@ static void gen_or(DisasContext *ctx)
>               tcg_gen_andi_tl(t0, t0, ~0x001C000000000000ULL);
>               tcg_gen_ori_tl(t0, t0, ((uint64_t)prio) << 50);
>               gen_store_spr(SPR_PPR, t0);
> -            tcg_temp_free(t0);
>           }
>   #if !defined(CONFIG_USER_ONLY)
>           /*
> @@ -2539,7 +2409,6 @@ static void gen_prtyw(DisasContext *ctx)
>       tcg_gen_shri_tl(t0, ra, 8);
>       tcg_gen_xor_tl(ra, ra, t0);
>       tcg_gen_andi_tl(ra, ra, (target_ulong)0x100000001ULL);
> -    tcg_temp_free(t0);
>   }
>   
>   #if defined(TARGET_PPC64)
> @@ -2556,7 +2425,6 @@ static void gen_prtyd(DisasContext *ctx)
>       tcg_gen_shri_tl(t0, ra, 8);
>       tcg_gen_xor_tl(ra, ra, t0);
>       tcg_gen_andi_tl(ra, ra, 1);
> -    tcg_temp_free(t0);
>   }
>   #endif
>   
> @@ -2645,7 +2513,6 @@ static void gen_rlwimi(DisasContext *ctx)
>               tcg_gen_trunc_tl_i32(t0, t_rs);
>               tcg_gen_rotli_i32(t0, t0, sh);
>               tcg_gen_extu_i32_tl(t1, t0);
> -            tcg_temp_free_i32(t0);
>           } else {
>   #if defined(TARGET_PPC64)
>               tcg_gen_deposit_i64(t1, t_rs, t_rs, 32, 32);
> @@ -2658,7 +2525,6 @@ static void gen_rlwimi(DisasContext *ctx)
>           tcg_gen_andi_tl(t1, t1, mask);
>           tcg_gen_andi_tl(t_ra, t_ra, ~mask);
>           tcg_gen_or_tl(t_ra, t_ra, t1);
> -        tcg_temp_free(t1);
>       }
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           gen_set_Rc0(ctx, t_ra);
> @@ -2702,7 +2568,6 @@ static void gen_rlwinm(DisasContext *ctx)
>                   tcg_gen_rotli_i32(t0, t0, sh);
>                   tcg_gen_andi_i32(t0, t0, mask);
>                   tcg_gen_extu_i32_tl(t_ra, t0);
> -                tcg_temp_free_i32(t0);
>               }
>           } else {
>   #if defined(TARGET_PPC64)
> @@ -2749,15 +2614,12 @@ static void gen_rlwnm(DisasContext *ctx)
>           tcg_gen_andi_i32(t0, t0, 0x1f);
>           tcg_gen_rotl_i32(t1, t1, t0);
>           tcg_gen_extu_i32_tl(t_ra, t1);
> -        tcg_temp_free_i32(t0);
> -        tcg_temp_free_i32(t1);
>       } else {
>   #if defined(TARGET_PPC64)
>           TCGv_i64 t0 = tcg_temp_new_i64();
>           tcg_gen_andi_i64(t0, t_rb, 0x1f);
>           tcg_gen_deposit_i64(t_ra, t_rs, t_rs, 32, 32);
>           tcg_gen_rotl_i64(t_ra, t_ra, t0);
> -        tcg_temp_free_i64(t0);
>   #else
>           g_assert_not_reached();
>   #endif
> @@ -2865,7 +2727,6 @@ static void gen_rldnm(DisasContext *ctx, int mb, int me)
>       t0 = tcg_temp_new();
>       tcg_gen_andi_tl(t0, t_rb, 0x3f);
>       tcg_gen_rotl_tl(t_ra, t_rs, t0);
> -    tcg_temp_free(t0);
>   
>       tcg_gen_andi_tl(t_ra, t_ra, MASK(mb, me));
>       if (unlikely(Rc(ctx->opcode) != 0)) {
> @@ -2912,7 +2773,6 @@ static void gen_rldimi(DisasContext *ctx, int mbn, int shn)
>           tcg_gen_andi_tl(t1, t1, mask);
>           tcg_gen_andi_tl(t_ra, t_ra, ~mask);
>           tcg_gen_or_tl(t_ra, t_ra, t1);
> -        tcg_temp_free(t1);
>       }
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           gen_set_Rc0(ctx, t_ra);
> @@ -2941,8 +2801,6 @@ static void gen_slw(DisasContext *ctx)
>       t1 = tcg_temp_new();
>       tcg_gen_andi_tl(t1, cpu_gpr[rB(ctx->opcode)], 0x1f);
>       tcg_gen_shl_tl(cpu_gpr[rA(ctx->opcode)], t0, t1);
> -    tcg_temp_free(t1);
> -    tcg_temp_free(t0);
>       tcg_gen_ext32u_tl(cpu_gpr[rA(ctx->opcode)], cpu_gpr[rA(ctx->opcode)]);
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
> @@ -2978,7 +2836,6 @@ static void gen_srawi(DisasContext *ctx)
>           t0 = tcg_temp_new();
>           tcg_gen_sari_tl(t0, dst, TARGET_LONG_BITS - 1);
>           tcg_gen_and_tl(cpu_ca, cpu_ca, t0);
> -        tcg_temp_free(t0);
>           tcg_gen_setcondi_tl(TCG_COND_NE, cpu_ca, cpu_ca, 0);
>           if (is_isa300(ctx)) {
>               tcg_gen_mov_tl(cpu_ca32, cpu_ca);
> @@ -3009,8 +2866,6 @@ static void gen_srw(DisasContext *ctx)
>       t1 = tcg_temp_new();
>       tcg_gen_andi_tl(t1, cpu_gpr[rB(ctx->opcode)], 0x1f);
>       tcg_gen_shr_tl(cpu_gpr[rA(ctx->opcode)], t0, t1);
> -    tcg_temp_free(t1);
> -    tcg_temp_free(t0);
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
>       }
> @@ -3030,8 +2885,6 @@ static void gen_sld(DisasContext *ctx)
>       t1 = tcg_temp_new();
>       tcg_gen_andi_tl(t1, cpu_gpr[rB(ctx->opcode)], 0x3f);
>       tcg_gen_shl_tl(cpu_gpr[rA(ctx->opcode)], t0, t1);
> -    tcg_temp_free(t1);
> -    tcg_temp_free(t0);
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
>       }
> @@ -3064,7 +2917,6 @@ static inline void gen_sradi(DisasContext *ctx, int n)
>           t0 = tcg_temp_new();
>           tcg_gen_sari_tl(t0, src, TARGET_LONG_BITS - 1);
>           tcg_gen_and_tl(cpu_ca, cpu_ca, t0);
> -        tcg_temp_free(t0);
>           tcg_gen_setcondi_tl(TCG_COND_NE, cpu_ca, cpu_ca, 0);
>           if (is_isa300(ctx)) {
>               tcg_gen_mov_tl(cpu_ca32, cpu_ca);
> @@ -3123,8 +2975,6 @@ static void gen_srd(DisasContext *ctx)
>       t1 = tcg_temp_new();
>       tcg_gen_andi_tl(t1, cpu_gpr[rB(ctx->opcode)], 0x3f);
>       tcg_gen_shr_tl(cpu_gpr[rA(ctx->opcode)], t0, t1);
> -    tcg_temp_free(t1);
> -    tcg_temp_free(t0);
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
>       }
> @@ -3296,7 +3146,6 @@ static void glue(gen_, name##x)(DisasContext *ctx)                            \
>       EA = tcg_temp_new();                                                      \
>       gen_addr_reg_index(ctx, EA);                                              \
>       gen_qemu_##ldop(ctx, cpu_gpr[rD(ctx->opcode)], EA);                       \
> -    tcg_temp_free(EA);                                                        \
>   }
>   
>   #define GEN_LDX(name, ldop, opc2, opc3, type)                                 \
> @@ -3314,7 +3163,6 @@ static void glue(gen_, name##epx)(DisasContext *ctx)                          \
>       EA = tcg_temp_new();                                                      \
>       gen_addr_reg_index(ctx, EA);                                              \
>       tcg_gen_qemu_ld_tl(cpu_gpr[rD(ctx->opcode)], EA, PPC_TLB_EPID_LOAD, ldop);\
> -    tcg_temp_free(EA);                                                        \
>   }
>   
>   GEN_LDEPX(lb, DEF_MEMOP(MO_UB), 0x1F, 0x02)
> @@ -3342,7 +3190,6 @@ static void glue(gen_, name##x)(DisasContext *ctx)                            \
>       EA = tcg_temp_new();                                                      \
>       gen_addr_reg_index(ctx, EA);                                              \
>       gen_qemu_##stop(ctx, cpu_gpr[rS(ctx->opcode)], EA);                       \
> -    tcg_temp_free(EA);                                                        \
>   }
>   #define GEN_STX(name, stop, opc2, opc3, type)                                 \
>       GEN_STX_E(name, stop, opc2, opc3, type, PPC_NONE, CHK_NONE)
> @@ -3360,7 +3207,6 @@ static void glue(gen_, name##epx)(DisasContext *ctx)                          \
>       gen_addr_reg_index(ctx, EA);                                              \
>       tcg_gen_qemu_st_tl(                                                       \
>           cpu_gpr[rD(ctx->opcode)], EA, PPC_TLB_EPID_STORE, stop);              \
> -    tcg_temp_free(EA);                                                        \
>   }
>   
>   GEN_STEPX(stb, DEF_MEMOP(MO_UB), 0x1F, 0x06)
> @@ -3413,8 +3259,6 @@ static void gen_lmw(DisasContext *ctx)
>       t1 = tcg_const_i32(rD(ctx->opcode));
>       gen_addr_imm_index(ctx, t0, 0);
>       gen_helper_lmw(cpu_env, t0, t1);
> -    tcg_temp_free(t0);
> -    tcg_temp_free_i32(t1);
>   }
>   
>   /* stmw */
> @@ -3432,8 +3276,6 @@ static void gen_stmw(DisasContext *ctx)
>       t1 = tcg_const_i32(rS(ctx->opcode));
>       gen_addr_imm_index(ctx, t0, 0);
>       gen_helper_stmw(cpu_env, t0, t1);
> -    tcg_temp_free(t0);
> -    tcg_temp_free_i32(t1);
>   }
>   
>   /***                    Integer load and store strings                     ***/
> @@ -3472,9 +3314,6 @@ static void gen_lswi(DisasContext *ctx)
>       t1 = tcg_const_i32(nb);
>       t2 = tcg_const_i32(start);
>       gen_helper_lsw(cpu_env, t0, t1, t2);
> -    tcg_temp_free(t0);
> -    tcg_temp_free_i32(t1);
> -    tcg_temp_free_i32(t2);
>   }
>   
>   /* lswx */
> @@ -3494,10 +3333,6 @@ static void gen_lswx(DisasContext *ctx)
>       t2 = tcg_const_i32(rA(ctx->opcode));
>       t3 = tcg_const_i32(rB(ctx->opcode));
>       gen_helper_lswx(cpu_env, t0, t1, t2, t3);
> -    tcg_temp_free(t0);
> -    tcg_temp_free_i32(t1);
> -    tcg_temp_free_i32(t2);
> -    tcg_temp_free_i32(t3);
>   }
>   
>   /* stswi */
> @@ -3520,9 +3355,6 @@ static void gen_stswi(DisasContext *ctx)
>       t1 = tcg_const_i32(nb);
>       t2 = tcg_const_i32(rS(ctx->opcode));
>       gen_helper_stsw(cpu_env, t0, t1, t2);
> -    tcg_temp_free(t0);
> -    tcg_temp_free_i32(t1);
> -    tcg_temp_free_i32(t2);
>   }
>   
>   /* stswx */
> @@ -3543,9 +3375,6 @@ static void gen_stswx(DisasContext *ctx)
>       tcg_gen_andi_i32(t1, t1, 0x7F);
>       t2 = tcg_const_i32(rS(ctx->opcode));
>       gen_helper_stsw(cpu_env, t0, t1, t2);
> -    tcg_temp_free(t0);
> -    tcg_temp_free_i32(t1);
> -    tcg_temp_free_i32(t2);
>   }
>   
>   /***                        Memory synchronisation                         ***/
> @@ -3620,7 +3449,6 @@ static inline void gen_check_tlb_flush(DisasContext *ctx, bool global)
>           gen_helper_check_tlb_flush_local(cpu_env);
>       }
>       gen_set_label(l);
> -    tcg_temp_free_i32(t);
>   }
>   #else
>   static inline void gen_check_tlb_flush(DisasContext *ctx, bool global) { }
> @@ -3653,7 +3481,6 @@ static void gen_load_locked(DisasContext *ctx, MemOp memop)
>       tcg_gen_mov_tl(cpu_reserve, t0);
>       tcg_gen_mov_tl(cpu_reserve_val, gpr);
>       tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
> -    tcg_temp_free(t0);
>   }
>   
>   #define LARX(name, memop)                  \
> @@ -3687,10 +3514,6 @@ static void gen_fetch_inc_conditional(DisasContext *ctx, MemOp memop,
>       /* RT = (t != t2 ? t : u = 1<<(s*8-1)) */
>       tcg_gen_movi_tl(u, 1 << (MEMOP_GET_SIZE(memop) * 8 - 1));
>       tcg_gen_movcond_tl(cond, cpu_gpr[rD(ctx->opcode)], t, t2, t, u);
> -
> -    tcg_temp_free(t);
> -    tcg_temp_free(t2);
> -    tcg_temp_free(u);
>   }
>   
>   static void gen_ld_atomic(DisasContext *ctx, MemOp memop)
> @@ -3753,9 +3576,6 @@ static void gen_ld_atomic(DisasContext *ctx, MemOp memop)
>                                  cpu_gpr[(rt + 2) & 31], t0);
>               tcg_gen_qemu_st_tl(t1, EA, ctx->mem_idx, memop);
>               tcg_gen_mov_tl(dst, t0);
> -
> -            tcg_temp_free(t0);
> -            tcg_temp_free(t1);
>           }
>           break;
>   
> @@ -3785,7 +3605,6 @@ static void gen_ld_atomic(DisasContext *ctx, MemOp memop)
>           /* invoke data storage error handler */
>           gen_exception_err(ctx, POWERPC_EXCP_DSI, POWERPC_EXCP_INVAL);
>       }
> -    tcg_temp_free(EA);
>   
>       if (need_serial) {
>           /* Restart with exclusive lock.  */
> @@ -3861,20 +3680,12 @@ static void gen_st_atomic(DisasContext *ctx, MemOp memop)
>               tcg_gen_movcond_tl(TCG_COND_EQ, s2, t, t2, src, t2);
>               tcg_gen_qemu_st_tl(s, EA, ctx->mem_idx, memop);
>               tcg_gen_qemu_st_tl(s2, ea_plus_s, ctx->mem_idx, memop);
> -
> -            tcg_temp_free(ea_plus_s);
> -            tcg_temp_free(s2);
> -            tcg_temp_free(s);
> -            tcg_temp_free(t2);
> -            tcg_temp_free(t);
>           }
>           break;
>       default:
>           /* invoke data storage error handler */
>           gen_exception_err(ctx, POWERPC_EXCP_DSI, POWERPC_EXCP_INVAL);
>       }
> -    tcg_temp_free(discard);
> -    tcg_temp_free(EA);
>   }
>   
>   static void gen_stwat(DisasContext *ctx)
> @@ -3899,7 +3710,6 @@ static void gen_conditional_store(DisasContext *ctx, MemOp memop)
>       gen_set_access_type(ctx, ACCESS_RES);
>       gen_addr_reg_index(ctx, t0);
>       tcg_gen_brcond_tl(TCG_COND_NE, t0, cpu_reserve, l1);
> -    tcg_temp_free(t0);
>   
>       t0 = tcg_temp_new();
>       tcg_gen_atomic_cmpxchg_tl(t0, cpu_reserve, cpu_reserve_val,
> @@ -3909,7 +3719,6 @@ static void gen_conditional_store(DisasContext *ctx, MemOp memop)
>       tcg_gen_shli_tl(t0, t0, CRF_EQ_BIT);
>       tcg_gen_or_tl(t0, t0, cpu_so);
>       tcg_gen_trunc_tl_i32(cpu_crf[0], t0);
> -    tcg_temp_free(t0);
>       tcg_gen_br(l2);
>   
>       gen_set_label(l1);
> @@ -3973,13 +3782,11 @@ static void gen_lqarx(DisasContext *ctx)
>                                                       ctx->mem_idx));
>                   gen_helper_lq_be_parallel(lo, cpu_env, EA, oi);
>               }
> -            tcg_temp_free_i32(oi);
>               tcg_gen_ld_i64(hi, cpu_env, offsetof(CPUPPCState, retxh));
>           } else {
>               /* Restart with exclusive lock.  */
>               gen_helper_exit_atomic(cpu_env);
>               ctx->base.is_jmp = DISAS_NORETURN;
> -            tcg_temp_free(EA);
>               return;
>           }
>       } else if (ctx->le_mode) {
> @@ -3993,7 +3800,6 @@ static void gen_lqarx(DisasContext *ctx)
>           gen_addr_add(ctx, EA, EA, 8);
>           tcg_gen_qemu_ld_i64(lo, EA, ctx->mem_idx, MO_BEUQ);
>       }
> -    tcg_temp_free(EA);
>   
>       tcg_gen_st_tl(hi, cpu_env, offsetof(CPUPPCState, reserve_val));
>       tcg_gen_st_tl(lo, cpu_env, offsetof(CPUPPCState, reserve_val2));
> @@ -4020,7 +3826,6 @@ static void gen_stqcx_(DisasContext *ctx)
>       gen_addr_reg_index(ctx, EA);
>   
>       tcg_gen_brcond_tl(TCG_COND_NE, EA, cpu_reserve, lab_fail);
> -    tcg_temp_free(EA);
>   
>       cmp = tcg_temp_new_i128();
>       val = tcg_temp_new_i128();
> @@ -4032,23 +3837,19 @@ static void gen_stqcx_(DisasContext *ctx)
>   
>       tcg_gen_atomic_cmpxchg_i128(val, cpu_reserve, cmp, val, ctx->mem_idx,
>                                   DEF_MEMOP(MO_128 | MO_ALIGN));
> -    tcg_temp_free_i128(cmp);
>   
>       t0 = tcg_temp_new();
>       t1 = tcg_temp_new();
>       tcg_gen_extr_i128_i64(t1, t0, val);
> -    tcg_temp_free_i128(val);
>   
>       tcg_gen_xor_tl(t1, t1, cpu_reserve_val2);
>       tcg_gen_xor_tl(t0, t0, cpu_reserve_val);
>       tcg_gen_or_tl(t0, t0, t1);
> -    tcg_temp_free(t1);
>   
>       tcg_gen_setcondi_tl(TCG_COND_EQ, t0, t0, 0);
>       tcg_gen_shli_tl(t0, t0, CRF_EQ_BIT);
>       tcg_gen_or_tl(t0, t0, cpu_so);
>       tcg_gen_trunc_tl_i32(cpu_crf[0], t0);
> -    tcg_temp_free(t0);
>   
>       tcg_gen_br(lab_over);
>       gen_set_label(lab_fail);
> @@ -4145,7 +3946,6 @@ static void gen_wait(DisasContext *ctx)
>           TCGv_i32 t0 = tcg_const_i32(1);
>           tcg_gen_st_i32(t0, cpu_env,
>                          -offsetof(PowerPCCPU, env) + offsetof(CPUState, halted));
> -        tcg_temp_free_i32(t0);
>           /* Stop translation, as the CPU is supposed to sleep from now */
>           gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
>       }
> @@ -4191,7 +3991,6 @@ static void gen_doze(DisasContext *ctx)
>       CHK_HV(ctx);
>       t = tcg_const_i32(PPC_PM_DOZE);
>       gen_helper_pminsn(cpu_env, t);
> -    tcg_temp_free_i32(t);
>       /* Stop translation, as the CPU is supposed to sleep from now */
>       gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
>   #endif /* defined(CONFIG_USER_ONLY) */
> @@ -4207,7 +4006,6 @@ static void gen_nap(DisasContext *ctx)
>       CHK_HV(ctx);
>       t = tcg_const_i32(PPC_PM_NAP);
>       gen_helper_pminsn(cpu_env, t);
> -    tcg_temp_free_i32(t);
>       /* Stop translation, as the CPU is supposed to sleep from now */
>       gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
>   #endif /* defined(CONFIG_USER_ONLY) */
> @@ -4223,7 +4021,6 @@ static void gen_stop(DisasContext *ctx)
>       CHK_HV(ctx);
>       t = tcg_const_i32(PPC_PM_STOP);
>       gen_helper_pminsn(cpu_env, t);
> -    tcg_temp_free_i32(t);
>       /* Stop translation, as the CPU is supposed to sleep from now */
>       gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
>   #endif /* defined(CONFIG_USER_ONLY) */
> @@ -4239,7 +4036,6 @@ static void gen_sleep(DisasContext *ctx)
>       CHK_HV(ctx);
>       t = tcg_const_i32(PPC_PM_SLEEP);
>       gen_helper_pminsn(cpu_env, t);
> -    tcg_temp_free_i32(t);
>       /* Stop translation, as the CPU is supposed to sleep from now */
>       gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
>   #endif /* defined(CONFIG_USER_ONLY) */
> @@ -4255,7 +4051,6 @@ static void gen_rvwinkle(DisasContext *ctx)
>       CHK_HV(ctx);
>       t = tcg_const_i32(PPC_PM_RVWINKLE);
>       gen_helper_pminsn(cpu_env, t);
> -    tcg_temp_free_i32(t);
>       /* Stop translation, as the CPU is supposed to sleep from now */
>       gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
>   #endif /* defined(CONFIG_USER_ONLY) */
> @@ -4309,7 +4104,6 @@ static void pmu_count_insns(DisasContext *ctx)
>           }
>   
>           gen_set_label(l);
> -        tcg_temp_free(t0);
>       } else {
>           gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
>       }
> @@ -4324,8 +4118,6 @@ static void pmu_count_insns(DisasContext *ctx)
>       gen_load_spr(t0, SPR_POWER_PMC5);
>       tcg_gen_addi_tl(t0, t0, ctx->base.num_insns);
>       gen_store_spr(SPR_POWER_PMC5, t0);
> -
> -    tcg_temp_free(t0);
>     #endif /* #if !defined(CONFIG_USER_ONLY) */
>   }
>   #else
> @@ -4451,8 +4243,6 @@ static void gen_bcond(DisasContext *ctx, int type)
>                */
>               if (unlikely(!is_book3s_arch2x(ctx))) {
>                   gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
> -                tcg_temp_free(temp);
> -                tcg_temp_free(target);
>                   return;
>               }
>   
> @@ -4480,7 +4270,6 @@ static void gen_bcond(DisasContext *ctx, int type)
>                   tcg_gen_brcondi_tl(TCG_COND_EQ, temp, 0, l1);
>               }
>           }
> -        tcg_temp_free(temp);
>       }
>       if ((bo & 0x10) == 0) {
>           /* Test CR */
> @@ -4495,7 +4284,6 @@ static void gen_bcond(DisasContext *ctx, int type)
>               tcg_gen_andi_i32(temp, cpu_crf[bi >> 2], mask);
>               tcg_gen_brcondi_i32(TCG_COND_NE, temp, 0, l1);
>           }
> -        tcg_temp_free_i32(temp);
>       }
>       gen_update_cfar(ctx, ctx->cia);
>       if (type == BCOND_IM) {
> @@ -4512,7 +4300,6 @@ static void gen_bcond(DisasContext *ctx, int type)
>               tcg_gen_andi_tl(cpu_nip, target, ~3);
>           }
>           gen_lookup_and_goto_ptr(ctx);
> -        tcg_temp_free(target);
>       }
>       if ((bo & 0x14) != 0x14) {
>           /* fallthrough case */
> @@ -4570,8 +4357,6 @@ static void glue(gen_, name)(DisasContext *ctx)                               \
>       tcg_gen_andi_i32(t0, t0, bitmask);                                        \
>       tcg_gen_andi_i32(t1, cpu_crf[crbD(ctx->opcode) >> 2], ~bitmask);          \
>       tcg_gen_or_i32(cpu_crf[crbD(ctx->opcode) >> 2], t0, t1);                  \
> -    tcg_temp_free_i32(t0);                                                    \
> -    tcg_temp_free_i32(t1);                                                    \
>   }
>   
>   /* crand */
> @@ -4724,7 +4509,6 @@ static void gen_tw(DisasContext *ctx)
>       t0 = tcg_const_i32(TO(ctx->opcode));
>       gen_helper_tw(cpu_env, cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)],
>                     t0);
> -    tcg_temp_free_i32(t0);
>   }
>   
>   /* twi */
> @@ -4739,8 +4523,6 @@ static void gen_twi(DisasContext *ctx)
>       t0 = tcg_const_tl(SIMM(ctx->opcode));
>       t1 = tcg_const_i32(TO(ctx->opcode));
>       gen_helper_tw(cpu_env, cpu_gpr[rA(ctx->opcode)], t0, t1);
> -    tcg_temp_free(t0);
> -    tcg_temp_free_i32(t1);
>   }
>   
>   #if defined(TARGET_PPC64)
> @@ -4755,7 +4537,6 @@ static void gen_td(DisasContext *ctx)
>       t0 = tcg_const_i32(TO(ctx->opcode));
>       gen_helper_td(cpu_env, cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)],
>                     t0);
> -    tcg_temp_free_i32(t0);
>   }
>   
>   /* tdi */
> @@ -4770,8 +4551,6 @@ static void gen_tdi(DisasContext *ctx)
>       t0 = tcg_const_tl(SIMM(ctx->opcode));
>       t1 = tcg_const_i32(TO(ctx->opcode));
>       gen_helper_td(cpu_env, cpu_gpr[rA(ctx->opcode)], t0, t1);
> -    tcg_temp_free(t0);
> -    tcg_temp_free_i32(t1);
>   }
>   #endif
>   
> @@ -4792,8 +4571,6 @@ static void gen_mcrxr(DisasContext *ctx)
>       tcg_gen_shli_i32(dst, dst, 1);
>       tcg_gen_or_i32(dst, dst, t0);
>       tcg_gen_or_i32(dst, dst, t1);
> -    tcg_temp_free_i32(t0);
> -    tcg_temp_free_i32(t1);
>   
>       tcg_gen_movi_tl(cpu_so, 0);
>       tcg_gen_movi_tl(cpu_ov, 0);
> @@ -4817,8 +4594,6 @@ static void gen_mcrxrx(DisasContext *ctx)
>       tcg_gen_or_tl(t1, t1, cpu_ca32);
>       tcg_gen_or_tl(t0, t0, t1);
>       tcg_gen_trunc_tl_i32(dst, t0);
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
>   }
>   #endif
>   
> @@ -4853,7 +4628,6 @@ static void gen_mfcr(DisasContext *ctx)
>           tcg_gen_shli_i32(t0, t0, 4);
>           tcg_gen_or_i32(t0, t0, cpu_crf[7]);
>           tcg_gen_extu_i32_tl(cpu_gpr[rD(ctx->opcode)], t0);
> -        tcg_temp_free_i32(t0);
>       }
>   }
>   
> @@ -4950,7 +4724,6 @@ static void gen_mtcrf(DisasContext *ctx)
>               tcg_gen_trunc_tl_i32(temp, cpu_gpr[rS(ctx->opcode)]);
>               tcg_gen_shri_i32(temp, temp, crn * 4);
>               tcg_gen_andi_i32(cpu_crf[7 - crn], temp, 0xf);
> -            tcg_temp_free_i32(temp);
>           }
>       } else {
>           TCGv_i32 temp = tcg_temp_new_i32();
> @@ -4961,7 +4734,6 @@ static void gen_mtcrf(DisasContext *ctx)
>                       tcg_gen_andi_i32(cpu_crf[7 - crn], cpu_crf[7 - crn], 0xf);
>               }
>           }
> -        tcg_temp_free_i32(temp);
>       }
>   }
>   
> @@ -5008,9 +4780,6 @@ static void gen_mtmsrd(DisasContext *ctx)
>   
>       /* Must stop the translation as machine state (may have) changed */
>       ctx->base.is_jmp = DISAS_EXIT_UPDATE;
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
>   #endif /* !defined(CONFIG_USER_ONLY) */
>   }
>   #endif /* defined(TARGET_PPC64) */
> @@ -5050,9 +4819,6 @@ static void gen_mtmsr(DisasContext *ctx)
>   
>       /* Must stop the translation as machine state (may have) changed */
>       ctx->base.is_jmp = DISAS_EXIT_UPDATE;
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
>   #endif
>   }
>   
> @@ -5125,8 +4891,6 @@ static void gen_setb(DisasContext *ctx)
>       tcg_gen_setcondi_i32(TCG_COND_GEU, t0, cpu_crf[crf], 4);
>       tcg_gen_movcond_i32(TCG_COND_GEU, t0, cpu_crf[crf], t8, tm1, t0);
>       tcg_gen_ext_i32_tl(cpu_gpr[rD(ctx->opcode)], t0);
> -
> -    tcg_temp_free_i32(t0);
>   }
>   #endif
>   
> @@ -5141,7 +4905,6 @@ static void gen_dcbf(DisasContext *ctx)
>       t0 = tcg_temp_new();
>       gen_addr_reg_index(ctx, t0);
>       gen_qemu_ld8u(ctx, t0, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   /* dcbfep (external PID dcbf) */
> @@ -5154,7 +4917,6 @@ static void gen_dcbfep(DisasContext *ctx)
>       t0 = tcg_temp_new();
>       gen_addr_reg_index(ctx, t0);
>       tcg_gen_qemu_ld_tl(t0, t0, PPC_TLB_EPID_LOAD, DEF_MEMOP(MO_UB));
> -    tcg_temp_free(t0);
>   }
>   
>   /* dcbi (Supervisor only) */
> @@ -5173,8 +4935,6 @@ static void gen_dcbi(DisasContext *ctx)
>       /* XXX: specification says this should be treated as a store by the MMU */
>       gen_qemu_ld8u(ctx, val, EA);
>       gen_qemu_st8(ctx, val, EA);
> -    tcg_temp_free(val);
> -    tcg_temp_free(EA);
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -5187,7 +4947,6 @@ static void gen_dcbst(DisasContext *ctx)
>       t0 = tcg_temp_new();
>       gen_addr_reg_index(ctx, t0);
>       gen_qemu_ld8u(ctx, t0, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   /* dcbstep (dcbstep External PID version) */
> @@ -5199,7 +4958,6 @@ static void gen_dcbstep(DisasContext *ctx)
>       t0 = tcg_temp_new();
>       gen_addr_reg_index(ctx, t0);
>       tcg_gen_qemu_ld_tl(t0, t0, PPC_TLB_EPID_LOAD, DEF_MEMOP(MO_UB));
> -    tcg_temp_free(t0);
>   }
>   
>   /* dcbt */
> @@ -5250,7 +5008,6 @@ static void gen_dcbtls(DisasContext *ctx)
>       gen_load_spr(t0, SPR_Exxx_L1CSR0);
>       tcg_gen_ori_tl(t0, t0, L1CSR0_CUL);
>       gen_store_spr(SPR_Exxx_L1CSR0, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   /* dcbz */
> @@ -5264,8 +5021,6 @@ static void gen_dcbz(DisasContext *ctx)
>       tcgv_op = tcg_const_i32(ctx->opcode & 0x03FF000);
>       gen_addr_reg_index(ctx, tcgv_addr);
>       gen_helper_dcbz(cpu_env, tcgv_addr, tcgv_op);
> -    tcg_temp_free(tcgv_addr);
> -    tcg_temp_free_i32(tcgv_op);
>   }
>   
>   /* dcbzep */
> @@ -5279,8 +5034,6 @@ static void gen_dcbzep(DisasContext *ctx)
>       tcgv_op = tcg_const_i32(ctx->opcode & 0x03FF000);
>       gen_addr_reg_index(ctx, tcgv_addr);
>       gen_helper_dcbzep(cpu_env, tcgv_addr, tcgv_op);
> -    tcg_temp_free(tcgv_addr);
> -    tcg_temp_free_i32(tcgv_op);
>   }
>   
>   /* dst / dstt */
> @@ -5318,7 +5071,6 @@ static void gen_icbi(DisasContext *ctx)
>       t0 = tcg_temp_new();
>       gen_addr_reg_index(ctx, t0);
>       gen_helper_icbi(cpu_env, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   /* icbiep */
> @@ -5329,7 +5081,6 @@ static void gen_icbiep(DisasContext *ctx)
>       t0 = tcg_temp_new();
>       gen_addr_reg_index(ctx, t0);
>       gen_helper_icbiep(cpu_env, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   /* Optional: */
> @@ -5357,7 +5108,6 @@ static void gen_mfsr(DisasContext *ctx)
>       CHK_SV(ctx);
>       t0 = tcg_const_tl(SR(ctx->opcode));
>       gen_helper_load_sr(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
> -    tcg_temp_free(t0);
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -5373,7 +5123,6 @@ static void gen_mfsrin(DisasContext *ctx)
>       t0 = tcg_temp_new();
>       tcg_gen_extract_tl(t0, cpu_gpr[rB(ctx->opcode)], 28, 4);
>       gen_helper_load_sr(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
> -    tcg_temp_free(t0);
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -5388,7 +5137,6 @@ static void gen_mtsr(DisasContext *ctx)
>       CHK_SV(ctx);
>       t0 = tcg_const_tl(SR(ctx->opcode));
>       gen_helper_store_sr(cpu_env, t0, cpu_gpr[rS(ctx->opcode)]);
> -    tcg_temp_free(t0);
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -5404,7 +5152,6 @@ static void gen_mtsrin(DisasContext *ctx)
>       t0 = tcg_temp_new();
>       tcg_gen_extract_tl(t0, cpu_gpr[rB(ctx->opcode)], 28, 4);
>       gen_helper_store_sr(cpu_env, t0, cpu_gpr[rD(ctx->opcode)]);
> -    tcg_temp_free(t0);
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -5422,7 +5169,6 @@ static void gen_mfsr_64b(DisasContext *ctx)
>       CHK_SV(ctx);
>       t0 = tcg_const_tl(SR(ctx->opcode));
>       gen_helper_load_sr(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
> -    tcg_temp_free(t0);
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -5438,7 +5184,6 @@ static void gen_mfsrin_64b(DisasContext *ctx)
>       t0 = tcg_temp_new();
>       tcg_gen_extract_tl(t0, cpu_gpr[rB(ctx->opcode)], 28, 4);
>       gen_helper_load_sr(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
> -    tcg_temp_free(t0);
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -5453,7 +5198,6 @@ static void gen_mtsr_64b(DisasContext *ctx)
>       CHK_SV(ctx);
>       t0 = tcg_const_tl(SR(ctx->opcode));
>       gen_helper_store_sr(cpu_env, t0, cpu_gpr[rS(ctx->opcode)]);
> -    tcg_temp_free(t0);
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -5469,7 +5213,6 @@ static void gen_mtsrin_64b(DisasContext *ctx)
>       t0 = tcg_temp_new();
>       tcg_gen_extract_tl(t0, cpu_gpr[rB(ctx->opcode)], 28, 4);
>       gen_helper_store_sr(cpu_env, t0, cpu_gpr[rS(ctx->opcode)]);
> -    tcg_temp_free(t0);
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -5523,7 +5266,6 @@ static void gen_eciwx(DisasContext *ctx)
>       gen_addr_reg_index(ctx, t0);
>       tcg_gen_qemu_ld_tl(cpu_gpr[rD(ctx->opcode)], t0, ctx->mem_idx,
>                          DEF_MEMOP(MO_UL | MO_ALIGN));
> -    tcg_temp_free(t0);
>   }
>   
>   /* ecowx */
> @@ -5536,7 +5278,6 @@ static void gen_ecowx(DisasContext *ctx)
>       gen_addr_reg_index(ctx, t0);
>       tcg_gen_qemu_st_tl(cpu_gpr[rD(ctx->opcode)], t0, ctx->mem_idx,
>                          DEF_MEMOP(MO_UL | MO_ALIGN));
> -    tcg_temp_free(t0);
>   }
>   
>   /* 602 - 603 - G2 TLB management */
> @@ -5584,7 +5325,6 @@ static void gen_tlbiva(DisasContext *ctx)
>       t0 = tcg_temp_new();
>       gen_addr_reg_index(ctx, t0);
>       gen_helper_tlbiva(cpu_env, cpu_gpr[rB(ctx->opcode)]);
> -    tcg_temp_free(t0);
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -5702,8 +5442,6 @@ static inline void gen_405_mulladd_insn(DisasContext *ctx, int opc2, int opc3,
>       } else {
>           tcg_gen_mul_tl(cpu_gpr[rt], t0, t1);
>       }
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
>       if (unlikely(Rc) != 0) {
>           /* Update Rc0 */
>           gen_set_Rc0(ctx, cpu_gpr[rt]);
> @@ -5814,7 +5552,6 @@ static void gen_mfdcr(DisasContext *ctx)
>       CHK_SV(ctx);
>       dcrn = tcg_const_tl(SPR(ctx->opcode));
>       gen_helper_load_dcr(cpu_gpr[rD(ctx->opcode)], cpu_env, dcrn);
> -    tcg_temp_free(dcrn);
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -5829,7 +5566,6 @@ static void gen_mtdcr(DisasContext *ctx)
>       CHK_SV(ctx);
>       dcrn = tcg_const_tl(SPR(ctx->opcode));
>       gen_helper_store_dcr(cpu_env, dcrn, cpu_gpr[rS(ctx->opcode)]);
> -    tcg_temp_free(dcrn);
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -5882,9 +5618,7 @@ static void gen_dcread(DisasContext *ctx)
>       gen_addr_reg_index(ctx, EA);
>       val = tcg_temp_new();
>       gen_qemu_ld32u(ctx, val, EA);
> -    tcg_temp_free(val);
>       tcg_gen_mov_tl(cpu_gpr[rD(ctx->opcode)], EA);
> -    tcg_temp_free(EA);
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -6002,7 +5736,6 @@ static void gen_tlbsx_40x(DisasContext *ctx)
>       t0 = tcg_temp_new();
>       gen_addr_reg_index(ctx, t0);
>       gen_helper_4xx_tlbsx(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
> -    tcg_temp_free(t0);
>       if (Rc(ctx->opcode)) {
>           TCGLabel *l1 = gen_new_label();
>           tcg_gen_trunc_tl_i32(cpu_crf[0], cpu_so);
> @@ -6055,7 +5788,6 @@ static void gen_tlbre_440(DisasContext *ctx)
>               TCGv_i32 t0 = tcg_const_i32(rB(ctx->opcode));
>               gen_helper_440_tlbre(cpu_gpr[rD(ctx->opcode)], cpu_env,
>                                    t0, cpu_gpr[rA(ctx->opcode)]);
> -            tcg_temp_free_i32(t0);
>           }
>           break;
>       default:
> @@ -6077,7 +5809,6 @@ static void gen_tlbsx_440(DisasContext *ctx)
>       t0 = tcg_temp_new();
>       gen_addr_reg_index(ctx, t0);
>       gen_helper_440_tlbsx(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
> -    tcg_temp_free(t0);
>       if (Rc(ctx->opcode)) {
>           TCGLabel *l1 = gen_new_label();
>           tcg_gen_trunc_tl_i32(cpu_crf[0], cpu_so);
> @@ -6103,7 +5834,6 @@ static void gen_tlbwe_440(DisasContext *ctx)
>               TCGv_i32 t0 = tcg_const_i32(rB(ctx->opcode));
>               gen_helper_440_tlbwe(cpu_env, t0, cpu_gpr[rA(ctx->opcode)],
>                                    cpu_gpr[rS(ctx->opcode)]);
> -            tcg_temp_free_i32(t0);
>           }
>           break;
>       default:
> @@ -6144,7 +5874,6 @@ static void gen_tlbsx_booke206(DisasContext *ctx)
>   
>       tcg_gen_add_tl(t0, t0, cpu_gpr[rB(ctx->opcode)]);
>       gen_helper_booke206_tlbsx(cpu_env, t0);
> -    tcg_temp_free(t0);
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -6170,7 +5899,6 @@ static void gen_tlbivax_booke206(DisasContext *ctx)
>       t0 = tcg_temp_new();
>       gen_addr_reg_index(ctx, t0);
>       gen_helper_booke206_tlbivax(cpu_env, t0);
> -    tcg_temp_free(t0);
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -6199,8 +5927,6 @@ static void gen_tlbilx_booke206(DisasContext *ctx)
>           gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
>           break;
>       }
> -
> -    tcg_temp_free(t0);
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -6218,7 +5944,6 @@ static void gen_wrtee(DisasContext *ctx)
>       tcg_gen_andi_tl(cpu_msr, cpu_msr, ~(1 << MSR_EE));
>       tcg_gen_or_tl(cpu_msr, cpu_msr, t0);
>       gen_ppc_maybe_interrupt(ctx);
> -    tcg_temp_free(t0);
>       /*
>        * Stop translation to have a chance to raise an exception if we
>        * just set msr_ee to 1
> @@ -6253,7 +5978,6 @@ static void gen_dlmzb(DisasContext *ctx)
>       TCGv_i32 t0 = tcg_const_i32(Rc(ctx->opcode));
>       gen_helper_dlmzb(cpu_gpr[rA(ctx->opcode)], cpu_env,
>                        cpu_gpr[rS(ctx->opcode)], cpu_gpr[rB(ctx->opcode)], t0);
> -    tcg_temp_free_i32(t0);
>   }
>   
>   /* mbar replaces eieio on 440 */
> @@ -6290,7 +6014,6 @@ static void gen_maddld(DisasContext *ctx)
>   
>       tcg_gen_mul_i64(t1, cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)]);
>       tcg_gen_add_i64(cpu_gpr[rD(ctx->opcode)], t1, cpu_gpr[rC(ctx->opcode)]);
> -    tcg_temp_free_i64(t1);
>   }
>   
>   /* maddhd maddhdu */
> @@ -6311,9 +6034,6 @@ static void gen_maddhd_maddhdu(DisasContext *ctx)
>       }
>       tcg_gen_add2_i64(t1, cpu_gpr[rD(ctx->opcode)], lo, hi,
>                        cpu_gpr[rC(ctx->opcode)], t1);
> -    tcg_temp_free_i64(lo);
> -    tcg_temp_free_i64(hi);
> -    tcg_temp_free_i64(t1);
>   }
>   #endif /* defined(TARGET_PPC64) */
>   
> @@ -6664,9 +6384,6 @@ static void gen_brh(DisasContext *ctx)
>       tcg_gen_and_i64(t1, cpu_gpr[rS(ctx->opcode)], mask);
>       tcg_gen_shli_i64(t1, t1, 8);
>       tcg_gen_or_i64(cpu_gpr[rA(ctx->opcode)], t1, t2);
> -
> -    tcg_temp_free_i64(t1);
> -    tcg_temp_free_i64(t2);
>   }
>   #endif
>   
> diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
> index c3cc919ee4..42f2cd04a1 100644
> --- a/target/ppc/power8-pmu-regs.c.inc
> +++ b/target/ppc/power8-pmu-regs.c.inc
> @@ -58,8 +58,6 @@ static bool spr_groupA_write_allowed(DisasContext *ctx)
>   /*
>    * Helper function to avoid code repetition between MMCR0 and
>    * MMCR2 problem state write functions.
> - *
> - * 'ret' must be tcg_temp_freed() by the caller.
>    */
>   static TCGv masked_gprn_for_spr_write(int gprn, int sprn,
>                                         uint64_t spr_mask)
> @@ -77,8 +75,6 @@ static TCGv masked_gprn_for_spr_write(int gprn, int sprn,
>       /* Add the masked gprn bits into 'ret' */
>       tcg_gen_or_tl(ret, ret, t0);
>   
> -    tcg_temp_free(t0);
> -
>       return ret;
>   }
>   
> @@ -100,8 +96,6 @@ void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
>       gen_load_spr(t0, SPR_POWER_MMCR0);
>       tcg_gen_andi_tl(t0, t0, MMCR0_UREG_MASK);
>       tcg_gen_mov_tl(cpu_gpr[gprn], t0);
> -
> -    tcg_temp_free(t0);
>   }
>   
>   static void write_MMCR0_common(DisasContext *ctx, TCGv val)
> @@ -137,8 +131,6 @@ void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
>       masked_gprn = masked_gprn_for_spr_write(gprn, SPR_POWER_MMCR0,
>                                               MMCR0_UREG_MASK);
>       write_MMCR0_common(ctx, masked_gprn);
> -
> -    tcg_temp_free(masked_gprn);
>   }
>   
>   void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn)
> @@ -164,8 +156,6 @@ void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn)
>       gen_load_spr(t0, SPR_POWER_MMCR2);
>       tcg_gen_andi_tl(t0, t0, MMCR2_UREG_MASK);
>       tcg_gen_mov_tl(cpu_gpr[gprn], t0);
> -
> -    tcg_temp_free(t0);
>   }
>   
>   void spr_write_MMCR2_ureg(DisasContext *ctx, int sprn, int gprn)
> @@ -183,8 +173,6 @@ void spr_write_MMCR2_ureg(DisasContext *ctx, int sprn, int gprn)
>       masked_gprn = masked_gprn_for_spr_write(gprn, SPR_POWER_MMCR2,
>                                               MMCR2_UREG_MASK);
>       gen_store_spr(SPR_POWER_MMCR2, masked_gprn);
> -
> -    tcg_temp_free(masked_gprn);
>   }
>   
>   void spr_read_PMC(DisasContext *ctx, int gprn, int sprn)
> @@ -193,8 +181,6 @@ void spr_read_PMC(DisasContext *ctx, int gprn, int sprn)
>   
>       gen_icount_io_start(ctx);
>       gen_helper_read_pmc(cpu_gpr[gprn], cpu_env, t_sprn);
> -
> -    tcg_temp_free_i32(t_sprn);
>   }
>   
>   void spr_read_PMC14_ureg(DisasContext *ctx, int gprn, int sprn)
> @@ -228,8 +214,6 @@ void spr_write_PMC(DisasContext *ctx, int sprn, int gprn)
>   
>       gen_icount_io_start(ctx);
>       gen_helper_store_pmc(cpu_env, t_sprn, cpu_gpr[gprn]);
> -
> -    tcg_temp_free_i32(t_sprn);
>   }
>   
>   void spr_write_PMC14_ureg(DisasContext *ctx, int sprn, int gprn)
> diff --git a/target/ppc/translate/dfp-impl.c.inc b/target/ppc/translate/dfp-impl.c.inc
> index f9f1d58d44..62911e04c7 100644
> --- a/target/ppc/translate/dfp-impl.c.inc
> +++ b/target/ppc/translate/dfp-impl.c.inc
> @@ -20,9 +20,6 @@ static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
>       if (unlikely(a->rc)) {                                   \
>           gen_set_cr1_from_fpscr(ctx);                         \
>       }                                                        \
> -    tcg_temp_free_ptr(rt);                                   \
> -    tcg_temp_free_ptr(ra);                                   \
> -    tcg_temp_free_ptr(rb);                                   \
>       return true;                                             \
>   }
>   
> @@ -36,8 +33,6 @@ static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
>       rb = gen_fprp_ptr(a->rb);                                \
>       gen_helper_##NAME(cpu_crf[a->bf],                        \
>                         cpu_env, ra, rb);                      \
> -    tcg_temp_free_ptr(ra);                                   \
> -    tcg_temp_free_ptr(rb);                                   \
>       return true;                                             \
>   }
>   
> @@ -50,7 +45,6 @@ static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
>       rb = gen_fprp_ptr(a->rb);                                \
>       gen_helper_##NAME(cpu_crf[a->bf],                        \
>                         cpu_env, tcg_constant_i32(a->uim), rb);\
> -    tcg_temp_free_ptr(rb);                                   \
>       return true;                                             \
>   }
>   
> @@ -63,7 +57,6 @@ static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
>       ra = gen_fprp_ptr(a->fra);                               \
>       gen_helper_##NAME(cpu_crf[a->bf],                        \
>                         cpu_env, ra, tcg_constant_i32(a->dm)); \
> -    tcg_temp_free_ptr(ra);                                   \
>       return true;                                             \
>   }
>   
> @@ -81,8 +74,6 @@ static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
>       if (unlikely(a->rc)) {                                   \
>           gen_set_cr1_from_fpscr(ctx);                         \
>       }                                                        \
> -    tcg_temp_free_ptr(rt);                                   \
> -    tcg_temp_free_ptr(rb);                                   \
>       return true;                                             \
>   }
>   
> @@ -100,9 +91,6 @@ static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
>       if (unlikely(a->rc)) {                                   \
>           gen_set_cr1_from_fpscr(ctx);                         \
>       }                                                        \
> -    tcg_temp_free_ptr(rt);                                   \
> -    tcg_temp_free_ptr(ra);                                   \
> -    tcg_temp_free_ptr(rb);                                   \
>       return true;                                             \
>   }
>   
> @@ -118,8 +106,6 @@ static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
>       if (unlikely(a->rc)) {                                   \
>           gen_set_cr1_from_fpscr(ctx);                         \
>       }                                                        \
> -    tcg_temp_free_ptr(rt);                                   \
> -    tcg_temp_free_ptr(rb);                                   \
>       return true;                                             \
>   }
>   
> @@ -136,8 +122,6 @@ static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
>       if (unlikely(a->rc)) {                                   \
>           gen_set_cr1_from_fpscr(ctx);                         \
>       }                                                        \
> -    tcg_temp_free_ptr(rt);                                   \
> -    tcg_temp_free_ptr(rx);                                   \
>       return true;                                             \
>   }
>   
> @@ -205,8 +189,6 @@ static bool trans_DCFFIXQQ(DisasContext *ctx, arg_DCFFIXQQ *a)
>       rt = gen_fprp_ptr(a->frtp);
>       rb = gen_avr_ptr(a->vrb);
>       gen_helper_DCFFIXQQ(cpu_env, rt, rb);
> -    tcg_temp_free_ptr(rt);
> -    tcg_temp_free_ptr(rb);
>   
>       return true;
>   }
> @@ -222,8 +204,6 @@ static bool trans_DCTFIXQQ(DisasContext *ctx, arg_DCTFIXQQ *a)
>       rt = gen_avr_ptr(a->vrt);
>       rb = gen_fprp_ptr(a->frbp);
>       gen_helper_DCTFIXQQ(cpu_env, rt, rb);
> -    tcg_temp_free_ptr(rt);
> -    tcg_temp_free_ptr(rb);
>   
>       return true;
>   }
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
> index 1ba56cbed5..20ea484c3d 100644
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -42,8 +42,6 @@ static bool do_ldst(DisasContext *ctx, int rt, int ra, TCGv displ, bool update,
>       if (update) {
>           tcg_gen_mov_tl(cpu_gpr[ra], ea);
>       }
> -    tcg_temp_free(ea);
> -
>       return true;
>   }
>   
> @@ -149,7 +147,6 @@ static bool do_ldst_quad(DisasContext *ctx, arg_D *a, bool store, bool prefixed)
>               tcg_gen_qemu_ld_i64(high_addr_gpr, ea, ctx->mem_idx, mop);
>           }
>       }
> -    tcg_temp_free(ea);
>   #else
>       qemu_build_not_reached();
>   #endif
> @@ -389,8 +386,6 @@ static bool do_set_bool_cond(DisasContext *ctx, arg_X_bi *a, bool neg, bool rev)
>       if (neg) {
>           tcg_gen_neg_tl(cpu_gpr[a->rt], cpu_gpr[a->rt]);
>       }
> -    tcg_temp_free(temp);
> -
>       return true;
>   }
>   
> @@ -437,9 +432,6 @@ static void do_cntzdm(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 mask, int64_t trail)
>       }
>   
>       tcg_gen_ctpop_i64(dst, t0);
> -
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
>   }
>   
>   static bool trans_CNTLZDM(DisasContext *ctx, arg_X *a)
> @@ -519,11 +511,6 @@ static bool trans_ADDG6S(DisasContext *ctx, arg_X *a)
>   
>       tcg_gen_xori_tl(carry, carry, (target_long)carry_bits);
>       tcg_gen_muli_tl(cpu_gpr[a->rt], carry, 6);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    tcg_temp_free(carry);
> -
>       return true;
>   }
>   
> @@ -564,9 +551,6 @@ static bool do_hash(DisasContext *ctx, arg_X *a, bool priv,
>   
>       ea = do_ea_calc(ctx, a->ra, tcg_constant_tl(a->rt));
>       helper(cpu_env, ea, cpu_gpr[a->ra], cpu_gpr[a->rb]);
> -
> -    tcg_temp_free(ea);
> -
>       return true;
>   }
>   
> diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
> index 8d5cf0f982..d5d88e7d49 100644
> --- a/target/ppc/translate/fp-impl.c.inc
> +++ b/target/ppc/translate/fp-impl.c.inc
> @@ -21,7 +21,6 @@ static void gen_set_cr1_from_fpscr(DisasContext *ctx)
>       TCGv_i32 tmp = tcg_temp_new_i32();
>       tcg_gen_trunc_tl_i32(tmp, cpu_fpscr);
>       tcg_gen_shri_i32(cpu_crf[1], tmp, 28);
> -    tcg_temp_free_i32(tmp);
>   }
>   #else
>   static void gen_set_cr1_from_fpscr(DisasContext *ctx)
> @@ -58,10 +57,6 @@ static void gen_f##name(DisasContext *ctx)                                    \
>       if (unlikely(Rc(ctx->opcode) != 0)) {                                     \
>           gen_set_cr1_from_fpscr(ctx);                                          \
>       }                                                                         \
> -    tcg_temp_free_i64(t0);                                                    \
> -    tcg_temp_free_i64(t1);                                                    \
> -    tcg_temp_free_i64(t2);                                                    \
> -    tcg_temp_free_i64(t3);                                                    \
>   }
>   
>   #define GEN_FLOAT_ACB(name, op2, set_fprf, type)                              \
> @@ -92,9 +87,6 @@ static void gen_f##name(DisasContext *ctx)                                    \
>       if (unlikely(Rc(ctx->opcode) != 0)) {                                     \
>           gen_set_cr1_from_fpscr(ctx);                                          \
>       }                                                                         \
> -    tcg_temp_free_i64(t0);                                                    \
> -    tcg_temp_free_i64(t1);                                                    \
> -    tcg_temp_free_i64(t2);                                                    \
>   }
>   #define GEN_FLOAT_AB(name, op2, inval, set_fprf, type)                        \
>   _GEN_FLOAT_AB(name, 0x3F, op2, inval, set_fprf, type);                        \
> @@ -124,9 +116,6 @@ static void gen_f##name(DisasContext *ctx)                                    \
>       if (unlikely(Rc(ctx->opcode) != 0)) {                                     \
>           gen_set_cr1_from_fpscr(ctx);                                          \
>       }                                                                         \
> -    tcg_temp_free_i64(t0);                                                    \
> -    tcg_temp_free_i64(t1);                                                    \
> -    tcg_temp_free_i64(t2);                                                    \
>   }
>   #define GEN_FLOAT_AC(name, op2, inval, set_fprf, type)                        \
>   _GEN_FLOAT_AC(name, 0x3F, op2, inval, set_fprf, type);                        \
> @@ -154,8 +143,6 @@ static void gen_f##name(DisasContext *ctx)                                    \
>       if (unlikely(Rc(ctx->opcode) != 0)) {                                     \
>           gen_set_cr1_from_fpscr(ctx);                                          \
>       }                                                                         \
> -    tcg_temp_free_i64(t0);                                                    \
> -    tcg_temp_free_i64(t1);                                                    \
>   }
>   
>   #define GEN_FLOAT_BS(name, op1, op2, set_fprf, type)                          \
> @@ -179,8 +166,6 @@ static void gen_f##name(DisasContext *ctx)                                    \
>       if (unlikely(Rc(ctx->opcode) != 0)) {                                     \
>           gen_set_cr1_from_fpscr(ctx);                                          \
>       }                                                                         \
> -    tcg_temp_free_i64(t0);                                                    \
> -    tcg_temp_free_i64(t1);                                                    \
>   }
>   
>   /* fadd - fadds */
> @@ -218,8 +203,6 @@ static void gen_frsqrtes(DisasContext *ctx)
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           gen_set_cr1_from_fpscr(ctx);
>       }
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
>   }
>   
>   static bool trans_FSEL(DisasContext *ctx, arg_A *a)
> @@ -242,11 +225,6 @@ static bool trans_FSEL(DisasContext *ctx, arg_A *a)
>       if (a->rc) {
>           gen_set_cr1_from_fpscr(ctx);
>       }
> -
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -    tcg_temp_free_i64(t2);
> -
>       return true;
>   }
>   
> @@ -273,10 +251,6 @@ static bool do_helper_fsqrt(DisasContext *ctx, arg_A_tb *a,
>       if (unlikely(a->rc != 0)) {
>           gen_set_cr1_from_fpscr(ctx);
>       }
> -
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -
>       return true;
>   }
>   
> @@ -343,8 +317,6 @@ static void gen_ftdiv(DisasContext *ctx)
>       get_fpr(t0, rA(ctx->opcode));
>       get_fpr(t1, rB(ctx->opcode));
>       gen_helper_ftdiv(cpu_crf[crfD(ctx->opcode)], t0, t1);
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
>   }
>   
>   static void gen_ftsqrt(DisasContext *ctx)
> @@ -357,7 +329,6 @@ static void gen_ftsqrt(DisasContext *ctx)
>       t0 = tcg_temp_new_i64();
>       get_fpr(t0, rB(ctx->opcode));
>       gen_helper_ftsqrt(cpu_crf[crfD(ctx->opcode)], t0);
> -    tcg_temp_free_i64(t0);
>   }
>   
>   
> @@ -381,10 +352,7 @@ static void gen_fcmpo(DisasContext *ctx)
>       get_fpr(t0, rA(ctx->opcode));
>       get_fpr(t1, rB(ctx->opcode));
>       gen_helper_fcmpo(cpu_env, t0, t1, crf);
> -    tcg_temp_free_i32(crf);
>       gen_helper_float_check_status(cpu_env);
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
>   }
>   
>   /* fcmpu */
> @@ -404,10 +372,7 @@ static void gen_fcmpu(DisasContext *ctx)
>       get_fpr(t0, rA(ctx->opcode));
>       get_fpr(t1, rB(ctx->opcode));
>       gen_helper_fcmpu(cpu_env, t0, t1, crf);
> -    tcg_temp_free_i32(crf);
>       gen_helper_float_check_status(cpu_env);
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
>   }
>   
>   /***                         Floating-point move                           ***/
> @@ -429,8 +394,6 @@ static void gen_fabs(DisasContext *ctx)
>       if (unlikely(Rc(ctx->opcode))) {
>           gen_set_cr1_from_fpscr(ctx);
>       }
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
>   }
>   
>   /* fmr  - fmr. */
> @@ -448,7 +411,6 @@ static void gen_fmr(DisasContext *ctx)
>       if (unlikely(Rc(ctx->opcode))) {
>           gen_set_cr1_from_fpscr(ctx);
>       }
> -    tcg_temp_free_i64(t0);
>   }
>   
>   /* fnabs */
> @@ -469,8 +431,6 @@ static void gen_fnabs(DisasContext *ctx)
>       if (unlikely(Rc(ctx->opcode))) {
>           gen_set_cr1_from_fpscr(ctx);
>       }
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
>   }
>   
>   /* fneg */
> @@ -491,8 +451,6 @@ static void gen_fneg(DisasContext *ctx)
>       if (unlikely(Rc(ctx->opcode))) {
>           gen_set_cr1_from_fpscr(ctx);
>       }
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
>   }
>   
>   /* fcpsgn: PowerPC 2.05 specification */
> @@ -516,9 +474,6 @@ static void gen_fcpsgn(DisasContext *ctx)
>       if (unlikely(Rc(ctx->opcode))) {
>           gen_set_cr1_from_fpscr(ctx);
>       }
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -    tcg_temp_free_i64(t2);
>   }
>   
>   static void gen_fmrgew(DisasContext *ctx)
> @@ -538,9 +493,6 @@ static void gen_fmrgew(DisasContext *ctx)
>       get_fpr(t0, rA(ctx->opcode));
>       tcg_gen_deposit_i64(t1, t0, b0, 0, 32);
>       set_fpr(rD(ctx->opcode), t1);
> -    tcg_temp_free_i64(b0);
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
>   }
>   
>   static void gen_fmrgow(DisasContext *ctx)
> @@ -559,9 +511,6 @@ static void gen_fmrgow(DisasContext *ctx)
>       get_fpr(t1, rA(ctx->opcode));
>       tcg_gen_deposit_i64(t2, t0, t1, 32, 32);
>       set_fpr(rD(ctx->opcode), t2);
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -    tcg_temp_free_i64(t2);
>   }
>   
>   /***                  Floating-Point status & ctrl register                ***/
> @@ -587,7 +536,6 @@ static void gen_mcrfs(DisasContext *ctx)
>       tcg_gen_trunc_tl_i32(cpu_crf[crfD(ctx->opcode)], tmp);
>       tcg_gen_andi_i32(cpu_crf[crfD(ctx->opcode)], cpu_crf[crfD(ctx->opcode)],
>                        0xf);
> -    tcg_temp_free(tmp);
>       tcg_gen_extu_tl_i64(tnew_fpscr, cpu_fpscr);
>       /* Only the exception bits (including FX) should be cleared if read */
>       tcg_gen_andi_i64(tnew_fpscr, tnew_fpscr,
> @@ -595,8 +543,6 @@ static void gen_mcrfs(DisasContext *ctx)
>       /* FEX and VX need to be updated, so don't set fpscr directly */
>       tmask = tcg_const_i32(1 << nibble);
>       gen_helper_store_fpscr(cpu_env, tnew_fpscr, tmask);
> -    tcg_temp_free_i32(tmask);
> -    tcg_temp_free_i64(tnew_fpscr);
>   }
>   
>   static TCGv_i64 place_from_fpscr(int rt, uint64_t mask)
> @@ -608,8 +554,6 @@ static TCGv_i64 place_from_fpscr(int rt, uint64_t mask)
>       tcg_gen_andi_i64(fpscr_masked, fpscr, mask);
>       set_fpr(rt, fpscr_masked);
>   
> -    tcg_temp_free_i64(fpscr_masked);
> -
>       return fpscr;
>   }
>   
> @@ -622,24 +566,17 @@ static void store_fpscr_masked(TCGv_i64 fpscr, uint64_t clear_mask,
>       tcg_gen_andi_i64(fpscr_masked, fpscr, ~clear_mask);
>       tcg_gen_or_i64(fpscr_masked, fpscr_masked, set_mask);
>       gen_helper_store_fpscr(cpu_env, fpscr_masked, st_mask);
> -
> -    tcg_temp_free_i64(fpscr_masked);
>   }
>   
>   static bool trans_MFFS(DisasContext *ctx, arg_X_t_rc *a)
>   {
> -    TCGv_i64 fpscr;
> -
>       REQUIRE_FPU(ctx);
>   
>       gen_reset_fpstatus();
> -    fpscr = place_from_fpscr(a->rt, UINT64_MAX);
> +    place_from_fpscr(a->rt, UINT64_MAX);
>       if (a->rc) {
>           gen_set_cr1_from_fpscr(ctx);
>       }
> -
> -    tcg_temp_free_i64(fpscr);
> -
>       return true;
>   }
>   
> @@ -653,9 +590,6 @@ static bool trans_MFFSCE(DisasContext *ctx, arg_X_t *a)
>       gen_reset_fpstatus();
>       fpscr = place_from_fpscr(a->rt, UINT64_MAX);
>       store_fpscr_masked(fpscr, FP_ENABLES, tcg_constant_i64(0), 0x0003);
> -
> -    tcg_temp_free_i64(fpscr);
> -
>       return true;
>   }
>   
> @@ -673,10 +607,6 @@ static bool trans_MFFSCRN(DisasContext *ctx, arg_X_tb *a)
>       gen_reset_fpstatus();
>       fpscr = place_from_fpscr(a->rt, FP_DRN | FP_ENABLES | FP_NI | FP_RN);
>       store_fpscr_masked(fpscr, FP_RN, t1, 0x0001);
> -
> -    tcg_temp_free_i64(t1);
> -    tcg_temp_free_i64(fpscr);
> -
>       return true;
>   }
>   
> @@ -694,10 +624,6 @@ static bool trans_MFFSCDRN(DisasContext *ctx, arg_X_tb *a)
>       gen_reset_fpstatus();
>       fpscr = place_from_fpscr(a->rt, FP_DRN | FP_ENABLES | FP_NI | FP_RN);
>       store_fpscr_masked(fpscr, FP_DRN, t1, 0x0100);
> -
> -    tcg_temp_free_i64(t1);
> -    tcg_temp_free_i64(fpscr);
> -
>       return true;
>   }
>   
> @@ -714,10 +640,6 @@ static bool trans_MFFSCRNI(DisasContext *ctx, arg_X_imm2 *a)
>       gen_reset_fpstatus();
>       fpscr = place_from_fpscr(a->rt, FP_DRN | FP_ENABLES | FP_NI | FP_RN);
>       store_fpscr_masked(fpscr, FP_RN, t1, 0x0001);
> -
> -    tcg_temp_free_i64(t1);
> -    tcg_temp_free_i64(fpscr);
> -
>       return true;
>   }
>   
> @@ -734,26 +656,16 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
>       gen_reset_fpstatus();
>       fpscr = place_from_fpscr(a->rt, FP_DRN | FP_ENABLES | FP_NI | FP_RN);
>       store_fpscr_masked(fpscr, FP_DRN, t1, 0x0100);
> -
> -    tcg_temp_free_i64(t1);
> -    tcg_temp_free_i64(fpscr);
> -
>       return true;
>   }
>   
>   static bool trans_MFFSL(DisasContext *ctx, arg_X_t *a)
>   {
> -    TCGv_i64 fpscr;
> -
>       REQUIRE_INSNS_FLAGS2(ctx, ISA300);
>       REQUIRE_FPU(ctx);
>   
>       gen_reset_fpstatus();
> -    fpscr = place_from_fpscr(a->rt,
> -        FP_DRN | FP_STATUS | FP_ENABLES | FP_NI | FP_RN);
> -
> -    tcg_temp_free_i64(fpscr);
> -
> +    place_from_fpscr(a->rt, FP_DRN | FP_STATUS | FP_ENABLES | FP_NI | FP_RN);
>       return true;
>   }
>   
> @@ -772,7 +684,6 @@ static void gen_mtfsb0(DisasContext *ctx)
>           TCGv_i32 t0;
>           t0 = tcg_const_i32(crb);
>           gen_helper_fpscr_clrbit(cpu_env, t0);
> -        tcg_temp_free_i32(t0);
>       }
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
> @@ -795,7 +706,6 @@ static void gen_mtfsb1(DisasContext *ctx)
>           TCGv_i32 t0;
>           t0 = tcg_const_i32(crb);
>           gen_helper_fpscr_setbit(cpu_env, t0);
> -        tcg_temp_free_i32(t0);
>       }
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
> @@ -831,14 +741,12 @@ static void gen_mtfsf(DisasContext *ctx)
>       t1 = tcg_temp_new_i64();
>       get_fpr(t1, rB(ctx->opcode));
>       gen_helper_store_fpscr(cpu_env, t1, t0);
> -    tcg_temp_free_i32(t0);
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
>           tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
>       }
>       /* We can raise a deferred exception */
>       gen_helper_fpscr_check_status(cpu_env);
> -    tcg_temp_free_i64(t1);
>   }
>   
>   /* mtfsfi */
> @@ -862,8 +770,6 @@ static void gen_mtfsfi(DisasContext *ctx)
>       t0 = tcg_const_i64(((uint64_t)FPIMM(ctx->opcode)) << (4 * sh));
>       t1 = tcg_const_i32(1 << sh);
>       gen_helper_store_fpscr(cpu_env, t0, t1);
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i32(t1);
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
>           tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
> @@ -877,7 +783,6 @@ static void gen_qemu_ld32fs(DisasContext *ctx, TCGv_i64 dest, TCGv addr)
>       TCGv_i32 tmp = tcg_temp_new_i32();
>       tcg_gen_qemu_ld_i32(tmp, addr, ctx->mem_idx, DEF_MEMOP(MO_UL));
>       gen_helper_todouble(dest, tmp);
> -    tcg_temp_free_i32(tmp);
>   }
>   
>   /* lfdepx (external PID lfdx) */
> @@ -896,8 +801,6 @@ static void gen_lfdepx(DisasContext *ctx)
>       gen_addr_reg_index(ctx, EA);
>       tcg_gen_qemu_ld_i64(t0, EA, PPC_TLB_EPID_LOAD, DEF_MEMOP(MO_UQ));
>       set_fpr(rD(ctx->opcode), t0);
> -    tcg_temp_free(EA);
> -    tcg_temp_free_i64(t0);
>   }
>   
>   /* lfdp */
> @@ -930,8 +833,6 @@ static void gen_lfdp(DisasContext *ctx)
>           gen_qemu_ld64_i64(ctx, t0, EA);
>           set_fpr(rD(ctx->opcode) + 1, t0);
>       }
> -    tcg_temp_free(EA);
> -    tcg_temp_free_i64(t0);
>   }
>   
>   /* lfdpx */
> @@ -964,8 +865,6 @@ static void gen_lfdpx(DisasContext *ctx)
>           gen_qemu_ld64_i64(ctx, t0, EA);
>           set_fpr(rD(ctx->opcode) + 1, t0);
>       }
> -    tcg_temp_free(EA);
> -    tcg_temp_free_i64(t0);
>   }
>   
>   /* lfiwax */
> @@ -986,9 +885,6 @@ static void gen_lfiwax(DisasContext *ctx)
>       gen_qemu_ld32s(ctx, t0, EA);
>       tcg_gen_ext_tl_i64(t1, t0);
>       set_fpr(rD(ctx->opcode), t1);
> -    tcg_temp_free(EA);
> -    tcg_temp_free(t0);
> -    tcg_temp_free_i64(t1);
>   }
>   
>   /* lfiwzx */
> @@ -1006,8 +902,6 @@ static void gen_lfiwzx(DisasContext *ctx)
>       gen_addr_reg_index(ctx, EA);
>       gen_qemu_ld32u_i64(ctx, t0, EA);
>       set_fpr(rD(ctx->opcode), t0);
> -    tcg_temp_free(EA);
> -    tcg_temp_free_i64(t0);
>   }
>   
>   #define GEN_STXF(name, stop, opc2, opc3, type)                                \
> @@ -1025,8 +919,6 @@ static void glue(gen_, name##x)(DisasContext *ctx)                            \
>       gen_addr_reg_index(ctx, EA);                                              \
>       get_fpr(t0, rS(ctx->opcode));                                             \
>       gen_qemu_##stop(ctx, t0, EA);                                             \
> -    tcg_temp_free(EA);                                                        \
> -    tcg_temp_free_i64(t0);                                                    \
>   }
>   
>   static void gen_qemu_st32fs(DisasContext *ctx, TCGv_i64 src, TCGv addr)
> @@ -1034,7 +926,6 @@ static void gen_qemu_st32fs(DisasContext *ctx, TCGv_i64 src, TCGv addr)
>       TCGv_i32 tmp = tcg_temp_new_i32();
>       gen_helper_tosingle(tmp, src);
>       tcg_gen_qemu_st_i32(tmp, addr, ctx->mem_idx, DEF_MEMOP(MO_UL));
> -    tcg_temp_free_i32(tmp);
>   }
>   
>   /* stfdepx (external PID lfdx) */
> @@ -1053,8 +944,6 @@ static void gen_stfdepx(DisasContext *ctx)
>       gen_addr_reg_index(ctx, EA);
>       get_fpr(t0, rD(ctx->opcode));
>       tcg_gen_qemu_st_i64(t0, EA, PPC_TLB_EPID_STORE, DEF_MEMOP(MO_UQ));
> -    tcg_temp_free(EA);
> -    tcg_temp_free_i64(t0);
>   }
>   
>   /* stfdp */
> @@ -1087,8 +976,6 @@ static void gen_stfdp(DisasContext *ctx)
>           get_fpr(t0, rD(ctx->opcode) + 1);
>           gen_qemu_st64_i64(ctx, t0, EA);
>       }
> -    tcg_temp_free(EA);
> -    tcg_temp_free_i64(t0);
>   }
>   
>   /* stfdpx */
> @@ -1121,8 +1008,6 @@ static void gen_stfdpx(DisasContext *ctx)
>           get_fpr(t0, rD(ctx->opcode) + 1);
>           gen_qemu_st64_i64(ctx, t0, EA);
>       }
> -    tcg_temp_free(EA);
> -    tcg_temp_free_i64(t0);
>   }
>   
>   /* Optional: */
> @@ -1131,7 +1016,6 @@ static inline void gen_qemu_st32fiw(DisasContext *ctx, TCGv_i64 arg1, TCGv arg2)
>       TCGv t0 = tcg_temp_new();
>       tcg_gen_trunc_i64_tl(t0, arg1),
>       gen_qemu_st32(ctx, t0, arg2);
> -    tcg_temp_free(t0);
>   }
>   /* stfiwx */
>   GEN_STXF(stfiw, st32fiw, 0x17, 0x1E, PPC_FLOAT_STFIWX);
> @@ -1169,8 +1053,6 @@ static bool do_lsfpsd(DisasContext *ctx, int rt, int ra, TCGv displ,
>       if (update) {
>           tcg_gen_mov_tl(cpu_gpr[ra], ea);
>       }
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free(ea);
>       return true;
>   }
>   
> diff --git a/target/ppc/translate/spe-impl.c.inc b/target/ppc/translate/spe-impl.c.inc
> index bd8963db2b..f4a858487d 100644
> --- a/target/ppc/translate/spe-impl.c.inc
> +++ b/target/ppc/translate/spe-impl.c.inc
> @@ -23,7 +23,6 @@ static inline void gen_evmra(DisasContext *ctx)
>   
>       /* spe_acc := tmp */
>       tcg_gen_st_i64(tmp, cpu_env, offsetof(CPUPPCState, spe_acc));
> -    tcg_temp_free_i64(tmp);
>   
>       /* rD := rA */
>       tcg_gen_mov_tl(cpu_gpr[rD(ctx->opcode)], cpu_gpr[rA(ctx->opcode)]);
> @@ -96,8 +95,6 @@ static inline void gen_##name(DisasContext *ctx)                              \
>       tcg_gen_trunc_tl_i32(t0, cpu_gprh[rA(ctx->opcode)]);                      \
>       tcg_opi(t0, t0, rB(ctx->opcode));                                         \
>       tcg_gen_extu_i32_tl(cpu_gprh[rD(ctx->opcode)], t0);                       \
> -                                                                              \
> -    tcg_temp_free_i32(t0);                                                    \
>   }
>   GEN_SPEOP_TCG_LOGIC_IMM2(evslwi, tcg_gen_shli_i32);
>   GEN_SPEOP_TCG_LOGIC_IMM2(evsrwiu, tcg_gen_shri_i32);
> @@ -122,8 +119,6 @@ static inline void gen_##name(DisasContext *ctx)                              \
>       tcg_gen_trunc_tl_i32(t0, cpu_gprh[rA(ctx->opcode)]);                      \
>       tcg_op(t0, t0);                                                           \
>       tcg_gen_extu_i32_tl(cpu_gprh[rD(ctx->opcode)], t0);                       \
> -                                                                              \
> -    tcg_temp_free_i32(t0);                                                    \
>   }
>   
>   GEN_SPEOP_ARITH1(evabs, tcg_gen_abs_i32);
> @@ -159,9 +154,6 @@ static inline void gen_##name(DisasContext *ctx)                              \
>       tcg_gen_trunc_tl_i32(t1, cpu_gprh[rB(ctx->opcode)]);                      \
>       tcg_op(t0, t0, t1);                                                       \
>       tcg_gen_extu_i32_tl(cpu_gprh[rD(ctx->opcode)], t0);                       \
> -                                                                              \
> -    tcg_temp_free_i32(t0);                                                    \
> -    tcg_temp_free_i32(t1);                                                    \
>   }
>   
>   static inline void gen_op_evsrwu(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
> @@ -178,7 +170,6 @@ static inline void gen_op_evsrwu(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
>       gen_set_label(l1);
>       tcg_gen_movi_i32(ret, 0);
>       gen_set_label(l2);
> -    tcg_temp_free_i32(t0);
>   }
>   GEN_SPEOP_ARITH2(evsrwu, gen_op_evsrwu);
>   static inline void gen_op_evsrws(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
> @@ -195,7 +186,6 @@ static inline void gen_op_evsrws(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
>       gen_set_label(l1);
>       tcg_gen_movi_i32(ret, 0);
>       gen_set_label(l2);
> -    tcg_temp_free_i32(t0);
>   }
>   GEN_SPEOP_ARITH2(evsrws, gen_op_evsrws);
>   static inline void gen_op_evslw(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
> @@ -212,7 +202,6 @@ static inline void gen_op_evslw(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
>       gen_set_label(l1);
>       tcg_gen_movi_i32(ret, 0);
>       gen_set_label(l2);
> -    tcg_temp_free_i32(t0);
>   }
>   GEN_SPEOP_ARITH2(evslw, gen_op_evslw);
>   static inline void gen_op_evrlw(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
> @@ -220,7 +209,6 @@ static inline void gen_op_evrlw(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
>       TCGv_i32 t0 = tcg_temp_new_i32();
>       tcg_gen_andi_i32(t0, arg2, 0x1F);
>       tcg_gen_rotl_i32(ret, arg1, t0);
> -    tcg_temp_free_i32(t0);
>   }
>   GEN_SPEOP_ARITH2(evrlw, gen_op_evrlw);
>   static inline void gen_evmergehi(DisasContext *ctx)
> @@ -257,8 +245,6 @@ static inline void gen_##name(DisasContext *ctx)                              \
>       tcg_gen_trunc_tl_i32(t0, cpu_gprh[rB(ctx->opcode)]);                      \
>       tcg_op(t0, t0, rA(ctx->opcode));                                          \
>       tcg_gen_extu_i32_tl(cpu_gprh[rD(ctx->opcode)], t0);                       \
> -                                                                              \
> -    tcg_temp_free_i32(t0);                                                    \
>   }
>   GEN_SPEOP_ARITH_IMM2(evaddiw, tcg_gen_addi_i32);
>   GEN_SPEOP_ARITH_IMM2(evsubifw, tcg_gen_subi_i32);
> @@ -341,7 +327,6 @@ static inline void gen_evmergelohi(DisasContext *ctx)
>           tcg_gen_mov_tl(tmp, cpu_gpr[rA(ctx->opcode)]);
>           tcg_gen_mov_tl(cpu_gpr[rD(ctx->opcode)], cpu_gprh[rB(ctx->opcode)]);
>           tcg_gen_mov_tl(cpu_gprh[rD(ctx->opcode)], tmp);
> -        tcg_temp_free(tmp);
>       } else {
>           tcg_gen_mov_tl(cpu_gpr[rD(ctx->opcode)], cpu_gprh[rB(ctx->opcode)]);
>           tcg_gen_mov_tl(cpu_gprh[rD(ctx->opcode)], cpu_gpr[rA(ctx->opcode)]);
> @@ -394,7 +379,6 @@ static inline void gen_evsel(DisasContext *ctx)
>       gen_set_label(l3);
>       tcg_gen_mov_tl(cpu_gpr[rD(ctx->opcode)], cpu_gpr[rB(ctx->opcode)]);
>       gen_set_label(l4);
> -    tcg_temp_free_i32(t0);
>   }
>   
>   static void gen_evsel0(DisasContext *ctx)
> @@ -456,9 +440,6 @@ static inline void gen_evmwumi(DisasContext *ctx)
>       tcg_gen_mul_i64(t0, t0, t1);  /* t0 := rA * rB */
>   
>       gen_store_gpr64(rD(ctx->opcode), t0); /* rD := t0 */
> -
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
>   }
>   
>   static inline void gen_evmwumia(DisasContext *ctx)
> @@ -477,7 +458,6 @@ static inline void gen_evmwumia(DisasContext *ctx)
>       /* acc := rD */
>       gen_load_gpr64(tmp, rD(ctx->opcode));
>       tcg_gen_st_i64(tmp, cpu_env, offsetof(CPUPPCState, spe_acc));
> -    tcg_temp_free_i64(tmp);
>   }
>   
>   static inline void gen_evmwumiaa(DisasContext *ctx)
> @@ -509,9 +489,6 @@ static inline void gen_evmwumiaa(DisasContext *ctx)
>   
>       /* rD := acc */
>       gen_store_gpr64(rD(ctx->opcode), acc);
> -
> -    tcg_temp_free_i64(acc);
> -    tcg_temp_free_i64(tmp);
>   }
>   
>   static inline void gen_evmwsmi(DisasContext *ctx)
> @@ -535,9 +512,6 @@ static inline void gen_evmwsmi(DisasContext *ctx)
>       tcg_gen_mul_i64(t0, t0, t1);  /* t0 := rA * rB */
>   
>       gen_store_gpr64(rD(ctx->opcode), t0); /* rD := t0 */
> -
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
>   }
>   
>   static inline void gen_evmwsmia(DisasContext *ctx)
> @@ -556,8 +530,6 @@ static inline void gen_evmwsmia(DisasContext *ctx)
>       /* acc := rD */
>       gen_load_gpr64(tmp, rD(ctx->opcode));
>       tcg_gen_st_i64(tmp, cpu_env, offsetof(CPUPPCState, spe_acc));
> -
> -    tcg_temp_free_i64(tmp);
>   }
>   
>   static inline void gen_evmwsmiaa(DisasContext *ctx)
> @@ -589,9 +561,6 @@ static inline void gen_evmwsmiaa(DisasContext *ctx)
>   
>       /* rD := acc */
>       gen_store_gpr64(rD(ctx->opcode), acc);
> -
> -    tcg_temp_free_i64(acc);
> -    tcg_temp_free_i64(tmp);
>   }
>   
>   GEN_SPE(evaddw,      speundef,    0x00, 0x08, 0x00000000, 0xFFFFFFFF, PPC_SPE); ////
> @@ -644,7 +613,6 @@ static inline void gen_op_evldd(DisasContext *ctx, TCGv addr)
>       TCGv_i64 t0 = tcg_temp_new_i64();
>       gen_qemu_ld64_i64(ctx, t0, addr);
>       gen_store_gpr64(rD(ctx->opcode), t0);
> -    tcg_temp_free_i64(t0);
>   }
>   
>   static inline void gen_op_evldw(DisasContext *ctx, TCGv addr)
> @@ -668,7 +636,6 @@ static inline void gen_op_evldh(DisasContext *ctx, TCGv addr)
>       gen_addr_add(ctx, addr, addr, 2);
>       gen_qemu_ld16u(ctx, t0, addr);
>       tcg_gen_or_tl(cpu_gpr[rD(ctx->opcode)], cpu_gpr[rD(ctx->opcode)], t0);
> -    tcg_temp_free(t0);
>   }
>   
>   static inline void gen_op_evlhhesplat(DisasContext *ctx, TCGv addr)
> @@ -678,7 +645,6 @@ static inline void gen_op_evlhhesplat(DisasContext *ctx, TCGv addr)
>       tcg_gen_shli_tl(t0, t0, 16);
>       tcg_gen_mov_tl(cpu_gprh[rD(ctx->opcode)], t0);
>       tcg_gen_mov_tl(cpu_gpr[rD(ctx->opcode)], t0);
> -    tcg_temp_free(t0);
>   }
>   
>   static inline void gen_op_evlhhousplat(DisasContext *ctx, TCGv addr)
> @@ -687,7 +653,6 @@ static inline void gen_op_evlhhousplat(DisasContext *ctx, TCGv addr)
>       gen_qemu_ld16u(ctx, t0, addr);
>       tcg_gen_mov_tl(cpu_gprh[rD(ctx->opcode)], t0);
>       tcg_gen_mov_tl(cpu_gpr[rD(ctx->opcode)], t0);
> -    tcg_temp_free(t0);
>   }
>   
>   static inline void gen_op_evlhhossplat(DisasContext *ctx, TCGv addr)
> @@ -696,7 +661,6 @@ static inline void gen_op_evlhhossplat(DisasContext *ctx, TCGv addr)
>       gen_qemu_ld16s(ctx, t0, addr);
>       tcg_gen_mov_tl(cpu_gprh[rD(ctx->opcode)], t0);
>       tcg_gen_mov_tl(cpu_gpr[rD(ctx->opcode)], t0);
> -    tcg_temp_free(t0);
>   }
>   
>   static inline void gen_op_evlwhe(DisasContext *ctx, TCGv addr)
> @@ -707,7 +671,6 @@ static inline void gen_op_evlwhe(DisasContext *ctx, TCGv addr)
>       gen_addr_add(ctx, addr, addr, 2);
>       gen_qemu_ld16u(ctx, t0, addr);
>       tcg_gen_shli_tl(cpu_gpr[rD(ctx->opcode)], t0, 16);
> -    tcg_temp_free(t0);
>   }
>   
>   static inline void gen_op_evlwhou(DisasContext *ctx, TCGv addr)
> @@ -730,7 +693,6 @@ static inline void gen_op_evlwwsplat(DisasContext *ctx, TCGv addr)
>       gen_qemu_ld32u(ctx, t0, addr);
>       tcg_gen_mov_tl(cpu_gprh[rD(ctx->opcode)], t0);
>       tcg_gen_mov_tl(cpu_gpr[rD(ctx->opcode)], t0);
> -    tcg_temp_free(t0);
>   }
>   
>   static inline void gen_op_evlwhsplat(DisasContext *ctx, TCGv addr)
> @@ -743,7 +705,6 @@ static inline void gen_op_evlwhsplat(DisasContext *ctx, TCGv addr)
>       gen_qemu_ld16u(ctx, t0, addr);
>       tcg_gen_shli_tl(cpu_gpr[rD(ctx->opcode)], t0, 16);
>       tcg_gen_or_tl(cpu_gpr[rD(ctx->opcode)], cpu_gprh[rD(ctx->opcode)], t0);
> -    tcg_temp_free(t0);
>   }
>   
>   static inline void gen_op_evstdd(DisasContext *ctx, TCGv addr)
> @@ -751,7 +712,6 @@ static inline void gen_op_evstdd(DisasContext *ctx, TCGv addr)
>       TCGv_i64 t0 = tcg_temp_new_i64();
>       gen_load_gpr64(t0, rS(ctx->opcode));
>       gen_qemu_st64_i64(ctx, t0, addr);
> -    tcg_temp_free_i64(t0);
>   }
>   
>   static inline void gen_op_evstdw(DisasContext *ctx, TCGv addr)
> @@ -771,7 +731,6 @@ static inline void gen_op_evstdh(DisasContext *ctx, TCGv addr)
>       gen_addr_add(ctx, addr, addr, 2);
>       tcg_gen_shri_tl(t0, cpu_gpr[rS(ctx->opcode)], 16);
>       gen_qemu_st16(ctx, t0, addr);
> -    tcg_temp_free(t0);
>       gen_addr_add(ctx, addr, addr, 2);
>       gen_qemu_st16(ctx, cpu_gpr[rS(ctx->opcode)], addr);
>   }
> @@ -784,7 +743,6 @@ static inline void gen_op_evstwhe(DisasContext *ctx, TCGv addr)
>       gen_addr_add(ctx, addr, addr, 2);
>       tcg_gen_shri_tl(t0, cpu_gpr[rS(ctx->opcode)], 16);
>       gen_qemu_st16(ctx, t0, addr);
> -    tcg_temp_free(t0);
>   }
>   
>   static inline void gen_op_evstwho(DisasContext *ctx, TCGv addr)
> @@ -820,7 +778,6 @@ static void glue(gen_, name)(DisasContext *ctx)                               \
>           gen_addr_reg_index(ctx, t0);                                          \
>       }                                                                         \
>       gen_op_##name(ctx, t0);                                                   \
> -    tcg_temp_free(t0);                                                        \
>   }
>   
>   GEN_SPEOP_LDST(evldd, 0x00, 3);
> @@ -923,7 +880,6 @@ static inline void gen_##name(DisasContext *ctx)                              \
>       tcg_gen_trunc_tl_i32(t0, cpu_gpr[rB(ctx->opcode)]);                       \
>       gen_helper_##name(t0, cpu_env, t0);                                       \
>       tcg_gen_extu_i32_tl(cpu_gpr[rD(ctx->opcode)], t0);                        \
> -    tcg_temp_free_i32(t0);                                                    \
>   }
>   #define GEN_SPEFPUOP_CONV_32_64(name)                                         \
>   static inline void gen_##name(DisasContext *ctx)                              \
> @@ -939,8 +895,6 @@ static inline void gen_##name(DisasContext *ctx)                              \
>       gen_load_gpr64(t0, rB(ctx->opcode));                                      \
>       gen_helper_##name(t1, cpu_env, t0);                                       \
>       tcg_gen_extu_i32_tl(cpu_gpr[rD(ctx->opcode)], t1);                        \
> -    tcg_temp_free_i64(t0);                                                    \
> -    tcg_temp_free_i32(t1);                                                    \
>   }
>   #define GEN_SPEFPUOP_CONV_64_32(name)                                         \
>   static inline void gen_##name(DisasContext *ctx)                              \
> @@ -956,8 +910,6 @@ static inline void gen_##name(DisasContext *ctx)                              \
>       tcg_gen_trunc_tl_i32(t1, cpu_gpr[rB(ctx->opcode)]);                       \
>       gen_helper_##name(t0, cpu_env, t1);                                       \
>       gen_store_gpr64(rD(ctx->opcode), t0);                                     \
> -    tcg_temp_free_i64(t0);                                                    \
> -    tcg_temp_free_i32(t1);                                                    \
>   }
>   #define GEN_SPEFPUOP_CONV_64_64(name)                                         \
>   static inline void gen_##name(DisasContext *ctx)                              \
> @@ -971,7 +923,6 @@ static inline void gen_##name(DisasContext *ctx)                              \
>       gen_load_gpr64(t0, rB(ctx->opcode));                                      \
>       gen_helper_##name(t0, cpu_env, t0);                                       \
>       gen_store_gpr64(rD(ctx->opcode), t0);                                     \
> -    tcg_temp_free_i64(t0);                                                    \
>   }
>   #define GEN_SPEFPUOP_ARITH2_32_32(name)                                       \
>   static inline void gen_##name(DisasContext *ctx)                              \
> @@ -982,9 +933,6 @@ static inline void gen_##name(DisasContext *ctx)                              \
>       tcg_gen_trunc_tl_i32(t1, cpu_gpr[rB(ctx->opcode)]);                       \
>       gen_helper_##name(t0, cpu_env, t0, t1);                                   \
>       tcg_gen_extu_i32_tl(cpu_gpr[rD(ctx->opcode)], t0);                        \
> -                                                                              \
> -    tcg_temp_free_i32(t0);                                                    \
> -    tcg_temp_free_i32(t1);                                                    \
>   }
>   #define GEN_SPEFPUOP_ARITH2_64_64(name)                                       \
>   static inline void gen_##name(DisasContext *ctx)                              \
> @@ -1000,8 +948,6 @@ static inline void gen_##name(DisasContext *ctx)                              \
>       gen_load_gpr64(t1, rB(ctx->opcode));                                      \
>       gen_helper_##name(t0, cpu_env, t0, t1);                                   \
>       gen_store_gpr64(rD(ctx->opcode), t0);                                     \
> -    tcg_temp_free_i64(t0);                                                    \
> -    tcg_temp_free_i64(t1);                                                    \
>   }
>   #define GEN_SPEFPUOP_COMP_32(name)                                            \
>   static inline void gen_##name(DisasContext *ctx)                              \
> @@ -1012,9 +958,6 @@ static inline void gen_##name(DisasContext *ctx)                              \
>       tcg_gen_trunc_tl_i32(t0, cpu_gpr[rA(ctx->opcode)]);                       \
>       tcg_gen_trunc_tl_i32(t1, cpu_gpr[rB(ctx->opcode)]);                       \
>       gen_helper_##name(cpu_crf[crfD(ctx->opcode)], cpu_env, t0, t1);           \
> -                                                                              \
> -    tcg_temp_free_i32(t0);                                                    \
> -    tcg_temp_free_i32(t1);                                                    \
>   }
>   #define GEN_SPEFPUOP_COMP_64(name)                                            \
>   static inline void gen_##name(DisasContext *ctx)                              \
> @@ -1029,8 +972,6 @@ static inline void gen_##name(DisasContext *ctx)                              \
>       gen_load_gpr64(t0, rA(ctx->opcode));                                      \
>       gen_load_gpr64(t1, rB(ctx->opcode));                                      \
>       gen_helper_##name(cpu_crf[crfD(ctx->opcode)], cpu_env, t0, t1);           \
> -    tcg_temp_free_i64(t0);                                                    \
> -    tcg_temp_free_i64(t1);                                                    \
>   }
>   
>   /* Single precision floating-point vectors operations */
> diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
> index 6ea1d22ef9..faa7b04bbc 100644
> --- a/target/ppc/translate/storage-ctrl-impl.c.inc
> +++ b/target/ppc/translate/storage-ctrl-impl.c.inc
> @@ -212,7 +212,6 @@ static bool do_tlbie(DisasContext *ctx, arg_X_tlbie *a, bool local)
>           TCGv t0 = tcg_temp_new();
>           tcg_gen_ext32u_tl(t0, cpu_gpr[rb]);
>           gen_helper_tlbie(cpu_env, t0);
> -        tcg_temp_free(t0);
>   
>   #if defined(TARGET_PPC64)
>       /*
> @@ -240,7 +239,6 @@ static bool do_tlbie(DisasContext *ctx, arg_X_tlbie *a, bool local)
>       tcg_gen_ld_i32(t1, cpu_env, offsetof(CPUPPCState, tlb_need_flush));
>       tcg_gen_ori_i32(t1, t1, TLB_NEED_GLOBAL_FLUSH);
>       tcg_gen_st_i32(t1, cpu_env, offsetof(CPUPPCState, tlb_need_flush));
> -    tcg_temp_free_i32(t1);
>   
>       return true;
>   #endif
> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
> index 2dd17ab106..05ba9c9492 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -45,8 +45,6 @@ static void glue(gen_, name)(DisasContext *ctx)                               \
>           gen_qemu_ld64_i64(ctx, avr, EA);                                      \
>           set_avr64(rD(ctx->opcode), avr, false);                               \
>       }                                                                         \
> -    tcg_temp_free(EA);                                                        \
> -    tcg_temp_free_i64(avr);                                                   \
>   }
>   
>   #define GEN_VR_STX(name, opc2, opc3)                                          \
> @@ -80,8 +78,6 @@ static void gen_st##name(DisasContext *ctx)                                   \
>           get_avr64(avr, rD(ctx->opcode), false);                               \
>           gen_qemu_st64_i64(ctx, avr, EA);                                      \
>       }                                                                         \
> -    tcg_temp_free(EA);                                                        \
> -    tcg_temp_free_i64(avr);                                                   \
>   }
>   
>   #define GEN_VR_LVE(name, opc2, opc3, size)                              \
> @@ -101,8 +97,6 @@ static void gen_lve##name(DisasContext *ctx)                            \
>           }                                                               \
>           rs = gen_avr_ptr(rS(ctx->opcode));                              \
>           gen_helper_lve##name(cpu_env, rs, EA);                          \
> -        tcg_temp_free(EA);                                              \
> -        tcg_temp_free_ptr(rs);                                          \
>       }
>   
>   #define GEN_VR_STVE(name, opc2, opc3, size)                             \
> @@ -122,8 +116,6 @@ static void gen_stve##name(DisasContext *ctx)                           \
>           }                                                               \
>           rs = gen_avr_ptr(rS(ctx->opcode));                              \
>           gen_helper_stve##name(cpu_env, rs, EA);                         \
> -        tcg_temp_free(EA);                                              \
> -        tcg_temp_free_ptr(rs);                                          \
>       }
>   
>   GEN_VR_LDX(lvx, 0x07, 0x03);
> @@ -157,8 +149,6 @@ static void gen_mfvscr(DisasContext *ctx)
>       gen_helper_mfvscr(t, cpu_env);
>       tcg_gen_extu_i32_i64(avr, t);
>       set_avr64(rD(ctx->opcode), avr, false);
> -    tcg_temp_free_i32(t);
> -    tcg_temp_free_i64(avr);
>   }
>   
>   static void gen_mtvscr(DisasContext *ctx)
> @@ -179,7 +169,6 @@ static void gen_mtvscr(DisasContext *ctx)
>   
>       tcg_gen_ld_i32(val, cpu_env, bofs);
>       gen_helper_mtvscr(cpu_env, val);
> -    tcg_temp_free_i32(val);
>   }
>   
>   #define GEN_VX_VMUL10(name, add_cin, ret_carry)                         \
> @@ -228,13 +217,6 @@ static void glue(gen_, name)(DisasContext *ctx)                         \
>           tcg_gen_add_i64(avr, t0, t2);                                   \
>           set_avr64(rD(ctx->opcode), avr, true);                          \
>       }                                                                   \
> -                                                                        \
> -    tcg_temp_free_i64(t0);                                              \
> -    tcg_temp_free_i64(t1);                                              \
> -    tcg_temp_free_i64(t2);                                              \
> -    tcg_temp_free_i64(avr);                                             \
> -    tcg_temp_free_i64(ten);                                             \
> -    tcg_temp_free_i64(z);                                               \
>   }                                                                       \
>   
>   GEN_VX_VMUL10(vmul10uq, 0, 0);
> @@ -279,9 +261,6 @@ static void glue(gen_, name)(DisasContext *ctx)                         \
>       rb = gen_avr_ptr(rB(ctx->opcode));                                  \
>       rd = gen_avr_ptr(rD(ctx->opcode));                                  \
>       gen_helper_##name(rd, ra, rb);                                      \
> -    tcg_temp_free_ptr(ra);                                              \
> -    tcg_temp_free_ptr(rb);                                              \
> -    tcg_temp_free_ptr(rd);                                              \
>   }
>   
>   #define GEN_VXFORM_TRANS(name, opc2, opc3)                              \
> @@ -306,9 +285,6 @@ static void glue(gen_, name)(DisasContext *ctx)                         \
>       rb = gen_avr_ptr(rB(ctx->opcode));                                  \
>       rd = gen_avr_ptr(rD(ctx->opcode));                                  \
>       gen_helper_##name(cpu_env, rd, ra, rb);                             \
> -    tcg_temp_free_ptr(ra);                                              \
> -    tcg_temp_free_ptr(rb);                                              \
> -    tcg_temp_free_ptr(rd);                                              \
>   }
>   
>   #define GEN_VXFORM3(name, opc2, opc3)                                   \
> @@ -324,10 +300,6 @@ static void glue(gen_, name)(DisasContext *ctx)                         \
>       rc = gen_avr_ptr(rC(ctx->opcode));                                  \
>       rd = gen_avr_ptr(rD(ctx->opcode));                                  \
>       gen_helper_##name(rd, ra, rb, rc);                                  \
> -    tcg_temp_free_ptr(ra);                                              \
> -    tcg_temp_free_ptr(rb);                                              \
> -    tcg_temp_free_ptr(rc);                                              \
> -    tcg_temp_free_ptr(rd);                                              \
>   }
>   
>   /*
> @@ -400,7 +372,6 @@ static void glue(gen_, name)(DisasContext *ctx)                         \
>       }                                                                   \
>       rb = gen_avr_ptr(rB(ctx->opcode));                                  \
>       gen_helper_##name(cpu_gpr[rD(ctx->opcode)], cpu_gpr[rA(ctx->opcode)], rb); \
> -    tcg_temp_free_ptr(rb);                                              \
>   }
>   
>   GEN_VXFORM_V(vaddubm, MO_8, tcg_gen_gvec_add, 0, 0);
> @@ -457,9 +428,6 @@ static void trans_vmrgew(DisasContext *ctx)
>       get_avr64(avr, VA, false);
>       tcg_gen_deposit_i64(avr, avr, tmp, 0, 32);
>       set_avr64(VT, avr, false);
> -
> -    tcg_temp_free_i64(tmp);
> -    tcg_temp_free_i64(avr);
>   }
>   
>   static void trans_vmrgow(DisasContext *ctx)
> @@ -480,10 +448,6 @@ static void trans_vmrgow(DisasContext *ctx)
>       get_avr64(t1, VA, false);
>       tcg_gen_deposit_i64(avr, t0, t1, 32, 32);
>       set_avr64(VT, avr, false);
> -
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -    tcg_temp_free_i64(avr);
>   }
>   
>   /*
> @@ -518,10 +482,6 @@ static void trans_lvsl(DisasContext *ctx)
>        */
>       tcg_gen_addi_i64(result, sh, 0x08090a0b0c0d0e0fULL);
>       set_avr64(VT, result, false);
> -
> -    tcg_temp_free_i64(result);
> -    tcg_temp_free_i64(sh);
> -    tcg_temp_free(EA);
>   }
>   
>   /*
> @@ -557,10 +517,6 @@ static void trans_lvsr(DisasContext *ctx)
>        */
>       tcg_gen_subfi_i64(result, 0x18191a1b1c1d1e1fULL, sh);
>       set_avr64(VT, result, false);
> -
> -    tcg_temp_free_i64(result);
> -    tcg_temp_free_i64(sh);
> -    tcg_temp_free(EA);
>   }
>   
>   /*
> @@ -603,11 +559,6 @@ static void trans_vsl(DisasContext *ctx)
>       tcg_gen_shl_i64(avr, avr, sh);
>       tcg_gen_or_i64(avr, avr, carry);
>       set_avr64(VT, avr, true);
> -
> -    tcg_temp_free_i64(avr);
> -    tcg_temp_free_i64(sh);
> -    tcg_temp_free_i64(carry);
> -    tcg_temp_free_i64(tmp);
>   }
>   
>   /*
> @@ -649,11 +600,6 @@ static void trans_vsr(DisasContext *ctx)
>       tcg_gen_shr_i64(avr, avr, sh);
>       tcg_gen_or_i64(avr, avr, carry);
>       set_avr64(VT, avr, false);
> -
> -    tcg_temp_free_i64(avr);
> -    tcg_temp_free_i64(sh);
> -    tcg_temp_free_i64(carry);
> -    tcg_temp_free_i64(tmp);
>   }
>   
>   /*
> @@ -722,13 +668,6 @@ static void trans_vgbbd(DisasContext *ctx)
>       for (j = 0; j < 2; j++) {
>           set_avr64(VT, result[j], j);
>       }
> -
> -    tcg_temp_free_i64(tmp);
> -    tcg_temp_free_i64(tcg_mask);
> -    tcg_temp_free_i64(result[0]);
> -    tcg_temp_free_i64(result[1]);
> -    tcg_temp_free_i64(avr[0]);
> -    tcg_temp_free_i64(avr[1]);
>   }
>   
>   /*
> @@ -753,8 +692,6 @@ static void trans_vclzw(DisasContext *ctx)
>           tcg_gen_st_i32(tmp, cpu_env,
>               offsetof(CPUPPCState, vsr[32 + VT].u64[0]) + i * 4);
>       }
> -
> -    tcg_temp_free_i32(tmp);
>   }
>   
>   /*
> @@ -779,8 +716,6 @@ static void trans_vclzd(DisasContext *ctx)
>       get_avr64(avr, VB, false);
>       tcg_gen_clzi_i64(avr, avr, 64);
>       set_avr64(VT, avr, false);
> -
> -    tcg_temp_free_i64(avr);
>   }
>   
>   GEN_VXFORM_V(vmuluwm, MO_32, tcg_gen_gvec_mul, 4, 2);
> @@ -849,9 +784,6 @@ static TCGv_vec do_vrl_mask_vec(unsigned vece, TCGv_vec vrb)
>       /* negate the mask */
>       tcg_gen_xor_vec(vece, t0, t0, t2);
>   
> -    tcg_temp_free_vec(t1);
> -    tcg_temp_free_vec(t2);
> -
>       return t0;
>   }
>   
> @@ -870,9 +802,6 @@ static void gen_vrlnm_vec(unsigned vece, TCGv_vec vrt, TCGv_vec vra,
>       /* Rotate and mask */
>       tcg_gen_rotlv_vec(vece, vrt, vra, n);
>       tcg_gen_and_vec(vece, vrt, vrt, mask);
> -
> -    tcg_temp_free_vec(n);
> -    tcg_temp_free_vec(mask);
>   }
>   
>   static bool do_vrlnm(DisasContext *ctx, arg_VX *a, int vece)
> @@ -926,10 +855,6 @@ static void gen_vrlmi_vec(unsigned vece, TCGv_vec vrt, TCGv_vec vra,
>       /* Rotate and insert */
>       tcg_gen_rotlv_vec(vece, tmp, vra, n);
>       tcg_gen_bitsel_vec(vece, vrt, mask, tmp, vrt);
> -
> -    tcg_temp_free_vec(n);
> -    tcg_temp_free_vec(tmp);
> -    tcg_temp_free_vec(mask);
>   }
>   
>   static bool do_vrlmi(DisasContext *ctx, arg_VX *a, int vece)
> @@ -1024,13 +949,6 @@ static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool right,
>       }
>       tcg_gen_or_i64(hi, hi, lo);
>       set_avr64(a->vrt, hi, !right);
> -
> -    tcg_temp_free_i64(hi);
> -    tcg_temp_free_i64(lo);
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -    tcg_temp_free_i64(n);
> -
>       return true;
>   }
>   
> @@ -1083,11 +1001,6 @@ static void do_vrlq_mask(TCGv_i64 mh, TCGv_i64 ml, TCGv_i64 b, TCGv_i64 e)
>   
>       tcg_gen_xor_i64(mh, mh, t0);
>       tcg_gen_xor_i64(ml, ml, t0);
> -
> -    tcg_temp_free_i64(th);
> -    tcg_temp_free_i64(tl);
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
>   }
>   
>   static bool do_vector_rotl_quad(DisasContext *ctx, arg_VX *a, bool mask,
> @@ -1149,14 +1062,6 @@ static bool do_vector_rotl_quad(DisasContext *ctx, arg_VX *a, bool mask,
>   
>       set_avr64(a->vrt, t0, true);
>       set_avr64(a->vrt, t1, false);
> -
> -    tcg_temp_free_i64(ah);
> -    tcg_temp_free_i64(al);
> -    tcg_temp_free_i64(vrb);
> -    tcg_temp_free_i64(n);
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -
>       return true;
>   }
>   
> @@ -1174,7 +1079,6 @@ static void glue(glue(gen_, NAME), _vec)(unsigned vece, TCGv_vec t,     \
>       glue(glue(tcg_gen_, SAT), _vec)(VECE, t, a, b);                     \
>       tcg_gen_cmp_vec(TCG_COND_NE, VECE, x, x, t);                        \
>       tcg_gen_or_vec(VECE, sat, sat, x);                                  \
> -    tcg_temp_free_vec(x);                                               \
>   }                                                                       \
>   static void glue(gen_, NAME)(DisasContext *ctx)                         \
>   {                                                                       \
> @@ -1266,9 +1170,6 @@ static void glue(gen_, name)(DisasContext *ctx)                         \
>           rb = gen_avr_ptr(rB(ctx->opcode));                              \
>           rd = gen_avr_ptr(rD(ctx->opcode));                              \
>           gen_helper_##opname(cpu_env, rd, ra, rb);                       \
> -        tcg_temp_free_ptr(ra);                                          \
> -        tcg_temp_free_ptr(rb);                                          \
> -        tcg_temp_free_ptr(rd);                                          \
>       }
>   
>   #define GEN_VXRFORM(name, opc2, opc3)                                \
> @@ -1325,10 +1226,6 @@ static void do_vcmp_rc(int vrt)
>   
>       tcg_gen_or_i64(tmp, set, clr);
>       tcg_gen_extrl_i64_i32(cpu_crf[6], tmp);
> -
> -    tcg_temp_free_i64(tmp);
> -    tcg_temp_free_i64(set);
> -    tcg_temp_free_i64(clr);
>   }
>   
>   static bool do_vcmp(DisasContext *ctx, arg_VC *a, TCGCond cond, int vece)
> @@ -1377,9 +1274,6 @@ static void gen_vcmpnez_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
>   
>       tcg_gen_or_vec(vece, t, t, t0);
>       tcg_gen_or_vec(vece, t, t, t1);
> -
> -    tcg_temp_free_vec(t0);
> -    tcg_temp_free_vec(t1);
>   }
>   
>   static bool do_vcmpnez(DisasContext *ctx, arg_VC *a, int vece)
> @@ -1453,11 +1347,6 @@ static bool trans_VCMPEQUQ(DisasContext *ctx, arg_VC *a)
>           tcg_gen_andi_i32(cpu_crf[6], cpu_crf[6], 0xa);
>           tcg_gen_xori_i32(cpu_crf[6], cpu_crf[6], 0x2);
>       }
> -
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -    tcg_temp_free_i64(t2);
> -
>       return true;
>   }
>   
> @@ -1489,11 +1378,6 @@ static bool do_vcmpgtq(DisasContext *ctx, arg_VC *a, bool sign)
>           tcg_gen_andi_i32(cpu_crf[6], cpu_crf[6], 0xa);
>           tcg_gen_xori_i32(cpu_crf[6], cpu_crf[6], 0x2);
>       }
> -
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -    tcg_temp_free_i64(t2);
> -
>       return true;
>   }
>   
> @@ -1536,9 +1420,6 @@ static bool do_vcmpq(DisasContext *ctx, arg_VX_bf *a, bool sign)
>       tcg_gen_br(done);
>   
>       gen_set_label(done);
> -    tcg_temp_free_i64(vra);
> -    tcg_temp_free_i64(vrb);
> -
>       return true;
>   }
>   
> @@ -1581,8 +1462,6 @@ static void glue(gen_, name)(DisasContext *ctx)                         \
>           rb = gen_avr_ptr(rB(ctx->opcode));                              \
>           rd = gen_avr_ptr(rD(ctx->opcode));                              \
>           gen_helper_##name(rd, rb);                                      \
> -        tcg_temp_free_ptr(rb);                                          \
> -        tcg_temp_free_ptr(rd);                                          \
>       }
>   
>   #define GEN_VXFORM_NOA_ENV(name, opc2, opc3)                            \
> @@ -1597,8 +1476,6 @@ static void glue(gen_, name)(DisasContext *ctx)                         \
>           rb = gen_avr_ptr(rB(ctx->opcode));                              \
>           rd = gen_avr_ptr(rD(ctx->opcode));                              \
>           gen_helper_##name(cpu_env, rd, rb);                             \
> -        tcg_temp_free_ptr(rb);                                          \
> -        tcg_temp_free_ptr(rd);                                          \
>       }
>   
>   #define GEN_VXFORM_NOA_2(name, opc2, opc3, opc4)                        \
> @@ -1612,8 +1489,6 @@ static void glue(gen_, name)(DisasContext *ctx)                         \
>           rb = gen_avr_ptr(rB(ctx->opcode));                              \
>           rd = gen_avr_ptr(rD(ctx->opcode));                              \
>           gen_helper_##name(rd, rb);                                      \
> -        tcg_temp_free_ptr(rb);                                          \
> -        tcg_temp_free_ptr(rd);                                          \
>       }
>   
>   #define GEN_VXFORM_NOA_3(name, opc2, opc3, opc4)                        \
> @@ -1626,7 +1501,6 @@ static void glue(gen_, name)(DisasContext *ctx)                         \
>           }                                                               \
>           rb = gen_avr_ptr(rB(ctx->opcode));                              \
>           gen_helper_##name(cpu_gpr[rD(ctx->opcode)], rb);                \
> -        tcg_temp_free_ptr(rb);                                          \
>       }
>   GEN_VXFORM_NOA(vupkhsb, 7, 8);
>   GEN_VXFORM_NOA(vupkhsh, 7, 9);
> @@ -1655,7 +1529,6 @@ static void gen_vprtyb_vec(unsigned vece, TCGv_vec t, TCGv_vec b)
>           tcg_gen_xor_vec(vece, b, tmp, b);
>       }
>       tcg_gen_and_vec(vece, t, b, tcg_constant_vec_matching(t, vece, 1));
> -    tcg_temp_free_vec(tmp);
>   }
>   
>   /* vprtybw */
> @@ -1750,9 +1623,6 @@ static void glue(gen_, name)(DisasContext *ctx)                         \
>           rb = gen_avr_ptr(rB(ctx->opcode));                              \
>           rd = gen_avr_ptr(rD(ctx->opcode));                              \
>           gen_helper_##name(cpu_env, rd, rb, uimm);                       \
> -        tcg_temp_free_i32(uimm);                                        \
> -        tcg_temp_free_ptr(rb);                                          \
> -        tcg_temp_free_ptr(rd);                                          \
>       }
>   
>   #define GEN_VXFORM_UIMM_SPLAT(name, opc2, opc3, splat_max)              \
> @@ -1773,9 +1643,6 @@ static void glue(gen_, name)(DisasContext *ctx)                         \
>           rb = gen_avr_ptr(rB(ctx->opcode));                              \
>           rd = gen_avr_ptr(rD(ctx->opcode));                              \
>           gen_helper_##name(rd, rb, t0);                                  \
> -        tcg_temp_free_i32(t0);                                          \
> -        tcg_temp_free_ptr(rb);                                          \
> -        tcg_temp_free_ptr(rd);                                          \
>       }
>   
>   GEN_VXFORM_VSPLT(vspltb, MO_8, 6, 8);
> @@ -1922,12 +1789,6 @@ static bool trans_VGNB(DisasContext *ctx, arg_VX_n *a)
>       tcg_gen_shri_i64(lo, lo, nbits);
>       tcg_gen_or_i64(hi, hi, lo);
>       tcg_gen_trunc_i64_tl(cpu_gpr[a->rt], hi);
> -
> -    tcg_temp_free_i64(hi);
> -    tcg_temp_free_i64(lo);
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -
>       return true;
>   }
>   
> @@ -1950,11 +1811,6 @@ static bool do_vextdx(DisasContext *ctx, arg_VA *a, int size, bool right,
>           tcg_gen_subfi_tl(rc, 32 - size, rc);
>       }
>       gen_helper(cpu_env, vrt, vra, vrb, rc);
> -
> -    tcg_temp_free_ptr(vrt);
> -    tcg_temp_free_ptr(vra);
> -    tcg_temp_free_ptr(vrb);
> -    tcg_temp_free(rc);
>       return true;
>   }
>   
> @@ -1983,31 +1839,22 @@ static bool do_vinsx(DisasContext *ctx, int vrt, int size, bool right, TCGv ra,
>       }
>   
>       gen_helper(cpu_env, t, rb, idx);
> -
> -    tcg_temp_free_ptr(t);
> -    tcg_temp_free(idx);
> -
>       return true;
>   }
>   
>   static bool do_vinsvx(DisasContext *ctx, int vrt, int size, bool right, TCGv ra,
>                   int vrb, void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv))
>   {
> -    bool ok;
>       TCGv_i64 val;
>   
>       val = tcg_temp_new_i64();
>       get_avr64(val, vrb, true);
> -    ok = do_vinsx(ctx, vrt, size, right, ra, val, gen_helper);
> -
> -    tcg_temp_free_i64(val);
> -    return ok;
> +    return do_vinsx(ctx, vrt, size, right, ra, val, gen_helper);
>   }
>   
>   static bool do_vinsx_VX(DisasContext *ctx, arg_VX *a, int size, bool right,
>                           void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv))
>   {
> -    bool ok;
>       TCGv_i64 val;
>   
>       REQUIRE_INSNS_FLAGS2(ctx, ISA310);
> @@ -2016,10 +1863,7 @@ static bool do_vinsx_VX(DisasContext *ctx, arg_VX *a, int size, bool right,
>       val = tcg_temp_new_i64();
>       tcg_gen_extu_tl_i64(val, cpu_gpr[a->vrb]);
>   
> -    ok = do_vinsx(ctx, a->vrt, size, right, cpu_gpr[a->vra], val, gen_helper);
> -
> -    tcg_temp_free_i64(val);
> -    return ok;
> +    return do_vinsx(ctx, a->vrt, size, right, cpu_gpr[a->vra], val, gen_helper);
>   }
>   
>   static bool do_vinsvx_VX(DisasContext *ctx, arg_VX *a, int size, bool right,
> @@ -2035,7 +1879,6 @@ static bool do_vinsvx_VX(DisasContext *ctx, arg_VX *a, int size, bool right,
>   static bool do_vins_VX_uim4(DisasContext *ctx, arg_VX_uim4 *a, int size,
>                           void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv))
>   {
> -    bool ok;
>       TCGv_i64 val;
>   
>       REQUIRE_INSNS_FLAGS2(ctx, ISA310);
> @@ -2059,11 +1902,8 @@ static bool do_vins_VX_uim4(DisasContext *ctx, arg_VX_uim4 *a, int size,
>       val = tcg_temp_new_i64();
>       tcg_gen_extu_tl_i64(val, cpu_gpr[a->vrb]);
>   
> -    ok = do_vinsx(ctx, a->vrt, size, false, tcg_constant_tl(a->uim), val,
> -                  gen_helper);
> -
> -    tcg_temp_free_i64(val);
> -    return ok;
> +    return do_vinsx(ctx, a->vrt, size, false, tcg_constant_tl(a->uim), val,
> +                    gen_helper);
>   }
>   
>   static bool do_vinsert_VX_uim4(DisasContext *ctx, arg_VX_uim4 *a, int size,
> @@ -2122,10 +1962,6 @@ static void gen_vsldoi(DisasContext *ctx)
>       rd = gen_avr_ptr(rD(ctx->opcode));
>       sh = tcg_const_i32(VSH(ctx->opcode));
>       gen_helper_vsldoi(rd, ra, rb, sh);
> -    tcg_temp_free_ptr(ra);
> -    tcg_temp_free_ptr(rb);
> -    tcg_temp_free_ptr(rd);
> -    tcg_temp_free_i32(sh);
>   }
>   
>   static bool trans_VSLDBI(DisasContext *ctx, arg_VN *a)
> @@ -2148,16 +1984,10 @@ static bool trans_VSLDBI(DisasContext *ctx, arg_VN *a)
>   
>           tcg_gen_extract2_i64(t0, t1, t0, 64 - a->sh);
>           tcg_gen_extract2_i64(t1, t2, t1, 64 - a->sh);
> -
> -        tcg_temp_free_i64(t2);
>       }
>   
>       set_avr64(a->vrt, t0, true);
>       set_avr64(a->vrt, t1, false);
> -
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -
>       return true;
>   }
>   
> @@ -2181,16 +2011,10 @@ static bool trans_VSRDBI(DisasContext *ctx, arg_VN *a)
>   
>           tcg_gen_extract2_i64(t0, t0, t1, a->sh);
>           tcg_gen_extract2_i64(t1, t1, t2, a->sh);
> -
> -        tcg_temp_free_i64(t2);
>       }
>   
>       set_avr64(a->vrt, t0, false);
>       set_avr64(a->vrt, t1, true);
> -
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -
>       return true;
>   }
>   
> @@ -2223,8 +2047,6 @@ static bool trans_VEXPANDQM(DisasContext *ctx, arg_VX_tb *a)
>       tcg_gen_sari_i64(tmp, tmp, 63);
>       set_avr64(a->vrt, tmp, false);
>       set_avr64(a->vrt, tmp, true);
> -
> -    tcg_temp_free_i64(tmp);
>       return true;
>   }
>   
> @@ -2278,12 +2100,6 @@ static bool do_vextractm(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
>       tcg_gen_shri_i64(hi, hi, 64 - elem_count_half);
>       tcg_gen_extract2_i64(lo, lo, hi, 64 - elem_count_half);
>       tcg_gen_trunc_i64_tl(cpu_gpr[a->vrt], lo);
> -
> -    tcg_temp_free_i64(hi);
> -    tcg_temp_free_i64(lo);
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -
>       return true;
>   }
>   
> @@ -2304,9 +2120,6 @@ static bool trans_VEXTRACTQM(DisasContext *ctx, arg_VX_tb *a)
>       get_avr64(tmp, a->vrb, true);
>       tcg_gen_shri_i64(tmp, tmp, 63);
>       tcg_gen_trunc_i64_tl(cpu_gpr[a->vrt], tmp);
> -
> -    tcg_temp_free_i64(tmp);
> -
>       return true;
>   }
>   
> @@ -2367,12 +2180,6 @@ static bool do_mtvsrm(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
>   
>       set_avr64(a->vrt, lo, false);
>       set_avr64(a->vrt, hi, true);
> -
> -    tcg_temp_free_i64(hi);
> -    tcg_temp_free_i64(lo);
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -
>       return true;
>   }
>   
> @@ -2394,9 +2201,6 @@ static bool trans_MTVSRQM(DisasContext *ctx, arg_VX_tb *a)
>       tcg_gen_sextract_i64(tmp, tmp, 0, 1);
>       set_avr64(a->vrt, tmp, false);
>       set_avr64(a->vrt, tmp, true);
> -
> -    tcg_temp_free_i64(tmp);
> -
>       return true;
>   }
>   
> @@ -2445,10 +2249,6 @@ static bool do_vcntmb(DisasContext *ctx, arg_VX_mp *a, int vece)
>   
>       tcg_gen_shli_i64(rt, rt, TARGET_LONG_BITS - 8 + vece);
>       tcg_gen_trunc_i64_tl(cpu_gpr[a->rt], rt);
> -
> -    tcg_temp_free_i64(vrb);
> -    tcg_temp_free_i64(rt);
> -
>       return true;
>   }
>   
> @@ -2473,12 +2273,7 @@ static bool do_vstri(DisasContext *ctx, arg_VX_tb_rc *a,
>       } else {
>           TCGv_i32 discard = tcg_temp_new_i32();
>           gen_helper(discard, vrt, vrb);
> -        tcg_temp_free_i32(discard);
>       }
> -
> -    tcg_temp_free_ptr(vrt);
> -    tcg_temp_free_ptr(vrb);
> -
>       return true;
>   }
>   
> @@ -2531,12 +2326,6 @@ static bool do_vclrb(DisasContext *ctx, arg_VX *a, bool right)
>       get_avr64(tmp, a->vra, false);
>       tcg_gen_and_i64(tmp, tmp, ml);
>       set_avr64(a->vrt, tmp, false);
> -
> -    tcg_temp_free_i64(rb);
> -    tcg_temp_free_i64(mh);
> -    tcg_temp_free_i64(ml);
> -    tcg_temp_free_i64(tmp);
> -
>       return true;
>   }
>   
> @@ -2560,10 +2349,6 @@ static void glue(gen_, name0##_##name1)(DisasContext *ctx)              \
>           } else {                                                        \
>               gen_helper_##name0(cpu_env, rd, ra, rb, rc);                \
>           }                                                               \
> -        tcg_temp_free_ptr(ra);                                          \
> -        tcg_temp_free_ptr(rb);                                          \
> -        tcg_temp_free_ptr(rc);                                          \
> -        tcg_temp_free_ptr(rd);                                          \
>       }
>   
>   GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23)
> @@ -2579,11 +2364,6 @@ static bool do_va_helper(DisasContext *ctx, arg_VA *a,
>       vrb = gen_avr_ptr(a->vrb);
>       vrc = gen_avr_ptr(a->rc);
>       gen_helper(vrt, vra, vrb, vrc);
> -    tcg_temp_free_ptr(vrt);
> -    tcg_temp_free_ptr(vra);
> -    tcg_temp_free_ptr(vrb);
> -    tcg_temp_free_ptr(vrc);
> -
>       return true;
>   }
>   
> @@ -2654,11 +2434,6 @@ static bool do_va_env_helper(DisasContext *ctx, arg_VA *a,
>       vrb = gen_avr_ptr(a->vrb);
>       vrc = gen_avr_ptr(a->rc);
>       gen_helper(cpu_env, vrt, vra, vrb, vrc);
> -    tcg_temp_free_ptr(vrt);
> -    tcg_temp_free_ptr(vra);
> -    tcg_temp_free_ptr(vrb);
> -    tcg_temp_free_ptr(vrc);
> -
>       return true;
>   }
>   
> @@ -2751,8 +2526,6 @@ static bool trans_VEXTSD2Q(DisasContext *ctx, arg_VX_tb *a)
>       set_avr64(a->vrt, tmp, false);
>       tcg_gen_sari_i64(tmp, tmp, 63);
>       set_avr64(a->vrt, tmp, true);
> -
> -    tcg_temp_free_i64(tmp);
>       return true;
>   }
>   
> @@ -2799,11 +2572,6 @@ static void gen_##op(DisasContext *ctx)             \
>       ps = tcg_const_i32((ctx->opcode & 0x200) != 0); \
>                                                       \
>       gen_helper_##op(cpu_crf[6], rd, ra, rb, ps);    \
> -                                                    \
> -    tcg_temp_free_ptr(ra);                          \
> -    tcg_temp_free_ptr(rb);                          \
> -    tcg_temp_free_ptr(rd);                          \
> -    tcg_temp_free_i32(ps);                          \
>   }
>   
>   #define GEN_BCD2(op)                                \
> @@ -2823,10 +2591,6 @@ static void gen_##op(DisasContext *ctx)             \
>       ps = tcg_const_i32((ctx->opcode & 0x200) != 0); \
>                                                       \
>       gen_helper_##op(cpu_crf[6], rd, rb, ps);        \
> -                                                    \
> -    tcg_temp_free_ptr(rb);                          \
> -    tcg_temp_free_ptr(rd);                          \
> -    tcg_temp_free_i32(ps);                          \
>   }
>   
>   GEN_BCD(bcdadd)
> @@ -2933,8 +2697,6 @@ static void gen_vsbox(DisasContext *ctx)
>       ra = gen_avr_ptr(rA(ctx->opcode));
>       rd = gen_avr_ptr(rD(ctx->opcode));
>       gen_helper_vsbox(rd, ra);
> -    tcg_temp_free_ptr(ra);
> -    tcg_temp_free_ptr(rd);
>   }
>   
>   GEN_VXFORM(vcipher, 4, 20)
> @@ -2960,9 +2722,6 @@ static void gen_##op(DisasContext *ctx)       \
>       rd = gen_avr_ptr(rD(ctx->opcode));        \
>       st_six = tcg_const_i32(rB(ctx->opcode));  \
>       gen_helper_##op(rd, ra, st_six);          \
> -    tcg_temp_free_ptr(ra);                    \
> -    tcg_temp_free_ptr(rd);                    \
> -    tcg_temp_free_i32(st_six);                \
>   }
>   
>   VSHASIGMA(vshasigmaw)
> @@ -3077,12 +2836,6 @@ static bool trans_VMSUMUDM(DisasContext *ctx, arg_VA *a)
>   
>       set_avr64(a->vrt, rl, false);
>       set_avr64(a->vrt, rh, true);
> -
> -    tcg_temp_free_i64(rl);
> -    tcg_temp_free_i64(rh);
> -    tcg_temp_free_i64(src1);
> -    tcg_temp_free_i64(src2);
> -
>       return true;
>   }
>   
> @@ -3128,14 +2881,6 @@ static bool trans_VMSUMCUD(DisasContext *ctx, arg_VA *a)
>       /* Discard 64 more bits to complete the CHOP128(temp >> 128) */
>       set_avr64(a->vrt, tmp0, false);
>       set_avr64(a->vrt, zero, true);
> -
> -    tcg_temp_free_i64(tmp0);
> -    tcg_temp_free_i64(tmp1);
> -    tcg_temp_free_i64(prod1h);
> -    tcg_temp_free_i64(prod1l);
> -    tcg_temp_free_i64(prod0h);
> -    tcg_temp_free_i64(prod0l);
> -
>       return true;
>   }
>   
> @@ -3149,10 +2894,6 @@ static bool do_vx_helper(DisasContext *ctx, arg_VX *a,
>       rb = gen_avr_ptr(a->vrb);
>       rd = gen_avr_ptr(a->vrt);
>       gen_helper(rd, ra, rb);
> -    tcg_temp_free_ptr(ra);
> -    tcg_temp_free_ptr(rb);
> -    tcg_temp_free_ptr(rd);
> -
>       return true;
>   }
>   
> @@ -3237,12 +2978,6 @@ static bool do_vx_vmuleo(DisasContext *ctx, arg_VX *a, bool even,
>       gen_mul(vrt0, vrt1, vra, vrb);
>       set_avr64(a->vrt, vrt0, false);
>       set_avr64(a->vrt, vrt1, true);
> -
> -    tcg_temp_free_i64(vra);
> -    tcg_temp_free_i64(vrb);
> -    tcg_temp_free_i64(vrt0);
> -    tcg_temp_free_i64(vrt1);
> -
>       return true;
>   }
>   
> @@ -3302,10 +3037,6 @@ static void do_vx_vmulhw_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, bool sign)
>   
>       tcg_gen_shri_i64(lh, lh, 32);
>       tcg_gen_deposit_i64(t, hh, lh, 0, 32);
> -
> -    tcg_temp_free_i64(hh);
> -    tcg_temp_free_i64(lh);
> -    tcg_temp_free_i64(temp);
>   }
>   
>   static void do_vx_vmulhd_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, bool sign)
> @@ -3318,8 +3049,6 @@ static void do_vx_vmulhd_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, bool sign)
>       } else {
>           tcg_gen_mulu2_i64(tlow, t, a, b);
>       }
> -
> -    tcg_temp_free_i64(tlow);
>   }
>   
>   static bool do_vx_mulh(DisasContext *ctx, arg_VX *a, bool sign,
> @@ -3344,13 +3073,7 @@ static bool do_vx_mulh(DisasContext *ctx, arg_VX *a, bool sign,
>   
>           set_avr64(a->vrt, vrt, i);
>       }
> -
> -    tcg_temp_free_i64(vra);
> -    tcg_temp_free_i64(vrb);
> -    tcg_temp_free_i64(vrt);
> -
>       return true;
> -
>   }
>   
>   TRANS(VMULHSW, do_vx_mulh, true , do_vx_vmulhw_i64)
> @@ -3368,7 +3091,6 @@ static void do_vavg(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b,
>       gen_shr_vec(vece, b, b, 1);
>       tcg_gen_add_vec(vece, t, a, b);
>       tcg_gen_add_vec(vece, t, t, tmp);
> -    tcg_temp_free_vec(tmp);
>   }
>   
>   QEMU_FLATTEN
> @@ -3538,8 +3260,6 @@ static void NAME(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)                    \
>       tcg_gen_movi_i32(t1, 0);                                            \
>       tcg_gen_movcond_i32(TCG_COND_NE, b, t0, t1, t0, b);                 \
>       DIV(t, a, b);                                                       \
> -    tcg_temp_free_i32(t0);                                              \
> -    tcg_temp_free_i32(t1);                                              \
>   }
>   
>   #define DIVU64(NAME, DIV)                                               \
> @@ -3564,8 +3284,6 @@ static void NAME(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)                    \
>       tcg_gen_movi_i64(t1, 0);                                            \
>       tcg_gen_movcond_i64(TCG_COND_NE, b, t0, t1, t0, b);                 \
>       DIV(t, a, b);                                                       \
> -    tcg_temp_free_i64(t0);                                              \
> -    tcg_temp_free_i64(t1);                                              \
>   }
>   
>   DIVS32(do_divsw, tcg_gen_div_i32)
> @@ -3596,9 +3314,6 @@ static void do_dives_i32(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
>   
>       /* if quotient doesn't fit in 32 bits the result is undefined */
>       tcg_gen_extrl_i64_i32(t, val1);
> -
> -    tcg_temp_free_i64(val1);
> -    tcg_temp_free_i64(val2);
>   }
>   
>   static void do_diveu_i32(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
> @@ -3617,9 +3332,6 @@ static void do_diveu_i32(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
>   
>       /* if quotient doesn't fit in 32 bits the result is undefined */
>       tcg_gen_extrl_i64_i32(t, val1);
> -
> -    tcg_temp_free_i64(val1);
> -    tcg_temp_free_i64(val2);
>   }
>   
>   DIVS32(do_divesw, do_dives_i32)
> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
> index 4deb29ee42..6e63403727 100644
> --- a/target/ppc/translate/vsx-impl.c.inc
> +++ b/target/ppc/translate/vsx-impl.c.inc
> @@ -40,8 +40,6 @@ static void gen_##name(DisasContext *ctx)                     \
>       gen_qemu_##operation(ctx, t0, EA);                        \
>       set_cpu_vsr(xT(ctx->opcode), t0, true);                   \
>       /* NOTE: cpu_vsrl is undefined */                         \
> -    tcg_temp_free(EA);                                        \
> -    tcg_temp_free_i64(t0);                                    \
>   }
>   
>   VSX_LOAD_SCALAR(lxsdx, ld64_i64)
> @@ -68,8 +66,6 @@ static void gen_lxvd2x(DisasContext *ctx)
>       tcg_gen_addi_tl(EA, EA, 8);
>       gen_qemu_ld64_i64(ctx, t0, EA);
>       set_cpu_vsr(xT(ctx->opcode), t0, false);
> -    tcg_temp_free(EA);
> -    tcg_temp_free_i64(t0);
>   }
>   
>   static void gen_lxvw4x(DisasContext *ctx)
> @@ -99,8 +95,6 @@ static void gen_lxvw4x(DisasContext *ctx)
>           tcg_gen_qemu_ld_i64(t0, EA, ctx->mem_idx, MO_LEUQ);
>           tcg_gen_shri_i64(t1, t0, 32);
>           tcg_gen_deposit_i64(xtl, t1, t0, 32, 32);
> -        tcg_temp_free_i64(t0);
> -        tcg_temp_free_i64(t1);
>       } else {
>           tcg_gen_qemu_ld_i64(xth, EA, ctx->mem_idx, MO_BEUQ);
>           tcg_gen_addi_tl(EA, EA, 8);
> @@ -108,9 +102,6 @@ static void gen_lxvw4x(DisasContext *ctx)
>       }
>       set_cpu_vsr(xT(ctx->opcode), xth, true);
>       set_cpu_vsr(xT(ctx->opcode), xtl, false);
> -    tcg_temp_free(EA);
> -    tcg_temp_free_i64(xth);
> -    tcg_temp_free_i64(xtl);
>   }
>   
>   static void gen_lxvwsx(DisasContext *ctx)
> @@ -138,9 +129,6 @@ static void gen_lxvwsx(DisasContext *ctx)
>       data = tcg_temp_new_i32();
>       tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, DEF_MEMOP(MO_UL));
>       tcg_gen_gvec_dup_i32(MO_UL, vsr_full_offset(xT(ctx->opcode)), 16, 16, data);
> -
> -    tcg_temp_free(EA);
> -    tcg_temp_free_i32(data);
>   }
>   
>   static void gen_lxvdsx(DisasContext *ctx)
> @@ -161,9 +149,6 @@ static void gen_lxvdsx(DisasContext *ctx)
>       data = tcg_temp_new_i64();
>       tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, DEF_MEMOP(MO_UQ));
>       tcg_gen_gvec_dup_i64(MO_UQ, vsr_full_offset(xT(ctx->opcode)), 16, 16, data);
> -
> -    tcg_temp_free(EA);
> -    tcg_temp_free_i64(data);
>   }
>   
>   static void gen_bswap16x8(TCGv_i64 outh, TCGv_i64 outl,
> @@ -186,10 +171,6 @@ static void gen_bswap16x8(TCGv_i64 outh, TCGv_i64 outl,
>       tcg_gen_shri_i64(t1, inl, 8);
>       tcg_gen_and_i64(t1, t1, mask);
>       tcg_gen_or_i64(outl, t0, t1);
> -
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -    tcg_temp_free_i64(mask);
>   }
>   
>   static void gen_bswap32x4(TCGv_i64 outh, TCGv_i64 outl,
> @@ -204,10 +185,8 @@ static void gen_bswap32x4(TCGv_i64 outh, TCGv_i64 outl,
>       tcg_gen_deposit_i64(outh, outh, hi, 32, 32);
>       tcg_gen_shri_i64(outl, lo, 32);
>       tcg_gen_deposit_i64(outl, outl, lo, 32, 32);
> -
> -    tcg_temp_free_i64(hi);
> -    tcg_temp_free_i64(lo);
>   }
> +
>   static void gen_lxvh8x(DisasContext *ctx)
>   {
>       TCGv EA;
> @@ -232,9 +211,6 @@ static void gen_lxvh8x(DisasContext *ctx)
>       }
>       set_cpu_vsr(xT(ctx->opcode), xth, true);
>       set_cpu_vsr(xT(ctx->opcode), xtl, false);
> -    tcg_temp_free(EA);
> -    tcg_temp_free_i64(xth);
> -    tcg_temp_free_i64(xtl);
>   }
>   
>   static void gen_lxvb16x(DisasContext *ctx)
> @@ -257,9 +233,6 @@ static void gen_lxvb16x(DisasContext *ctx)
>       tcg_gen_qemu_ld_i64(xtl, EA, ctx->mem_idx, MO_BEUQ);
>       set_cpu_vsr(xT(ctx->opcode), xth, true);
>       set_cpu_vsr(xT(ctx->opcode), xtl, false);
> -    tcg_temp_free(EA);
> -    tcg_temp_free_i64(xth);
> -    tcg_temp_free_i64(xtl);
>   }
>   
>   #ifdef TARGET_PPC64
> @@ -285,8 +258,6 @@ static void gen_##name(DisasContext *ctx)                          \
>       gen_set_access_type(ctx, ACCESS_INT);                          \
>       gen_addr_register(ctx, EA);                                    \
>       gen_helper_##name(cpu_env, EA, xt, cpu_gpr[rB(ctx->opcode)]);  \
> -    tcg_temp_free(EA);                                             \
> -    tcg_temp_free_ptr(xt);                                         \
>   }
>   
>   VSX_VECTOR_LOAD_STORE_LENGTH(lxvl)
> @@ -310,8 +281,6 @@ static void gen_##name(DisasContext *ctx)                     \
>       gen_addr_reg_index(ctx, EA);                              \
>       get_cpu_vsr(t0, xS(ctx->opcode), true);                   \
>       gen_qemu_##operation(ctx, t0, EA);                        \
> -    tcg_temp_free(EA);                                        \
> -    tcg_temp_free_i64(t0);                                    \
>   }
>   
>   VSX_STORE_SCALAR(stxsdx, st64_i64)
> @@ -338,8 +307,6 @@ static void gen_stxvd2x(DisasContext *ctx)
>       tcg_gen_addi_tl(EA, EA, 8);
>       get_cpu_vsr(t0, xS(ctx->opcode), false);
>       gen_qemu_st64_i64(ctx, t0, EA);
> -    tcg_temp_free(EA);
> -    tcg_temp_free_i64(t0);
>   }
>   
>   static void gen_stxvw4x(DisasContext *ctx)
> @@ -370,16 +337,11 @@ static void gen_stxvw4x(DisasContext *ctx)
>           tcg_gen_shri_i64(t0, xsl, 32);
>           tcg_gen_deposit_i64(t1, t0, xsl, 32, 32);
>           tcg_gen_qemu_st_i64(t1, EA, ctx->mem_idx, MO_LEUQ);
> -        tcg_temp_free_i64(t0);
> -        tcg_temp_free_i64(t1);
>       } else {
>           tcg_gen_qemu_st_i64(xsh, EA, ctx->mem_idx, MO_BEUQ);
>           tcg_gen_addi_tl(EA, EA, 8);
>           tcg_gen_qemu_st_i64(xsl, EA, ctx->mem_idx, MO_BEUQ);
>       }
> -    tcg_temp_free(EA);
> -    tcg_temp_free_i64(xsh);
> -    tcg_temp_free_i64(xsl);
>   }
>   
>   static void gen_stxvh8x(DisasContext *ctx)
> @@ -407,16 +369,11 @@ static void gen_stxvh8x(DisasContext *ctx)
>           tcg_gen_qemu_st_i64(outh, EA, ctx->mem_idx, MO_BEUQ);
>           tcg_gen_addi_tl(EA, EA, 8);
>           tcg_gen_qemu_st_i64(outl, EA, ctx->mem_idx, MO_BEUQ);
> -        tcg_temp_free_i64(outh);
> -        tcg_temp_free_i64(outl);
>       } else {
>           tcg_gen_qemu_st_i64(xsh, EA, ctx->mem_idx, MO_BEUQ);
>           tcg_gen_addi_tl(EA, EA, 8);
>           tcg_gen_qemu_st_i64(xsl, EA, ctx->mem_idx, MO_BEUQ);
>       }
> -    tcg_temp_free(EA);
> -    tcg_temp_free_i64(xsh);
> -    tcg_temp_free_i64(xsl);
>   }
>   
>   static void gen_stxvb16x(DisasContext *ctx)
> @@ -439,9 +396,6 @@ static void gen_stxvb16x(DisasContext *ctx)
>       tcg_gen_qemu_st_i64(xsh, EA, ctx->mem_idx, MO_BEUQ);
>       tcg_gen_addi_tl(EA, EA, 8);
>       tcg_gen_qemu_st_i64(xsl, EA, ctx->mem_idx, MO_BEUQ);
> -    tcg_temp_free(EA);
> -    tcg_temp_free_i64(xsh);
> -    tcg_temp_free_i64(xsl);
>   }
>   
>   static void gen_mfvsrwz(DisasContext *ctx)
> @@ -462,8 +416,6 @@ static void gen_mfvsrwz(DisasContext *ctx)
>       get_cpu_vsr(xsh, xS(ctx->opcode), true);
>       tcg_gen_ext32u_i64(tmp, xsh);
>       tcg_gen_trunc_i64_tl(cpu_gpr[rA(ctx->opcode)], tmp);
> -    tcg_temp_free_i64(tmp);
> -    tcg_temp_free_i64(xsh);
>   }
>   
>   static void gen_mtvsrwa(DisasContext *ctx)
> @@ -484,8 +436,6 @@ static void gen_mtvsrwa(DisasContext *ctx)
>       tcg_gen_extu_tl_i64(tmp, cpu_gpr[rA(ctx->opcode)]);
>       tcg_gen_ext32s_i64(xsh, tmp);
>       set_cpu_vsr(xT(ctx->opcode), xsh, true);
> -    tcg_temp_free_i64(tmp);
> -    tcg_temp_free_i64(xsh);
>   }
>   
>   static void gen_mtvsrwz(DisasContext *ctx)
> @@ -506,8 +456,6 @@ static void gen_mtvsrwz(DisasContext *ctx)
>       tcg_gen_extu_tl_i64(tmp, cpu_gpr[rA(ctx->opcode)]);
>       tcg_gen_ext32u_i64(xsh, tmp);
>       set_cpu_vsr(xT(ctx->opcode), xsh, true);
> -    tcg_temp_free_i64(tmp);
> -    tcg_temp_free_i64(xsh);
>   }
>   
>   #if defined(TARGET_PPC64)
> @@ -528,7 +476,6 @@ static void gen_mfvsrd(DisasContext *ctx)
>       t0 = tcg_temp_new_i64();
>       get_cpu_vsr(t0, xS(ctx->opcode), true);
>       tcg_gen_mov_i64(cpu_gpr[rA(ctx->opcode)], t0);
> -    tcg_temp_free_i64(t0);
>   }
>   
>   static void gen_mtvsrd(DisasContext *ctx)
> @@ -548,7 +495,6 @@ static void gen_mtvsrd(DisasContext *ctx)
>       t0 = tcg_temp_new_i64();
>       tcg_gen_mov_i64(t0, cpu_gpr[rA(ctx->opcode)]);
>       set_cpu_vsr(xT(ctx->opcode), t0, true);
> -    tcg_temp_free_i64(t0);
>   }
>   
>   static void gen_mfvsrld(DisasContext *ctx)
> @@ -568,7 +514,6 @@ static void gen_mfvsrld(DisasContext *ctx)
>       t0 = tcg_temp_new_i64();
>       get_cpu_vsr(t0, xS(ctx->opcode), false);
>       tcg_gen_mov_i64(cpu_gpr[rA(ctx->opcode)], t0);
> -    tcg_temp_free_i64(t0);
>   }
>   
>   static void gen_mtvsrdd(DisasContext *ctx)
> @@ -596,7 +541,6 @@ static void gen_mtvsrdd(DisasContext *ctx)
>   
>       tcg_gen_mov_i64(t0, cpu_gpr[rB(ctx->opcode)]);
>       set_cpu_vsr(xT(ctx->opcode), t0, false);
> -    tcg_temp_free_i64(t0);
>   }
>   
>   static void gen_mtvsrws(DisasContext *ctx)
> @@ -619,7 +563,6 @@ static void gen_mtvsrws(DisasContext *ctx)
>                           cpu_gpr[rA(ctx->opcode)], 32, 32);
>       set_cpu_vsr(xT(ctx->opcode), t0, false);
>       set_cpu_vsr(xT(ctx->opcode), t0, true);
> -    tcg_temp_free_i64(t0);
>   }
>   
>   #endif
> @@ -666,14 +609,11 @@ static void glue(gen_, name)(DisasContext *ctx)                   \
>                   tcg_gen_and_i64(xa, xa, sgm);                     \
>                   tcg_gen_andc_i64(xb, xb, sgm);                    \
>                   tcg_gen_or_i64(xb, xb, xa);                       \
> -                tcg_temp_free_i64(xa);                            \
>                   break;                                            \
>               }                                                     \
>           }                                                         \
>           set_cpu_vsr(xT(ctx->opcode), xb, true);                   \
>           set_cpu_vsr(xT(ctx->opcode), tcg_constant_i64(0), false); \
> -        tcg_temp_free_i64(xb);                                    \
> -        tcg_temp_free_i64(sgm);                                   \
>       }
>   
>   VSX_SCALAR_MOVE(xsabsdp, OP_ABS, SGN_MASK_DP)
> @@ -717,15 +657,10 @@ static void glue(gen_, name)(DisasContext *ctx)                   \
>           tcg_gen_and_i64(xah, tmp, sgm);                           \
>           tcg_gen_andc_i64(xbh, xbh, sgm);                          \
>           tcg_gen_or_i64(xbh, xbh, xah);                            \
> -        tcg_temp_free_i64(xah);                                   \
>           break;                                                    \
>       }                                                             \
>       set_cpu_vsr(xt, xbh, true);                                   \
>       set_cpu_vsr(xt, xbl, false);                                  \
> -    tcg_temp_free_i64(xbl);                                       \
> -    tcg_temp_free_i64(xbh);                                       \
> -    tcg_temp_free_i64(sgm);                                       \
> -    tcg_temp_free_i64(tmp);                                       \
>   }
>   
>   VSX_SCALAR_MOVE_QP(xsabsqp, OP_ABS, SGN_MASK_DP)
> @@ -870,11 +805,7 @@ static void gen_##name(DisasContext *ctx)                                     \
>       } else {                                                                  \
>           ignored = tcg_temp_new_i32();                                         \
>           gen_helper_##name(ignored, cpu_env, xt, xa, xb);                      \
> -        tcg_temp_free_i32(ignored);                                           \
>       }                                                                         \
> -    tcg_temp_free_ptr(xt);                                                    \
> -    tcg_temp_free_ptr(xa);                                                    \
> -    tcg_temp_free_ptr(xb);                                                    \
>   }
>   
>   VSX_CMP(xvcmpeqdp, 0x0C, 0x0C, 0, PPC2_VSX)
> @@ -899,10 +830,6 @@ static bool trans_XSCVQPDP(DisasContext *ctx, arg_X_tb_rc *a)
>       xt = gen_avr_ptr(a->rt);
>       xb = gen_avr_ptr(a->rb);
>       gen_helper_XSCVQPDP(cpu_env, ro, xt, xb);
> -    tcg_temp_free_i32(ro);
> -    tcg_temp_free_ptr(xt);
> -    tcg_temp_free_ptr(xb);
> -
>       return true;
>   }
>   
> @@ -917,9 +844,6 @@ static bool do_helper_env_X_tb(DisasContext *ctx, arg_X_tb *a,
>       xt = gen_avr_ptr(a->rt);
>       xb = gen_avr_ptr(a->rb);
>       gen_helper(cpu_env, xt, xb);
> -    tcg_temp_free_ptr(xt);
> -    tcg_temp_free_ptr(xb);
> -
>       return true;
>   }
>   
> @@ -938,7 +862,6 @@ static void gen_##name(DisasContext *ctx)                                     \
>       }                                                                         \
>       opc = tcg_const_i32(ctx->opcode);                                         \
>       gen_helper_##name(cpu_env, opc);                                          \
> -    tcg_temp_free_i32(opc);                                                   \
>   }
>   
>   #define GEN_VSX_HELPER_X3(name, op1, op2, inval, type)                        \
> @@ -953,9 +876,6 @@ static void gen_##name(DisasContext *ctx)                                     \
>       xa = gen_vsr_ptr(xA(ctx->opcode));                                        \
>       xb = gen_vsr_ptr(xB(ctx->opcode));                                        \
>       gen_helper_##name(cpu_env, xt, xa, xb);                                   \
> -    tcg_temp_free_ptr(xt);                                                    \
> -    tcg_temp_free_ptr(xa);                                                    \
> -    tcg_temp_free_ptr(xb);                                                    \
>   }
>   
>   #define GEN_VSX_HELPER_X2(name, op1, op2, inval, type)                        \
> @@ -969,8 +889,6 @@ static void gen_##name(DisasContext *ctx)                                     \
>       xt = gen_vsr_ptr(xT(ctx->opcode));                                        \
>       xb = gen_vsr_ptr(xB(ctx->opcode));                                        \
>       gen_helper_##name(cpu_env, xt, xb);                                       \
> -    tcg_temp_free_ptr(xt);                                                    \
> -    tcg_temp_free_ptr(xb);                                                    \
>   }
>   
>   #define GEN_VSX_HELPER_X2_AB(name, op1, op2, inval, type)                     \
> @@ -986,9 +904,6 @@ static void gen_##name(DisasContext *ctx)                                     \
>       xa = gen_vsr_ptr(xA(ctx->opcode));                                        \
>       xb = gen_vsr_ptr(xB(ctx->opcode));                                        \
>       gen_helper_##name(cpu_env, opc, xa, xb);                                  \
> -    tcg_temp_free_i32(opc);                                                   \
> -    tcg_temp_free_ptr(xa);                                                    \
> -    tcg_temp_free_ptr(xb);                                                    \
>   }
>   
>   #define GEN_VSX_HELPER_X1(name, op1, op2, inval, type)                        \
> @@ -1003,8 +918,6 @@ static void gen_##name(DisasContext *ctx)                                     \
>       opc = tcg_const_i32(ctx->opcode);                                         \
>       xb = gen_vsr_ptr(xB(ctx->opcode));                                        \
>       gen_helper_##name(cpu_env, opc, xb);                                      \
> -    tcg_temp_free_i32(opc);                                                   \
> -    tcg_temp_free_ptr(xb);                                                    \
>   }
>   
>   #define GEN_VSX_HELPER_R3(name, op1, op2, inval, type)                        \
> @@ -1021,10 +934,6 @@ static void gen_##name(DisasContext *ctx)                                     \
>       xa = gen_vsr_ptr(rA(ctx->opcode) + 32);                                   \
>       xb = gen_vsr_ptr(rB(ctx->opcode) + 32);                                   \
>       gen_helper_##name(cpu_env, opc, xt, xa, xb);                              \
> -    tcg_temp_free_i32(opc);                                                   \
> -    tcg_temp_free_ptr(xt);                                                    \
> -    tcg_temp_free_ptr(xa);                                                    \
> -    tcg_temp_free_ptr(xb);                                                    \
>   }
>   
>   #define GEN_VSX_HELPER_R2(name, op1, op2, inval, type)                        \
> @@ -1040,9 +949,6 @@ static void gen_##name(DisasContext *ctx)                                     \
>       xt = gen_vsr_ptr(rD(ctx->opcode) + 32);                                   \
>       xb = gen_vsr_ptr(rB(ctx->opcode) + 32);                                   \
>       gen_helper_##name(cpu_env, opc, xt, xb);                                  \
> -    tcg_temp_free_i32(opc);                                                   \
> -    tcg_temp_free_ptr(xt);                                                    \
> -    tcg_temp_free_ptr(xb);                                                    \
>   }
>   
>   #define GEN_VSX_HELPER_R2_AB(name, op1, op2, inval, type)                     \
> @@ -1058,9 +964,6 @@ static void gen_##name(DisasContext *ctx)                                     \
>       xa = gen_vsr_ptr(rA(ctx->opcode) + 32);                                   \
>       xb = gen_vsr_ptr(rB(ctx->opcode) + 32);                                   \
>       gen_helper_##name(cpu_env, opc, xa, xb);                                  \
> -    tcg_temp_free_i32(opc);                                                   \
> -    tcg_temp_free_ptr(xa);                                                    \
> -    tcg_temp_free_ptr(xb);                                                    \
>   }
>   
>   #define GEN_VSX_HELPER_XT_XB_ENV(name, op1, op2, inval, type) \
> @@ -1078,8 +981,6 @@ static void gen_##name(DisasContext *ctx)                     \
>       gen_helper_##name(t1, cpu_env, t0);                       \
>       set_cpu_vsr(xT(ctx->opcode), t1, true);                   \
>       set_cpu_vsr(xT(ctx->opcode), tcg_constant_i64(0), false); \
> -    tcg_temp_free_i64(t0);                                    \
> -    tcg_temp_free_i64(t1);                                    \
>   }
>   
>   GEN_VSX_HELPER_X3(xsadddp, 0x00, 0x04, 0, PPC2_VSX)
> @@ -1291,8 +1192,6 @@ static bool do_XX2_bf_uim(DisasContext *ctx, arg_XX2_bf_uim *a, bool vsr,
>       REQUIRE_VSX(ctx);
>       xb = vsr ? gen_vsr_ptr(a->xb) : gen_avr_ptr(a->xb);
>       gen_helper(cpu_env, tcg_constant_i32(a->bf), tcg_constant_i32(a->uim), xb);
> -    tcg_temp_free_ptr(xb);
> -
>       return true;
>   }
>   
> @@ -1314,9 +1213,6 @@ bool trans_XSCVSPDPN(DisasContext *ctx, arg_XX2 *a)
>   
>       set_cpu_vsr(a->xt, tmp, true);
>       set_cpu_vsr(a->xt, tcg_constant_i64(0), false);
> -
> -    tcg_temp_free_i64(tmp);
> -
>       return true;
>   }
>   
> @@ -1413,11 +1309,6 @@ static bool trans_XXPERM(DisasContext *ctx, arg_XX3 *a)
>       xb = gen_vsr_ptr(a->xb);
>   
>       gen_helper_VPERM(xt, xa, xt, xb);
> -
> -    tcg_temp_free_ptr(xt);
> -    tcg_temp_free_ptr(xa);
> -    tcg_temp_free_ptr(xb);
> -
>       return true;
>   }
>   
> @@ -1433,11 +1324,6 @@ static bool trans_XXPERMR(DisasContext *ctx, arg_XX3 *a)
>       xb = gen_vsr_ptr(a->xb);
>   
>       gen_helper_VPERMR(xt, xa, xt, xb);
> -
> -    tcg_temp_free_ptr(xt);
> -    tcg_temp_free_ptr(xa);
> -    tcg_temp_free_ptr(xb);
> -
>       return true;
>   }
>   
> @@ -1458,8 +1344,6 @@ static bool trans_XXPERMDI(DisasContext *ctx, arg_XX3_dm *a)
>   
>           set_cpu_vsr(a->xt, t0, true);
>           set_cpu_vsr(a->xt, t1, false);
> -
> -        tcg_temp_free_i64(t1);
>       } else {
>           get_cpu_vsr(t0, a->xa, (a->dm & 2) == 0);
>           set_cpu_vsr(a->xt, t0, true);
> @@ -1467,9 +1351,6 @@ static bool trans_XXPERMDI(DisasContext *ctx, arg_XX3_dm *a)
>           get_cpu_vsr(t0, a->xb, (a->dm & 1) == 0);
>           set_cpu_vsr(a->xt, t0, false);
>       }
> -
> -    tcg_temp_free_i64(t0);
> -
>       return true;
>   }
>   
> @@ -1486,12 +1367,6 @@ static bool trans_XXPERMX(DisasContext *ctx, arg_8RR_XX4_uim3 *a)
>       xc = gen_vsr_ptr(a->xc);
>   
>       gen_helper_XXPERMX(xt, xa, xb, xc, tcg_constant_tl(a->uim3));
> -
> -    tcg_temp_free_ptr(xt);
> -    tcg_temp_free_ptr(xa);
> -    tcg_temp_free_ptr(xb);
> -    tcg_temp_free_ptr(xc);
> -
>       return true;
>   }
>   
> @@ -1514,10 +1389,6 @@ static bool do_xxgenpcv(DisasContext *ctx, arg_X_imm5 *a,
>       vrb = gen_avr_ptr(a->vrb);
>   
>       fn[a->imm](xt, vrb);
> -
> -    tcg_temp_free_ptr(xt);
> -    tcg_temp_free_ptr(vrb);
> -
>       return true;
>   }
>   
> @@ -1550,12 +1421,6 @@ static bool do_xsmadd(DisasContext *ctx, int tgt, int src1, int src2, int src3,
>       s3 = gen_vsr_ptr(src3);
>   
>       gen_helper(cpu_env, t, s1, s2, s3);
> -
> -    tcg_temp_free_ptr(t);
> -    tcg_temp_free_ptr(s1);
> -    tcg_temp_free_ptr(s2);
> -    tcg_temp_free_ptr(s3);
> -
>       return true;
>   }
>   
> @@ -1636,10 +1501,6 @@ static void gen_##name(DisasContext *ctx)                                     \
>           s3 = gen_vsr_ptr(xB(ctx->opcode));                                    \
>       }                                                                         \
>       gen_helper_##name(cpu_env, xt, s1, s2, s3);                               \
> -    tcg_temp_free_ptr(xt);                                                    \
> -    tcg_temp_free_ptr(s1);                                                    \
> -    tcg_temp_free_ptr(s2);                                                    \
> -    tcg_temp_free_ptr(s3);                                                    \
>   }
>   
>   GEN_VSX_HELPER_VSX_MADD(xvmadddp, 0x04, 0x0C, 0x0D, 0, PPC2_VSX)
> @@ -1673,11 +1534,6 @@ static void gen_xxbrd(DisasContext *ctx)
>       tcg_gen_bswap64_i64(xtl, xbl);
>       set_cpu_vsr(xT(ctx->opcode), xth, true);
>       set_cpu_vsr(xT(ctx->opcode), xtl, false);
> -
> -    tcg_temp_free_i64(xth);
> -    tcg_temp_free_i64(xtl);
> -    tcg_temp_free_i64(xbh);
> -    tcg_temp_free_i64(xbl);
>   }
>   
>   static void gen_xxbrh(DisasContext *ctx)
> @@ -1701,11 +1557,6 @@ static void gen_xxbrh(DisasContext *ctx)
>       gen_bswap16x8(xth, xtl, xbh, xbl);
>       set_cpu_vsr(xT(ctx->opcode), xth, true);
>       set_cpu_vsr(xT(ctx->opcode), xtl, false);
> -
> -    tcg_temp_free_i64(xth);
> -    tcg_temp_free_i64(xtl);
> -    tcg_temp_free_i64(xbh);
> -    tcg_temp_free_i64(xbl);
>   }
>   
>   static void gen_xxbrq(DisasContext *ctx)
> @@ -1733,12 +1584,6 @@ static void gen_xxbrq(DisasContext *ctx)
>       set_cpu_vsr(xT(ctx->opcode), xtl, false);
>       tcg_gen_mov_i64(xth, t0);
>       set_cpu_vsr(xT(ctx->opcode), xth, true);
> -
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(xth);
> -    tcg_temp_free_i64(xtl);
> -    tcg_temp_free_i64(xbh);
> -    tcg_temp_free_i64(xbl);
>   }
>   
>   static void gen_xxbrw(DisasContext *ctx)
> @@ -1762,11 +1607,6 @@ static void gen_xxbrw(DisasContext *ctx)
>       gen_bswap32x4(xth, xtl, xbh, xbl);
>       set_cpu_vsr(xT(ctx->opcode), xth, true);
>       set_cpu_vsr(xT(ctx->opcode), xtl, false);
> -
> -    tcg_temp_free_i64(xth);
> -    tcg_temp_free_i64(xtl);
> -    tcg_temp_free_i64(xbh);
> -    tcg_temp_free_i64(xbl);
>   }
>   
>   #define VSX_LOGICAL(name, vece, tcg_op)                              \
> @@ -1813,11 +1653,6 @@ static void glue(gen_, name)(DisasContext *ctx)             \
>           set_cpu_vsr(xT(ctx->opcode), tmp, true);            \
>           tcg_gen_deposit_i64(tmp, b1, a1, 32, 32);           \
>           set_cpu_vsr(xT(ctx->opcode), tmp, false);           \
> -        tcg_temp_free_i64(a0);                              \
> -        tcg_temp_free_i64(a1);                              \
> -        tcg_temp_free_i64(b0);                              \
> -        tcg_temp_free_i64(b1);                              \
> -        tcg_temp_free_i64(tmp);                             \
>       }
>   
>   VSX_XXMRG(xxmrghw, 1)
> @@ -1974,13 +1809,6 @@ static bool trans_XVTLSBB(DisasContext *ctx, arg_XX2_bf_xb *a)
>   
>       tcg_gen_or_i64(t0, all_false, all_true);
>       tcg_gen_extrl_i64_i32(cpu_crf[a->bf], t0);
> -
> -    tcg_temp_free_i64(xb);
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -    tcg_temp_free_i64(all_true);
> -    tcg_temp_free_i64(all_false);
> -
>       return true;
>   }
>   
> @@ -2012,7 +1840,6 @@ static void gen_xxsldwi(DisasContext *ctx)
>               get_cpu_vsr(t0, xB(ctx->opcode), true);
>               tcg_gen_shri_i64(t0, t0, 32);
>               tcg_gen_or_i64(xtl, xtl, t0);
> -            tcg_temp_free_i64(t0);
>               break;
>           }
>           case 2: {
> @@ -2032,16 +1859,12 @@ static void gen_xxsldwi(DisasContext *ctx)
>               get_cpu_vsr(t0, xB(ctx->opcode), false);
>               tcg_gen_shri_i64(t0, t0, 32);
>               tcg_gen_or_i64(xtl, xtl, t0);
> -            tcg_temp_free_i64(t0);
>               break;
>           }
>       }
>   
>       set_cpu_vsr(xT(ctx->opcode), xth, true);
>       set_cpu_vsr(xT(ctx->opcode), xtl, false);
> -
> -    tcg_temp_free_i64(xth);
> -    tcg_temp_free_i64(xtl);
>   }
>   
>   static bool do_vsx_extract_insert(DisasContext *ctx, arg_XX2_uim *a,
> @@ -2064,10 +1887,7 @@ static bool do_vsx_extract_insert(DisasContext *ctx, arg_XX2_uim *a,
>           xt = gen_vsr_ptr(a->xt);
>           xb = gen_vsr_ptr(a->xb);
>           gen_helper(xt, xb, tcg_constant_i32(a->uim));
> -        tcg_temp_free_ptr(xb);
> -        tcg_temp_free_ptr(xt);
>       }
> -
>       return true;
>   }
>   
> @@ -2086,7 +1906,6 @@ static void gen_xsxexpdp(DisasContext *ctx)
>       t0 = tcg_temp_new_i64();
>       get_cpu_vsr(t0, xB(ctx->opcode), true);
>       tcg_gen_extract_i64(rt, t0, 52, 11);
> -    tcg_temp_free_i64(t0);
>   }
>   
>   static void gen_xsxexpqp(DisasContext *ctx)
> @@ -2108,10 +1927,6 @@ static void gen_xsxexpqp(DisasContext *ctx)
>       set_cpu_vsr(rD(ctx->opcode) + 32, xth, true);
>       tcg_gen_movi_i64(xtl, 0);
>       set_cpu_vsr(rD(ctx->opcode) + 32, xtl, false);
> -
> -    tcg_temp_free_i64(xbh);
> -    tcg_temp_free_i64(xth);
> -    tcg_temp_free_i64(xtl);
>   }
>   
>   static void gen_xsiexpdp(DisasContext *ctx)
> @@ -2133,8 +1948,6 @@ static void gen_xsiexpdp(DisasContext *ctx)
>       tcg_gen_or_i64(xth, xth, t0);
>       set_cpu_vsr(xT(ctx->opcode), xth, true);
>       set_cpu_vsr(xT(ctx->opcode), tcg_constant_i64(0), false);
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(xth);
>   }
>   
>   static void gen_xsiexpqp(DisasContext *ctx)
> @@ -2167,13 +1980,6 @@ static void gen_xsiexpqp(DisasContext *ctx)
>       set_cpu_vsr(rD(ctx->opcode) + 32, xth, true);
>       tcg_gen_mov_i64(xtl, xal);
>       set_cpu_vsr(rD(ctx->opcode) + 32, xtl, false);
> -
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(xth);
> -    tcg_temp_free_i64(xtl);
> -    tcg_temp_free_i64(xah);
> -    tcg_temp_free_i64(xal);
> -    tcg_temp_free_i64(xbh);
>   }
>   
>   static void gen_xsxsigdp(DisasContext *ctx)
> @@ -2198,12 +2004,6 @@ static void gen_xsxsigdp(DisasContext *ctx)
>       tcg_gen_movcond_i64(TCG_COND_EQ, t0, exp, nan, zr, t0);
>       get_cpu_vsr(t1, xB(ctx->opcode), true);
>       tcg_gen_deposit_i64(rt, t0, t1, 0, 52);
> -
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -    tcg_temp_free_i64(exp);
> -    tcg_temp_free_i64(zr);
> -    tcg_temp_free_i64(nan);
>   }
>   
>   static void gen_xsxsigqp(DisasContext *ctx)
> @@ -2237,15 +2037,6 @@ static void gen_xsxsigqp(DisasContext *ctx)
>       set_cpu_vsr(rD(ctx->opcode) + 32, xth, true);
>       tcg_gen_mov_i64(xtl, xbl);
>       set_cpu_vsr(rD(ctx->opcode) + 32, xtl, false);
> -
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(exp);
> -    tcg_temp_free_i64(zr);
> -    tcg_temp_free_i64(nan);
> -    tcg_temp_free_i64(xth);
> -    tcg_temp_free_i64(xtl);
> -    tcg_temp_free_i64(xbh);
> -    tcg_temp_free_i64(xbl);
>   }
>   #endif
>   
> @@ -2285,14 +2076,6 @@ static void gen_xviexpsp(DisasContext *ctx)
>       tcg_gen_shli_i64(t0, t0, 23);
>       tcg_gen_or_i64(xtl, xtl, t0);
>       set_cpu_vsr(xT(ctx->opcode), xtl, false);
> -
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(xth);
> -    tcg_temp_free_i64(xtl);
> -    tcg_temp_free_i64(xah);
> -    tcg_temp_free_i64(xal);
> -    tcg_temp_free_i64(xbh);
> -    tcg_temp_free_i64(xbl);
>   }
>   
>   static void gen_xviexpdp(DisasContext *ctx)
> @@ -2324,13 +2107,6 @@ static void gen_xviexpdp(DisasContext *ctx)
>   
>       tcg_gen_deposit_i64(xtl, xal, xbl, 52, 11);
>       set_cpu_vsr(xT(ctx->opcode), xtl, false);
> -
> -    tcg_temp_free_i64(xth);
> -    tcg_temp_free_i64(xtl);
> -    tcg_temp_free_i64(xah);
> -    tcg_temp_free_i64(xal);
> -    tcg_temp_free_i64(xbh);
> -    tcg_temp_free_i64(xbl);
>   }
>   
>   static void gen_xvxexpsp(DisasContext *ctx)
> @@ -2357,11 +2133,6 @@ static void gen_xvxexpsp(DisasContext *ctx)
>       tcg_gen_shri_i64(xtl, xbl, 23);
>       tcg_gen_andi_i64(xtl, xtl, 0xFF000000FF);
>       set_cpu_vsr(xT(ctx->opcode), xtl, false);
> -
> -    tcg_temp_free_i64(xth);
> -    tcg_temp_free_i64(xtl);
> -    tcg_temp_free_i64(xbh);
> -    tcg_temp_free_i64(xbl);
>   }
>   
>   static void gen_xvxexpdp(DisasContext *ctx)
> @@ -2386,11 +2157,6 @@ static void gen_xvxexpdp(DisasContext *ctx)
>       set_cpu_vsr(xT(ctx->opcode), xth, true);
>       tcg_gen_extract_i64(xtl, xbl, 52, 11);
>       set_cpu_vsr(xT(ctx->opcode), xtl, false);
> -
> -    tcg_temp_free_i64(xth);
> -    tcg_temp_free_i64(xtl);
> -    tcg_temp_free_i64(xbh);
> -    tcg_temp_free_i64(xbl);
>   }
>   
>   static bool trans_XVXSIGSP(DisasContext *ctx, arg_XX2 *a)
> @@ -2404,10 +2170,6 @@ static bool trans_XVXSIGSP(DisasContext *ctx, arg_XX2 *a)
>       b = gen_vsr_ptr(a->xb);
>   
>       gen_helper_XVXSIGSP(t, b);
> -
> -    tcg_temp_free_ptr(t);
> -    tcg_temp_free_ptr(b);
> -
>       return true;
>   }
>   
> @@ -2447,15 +2209,6 @@ static void gen_xvxsigdp(DisasContext *ctx)
>       tcg_gen_movcond_i64(TCG_COND_EQ, t0, exp, nan, zr, t0);
>       tcg_gen_deposit_i64(xtl, t0, xbl, 0, 52);
>       set_cpu_vsr(xT(ctx->opcode), xtl, false);
> -
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(exp);
> -    tcg_temp_free_i64(zr);
> -    tcg_temp_free_i64(nan);
> -    tcg_temp_free_i64(xth);
> -    tcg_temp_free_i64(xtl);
> -    tcg_temp_free_i64(xbh);
> -    tcg_temp_free_i64(xbl);
>   }
>   
>   static bool do_lstxv(DisasContext *ctx, int ra, TCGv displ,
> @@ -2510,9 +2263,6 @@ static bool do_lstxv(DisasContext *ctx, int ra, TCGv displ,
>               set_cpu_vsr(rt2, xt, ctx->le_mode);
>           }
>       }
> -
> -    tcg_temp_free(ea);
> -    tcg_temp_free_i64(xt);
>       return true;
>   }
>   
> @@ -2577,10 +2327,6 @@ static bool do_lstxsd(DisasContext *ctx, int rt, int ra, TCGv displ, bool store)
>           set_cpu_vsr(rt + 32, xt, true);
>           set_cpu_vsr(rt + 32, tcg_constant_i64(0), false);
>       }
> -
> -    tcg_temp_free(ea);
> -    tcg_temp_free_i64(xt);
> -
>       return true;
>   }
>   
> @@ -2620,10 +2366,6 @@ static bool do_lstxssp(DisasContext *ctx, int rt, int ra, TCGv displ, bool store
>           set_cpu_vsr(rt + 32, xt, true);
>           set_cpu_vsr(rt + 32, tcg_constant_i64(0), false);
>       }
> -
> -    tcg_temp_free(ea);
> -    tcg_temp_free_i64(xt);
> -
>       return true;
>   }
>   
> @@ -2684,9 +2426,6 @@ static bool do_lstrm(DisasContext *ctx, arg_X *a, MemOp mop, bool store)
>           set_cpu_vsr(a->rt, xt, false);
>           set_cpu_vsr(a->rt, tcg_constant_i64(0), true);
>       }
> -
> -    tcg_temp_free(ea);
> -    tcg_temp_free_i64(xt);
>       return true;
>   }
>   
> @@ -2741,9 +2480,6 @@ static void gen_xxeval_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, TCGv_i64 c,
>       }
>   
>       tcg_gen_mov_i64(t, disj);
> -
> -    tcg_temp_free_i64(conj);
> -    tcg_temp_free_i64(disj);
>   }
>   
>   static void gen_xxeval_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b,
> @@ -2788,9 +2524,6 @@ static void gen_xxeval_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b,
>       }
>   
>       tcg_gen_mov_vec(t, disj);
> -
> -    tcg_temp_free_vec(disj);
> -    tcg_temp_free_vec(conj);
>   }
>   
>   static bool trans_XXEVAL(DisasContext *ctx, arg_8RR_XX4_imm *a)
> @@ -2925,7 +2658,6 @@ static void gen_xxblendv_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b,
>       TCGv_vec tmp = tcg_temp_new_vec_matching(c);
>       tcg_gen_sari_vec(vece, tmp, c, (8 << vece) - 1);
>       tcg_gen_bitsel_vec(vece, t, tmp, b, a);
> -    tcg_temp_free_vec(tmp);
>   }
>   
>   static bool do_xxblendv(DisasContext *ctx, arg_8RR_XX4 *a, unsigned vece)
> @@ -2987,11 +2719,6 @@ static bool do_helper_XX3(DisasContext *ctx, arg_XX3 *a,
>       xb = gen_vsr_ptr(a->xb);
>   
>       helper(cpu_env, xt, xa, xb);
> -
> -    tcg_temp_free_ptr(xt);
> -    tcg_temp_free_ptr(xa);
> -    tcg_temp_free_ptr(xb);
> -
>       return true;
>   }
>   
> @@ -3013,11 +2740,6 @@ static bool do_helper_X(arg_X *a,
>       rb = gen_avr_ptr(a->rb);
>   
>       helper(cpu_env, rt, ra, rb);
> -
> -    tcg_temp_free_ptr(rt);
> -    tcg_temp_free_ptr(ra);
> -    tcg_temp_free_ptr(rb);
> -
>       return true;
>   }
>   
> @@ -3047,10 +2769,6 @@ static bool trans_XVCVSPBF16(DisasContext *ctx, arg_XX2 *a)
>       xb = gen_vsr_ptr(a->xb);
>   
>       gen_helper_XVCVSPBF16(cpu_env, xt, xb);
> -
> -    tcg_temp_free_ptr(xt);
> -    tcg_temp_free_ptr(xb);
> -
>       return true;
>   }
>   
> @@ -3114,9 +2832,6 @@ static bool do_ger(DisasContext *ctx, arg_MMIRR_XX3 *a,
>   
>       mask = ger_pack_masks(a->pmsk, a->ymsk, a->xmsk);
>       helper(cpu_env, xa, xb, xt, tcg_constant_i32(mask));
> -    tcg_temp_free_ptr(xt);
> -    tcg_temp_free_ptr(xa);
> -    tcg_temp_free_ptr(xb);
>       return true;
>   }
>   

