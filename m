Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A094BCCA470
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 11:33:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3v4r-00041j-GY; Wed, 01 Oct 2025 07:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1v3v4n-000418-4c
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 07:32:53 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1v3v4f-00024w-S4
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 07:32:51 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-633be3be1e6so1242398d50.1
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 04:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1759318358; x=1759923158; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dN7uGPOq0+IjqEkygipqr1ptvic5doB1cNsl9H3Jees=;
 b=FWzuO9kMirMFo7kgCGjZSWQcBHRif4+lHuoGNBSgQJDqzM1Qkcge+IGYjkGA/0uv+p
 xq61Y0OPX1fzC0D5yKJRZpxoV3oBGJooAoNUqqHpm0h6iF+sPWXGbfPzJUaFBzDp1Cb8
 jpzF1M72twjIhLCZAkSpOWXvrHgUCDbmVywo0AMswlD+poTQ/7Mj7oXRTU50CJAem0uw
 w+xONqMgE/v4a61HjqjRaP5rdtg0wWiWGjORU9HEf2hbzGFitgQe2LJmvQYgoDu/sPBU
 jfhixoPjaZZ76/peXUIg5P7yjn9NweWyJJ5m8lUa2ygXHoqK7BFDShdpDA/DAzfjEYpw
 /tVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759318358; x=1759923158;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dN7uGPOq0+IjqEkygipqr1ptvic5doB1cNsl9H3Jees=;
 b=IyvDIjfmokJf0kVeEMzhtLZtN68IIzdzYoXw8KGTUhEQg6rcv0qx/K5ceJlmgI8Gr0
 jKsoo4Fsfbf0Op+trAymk5p3QriqAp/hEVqOWMwk+SFh9RiN5yhrJY0IwKo54piieAE6
 TrcuWzfx+UJFIZxBUEsvHVtu5mWxLkdheDO+XOEDVMvIv7ZWdTpUPfzXlqyotVD1aqzZ
 ClOaReOuusWaaHFrenJuZocRWfWemPrA9f3wMxTlvN6sNHMpym9h9g7VHywF4zcQlemI
 dKZLu2mr9LcS1ukhxWh59B3rxflv9PE5MYH3nX5tWoScaK5v2/tIQpEqtaRl/D6rCrZO
 /Xyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlhKIyvf5n6xHIyu86+MN33gPFpcEMT0SHSF6MobKh+VeXN0l30LkgxcZX40/DdjNVw0/EhF1YgugH@nongnu.org
X-Gm-Message-State: AOJu0YwRoUIxVoQ7vI0r3r1Qz4DrUBsDhObv+U9oLqZU/XYneeRxZtbN
 8MNjKbStty6jRb++OItuswmFc3Rj+PJbiAxsu3+7H4sJCJAO58S+5BITlz71/KyOwfo=
X-Gm-Gg: ASbGncuFe7aUW7ZuDs8P389vliRWCI0Po3IM+5SK3oFx3jhtq2pbhjLSR5ACyRm0hRW
 0vAy3TwYX5uURoTibr+rSCRxnx3Qcdf1NK1MCdr5Z759bbxW36ar9hHQuF+XRFaWjqQ/hn7x+kl
 XBws6qFkmQDCyYVGPtVBn9p8dk/naQDqPvWNN4GLk75g9CJnk/3BNuosRbwlWgv7RU5VnwnPdqI
 KDNAXbqPgQl578TgIDld04V973+zEU4RDjwJ/VB1GhMdeJd3+VnwxXCWchff5btBIYbMkiQuml1
 h0+5uAAOSA5ihT8L4ZLYUA5ErE8pPSDgGzkW6QF2UJeqv9xtPEECH+2wfLTO10l8XJYY6wAB/KD
 T4ULjbq6WvjPqWQ5WXnL2vqaKU5CypmZENJAYqoGAK6rC0UF3P2p/L6FdWYYOf3uj/yEJkAMndK
 9OCP007YpXTeRcr9TmU2YYWgd6qreDfdIgok0=
X-Google-Smtp-Source: AGHT+IGbFo3FnsFnTyuPSIdXDv5flYWlhMwUx7rXJtsuSIXqWTbrOOn0nzcwetcRgQt9FJwjPtlfXw==
X-Received: by 2002:a05:690e:1582:20b0:636:d4de:a73d with SMTP id
 956f58d0204a3-63b700bb5f2mr3736791d50.19.1759318357825; 
 Wed, 01 Oct 2025 04:32:37 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:6bd8:87f0:c4e8:3ccb:fa1b?
 ([2804:7f0:bcc0:6bd8:87f0:c4e8:3ccb:fa1b])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-63ad64e5d45sm2493291d50.29.2025.10.01.04.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 04:32:37 -0700 (PDT)
Message-ID: <0878ebc9-f553-46b8-b2ff-b748bd45da88@ventanamicro.com>
Date: Wed, 1 Oct 2025 08:32:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/7] Add RISCV big endian support
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Roan Richmond <roan.richmond@codethink.co.uk>, ben.dooks@codethink.co.uk,
 lawrence.hunter@codethink.co.uk
Cc: felix.chong@codethink.co.uk, sagark@eecs.berkeley.edu, palmer@dabbet.com, 
 alistair.francis@wdc.com, bmeng.cn@gmail.com, qemu-riscv@nongnu.org,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20241220154616.283933-1-roan.richmond@codethink.co.uk>
 <6ad3dee0-0fe8-4368-b43f-e7f8f30ead24@canonical.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <6ad3dee0-0fe8-4368-b43f-e7f8f30ead24@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yx1-xb133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

(ccing qemu-devel ML - please send all patches to qemu-devel too)

On 9/30/25 6:46 AM, Heinrich Schuchardt wrote:
> On 12/20/24 16:45, Roan Richmond wrote:
>> This is part of our project to investigate big endian on RISC-V.
>> The full information is documented on our gitlab[1] which includes
>> source repositories, build information and project documentation.
>>
>> We have a minimal buildroot, qemu and kernel working on QEMU.
>>
>> As this is a work in progress any review or help is appreciated.
>>
>> [1] https://gitlab.com/CodethinkLabs/riscv_bigendian
>>
>> Ben Dooks (2):
>>    target/riscv: Add big endian check for atomic ops
>>    taregt/riscv: Add big endian checks for pagetable
>>
>> Lawrence Hunter (3):
>>    target/riscv: Add SSTATUS_UBE
>>    target/riscv: Add sfence.vma for endian change
>>    target/riscv: Add big endian CPU target
> 
> The RISC-V specification explicitly allows for bi-endian cpus. Shouldn't we change the existing generic RISC-V cpus to allow starting low-endian and switching the endianness at runtime instead of adding a new CPU?


Mainline Linux stated that RISC-V BE support will be "discouraged" (feel free to read
yet another Linus rant in linux-riscv - we're having multiple Linus rants per month).
This means that this work investigation will require at very least a custom kernel that
mainline won't support, which will in turn make it harder for QEMU to properly support
it in boot tests via TuxBoot and so on.

This doesn't mean that we should reject this work, but we should keep BE exclusive logic
separated from the generic LE code at least for now. Point being: the split BE CPU
target, like this series is already doing, seems like the way to go.


Thanks,

Daniel

> 
> The switch to big-endian could occur at the entry-point of OpenSBI.
> 
> Best add a cpu parameter to define a cpu as big-endian, low-endian, or bi-endian and default to low-endian only.
> 
> Best regards
> 
> Heinrich
> 
>>
>> Roan Richmond (2):
>>    target/riscv: Add riscv MSTATUS_xBE CSR support
>>    target/riscv: Add riscv big endian data flag into DisasContext
>>
>>   target/riscv/cpu-qom.h                      |  1 +
>>   target/riscv/cpu.c                          |  8 +++++
>>   target/riscv/cpu.h                          |  2 ++
>>   target/riscv/cpu_bits.h                     |  3 ++
>>   target/riscv/cpu_helper.c                   | 34 ++++++++++++++++-----
>>   target/riscv/csr.c                          | 19 ++++++++++--
>>   target/riscv/insn_trans/trans_rva.c.inc     |  4 +++
>>   target/riscv/insn_trans/trans_rvi.c.inc     |  6 ++++
>>   target/riscv/insn_trans/trans_rvzacas.c.inc |  8 ++---
>>   target/riscv/translate.c                    |  5 +++
>>   10 files changed, 76 insertions(+), 14 deletions(-)
>>
> 
> 


