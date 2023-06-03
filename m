Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E921EC77B7A
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 15:22:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5T4e-0001W5-67; Sat, 03 Jun 2023 11:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5T4c-0001VQ-B2
 for qemu-riscv@nongnu.org; Sat, 03 Jun 2023 11:21:46 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5T4Z-0004sn-IL
 for qemu-riscv@nongnu.org; Sat, 03 Jun 2023 11:21:46 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-25632c99eecso1416216a91.2
 for <qemu-riscv@nongnu.org>; Sat, 03 Jun 2023 08:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685805702; x=1688397702;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bDeY8/V1MFofMcjCxegXtjED3/yVabloEbI1+uzhwhA=;
 b=xCqDG6DXZkCaB4mMUfw1MBRmAH2qj05oRFd4Iskgjn6EKlnCEEzNe2r7m9m07LNXFT
 mG95TYk7clCMuvn1iZeQd4rjHxPcLx8M6CRryiO5aTYu4IIFsiIQPmAmP+qBqHfoqpR/
 lTDWua1LdIXVfthCWgodhmAatoMa425Rfd87k6UhJ33AHAkIVTBmqtV0TNSFUhTEtdp1
 LIRK3EXJWEZHzxbmSW7orjJZkdsPz4NuOVRVZgNhjd+ozqM6tPQQgQNTiqErjDnw5TUU
 uwHXJUWuG+p/42oZiiA4H1F7mFtjYqKjKjsRxeRkflvFP+0151Ho2rOaPbnCfTgqsX9x
 uUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685805702; x=1688397702;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bDeY8/V1MFofMcjCxegXtjED3/yVabloEbI1+uzhwhA=;
 b=AyJKMd+ItkFfL3eRvsnOx9ZpOcSvisbRd3I4Ac/x/XfdDcnr4IpxNPbyof15txJHZv
 ndaBvtleIXKNVAsJ/ljVdl3j2717a0W1KCaF73kxZ/0yIvCGQ8MKA8THZm0ErDughNFy
 Gz/v/hLwjYEfVKnsMgCIVWJkQhhTzu5pkmtuaxl7QleZfZELnawekkq2K2k/XURkCSU2
 mv4WMSXV6Axlrwgj8adtJhrJL27WyogWSquaj3R+pToAgtBXstELDDHyN0ZOHVx7d2aN
 90nm5mt5VM+NoBrw75URsQT+s7NDVS4Sd/SQL/3m7DPJqDDabmn+sWQS1AFFzzyPtVcQ
 Rj2Q==
X-Gm-Message-State: AC+VfDywxA3SydTjp59yA7bqEsmVagUy9FE6+9uHD5FoBcFP+cd2FC6P
 EtrgtLQnB5uyXk15xK2FFEsjwg==
X-Google-Smtp-Source: ACHHUZ7nw+2IMufFvonYFQQSSMPXUcn0lPNCGxLYy9zGuQru0q5Bd370fW96wTjy0eKzvzipuFlehA==
X-Received: by 2002:a17:90a:1d6:b0:256:5634:9cab with SMTP id
 22-20020a17090a01d600b0025656349cabmr1561555pjd.4.1685805701709; 
 Sat, 03 Jun 2023 08:21:41 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:9a37:84b6:b3f0:f301?
 ([2602:ae:1598:4c01:9a37:84b6:b3f0:f301])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a17090a15c900b00256395cb599sm5093684pjd.38.2023.06.03.08.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 08:21:41 -0700 (PDT)
Message-ID: <038845c7-4b73-677e-3302-4d74658c5a1e@linaro.org>
Date: Sat, 3 Jun 2023 08:21:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 02/35] target/arm: Move aesmc and aesimc tables to
 crypto/aes.c
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
 <20230603023426.1064431-3-richard.henderson@linaro.org>
 <CAMj1kXHzTbE2icKpPdA2=-yw-DPGhmy5nLigUn_tjJrZHH+s-A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAMj1kXHzTbE2icKpPdA2=-yw-DPGhmy5nLigUn_tjJrZHH+s-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/3/23 05:45, Ard Biesheuvel wrote:
> On Sat, 3 Jun 2023 at 04:34, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We do not currently have a table in crypto/ for
>> just MixColumns.  Move both tables for consistency.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/crypto/aes.h           |   6 ++
>>   crypto/aes.c                   | 142 ++++++++++++++++++++++++++++++++
>>   target/arm/tcg/crypto_helper.c | 143 ++-------------------------------
>>   3 files changed, 153 insertions(+), 138 deletions(-)
>>
>> diff --git a/include/crypto/aes.h b/include/crypto/aes.h
>> index 822d64588c..24b073d569 100644
>> --- a/include/crypto/aes.h
>> +++ b/include/crypto/aes.h
>> @@ -34,6 +34,12 @@ extern const uint8_t AES_isbox[256];
>>   extern const uint8_t AES_shifts[16];
>>   extern const uint8_t AES_ishifts[16];
>>
>> +/* AES MixColumns, for use with rot32. */
>> +extern const uint32_t AES_mc_rot[256];
>> +
>> +/* AES InvMixColumns, for use with rot32. */
>> +extern const uint32_t AES_imc_rot[256];
>> +
>>   /* AES InvMixColumns */
>>   /* AES_imc[x][0] = [x].[0e, 09, 0d, 0b]; */
>>   /* AES_imc[x][1] = [x].[0b, 0e, 09, 0d]; */
>> diff --git a/crypto/aes.c b/crypto/aes.c
>> index af72ff7779..72c95c38fb 100644
>> --- a/crypto/aes.c
>> +++ b/crypto/aes.c
>> @@ -116,6 +116,148 @@ const uint8_t AES_ishifts[16] = {
>>       0, 13, 10, 7, 4, 1, 14, 11, 8, 5, 2, 15, 12, 9, 6, 3
>>   };
>>
>> +/*
>> + * MixColumns lookup table, for use with rot32.
>> + * From Arm ARM pseudocode.
> 
> I remember writing the code to generate these tables, and my copy of
> the ARM ARM doesn't appear to have them, so this comment seems
> inaccurate to me.

Quite right.  I remember having copied *some* table from the ARM, but it wasn't this one. 
I went back to A.a to double-check that it simply wasn't removed from a recent edition.


r~

