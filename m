Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935DFC04FFE
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 May 2024 16:27:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s95qG-0005o4-HE; Mon, 20 May 2024 12:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1s95qD-0005nY-T6
 for qemu-riscv@nongnu.org; Mon, 20 May 2024 12:26:25 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1s95qC-0005F9-0A
 for qemu-riscv@nongnu.org; Mon, 20 May 2024 12:26:25 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5b27d9fe710so1246360eaf.3
 for <qemu-riscv@nongnu.org>; Mon, 20 May 2024 09:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1716222382; x=1716827182; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E9mCXSpcnlzjj1edQ7aYUerPHuAkqXU51Ch+KLIEK3A=;
 b=jxN3MvzGNw7x7/IEW1FtuWTdUKBFuaazK5h8YHhC303R2uFeMTHRp90Qk6iq7sbIwU
 RFla2bKiS+N6XRFHcVZjh56erBemGNjcUN5VcHqbeiYAQs1cbkLYT+JuMoTxbUk4090o
 VtTvDtO7rhxCLgsEus/gVpwwt4M3V2xw/r4DWCvDyVr+GNAs51vTpdjKf4QqU1ZhPdrU
 4e5to2HZcMuiWeK96c7rHTbKf7PWHTj5ChGHD5fC8zFBL/uBm7WxQ5k0pplFRRWw9ZQn
 nMloKfHFXROE3oVR9KzHpE4Z32g3huVUgBb1MPjJz8F6KlFkOTqCPuWmK/4XYT4xrNJW
 tU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716222382; x=1716827182;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E9mCXSpcnlzjj1edQ7aYUerPHuAkqXU51Ch+KLIEK3A=;
 b=nI2TbQDx3hFO6fgU+hyjQ/Ivb+ZVdLZJuz6WFa04iaEFh/UNMoJVE8lT4USubMqMoD
 XUkSITci6wB/WqiadXDcWQYkQIk4OPB7TcmVgTLIiY53n5oLGf2HJ6mBptTcHs6BLy+i
 3vXCZ1S1M6m+pmjedmn76AOaWRdPT26IK2Qu2tAV3FHVHNKPaKYdFiW2/Vu2Wg2E7//D
 mhEGqmncmbjPeTBDB9RMYvxs6Dg1IueXwlAvHQXdwrgPtN9ewg/iJ3Z0KSk+PZfTANCV
 SXVws7NgLV/4pTCXSFmSa2XPlEX+/o62YinQJldqEy9wzx+QgvL42zTI0rWCsiQFu6Cd
 2new==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuNeMtBiWr0MQhyFvUExkfISt1Z/4lh8grCjCaGpLFzfIf38mVW5qqqNTmpTXSihM3kBsLTuS12Y5rUwz1Q0Dj6/VDxj8=
X-Gm-Message-State: AOJu0YxtCKZZpsDR6ZGKLasozcjHk1XrGy6euwTq1GmGKC/zrE61Tn3d
 bso6f1bbp8syHAM1utHd1jXQN02KisWOVbqual3cbB4wmC0rXoDSYP8DkxlWIhc=
X-Google-Smtp-Source: AGHT+IG32TQtpL2fc9VpWMHxWgAGxplBijkij+8nBr2ZLrn4sV81egyn4VMbQXhutSECv4JyAGI7WA==
X-Received: by 2002:a05:6359:459d:b0:194:6301:a71c with SMTP id
 e5c5f4694b2df-1946301a802mr2222937655d.16.1716222382045; 
 Mon, 20 May 2024 09:26:22 -0700 (PDT)
Received: from [192.168.68.110] ([177.94.42.57])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6340b57f28asm17048439a12.26.2024.05.20.09.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 May 2024 09:26:21 -0700 (PDT)
Message-ID: <986a925a-7743-4126-abdc-4911d027c5ff@ventanamicro.com>
Date: Mon, 20 May 2024 13:26:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] riscv: QEMU RISC-V IOMMU Support
To: Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, ajones@ventanamicro.com, tjeznach@rivosinc.com
References: <20240307160319.675044-1-dbarboza@ventanamicro.com>
 <CANzO1D0x5eyZKoNQfH1Q36ieMw21MjxFO30=gzADWNOV5gKXbw@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CANzO1D0x5eyZKoNQfH1Q36ieMw21MjxFO30=gzADWNOV5gKXbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc36.google.com
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



On 5/10/24 08:14, Frank Chang wrote:
> Hi Daniel,
> 
> Thanks for the upstream work.
> Sorry that it took a while for me to review the patchset.
> 
> Please let me know if you need any help from us to update the IOMMU model.
> We would like to see it merged for QEMU 9.1.0.

Thanks for the help in the reviews!

I'll do some last changes in the riscv-iommu-pci device, and check if we have any
DT changes that happened that we need to sync up.

The plan is to send v3 in the next couple of days. Let's see how it goes.


Thanks,


Daniel


> 
> Regards,
> Frank Chang
> 
> Daniel Henrique Barboza <dbarboza@ventanamicro.com> 於 2024年3月8日 週五 上午12:04寫道：
>>
>> Hi,
>>
>> This is the second version of the work Tomasz sent in July 2023 [1].
>> I'll be helping Tomasz upstreaming it.
>>
>> The core emulation code is left unchanged but a few tweaks were made in
>> v2:
>>
>> - The most notable difference in this version is that the code was split
>>    in smaller chunks. Patch 03 is still a 1700 lines patch, which is an
>>    improvement from the 3800 lines patch from v1, but we can only go so
>>    far when splitting the core components of the emulation. The reality
>>    is that the IOMMU emulation is a rather complex piece of software and
>>    there's not much we can do to alleviate it;
>>
>> - I'm not contributing the HPM support that was present in v1. It shaved
>>    off 600 lines of code from the series, which is already large enough
>>    as is. We'll introduce HPM in later versions or as a follow-up;
>>
>> - The riscv-iommu-header.h header was also trimmed. I shaved it of 300
>>    or so from it, all of them from definitions that the emulation isn't
>>    using it. The header will be eventually be imported from the Linux
>>    driver (not upstream yet), so for now we can live with a trimmed
>>    header for the emulation usage alone;
>>
>> - I added libqos tests for the riscv-iommu-pci device. The idea of these
>>    tests is to give us more confidence in the emulation code;
>>
>> - 'edu' device support. The support was retrieved from Tomasz EDU branch
>>    [2]. This device can then be used to test PCI passthrough to exercise
>>    the IOMMU.
>>
>>
>> Patches based on alistair/riscv-to-apply.next.
>>
>> v1 link: https://lore.kernel.org/qemu-riscv/cover.1689819031.git.tjeznach@rivosinc.com/
>>
>> [1] https://lore.kernel.org/qemu-riscv/cover.1689819031.git.tjeznach@rivosinc.com/
>> [2] https://github.com/tjeznach/qemu.git, branch 'riscv_iommu_edu_impl'
>>
>> Andrew Jones (1):
>>    hw/riscv/riscv-iommu: Add another irq for mrif notifications
>>
>> Daniel Henrique Barboza (2):
>>    test/qtest: add riscv-iommu-pci tests
>>    qtest/riscv-iommu-test: add init queues test
>>
>> Tomasz Jeznach (12):
>>    exec/memtxattr: add process identifier to the transaction attributes
>>    hw/riscv: add riscv-iommu-bits.h
>>    hw/riscv: add RISC-V IOMMU base emulation
>>    hw/riscv: add riscv-iommu-pci device
>>    hw/riscv: add riscv-iommu-sys platform device
>>    hw/riscv/virt.c: support for RISC-V IOMMU PCIDevice hotplug
>>    hw/riscv/riscv-iommu: add Address Translation Cache (IOATC)
>>    hw/riscv/riscv-iommu: add s-stage and g-stage support
>>    hw/riscv/riscv-iommu: add ATS support
>>    hw/riscv/riscv-iommu: add DBG support
>>    hw/misc: EDU: added PASID support
>>    hw/misc: EDU: add ATS/PRI capability
>>
>>   hw/misc/edu.c                    |  297 ++++-
>>   hw/riscv/Kconfig                 |    4 +
>>   hw/riscv/meson.build             |    1 +
>>   hw/riscv/riscv-iommu-bits.h      |  407 ++++++
>>   hw/riscv/riscv-iommu-pci.c       |  173 +++
>>   hw/riscv/riscv-iommu-sys.c       |   93 ++
>>   hw/riscv/riscv-iommu.c           | 2085 ++++++++++++++++++++++++++++++
>>   hw/riscv/riscv-iommu.h           |  146 +++
>>   hw/riscv/trace-events            |   15 +
>>   hw/riscv/trace.h                 |    2 +
>>   hw/riscv/virt.c                  |   33 +-
>>   include/exec/memattrs.h          |    5 +
>>   include/hw/riscv/iommu.h         |   40 +
>>   meson.build                      |    1 +
>>   tests/qtest/libqos/meson.build   |    4 +
>>   tests/qtest/libqos/riscv-iommu.c |   79 ++
>>   tests/qtest/libqos/riscv-iommu.h |   96 ++
>>   tests/qtest/meson.build          |    1 +
>>   tests/qtest/riscv-iommu-test.c   |  234 ++++
>>   19 files changed, 3704 insertions(+), 12 deletions(-)
>>   create mode 100644 hw/riscv/riscv-iommu-bits.h
>>   create mode 100644 hw/riscv/riscv-iommu-pci.c
>>   create mode 100644 hw/riscv/riscv-iommu-sys.c
>>   create mode 100644 hw/riscv/riscv-iommu.c
>>   create mode 100644 hw/riscv/riscv-iommu.h
>>   create mode 100644 hw/riscv/trace-events
>>   create mode 100644 hw/riscv/trace.h
>>   create mode 100644 include/hw/riscv/iommu.h
>>   create mode 100644 tests/qtest/libqos/riscv-iommu.c
>>   create mode 100644 tests/qtest/libqos/riscv-iommu.h
>>   create mode 100644 tests/qtest/riscv-iommu-test.c
>>
>> --
>> 2.43.2
>>
>>

