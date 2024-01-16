Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D75C47077
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 20:45:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPqJI-000181-A7; Tue, 16 Jan 2024 15:45:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPqJC-00016T-7S
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 15:45:18 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPqJA-0005TV-BR
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 15:45:17 -0500
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5c21e185df5so7531883a12.1
 for <qemu-riscv@nongnu.org>; Tue, 16 Jan 2024 12:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705437914; x=1706042714; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FErWQ+Oye109Xl0oH0FL/2XSBcWcxV4zW+oUudPTMQk=;
 b=WCbVAS/rEwDtA5q/uFge0FOKZwNnEac7ccllya213oCmf3fQZppFqzMwfMfb2qtH2U
 zIv0W7LSUMg7y/MSUwDenByn32ZPxK/+4yFFaMiF3tr/DQDe3wNitobbZYQDZ8BpsOwn
 ca8aYmPrmZvNVIVtKoTleefLOYMKKgGzZsdCczyKq3Ovtfi5OL70LKLF8l7eagOnPnkG
 hEhJz1q5Ua3iQjk/H/W+mnYkzpAwabTBf3443J4tyOJIDYqCeGDZ+em0SEs5Mk3xvqzn
 o0SE0In/35WEm/SymicLs3is+Buu9Tc4fmDyhmr/lv1sBobdnUl06/sw8IRbFbNMa4nU
 49Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705437914; x=1706042714;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FErWQ+Oye109Xl0oH0FL/2XSBcWcxV4zW+oUudPTMQk=;
 b=GkJ2OX1FxlJGPcSNtdN0tvGdpiftPIbapNPM50m3ljU3OfIRO/3BAXDRILU35484IE
 xkY76vJ2zF9hfP4EgrQV09I4GiNmD4ABPxqRaHJmD2+LxU2boKALXkSE0PnLLpVxmpH8
 lz/h09oMEelp+QTIGxKjM1M2tNIkS3Xa/e/Ci/0AmLpzsWIXAJMROO7zKHRiO5lQdaz+
 fRhk5d0Che17HNTZicnqkHpLjrY9ixS/tqbxJG5hmi28cJBmZ8iZ+1qUErjmEsjAb0aU
 zjyZ3WdWOvXnGobTkBtWAvp9J3QcXwbSMFuudVkdIABDTImtfGJczElOVDTDUClFbwMf
 eA+A==
X-Gm-Message-State: AOJu0YxbPsAcdpfuFBZQ2l2MfsG5DwQVCJt9F44LOf6dfElQbtmw38+7
 f3E/4i24s/W6naybS6sicoyZhb96QnlRWA==
X-Google-Smtp-Source: AGHT+IFJhHOJHfJBcscJKlGJYMnafHE7vexFblql3fXjMg/cx5PqtBAcFNQa5vol0h0ZizB7fpvLAw==
X-Received: by 2002:a05:6a20:9f8b:b0:19a:f27b:a7f7 with SMTP id
 mm11-20020a056a209f8b00b0019af27ba7f7mr4550150pzb.119.1705437914456; 
 Tue, 16 Jan 2024 12:45:14 -0800 (PST)
Received: from [192.168.68.110] ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 x63-20020a626342000000b006da0f15b31csm6344pfb.97.2024.01.16.12.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 12:45:14 -0800 (PST)
Message-ID: <2a1cca79-6b5b-4d64-8d7c-d1c9243a9ee6@ventanamicro.com>
Date: Tue, 16 Jan 2024 17:45:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] target/riscv/vector_helper.c: use vlenb in
 HELPER(vsetvl)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com
References: <20240115222528.257342-1-dbarboza@ventanamicro.com>
 <20240115222528.257342-9-dbarboza@ventanamicro.com>
 <3920915d-3ee8-4dbb-9d39-820b7abf273d@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <3920915d-3ee8-4dbb-9d39-820b7abf273d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 1/15/24 19:57, Richard Henderson wrote:
> On 1/16/24 09:25, Daniel Henrique Barboza wrote:
>> Use the new 'vlenb' CPU config to validate fractional LMUL. The original
>> comparison is done with 'vlen' and 'sew', both in bits. Adjust the shift
>> to use vlenb.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/vector_helper.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
>> index cb944229b0..9e3ae4b5d3 100644
>> --- a/target/riscv/vector_helper.c
>> +++ b/target/riscv/vector_helper.c
>> @@ -45,9 +45,13 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>>                                               xlen - 1 - R_VTYPE_RESERVED_SHIFT);
>>       if (lmul & 4) {
>> -        /* Fractional LMUL - check LMUL * VLEN >= SEW */
>> +        /*
>> +         * Fractional LMUL: check VLEN * LMUL >= SEW,
>> +         * or VLEN * (8 - lmul) >= SEW. Using VLENB we
>> +         * need 3 less shifts rights.
> 
> The last sentence is structured oddly.  Perhaps
> 
>    Using VLENB, we decrease the right shift by 3
> 
> or perhaps just show the expansion:
> 
> /*
>   * Fractional LMUL, check
>   *
>   *    VLEN * LMUL >= SEW
>   *    VLEN >> (8 - lmul) >= sew
>   *    (vlenb << 3) >> (8 - lmul) >= sew
>   *    vlenb >> (8 - 3 - lmul) >= sew
>   */

Just changed the comment to show the expansion. Thanks,


Daniel

> 
> Anyway,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> r~
> 
> 
>> +         */
>>           if (lmul == 4 ||
>> -            cpu->cfg.vlen >> (8 - lmul) < sew) {
>> +            cpu->cfg.vlenb >> (8 - 3 - lmul) < sew) {
>>               vill = true;
>>           }
>>       }
> 

