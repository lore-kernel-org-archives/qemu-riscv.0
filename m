Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B92CAC5B8
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 07:00:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3ULf-0004Es-IM; Tue, 30 Sep 2025 03:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1v3ULF-00048n-QG
 for qemu-riscv@nongnu.org; Tue, 30 Sep 2025 03:00:08 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1v3UL7-00065H-VM
 for qemu-riscv@nongnu.org; Tue, 30 Sep 2025 03:00:05 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EF5303F85D
 for <qemu-riscv@nongnu.org>; Tue, 30 Sep 2025 06:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1759215591;
 bh=RSDxpuwZGH57GBwNBPZDJ5sOSxOq0GzDmPaZnAvf2pI=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=blhsF162/fsJJtjF1xXMZ/HuNm/rXX7PAQqCIs+J+9bI9isdM69oo26f6UACde1BQ
 P1MTtUj84cu5/ZC63vxQLdnsgbC4Igf1PmPGHtwiXQq3PgP/oFL0Zzs9LuvlYpsJYx
 IfBf5wmdneHJh62duz6Jb8/Fv/lfxDOr5lHHPFizTh+iR3Fq0lsdmgifr25kforEDh
 o1x/5RRa+NWvMNbi7Rpuexfkte9BUeLaDVJBO1QpvSRFlrFWK9Ft+oE/FVXTokFQ5E
 aNQb0bRxwEuCFABX3nsz0vYrF1uXAi3RzU+pHOmh9KwB1hFHExVLR4AoyGqdyqR4eH
 iRiMSh3MVauIA==
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3ece14b9231so3798599f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 29 Sep 2025 23:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759215591; x=1759820391;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RSDxpuwZGH57GBwNBPZDJ5sOSxOq0GzDmPaZnAvf2pI=;
 b=pfHuQdQmCF1MOTMlKmIwsbiDC6rbeKQlj08RzWTvBedMcXosk04lf1+hghqp+kj8Hp
 vjY91E/S5Wd+NoJzmsyeddxybCHBOiMYfzVOcoO8QEZqr1lxPnPrkaTDXu2JBgSYnX50
 Dk4AQx0U6Riz7tVAIpoWNkbP+WVRvg7HNgHfoaYVoiaFfA4y1NJsPZ7ydnFf77AHK+kY
 GAw2v0pc/ttkTNR44gm4iygg70xFtHn48S2msH5Yby+6/98b4mnN22EVzJXXWXeseqPT
 oJyt4cecurEuaIm9gV4i38OyK1xn9byWHoiKEUB0a1a/sZUPKnzMMxD1SaV093m7zaqV
 UNzA==
X-Gm-Message-State: AOJu0Yz+wrRz8n3v0lYtwKLkqpeDX9a56kdEwzH3YT3Vygs84/uZV5s6
 lHs4jCXd2auEXf1SQYwiT+/c7A/a9FcW+hjUwX6tlx6fmiwMo8NnYzf8xkNsvyZtP+Qwq7jxw2G
 otWUPSkJuhjQD6LQ2j0K1eglNbUf98rr5FDn6KW6R0j0GvRFeltD4pmvun1U5RsqnSoDkfVEg
X-Gm-Gg: ASbGncsLS13I7TDrn9pScc4GdfIrrTkS9FF5BX0gocMK26pCoaoFdQUlGCJN0/Am7Ba
 F/xL2JNNZIL0sYr5jMuwXcqBFG9cNshcpnrXUWxZI5Wr4rU0fH4ddkU2qnSswViAYlsF6TURJnK
 q9NEWcwf7eCZu8jq5CpWW8COodGa72GkvSoQOAzG5MZyIjNnbSItB4EfMXwVXlyKD6wqPR4jbWi
 vgdjB78LO1Jn3IzXKu+BgQhd8GTcsLYxY3EmGLYGnUvIYxNPlesTL3/bVxjpDk3BYfjXj0cYa35
 TpGP7e9gKamloIf7WMQXYA2QCkzQz0EsAGdWb0qidxPqnfdjE8FXZ2A5+PHDq9JgN4jlZGvo3f5
 PejlTXYLF842lRRIcFBbqVbIClj/Li2HhVhQ0vLwRneE=
X-Received: by 2002:a05:6000:4282:b0:3ec:b899:bc39 with SMTP id
 ffacd0b85a97d-40e50d6dfa2mr17561356f8f.58.1759215591499; 
 Mon, 29 Sep 2025 23:59:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzo/5mP/RJXntozTI8tJQETpQQ9Jnra2/RhVhUBfFboKGyMhWewn9Rba7MJ0PuoIXWolfWsQ==
X-Received: by 2002:a05:6000:4282:b0:3ec:b899:bc39 with SMTP id
 ffacd0b85a97d-40e50d6dfa2mr17561337f8f.58.1759215591062; 
 Mon, 29 Sep 2025 23:59:51 -0700 (PDT)
Received: from [192.168.123.154]
 (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e5b69bc0bsm7717795e9.3.2025.09.29.23.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 23:59:50 -0700 (PDT)
Message-ID: <95dbbcf4-41fa-481b-9e23-96ed51f66264@canonical.com>
Date: Tue, 30 Sep 2025 08:59:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix endianness swap on compressed
 instructions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-riscv@nongnu.org, qemu-trivial@nongnu.org,
 zhiwei_liu@linux.alibaba.com, dbarboza@ventanamicro.com,
 liwei1518@gmail.com, alistair.francis@wdc.com, palmer@dabbelt.com,
 vhaudiquet <vhaudiquet343@hotmail.fr>, anjo@rev.ng,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson via <qemu-devel@nongnu.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20250929115543.1648157-1-valentin.haudiquet@canonical.com>
 <cc5b1d2c-90cb-4276-a192-fd0ce9e926e8@linaro.org>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <cc5b1d2c-90cb-4276-a192-fd0ce9e926e8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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

On 9/29/25 16:37, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> 
> On 29/9/25 13:55, Valentin Haudiquet wrote:
>> From: vhaudiquet <vhaudiquet343@hotmail.fr>
>>
>> Three instructions were not using the endianness swap flag, which 
>> resulted in a bug on big-endian architectures.
> 
> I suppose you mean "big-endian host architectures".
> If so, please clarify.

Hello Phil,

Ubuntu is providing QEMU to emulate RISC-V both on little-endian hosts 
like X86 and ARM as well as on big-endian hosts like the IBM S/390.

The Unprivileged RISC-V ISA Specification has this sentence:

"The base ISA has been defined to have a little-endian memory system, 
with big-endian or bi-endian as non-standard variants."

According to the Privileged RISC-V ISA Specification the mstatus and 
mstatush register may be used to set the endianness at runtime.

"The MBE, SBE, and UBE bits in mstatus and mstatush are WARL fields that 
control the endianness of memory accesses other than instruction 
fetches. Instruction fetches are always little-endian."

Currently RISC-V work focuses on little-endian targets but there is 
active community work to enable big-endian Linux for RISC-V.

Therefore a solution is required that considers both the host and the 
target endianness.

> 
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3131
>> Buglink: https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/2123828
>>
>> Signed-off-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
>> ---
>>   target/riscv/insn_trans/trans_rvzce.c.inc | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/ 
>> insn_trans/trans_rvzce.c.inc
>> index c77c2b927b..dd15af0f54 100644
>> --- a/target/riscv/insn_trans/trans_rvzce.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvzce.c.inc
>> @@ -88,13 +88,13 @@ static bool trans_c_lbu(DisasContext *ctx, 
>> arg_c_lbu *a)
>>   static bool trans_c_lhu(DisasContext *ctx, arg_c_lhu *a)
>>   {
>>       REQUIRE_ZCB(ctx);
>> -    return gen_load(ctx, a, MO_UW);
>> +    return gen_load(ctx, a, MO_TEUW);
> NAck.
> Please do not use MO_TE* anymore. Use explicit endianness.
> 
> So far all our RISC-V targets are little-endian:
> 
>    $ git grep TARGET_BIG_ENDIAN configs/targets/riscv*
>    $
> 
> If you are not worried about RISCV core running in BE mode
> (as we currently don't check MSTATUS_[USM]BE bits), your change
> should be:
> 
>   -    return gen_load(ctx, a, MO_UW);
>   +    return gen_load(ctx, a, MO_UW | MO_LE);

I saw your patches to remove MO_TE from little-endian only targets like 
i386 but RISC-V is different.

We should foresee that in future RISC-V targets run in either 
little-endian or big-endian mode and implement our code accordingly.

When big-endian RISC-V comes upon QEMU, we should avoid duplicating the 
target code but reuse what we have.

MO_UW | MO_LE looks wrong in this context.

We should stay consistent with

target/riscv/insn_trans/trans_rvi.c.inc
target/riscv/insn_trans/trans_rvzfh.c.inc
target/riscv/insn_trans/trans_xthead.c.inc

which currently use MO_TEUW.

For the time being, I would suggest to stick to MO_TE* to maintain the 
information in which code locations we need to consider the target 
endianness.

Targets that can switch endianness at runtime (e.g. MIPS) use an 
architecture specific implemenation of mo_endian(ctx). When implementing 
big-endian RISC-V support in future, we can use the MO_TE occurrences as 
indicator where to use mo_endian() instead.

With these considerations in mind the current patch looks good to me.

Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> 
>>   }
> 
> Regards,
> 
> Phil.
> 
> 


