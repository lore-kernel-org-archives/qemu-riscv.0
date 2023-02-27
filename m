Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWU1R-00055r-5B
	for mharc-qemu-riscv@gnu.org; Sun, 26 Feb 2023 22:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pWU1P-00055S-Jg; Sun, 26 Feb 2023 22:17:51 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>)
 id 1pWU1N-0007IY-E5; Sun, 26 Feb 2023 22:17:51 -0500
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8AxJAzVIPxjgvAFAA--.5488S3;
 Mon, 27 Feb 2023 11:17:41 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxSL3TIPxjPTg+AA--.46072S3; 
 Mon, 27 Feb 2023 11:17:40 +0800 (CST)
Subject: Re: [PATCH 31/76] target/loongarch: Drop temp_new
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, jiaxun.yang@flygoat.com, tsimpson@quicinc.com,
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-32-richard.henderson@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <b4ca1e7e-5791-029e-3cab-ba3aefe8c743@loongson.cn>
Date: Mon, 27 Feb 2023 11:17:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20230225091427.1817156-32-richard.henderson@linaro.org>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8BxSL3TIPxjPTg+AA--.46072S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxZw47JrWkZrWUAF1UJw17Awb_yoWrJrWDpr
 12kr12gr48JrWfAas7Ja90vr15uF4xKF42g3s3t3s5Gr4aqr1kXr48K3ya9FW8Aay8WrWY
 vF4vkryDWa12qa7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bIxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcV
 C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8l38UUUUUU==
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
X-List-Received-Date: Mon, 27 Feb 2023 03:17:52 -0000


ÔÚ 2023/2/25 ÏÂÎç5:13, Richard Henderson Ð´µÀ:
> Translators are no longer required to free tcg temporaries,
> therefore there's no need to record temps for later freeing.
> Replace the few uses with tcg_temp_new.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/loongarch/translate.h                  |  3 ---
>   target/loongarch/translate.c                  | 21 +++----------------
>   .../insn_trans/trans_privileged.c.inc         |  2 +-
>   3 files changed, 4 insertions(+), 22 deletions(-)
Reviewed-by: Song Gao <gaosong@loongson.cn>

Thanks.
Song Gao
> diff --git a/target/loongarch/translate.h b/target/loongarch/translate.h
> index 6d2e382e8b..67bc74c05b 100644
> --- a/target/loongarch/translate.h
> +++ b/target/loongarch/translate.h
> @@ -32,9 +32,6 @@ typedef struct DisasContext {
>       uint16_t mem_idx;
>       uint16_t plv;
>       TCGv zero;
> -    /* Space for 3 operands plus 1 extra for address computation. */
> -    TCGv temp[4];
> -    uint8_t ntemp;
>   } DisasContext;
>   
>   void generate_exception(DisasContext *ctx, int excp);
> diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
> index 2a43ab0201..f443b5822f 100644
> --- a/target/loongarch/translate.c
> +++ b/target/loongarch/translate.c
> @@ -85,9 +85,6 @@ static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
>       bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
>       ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
>   
> -    ctx->ntemp = 0;
> -    memset(ctx->temp, 0, sizeof(ctx->temp));
> -
>       ctx->zero = tcg_constant_tl(0);
>   }
>   
> @@ -110,12 +107,6 @@ static void loongarch_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
>    *
>    * Further, we may provide an extension for word operations.
>    */
> -static TCGv temp_new(DisasContext *ctx)
> -{
> -    assert(ctx->ntemp < ARRAY_SIZE(ctx->temp));
> -    return ctx->temp[ctx->ntemp++] = tcg_temp_new();
> -}
> -
>   static TCGv gpr_src(DisasContext *ctx, int reg_num, DisasExtend src_ext)
>   {
>       TCGv t;
> @@ -128,11 +119,11 @@ static TCGv gpr_src(DisasContext *ctx, int reg_num, DisasExtend src_ext)
>       case EXT_NONE:
>           return cpu_gpr[reg_num];
>       case EXT_SIGN:
> -        t = temp_new(ctx);
> +        t = tcg_temp_new();
>           tcg_gen_ext32s_tl(t, cpu_gpr[reg_num]);
>           return t;
>       case EXT_ZERO:
> -        t = temp_new(ctx);
> +        t = tcg_temp_new();
>           tcg_gen_ext32u_tl(t, cpu_gpr[reg_num]);
>           return t;
>       }
> @@ -142,7 +133,7 @@ static TCGv gpr_src(DisasContext *ctx, int reg_num, DisasExtend src_ext)
>   static TCGv gpr_dst(DisasContext *ctx, int reg_num, DisasExtend dst_ext)
>   {
>       if (reg_num == 0 || dst_ext) {
> -        return temp_new(ctx);
> +        return tcg_temp_new();
>       }
>       return cpu_gpr[reg_num];
>   }
> @@ -195,12 +186,6 @@ static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
>           generate_exception(ctx, EXCCODE_INE);
>       }
>   
> -    for (int i = ctx->ntemp - 1; i >= 0; --i) {
> -        tcg_temp_free(ctx->temp[i]);
> -        ctx->temp[i] = NULL;
> -    }
> -    ctx->ntemp = 0;
> -
>       ctx->base.pc_next += 4;
>   }
>   
> diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
> index 40f82becb0..56f4c45e09 100644
> --- a/target/loongarch/insn_trans/trans_privileged.c.inc
> +++ b/target/loongarch/insn_trans/trans_privileged.c.inc
> @@ -243,7 +243,7 @@ static bool trans_csrwr(DisasContext *ctx, arg_csrwr *a)
>           dest = gpr_dst(ctx, a->rd, EXT_NONE);
>           csr->writefn(dest, cpu_env, src1);
>       } else {
> -        dest = temp_new(ctx);
> +        dest = tcg_temp_new();
>           tcg_gen_ld_tl(dest, cpu_env, csr->offset);
>           tcg_gen_st_tl(src1, cpu_env, csr->offset);
>       }


