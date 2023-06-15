Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5768EB64DD
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 06:37:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9gbd-00044r-CK; Thu, 15 Jun 2023 02:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q9gaN-0002hK-Ir; Thu, 15 Jun 2023 02:36:06 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q9gaG-0005DG-H5; Thu, 15 Jun 2023 02:35:56 -0400
Received: from [192.168.100.156] (unknown [117.61.111.213])
 by APP-05 (Coremail) with SMTP id zQCowAAXHh5AsYpk5zuhAg--.21797S2;
 Thu, 15 Jun 2023 14:35:46 +0800 (CST)
Message-ID: <ef6d4d29-c540-4d61-f322-142045dd34e5@iscas.ac.cn>
Date: Thu, 15 Jun 2023 14:35:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/8] target/riscv: Factor out extension tests to
 cpu_cfg.h
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>
References: <20230612111034.3955227-1-christoph.muellner@vrull.eu>
 <20230612111034.3955227-3-christoph.muellner@vrull.eu>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230612111034.3955227-3-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAXHh5AsYpk5zuhAg--.21797S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCF48WF47KFW8tw4xAFWfuFg_yoWrXF1Up3
 47CFWa93s8JFy3ZF93J3WYqrZ8Jr4Fyr4kK3s2934rAFWY9rZ2qF1kKrWayF48XFW8WrWF
 k3yq9r13Crs2vFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8Jw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfUF9a9DUUUU
X-Originating-IP: [117.61.111.213]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.098,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org


On 2023/6/12 19:10, Christoph Muellner wrote:
> From: Christoph Müllner <christoph.muellner@vrull.eu>
>
> This patch moves the extension test functions that are used
> to gate vendor extension decoders, into cpu_cfg.h.
> This allows to reuse them in the disassembler.
>
> This patch does not introduce new functionality.
> However, the patch includes a small change:
> The parameter for the extension test functions has been changed
> from 'DisasContext*' to 'const RISCVCPUConfig*' to keep
> the code in cpu_cfg.h self-contained.
>
> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
> ---
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li
>   target/riscv/cpu_cfg.h   | 26 ++++++++++++++++++++++++++
>   target/riscv/translate.c | 27 ++-------------------------
>   2 files changed, 28 insertions(+), 25 deletions(-)
>
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index c4a627d335..0b4fe4b540 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -133,4 +133,30 @@ struct RISCVCPUConfig {
>   };
>   
>   typedef struct RISCVCPUConfig RISCVCPUConfig;
> +
> +/* Helper functions to test for extensions.  */
> +
> +static inline bool always_true_p(const RISCVCPUConfig *cfg __attribute__((__unused__)))
> +{
> +    return true;
> +}
> +
> +static inline bool has_xthead_p(const RISCVCPUConfig *cfg)
> +{
> +    return cfg->ext_xtheadba || cfg->ext_xtheadbb ||
> +           cfg->ext_xtheadbs || cfg->ext_xtheadcmo ||
> +           cfg->ext_xtheadcondmov ||
> +           cfg->ext_xtheadfmemidx || cfg->ext_xtheadfmv ||
> +           cfg->ext_xtheadmac || cfg->ext_xtheadmemidx ||
> +           cfg->ext_xtheadmempair || cfg->ext_xtheadsync;
> +}
> +
> +#define MATERIALISE_EXT_PREDICATE(ext) \
> +    static inline bool has_ ## ext ## _p(const RISCVCPUConfig *cfg) \
> +    { \
> +        return cfg->ext_ ## ext ; \
> +    }
> +
> +MATERIALISE_EXT_PREDICATE(XVentanaCondOps)
> +
>   #endif
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 859d5b2dcf..275b922811 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -119,29 +119,6 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
>       return ctx->misa_ext & ext;
>   }
>   
> -static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
> -{
> -    return true;
> -}
> -
> -static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
> -{
> -    return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
> -           ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
> -           ctx->cfg_ptr->ext_xtheadcondmov ||
> -           ctx->cfg_ptr->ext_xtheadfmemidx || ctx->cfg_ptr->ext_xtheadfmv ||
> -           ctx->cfg_ptr->ext_xtheadmac || ctx->cfg_ptr->ext_xtheadmemidx ||
> -           ctx->cfg_ptr->ext_xtheadmempair || ctx->cfg_ptr->ext_xtheadsync;
> -}
> -
> -#define MATERIALISE_EXT_PREDICATE(ext)  \
> -    static bool has_ ## ext ## _p(DisasContext *ctx)    \
> -    { \
> -        return ctx->cfg_ptr->ext_ ## ext ; \
> -    }
> -
> -MATERIALISE_EXT_PREDICATE(XVentanaCondOps);
> -
>   #ifdef TARGET_RISCV32
>   #define get_xl(ctx)    MXL_RV32
>   #elif defined(CONFIG_USER_ONLY)
> @@ -1132,7 +1109,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>        * that are tested in-order until a decoder matches onto the opcode.
>        */
>       static const struct {
> -        bool (*guard_func)(DisasContext *);
> +        bool (*guard_func)(const RISCVCPUConfig *);
>           bool (*decode_func)(DisasContext *, uint32_t);
>       } decoders[] = {
>           { always_true_p,  decode_insn32 },
> @@ -1161,7 +1138,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>           ctx->opcode = opcode32;
>   
>           for (size_t i = 0; i < ARRAY_SIZE(decoders); ++i) {
> -            if (decoders[i].guard_func(ctx) &&
> +            if (decoders[i].guard_func(ctx->cfg_ptr) &&
>                   decoders[i].decode_func(ctx, opcode32)) {
>                   return;
>               }


