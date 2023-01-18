Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pI5Fi-0004vP-O8
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 05:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pI5Fh-0004tQ-Gk
 for qemu-riscv@nongnu.org; Wed, 18 Jan 2023 05:01:05 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pI5Fc-0006bS-Sq
 for qemu-riscv@nongnu.org; Wed, 18 Jan 2023 05:01:05 -0500
Received: by mail-oi1-x244.google.com with SMTP id s124so11368580oif.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Jan 2023 02:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kqHRJrgMg9086sHzFqiEbHqPC3JG19nWmrfTczaXs9s=;
 b=eWmN/vMjxFYQVvTFQaG6yS2Womi6UnfbV19ghoVT6rq38sfsSArjcWvNKOGSIG4NdA
 xxohDc9nWSrw+mEDhGt+cMJmr91Fh+PscLdbF26881d1tkR1NbB/xpZdIPwXGyDwruQ6
 3tWMNh/St+Hxbw0aDYf6vmBrCM+1Qi0DJASSiRHPzc82zIFX2xzGviA/aNkcJwyxqSsP
 raGJy5Ze8NiCtFKq+GuQwWOaJ0t1dCLAiHlOCahR8jQePhDznI25V+NpeK71+/JwTKPC
 pdPN/ic+h+C0meBBi2rjx8kNcQ+k3KHmhh6vB8o22Aq9fL1/6FlgxbIrSEteU+GcDRLh
 2DUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kqHRJrgMg9086sHzFqiEbHqPC3JG19nWmrfTczaXs9s=;
 b=7mX1c0vzzYQ4bBtvLnEp17H4CS1J2yo9Z2Y4Gq5lsZoxN+MB2gbyk0MJbjDSNpmHEd
 dZZnbkHC0srRBabwrkYqP8XLth7c5hmLr8yFA/lNd2d3BJUMYPPejEMqj+/A3jxSCasX
 AkJAGE0d3zqynSZDL8W60K5QslFNQU0+n473ceCI7NPLZwws72SAugN6xC/nGNlwaHr4
 axcZUWc1FyayIFKo0HOdih39WkAWd4ZtzILxhkC1zDPQuSD3uUhKO3nP8Tc2hK+gQBtZ
 Rh1ajjKULiFi/UVwWvpWaIFLoVzPqbmnO0Nv4jY+AtKAgMrazH95U72srNIQxdJPv2a8
 mCXQ==
X-Gm-Message-State: AFqh2krhgWEpkdHKMg8fwkwj+xh/RIO0XmfRgnBHvDPZJ2tcvL0hCDqR
 hvNz/Z30HwaeyY59nzcpMJ83CA==
X-Google-Smtp-Source: AMrXdXvZKtz8dxJLO1emUNKKuQbroz+QIhjcw8ChneUHPuSSw36SMsVP5VBF6QStBc0aE1lXXTbqCQ==
X-Received: by 2002:a05:6808:2087:b0:35b:9195:a363 with SMTP id
 s7-20020a056808208700b0035b9195a363mr3691046oiw.41.1674036042357; 
 Wed, 18 Jan 2023 02:00:42 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 bu10-20020a0568300d0a00b0066eb4e9242esm18143451otb.67.2023.01.18.02.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 02:00:41 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------KV11qSCFGCDoxBrJM0rPUfbN"
Message-ID: <a6908613-9750-473a-161d-a7cb8c8fd14f@ventanamicro.com>
Date: Wed, 18 Jan 2023 07:00:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] target/arm: Introduce helper_set_rounding_mode_chkfrm
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bin.meng@windriver.com,
 abdulras@google.com
References: <20230115160657.3169274-1-richard.henderson@linaro.org>
 <20230115160657.3169274-2-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230115160657.3169274-2-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x244.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 18 Jan 2023 10:01:05 -0000

This is a multi-part message in MIME format.
--------------KV11qSCFGCDoxBrJM0rPUfbN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

s/arm/riscv in subject/commit title ^

On 1/15/23 13:06, Richard Henderson wrote:
> The new helper always validates the contents of FRM, even
> if the new rounding mode is not DYN.  This is required by
> the vector unit.
>
> Track whether we've validated FRM separately from whether
> we've updated fp_status with a given rounding mode, so that
> we can elide calls correctly.
>
> This partially reverts d6c4d3f2a69 which attempted the to do
> the same thing, but with two calls to gen_set_rm(), which is
> both inefficient and tickles an assertion in decode_save_opc.
>
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1441
> Signed-off-by: Richard Henderson<richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/helper.h                   |  1 +
>   target/riscv/fpu_helper.c               | 37 +++++++++++++++++++++++++
>   target/riscv/translate.c                | 19 +++++++++++++
>   target/riscv/insn_trans/trans_rvv.c.inc | 24 +++-------------
>   4 files changed, 61 insertions(+), 20 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 227c7122ef..9792ab5086 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -3,6 +3,7 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
>   
>   /* Floating Point - rounding mode */
>   DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
> +DEF_HELPER_FLAGS_2(set_rounding_mode_chkfrm, TCG_CALL_NO_WG, void, env, i32)
>   DEF_HELPER_FLAGS_1(set_rod_rounding_mode, TCG_CALL_NO_WG, void, env)
>   
>   /* Floating Point - fused */
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index 5699c9517f..96817df8ef 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -81,6 +81,43 @@ void helper_set_rounding_mode(CPURISCVState *env, uint32_t rm)
>       set_float_rounding_mode(softrm, &env->fp_status);
>   }
>   
> +void helper_set_rounding_mode_chkfrm(CPURISCVState *env, uint32_t rm)
> +{
> +    int softrm;
> +
> +    /* Always validate frm, even if rm != DYN. */
> +    if (unlikely(env->frm >= 5)) {
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> +    }
> +    if (rm == RISCV_FRM_DYN) {
> +        rm = env->frm;
> +    }
> +    switch (rm) {
> +    case RISCV_FRM_RNE:
> +        softrm = float_round_nearest_even;
> +        break;
> +    case RISCV_FRM_RTZ:
> +        softrm = float_round_to_zero;
> +        break;
> +    case RISCV_FRM_RDN:
> +        softrm = float_round_down;
> +        break;
> +    case RISCV_FRM_RUP:
> +        softrm = float_round_up;
> +        break;
> +    case RISCV_FRM_RMM:
> +        softrm = float_round_ties_away;
> +        break;
> +    case RISCV_FRM_ROD:
> +        softrm = float_round_to_odd;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    set_float_rounding_mode(softrm, &env->fp_status);
> +}
> +
>   void helper_set_rod_rounding_mode(CPURISCVState *env)
>   {
>       set_float_rounding_mode(float_round_to_odd, &env->fp_status);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index df38db7553..493c3815e1 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -114,6 +114,8 @@ typedef struct DisasContext {
>       bool pm_base_enabled;
>       /* Use icount trigger for native debug */
>       bool itrigger;
> +    /* FRM is known to contain a valid value. */
> +    bool frm_valid;
>       /* TCG of the current insn_start */
>       TCGOp *insn_start;
>   } DisasContext;
> @@ -674,12 +676,29 @@ static void gen_set_rm(DisasContext *ctx, int rm)
>           gen_helper_set_rod_rounding_mode(cpu_env);
>           return;
>       }
> +    if (rm == RISCV_FRM_DYN) {
> +        /* The helper will return only if frm valid. */
> +        ctx->frm_valid = true;
> +    }
>   
>       /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
>       decode_save_opc(ctx);
>       gen_helper_set_rounding_mode(cpu_env, tcg_constant_i32(rm));
>   }
>   
> +static void gen_set_rm_chkfrm(DisasContext *ctx, int rm)
> +{
> +    if (ctx->frm == rm && ctx->frm_valid) {
> +        return;
> +    }
> +    ctx->frm = rm;
> +    ctx->frm_valid = true;
> +
> +    /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
> +    decode_save_opc(ctx);
> +    gen_helper_set_rounding_mode_chkfrm(cpu_env, tcg_constant_i32(rm));
> +}
> +
>   static int ex_plus_1(DisasContext *ctx, int nf)
>   {
>       return nf + 1;
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index d455acedbf..bbb5c3a7b5 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2679,13 +2679,9 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
>                       int rm)
>   {
>       if (checkfn(s, a)) {
> -        if (rm != RISCV_FRM_DYN) {
> -            gen_set_rm(s, RISCV_FRM_DYN);
> -        }
> -
>           uint32_t data = 0;
>           TCGLabel *over = gen_new_label();
> -        gen_set_rm(s, rm);
> +        gen_set_rm_chkfrm(s, rm);
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>           tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
> @@ -2882,17 +2878,13 @@ static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
>   static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>   {                                                                  \
>       if (CHECK(s, a)) {                                             \
> -        if (FRM != RISCV_FRM_DYN) {                                \
> -            gen_set_rm(s, RISCV_FRM_DYN);                          \
> -        }                                                          \
> -                                                                   \
>           uint32_t data = 0;                                         \
>           static gen_helper_gvec_3_ptr * const fns[2] = {            \
>               gen_helper_##HELPER##_h,                               \
>               gen_helper_##HELPER##_w,                               \
>           };                                                         \
>           TCGLabel *over = gen_new_label();                          \
> -        gen_set_rm(s, FRM);                                        \
> +        gen_set_rm_chkfrm(s, FRM);                                 \
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
>           tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                      \
> @@ -3005,17 +2997,13 @@ static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
>   static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>   {                                                                  \
>       if (CHECK(s, a)) {                                             \
> -        if (FRM != RISCV_FRM_DYN) {                                \
> -            gen_set_rm(s, RISCV_FRM_DYN);                          \
> -        }                                                          \
> -                                                                   \
>           uint32_t data = 0;                                         \
>           static gen_helper_gvec_3_ptr * const fns[2] = {            \
>               gen_helper_##HELPER##_h,                               \
>               gen_helper_##HELPER##_w,                               \
>           };                                                         \
>           TCGLabel *over = gen_new_label();                          \
> -        gen_set_rm(s, FRM);                                        \
> +        gen_set_rm_chkfrm(s, FRM);                                 \
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
>           tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                      \
> @@ -3060,10 +3048,6 @@ static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
>   static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>   {                                                                  \
>       if (opxfv_narrow_check(s, a)) {                                \
> -        if (FRM != RISCV_FRM_DYN) {                                \
> -            gen_set_rm(s, RISCV_FRM_DYN);                          \
> -        }                                                          \
> -                                                                   \
>           uint32_t data = 0;                                         \
>           static gen_helper_gvec_3_ptr * const fns[3] = {            \
>               gen_helper_##HELPER##_b,                               \
> @@ -3071,7 +3055,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>               gen_helper_##HELPER##_w,                               \
>           };                                                         \
>           TCGLabel *over = gen_new_label();                          \
> -        gen_set_rm(s, FRM);                                        \
> +        gen_set_rm_chkfrm(s, FRM);                                 \
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
>           tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                      \

--------------KV11qSCFGCDoxBrJM0rPUfbN
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font size="4">s/arm/riscv in subject/commit title ^</font><br>
    <br>
    <div class="moz-cite-prefix">On 1/15/23 13:06, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230115160657.3169274-2-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">The new helper always validates the contents of FRM, even
if the new rounding mode is not DYN.  This is required by
the vector unit.

Track whether we've validated FRM separately from whether
we've updated fp_status with a given rounding mode, so that
we can elide calls correctly.

This partially reverts d6c4d3f2a69 which attempted the to do
the same thing, but with two calls to gen_set_rm(), which is
both inefficient and tickles an assertion in decode_save_opc.

Resolves: <a class="moz-txt-link-freetext" href="https://gitlab.com/qemu-project/qemu/-/issues/1441">https://gitlab.com/qemu-project/qemu/-/issues/1441</a>
Signed-off-by: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a>
---</pre>
    </blockquote>
    <br>
    Reviewed-by: Daniel Henrique Barboza
    <a class="moz-txt-link-rfc2396E" href="mailto:dbarboza@ventanamicro.com">&lt;dbarboza@ventanamicro.com&gt;</a><br>
    <br>
    <blockquote type="cite"
      cite="mid:20230115160657.3169274-2-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">
 target/riscv/helper.h                   |  1 +
 target/riscv/fpu_helper.c               | 37 +++++++++++++++++++++++++
 target/riscv/translate.c                | 19 +++++++++++++
 target/riscv/insn_trans/trans_rvv.c.inc | 24 +++-------------
 4 files changed, 61 insertions(+), 20 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 227c7122ef..9792ab5086 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -3,6 +3,7 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
 
 /* Floating Point - rounding mode */
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
+DEF_HELPER_FLAGS_2(set_rounding_mode_chkfrm, TCG_CALL_NO_WG, void, env, i32)
 DEF_HELPER_FLAGS_1(set_rod_rounding_mode, TCG_CALL_NO_WG, void, env)
 
 /* Floating Point - fused */
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 5699c9517f..96817df8ef 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -81,6 +81,43 @@ void helper_set_rounding_mode(CPURISCVState *env, uint32_t rm)
     set_float_rounding_mode(softrm, &amp;env-&gt;fp_status);
 }
 
+void helper_set_rounding_mode_chkfrm(CPURISCVState *env, uint32_t rm)
+{
+    int softrm;
+
+    /* Always validate frm, even if rm != DYN. */
+    if (unlikely(env-&gt;frm &gt;= 5)) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+    if (rm == RISCV_FRM_DYN) {
+        rm = env-&gt;frm;
+    }
+    switch (rm) {
+    case RISCV_FRM_RNE:
+        softrm = float_round_nearest_even;
+        break;
+    case RISCV_FRM_RTZ:
+        softrm = float_round_to_zero;
+        break;
+    case RISCV_FRM_RDN:
+        softrm = float_round_down;
+        break;
+    case RISCV_FRM_RUP:
+        softrm = float_round_up;
+        break;
+    case RISCV_FRM_RMM:
+        softrm = float_round_ties_away;
+        break;
+    case RISCV_FRM_ROD:
+        softrm = float_round_to_odd;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    set_float_rounding_mode(softrm, &amp;env-&gt;fp_status);
+}
+
 void helper_set_rod_rounding_mode(CPURISCVState *env)
 {
     set_float_rounding_mode(float_round_to_odd, &amp;env-&gt;fp_status);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index df38db7553..493c3815e1 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -114,6 +114,8 @@ typedef struct DisasContext {
     bool pm_base_enabled;
     /* Use icount trigger for native debug */
     bool itrigger;
+    /* FRM is known to contain a valid value. */
+    bool frm_valid;
     /* TCG of the current insn_start */
     TCGOp *insn_start;
 } DisasContext;
@@ -674,12 +676,29 @@ static void gen_set_rm(DisasContext *ctx, int rm)
         gen_helper_set_rod_rounding_mode(cpu_env);
         return;
     }
+    if (rm == RISCV_FRM_DYN) {
+        /* The helper will return only if frm valid. */
+        ctx-&gt;frm_valid = true;
+    }
 
     /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
     decode_save_opc(ctx);
     gen_helper_set_rounding_mode(cpu_env, tcg_constant_i32(rm));
 }
 
+static void gen_set_rm_chkfrm(DisasContext *ctx, int rm)
+{
+    if (ctx-&gt;frm == rm &amp;&amp; ctx-&gt;frm_valid) {
+        return;
+    }
+    ctx-&gt;frm = rm;
+    ctx-&gt;frm_valid = true;
+
+    /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
+    decode_save_opc(ctx);
+    gen_helper_set_rounding_mode_chkfrm(cpu_env, tcg_constant_i32(rm));
+}
+
 static int ex_plus_1(DisasContext *ctx, int nf)
 {
     return nf + 1;
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index d455acedbf..bbb5c3a7b5 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2679,13 +2679,9 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
                     int rm)
 {
     if (checkfn(s, a)) {
-        if (rm != RISCV_FRM_DYN) {
-            gen_set_rm(s, RISCV_FRM_DYN);
-        }
-
         uint32_t data = 0;
         TCGLabel *over = gen_new_label();
-        gen_set_rm(s, rm);
+        gen_set_rm_chkfrm(s, rm);
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
@@ -2882,17 +2878,13 @@ static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (CHECK(s, a)) {                                             \
-        if (FRM != RISCV_FRM_DYN) {                                \
-            gen_set_rm(s, RISCV_FRM_DYN);                          \
-        }                                                          \
-                                                                   \
         uint32_t data = 0;                                         \
         static gen_helper_gvec_3_ptr * const fns[2] = {            \
             gen_helper_##HELPER##_h,                               \
             gen_helper_##HELPER##_w,                               \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, FRM);                                        \
+        gen_set_rm_chkfrm(s, FRM);                                 \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
@@ -3005,17 +2997,13 @@ static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (CHECK(s, a)) {                                             \
-        if (FRM != RISCV_FRM_DYN) {                                \
-            gen_set_rm(s, RISCV_FRM_DYN);                          \
-        }                                                          \
-                                                                   \
         uint32_t data = 0;                                         \
         static gen_helper_gvec_3_ptr * const fns[2] = {            \
             gen_helper_##HELPER##_h,                               \
             gen_helper_##HELPER##_w,                               \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, FRM);                                        \
+        gen_set_rm_chkfrm(s, FRM);                                 \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
@@ -3060,10 +3048,6 @@ static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (opxfv_narrow_check(s, a)) {                                \
-        if (FRM != RISCV_FRM_DYN) {                                \
-            gen_set_rm(s, RISCV_FRM_DYN);                          \
-        }                                                          \
-                                                                   \
         uint32_t data = 0;                                         \
         static gen_helper_gvec_3_ptr * const fns[3] = {            \
             gen_helper_##HELPER##_b,                               \
@@ -3071,7 +3055,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
             gen_helper_##HELPER##_w,                               \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, FRM);                                        \
+        gen_set_rm_chkfrm(s, FRM);                                 \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------KV11qSCFGCDoxBrJM0rPUfbN--

