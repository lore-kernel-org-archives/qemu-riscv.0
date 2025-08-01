Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CECC87FD3
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 01:44:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uheoq-0008LU-03; Thu, 31 Jul 2025 21:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhenQ-00065Q-3c
 for qemu-riscv@nongnu.org; Thu, 31 Jul 2025 21:42:59 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhenN-0001q5-NT
 for qemu-riscv@nongnu.org; Thu, 31 Jul 2025 21:42:55 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-240b3335c20so7626335ad.3
 for <qemu-riscv@nongnu.org>; Thu, 31 Jul 2025 18:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754012570; x=1754617370; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Id2YJOTeQvtKjzOIn16WgwB8L5PpAfosXZIlx8bJvw=;
 b=LeyIvecNcF6nQ0GtorA2GVo2eHv6N89rLTq7ZmrKNNSM+gTRhsunYoXQq4YXImgT+M
 ghREivx4PeOrtnvkEOYiGdKvauT7donQep2LgrKW3dxGhIyVV0unqYiblx7MIs+myXeY
 8e+XgSzz0cIHLhItonS2pEZpFQVK91TNW/GwfetwbMhWdNBNJzyy1OUGrb8eqyZ6bQEH
 tar0TnpTuvo0VrDg6zvGKyDD54K1QZPheyINV+3GQErc1Fucp40ecl6TCDhx1JHpDe4B
 Kd6CGJw2ONgzE6+4kk372xFTdVf8h0LD15jngt4Qkxdo0TmMjPI69COIZbHH+lm6q3qE
 HRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754012570; x=1754617370;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Id2YJOTeQvtKjzOIn16WgwB8L5PpAfosXZIlx8bJvw=;
 b=O0Mo/UZARDVkgbX2FdOkaSyzvEjrcL0Ma1Lm7Kh/iLcVjxxuyXZ0HYgbhZzvCL/VRS
 cY1UYJ+kU5+VhLCZJ8cqjQFQNE1mdkN4u3gTlemasXbnRCoOzNjqCUH5TWEEAzjZjvTy
 3h+oJCOQUghuFLViAzJgd8qNc1Pjw7zt37ndRkJI9bMpJbWA2MC0n9lEgInQ1pk743u/
 sVHoz//SQ0F0vUpdM1lVec9ckodETq5PJMUjLx+yNWoaCUx1L4a1AVFBTbAo6X88Ee2e
 i8XGwYU489DJ+kDbam+o705/V9a1ai9qipzx0NbdlwGa1BK+4+KYcenAZz0oZZQeOZML
 rBWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJIPG+EofJ/3IeQc9gRxYJMG5J/bjhLYoAMEcX2F9kYqpca/HaAV1NTfHDi58VGt2IaB7IDWjO3iZT@nongnu.org
X-Gm-Message-State: AOJu0Yw/QJUwy/m46n5rleWiEvse0JU21acov646KKxtEDkamd4Yr58h
 JXmSbeqsbQKzi6ePu7ws1OFLyVToQvw75ZLr205hvd1tTwsfOh91gT+2E2aDxJC6xuI=
X-Gm-Gg: ASbGncuu0ofuf1S35jKzFt9Y88Cf/On1pRPITNyyoX0uH7bc4TVtn9f51mStYNULJOy
 vfFTLFXy6NcHEU5LZbEHYrHlx02TmORMaEViWfyhPMBddKxzUzytmNQ93BBB7H77+ONC5UWObLL
 n6VXkWiq/KXuNgI6VpLoXih9OcYmm+y+Gbqv82shj0Vrb0Q4a/BOiD7sxXhBO/Q9Rrh54X5lJMU
 C3mC8R44zPLf64NaRgOyI3ojunrvcLUFv2Op1JiZmCWx0l29htewT4idsqVwbfaW9TNXldY7l6X
 7/UURj3rJ0gPzEaTpvJnPPHxe2ddMphDCK+IYS+iafRid8IerAxpMc1na7smZmrWIRE0WabHpme
 bMN1EOtplvNOyY3E0o/xhsizy5oz4Zhc7mk8=
X-Google-Smtp-Source: AGHT+IGm0SeMH3GfVnuLJm3ClD7wh6TtWC2aLZkvPzPRNd6qx34i3RpKW9lSw7YN4vKTAdKu+LspKQ==
X-Received: by 2002:a17:903:4b0d:b0:236:6fbb:a5f3 with SMTP id
 d9443c01a7336-24096b48c1amr126154945ad.40.1754012570468; 
 Thu, 31 Jul 2025 18:42:50 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8ab0a00sm28932055ad.177.2025.07.31.18.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 18:42:49 -0700 (PDT)
Message-ID: <7460cc8b-c839-4b09-856e-15c253770bb3@linaro.org>
Date: Thu, 31 Jul 2025 18:42:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] semihosting/syscalls: compile once in system and
 per target for user mode
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
 <20250730220621.1142496-2-pierrick.bouvier@linaro.org>
 <eac843f3-e920-4c6d-9c45-45087b41fb78@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <eac843f3-e920-4c6d-9c45-45087b41fb78@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62e.google.com
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

On 7/31/25 4:13 PM, Richard Henderson wrote:
> On 7/31/25 08:06, Pierrick Bouvier wrote:
>> We replace target_ulong mechanically by uint64_t.
>> We can't compile (easily) this code once for user, as it relies on
>> various target/function types, so leave it in specific_ss for user mode.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    include/semihosting/syscalls.h | 29 ++++++-----
>>    semihosting/arm-compat-semi.c  |  1 +
>>    semihosting/syscalls.c         | 89 +++++++++++++++++-----------------
>>    semihosting/meson.build        |  4 +-
>>    4 files changed, 62 insertions(+), 61 deletions(-)
> 
> We can at least use vaddr for the pointers, like fname.
> 
> I see syscalls.c already uses uint64_t in many of those places, but that can be a separate
> cleanup -- we don't need to add more.
>

I preferred to do a mechanical change, given where it's used. Anyway, 
I'll replace that using vaddr where appropriate.

> 
> r~


