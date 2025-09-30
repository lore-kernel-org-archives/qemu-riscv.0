Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D12CCA468
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 15:13:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3c2x-0008V2-35; Tue, 30 Sep 2025 11:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1v3c2u-0008Ug-9a
 for qemu-riscv@nongnu.org; Tue, 30 Sep 2025 11:13:40 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1v3c2p-0001UF-4n
 for qemu-riscv@nongnu.org; Tue, 30 Sep 2025 11:13:39 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 754CB3F918
 for <qemu-riscv@nongnu.org>; Tue, 30 Sep 2025 15:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1759245208;
 bh=p02nvItW9oZQwXN3SFy/Iz6I0TO/ejjy/AxQYIc2Qpg=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=DthES46htL9FdebLF7TxeEyfpYsFgx8WuCNkLdetL+np71gK4FyNJAV65+Fu0xTkd
 oRhNFeZG7osSxuLmJweGRCT3/1Fgr5XCWj1Sli2HLJcoPlfiPMNP4pjGdMLeX9rIIS
 PJ5/OpnlacTskeIfaUcdrj3Y7Khl4KCUzzUVkmFUojjaI4iQYVlewGdbMvUDQeaV+D
 4tmxKein1fiYUd9ATXMiG+SZq+1te2uWt4tUNw5MTbQi+aRx07zlD3QKRTyhBJUFS9
 TQ+GphDShFkego2H6N+w1QfVQ9ZoYV3o2S6tXaPK2xx+6DcUXav4iWzYDy2Ahy/24W
 3YDLXjl40b4Wg==
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-46e36686ca1so47632715e9.2
 for <qemu-riscv@nongnu.org>; Tue, 30 Sep 2025 08:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759245208; x=1759850008;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p02nvItW9oZQwXN3SFy/Iz6I0TO/ejjy/AxQYIc2Qpg=;
 b=c/gzmqGxVRFjyh9jUZAx6FIN5+P105MVg9gckkux0BdBQQyMxbgIFp/95M6efTLtbL
 0GvNbhyr7xa+328Sn4T2i6IjoJUSfyUgIHhtlBClkpxw64ucuUUFuRZGVbPLgcXQjpbe
 0p0eK8lZtKZx6jZgIByWJPxnnEjTs4fZLCTYnDgvsOkn5tT2FvcIsecIfk0U9G0hmAFh
 wbqju8W3gRHV8/C0QSx0gN1PASg5EUA9Z0xw6ikwr4bcRneqVghugpCCnLvrI2bho1aw
 NT9wq6Naut1gm0eWu7wbM7Hya90V2V/+y4o38vZdm0RRAmEh0bRLTf7pdjnvBT0IZHeV
 0C2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCBTEnLedcOlN0ZCFhyV2sp54Qh+V5AS1HBiU/csMQOoHGWgdcAlNa1xCiAfd/QOOpq/LOi9l8zPzW@nongnu.org
X-Gm-Message-State: AOJu0Ywfe20kKCTkZsvj3DcsPacHjfOadWCEhvbUVLvNlSewOd11QNIJ
 ogC1lFprkmXX7ADomyLWhpkmT/3qTYGS3IYh2wixKbIL684s9Fye+LOOlBBTC5XKYLCsEI31rAg
 W+fFFlv6Oymleue5B0u0ybODfElGuxW/oLd82HiMJeVvnl8jAANl5Cx21FGYEAw7+VqBnc3Bx
X-Gm-Gg: ASbGncuDHRsAiSpcbmqmLbuPAJvnWfDlMmLxSI6LTtWa8/CDpMs3Dy3+oXKiBXsqMAJ
 WFKqdateRyUzA97TuY6keh7GhlDPpnjpRpvzawLpTjRN/u7FysKNksVd+VLQHAQgbnhn9QcsInI
 2vbRQdrUjYXKv2e0WSGjy3fJmGcTIO+sjjiw5LbjQfaw9aL1o37TiE2Rjt5jINcgRWY92dYpfh1
 /iUFRyaM2foWSlJobnRpmpAkR89ujX5E95dqr/m7bl0WG9LGzw/fJe9bVbzaObDNjyzfs//Hqd5
 crJ6V4DQhk2czTt4sp01Ffgxdy69JnCbdO0q/e1LuhdxTAnDp7OLGHKoMibTx0EkyQpvP4l3A3L
 7vfJMHxGYMXZdf4wp5ckCQP9kVpW1v/82szwTOUw4Zb8=
X-Received: by 2002:a05:600c:1f0d:b0:468:86e0:de40 with SMTP id
 5b1f17b1804b1-46e6125d25dmr1841205e9.4.1759245207980; 
 Tue, 30 Sep 2025 08:13:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEom6aliWn1LATaYDc3Dl7n4RqfcX8VXgI5MiONgsnfDHZyK9hUNiqJ9KbsBbbdB3suODUtGQ==
X-Received: by 2002:a05:600c:1f0d:b0:468:86e0:de40 with SMTP id
 5b1f17b1804b1-46e6125d25dmr1840955e9.4.1759245207510; 
 Tue, 30 Sep 2025 08:13:27 -0700 (PDT)
Received: from [192.168.103.116]
 (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e56f64849sm59832575e9.11.2025.09.30.08.13.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 08:13:26 -0700 (PDT)
Message-ID: <47454c48-ae4f-475f-a4ba-f619fd80e0e0@canonical.com>
Date: Tue, 30 Sep 2025 17:13:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/7] Add RISCV big endian support
To: Ben Dooks <ben.dooks@codethink.co.uk>,
 Roan Richmond <roan.richmond@codethink.co.uk>,
 lawrence.hunter@codethink.co.uk
Cc: felix.chong@codethink.co.uk, sagark@eecs.berkeley.edu, palmer@dabbet.com, 
 alistair.francis@wdc.com, bmeng.cn@gmail.com, qemu-riscv@nongnu.org
References: <20241220154616.283933-1-roan.richmond@codethink.co.uk>
 <6ad3dee0-0fe8-4368-b43f-e7f8f30ead24@canonical.com>
 <13322f17-8826-4b60-b52c-e885bae91e52@codethink.co.uk>
 <07683a05-baa0-463e-b153-28f8f3f31a28@canonical.com>
 <b27529e8-91ba-4507-b645-dea4e3285dc0@codethink.co.uk>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <b27529e8-91ba-4507-b645-dea4e3285dc0@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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

On 9/30/25 15:11, Ben Dooks wrote:
> On 30/09/2025 12:47, Heinrich Schuchardt wrote:
>> On 9/30/25 12:03, Ben Dooks wrote:
>>> On 30/09/2025 10:46, Heinrich Schuchardt wrote:
>>>> On 12/20/24 16:45, Roan Richmond wrote:
>>>>> This is part of our project to investigate big endian on RISC-V.
>>>>> The full information is documented on our gitlab[1] which includes
>>>>> source repositories, build information and project documentation.
>>>>>
>>>>> We have a minimal buildroot, qemu and kernel working on QEMU.
>>>>>
>>>>> As this is a work in progress any review or help is appreciated.
>>>>>
>>>>> [1] https://gitlab.com/CodethinkLabs/riscv_bigendian
>>>>>
>>>>> Ben Dooks (2):
>>>>>    target/riscv: Add big endian check for atomic ops
>>>>>    taregt/riscv: Add big endian checks for pagetable
>>>>>
>>>>> Lawrence Hunter (3):
>>>>>    target/riscv: Add SSTATUS_UBE
>>>>>    target/riscv: Add sfence.vma for endian change
>>>>>    target/riscv: Add big endian CPU target
>>>>
>>>> The RISC-V specification explicitly allows for bi-endian cpus. 
>>>> Shouldn't we change the existing generic RISC-V cpus to allow 
>>>> starting low-endian and switching the endianness at runtime instead 
>>>> of adding a new CPU?
>>>
>>> I think the patch also allowed for building qemu for running by default
>>> big-endian. It might be worth adding an parameter for defaulting the
>>> CSRs at init time.
>>>
>>>> The switch to big-endian could occur at the entry-point of OpenSBI.
>>>>
>>>> Best add a cpu parameter to define a cpu as big-endian, low-endian, 
>>>> or bi-endian and default to low-endian only.
>>>
>>> The default is LE and the initial work used the CSRs to allow runtime
>>> endian. If you start the system BE you can still switch back to LE as
>>> it it was a default to set the CSR values to all modes being big on
>>> qemu initialisation.
>>>
>>
>> MO_TEUQ used in patch 5/7 does not allow for bi-endianness. You need 
>> to determine endianness at runtime. Please, have a look at 
>> mo_endian(ctx) used by the MIPS architecture.
> 
> oops, forgot to follow up with the be_data field is probably mis-named
> and we should call it target_endian (basically we're keeping the value
> cached in the ctx, with mips having a function to return this at run
> time)
> 

QEMU is running on big-endian hosts like IBM S/390 and on low-endian 
hosts like amd64.

The target endianness is not enough. You need to XOR target and host 
endianness to know if bytes have to be swapped.

Best regards

Heinrich


