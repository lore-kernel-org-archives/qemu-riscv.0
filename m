Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWU2Q-0005wT-7c
	for mharc-qemu-riscv@gnu.org; Sun, 26 Feb 2023 22:18:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pWU2O-0005vt-TM; Sun, 26 Feb 2023 22:18:52 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>)
 id 1pWU2M-0007No-1Q; Sun, 26 Feb 2023 22:18:52 -0500
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8AxYcwTIfxjoPAFAA--.5669S3;
 Mon, 27 Feb 2023 11:18:43 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxyuYQIfxjhjg+AA--.12254S3; 
 Mon, 27 Feb 2023 11:18:40 +0800 (CST)
Subject: Re: [PATCH 32/76] target/loongarch: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, jiaxun.yang@flygoat.com, tsimpson@quicinc.com,
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-33-richard.henderson@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <4d50ee36-8add-7bf4-3c61-6ddcece8ce97@loongson.cn>
Date: Mon, 27 Feb 2023 11:18:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20230225091427.1817156-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8BxyuYQIfxjhjg+AA--.12254S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoW3Cw4Uur1UGw1ftw48GFy8Zrb_yoW8AF18Go
 W7JF1UGrWxGr1agFnYyas7JFW7Jr9Fgan3A39093WvgF4xAryUtFy8Jrs8Zay3GFn3WFyr
 Wa4SgFWDtrZ7Jr9rn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s
 0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
 M2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zV
 CFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2
 z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2
 IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxY
 O2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
 WUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
 Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rV
 WUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
 JbIYCTnIWIevJa73UjIFyTuYvjxU4AhLUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 39
X-Spam_score: 3.9
X-Spam_bar: +++
X-Spam_report: (3.9 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 27 Feb 2023 03:18:53 -0000


ÔÚ 2023/2/25 ÏÂÎç5:13, Richard Henderson Ð´µÀ:
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/loongarch/insn_trans/trans_arith.c.inc | 12 -------
>   .../loongarch/insn_trans/trans_atomic.c.inc   |  3 --
>   target/loongarch/insn_trans/trans_bit.c.inc   | 12 -------
>   target/loongarch/insn_trans/trans_fcmp.c.inc  |  3 --
>   .../loongarch/insn_trans/trans_fmemory.c.inc  | 20 ++---------
>   target/loongarch/insn_trans/trans_fmov.c.inc  |  6 ----
>   .../loongarch/insn_trans/trans_memory.c.inc   | 34 +++----------------
>   .../insn_trans/trans_privileged.c.inc         |  4 ---
>   target/loongarch/insn_trans/trans_shift.c.inc | 11 ------
>   9 files changed, 6 insertions(+), 99 deletions(-)
Reviewed-by: Song Gao <gaosong@loongson.cn>

Thanks.
Song Gao
> diff --git a/target/loongarch/insn_trans/trans_arith.c.inc b/target/loongarch/insn_trans/trans_arith.c.inc
> index 8e45eadbc8..43d6cf261d 100644
> --- a/target/loongarch/insn_trans/trans_arith.c.inc
> +++ b/target/loongarch/insn_trans/trans_arith.c.inc
> @@ -100,14 +100,12 @@ static void gen_mulh_d(TCGv dest, TCGv src1, TCGv src2)
>   {
>       TCGv discard = tcg_temp_new();
>       tcg_gen_muls2_tl(discard, dest, src1, src2);
> -    tcg_temp_free(discard);
>   }
>   
>   static void gen_mulh_du(TCGv dest, TCGv src1, TCGv src2)
>   {
>       TCGv discard = tcg_temp_new();
>       tcg_gen_mulu2_tl(discard, dest, src1, src2);
> -    tcg_temp_free(discard);
>   }
>   
>   static void prep_divisor_d(TCGv ret, TCGv src1, TCGv src2)
> @@ -129,9 +127,6 @@ static void prep_divisor_d(TCGv ret, TCGv src1, TCGv src2)
>       tcg_gen_and_tl(ret, ret, t0);
>       tcg_gen_or_tl(ret, ret, t1);
>       tcg_gen_movcond_tl(TCG_COND_NE, ret, ret, zero, ret, src2);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
>   }
>   
>   static void prep_divisor_du(TCGv ret, TCGv src2)
> @@ -152,7 +147,6 @@ static void gen_div_d(TCGv dest, TCGv src1, TCGv src2)
>       TCGv t0 = tcg_temp_new();
>       prep_divisor_d(t0, src1, src2);
>       tcg_gen_div_tl(dest, src1, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   static void gen_rem_d(TCGv dest, TCGv src1, TCGv src2)
> @@ -160,7 +154,6 @@ static void gen_rem_d(TCGv dest, TCGv src1, TCGv src2)
>       TCGv t0 = tcg_temp_new();
>       prep_divisor_d(t0, src1, src2);
>       tcg_gen_rem_tl(dest, src1, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   static void gen_div_du(TCGv dest, TCGv src1, TCGv src2)
> @@ -168,7 +161,6 @@ static void gen_div_du(TCGv dest, TCGv src1, TCGv src2)
>       TCGv t0 = tcg_temp_new();
>       prep_divisor_du(t0, src2);
>       tcg_gen_divu_tl(dest, src1, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   static void gen_rem_du(TCGv dest, TCGv src1, TCGv src2)
> @@ -176,7 +168,6 @@ static void gen_rem_du(TCGv dest, TCGv src1, TCGv src2)
>       TCGv t0 = tcg_temp_new();
>       prep_divisor_du(t0, src2);
>       tcg_gen_remu_tl(dest, src1, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   static void gen_div_w(TCGv dest, TCGv src1, TCGv src2)
> @@ -185,7 +176,6 @@ static void gen_div_w(TCGv dest, TCGv src1, TCGv src2)
>       /* We need not check for integer overflow for div_w. */
>       prep_divisor_du(t0, src2);
>       tcg_gen_div_tl(dest, src1, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   static void gen_rem_w(TCGv dest, TCGv src1, TCGv src2)
> @@ -194,7 +184,6 @@ static void gen_rem_w(TCGv dest, TCGv src1, TCGv src2)
>       /* We need not check for integer overflow for rem_w. */
>       prep_divisor_du(t0, src2);
>       tcg_gen_rem_tl(dest, src1, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   static void gen_alsl(TCGv dest, TCGv src1, TCGv src2, target_long sa)
> @@ -202,7 +191,6 @@ static void gen_alsl(TCGv dest, TCGv src1, TCGv src2, target_long sa)
>       TCGv t0 = tcg_temp_new();
>       tcg_gen_shli_tl(t0, src1, sa);
>       tcg_gen_add_tl(dest, t0, src2);
> -    tcg_temp_free(t0);
>   }
>   
>   static bool trans_lu32i_d(DisasContext *ctx, arg_lu32i_d *a)
> diff --git a/target/loongarch/insn_trans/trans_atomic.c.inc b/target/loongarch/insn_trans/trans_atomic.c.inc
> index 6763c1c301..612709f2a7 100644
> --- a/target/loongarch/insn_trans/trans_atomic.c.inc
> +++ b/target/loongarch/insn_trans/trans_atomic.c.inc
> @@ -14,7 +14,6 @@ static bool gen_ll(DisasContext *ctx, arg_rr_i *a, MemOp mop)
>       tcg_gen_st_tl(t0, cpu_env, offsetof(CPULoongArchState, lladdr));
>       tcg_gen_st_tl(dest, cpu_env, offsetof(CPULoongArchState, llval));
>       gen_set_gpr(a->rd, dest, EXT_NONE);
> -    tcg_temp_free(t0);
>   
>       return true;
>   }
> @@ -43,8 +42,6 @@ static bool gen_sc(DisasContext *ctx, arg_rr_i *a, MemOp mop)
>       tcg_gen_setcond_tl(TCG_COND_EQ, dest, t0, cpu_llval);
>       gen_set_label(done);
>       gen_set_gpr(a->rd, dest, EXT_NONE);
> -    tcg_temp_free(t0);
> -    tcg_temp_free(val);
>   
>       return true;
>   }
> diff --git a/target/loongarch/insn_trans/trans_bit.c.inc b/target/loongarch/insn_trans/trans_bit.c.inc
> index b01e4aeb23..25b4d7858b 100644
> --- a/target/loongarch/insn_trans/trans_bit.c.inc
> +++ b/target/loongarch/insn_trans/trans_bit.c.inc
> @@ -122,9 +122,6 @@ static void gen_revb_2h(TCGv dest, TCGv src1)
>       tcg_gen_and_tl(t1, src1, mask);
>       tcg_gen_shli_tl(t1, t1, 8);
>       tcg_gen_or_tl(dest, t0, t1);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
>   }
>   
>   static void gen_revb_4h(TCGv dest, TCGv src1)
> @@ -138,9 +135,6 @@ static void gen_revb_4h(TCGv dest, TCGv src1)
>       tcg_gen_and_tl(t1, src1, mask);
>       tcg_gen_shli_tl(t1, t1, 8);
>       tcg_gen_or_tl(dest, t0, t1);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
>   }
>   
>   static void gen_revh_2w(TCGv dest, TCGv src1)
> @@ -154,9 +148,6 @@ static void gen_revh_2w(TCGv dest, TCGv src1)
>       tcg_gen_and_i64(t0, t0, mask);
>       tcg_gen_shli_i64(t1, t1, 16);
>       tcg_gen_or_i64(dest, t1, t0);
> -
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
>   }
>   
>   static void gen_revh_d(TCGv dest, TCGv src1)
> @@ -171,9 +162,6 @@ static void gen_revh_d(TCGv dest, TCGv src1)
>       tcg_gen_shli_tl(t0, t0, 16);
>       tcg_gen_or_tl(t0, t0, t1);
>       tcg_gen_rotri_tl(dest, t0, 32);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
>   }
>   
>   static void gen_maskeqz(TCGv dest, TCGv src1, TCGv src2)
> diff --git a/target/loongarch/insn_trans/trans_fcmp.c.inc b/target/loongarch/insn_trans/trans_fcmp.c.inc
> index 2ccf646ccb..3b0da2b9f4 100644
> --- a/target/loongarch/insn_trans/trans_fcmp.c.inc
> +++ b/target/loongarch/insn_trans/trans_fcmp.c.inc
> @@ -38,7 +38,6 @@ static bool trans_fcmp_cond_s(DisasContext *ctx, arg_fcmp_cond_s *a)
>       fn(var, cpu_env, cpu_fpr[a->fj], cpu_fpr[a->fk], tcg_constant_i32(flags));
>   
>       tcg_gen_st8_tl(var, cpu_env, offsetof(CPULoongArchState, cf[a->cd]));
> -    tcg_temp_free(var);
>       return true;
>   }
>   
> @@ -57,7 +56,5 @@ static bool trans_fcmp_cond_d(DisasContext *ctx, arg_fcmp_cond_d *a)
>       fn(var, cpu_env, cpu_fpr[a->fj], cpu_fpr[a->fk], tcg_constant_i32(flags));
>   
>       tcg_gen_st8_tl(var, cpu_env, offsetof(CPULoongArchState, cf[a->cd]));
> -
> -    tcg_temp_free(var);
>       return true;
>   }
> diff --git a/target/loongarch/insn_trans/trans_fmemory.c.inc b/target/loongarch/insn_trans/trans_fmemory.c.inc
> index 3025a1d3e9..0d11843873 100644
> --- a/target/loongarch/insn_trans/trans_fmemory.c.inc
> +++ b/target/loongarch/insn_trans/trans_fmemory.c.inc
> @@ -13,12 +13,11 @@ static void maybe_nanbox_load(TCGv freg, MemOp mop)
>   static bool gen_fload_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
>   {
>       TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
> -    TCGv temp = NULL;
>   
>       CHECK_FPE;
>   
>       if (a->imm) {
> -        temp = tcg_temp_new();
> +        TCGv temp = tcg_temp_new();
>           tcg_gen_addi_tl(temp, addr, a->imm);
>           addr = temp;
>       }
> @@ -26,31 +25,22 @@ static bool gen_fload_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
>       tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
>       maybe_nanbox_load(cpu_fpr[a->fd], mop);
>   
> -    if (temp) {
> -        tcg_temp_free(temp);
> -    }
> -
>       return true;
>   }
>   
>   static bool gen_fstore_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
>   {
>       TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
> -    TCGv temp = NULL;
>   
>       CHECK_FPE;
>   
>       if (a->imm) {
> -        temp = tcg_temp_new();
> +        TCGv temp = tcg_temp_new();
>           tcg_gen_addi_tl(temp, addr, a->imm);
>           addr = temp;
>       }
>   
>       tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
> -
> -    if (temp) {
> -        tcg_temp_free(temp);
> -    }
>       return true;
>   }
>   
> @@ -66,7 +56,6 @@ static bool gen_floadx(DisasContext *ctx, arg_frr *a, MemOp mop)
>       tcg_gen_add_tl(addr, src1, src2);
>       tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
>       maybe_nanbox_load(cpu_fpr[a->fd], mop);
> -    tcg_temp_free(addr);
>   
>       return true;
>   }
> @@ -82,7 +71,6 @@ static bool gen_fstorex(DisasContext *ctx, arg_frr *a, MemOp mop)
>       addr = tcg_temp_new();
>       tcg_gen_add_tl(addr, src1, src2);
>       tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
> -    tcg_temp_free(addr);
>   
>       return true;
>   }
> @@ -100,7 +88,6 @@ static bool gen_fload_gt(DisasContext *ctx, arg_frr *a, MemOp mop)
>       tcg_gen_add_tl(addr, src1, src2);
>       tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
>       maybe_nanbox_load(cpu_fpr[a->fd], mop);
> -    tcg_temp_free(addr);
>   
>       return true;
>   }
> @@ -117,7 +104,6 @@ static bool gen_fstore_gt(DisasContext *ctx, arg_frr *a, MemOp mop)
>       gen_helper_asrtgt_d(cpu_env, src1, src2);
>       tcg_gen_add_tl(addr, src1, src2);
>       tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
> -    tcg_temp_free(addr);
>   
>       return true;
>   }
> @@ -135,7 +121,6 @@ static bool gen_fload_le(DisasContext *ctx, arg_frr *a, MemOp mop)
>       tcg_gen_add_tl(addr, src1, src2);
>       tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
>       maybe_nanbox_load(cpu_fpr[a->fd], mop);
> -    tcg_temp_free(addr);
>   
>       return true;
>   }
> @@ -152,7 +137,6 @@ static bool gen_fstore_le(DisasContext *ctx, arg_frr *a, MemOp mop)
>       gen_helper_asrtle_d(cpu_env, src1, src2);
>       tcg_gen_add_tl(addr, src1, src2);
>       tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
> -    tcg_temp_free(addr);
>   
>       return true;
>   }
> diff --git a/target/loongarch/insn_trans/trans_fmov.c.inc b/target/loongarch/insn_trans/trans_fmov.c.inc
> index 8e5106db4e..069c941665 100644
> --- a/target/loongarch/insn_trans/trans_fmov.c.inc
> +++ b/target/loongarch/insn_trans/trans_fmov.c.inc
> @@ -18,7 +18,6 @@ static bool trans_fsel(DisasContext *ctx, arg_fsel *a)
>       tcg_gen_ld8u_tl(cond, cpu_env, offsetof(CPULoongArchState, cf[a->ca]));
>       tcg_gen_movcond_tl(TCG_COND_EQ, cpu_fpr[a->fd], cond, zero,
>                          cpu_fpr[a->fj], cpu_fpr[a->fk]);
> -    tcg_temp_free(cond);
>   
>       return true;
>   }
> @@ -82,9 +81,6 @@ static bool trans_movgr2fcsr(DisasContext *ctx, arg_movgr2fcsr *a)
>           tcg_gen_andi_i32(fcsr0, fcsr0, ~mask);
>           tcg_gen_or_i32(fcsr0, fcsr0, temp);
>           tcg_gen_st_i32(fcsr0, cpu_env, offsetof(CPULoongArchState, fcsr0));
> -
> -        tcg_temp_free_i32(temp);
> -        tcg_temp_free_i32(fcsr0);
>       }
>   
>       /*
> @@ -134,7 +130,6 @@ static bool trans_movfr2cf(DisasContext *ctx, arg_movfr2cf *a)
>       t0 = tcg_temp_new();
>       tcg_gen_andi_tl(t0, cpu_fpr[a->fj], 0x1);
>       tcg_gen_st8_tl(t0, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7]));
> -    tcg_temp_free(t0);
>   
>       return true;
>   }
> @@ -157,7 +152,6 @@ static bool trans_movgr2cf(DisasContext *ctx, arg_movgr2cf *a)
>       t0 = tcg_temp_new();
>       tcg_gen_andi_tl(t0, gpr_src(ctx, a->rj, EXT_NONE), 0x1);
>       tcg_gen_st8_tl(t0, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7]));
> -    tcg_temp_free(t0);
>   
>       return true;
>   }
> diff --git a/target/loongarch/insn_trans/trans_memory.c.inc b/target/loongarch/insn_trans/trans_memory.c.inc
> index d5eb31147c..75cfdf59ad 100644
> --- a/target/loongarch/insn_trans/trans_memory.c.inc
> +++ b/target/loongarch/insn_trans/trans_memory.c.inc
> @@ -7,21 +7,15 @@ static bool gen_load(DisasContext *ctx, arg_rr_i *a, MemOp mop)
>   {
>       TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
>       TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
> -    TCGv temp = NULL;
>   
>       if (a->imm) {
> -        temp = tcg_temp_new();
> +        TCGv temp = tcg_temp_new();
>           tcg_gen_addi_tl(temp, addr, a->imm);
>           addr = temp;
>       }
>   
>       tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
>       gen_set_gpr(a->rd, dest, EXT_NONE);
> -
> -    if (temp) {
> -        tcg_temp_free(temp);
> -    }
> -
>       return true;
>   }
>   
> @@ -29,20 +23,14 @@ static bool gen_store(DisasContext *ctx, arg_rr_i *a, MemOp mop)
>   {
>       TCGv data = gpr_src(ctx, a->rd, EXT_NONE);
>       TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
> -    TCGv temp = NULL;
>   
>       if (a->imm) {
> -        temp = tcg_temp_new();
> +        TCGv temp = tcg_temp_new();
>           tcg_gen_addi_tl(temp, addr, a->imm);
>           addr = temp;
>       }
>   
>       tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, mop);
> -
> -    if (temp) {
> -        tcg_temp_free(temp);
> -    }
> -
>       return true;
>   }
>   
> @@ -56,7 +44,6 @@ static bool gen_loadx(DisasContext *ctx, arg_rrr *a, MemOp mop)
>       tcg_gen_add_tl(addr, src1, src2);
>       tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
>       gen_set_gpr(a->rd, dest, EXT_NONE);
> -    tcg_temp_free(addr);
>   
>       return true;
>   }
> @@ -70,7 +57,6 @@ static bool gen_storex(DisasContext *ctx, arg_rrr *a, MemOp mop)
>   
>       tcg_gen_add_tl(addr, src1, src2);
>       tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, mop);
> -    tcg_temp_free(addr);
>   
>       return true;
>   }
> @@ -146,21 +132,15 @@ static bool gen_ldptr(DisasContext *ctx, arg_rr_i *a, MemOp mop)
>   {
>       TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
>       TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
> -    TCGv temp = NULL;
>   
>       if (a->imm) {
> -        temp = tcg_temp_new();
> +        TCGv temp = tcg_temp_new();
>           tcg_gen_addi_tl(temp, addr, a->imm);
>           addr = temp;
>       }
>   
>       tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
>       gen_set_gpr(a->rd, dest, EXT_NONE);
> -
> -    if (temp) {
> -        tcg_temp_free(temp);
> -    }
> -
>       return true;
>   }
>   
> @@ -168,20 +148,14 @@ static bool gen_stptr(DisasContext *ctx, arg_rr_i *a, MemOp mop)
>   {
>       TCGv data = gpr_src(ctx, a->rd, EXT_NONE);
>       TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
> -    TCGv temp = NULL;
>   
>       if (a->imm) {
> -        temp = tcg_temp_new();
> +        TCGv temp = tcg_temp_new();
>           tcg_gen_addi_tl(temp, addr, a->imm);
>           addr = temp;
>       }
>   
>       tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, mop);
> -
> -    if (temp) {
> -        tcg_temp_free(temp);
> -    }
> -
>       return true;
>   }
>   
> diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
> index 56f4c45e09..5a04352b01 100644
> --- a/target/loongarch/insn_trans/trans_privileged.c.inc
> +++ b/target/loongarch/insn_trans/trans_privileged.c.inc
> @@ -291,10 +291,6 @@ static bool trans_csrxchg(DisasContext *ctx, arg_csrxchg *a)
>           tcg_gen_st_tl(newv, cpu_env, csr->offset);
>       }
>       gen_set_gpr(a->rd, oldv, EXT_NONE);
> -
> -    tcg_temp_free(temp);
> -    tcg_temp_free(newv);
> -    tcg_temp_free(oldv);
>       return true;
>   }
>   
> diff --git a/target/loongarch/insn_trans/trans_shift.c.inc b/target/loongarch/insn_trans/trans_shift.c.inc
> index 5260af2337..bf5428a2ba 100644
> --- a/target/loongarch/insn_trans/trans_shift.c.inc
> +++ b/target/loongarch/insn_trans/trans_shift.c.inc
> @@ -8,7 +8,6 @@ static void gen_sll_w(TCGv dest, TCGv src1, TCGv src2)
>       TCGv t0 = tcg_temp_new();
>       tcg_gen_andi_tl(t0, src2, 0x1f);
>       tcg_gen_shl_tl(dest, src1, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   static void gen_srl_w(TCGv dest, TCGv src1, TCGv src2)
> @@ -16,7 +15,6 @@ static void gen_srl_w(TCGv dest, TCGv src1, TCGv src2)
>       TCGv t0 = tcg_temp_new();
>       tcg_gen_andi_tl(t0, src2, 0x1f);
>       tcg_gen_shr_tl(dest, src1, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   static void gen_sra_w(TCGv dest, TCGv src1, TCGv src2)
> @@ -24,7 +22,6 @@ static void gen_sra_w(TCGv dest, TCGv src1, TCGv src2)
>       TCGv t0 = tcg_temp_new();
>       tcg_gen_andi_tl(t0, src2, 0x1f);
>       tcg_gen_sar_tl(dest, src1, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   static void gen_sll_d(TCGv dest, TCGv src1, TCGv src2)
> @@ -32,7 +29,6 @@ static void gen_sll_d(TCGv dest, TCGv src1, TCGv src2)
>       TCGv t0 = tcg_temp_new();
>       tcg_gen_andi_tl(t0, src2, 0x3f);
>       tcg_gen_shl_tl(dest, src1, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   static void gen_srl_d(TCGv dest, TCGv src1, TCGv src2)
> @@ -40,7 +36,6 @@ static void gen_srl_d(TCGv dest, TCGv src1, TCGv src2)
>       TCGv t0 = tcg_temp_new();
>       tcg_gen_andi_tl(t0, src2, 0x3f);
>       tcg_gen_shr_tl(dest, src1, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   static void gen_sra_d(TCGv dest, TCGv src1, TCGv src2)
> @@ -48,7 +43,6 @@ static void gen_sra_d(TCGv dest, TCGv src1, TCGv src2)
>       TCGv t0 = tcg_temp_new();
>       tcg_gen_andi_tl(t0, src2, 0x3f);
>       tcg_gen_sar_tl(dest, src1, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   static void gen_rotr_w(TCGv dest, TCGv src1, TCGv src2)
> @@ -64,10 +58,6 @@ static void gen_rotr_w(TCGv dest, TCGv src1, TCGv src2)
>   
>       tcg_gen_rotr_i32(t1, t1, t2);
>       tcg_gen_ext_i32_tl(dest, t1);
> -
> -    tcg_temp_free_i32(t1);
> -    tcg_temp_free_i32(t2);
> -    tcg_temp_free(t0);
>   }
>   
>   static void gen_rotr_d(TCGv dest, TCGv src1, TCGv src2)
> @@ -75,7 +65,6 @@ static void gen_rotr_d(TCGv dest, TCGv src1, TCGv src2)
>       TCGv t0 = tcg_temp_new();
>       tcg_gen_andi_tl(t0, src2, 0x3f);
>       tcg_gen_rotr_tl(dest, src1, t0);
> -    tcg_temp_free(t0);
>   }
>   
>   static bool trans_srai_w(DisasContext *ctx, arg_srai_w *a)


