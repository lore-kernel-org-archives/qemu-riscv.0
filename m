Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CB7CCD193
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 09:28:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vAmBL-000058-DT; Mon, 20 Oct 2025 05:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vAmBK-00004t-Em
 for qemu-riscv@nongnu.org; Mon, 20 Oct 2025 05:27:58 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vAmBI-0007Zh-0F
 for qemu-riscv@nongnu.org; Mon, 20 Oct 2025 05:27:58 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b62fcddfa21so2658079a12.1
 for <qemu-riscv@nongnu.org>; Mon, 20 Oct 2025 02:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1760952474; x=1761557274; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4qZvem4EwIGU4LYtNnkcNdEpGFcE9mHNzKBr062p7UM=;
 b=EAIExxwwxRmR1effvV77kbrHCLItSSlk7HbXJrhWldgPJyJ4n4eNFmzmZxdIct2ljk
 895R9847Rszl4Rkkv49ZFoONrczwpRhoIIzIQDVW8gmglp6Zqnc2BZNWSUKUyGwmjrXv
 B8RnpAVGVAwtgMiuzoh45MELqVSDW+N+F44XpKfKpOrIgdepj8A+urK8wGLE+bfrFi1g
 +k5lI9kEroNyYL2EjrdqQ9bj20X/0w62pSd36FHLypxhNhOr5uWup/BJLjTgcyzW0/PR
 D3ECJJo7sawNh7NfaV7Co+IpZQj+hmGYRG2QfDsDSi5Zn3OfYT6TIRbmtuhlpUHtHm5s
 uNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760952474; x=1761557274;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4qZvem4EwIGU4LYtNnkcNdEpGFcE9mHNzKBr062p7UM=;
 b=mu7vfGpEc9SSdjgm0LGI3dsYNF4JnaqzPYjWJ+9/WSGhENJvrXkjJSfrE5Ml/U5X5O
 49dSZA5gAIC1UTd9BUqv3Fft3NiHvog1DhzrdSxOP+hcrBnlliXclSbaP3IZ3UHZod3w
 yF7JoVhPAdQxyZJjnNmxABFW6jYAgD18cRd8QCmiJZxNLFbhj3YwVLJQJT3vCFRe75VL
 ufXi0IoaN9UVuzRsfR23Lmln4CdALEXXYTty9g4piH5DDoIxGowD+5llPEBT86xV0yDh
 RrrSrNtTWpL15CK1WP9C2CFmEbjP5IYGeOgwxmisRJEkj/Kp/NKlhsSdW30vAQ2waUnm
 7zEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUosUmVmDeh6Os2PSnoKzxV+MXE9acAYlLonuNE+EejBp0p3FMYgM1TUs26+i4KMqB1nzXov99ACCMw@nongnu.org
X-Gm-Message-State: AOJu0Yzi9+6CQCqaRfGTwoIsjyC6bh4ZcjT6Rw5Doao2dBhlnC7y16YG
 3zcDXjUfAuduCE/ugOX7QTw32oss/5utKUGSThe4xRQ7VTwfoEco3Hpqzq1cFCJNZy4=
X-Gm-Gg: ASbGncuskmCJfkGIyXKgqW15jFk24s2l8x2M+99GW+y3Msh4Dd9limsUEK1VUXvW2NP
 uyyRneZyYS6wYy2YIquKUT1rCqX1M4iKkGs9a9zvRJdPV/LZn0xsMXSdj0pjHlMtdgrI69Jad6j
 7YhpEoKLomxIB694jbXLO24EuxydPtGDJyVzTd8GcA5BoaqF80yqp5lG83N++fycZJpw7k4sCyB
 RSJTjDd4ff7TqDcKwH8+nxNUiigmw3hM/O3xQlogiiVEP+DqUM2O/Wt+4U7jWf2RSX2d8YHInUi
 GHTovZCIo6LJeBUQAGfaK8hLwwJFdfupPokKJrQ+4BSTbAs7NCIjM6b81mr/PtNJtSLhwFge68K
 zHraa4OHrgLaPn9ee/HENgZFGkLv6U2DHM0JUWs8uOdeJRrpb0DPh7I1W+KNXK5Gt/zCzeYzS9t
 5YnDOy1xCqZQrK9NXvLzyhROKCzQ==
X-Google-Smtp-Source: AGHT+IHMbR9jgDyxTbe0VHaUISG175QC0p/ufK3jM9yjfP15A5bCnXRuFkx5mHjJIdUOfs1QzQWIug==
X-Received: by 2002:a17:902:e552:b0:290:ac36:2ed8 with SMTP id
 d9443c01a7336-290c9ce63d6mr137614935ad.24.1760952474018; 
 Mon, 20 Oct 2025 02:27:54 -0700 (PDT)
Received: from [192.168.68.110] ([152.234.122.223])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2924721948bsm74260765ad.109.2025.10.20.02.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 02:27:53 -0700 (PDT)
Message-ID: <30185454-1c2a-4a74-b094-7879e4f3c1ec@ventanamicro.com>
Date: Mon, 20 Oct 2025 06:27:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix a uninitialized variable warning
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org
References: <20251019-vlen-v1-1-f7352a402f06@rsg.ci.i.u-tokyo.ac.jp>
 <b3cbe49d-e863-456d-a254-b7514e3bb33a@ventanamicro.com>
 <aafbce70-45a1-45cd-9006-df0871fdb3d9@rsg.ci.i.u-tokyo.ac.jp>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <aafbce70-45a1-45cd-9006-df0871fdb3d9@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x529.google.com
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



On 10/19/25 9:22 PM, Akihiko Odaki wrote:
> On 2025/10/19 19:01, Daniel Henrique Barboza wrote:
>>
>>
>> On 10/19/25 5:19 AM, Akihiko Odaki wrote:
>>> riscv_cpu_validate_v() left its variable, min_vlen, uninitialized if
>>> no vector extension is available, causing a compiler warning. Avoid
>>> the warning by calling g_assert_not_reached() in the case.
>>
>> For the compiler point of view the variable will be left uninitialized.
>> In reality we'll always set it to at least '32' in validate_v(). This
>> is how the function is being called:
>>
>>      if (cpu->cfg.ext_zve32x) {
>>          riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
>>          if (local_err != NULL) {
>>              error_propagate(errp, local_err);
>>              return;
>>          }
>>      }
>>
>> This means that inside the function we guarantee that min_vlen will be
>> at least set to 32 because cfg->ext_zve32x will always be true:
>>
>>      if (riscv_has_ext(env, RVV)) {
>>          min_vlen = 128;
>>      } else if (cfg->ext_zve64x) {
>>          min_vlen = 64;
>>      } else if (cfg->ext_zve32x) {
>>          min_vlen = 32;
>>      }
>>
>>
>> To make the compiler happy and the code a bit clearer I suggest initializing
>> min_vlen = 32 and folding the "if (cpu->cfg.ext_zve32x)" check inside
>> validate_v() for an early exit. Something like this:
>>
>>
>> @@ -417,15 +417,19 @@ static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
>>   static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
>>                                    Error **errp)
>>   {
>> -    uint32_t min_vlen;
>> -    uint32_t vlen = cfg->vlenb << 3;
>> +    uint32_t min_vlen, vlen;
>> +
>> +    if (cfg->ext_zve32x) {
>> +        return;
>> +    }
>> +
>> +    min_vlen = 32;
>> +    vlen = cfg->vlenb << 3;
>>
>>       if (riscv_has_ext(env, RVV)) {
>>           min_vlen = 128;
>>       } else if (cfg->ext_zve64x) {
>>           min_vlen = 64;
>> -    } else if (cfg->ext_zve32x) {
>> -        min_vlen = 32;
>>       }
> 
> What about:
> 
>      if (riscv_has_ext(env, RVV)) {
>          min_vlen = 128;
>      } else if (cfg->ext_zve64x) {
>          min_vlen = 64;
>      } else if (cfg->ext_zve32x) {
>          min_vlen = 32;
>      } else {
>          return;
>      }
> 
> Always initializing min_vlen with 32 looks a bit misleading to me. min_vlen is inherently dependent on the RVV and zve* flags; initializing the value after checking the flags show that more clearly.


LGTM

> 
> And I find separating the cfg->ext_zve64x and cfg->ext_zve32x checks a bit awkward as they are semantically not that different. In terms of semantics, I see the code like as follows:
> 
> if (RVV) {
>    initialize the extension parameters for RVV
> } else if (zve64x) {
>    initialize the extension parameters for zve64x
> } else if (zve32x) {
>    initialize the extension parameters for zve32x
> } else {
>    no vector extension is present so skip validation
> }
> 
>>
>>       if (vlen > RV_VLEN_MAX || vlen < min_vlen) {
>> @@ -676,12 +680,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>>           return;
>>       }
>>
>> -    if (cpu->cfg.ext_zve32x) {
>> -        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
>> -        if (local_err != NULL) {
>> -            error_propagate(errp, local_err);
>> -            return;
>> -        }
>> +    riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
> 
> Removing this duplicate cpu->cfg.ext_zve32x looks good.
> 
>>       }
>>
>>
>> Note: I wonder why we're allowing settings of VLEN and so on when we do
>> not have RVV set. Seems like a bug ...
> 
> I think this is because the ordering of property setting is not deterministic. It is possible to set the vlen property before setting the v, zve64x or zve32x properties.

Hmmm good point. The logic predates the current structure we have ATM.


Thanks,


Daniel

> 
> Regards,
> Akihiko Odaki


