Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4EAC021B2
	for <qemu-riscv@archiver.kernel.org>; Sat, 22 Feb 2025 18:17:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tlu4L-0007aD-IX; Sat, 22 Feb 2025 13:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tlu4J-0007ZS-F2
 for qemu-riscv@nongnu.org; Sat, 22 Feb 2025 13:17:39 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tlu4H-0001kM-Fn
 for qemu-riscv@nongnu.org; Sat, 22 Feb 2025 13:17:39 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-220e6028214so68966655ad.0
 for <qemu-riscv@nongnu.org>; Sat, 22 Feb 2025 10:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740248255; x=1740853055; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FRkI/Fb9WSLKtDmJG8RONehw53nMPKPblJ9FWNeo4xA=;
 b=DI2j+DhFi59psVBiqjhLAzhIRd36p5cPm2VAIm4Skxbv081xliGf7en7IcR4P9Wo28
 3oC8cFzBiQtleOxUt8c0YViYSUGUq+25qHEMJkFSFCqJtkNXRgFwI5iOC/oAbCuRCtJz
 BrZn0w+q6JJ4kCETtDBUi/5IFNoC6kD9QxtAK77hon/4BjZYrAyrPM+gZ2h6PAjvTFOj
 KgR3XcKtxceVOehnoRCKEVIhOIRzlkmJyHmWV+l50FLHUjhXtAab+i+8BmttDxFzZCCn
 a2AXbVCgSRVGmBIxVzZTx2MGgcrdHPHq4RnXgMcBNDxSoAF8XYYp9l/1ETBJRWW8W6Lv
 Lspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740248255; x=1740853055;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FRkI/Fb9WSLKtDmJG8RONehw53nMPKPblJ9FWNeo4xA=;
 b=Lq3dVv/P+C/MESSifJhb6+iqCtfkA1XQpmQwWZrlhWBfuNlOA0piH2bCwQWyrJM3fo
 wMF++lUNAztpn4Rcenhepw6RToA/8o+AEWBe2Sxq1Icy4UA8leXZCcPwAQVSYfBJe4Gk
 dOuRxAAh53vLTCY4S++622f9oKzk+Zbjc30ET0WqWoMOlT7z866r5I1tgAcJlogFWqTF
 /3bEwuklu3YTvlDOPXym5Abz/NWoSnaYMxKYvu1VR5Oi1xS0Mbk4v2OTtsm9Qvd2DqZG
 FtcKadqbsxlHioKmmV1lM70KvRdaSajezBennrIGYqlb/NLdMNzQtlSLlQUeO+l6H/uG
 2Gbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtJXNIwz1f+VThMlqPs8hElCt0rNrFXkIZpTS+7sKFuwVFwcTvCRBe01ql9LmrQPYYq9AWoRZirTSA@nongnu.org
X-Gm-Message-State: AOJu0Yw5goYL8QklXhJCb0JQd7kBchDbfmGa5VQw9sJPZEnrUgccwAjM
 4C4Lbma/H5vRyYmsWe1hIZvp691Bz5fQrzNh20ObkjaJcC8b9NC/F6CE/9WbMY0=
X-Gm-Gg: ASbGncvXLIvBlsTcQLcu14qBTP02ZVPpG4pIOAgdCZY4TgRLVpxSi9C5/wSrz0MCxpD
 d7xVE8vWx6BqjESzmLDGqev6jikglEDUYGIs2nhTSZsROdIIUzs8LTISr+/wTzuU5XgJw7GzI4S
 1/yNtvDMG5tCS4Dee2PQ3WTdq8FSs6DZ12TcIpA5TvRlJ3PXnN9F3X5hmMnt84RPqfyR6EcjP8r
 Wi2njC8ILMOLgxAmEJDXahy5LRu4bR9FU9l2NQ820cPmRQI6g3c7totMYQi9S1gY3VMCgtWr4+e
 VmdB6TdJjLhnNAfhD5fSpeplb6vO3kvVGGR0kK0d/RMCY3VnB4i/ie7np+nDNCfRTsmuHMvY6w2
 srQC0OO4=
X-Google-Smtp-Source: AGHT+IEkUsH/X84S/nU1JKWqAd5GhWsDdJeTsRdyiiaJTaTOBdhdrVzL5mhhVK0g83PMsAi70FiZDA==
X-Received: by 2002:a05:6a00:4fc6:b0:730:7499:4043 with SMTP id
 d2e1a72fcca58-73426aedd26mr11293067b3a.0.1740248254894; 
 Sat, 22 Feb 2025 10:17:34 -0800 (PST)
Received: from [10.254.143.227] (syn-156-019-246-023.biz.spectrum.com.
 [156.19.246.23]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73271666ca7sm12782024b3a.155.2025.02.22.10.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Feb 2025 10:17:34 -0800 (PST)
Message-ID: <2a2026eb-b92e-450f-9bcf-211620bdf450@linaro.org>
Date: Sat, 22 Feb 2025 10:17:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 33/42] tcg/riscv: Require TCG_TARGET_REG_BITS == 64
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-riscv <qemu-riscv@nongnu.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
 <20230505212447.374546-34-richard.henderson@linaro.org>
 <95e6af77-05bf-46f5-9e85-ce913b08706e@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <95e6af77-05bf-46f5-9e85-ce913b08706e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 2/20/25 15:27, Philippe Mathieu-Daudé wrote:
> On 5/5/23 23:24, Richard Henderson wrote:
>> The port currently does not support "oversize" guests, which
>> means riscv32 can only target 32-bit guests.  We will soon be
>> building TCG once for all guests.  This implies that we can
>> only support riscv64.
>>
>> Since all Linux distributions target riscv64 not riscv32,
>> this is not much of a restriction and simplifies the code.
>>
>> The brcond2 and setcond2 opcodes are exclusive to 32-bit hosts,
>> so we can and should remove the stubs.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/riscv/tcg-target-con-set.h |   8 --
>>   tcg/riscv/tcg-target.h         |  22 ++--
>>   tcg/riscv/tcg-target.c.inc     | 232 +++++++++------------------------
>>   3 files changed, 72 insertions(+), 190 deletions(-)
> 
> 
>> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
>> index 0deb33701f..dddf2486c1 100644
>> --- a/tcg/riscv/tcg-target.h
>> +++ b/tcg/riscv/tcg-target.h
>> @@ -25,11 +25,14 @@
>>   #ifndef RISCV_TCG_TARGET_H
>>   #define RISCV_TCG_TARGET_H
>> -#if __riscv_xlen == 32
>> -# define TCG_TARGET_REG_BITS 32
>> -#elif __riscv_xlen == 64
>> -# define TCG_TARGET_REG_BITS 64
>> +/*
>> + * We don't support oversize guests.
>> + * Since we will only build tcg once, this in turn requires a 64-bit host.
>> + */
>> +#if __riscv_xlen != 64
>> +#error "unsupported code generation mode"
>>   #endif
>> +#define TCG_TARGET_REG_BITS 64
>>   #define TCG_TARGET_INSN_UNIT_SIZE 4
>>   #define TCG_TARGET_TLB_DISPLACEMENT_BITS 20
>> @@ -83,13 +86,8 @@ typedef enum {
>>   #define TCG_TARGET_STACK_ALIGN          16
>>   #define TCG_TARGET_CALL_STACK_OFFSET    0
>>   #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
>> -#if TCG_TARGET_REG_BITS == 32
>> -#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_EVEN
>> -#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_EVEN
>> -#else
>>   #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
>>   #define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
>> -#endif
>>   #define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
>>   /* optional instructions */
>> @@ -106,8 +104,8 @@ typedef enum {
>>   #define TCG_TARGET_HAS_sub2_i32         1
>>   #define TCG_TARGET_HAS_mulu2_i32        0
>>   #define TCG_TARGET_HAS_muls2_i32        0
>> -#define TCG_TARGET_HAS_muluh_i32        (TCG_TARGET_REG_BITS == 32)
>> -#define TCG_TARGET_HAS_mulsh_i32        (TCG_TARGET_REG_BITS == 32)
>> +#define TCG_TARGET_HAS_muluh_i32        0
>> +#define TCG_TARGET_HAS_mulsh_i32        0
> 
> Should have we squashed the following with these changes?

Yes, mulsh_i32 is not reachable anymore.  At this point I'll just leave this cleanup to 
conversion of mulsh to TCGOutOpBinary.


r~

> 
> -- >8 --
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index f7e1ca5a56f..e395ffcdaf5 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -2323,10 +2323,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, TCGType type,
>           break;
> 
> -    case INDEX_op_mulsh_i32:
>       case INDEX_op_mulsh_i64:
>           tcg_out_opc_reg(s, OPC_MULH, a0, a1, a2);
>           break;
> 
> -    case INDEX_op_muluh_i32:
>       case INDEX_op_muluh_i64:
>           tcg_out_opc_reg(s, OPC_MULHU, a0, a1, a2);
> @@ -2399,4 +2397,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, TCGType type,
>       case INDEX_op_extu_i32_i64:
>       case INDEX_op_extrl_i64_i32:
> +    case INDEX_op_mulsh_i32:
> +    case INDEX_op_muluh_i32:
>       default:
>           g_assert_not_reached();
> @@ -2707,6 +2707,4 @@ tcg_target_op_def(TCGOpcode op, TCGType type, unsigned flags)
> 
>       case INDEX_op_mul_i32:
> -    case INDEX_op_mulsh_i32:
> -    case INDEX_op_muluh_i32:
>       case INDEX_op_div_i32:
>       case INDEX_op_divu_i32:
> ---
> 
>>   #define TCG_TARGET_HAS_ext8s_i32        1
>>   #define TCG_TARGET_HAS_ext16s_i32       1
>>   #define TCG_TARGET_HAS_ext8u_i32        1
>> @@ -128,7 +126,6 @@ typedef enum {
>>   #define TCG_TARGET_HAS_setcond2         1
>>   #define TCG_TARGET_HAS_qemu_st8_i32     0
>> -#if TCG_TARGET_REG_BITS == 64
>>   #define TCG_TARGET_HAS_movcond_i64      0
>>   #define TCG_TARGET_HAS_div_i64          1
>>   #define TCG_TARGET_HAS_rem_i64          1
>> @@ -165,7 +162,6 @@ typedef enum {
>>   #define TCG_TARGET_HAS_muls2_i64        0
>>   #define TCG_TARGET_HAS_muluh_i64        1
>>   #define TCG_TARGET_HAS_mulsh_i64        1
>> -#endif
>>   #define TCG_TARGET_DEFAULT_MO (0)


