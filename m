Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB9BC001DE
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 16:51:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTPvM-0000VF-FN; Tue, 08 Aug 2023 12:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1qTPvK-0000Tj-0s; Tue, 08 Aug 2023 12:51:10 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1qTPvH-0007YV-OW; Tue, 08 Aug 2023 12:51:09 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6bca5d6dcedso5041969a34.1; 
 Tue, 08 Aug 2023 09:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691513465; x=1692118265;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VI5PFjE9YBUhjwCuqf3e9kjtNtvvjaG+oSr34t2/i60=;
 b=NKsoFNfwkDfQ6kdY3BS+dFnQu2/txSNS+Cs0UeGDSyLf4BwSBzR8An+PDEEDmmDrsZ
 Adt1vvx1VCG8kt5RMGAuZ6qGDITa0e05Urjoqrkjtpi9i/qpsnuhRvjxQTHJDPhU1jiA
 Gw4wkhct9aYUFnrRXHr46XndbHscqWsV0/HIEtLEdD7G/75jq/5kmZiq4/pETX5RKMFD
 d+2XoPfhrk8LiHNXUYwcdMHHALK5x85t6VCMeYW68MOfxQT+kDxD5eOMj45nUCAUAfv4
 FJFPI7TybJ25/sF8DkomEXA2/2nsE7btf0K0F5URRe2FYtrnJMr5SVLTwaLQHDU1OyhY
 CMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691513465; x=1692118265;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VI5PFjE9YBUhjwCuqf3e9kjtNtvvjaG+oSr34t2/i60=;
 b=P2zHv7OqV2Ri8cMR9t7lnCUouUmnsDsncC3Fqsp+MrvFZcxK91RAbMwRQ573CsfglL
 IkiO5vG/dLmeirvey24JJ1YqWCAGPXL19pI7WncDActlVihzS87I3j112sEiarZlW9YW
 V7vh0Na3rB+V+5tcycLbpTslBUBKi+2lbj1puGXPvomO0VzKsbmNJKP8du6kHc9t3Cwp
 Qvn3ZBkCBvx8g6a37OpjvtRSA0ctckZ2jb1TDN+zTQGsYmwDI9sMh8EXQZ3Q2j/uL7uX
 dbuc7/LM38xr3Cm0PuYc7BG8p7DgCHdUhRTiMBIlvxUnSGEaiFObhkZU26Ehk88gV+x2
 HTSw==
X-Gm-Message-State: AOJu0Yw4lam8bQphJ55aRz0WQnGoigDks08ItqIRkXjVCSnRqxc1H95R
 BVU4OjdxIxypyHH2JXTelOJ6HMymabA=
X-Google-Smtp-Source: AGHT+IHrgsUIbER3dfdTsVwC3Cz2jhAgnsOdZureRYwkfz59cEt34Qc04vQxI9jv8a1cHP7k+ttegg==
X-Received: by 2002:a05:6830:1301:b0:6b8:82ed:ea2e with SMTP id
 p1-20020a056830130100b006b882edea2emr197244otq.4.1691513464869; 
 Tue, 08 Aug 2023 09:51:04 -0700 (PDT)
Received: from [192.168.68.108] (189-69-160-189.dial-up.telesp.net.br.
 [189.69.160.189]) by smtp.gmail.com with ESMTPSA id
 x17-20020a9d6291000000b006b95f0db2besm6200373otk.41.2023.08.08.09.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 09:51:04 -0700 (PDT)
Message-ID: <e3d08774-850c-315e-9902-18fe4d76c1f7@gmail.com>
Date: Tue, 8 Aug 2023 13:51:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 07/24] target/ppc: Use tcg_gen_negsetcond_*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-8-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230808031143.50925-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


>   target/ppc/translate/fixedpoint-impl.c.inc | 6 ++++--
>   target/ppc/translate/vmx-impl.c.inc        | 8 +++-----
>   2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
> index f47f1a50e8..4ce02fd3a4 100644
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -342,12 +342,14 @@ static bool do_set_bool_cond(DisasContext *ctx, arg_X_bi *a, bool neg, bool rev)
>       uint32_t mask = 0x08 >> (a->bi & 0x03);
>       TCGCond cond = rev ? TCG_COND_EQ : TCG_COND_NE;
>       TCGv temp = tcg_temp_new();
> +    TCGv zero = tcg_constant_tl(0);
>   
>       tcg_gen_extu_i32_tl(temp, cpu_crf[a->bi >> 2]);
>       tcg_gen_andi_tl(temp, temp, mask);
> -    tcg_gen_setcondi_tl(cond, cpu_gpr[a->rt], temp, 0);
>       if (neg) {
> -        tcg_gen_neg_tl(cpu_gpr[a->rt], cpu_gpr[a->rt]);
> +        tcg_gen_negsetcond_tl(cond, cpu_gpr[a->rt], temp, zero);
> +    } else {
> +        tcg_gen_setcond_tl(cond, cpu_gpr[a->rt], temp, zero);
>       }
>       return true;
>   }
> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
> index c8712dd7d8..6d7669aabd 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -1341,8 +1341,7 @@ static bool trans_VCMPEQUQ(DisasContext *ctx, arg_VC *a)
>       tcg_gen_xor_i64(t1, t0, t1);
>   
>       tcg_gen_or_i64(t1, t1, t2);
> -    tcg_gen_setcondi_i64(TCG_COND_EQ, t1, t1, 0);
> -    tcg_gen_neg_i64(t1, t1);
> +    tcg_gen_negsetcond_i64(TCG_COND_EQ, t1, t1, tcg_constant_i64(0));
>   
>       set_avr64(a->vrt, t1, true);
>       set_avr64(a->vrt, t1, false);
> @@ -1365,15 +1364,14 @@ static bool do_vcmpgtq(DisasContext *ctx, arg_VC *a, bool sign)
>   
>       get_avr64(t0, a->vra, false);
>       get_avr64(t1, a->vrb, false);
> -    tcg_gen_setcond_i64(TCG_COND_GTU, t2, t0, t1);
> +    tcg_gen_negsetcond_i64(TCG_COND_GTU, t2, t0, t1);
>   
>       get_avr64(t0, a->vra, true);
>       get_avr64(t1, a->vrb, true);
>       tcg_gen_movcond_i64(TCG_COND_EQ, t2, t0, t1, t2, tcg_constant_i64(0));
> -    tcg_gen_setcond_i64(sign ? TCG_COND_GT : TCG_COND_GTU, t1, t0, t1);
> +    tcg_gen_negsetcond_i64(sign ? TCG_COND_GT : TCG_COND_GTU, t1, t0, t1);
>   
>       tcg_gen_or_i64(t1, t1, t2);
> -    tcg_gen_neg_i64(t1, t1);
>   
>       set_avr64(a->vrt, t1, true);
>       set_avr64(a->vrt, t1, false);

