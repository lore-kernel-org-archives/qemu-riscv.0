Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmaBJ-0005Mi-MX
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 09:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmaBI-0005JB-57
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 09:06:36 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmaBG-0006Ro-6q
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 09:06:35 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 q33-20020a056830442100b006a419d3fd20so974917otv.7
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 06:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681304792;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qmjy2WqEWe2pn53czgDWv0KIOS85EIrybfJLAL3HuW0=;
 b=SUO6NosMMPbNAY7xiQnV30Tk29vhGsXekiTybLJVyAwvjrE9l/0bN8VAzBDrgJs/Bi
 SHbthXNI1othl5b3EsCTJrlJuWRru8yumt/ksQSkO2tCydTaBZ/DmLPeUBXyldUgkkdU
 rffWPTsBHyuWJfqRX1H7PQv1tuor2wrMwpGY/WkZ5o6PhKewtWy2WwcNzI7IStxxEPa+
 kXmwufTWsUlUpTGQr3sjvkf8MNVGqdRrNtp3vBSMXfrw4tCBNgGHrlYEH7ttzu5pPk7p
 V41FvSA/s09qwpWDJ/QOyE82HZbIiZPrPgXlWBizkhplP0i25tXY2ofz8QWoz1N01M9y
 VO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681304792;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qmjy2WqEWe2pn53czgDWv0KIOS85EIrybfJLAL3HuW0=;
 b=OELqmj/MDpOy2b8lCn+am9a3Y1yz9T+gQffKzVrzIVxz5ahFY7C6Fr5Sq1to+/2Daj
 yo7IK/wJ0XEUts+ddId9aOijBETpo00ZCj5gXlGfHJx228o2yxFL1YYu/dS2sGW8FivO
 sGyKgIX+Ux4Mu4MhEHIz5GTco/PoIv4DSVOG290kRFDGfk9BgOGSU1scTDfbGSayTBoS
 fypLQOKwxkjHQcfZcncMsAVaX0NmdA/Qvd09xp0dIHo2NqYIR1iNJDmX7zCN8NQ+cDwJ
 OxwPfz7FL/7MWpGaaGFvoW14Xe+/YgAlgyiJxVmxlNyfsW+wbtbkrjUdP9x4Bzuk5X61
 LdBA==
X-Gm-Message-State: AAQBX9cGq1V7Kp7PhZhOmOnsWir4qiMLRUuTPkNIjrfDnI8c/syneP7y
 KVw4aY3WJOXmnjokDwqdxubiqw==
X-Google-Smtp-Source: AKy350Y/67uoSxJzjzOg3sZ4zo5TfzqJ/s3KJvNozFznJUXdYClhY05kONkhsRDFLbttGCVSfJ/wJg==
X-Received: by 2002:a9d:6c18:0:b0:688:4670:e964 with SMTP id
 f24-20020a9d6c18000000b006884670e964mr8810740otq.27.1681304792603; 
 Wed, 12 Apr 2023 06:06:32 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a9d6a97000000b006a41ab165dfsm601738otq.34.2023.04.12.06.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 06:06:32 -0700 (PDT)
Message-ID: <aa199b3f-ea29-863b-af9d-d506c4973606@ventanamicro.com>
Date: Wed, 12 Apr 2023 10:06:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] target/riscv: Update check for Zca/zcf/zcd
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230412030648.80470-1-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230412030648.80470-1-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.083,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 12 Apr 2023 13:06:36 -0000



On 4/12/23 00:06, Weiwei Li wrote:
> Even though Zca/Zcf/Zcd can be included by C/F/D, however, their priv
> version is higher than the priv version of C/F/D. So if we use check
> for them instead of check for C/F/D totally, it will trigger new
> problem when we try to disable the extensions based on the configured
> priv version.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


And I'll fold it into the next version of "[PATCH v6 0/9] target/riscv: rework
CPU extensions validation​" to fix the sifive break I'm experiencing there.



Thanks,


Daniel

>   target/riscv/insn_trans/trans_rvd.c.inc | 12 +++++++-----
>   target/riscv/insn_trans/trans_rvf.c.inc | 14 ++++++++------
>   target/riscv/insn_trans/trans_rvi.c.inc |  5 +++--
>   target/riscv/translate.c                |  5 +++--
>   4 files changed, 21 insertions(+), 15 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
> index 2c51e01c40..f8d0ae48c7 100644
> --- a/target/riscv/insn_trans/trans_rvd.c.inc
> +++ b/target/riscv/insn_trans/trans_rvd.c.inc
> @@ -31,9 +31,11 @@
>       } \
>   } while (0)
>   
> -#define REQUIRE_ZCD(ctx) do { \
> -    if (!ctx->cfg_ptr->ext_zcd) {  \
> -        return false;     \
> +#define REQUIRE_ZCD_OR_DC(ctx) do { \
> +    if (!ctx->cfg_ptr->ext_zcd) { \
> +        if(!has_ext(ctx, RVD) || !has_ext(ctx, RVC)) { \
> +            return false; \
> +        } \
>       } \
>   } while (0)
>   
> @@ -67,13 +69,13 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
>   
>   static bool trans_c_fld(DisasContext *ctx, arg_fld *a)
>   {
> -    REQUIRE_ZCD(ctx);
> +    REQUIRE_ZCD_OR_DC(ctx);
>       return trans_fld(ctx, a);
>   }
>   
>   static bool trans_c_fsd(DisasContext *ctx, arg_fsd *a)
>   {
> -    REQUIRE_ZCD(ctx);
> +    REQUIRE_ZCD_OR_DC(ctx);
>       return trans_fsd(ctx, a);
>   }
>   
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
> index 9e9fa2087a..58467eb409 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -30,10 +30,12 @@
>       } \
>   } while (0)
>   
> -#define REQUIRE_ZCF(ctx) do {                  \
> -    if (!ctx->cfg_ptr->ext_zcf) {              \
> -        return false;                          \
> -    }                                          \
> +#define REQUIRE_ZCF_OR_FC(ctx) do {                    \
> +    if (!ctx->cfg_ptr->ext_zcf) {                      \
> +        if(!has_ext(ctx, RVF) || !has_ext(ctx, RVC)) { \
> +            return false;                              \
> +        }                                              \
> +    }                                                  \
>   } while (0)
>   
>   static bool trans_flw(DisasContext *ctx, arg_flw *a)
> @@ -69,13 +71,13 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
>   
>   static bool trans_c_flw(DisasContext *ctx, arg_flw *a)
>   {
> -    REQUIRE_ZCF(ctx);
> +    REQUIRE_ZCF_OR_FC(ctx);
>       return trans_flw(ctx, a);
>   }
>   
>   static bool trans_c_fsw(DisasContext *ctx, arg_fsw *a)
>   {
> -    REQUIRE_ZCF(ctx);
> +    REQUIRE_ZCF_OR_FC(ctx);
>       return trans_fsw(ctx, a);
>   }
>   
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index c70c495fc5..e33f63bea1 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>       tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
>   
>       gen_set_pc(ctx, cpu_pc);
> -    if (!ctx->cfg_ptr->ext_zca) {
> +    if (!has_ext(ctx, RVC) && !ctx->cfg_ptr->ext_zca) {
>           TCGv t0 = tcg_temp_new();
>   
>           misaligned = gen_new_label();
> @@ -169,7 +169,8 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
>   
>       gen_set_label(l); /* branch taken */
>   
> -    if (!ctx->cfg_ptr->ext_zca && ((ctx->base.pc_next + a->imm) & 0x3)) {
> +    if (!has_ext(ctx, RVC) && !ctx->cfg_ptr->ext_zca &&
> +        ((ctx->base.pc_next + a->imm) & 0x3)) {
>           /* misaligned */
>           gen_exception_inst_addr_mis(ctx);
>       } else {
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index d0094922b6..661e29ab39 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -551,7 +551,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>   
>       /* check misaligned: */
>       next_pc = ctx->base.pc_next + imm;
> -    if (!ctx->cfg_ptr->ext_zca) {
> +    if (!has_ext(ctx, RVC) && !ctx->cfg_ptr->ext_zca) {
>           if ((next_pc & 0x3) != 0) {
>               gen_exception_inst_addr_mis(ctx);
>               return;
> @@ -1137,7 +1137,8 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>            * The Zca extension is added as way to refer to instructions in the C
>            * extension that do not include the floating-point loads and stores
>            */
> -        if (ctx->cfg_ptr->ext_zca && decode_insn16(ctx, opcode)) {
> +        if ((has_ext(ctx, RVC) || ctx->cfg_ptr->ext_zca) &&
> +            decode_insn16(ctx, opcode)) {
>               return;
>           }
>       } else {

