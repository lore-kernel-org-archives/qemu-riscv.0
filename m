Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E545C47077
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 17:52:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPnbv-0006jg-GO; Tue, 16 Jan 2024 12:52:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPnbu-0006j2-5c
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 12:52:26 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPnbs-0001GT-50
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 12:52:25 -0500
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6d9a79a1ad4so5267286b3a.2
 for <qemu-riscv@nongnu.org>; Tue, 16 Jan 2024 09:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705427542; x=1706032342; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cYosPHB0+rSJtznR2kU5n7sSK9qEt3bUoapyBRW/cCg=;
 b=B68g3+QbPmnr2KouAUAFuJmEqjPoJ6s4TgRJln4D6HuI01BO3s/AwIDPsVRkHFeyP4
 owRaJ9BRUzDEC7D9tpgsliVknWMdjakXsQFzsyzvbwCyKxiWKba3NLnYB4fNfLAdnTRB
 TXdAFmLTNU6zX84zGPgFzXP66OiAx4dx9FK6ErcRDfhfnQL+VhZkR3fDyFd8FEAih0p9
 R33MM6dIOig145tvrI0qqIoXjsBNpbVe9URIcrk5iea2+XC58ztzNtCw8Rq30V1MNDmL
 QwgURwVwkvVMV8WkAJJXQ7kC4q/iJ2WRmxklM/1PG8/E8FG74vYtJhmlTcAV59RwAVPV
 9DNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705427542; x=1706032342;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cYosPHB0+rSJtznR2kU5n7sSK9qEt3bUoapyBRW/cCg=;
 b=diOGq2DLc+l6PcvXnaOYcymX6d9YqgRXgKPnItRz9pKn63QVUOw6Nyp5B76uJhVHIl
 LLLONi797YD0mA62OQi2rFh/KguU6i4lYwo9IQqeqna5gywxEp4pHxwtjp5IlLVinE1z
 Y5lTA9LroPZfPIgkuYYmUnR35lLq1WTJJrh582QDzQDX0DDd37hZMH5qFCaW60wSLt+F
 M4ECNoccrQF/LNYwxRoxehORwFjVa6v8vobFsbsHo9YjK4BttZiTyg/19ZVscFdVQiqW
 f/wPWkCkYfTtF/E7sQlFuP1jZLphxhvVVjoHrKhAmWBmm5v8qNUJ/9du0ZEtvXi4RGQD
 fWUA==
X-Gm-Message-State: AOJu0Yz9fQwuiF1zaXvaPeaPaNkKjMehrvSzV5V6EeTGx/UnDImgz2Mf
 fUoNu1N2zNI121p75wwwrdFmdfnaPHuGQw==
X-Google-Smtp-Source: AGHT+IE++LmHsZYa37MwzV2rwTtOc3cZqYrzTsO9r/GtCD2LsAvdS5qORul5baEBNd9HhOhZ2Q114g==
X-Received: by 2002:a05:6a00:2e05:b0:6da:16ec:8afb with SMTP id
 fc5-20020a056a002e0500b006da16ec8afbmr4781852pfb.69.1705427540830; 
 Tue, 16 Jan 2024 09:52:20 -0800 (PST)
Received: from [192.168.68.110] ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 t62-20020a625f41000000b006d9a94a03a8sm10013809pfb.77.2024.01.16.09.52.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 09:52:19 -0800 (PST)
Message-ID: <2d0dd940-69d6-4812-b807-d268306b2105@ventanamicro.com>
Date: Tue, 16 Jan 2024 14:52:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] target/riscv/cpu.h: use 'vlenb' in
 vext_get_vlmax()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com
References: <20240115222528.257342-1-dbarboza@ventanamicro.com>
 <20240115222528.257342-10-dbarboza@ventanamicro.com>
 <86f114b3-10a4-4857-b470-5f61730ed382@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <86f114b3-10a4-4857-b470-5f61730ed382@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42a.google.com
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



On 1/15/24 20:14, Richard Henderson wrote:
> On 1/16/24 09:25, Daniel Henrique Barboza wrote:
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.h | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 11df226a00..7304e478c2 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -692,7 +692,11 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
>>   {
>>       uint8_t sew = FIELD_EX64(vtype, VTYPE, VSEW);
>>       int8_t lmul = sextract32(FIELD_EX64(vtype, VTYPE, VLMUL), 0, 3);
>> -    return cpu->cfg.vlen >> (sew + 3 - lmul);
>> +    /*
>> +     * vlmax = vlen >> (sew + 3 - lmul). With vlenb,
>> +     * 3 less shifts: vlenb >> (sew + 3 - 3 - lmul)
>> +     */
>> +    return cpu->cfg.vlenb >> (sew - lmul);
>>   }
> 
> I take it back -- this doesn't work without the + 3:
> 
>    sew = 0
>    lmul = 3
> 
>     vlenb >> (0 - 3)
>   = vlenb >> -3
> 
> Need
> 
>    vlen = vlenb << 3
>    vlmax = vlen >> (0 + 3 - 3)
>          = vlen >> 0
>          = vlen

I got tricked by the 'sew' variable name there. This formula is using vsew.

I'll fix and re-send. Thanks,


Daniel


> 
> 
> r~
> 
> 

