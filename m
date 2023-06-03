Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8D0C77B7A
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 15:24:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5T7D-0003df-UW; Sat, 03 Jun 2023 11:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5T7C-0003bE-IM
 for qemu-riscv@nongnu.org; Sat, 03 Jun 2023 11:24:26 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5T7A-000692-MJ
 for qemu-riscv@nongnu.org; Sat, 03 Jun 2023 11:24:26 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-256712d65ceso1447758a91.1
 for <qemu-riscv@nongnu.org>; Sat, 03 Jun 2023 08:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685805863; x=1688397863;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hM+FaAlSvgblKVizBVmEQLYIygbxPzGUUV2ppzqGV4o=;
 b=OuO78YjgBgAFC/xdyg12DOlNnChxOrXygogW2eDgn+f/Djh8ZZu2OnvzJ/qxSj57GR
 I+Ba9wwydiWGK526yRnUI1IEuOmGLFef77Jeiku/t6PgZIk8yr9qcJw4VZuOLa00rmvt
 X+5a7gC9kRkCB1gobSb5uiJ+/Lf7Qvcj1Oc/YjzN/UvSM8yeHg79zPzVIwL/XPbQWh0o
 YevURH8KsxEHKsf5i2zW8TbGtMeXhWDhbQcn4MDmeALVrkZkLWImp7tljBuMA9KSf+1B
 ccNipqkm4MNXODgvo/zZAGSutMRjuQY2M2Vvfr9KgjjEap0ypYtk3fs2rn6jAa+ReYX2
 1hsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685805863; x=1688397863;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hM+FaAlSvgblKVizBVmEQLYIygbxPzGUUV2ppzqGV4o=;
 b=asgsnUQtAWrlgM0/uH6cGD6fnkIIslmTAOmuYhQT5w+uiMc2A64XFlY1nV4DXRr0rl
 4YOBW7+aWvPttJsPTR9GQwkIxVEp+Xkw1AzDFew85c9oZATPEOPzC1cAPxhfpqdoRB3Y
 HnYfKyB0V2cGOVEz2L5lkmOSf6/R+xSeOoRwOv2JnBhoA4TCe1FXlwVk0fIh/D/dCRsw
 5SuW8uLNJ9Lz0lrvl+7mXJwkwKXJsEm233uUmW/J2mI7zInfEBwPVeY90T7ckTYfZyYS
 lxa62UFRMQ36llus7rsHf/1GyfTAmkC75whFyv/DJZyGpOTY3QmbrIoGfOjgmxYBx5Ui
 FTeA==
X-Gm-Message-State: AC+VfDyTlXwdJv4WFp3z4MmLfcQ4cL8qiYBTEYTseaXgV/GP9iV/AVRD
 5FlctDy2yFVoL/9Ceo4lzUfqiw==
X-Google-Smtp-Source: ACHHUZ51HrScMseULoSlXBHH7fkeNcrCa9J50i2dhzwQZZFgd62/FYJHzz3y6cLgDeC7ZRRYZsuXsw==
X-Received: by 2002:a17:90b:1013:b0:258:7b3d:c2c7 with SMTP id
 gm19-20020a17090b101300b002587b3dc2c7mr1433708pjb.7.1685805863121; 
 Sat, 03 Jun 2023 08:24:23 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:9a37:84b6:b3f0:f301?
 ([2602:ae:1598:4c01:9a37:84b6:b3f0:f301])
 by smtp.gmail.com with ESMTPSA id
 10-20020a17090a194a00b00250cf4e7d25sm5089389pjh.41.2023.06.03.08.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 08:24:22 -0700 (PDT)
Message-ID: <d7268399-c424-fd84-9323-df0d2c15db3d@linaro.org>
Date: Sat, 3 Jun 2023 08:24:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 04/35] crypto: Add aesenc_SB_SR
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
 <20230603023426.1064431-5-richard.henderson@linaro.org>
 <CAMj1kXFuESELf9gjsBBKOtZKLxM2cyuzBecQm4+KHT4XtiRLhA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAMj1kXFuESELf9gjsBBKOtZKLxM2cyuzBecQm4+KHT4XtiRLhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 6/3/23 06:15, Ard Biesheuvel wrote:
>> diff --git a/crypto/aes.c b/crypto/aes.c
>> index 1309a13e91..708838315a 100644
>> --- a/crypto/aes.c
>> +++ b/crypto/aes.c
>> @@ -29,6 +29,7 @@
>>    */
>>   #include "qemu/osdep.h"
>>   #include "crypto/aes.h"
>> +#include "crypto/aes-round.h"
>>
>>   typedef uint32_t u32;
>>   typedef uint8_t u8;
>> @@ -1251,6 +1252,52 @@ static const u32 rcon[] = {
>>           0x1B000000, 0x36000000, /* for 128-bit blocks, Rijndael never uses more than 10 rcon values */
>>   };
>>
>> +/* Perform SubBytes + ShiftRows. */
>> +static inline void
>> +aesenc_SB_SR_swap(AESState *r, const AESState *st, bool swap)
>> +{
>> +    const int swap_b = swap ? 15 : 0;
>> +    uint8_t t;
>> +
>> +    /* These four indexes are not swizzled. */
>> +    r->b[swap_b ^ 0x0] = AES_sbox[st->b[swap_b ^ AES_SH_0]];
>> +    r->b[swap_b ^ 0x4] = AES_sbox[st->b[swap_b ^ AES_SH_4]];
>> +    r->b[swap_b ^ 0x8] = AES_sbox[st->b[swap_b ^ AES_SH_8]];
>> +    r->b[swap_b ^ 0xc] = AES_sbox[st->b[swap_b ^ AES_SH_C]];
>> +
>> +    /* Otherwise, break cycles. */
>> +
> 
> This is only needed it r == st, right?

Yes.  This is, perhaps, where using symbolic AES_SH_X while assuming knowledge of the 
value does not aid understanding.


r~

> 
>> +    t = AES_sbox[st->b[swap_b ^ AES_SH_D]];
>> +    r->b[swap_b ^ 0x1] = AES_sbox[st->b[swap_b ^ AES_SH_1]];
>> +    r->b[swap_b ^ 0x5] = AES_sbox[st->b[swap_b ^ AES_SH_5]];
>> +    r->b[swap_b ^ 0x9] = AES_sbox[st->b[swap_b ^ AES_SH_9]];
>> +    r->b[swap_b ^ 0xd] = t;
>> +
>> +    t = AES_sbox[st->b[swap_b ^ AES_SH_A]];
>> +    r->b[swap_b ^ 0x2] = AES_sbox[st->b[swap_b ^ AES_SH_2]];
>> +    r->b[swap_b ^ 0xa] = t;
>> +
>> +    t = AES_sbox[st->b[swap_b ^ AES_SH_E]];
>> +    r->b[swap_b ^ 0x6] = AES_sbox[st->b[swap_b ^ AES_SH_6]];
>> +    r->b[swap_b ^ 0xe] = t;
>> +
>> +    t = AES_sbox[st->b[swap_b ^ AES_SH_7]];
>> +    r->b[swap_b ^ 0x3] = AES_sbox[st->b[swap_b ^ AES_SH_3]];
>> +    r->b[swap_b ^ 0xf] = AES_sbox[st->b[swap_b ^ AES_SH_F]];
>> +    r->b[swap_b ^ 0xb] = AES_sbox[st->b[swap_b ^ AES_SH_B]];
>> +    r->b[swap_b ^ 0x7] = t;
>> +}
>> +
>> +void aesenc_SB_SR_gen(AESState *r, const AESState *st)
>> +{
>> +    aesenc_SB_SR_swap(r, st, false);
>> +}
>> +
>> +void aesenc_SB_SR_genrev(AESState *r, const AESState *st)
>> +{
>> +    aesenc_SB_SR_swap(r, st, true);
>> +}
>> +
>>   /**
>>    * Expand the cipher key into the encryption key schedule.
>>    */
>> --
>> 2.34.1
>>


