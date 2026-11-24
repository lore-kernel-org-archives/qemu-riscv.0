Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41849606A31E
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 05:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hYbaiUkj
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVivf-0006vA-SE; Tue, 24 Nov 2026 00:18:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gsh517025@gmail.com>)
 id 1xVivd-0006uG-Fv
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 00:18:53 -0500
Received: from mail-pj2-x09.google.com ([2607:f8b0:4864:39::9])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gsh517025@gmail.com>)
 id 1xVivZ-0006sf-FA
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 00:18:53 -0500
Received: by mail-pj2-x09.google.com with SMTP id
 d9443c01a7336-2f01eb3a7aaso13666435ad.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 21:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795497527; x=1796102327; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=rfzNlQ4SqjpiFfYFjvaxtFbJBXLIFRv3sFX/dLGm+uU=;
 b=hYbaiUkjQRIruV5AEqSgBYe1zrzHdtJdvNj/IUQ+hNuK03onj+mVaIvHJMmnR8IheL
 ZO9yMs4VxmbfdxpkogE51RXvnKdQUGIQ0KL1k/MxY1HMG0Dq850PLfVqMqKzOMZuo3A9
 qXNW1anBX2s76WEJ8M5mBOTItvH0Ur8USU7O0smaBcO2AXBGavyrTgOXco3s6jI98kTK
 JAP/E2vanWqc9h996L/o3RrZr9//KLc5BtHlJ4Gjs+Ojjf3u4BfP0BXfd+hQuv+Ee+3D
 +olsjWofMx4oogMn0L4f9OsFMOYM3C47CcaaFw0QCAHM0zx8dfHEKZSfEKWXb4YfECW0
 Zzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795497527; x=1796102327;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=rfzNlQ4SqjpiFfYFjvaxtFbJBXLIFRv3sFX/dLGm+uU=;
 b=qCHKDQfEkuUBkwaVa0kYItW+ldIP8DbST6Gq/oRXERC+ArdH/F52idouAwwc3qj0Gx
 dUXjhmReakGsIzGJrITlofz74o76RPdUTVcNDI7cel9hYgi5y5zdxM3tVQIAk52eclC8
 0aT9mruwxYWwHXbbNBCCQofTWTrIdE8xRjEXSvGPa9gRiePyYFBoUOWtorKnxQjR7Gk8
 lxxu2N9pqcL4LvJt1++3ylOKN82XLwsZ11rY2tOgs6uLSi3VIIdKhYCaOfCvMrsgCJdA
 pFPA6pBv+A8oRsr9giorxyFwwmqa6RlVgNA9+U5q38vZIRW39co9mRNmjarIW+hrLBll
 /CDw==
X-Forwarded-Encrypted: i=1;
 AL+hErHAlQO67cMGnDztyK3fkHYXtYKkz3PIdrQ5hE3DIKBj0n86cUHWgtOHIWFLJ8CXP9RQW6ZRv92Rr43E@nongnu.org
X-Gm-Message-State: APuU4Z+EGmEh2Ra8DoRSMjvzlQfJaP94hTw9qicOyPaOmgEY+gApEYwR
 4aenzO3ET2pj4Osn3G96N590+b/8WE/vNgimBiToBHT/zxJS5kA+bLLw
X-Gm-Gg: AZFdTZdHkgq0q27IN9/ciudFqT5/S6ifkBZWFzWqQGth3FtWyJNPOoLnJafBG0b5TEh
 U41c3e118gDZ7oBq48Qg+5XoXJIZ1FJOOCEL6fF8PgWy8YnjHBt77ycpzp/jAuyVcOAUxPSrIRe
 xm6+wsTZacETy+ty0y43E928T5pnhxb4Gy0Co8k98AuAHlK+tOz2Ln3NrT8Tk3RCDazSqDKZMF3
 WndT+T2QgPaoWH8n1WD9aPERpt9tzt4geAhEpTcqxAbiEQmRaE77pKQs1HwlvfGHX0YjxQ5+84m
 ENibVV5J5wGoGvCZQ1Q12w9ML1gLmUT2yHM2omP8rsYrdNIE3zy/Yb2JTVVO4H2N6x2Cm7iptqQ
 q3IH/KnHdSQ3SQBNgtAQrCtaR5T/VDeMy3I3IIHIETbw52NSk/vw8VQ/qOFE6AeimqNYRPoD5Up
 3gCRISkZJn3bQ1IYk4dbN3Bqs7hw1GLNgQJE7kaWP+W3nPL5g0DlNddu/Z6XlDHh9aSuCdMvGfO
 Vd6q5LBU39RDZUIfz7ykRoXUbYkQyFYei7RDqUGMpfci19qcrIF19N9hTTgvg+sJux8yva/7E0p
 G3IAoJcCjHI+Duo96UPZqixw3wQdQwotPSQIO9s6tTn1/561sCQ=
X-Received: by 2002:a17:90b:4d11:b0:3b4:d00b:d0b3 with SMTP id
 98e67ed59e1d1-3b4d00bd2cemr1503769a91.51.1795497527197; 
 Mon, 23 Nov 2026 21:18:47 -0800 (PST)
Received: from [192.168.22.174] ([114.246.237.251])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2f07877d6afsm35686005ad.42.2026.11.23.21.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 21:18:46 -0800 (PST)
Message-ID: <95fe4c53-fe13-4e0c-abbc-bbb546850560@gmail.com>
Date: Tue, 24 Nov 2026 13:18:43 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] hw/riscv: iommu: Support automatic PTE A/D updates
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 tanchi25@mails.ucas.ac.cn
Cc: alistair.francis@wdc.com, chao.liu@processmission.com,
 liwei1518@gmail.com, nutty.liu@hotmail.com, palmer@dabbelt.com,
 pierrick.bouvier@oss.qualcomm.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, zhiwei_liu@linux.alibaba.com,
 gong.shuai@sanechips.com.cn
References: <20261113151251.30618-1-tanchi25@mails.ucas.ac.cn>
 <20261117143010.1286497-1-gsh517025@gmail.com>
 <841c86f7-9b78-4486-991e-ccec2eede0ec@oss.qualcomm.com>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <841c86f7-9b78-4486-991e-ccec2eede0ec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::9;
 envelope-from=gsh517025@gmail.com; helo=mail-pj2-x09.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Daniel,

On 11/24/2026 3:58 AM, Daniel Henrique Barboza wrote:
> Hello,
> 
> On 11/17/2026 11:30 AM, Gong Shuai wrote:
>>> This series adds support for automatic updates of page-table accessed
>>> (A) and dirty (D) bits in the RISC-V IOMMU, as specified by the RISC-V
>>> IOMMU architecture. The feature is advertised through the AMO_HWAD
>>> capability and controlled by the SADE and GADE bits in device contexts.
>>>
>>> The first two patches fix implicit G-stage page-table access handling
>>> and IOATC permission checks. The third patch implements atomic A/D bit
>>> updates using CAS, with page-table walk retries on concurrent
>>> modifications and G-stage permission checks for implicit writes during
>>> nested translation.
>>>
>>> The implementation has been validated with QTests, Linux DMA tests under
>>> KVM and TCG, and concurrency tests covering CAS retries, PTE
>>> modifications, and G-stage mapping changes.
>>>
>>> ---
>>> Changes in v2:
>>> - Set iotval2 to zero for S-stage page faults, as suggested by
>>>    Daniel Henrique Barboza.
>>> - Avoid duplicate implicit_read calculations, as suggested by Nutty Liu.
>>> - Document the new amo-hwad device property.
>>>
>>> v1: https://lore.kernel.org/qemu-devel/20261108143934.129923-1-tanchi25@mails.ucas.ac.cn/
>>>
>>> Tan Chi (3):
>>>    hw/riscv: iommu: Fix implicit G-stage page-table accesses
>>>    hw/riscv: iommu: Check permissions on IOATC hits
>>>    hw/riscv: iommu: Support automatic PTE A/D updates
>> 
>> Hi Tan Chi,
>> 
>> Thanks for your work.
>> 
>> I have tested this series on my nested IOMMU setup.
>> 
>> - Outer QEMU: this series on top of master, -M virt,...,iommu-sys=on,
>>                -global riscv-iommu.amo-hwad=on, emulated NVMe
>> - Inner QEMU: needs accel=on support for riscv-iommu-pci, and
>>                vfio-pci with iommufd
>> - Outer Linux host: needs hardware dirty tracking and nested IOMMU
>>                support
>> 
>> Test flow:
>> 
>> 1. Boot host and guest, do NVMe I/O
>> 2. Clear host S2 D bits and trigger GVMA inval in the inner QEMU monitor,
>>     use command: calc_dirty_rate -b 1
>> 3. Back to guest shell and do another NVMe I/O
>> 
>> It completed without a guest hang or I/O error. With temporary local
>> debug prints I could see en_s=1/en_g=1 and implicit G-stage page-table
>> walks.
>> 
>> One host-side workaround is that on the host I need
>> echo never > /sys/kernel/mm/transparent_hugepage/enabled
>> to avoid an hang with THP; otherwise calc_dirty_rate -b can leave the
>> guest stuck.
> 
> 
> Can you please clarify if this THP hang also happens on master?  It's not clear
> to me if this scenario is already broken or if this automatic PTE A/D work is
> exposing it.

Yes, the THP hang also occurs on master (2bfbe39d0fff).
It is not introduced by the amo_hwad series.

> 
> Even if it's a kernel/KVM side problem (as Tan Chi mentioned in another reply) we
> should be wary of adding emulation changes that can regress regular software
> usage.  At the very least we should document that we're doing an emulation change
> that can break software that doesn't have a certain workaround/patch.

This is indeed a KVM-side issue. It is not related to nested IOMMU
or the amo_hwad series; the hang was simply observed while running
tests that involved them.

I can provide a simple setup to reproduce it.
(Hope the following information is useful.)

With master QEMU as the RISC-V virt host and kernel v7.4-rc4 built
with defconfig + KVM + TRANSPARENT_HUGEPAGE, running:

     timeout 180 ./dirty_log_perf_test \
     -e -s anonymous_thp -v 1 -b 512M -i 2

hangs and exits due to timeout, whereas:

     timeout 180 ./dirty_log_perf_test \
     -e -s anonymous -v 1 -b 512M -i 2

exits normally.

After applying the fix patch [1] to the kernel, both tests exit
normally.

Detailed logs for the four command runs are provided below for
reference.

Case 1: without fix patch, anonymous_thp ---- HANG and TIMEOUT(124)

   $ cat /sys/kernel/mm/transparent_hugepage/enabled
   [always] madvise never
   $ timeout 180 ./dirty_log_perf_test -e -s anonymous_thp -v 1 -b 512M -i 2
   Random seed: 0x77be2754
   Test iterations: 2
   Testing guest mode: PA-bits:50,  VA-bits:48,  4K pages
   Random seed: 0x1
   guest physical test memory: [0x3ffffdfe00000, 0x3ffffffe00000)
   Populate memory time: 0.277703400s
   Enabling dirty logging time: 0.001101300s

   Iteration 1 dirty memory time: 0.086482400s
   Iteration 1 get dirty log time: 0.000188500s
   Iteration 1 clear dirty log time: 0.017205400s
   Iteration 2 dirty memory time: 3.617855200s
   Iteration 2 get dirty log time: 0.000093700s
   Iteration 2 clear dirty log time: 0.014652300s
   Disabling dirty logging time: 0.001215600s

   $ echo $?
   124

Case 2: without fix patch, anonymous

   $ timeout 180 ./dirty_log_perf_test -e -s anonymous -v 1 -b 512M -i 2
   Random seed: 0x68f16937
   Test iterations: 2
   Testing guest mode: PA-bits:50,  VA-bits:48,  4K pages
   Random seed: 0x1
   guest physical test memory: [0x3ffffdffff000, 0x3fffffffff000)
   Populate memory time: 8.404907600s
   Enabling dirty logging time: 0.001048700s

   Iteration 1 dirty memory time: 0.080460200s
   Iteration 1 get dirty log time: 0.000119300s
   Iteration 1 clear dirty log time: 0.014741000s
   Iteration 2 dirty memory time: 3.689446400s
   Iteration 2 get dirty log time: 0.000034200s
   Iteration 2 clear dirty log time: 0.013190500s
   Disabling dirty logging time: 0.000651400s
   Get dirty log over 2 iterations took 0.000153500s. (Avg 0.000076750s/iteration)
   Clear dirty log over 2 iterations took 0.027931500s. (Avg 0.013965750s/iteration)
   Testing guest mode: PA-bits:50,  VA-bits:39,  4K pages
   guest physical test memory: [0x3ffffdffff000, 0x3fffffffff000)
   Populate memory time: 7.828295400s
   Enabling dirty logging time: 0.000798200s

   Iteration 1 dirty memory time: 0.066219100s
   Iteration 1 get dirty log time: 0.000039900s
   Iteration 1 clear dirty log time: 0.023695500s
   Iteration 2 dirty memory time: 3.429129500s
   Iteration 2 get dirty log time: 0.000032200s
   Iteration 2 clear dirty log time: 0.020796400s
   Disabling dirty logging time: 0.000772600s
   Get dirty log over 2 iterations took 0.000072100s. (Avg 0.000036050s/iteration)
   Clear dirty log over 2 iterations took 0.044491900s. (Avg 0.022245950s/iteration)

Case 3: withfix patch, anonymous_thp

   $ cat /sys/kernel/mm/transparent_hugepage/enabled
   [always] madvise never
   $ timeout 180 ./dirty_log_perf_test -e -s anonymous_thp -v 1 -b 512M -i 2
   Random seed: 0x3b6f1968
   Test iterations: 2
   Testing guest mode: PA-bits:50,  VA-bits:48,  4K pages
   Random seed: 0x1
   guest physical test memory: [0x3ffffdfe00000, 0x3ffffffe00000)
   Populate memory time: 0.221626400s
   Enabling dirty logging time: 0.001002400s

   Iteration 1 dirty memory time: 0.079966800s
   Iteration 1 get dirty log time: 0.000119400s
   Iteration 1 clear dirty log time: 0.012897100s
   Iteration 2 dirty memory time: 3.490279400s
   Iteration 2 get dirty log time: 0.000044900s
   Iteration 2 clear dirty log time: 0.013184200s
   Disabling dirty logging time: 0.000883200s
   Get dirty log over 2 iterations took 0.000164300s. (Avg 0.000082150s/iteration)
   Clear dirty log over 2 iterations took 0.026081300s. (Avg 0.013040650s/iteration)
   Testing guest mode: PA-bits:50,  VA-bits:39,  4K pages
   guest physical test memory: [0x3ffffdfe00000, 0x3ffffffe00000)
   Populate memory time: 0.209773300s
   Enabling dirty logging time: 0.000790800s

   Iteration 1 dirty memory time: 0.063432900s
   Iteration 1 get dirty log time: 0.000040100s
   Iteration 1 clear dirty log time: 0.012308600s
   Iteration 2 dirty memory time: 3.367311900s
   Iteration 2 get dirty log time: 0.000032500s
   Iteration 2 clear dirty log time: 0.013141600s
   Disabling dirty logging time: 0.000953800s
   Get dirty log over 2 iterations took 0.000072600s. (Avg 0.000036300s/iteration)
   Clear dirty log over 2 iterations took 0.025450200s. (Avg 0.012725100s/iteration)

Case 4: withfix patch, anonymous

   $ timeout 180 ./dirty_log_perf_test -e -s anonymous -v 1 -b 512M -i 2
   Random seed: 0x679b7adb
   Test iterations: 2
   Testing guest mode: PA-bits:50,  VA-bits:48,  4K pages
   Random seed: 0x1
   guest physical test memory: [0x3ffffdffff000, 0x3fffffffff000)
   Populate memory time: 8.066872600s
   Enabling dirty logging time: 0.001247200s

   Iteration 1 dirty memory time: 0.081895900s
   Iteration 1 get dirty log time: 0.000186200s
   Iteration 1 clear dirty log time: 0.014706800s
   Iteration 2 dirty memory time: 3.441165900s
   Iteration 2 get dirty log time: 0.000031500s
   Iteration 2 clear dirty log time: 0.013069200s
   Disabling dirty logging time: 0.000469100s
   Get dirty log over 2 iterations took 0.000217700s. (Avg 0.000108850s/iteration)
   Clear dirty log over 2 iterations took 0.027776000s. (Avg 0.013888000s/iteration)
   Testing guest mode: PA-bits:50,  VA-bits:39,  4K pages
   guest physical test memory: [0x3ffffdffff000, 0x3fffffffff000)
   Populate memory time: 7.804275600s
   Enabling dirty logging time: 0.003435000s

   Iteration 1 dirty memory time: 0.067627700s
   Iteration 1 get dirty log time: 0.000037100s
   Iteration 1 clear dirty log time: 0.013302700s
   Iteration 2 dirty memory time: 3.433272000s
   Iteration 2 get dirty log time: 0.000031800s
   Iteration 2 clear dirty log time: 0.013085400s
   Disabling dirty logging time: 0.000614100s
   Get dirty log over 2 iterations took 0.000068900s. (Avg 0.000034450s/iteration)
   Clear dirty log over 2 iterations took 0.026388100s. (Avg 0.013194050s/iteration)

[1] https://lore.kernel.org/linux-riscv/20260815103245.864925-1-jinyu.tang@linux.dev/

Thanks,
Shuai

> 
> Thanks,
> Daniel
> 
>> 
>> This is only a limited positive test. A Linux guest is not suitable for
>> constructing negative cases so I would not claim full Tested-by coverage.
>> 
>> Thanks,
>> Shuai
>> 
>>>
>>>   docs/specs/riscv-iommu.rst |   2 +
>>>   hw/riscv/riscv-iommu.c     | 254 +++++++++++++++++++++++++++++++++----
>>>   hw/riscv/riscv-iommu.h     |   1 +
>>>   3 files changed, 232 insertions(+), 25 deletions(-)
>>>
>>> -- 
>>> 2.53.0
>>>
> 


