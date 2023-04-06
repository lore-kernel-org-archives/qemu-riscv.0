Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkW8U-0000bn-Gg
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 16:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkW8S-0000bU-PN
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 16:23:08 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkW8Q-0001XP-MI
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 16:23:08 -0400
Received: by mail-oi1-x233.google.com with SMTP id bj20so29936733oib.3
 for <qemu-riscv@nongnu.org>; Thu, 06 Apr 2023 13:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680812585;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LGsH0T4rpvXZphJHuGKDTr8Qu98eS2FRuQum4y+QxbM=;
 b=A1cerQcFJ6gj/UI2IGJwVDm+XaIwF3UTZsVTrDYZ2Om6NQdw8LJHIUhDIfZ54MxQEP
 ASvgncDq2XKLaKxP30+rlIOb/g9UNwoxZ1rWxomBuh33a3jc/6JfXoekKOu9xbZ8Elf1
 hzt5b8hSWzKr9717BuG6emixaq8MlM/I0AlPwSKQHe7vhUAaH1/2boacyA2wZ0D+Pql3
 SwWnxwYFGDyzgyIvuQhOmyT5aGB8fGLLMv0MbmPaIQFK/9slnjTiVrnyEdLEpWDl9oGx
 pxvZHzBzV/b52ZqFQgpCWBlCMtrJ7YNQ7shQbKHGeZ3gbYNmarY8IiOh8JEeHHx6Qw5o
 c2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680812585;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LGsH0T4rpvXZphJHuGKDTr8Qu98eS2FRuQum4y+QxbM=;
 b=FWza+AgYbVJls7SMvQxne8YaDFBbjaLgh/QHKdN2k5KF8YSLQSTyJcSQVjetI7aKUJ
 KVJ+pVlTI05U++9tivueip+3nGIj5A2Ae8xY0U+GyCsvMLf2HO7Y50v83HpCOuMS7c5T
 ZQuDH38qPEWvVD3ES6umsHnMsL7293pd3EGeA/YZ42snVzFzfz2uz6o67de+1Pw3T/Fc
 2dpxlamDk/5L7nsJLimN/+H/E+0Rm2eUXqTH++0Ptj1UwtnFIJ+wOSzNqyArUkNCS6LK
 g/JOq52pk2KT9x2LANZdQ9UPMakQ83rD/PAdmFjZyPG1PCI+esDf7IdyJg2rLCJ6nz1V
 CrJA==
X-Gm-Message-State: AAQBX9dQGq5bKBD4AfL/bkwql640yCiti2iijit4/XvLDOW7vyWNO95F
 dS+6nLYbi+4Xh2NIqMFHPYISuw==
X-Google-Smtp-Source: AKy350Z1wdJYTARcOyeIDYZVSYT+uI3hVbPYbBLUec+ZevoHqBhhpASmgMMG5WKfE1lAypZ/jRbl2Q==
X-Received: by 2002:aca:e108:0:b0:389:4d01:de0d with SMTP id
 y8-20020acae108000000b003894d01de0dmr3585399oig.15.1680812585326; 
 Thu, 06 Apr 2023 13:23:05 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a056808150a00b0037832f60518sm1059448oiw.14.2023.04.06.13.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 13:23:04 -0700 (PDT)
Message-ID: <0d3b3e7f-3b9a-e08c-dd77-3d5933977701@ventanamicro.com>
Date: Thu, 6 Apr 2023 17:22:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v12 02/10] target/riscv: add support for Zca extension
To: Weiwei Li <liweiwei@iscas.ac.cn>, richard.henderson@linaro.org,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
References: <20230307081403.61950-1-liweiwei@iscas.ac.cn>
 <20230307081403.61950-3-liweiwei@iscas.ac.cn>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230307081403.61950-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.224,
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
X-List-Received-Date: Thu, 06 Apr 2023 20:23:09 -0000

Hi,

This patch is going to break the sifive_u boot if I rebase

"[PATCH v6 0/9] target/riscv: rework CPU extensions validation​"

on top of it, as it is the case today with the current riscv-to-apply.next.

The reason is that the priv spec version for Zca is marked as 1_12_0, and
the priv spec version for both sifive CPUs is 1_10_0, and both are enabling
RVC.

This patch from that series above:

"[PATCH v6 5/9] target/riscv/cpu.c: add priv_spec validate/disable_exts helpers"

Makes the disabling of the extension based on priv version to happen *after* we
do all the validations, instead of before as we're doing today. Zca (and Zcd) will
be manually enabled just to be disabled shortly after by the priv spec code. And
this will happen:

qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000000 because privilege spec version does not match
qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000001 because privilege spec version does not match
qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000001 because privilege spec version does not match
(--- hangs ---)

This means that the assumption made in this patch - that Zca implies RVC - is no
longer valid, and all these translations won't work.


Some possible solutions:

- Do not use Zca as a synonym for RVC, i.e. drop this patch. We would need to convert
all Zca checks to RVC checks in all translation code.

- Do not apply patch 5/9 from that series that moves the disable_ext code to the end
of validation. Also a possibility, but we would be sweeping the problem under the rug.
Zca still can't be used as a RVC replacement due to priv spec version constraints, but
we just won't disable Zca because we'll keep validating exts too early (which is the
problem that the patch addresses).

- change the priv spec of the sifive CPUs - and everyone that uses RVC -  to 1_12_0. Not
sure if this makes sense.

- do not disable any extensions due to privilege spec version mismatch. This would make
all the priv_version related artifacts to be more "educational" than to be an actual
configuration we want to enforce. Not sure if that would do any good in the end, but
it's also a possibility.


I'll hold the rebase of that series until we sort this out. Thanks,


Daniel



On 3/7/23 05:13, Weiwei Li wrote:
> Modify the check for C extension to Zca (C implies Zca).
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
>   target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
>   target/riscv/translate.c                | 8 ++++++--
>   2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index 4ad54e8a49..c70c495fc5 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>       tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
>   
>       gen_set_pc(ctx, cpu_pc);
> -    if (!has_ext(ctx, RVC)) {
> +    if (!ctx->cfg_ptr->ext_zca) {
>           TCGv t0 = tcg_temp_new();
>   
>           misaligned = gen_new_label();
> @@ -169,7 +169,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
>   
>       gen_set_label(l); /* branch taken */
>   
> -    if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
> +    if (!ctx->cfg_ptr->ext_zca && ((ctx->base.pc_next + a->imm) & 0x3)) {
>           /* misaligned */
>           gen_exception_inst_addr_mis(ctx);
>       } else {
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 0ee8ee147d..d1fdd0c2d7 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -549,7 +549,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>   
>       /* check misaligned: */
>       next_pc = ctx->base.pc_next + imm;
> -    if (!has_ext(ctx, RVC)) {
> +    if (!ctx->cfg_ptr->ext_zca) {
>           if ((next_pc & 0x3) != 0) {
>               gen_exception_inst_addr_mis(ctx);
>               return;
> @@ -1122,7 +1122,11 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>       if (insn_len(opcode) == 2) {
>           ctx->opcode = opcode;
>           ctx->pc_succ_insn = ctx->base.pc_next + 2;
> -        if (has_ext(ctx, RVC) && decode_insn16(ctx, opcode)) {
> +        /*
> +         * The Zca extension is added as way to refer to instructions in the C
> +         * extension that do not include the floating-point loads and stores
> +         */
> +        if (ctx->cfg_ptr->ext_zca && decode_insn16(ctx, opcode)) {
>               return;
>           }
>       } else {

