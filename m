Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWGfC-0000Td-6U
	for mharc-qemu-riscv@gnu.org; Sun, 26 Feb 2023 08:02:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pWGf7-0000Cp-Jf; Sun, 26 Feb 2023 08:01:57 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pWGf4-0002i2-Rs; Sun, 26 Feb 2023 08:01:57 -0500
Received: from [192.168.0.120] (unknown [180.165.240.213])
 by APP-05 (Coremail) with SMTP id zQCowABnbuo3WPtjQxa8CA--.55575S2;
 Sun, 26 Feb 2023 21:01:44 +0800 (CST)
Message-ID: <9f35adf5-c523-646e-f16d-866e515f7b82@iscas.ac.cn>
Date: Sun, 26 Feb 2023 21:01:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 51/76] target/riscv: Drop ftemp_new
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-52-richard.henderson@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230225091427.1817156-52-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowABnbuo3WPtjQxa8CA--.55575S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1UWF13Gw4fKr1kur4rKrg_yoW5ZrWfpr
 4Sk342vF1FqrySva9rtw4DZF1UZr4xCF1UK3s0gw48Cr42qr1kJ395K3yYvFW0vFWkZr4Y
 kF4DCry5Aa12qaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvKb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
 wI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
 0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
 VjvjDU0xZFpf9x07j1VbkUUUUU=
X-Originating-IP: [180.165.240.213]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Sun, 26 Feb 2023 13:02:00 -0000


On 2023/2/25 17:14, Richard Henderson wrote:
> Translators are no longer required to free tcg temporaries,
> therefore there's no need to record temps for later freeing.
> Replace the few uses with tcg_temp_new_i64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li
> ---
>   target/riscv/translate.c | 24 ++++--------------------
>   1 file changed, 4 insertions(+), 20 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f9d5d1097e..273e566d66 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -106,9 +106,6 @@ typedef struct DisasContext {
>       TCGv zero;
>       /* Space for 3 operands plus 1 extra for address computation. */
>       TCGv temp[4];
> -    /* Space for 4 operands(1 dest and <=3 src) for float point computation */
> -    TCGv_i64 ftemp[4];
> -    uint8_t nftemp;
>       /* PointerMasking extension */
>       bool pm_mask_enabled;
>       bool pm_base_enabled;
> @@ -431,12 +428,6 @@ static void gen_set_gpr128(DisasContext *ctx, int reg_num, TCGv rl, TCGv rh)
>       }
>   }
>   
> -static TCGv_i64 ftemp_new(DisasContext *ctx)
> -{
> -    assert(ctx->nftemp < ARRAY_SIZE(ctx->ftemp));
> -    return ctx->ftemp[ctx->nftemp++] = tcg_temp_new_i64();
> -}
> -
>   static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
>   {
>       if (!ctx->cfg_ptr->ext_zfinx) {
> @@ -450,7 +441,7 @@ static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
>       case MXL_RV32:
>   #ifdef TARGET_RISCV32
>       {
> -        TCGv_i64 t = ftemp_new(ctx);
> +        TCGv_i64 t = tcg_temp_new_i64();
>           tcg_gen_ext_i32_i64(t, cpu_gpr[reg_num]);
>           return t;
>       }
> @@ -476,7 +467,7 @@ static TCGv_i64 get_fpr_d(DisasContext *ctx, int reg_num)
>       switch (get_xl(ctx)) {
>       case MXL_RV32:
>       {
> -        TCGv_i64 t = ftemp_new(ctx);
> +        TCGv_i64 t = tcg_temp_new_i64();
>           tcg_gen_concat_tl_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num + 1]);
>           return t;
>       }
> @@ -496,12 +487,12 @@ static TCGv_i64 dest_fpr(DisasContext *ctx, int reg_num)
>       }
>   
>       if (reg_num == 0) {
> -        return ftemp_new(ctx);
> +        return tcg_temp_new_i64();
>       }
>   
>       switch (get_xl(ctx)) {
>       case MXL_RV32:
> -        return ftemp_new(ctx);
> +        return tcg_temp_new_i64();
>   #ifdef TARGET_RISCV64
>       case MXL_RV64:
>           return cpu_gpr[reg_num];
> @@ -1207,8 +1198,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->cs = cs;
>       ctx->ntemp = 0;
>       memset(ctx->temp, 0, sizeof(ctx->temp));
> -    ctx->nftemp = 0;
> -    memset(ctx->ftemp, 0, sizeof(ctx->ftemp));
>       ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
>       ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
>       ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
> @@ -1244,11 +1233,6 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>           ctx->temp[i] = NULL;
>       }
>       ctx->ntemp = 0;
> -    for (i = ctx->nftemp - 1; i >= 0; --i) {
> -        tcg_temp_free_i64(ctx->ftemp[i]);
> -        ctx->ftemp[i] = NULL;
> -    }
> -    ctx->nftemp = 0;
>   
>       /* Only the first insn within a TB is allowed to cross a page boundary. */
>       if (ctx->base.is_jmp == DISAS_NEXT) {


