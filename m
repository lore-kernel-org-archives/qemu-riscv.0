Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D43CCCA468
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 13:09:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3a6S-0004mT-9E; Tue, 30 Sep 2025 09:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@codethink.co.uk>)
 id 1v3a6N-0004iT-Vq
 for qemu-riscv@nongnu.org; Tue, 30 Sep 2025 09:09:08 -0400
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@codethink.co.uk>)
 id 1v3a6G-0001cP-1y
 for qemu-riscv@nongnu.org; Tue, 30 Sep 2025 09:09:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QZJyEo4vJ1IiFmJ9FaESno3GE+juGAvv1aCPNN+mT1A=; b=HaGiJ0KQ86GGZDP/nlFIZ3Z2O7
 DS70/O+BM3TVoX4DFzvMQciuT/S2SroawjwohrBlJkyUnc6M2fWivFTuMdjRag8Hj/42aS2sK/qEu
 M+M88tj3L89jKRzZs3jFf3W8hy5LmiF6w9NQEQhQBqqUhoyQmVr6lqyHjhAMyc6zYG/9/X3NX1g15
 FjWieqzYkRiAChaOvGLnSX1EcHOBGcUS8cQ+fISEtBwMMr3JoGUDVIE3xjlQjM9JzioExJqAkKMFS
 KBH34zFCxDv4dnhcPADuUk+S4zUlNzePSpHKcaRR3ZRJZUEaEdU/ZrM2pw1R8i2zAA9RKrBL4KwiB
 2prBCbug==;
Received: from [63.135.74.212] (helo=[192.168.1.249])
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1v3a5z-004vra-GY; Tue, 30 Sep 2025 14:08:43 +0100
Message-ID: <a9132064-4ce6-402b-8bff-795e95aa57cd@codethink.co.uk>
Date: Tue, 30 Sep 2025 14:08:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/7] Add RISCV big endian support
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Roan Richmond <roan.richmond@codethink.co.uk>,
 lawrence.hunter@codethink.co.uk
Cc: felix.chong@codethink.co.uk, sagark@eecs.berkeley.edu, palmer@dabbet.com, 
 alistair.francis@wdc.com, bmeng.cn@gmail.com, qemu-riscv@nongnu.org
References: <20241220154616.283933-1-roan.richmond@codethink.co.uk>
 <6ad3dee0-0fe8-4368-b43f-e7f8f30ead24@canonical.com>
 <13322f17-8826-4b60-b52c-e885bae91e52@codethink.co.uk>
 <07683a05-baa0-463e-b153-28f8f3f31a28@canonical.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <07683a05-baa0-463e-b153-28f8f3f31a28@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114;
 envelope-from=ben.dooks@codethink.co.uk; helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 30/09/2025 12:47, Heinrich Schuchardt wrote:
> On 9/30/25 12:03, Ben Dooks wrote:
>> On 30/09/2025 10:46, Heinrich Schuchardt wrote:
>>> On 12/20/24 16:45, Roan Richmond wrote:
>>>> This is part of our project to investigate big endian on RISC-V.
>>>> The full information is documented on our gitlab[1] which includes
>>>> source repositories, build information and project documentation.
>>>>
>>>> We have a minimal buildroot, qemu and kernel working on QEMU.
>>>>
>>>> As this is a work in progress any review or help is appreciated.
>>>>
>>>> [1] https://gitlab.com/CodethinkLabs/riscv_bigendian
>>>>
>>>> Ben Dooks (2):
>>>>    target/riscv: Add big endian check for atomic ops
>>>>    taregt/riscv: Add big endian checks for pagetable
>>>>
>>>> Lawrence Hunter (3):
>>>>    target/riscv: Add SSTATUS_UBE
>>>>    target/riscv: Add sfence.vma for endian change
>>>>    target/riscv: Add big endian CPU target
>>>
>>> The RISC-V specification explicitly allows for bi-endian cpus. 
>>> Shouldn't we change the existing generic RISC-V cpus to allow 
>>> starting low-endian and switching the endianness at runtime instead 
>>> of adding a new CPU?
>>
>> I think the patch also allowed for building qemu for running by default
>> big-endian. It might be worth adding an parameter for defaulting the
>> CSRs at init time.
>>
>>> The switch to big-endian could occur at the entry-point of OpenSBI.
>>>
>>> Best add a cpu parameter to define a cpu as big-endian, low-endian, 
>>> or bi-endian and default to low-endian only.
>>
>> The default is LE and the initial work used the CSRs to allow runtime
>> endian. If you start the system BE you can still switch back to LE as
>> it it was a default to set the CSR values to all modes being big on
>> qemu initialisation.
>>
> 
> MO_TEUQ used in patch 5/7 does not allow for bi-endianness. You need to 
> determine endianness at runtime. Please, have a look at mo_endian(ctx) 
> used by the MIPS architecture.

Ok, so it looks like MO_TEUQ needs to be changed to MO_UQ and then orred 
with the MO_BE or MO_LE.

Seems to have worked for initial testing :/

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

