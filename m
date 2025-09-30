Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02978CCA468
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 11:49:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3Yq2-0001x2-PZ; Tue, 30 Sep 2025 07:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1v3YpJ-00015d-GB
 for qemu-riscv@nongnu.org; Tue, 30 Sep 2025 07:47:27 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1v3YpB-0006ZA-FI
 for qemu-riscv@nongnu.org; Tue, 30 Sep 2025 07:47:25 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6DF3B3FCEE
 for <qemu-riscv@nongnu.org>; Tue, 30 Sep 2025 11:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1759232830;
 bh=mz3aJKIILHiMAKdazyMKsFstlN7XV1pg95Z4ilFMa7Q=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=G9WVapRbwZLHb4LDv1OvCKDm1us4XJJP2jLvg5/dtKLYlCzavKdy4NKrJR6MSah6K
 sKxslqq0/r9eATgEOjZ91Ul9VCBZPmoatUi1rVPsboGUsAFb3iN80iupt48CocVPGg
 oaCtCUV/1ywEKcnB6IO1fw059tA4XAOXAf2IVR/9LnamlaFBV/KKPDa579B90ZntZ8
 ho2Hv5oTndXOxR5JqgHyNPpQULgfUZxTr819cruvP0wN8u8M5OTj5ajdHWeHyxaMBI
 pw/7NsxNfcXIULoDq3ePR1ChG3FtH+tg3xA4H1gs+wSJGN3EKAcYMJkCva+leAii1h
 JvxDdHcmvcWIg==
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-46e4cb3e4deso7183595e9.1
 for <qemu-riscv@nongnu.org>; Tue, 30 Sep 2025 04:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759232830; x=1759837630;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mz3aJKIILHiMAKdazyMKsFstlN7XV1pg95Z4ilFMa7Q=;
 b=eoA04gqZLj91iQuMn4eGB1Uj3ZZO/xlvEQZflg1jt+wnL9X2z64FoTgmoKHSpTUmol
 u5yrkDhlRFd56H4u+2dSa0IpsvaZbYbA663kgMCDdfQ1UU9c0kG09GFafjhFzd1JJ716
 DZI4VMymSeBrEkXJK3y5eH50aCQwESFFrKElb/Ut84npwZmAd5Lu6aUDJbmcE1fVaY1M
 00Uwr8g+2Blx3bs11/32yokQ2gWsd2DOzV3ylpzPoNRk/VLP8K7ZLsG3ETms3ReC/Ocw
 AXuXrZj0Y/GRsD7+OvWoi/TBZZhOyFpeCsa8jGSc7yrD4iDXVdPC9tOxkluPryHcU8U1
 vf7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpX8OdOphhnYrWrDq4+lwlxf1UQ2VdHrIxkDPH2qA2pbWQgvEw2NdyC4HUQwmlDimRKWZ26zQZZxD+@nongnu.org
X-Gm-Message-State: AOJu0Yz1/LItPCqzB42glC9QPSWj8XInr4gnGqFFyjoT9CRPaJaD3WSk
 0f7x+hOnlCzNYOLjddT8/O+Xyn7vfRRbClsBNPBeFgegJCYiNkWYWph/nUqXay6UHt4MO1QkMwH
 sDBuM3eDuaYgcUUktW6wWHHfXz0O5LqC9KRPs+rZ9xEqyn5Tmg78YfCCLVGZVKs+TflR4Nqh4
X-Gm-Gg: ASbGncvJPIiU116OzkIQxK++5uyIbBtfc+bWYnwQqhJqIogSg7B8+ZW9ukN5uO/wNyK
 GfIazDSC6LWudvx6x+APFivzKZtM21ogcrtHYd/RnAq/JjOvTpJBCEwo179aG+AonrgE/63UtLa
 sOlsjgFp/RJ+B6iGwKRY5rzRnSCWVhWPBrp0os1TuH49xWXJgo5uXk4Db6OhGs0kTLxu355ZsHF
 al+Irzg4Hp9KPDGx6rJeLZCXYlkXW+hkJgD3G26kyGTjR2BQrocc7NxDHhdW6eC8+xfcjeDzk+V
 D6gLzYrdwkP1rf+T9rxy5gNWTet1ihBllKg663BjzJRq2mHYki6yTR/n4RNlIOysRkWnJnJ3712
 hfFp6CtqajeG9NQRwF0WrPgn2VGAZfGt5c0MW
X-Received: by 2002:a05:600c:6c90:b0:46e:25f2:705c with SMTP id
 5b1f17b1804b1-46e58cea272mr27826385e9.13.1759232830004; 
 Tue, 30 Sep 2025 04:47:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2MtG3GcFKNMl3eEsIY1PGNTCtfqVBLPA+Qj10d0vquUkrSYgE6u4MX73vwQ9lesop68jWxw==
X-Received: by 2002:a05:600c:6c90:b0:46e:25f2:705c with SMTP id
 5b1f17b1804b1-46e58cea272mr27826255e9.13.1759232829610; 
 Tue, 30 Sep 2025 04:47:09 -0700 (PDT)
Received: from ?IPV6:2a02:3035:6e0:3cde:b3c8:a011:cdf1:6752?
 ([2a02:3035:6e0:3cde:b3c8:a011:cdf1:6752])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc82f2ff6sm22279547f8f.56.2025.09.30.04.47.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 04:47:08 -0700 (PDT)
Message-ID: <07683a05-baa0-463e-b153-28f8f3f31a28@canonical.com>
Date: Tue, 30 Sep 2025 13:47:06 +0200
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
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <13322f17-8826-4b60-b52c-e885bae91e52@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.122;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-0.canonical.com
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

On 9/30/25 12:03, Ben Dooks wrote:
> On 30/09/2025 10:46, Heinrich Schuchardt wrote:
>> On 12/20/24 16:45, Roan Richmond wrote:
>>> This is part of our project to investigate big endian on RISC-V.
>>> The full information is documented on our gitlab[1] which includes
>>> source repositories, build information and project documentation.
>>>
>>> We have a minimal buildroot, qemu and kernel working on QEMU.
>>>
>>> As this is a work in progress any review or help is appreciated.
>>>
>>> [1] https://gitlab.com/CodethinkLabs/riscv_bigendian
>>>
>>> Ben Dooks (2):
>>>    target/riscv: Add big endian check for atomic ops
>>>    taregt/riscv: Add big endian checks for pagetable
>>>
>>> Lawrence Hunter (3):
>>>    target/riscv: Add SSTATUS_UBE
>>>    target/riscv: Add sfence.vma for endian change
>>>    target/riscv: Add big endian CPU target
>>
>> The RISC-V specification explicitly allows for bi-endian cpus. 
>> Shouldn't we change the existing generic RISC-V cpus to allow starting 
>> low-endian and switching the endianness at runtime instead of adding a 
>> new CPU?
> 
> I think the patch also allowed for building qemu for running by default
> big-endian. It might be worth adding an parameter for defaulting the
> CSRs at init time.
> 
>> The switch to big-endian could occur at the entry-point of OpenSBI.
>>
>> Best add a cpu parameter to define a cpu as big-endian, low-endian, or 
>> bi-endian and default to low-endian only.
> 
> The default is LE and the initial work used the CSRs to allow runtime
> endian. If you start the system BE you can still switch back to LE as
> it it was a default to set the CSR values to all modes being big on
> qemu initialisation.
> 

MO_TEUQ used in patch 5/7 does not allow for bi-endianness. You need to 
determine endianness at runtime. Please, have a look at mo_endian(ctx) 
used by the MIPS architecture.

Best regards

Heinrich

