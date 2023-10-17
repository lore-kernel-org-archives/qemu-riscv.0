Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51374CDB465
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 03:37:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsatx-0006bY-SS; Mon, 16 Oct 2023 23:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qsatv-0006ap-Fp
 for qemu-riscv@nongnu.org; Mon, 16 Oct 2023 23:37:47 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qsatt-0005n4-IX
 for qemu-riscv@nongnu.org; Mon, 16 Oct 2023 23:37:47 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-692c02adeefso3724286b3a.3
 for <qemu-riscv@nongnu.org>; Mon, 16 Oct 2023 20:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697513862; x=1698118662;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xX1u1T/04ImVSTVZLQSsv8X1Eh/Z1BWeabQgCxC9zkY=;
 b=msmGHMnYJFoQ7ONPbuU4nmvaOsSioHBKE1b+2bw1e2MK/m08ieyor2nVzGOvyiFG7v
 8wr5sYDC+6GnRA70oASe2lEcLOTZgXAOdsRuthHw5yXN5hkFV+Yhnas06To+mQL8aNWo
 SiR3jd2YW/0C5CTBxvdE4KQnMKsFVcVloCmfKV1TKkgxUhYsSFaEQH5C4m04B9lQm6K7
 P+s8vtwGa95vfpiXoblV5Q612DM9k7T1PagaIM2x0/vTyfRkGIklE2slKDY+clva7PLE
 Hcyw5CoZgfrBreZjWJPSpOqJLI+yPwOiGBf2Wkrh7WzpM4uoVHdzuKydpsAKRQTF+Mvc
 C8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697513862; x=1698118662;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xX1u1T/04ImVSTVZLQSsv8X1Eh/Z1BWeabQgCxC9zkY=;
 b=QuWpwqz15xqVhmM4Z+d/Siip44a9oVUnTJO06pyTH5dl4O3Vna7cfGDpp1XE+1Cdtn
 zsPu1nIqu3G+gEE6LYPHtuSPuYMa8OtZSApI0MWTUGS+QedREP5B6oJwzUWu14iFOX5w
 VinHUIOZnpIQl2BGnF0BWXBW01JHU25R27erxSih8iRy0vPdUDls7nLgXlQV7RwuB58h
 81UnGSzTB/OGwNuC4Wg0n6e8pw0FolK8Tcl/OXjI7i/GTaqZfD0xcrb8m/Ww8RSL0crP
 Hi8S0LmAlZ6UorFiqEdigEaT/wNlrB1E2e2+h9dkKsFi9vl3MKfk0pbb0E7QM9pw78/w
 jeRQ==
X-Gm-Message-State: AOJu0YwkqzdMTBnaNdH++8hDplfixuG3whD1fTNxhxT1IANbNByl9Njm
 hV6YKeP0VRg+AXstVl1SaSP2OA==
X-Google-Smtp-Source: AGHT+IE0S2FWcHS3+GUEWHV0rf5yEd4qpGsRm9iohL1dbwezPl1q37ppkIujY4L6njy5ud15ngGkDQ==
X-Received: by 2002:a05:6300:800a:b0:159:c24f:5fa4 with SMTP id
 an10-20020a056300800a00b00159c24f5fa4mr784763pzc.1.1697513862078; 
 Mon, 16 Oct 2023 20:37:42 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a170902c1c500b001c755810f89sm351630plc.181.2023.10.16.20.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Oct 2023 20:37:41 -0700 (PDT)
Message-ID: <64c66917-2e17-47f6-ad0e-a90d7d89eec1@daynix.com>
Date: Tue, 17 Oct 2023 12:37:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] target/riscv: Remove misa_mxl validation
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20231012054223.37870-1-akihiko.odaki@daynix.com>
 <20231012054223.37870-2-akihiko.odaki@daynix.com>
 <5147b65f-8211-4355-b667-f450dc189ae3@linux.alibaba.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <5147b65f-8211-4355-b667-f450dc189ae3@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::429;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

On 2023/10/17 11:29, LIU Zhiwei wrote:
> 
> On 2023/10/12 13:42, Akihiko Odaki wrote:
>> It is initialized with a simple assignment and there is little room for
>> error. In fact, the validation is even more complex.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   target/riscv/cpu.c | 13 ++-----------
>>   1 file changed, 2 insertions(+), 11 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index f5572704de..550b357fb7 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1042,7 +1042,7 @@ static void 
>> riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>>       }
>>   }
>> -static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>> +static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu)
>>   {
>>       RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
>>       CPUClass *cc = CPU_CLASS(mcc);
>> @@ -1062,11 +1062,6 @@ static void 
>> riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>>       default:
>>           g_assert_not_reached();
>>       }
>> -
>> -    if (env->misa_mxl_max != env->misa_mxl) {
>> -        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
>> -        return;
>> -    }
>>   }
>>   /*
>> @@ -1447,11 +1442,7 @@ static void riscv_cpu_realize_tcg(DeviceState 
>> *dev, Error **errp)
>>           return;
>>       }
>> -    riscv_cpu_validate_misa_mxl(cpu, &local_err);
>> -    if (local_err != NULL) {
>> -        error_propagate(errp, local_err);
>> -        return;
>> -    }
>> +    riscv_cpu_validate_misa_mxl(cpu);
> 
> This it not right.  As we are still working on the supporting for MXL32 
> or SXL32, this validation is needed.

It's not preventing supporting MXL32 or SXL32. It's removing 
env->misa_mxl_max != env->misa_mxl just because it's initialized with a 
simple statement:
env->misa_mxl_max = env->misa_mxl = mxl;

It makes little sense to have a validation code that is more complex 
than the validated code.

> 
> And we can't ensure the all RISC-V cpus have the same misa_mxl_max or 
> misa_mxl,   it is not right to move it to class.
> For example, in the future, riscv64-softmmu can run 32-bit cpu and 
> 64-bit cpu. And maybe in heterogeneous SOC,
> we have 32-bit cpu and 64-bit cpu together.

This patch series does not touch misa_mxl. We don't need to ensure that 
all CPUs have the same misa_mxl_max, but we just need to ensure that 
CPUs in the same class do. Creating a heterogeneous SoC is still 
possible by combining e.g. TYPE_RISCV_CPU_SIFIVE_E31 and 
TYPE_RISCV_CPU_SIFIVE_E51, for example.

