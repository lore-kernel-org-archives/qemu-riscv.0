Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppzT8-0003d2-1l
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 18:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzT6-0003cu-Ps
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:43:04 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzSq-000184-E2
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:43:04 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2fa47de5b04so2173419f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 15:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682116967; x=1684708967;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XIabMRxvxs+vexQQoUB3fhEDQVchu6pvyca4D9aUyys=;
 b=pHchG8KSDvaKR56km9l/sU3UOVSJ7e++47+MH2rKl8HsB8eSr0ILyH0XWxB/OdmMh8
 5DIlaojW6p+7ItYC9FHvsx2XPRLUIQSdoZI1RFsWwhsTFj1KOLzih9xP47VMeSr5mW7N
 hOEPwDZeLxI4M2pHdTESlkRUk8tSiBu1Z+fw7timPnxzo34EPnfMQpTJ8kSpmPm1a8iQ
 936am8gHfkgXbaO7B8qtsd8uBj/xJqtWiFp24vUkea5Mc+7ri/yGMYBn6DC6v/HzVQFq
 G+cTN753Nj9TYWlydI4rGfbguqJuoBK9BIYvZUdfgAvMwR4rradcIvtFvc+zPJD0stPh
 vDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682116967; x=1684708967;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XIabMRxvxs+vexQQoUB3fhEDQVchu6pvyca4D9aUyys=;
 b=h69nPOEOBY4/e0+/kDlEBDtSKyJgzck5ICBig6FxJYkeCsSNEpHfbZhXpWnCihUZ+S
 QqfqabWuPh+f2lgs5TfU/xlFyT0Fe6misg3tlF5goDghaSsYIbWksvX0t+qyYr67STgb
 fY82o/sUgPOiCdxNmDt5Cmg+Y9BJTjnvGFdBSWL8DFlJmGQecBLbt6WCLjbkf/Eo25ar
 dzVw+Dc8rVlv3XR3NJWmQm3XFXWgy6EdfJdA7fMG8RmGppfGjOJo5IydI0IgtIlXGhhp
 3VRDzvKz25A+SpH2MwMeaXvYS02ycPMdRNAyfK19ldzmfKX5K6aAoqsAoLjKqG9Heiy1
 nWEA==
X-Gm-Message-State: AAQBX9cUp4HKGPJEquyGHiXAUa1lK+IqTeRr1V52ObfGBpr4iuIDf88X
 XK/yTKF5m4bdA4P0CHQA6F0Erg==
X-Google-Smtp-Source: AKy350Z06eqsF9f/ix4mkWAYnXAg0Xd1+35sIGMENmHYXD3o/ZCm49dL9CIx9l+WpQFpO8sfWA8bEA==
X-Received: by 2002:adf:e4d2:0:b0:2f2:7a0e:5cc9 with SMTP id
 v18-20020adfe4d2000000b002f27a0e5cc9mr5388147wrm.19.1682116966832; 
 Fri, 21 Apr 2023 15:42:46 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 h18-20020a5d6892000000b002f9bfac5baesm5329503wru.47.2023.04.21.15.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:42:46 -0700 (PDT)
Message-ID: <81a260d8-b104-57c7-050d-8aa631149fa4@linaro.org>
Date: Sat, 22 Apr 2023 00:42:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 07/54] tcg: Split out tcg_out_ext32s
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-8-richard.henderson@linaro.org>
 <e5cb9092-23c5-8449-9520-4494ccbc5e3c@linaro.org>
In-Reply-To: <e5cb9092-23c5-8449-9520-4494ccbc5e3c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-3.297, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
X-List-Received-Date: Fri, 21 Apr 2023 22:43:05 -0000

On 22/4/23 00:38, Philippe Mathieu-Daudé wrote:
> On 11/4/23 03:04, Richard Henderson wrote:
>> We will need a backend interface for performing 32-bit sign-extend.
>> Use it in tcg_reg_alloc_op in the meantime.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/tcg.c                        |  4 ++++
>>   tcg/aarch64/tcg-target.c.inc     |  9 +++++++--
>>   tcg/arm/tcg-target.c.inc         |  5 +++++
>>   tcg/i386/tcg-target.c.inc        |  5 +++--
>>   tcg/loongarch64/tcg-target.c.inc |  2 +-
>>   tcg/mips/tcg-target.c.inc        | 12 +++++++++---
>>   tcg/ppc/tcg-target.c.inc         |  5 +++--
>>   tcg/riscv/tcg-target.c.inc       |  2 +-
>>   tcg/s390x/tcg-target.c.inc       | 10 +++++-----
>>   tcg/sparc64/tcg-target.c.inc     | 11 ++++++++---
>>   tcg/tci/tcg-target.c.inc         |  9 ++++++++-
>>   11 files changed, 54 insertions(+), 20 deletions(-)
> 
> 
> 
>> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
>> index f55829e9ce..d7964734c3 100644
>> --- a/tcg/aarch64/tcg-target.c.inc
>> +++ b/tcg/aarch64/tcg-target.c.inc
>> @@ -1429,6 +1429,11 @@ static void tcg_out_ext16s(TCGContext *s, 
>> TCGType type, TCGReg rd, TCGReg rn)
>>       tcg_out_sxt(s, type, MO_16, rd, rn);
>>   }
>> +static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rn)
>> +{
>> +    tcg_out_sxt(s, TCG_TYPE_I64, MO_32, rd, rn);
>> +}
>> +
>>   static inline void tcg_out_uxt(TCGContext *s, MemOp s_bits,
>>                                  TCGReg rd, TCGReg rn)
>>   {
>> @@ -2232,7 +2237,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode 
>> opc,
>>       case INDEX_op_bswap32_i64:
>>           tcg_out_rev(s, TCG_TYPE_I32, MO_32, a0, a1);
>>           if (a2 & TCG_BSWAP_OS) {
>> -            tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a0);
>> +            tcg_out_ext32s(s, a0, a0);
>>           }
>>           break;
>>       case INDEX_op_bswap32_i32:
>> @@ -2251,7 +2256,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode 
>> opc,
>>           break;
>>       case INDEX_op_ext_i32_i64:
>> -    case INDEX_op_ext32s_i64:
>>           tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a1);
> 
> While here, maybe reuse the new helper (easier to read):
> 
>              tcg_out_ext32s(s, a0, a1);

Now I see you do that in tcg_out_exts_i32_i64() in 2 patches :)

>>           break;
>>       case INDEX_op_extu_i32_i64:
>> @@ -2322,6 +2326,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode 
>> opc,
>>       case INDEX_op_ext16s_i32:
>>       case INDEX_op_ext16u_i64:
>>       case INDEX_op_ext16u_i32:
>> +    case INDEX_op_ext32s_i64:
>>       default:
>>           g_assert_not_reached();
>>       }
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 


