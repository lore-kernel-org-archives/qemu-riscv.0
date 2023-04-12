Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmdsf-0006Dy-4M
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 13:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmdsd-0006B3-Pp
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 13:03:36 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmdsb-0004ev-14
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 13:03:35 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1841c57c221so16800640fac.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 10:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681319011;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5Hnw2ko+VMxIWJz9n48zVlCwGEZGBCRLOKloIfWaNio=;
 b=AFY63e8qQu41gJppJYhL/AydDJK7UwowjG07VG/Rs66B35Tp/ucTZbQoMQ6pVpnPLu
 mHyIwBHFR8b5YWM2AVs9vX5CAxx7jyyzwDptgT4dRlgS/3SPe0PKWQm1sNyjM0egx/Gy
 Cq4KBkx0U2wA/bJZ7PkVMa38rMt6bNuMG7PhUEDvIlWE6nJUSonHoGji7w1fKU+dpzH7
 TqdNOExUKdzxVbcVr/3Q7Mbw227jB/G68P3DovhRLYguLnkeZBibZcEPqjCgcNa/c1HZ
 Ym2AEaosZewO77cWtPyvaijOttPbndeFkVzo9YDpY0P4VEzztBZjfJ6UtQOzA2kCqZOO
 O+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681319011;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Hnw2ko+VMxIWJz9n48zVlCwGEZGBCRLOKloIfWaNio=;
 b=kzVmREO5sgE60b3zhopbhItQEz1QMsCloj1B5ddxP2+KQ0z39XHfMxP7+pF1AxrZCR
 Wa8OPyLn3CB5uB6uRhybq0gFP48jBqwFaBI70//82tiU3gFjsHLvgo7rUiLugDLM7/nZ
 YCIO/NJkQGtTgpxXZOFSaudRfrQpA1X/1/ZeSkIyJov2Y2/yO3JsWxh8FfuvfGUBUTTM
 YBUJoZ1h8G5sK/Ohd0yu8zQKeHRtSu7ZO1tLf/+UqOhmJPsFmIqpDU2Ooos6jp8ft9wZ
 2Q2WcVz7olKY52587Z1k1VOdnTpPhrSA3s/BrJb8hbLCZ+eQFiZSsovX2tqa72CIfSSC
 1UKw==
X-Gm-Message-State: AAQBX9cziyqP6oI1Wc2ffVBXF4DDd5CtO9XRiytiMngBFlRGYmEjELqS
 DKB4cfmrF3taWVGb8hWdb6Cd6w==
X-Google-Smtp-Source: AKy350YEy/fglJWmkWoS2V4qE2mg0qhhh+g7hk5p7hUC9962h0MEo8RUrn8s24NNO3KZHY80OqoD6g==
X-Received: by 2002:a05:6870:2196:b0:178:fe16:4e6c with SMTP id
 l22-20020a056870219600b00178fe164e6cmr1898590oae.50.1681319011529; 
 Wed, 12 Apr 2023 10:03:31 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 ug24-20020a0568714d1800b001723f29f6e2sm2057142oab.37.2023.04.12.10.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 10:03:31 -0700 (PDT)
Message-ID: <c581590c-88e6-0eb2-3e89-d00436091824@ventanamicro.com>
Date: Wed, 12 Apr 2023 14:03:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] target/riscv: Update check for Zca/zcf/zcd
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, Richard Henderson <richard.henderson@linaro.org>
References: <20230412030648.80470-1-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230412030648.80470-1-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 17:03:36 -0000



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

Two things:

- the patch fails checkpatch.pl. I fixed it in my tree, but in case the patch
needs a new version entirely here's the error:

v7-0005-target-riscv-Mask-the-implicitly-enabled-extensio.patch has no obvious style problems and is ready for submission.

Checking v7-0006-target-riscv-Update-check-for-Zca-zcf-zcd.patch...
ERROR: space required before the open parenthesis '('
#36: FILE: target/riscv/insn_trans/trans_rvd.c.inc:36:
+        if(!has_ext(ctx, RVD) || !has_ext(ctx, RVC)) { \

ERROR: space required before the open parenthesis '('
#72: FILE: target/riscv/insn_trans/trans_rvf.c.inc:35:
+        if(!has_ext(ctx, RVF) || !has_ext(ctx, RVC)) { \



- yesterday Richard sent the following review in the patch "[RFC PATCH 3/4]
target/riscv: check smstateen fcsr flag":


====================================

> +#define REQUIRE_ZFINX_OR_F(ctx) do { \
> +    if (!has_ext(ctx, RVF)) { \
> +        if (!ctx->cfg_ptr->ext_zfinx) { \
> +            return false; \
> +        } \
> +        smstateen_fcsr_check(ctx); \
>       } \
>   } while (0)

As a matter of style, I strongly object to a *nested* macro returning from the calling function.  These should all be changed to normal functions of the form

     if (!require_xyz(ctx) || !require_abc(ctx)) {
         return something;
     }

etc.  insn_trans/trans_rvv.c.inc is much much cleaner in this respect.

====================================

I believe his comment is also valid for this patch as well due to how
REQUIRE_ZCD_OR_DC(ctx) and REQUIRE_ZCF_OR_FC(ctx) is implemented. Before
re-sending this patch as is it's better to check with him now.

Richard, does this patch use the nested macro style you strongly object?


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

