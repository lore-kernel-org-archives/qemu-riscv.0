Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C52EC0218B
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 18:47:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taJHk-0002gg-Lm; Tue, 21 Jan 2025 13:47:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1taJHS-0002D0-Fj
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 13:47:21 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1taJHP-0004vU-F1
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 13:47:18 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2f4448bf96fso7829545a91.0
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 10:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1737485233; x=1738090033; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UC9vhkIhQz3zAYoW6dUSHkOnB7BHD1z7RRpICZPKN5Q=;
 b=ZBQ+tRHgX9EHJS98VO/kxnBtrihsRPbR8bSHiK+zIVLJCxgcUwy+PKlQXTFbTKPbzG
 JafxLBpip92hgRtPPTD7Vw+ohEoSJX66iCVsvExHrB2ERrvezqT7xT6lKpn7TmBBHdmT
 loX7SBi1MVzAlAOBBdOGcUVB2Doi9prKLwYAt0jKy644jUyMJXkZ6msN3Hmhmjh3tPyV
 RRuHujhxOZT94BB6tLcNSjxtI424Qma/5fTgDecwEqRaIIynjKpKfGyaIpymGvRIC0wH
 FWrirr1L4j5Mjy7UgdOpYGq9Eq+j2x7ysXsnfFFqgPCAxXXLLv1vmQR0AauAwcWBGkzV
 1h0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737485233; x=1738090033;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UC9vhkIhQz3zAYoW6dUSHkOnB7BHD1z7RRpICZPKN5Q=;
 b=aF4BMgtU+A/BJFw7YCgWaHr4ixtBz1UTb6tiow7jawJvV0K+rlfuopEWnhA28Fgcgn
 SKk+MpFb+fnPdDK5ZXfyQdvH8GTLRU/UW7R155esH23pVuuC5XrjN7t9Q9zPXMLakmI3
 HlbOPvc8RMKcumhEQ+3JTPvUwWJ+bVcluKVjw5+m6Wwax3fwGiHpxERPZ5zmT4r/+Bwj
 nq2TW3VdtvWRVG1D70B4z9vm1zdx6c8h7wqzjHbjGBo3SHrfqG265GAM0oL/jcN6XM/U
 aBKozupa3LYoJeqHVpxjxU/XqIKIP4oKABZ/kXa7Tt0WaweemQ7iKTwFIh2PtO0jDx9b
 9vMQ==
X-Gm-Message-State: AOJu0YxrmPmYdKspRj9elJIK3qMHUzOtEduaqaY/KfRQO7GWNg6784zk
 ArIEndHBzAwYPqd2h+mcwuCeia4wyv//P4ZWyPii252Sslojx7CZ7y/9XIE9aa5BjEg+mW6LQBs
 P
X-Gm-Gg: ASbGncstIl3k59Sy1pmdzcdIdBaOnfFFX7eQCDS/+hQOwhh61ptUOXnlNvPW515GjGq
 zSx8xnkGDifCn7IT9HrUaQ5AJPAAtQlQSesbrTdVVtKcIP3BdzgMbH8DklsiZH/ojkGkw/tFIBj
 9SaAQPHS3GbFTi/3r9plAWlKxTkNxd4KNwS1RTlCOtmdbWFX9dkbS+/KfohNBZh1QTONCpj1lvF
 Puh05fx4+aXW0T3IAftEICN2xN7hbt/2bA3/2F5iUfmHVqAp8/fwnPRiWA9bwYOLJtw45qvqPQN
 UhZma/P+
X-Google-Smtp-Source: AGHT+IFU5R03H49ksRLSlG2egRPJj5Jxf+QnMfeR40ZB3v+o2TIuzMpjMR5LoosRJhlIZ2a4+B7COQ==
X-Received: by 2002:a17:90a:d2d0:b0:2ee:b6c5:1de7 with SMTP id
 98e67ed59e1d1-2f782c4c297mr27844104a91.2.1737485232958; 
 Tue, 21 Jan 2025 10:47:12 -0800 (PST)
Received: from [192.168.68.110] ([191.202.238.10])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7c30d60acsm4760983a91.47.2025.01.21.10.47.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 10:47:12 -0800 (PST)
Message-ID: <a6f3ed4a-94be-484e-a9ac-9f3b1eb9cf1d@ventanamicro.com>
Date: Tue, 21 Jan 2025 15:47:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] target/riscv/debug.c: use wp size = 4 for 32-bit
 CPUs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org
References: <20250120204910.1317013-1-dbarboza@ventanamicro.com>
 <20250120204910.1317013-2-dbarboza@ventanamicro.com>
 <9b2114bb-ed61-42bc-a5fe-f28a6a5319dc@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <9b2114bb-ed61-42bc-a5fe-f28a6a5319dc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 1/21/25 2:40 PM, Philippe Mathieu-Daudé wrote:
> On 20/1/25 21:49, Daniel Henrique Barboza wrote:
>> The mcontrol select bit (19) is always zero, meaning our triggers will
>> always match virtual addresses. In this condition, if the user does not
>> specify a size for the trigger, the access size defaults to XLEN.
>>
>> At this moment we're using def_size = 8 regardless of CPU XLEN. Use
>> def_size = 4 in case we're running 32 bits.
>>
>> Fixes: 95799e36c1 ("target/riscv: Add initial support for the Sdtrig extension")
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/debug.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
>> index f6241a80be..9db4048523 100644
>> --- a/target/riscv/debug.c
>> +++ b/target/riscv/debug.c
>> @@ -478,7 +478,7 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
>>       bool enabled = type2_breakpoint_enabled(ctrl);
>>       CPUState *cs = env_cpu(env);
>>       int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
>> -    uint32_t size;
>> +    uint32_t size, def_size;
>>       if (!enabled) {
>>           return;
>> @@ -501,7 +501,9 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
>>               cpu_watchpoint_insert(cs, addr, size, flags,
>>                                     &env->cpu_watchpoint[index]);
>>           } else {
>> -            cpu_watchpoint_insert(cs, addr, 8, flags,
>> +            def_size = riscv_cpu_mxl(env) == MXL_RV64 ? 8 : 4;
> 
> riscv_cpu_mxl() seems bugprone w.r.t. MXL_RV128, better could be
> some riscv_cpu_mxl_wordsize() helper like riscv_cpu_mxl_bits()
> (or better named).

This existing pattern is benign since we don't have a functional RV128 and
is safe seems to interpret RV64 == RV128.

However, if/when RV128 becomes a thing, we'll spare a moderate amount of agony
if we choose to have a little suffering right now. I'll take a note about it
and perhaps a refactor might be in order.


Thanks,

Daniel

> 
> Anyway this pattern is already all over, so meanwhile:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
>> +
>> +            cpu_watchpoint_insert(cs, addr, def_size, flags,
>>                                     &env->cpu_watchpoint[index]);
>>           }
>>       }
> 


