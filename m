Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117EEC001B0
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 16:56:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTPzf-0001Yi-9n; Tue, 08 Aug 2023 12:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1qTPzb-0001XM-CM; Tue, 08 Aug 2023 12:55:35 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1qTPzZ-0008Oe-E7; Tue, 08 Aug 2023 12:55:35 -0400
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3a36b52b4a4so29302b6e.1; 
 Tue, 08 Aug 2023 09:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691513731; x=1692118531;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wyi4ub7oJ7O/BO0AcatFFHuD78gUK7bup+CPhQe6tPY=;
 b=X31yBByejknwsAsj/kbLtSFdoeh3nGK668QJiXqCVLt0SaVbMAnbE3MHhptrNj9tjZ
 DNRiVuV706kWkMVUjL+72B+xvZGRpELmYXC/WxM8b+nH6Sg5UJ7VpLqkJKJFa4affDLW
 TRo25xbe5x+b1J41YaImcQmcZN4EZHdW3ioIxF47kIkRz0X+2U2lSHEP9FWVR9d66ont
 Vj6m9vzGT8Yfe95UYM032wqVV5p4BYxoF2jnvU9gRwQZaCn8wu35Sri9sG0CBmLi6mzZ
 fDl8eGc/hYCscWwIQ+kv0H2vFVyAMpeM5DO7Gyt0ZfWVvarrQB5QFooW206HdItbCrcH
 aapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691513731; x=1692118531;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wyi4ub7oJ7O/BO0AcatFFHuD78gUK7bup+CPhQe6tPY=;
 b=FM1bay8zDlb56w8GyPxHEfkz4q+UrsiXaUjkvfmSM9OLYpD1VHUwvRS28rLE49W2jz
 l0O785nwXDefqk+EHlAzn02ml6DkmB876gHIM7T3nBzvU1Pm8mZF1wwflWciiAMf001A
 4J7sJyNHKZd4p9sTjNqRBFY909rhE+6PV6n0JeHs376PDcn7TMplGfMeEQgfMFnUxHBn
 4R4F5DAZ3Ps4vQyeQuG5OG7ho/GmVpRDJyqF2Q9Kc9WhPunAEwwnVrgYp1Ln2WyQwgs8
 mK6Fd9AudAGv2XTLORtnL+jU8CO4bgnCu7w+YL06pOKOvEqHQLm4J3xCuLsSBGrGc+UI
 qADA==
X-Gm-Message-State: AOJu0YycmxXHYLn8bqfpDWLmOVMV9bznKWI2D79Z6uojbck8qbbinKnN
 t7mKaIM4IOsJXuq12WDOJvIhOAVfjm0=
X-Google-Smtp-Source: AGHT+IEm6AZoDdx3wyLjA+81vQCbkTSDWLCiLpMTAHTRqz6/DZPOUKvqBVO3l8MMDuEIuiyJ5gcp/A==
X-Received: by 2002:a05:6808:1590:b0:3a4:1223:d224 with SMTP id
 t16-20020a056808159000b003a41223d224mr10102060oiw.21.1691513730820; 
 Tue, 08 Aug 2023 09:55:30 -0700 (PDT)
Received: from [192.168.68.108] (189-69-160-189.dial-up.telesp.net.br.
 [189.69.160.189]) by smtp.gmail.com with ESMTPSA id
 b10-20020a4a98ca000000b005634ef4f1c0sm5972243ooj.31.2023.08.08.09.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 09:55:30 -0700 (PDT)
Message-ID: <26e28b10-0114-4d3b-fff1-b794f3e7cbca@gmail.com>
Date: Tue, 8 Aug 2023 13:55:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 10/24] tcg/ppc: Implement negsetcond_*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-11-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230808031143.50925-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.14,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=ham autolearn_force=no
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



On 8/8/23 00:11, Richard Henderson wrote:
> In the general case we simply negate.  However with isel we
> may load -1 instead of 1 with no extra effort.
> 
> Consolidate EQ0 and NE0 logic.  Replace the NE0 zero-extension
> with inversion+negation of EQ0, which is never worse and may
> eliminate one insn.  Provide a special case for -EQ0.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   tcg/ppc/tcg-target.h     |   4 +-
>   tcg/ppc/tcg-target.c.inc | 127 ++++++++++++++++++++++++---------------
>   2 files changed, 82 insertions(+), 49 deletions(-)
> 
> diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
> index ba4fd3eb3a..a143b8f1e0 100644
> --- a/tcg/ppc/tcg-target.h
> +++ b/tcg/ppc/tcg-target.h
> @@ -101,7 +101,7 @@ typedef enum {
>   #define TCG_TARGET_HAS_muls2_i32        0
>   #define TCG_TARGET_HAS_muluh_i32        1
>   #define TCG_TARGET_HAS_mulsh_i32        1
> -#define TCG_TARGET_HAS_negsetcond_i32   0
> +#define TCG_TARGET_HAS_negsetcond_i32   1
>   #define TCG_TARGET_HAS_qemu_st8_i32     0
>   
>   #if TCG_TARGET_REG_BITS == 64
> @@ -142,7 +142,7 @@ typedef enum {
>   #define TCG_TARGET_HAS_muls2_i64        0
>   #define TCG_TARGET_HAS_muluh_i64        1
>   #define TCG_TARGET_HAS_mulsh_i64        1
> -#define TCG_TARGET_HAS_negsetcond_i64   0
> +#define TCG_TARGET_HAS_negsetcond_i64   1
>   #endif
>   
>   #define TCG_TARGET_HAS_qemu_ldst_i128   \
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 511e14b180..10448aa0e6 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -1548,8 +1548,20 @@ static void tcg_out_cmp(TCGContext *s, int cond, TCGArg arg1, TCGArg arg2,
>   }
>   
>   static void tcg_out_setcond_eq0(TCGContext *s, TCGType type,
> -                                TCGReg dst, TCGReg src)
> +                                TCGReg dst, TCGReg src, bool neg)
>   {
> +    if (neg && (TCG_TARGET_REG_BITS == 32 || type == TCG_TYPE_I64)) {
> +        /*
> +         * X != 0 implies X + -1 generates a carry.
> +         * RT = (~X + X) + CA
> +         *    = -1 + CA
> +         *    = CA ? 0 : -1
> +         */
> +        tcg_out32(s, ADDIC | TAI(TCG_REG_R0, src, -1));
> +        tcg_out32(s, SUBFE | TAB(dst, src, src));
> +        return;
> +    }
> +
>       if (type == TCG_TYPE_I32) {
>           tcg_out32(s, CNTLZW | RS(src) | RA(dst));
>           tcg_out_shri32(s, dst, dst, 5);
> @@ -1557,18 +1569,28 @@ static void tcg_out_setcond_eq0(TCGContext *s, TCGType type,
>           tcg_out32(s, CNTLZD | RS(src) | RA(dst));
>           tcg_out_shri64(s, dst, dst, 6);
>       }
> +    if (neg) {
> +        tcg_out32(s, NEG | RT(dst) | RA(dst));
> +    }
>   }
>   
> -static void tcg_out_setcond_ne0(TCGContext *s, TCGReg dst, TCGReg src)
> +static void tcg_out_setcond_ne0(TCGContext *s, TCGType type,
> +                                TCGReg dst, TCGReg src, bool neg)
>   {
> -    /* X != 0 implies X + -1 generates a carry.  Extra addition
> -       trickery means: R = X-1 + ~X + C = X-1 + (-X+1) + C = C.  */
> -    if (dst != src) {
> -        tcg_out32(s, ADDIC | TAI(dst, src, -1));
> -        tcg_out32(s, SUBFE | TAB(dst, dst, src));
> -    } else {
> +    if (!neg && (TCG_TARGET_REG_BITS == 32 || type == TCG_TYPE_I64)) {
> +        /*
> +         * X != 0 implies X + -1 generates a carry.  Extra addition
> +         * trickery means: R = X-1 + ~X + C = X-1 + (-X+1) + C = C.
> +         */
>           tcg_out32(s, ADDIC | TAI(TCG_REG_R0, src, -1));
>           tcg_out32(s, SUBFE | TAB(dst, TCG_REG_R0, src));
> +        return;
> +    }
> +    tcg_out_setcond_eq0(s, type, dst, src, false);
> +    if (neg) {
> +        tcg_out32(s, ADDI | TAI(dst, dst, -1));
> +    } else {
> +        tcg_out_xori32(s, dst, dst, 1);
>       }
>   }
>   
> @@ -1590,9 +1612,10 @@ static TCGReg tcg_gen_setcond_xor(TCGContext *s, TCGReg arg1, TCGArg arg2,
>   
>   static void tcg_out_setcond(TCGContext *s, TCGType type, TCGCond cond,
>                               TCGArg arg0, TCGArg arg1, TCGArg arg2,
> -                            int const_arg2)
> +                            int const_arg2, bool neg)
>   {
> -    int crop, sh;
> +    int sh;
> +    bool inv;
>   
>       tcg_debug_assert(TCG_TARGET_REG_BITS == 64 || type == TCG_TYPE_I32);
>   
> @@ -1605,14 +1628,10 @@ static void tcg_out_setcond(TCGContext *s, TCGType type, TCGCond cond,
>       if (arg2 == 0) {
>           switch (cond) {
>           case TCG_COND_EQ:
> -            tcg_out_setcond_eq0(s, type, arg0, arg1);
> +            tcg_out_setcond_eq0(s, type, arg0, arg1, neg);
>               return;
>           case TCG_COND_NE:
> -            if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I32) {
> -                tcg_out_ext32u(s, TCG_REG_R0, arg1);
> -                arg1 = TCG_REG_R0;
> -            }
> -            tcg_out_setcond_ne0(s, arg0, arg1);
> +            tcg_out_setcond_ne0(s, type, arg0, arg1, neg);
>               return;
>           case TCG_COND_GE:
>               tcg_out32(s, NOR | SAB(arg1, arg0, arg1));
> @@ -1621,9 +1640,17 @@ static void tcg_out_setcond(TCGContext *s, TCGType type, TCGCond cond,
>           case TCG_COND_LT:
>               /* Extract the sign bit.  */
>               if (type == TCG_TYPE_I32) {
> -                tcg_out_shri32(s, arg0, arg1, 31);
> +                if (neg) {
> +                    tcg_out_sari32(s, arg0, arg1, 31);
> +                } else {
> +                    tcg_out_shri32(s, arg0, arg1, 31);
> +                }
>               } else {
> -                tcg_out_shri64(s, arg0, arg1, 63);
> +                if (neg) {
> +                    tcg_out_sari64(s, arg0, arg1, 63);
> +                } else {
> +                    tcg_out_shri64(s, arg0, arg1, 63);
> +                }
>               }
>               return;
>           default:
> @@ -1641,7 +1668,7 @@ static void tcg_out_setcond(TCGContext *s, TCGType type, TCGCond cond,
>   
>           isel = tcg_to_isel[cond];
>   
> -        tcg_out_movi(s, type, arg0, 1);
> +        tcg_out_movi(s, type, arg0, neg ? -1 : 1);
>           if (isel & 1) {
>               /* arg0 = (bc ? 0 : 1) */
>               tab = TAB(arg0, 0, arg0);
> @@ -1655,51 +1682,47 @@ static void tcg_out_setcond(TCGContext *s, TCGType type, TCGCond cond,
>           return;
>       }
>   
> +    inv = false;
>       switch (cond) {
>       case TCG_COND_EQ:
>           arg1 = tcg_gen_setcond_xor(s, arg1, arg2, const_arg2);
> -        tcg_out_setcond_eq0(s, type, arg0, arg1);
> -        return;
> +        tcg_out_setcond_eq0(s, type, arg0, arg1, neg);
> +        break;
>   
>       case TCG_COND_NE:
>           arg1 = tcg_gen_setcond_xor(s, arg1, arg2, const_arg2);
> -        /* Discard the high bits only once, rather than both inputs.  */
> -        if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I32) {
> -            tcg_out_ext32u(s, TCG_REG_R0, arg1);
> -            arg1 = TCG_REG_R0;
> -        }
> -        tcg_out_setcond_ne0(s, arg0, arg1);
> -        return;
> +        tcg_out_setcond_ne0(s, type, arg0, arg1, neg);
> +        break;
>   
> +    case TCG_COND_LE:
> +    case TCG_COND_LEU:
> +        inv = true;
> +        /* fall through */
>       case TCG_COND_GT:
>       case TCG_COND_GTU:
> -        sh = 30;
> -        crop = 0;
> -        goto crtest;
> -
> -    case TCG_COND_LT:
> -    case TCG_COND_LTU:
> -        sh = 29;
> -        crop = 0;
> +        sh = 30; /* CR7 CR_GT */
>           goto crtest;
>   
>       case TCG_COND_GE:
>       case TCG_COND_GEU:
> -        sh = 31;
> -        crop = CRNOR | BT(7, CR_EQ) | BA(7, CR_LT) | BB(7, CR_LT);
> +        inv = true;
> +        /* fall through */
> +    case TCG_COND_LT:
> +    case TCG_COND_LTU:
> +        sh = 29; /* CR7 CR_LT */
>           goto crtest;
>   
> -    case TCG_COND_LE:
> -    case TCG_COND_LEU:
> -        sh = 31;
> -        crop = CRNOR | BT(7, CR_EQ) | BA(7, CR_GT) | BB(7, CR_GT);
>       crtest:
>           tcg_out_cmp(s, cond, arg1, arg2, const_arg2, 7, type);
> -        if (crop) {
> -            tcg_out32(s, crop);
> -        }
>           tcg_out32(s, MFOCRF | RT(TCG_REG_R0) | FXM(7));
>           tcg_out_rlw(s, RLWINM, arg0, TCG_REG_R0, sh, 31, 31);
> +        if (neg && inv) {
> +            tcg_out32(s, ADDI | TAI(arg0, arg0, -1));
> +        } else if (neg) {
> +            tcg_out32(s, NEG | RT(arg0) | RA(arg0));
> +        } else if (inv) {
> +            tcg_out_xori32(s, arg0, arg0, 1);
> +        }
>           break;
>   
>       default:
> @@ -2982,11 +3005,19 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>   
>       case INDEX_op_setcond_i32:
>           tcg_out_setcond(s, TCG_TYPE_I32, args[3], args[0], args[1], args[2],
> -                        const_args[2]);
> +                        const_args[2], false);
>           break;
>       case INDEX_op_setcond_i64:
>           tcg_out_setcond(s, TCG_TYPE_I64, args[3], args[0], args[1], args[2],
> -                        const_args[2]);
> +                        const_args[2], false);
> +        break;
> +    case INDEX_op_negsetcond_i32:
> +        tcg_out_setcond(s, TCG_TYPE_I32, args[3], args[0], args[1], args[2],
> +                        const_args[2], true);
> +        break;
> +    case INDEX_op_negsetcond_i64:
> +        tcg_out_setcond(s, TCG_TYPE_I64, args[3], args[0], args[1], args[2],
> +                        const_args[2], true);
>           break;
>       case INDEX_op_setcond2_i32:
>           tcg_out_setcond2(s, args, const_args);
> @@ -3724,6 +3755,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>       case INDEX_op_rotl_i32:
>       case INDEX_op_rotr_i32:
>       case INDEX_op_setcond_i32:
> +    case INDEX_op_negsetcond_i32:
>       case INDEX_op_and_i64:
>       case INDEX_op_andc_i64:
>       case INDEX_op_shl_i64:
> @@ -3732,6 +3764,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>       case INDEX_op_rotl_i64:
>       case INDEX_op_rotr_i64:
>       case INDEX_op_setcond_i64:
> +    case INDEX_op_negsetcond_i64:
>           return C_O1_I2(r, r, ri);
>   
>       case INDEX_op_mul_i32:

