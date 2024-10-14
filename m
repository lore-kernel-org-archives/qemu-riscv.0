Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4798D1812A
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 16:15:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t0NjD-00060Y-Ua; Mon, 14 Oct 2024 12:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t0NjB-000605-Kw
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2024 12:15:25 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t0Nj9-0007HN-MH
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2024 12:15:25 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-20ca7fc4484so18883335ad.3
 for <qemu-riscv@nongnu.org>; Mon, 14 Oct 2024 09:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1728922522; x=1729527322; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wACl76/5XgIB4bIPgMIPhr/z09cgEYsiNIVkLTYVkm4=;
 b=Td0SagJ0KvRjT7bDdFuBR+LWUgPmkaP2JVvOfA9narv/ytw3xZYV6K35Hhwa4ASEoG
 MyhEU+GgTeJB+Y+lYZ2JikIJkEHrD4RLKadTHQ35rHYDPU7eDRTbpW+Mrv7Wp/Bt6n73
 V60Uaem9oJNapLlQNi8ped6x2UmQH0Pd2G8DOglxFyHE4MK/4TdO786mVTWNpaayoHUb
 hpPKwe8jgfGW7+IaO/KlqyLTpBGXUV0Sn84PBz39ExjSKyIW2T/0JoVoEPbvmo6xEhQ/
 gV6ua7zMPwIaCMvMhXytuY+hDtQ3H9Des/OGAarT0fBZEtprcZZrNTH8dYHvPY+Yn7x5
 50Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728922522; x=1729527322;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wACl76/5XgIB4bIPgMIPhr/z09cgEYsiNIVkLTYVkm4=;
 b=tH99ojtc7aizVNRs88Vrh/CZhltR907m9jUy8vdVecJBb7bhlrpDsxZ66lwgMP3HOe
 xZf87AB+oJ03/GWHHZcPIUQPHVnScY3xak/cKn/qvsmL5A2H0sK9txRhkSaAMbfAeECv
 SzB9+yZ6enZYRtRkf4hvzm20+0YddISRQmmgDl2Hg8xjq6ibHbPBRBxklbuLAjFq/WfZ
 VlrQ8NZjtKXDDa0iDaHtlNM3YltAybbejQPBqpSEggO8mc6mt36nA5papp2Y7vPPMEeE
 /a5FyOITaKB+yMDuV3KgrigN0jOZXmmcsMsKo2kyJeAiATBAElugb7n98vIMMCdJQN9z
 ottQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVqWQ1IPK0jLv/1K5n0ZgD77rkyHDDFkFEBU2n1GPZomZ7jDoElnYm27PfbrYP3VI/ReTF1q6az5pc@nongnu.org
X-Gm-Message-State: AOJu0YxpT5vKIyuS+iRVgySdzz1Vy7gtdsxDGOrT1T2wWS69VUQqcK9J
 sefQiwAJVf4YeuGdYjwexzdTa9aHCPmR3fOiGbtyNHBasTMKLKkC3PuspDRraI0=
X-Google-Smtp-Source: AGHT+IG3FDrPnhyisWMLlsnF4crSsJmBpsAEc2DzdH1dvXjG4xIl84I8NRrMI2ZrbDj4Yupp3SNpTg==
X-Received: by 2002:a17:902:ebc5:b0:20b:5351:f690 with SMTP id
 d9443c01a7336-20cbb195f19mr118522875ad.16.1728922521723; 
 Mon, 14 Oct 2024 09:15:21 -0700 (PDT)
Received: from [192.168.68.110] (201-68-240-198.dsl.telesp.net.br.
 [201.68.240.198]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20c8c33ff19sm67684055ad.272.2024.10.14.09.15.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 09:15:21 -0700 (PDT)
Message-ID: <c43d0cd2-e1e8-46a4-971e-e96214192228@ventanamicro.com>
Date: Mon, 14 Oct 2024 13:15:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] target/riscv: Add Smrnmi support.
To: Frank Chang <frank.chang@sifive.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>
Cc: Tommy Wu <tommy.wu@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 ajones@ventanamicro.com
References: <20240902071358.1061693-1-tommy.wu@sifive.com>
 <6e7a184f-3b47-480d-bd56-fef2e89beda6@ventanamicro.com>
 <c8460f0c-d82f-414b-b55f-d9f227244a9f@rivosinc.com>
 <CANzO1D2BaPA8gxxKxdk59nYseV9uKZzNR9GiHS+nAict+WSPsA@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CANzO1D2BaPA8gxxKxdk59nYseV9uKZzNR9GiHS+nAict+WSPsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62a.google.com
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



On 10/14/24 6:04 AM, Frank Chang wrote:
> Clément Léger <cleger@rivosinc.com> 於 2024年10月14日 週一 下午3:36寫道：
>>
>>
>>
>> On 11/10/2024 13:38, Daniel Henrique Barboza wrote:
>>> Hi Tommy,
>>>
>>>
>>> Do you plan to send a new version of this work soon? This series is a
>>> prerequisite
>>> of "target/riscv: Add support for Smdbltrp and Ssdbltrp extensions" and
>>> we need
>>> this series merged first. We have minor comments from Clément and
>>
>> Hi Henrique,
>>
>> If that's easier, I can still remove the dependency on Smrnmi and add
>> support for that later.
>>
>> Clément
> 
> Hi Clément,
> 
> Sorry for keeping you waiting. I've reviewed the comments from you and Alistair.
> The comments should be straightforward to fix.
> I will fix them and send out the patchset later today.
> Hope that it makes things easier.

Thanks for taking care of this series Frank!


Daniel

> 
> 
> Regards,
> Frank Chang
> 
>>
>>> Alistair so
>>> hopefully it shouldn't be too much work.
>>>
>>> The code freeze for 9.2 will happen in the first/second week of
>>> November, so if you
>>> could send a new version to be merged in the next PR that would be great.
>>>
>>>
>>> Thanks,
>>>
>>> Daniel
>>>
>>>
>>>
>>> On 9/2/24 4:13 AM, Tommy Wu wrote:
>>>> This patchset added support for Smrnmi Extension in RISC-V.
>>>>
>>>> There are four new CSRs and one new instruction added to allow NMI to be
>>>> resumable in RISC-V, which are:
>>>>
>>>> =============================================================
>>>>     * mnscratch (0x740)
>>>>     * mnepc     (0x741)
>>>>     * mncause   (0x742)
>>>>     * mnstatus  (0x744)
>>>> =============================================================
>>>>     * mnret: To return from RNMI interrupt/exception handler.
>>>> =============================================================
>>>>
>>>> RNMI also has higher priority than any other interrupts or exceptions
>>>> and cannot be disabled by software.
>>>>
>>>> RNMI may be used to route to other devices such as Bus Error Unit or
>>>> Watchdog Timer in the future.
>>>>
>>>> The interrupt/exception trap handler addresses of RNMI are
>>>> implementation defined.
>>>>
>>>> If anyone wants to test the patches, we can use the customized
>>>> OpenSBI[1],
>>>> and the customized QEMU[2].
>>>>
>>>> We implemented a PoC RNMI trap handler in the customized OpenSBI.
>>>> In the customized QEMU, we use the Smrnmi patches and the patch from
>>>> Damien Hedde[3]. The patch from Damien Hedde can be used to inject
>>>> the RNMI signal with the qmp command.
>>>>
>>>> [1] https://github.com/TommyWu-fdgkhdkgh/opensbi/tree/dev/twu/master
>>>> [2] https://github.com/TommyWu-fdgkhdkgh/qemu/tree/dev/twu/master
>>>> [3] https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg06232.html
>>>>
>>>> Test commands :
>>>> $ ./build/qemu-system-riscv64 -M virt -cpu rv64,smrnmi=true,
>>>> rnmi-interrupt-vector={Offset of the RNMI handler in the customized
>>>> OpenSBI.} -m 4G -smp 2 -serial mon:stdio -serial null -nographic
>>>> -bios fw_jump.elf -kernel Image -initrd rootfs.cpio
>>>> -qmp unix:/tmp/qmp-sock,server,wait=off
>>>>
>>>> Use qmp command to inject the RNMI interrupt.
>>>> $ ./scripts/qmp/qmp-shell /tmp/qmp-sock
>>>> (QEMU)  gpio-set path=/machine/soc0/harts[0] gpio=riscv.cpu.rnmi
>>>> number=0 value=true
>>>>
>>>> (QEMU)  gpio-set path=/machine/soc0/harts[0] gpio=riscv.cpu.rnmi
>>>> number=0 value=false
>>>>
>>>> Changelog:
>>>>
>>>> v6
>>>>     * Delete the redundant code in `riscv_cpu_do_interrupt`.
>>>>     ( Thank Alvin for the suggestion. )
>>>>     * Split the shared code in `helper_mret` and `helper_mnret` into a
>>>>       helper function `check_ret_from_m_mode`.
>>>>     ( Thank Alistair for the suggestion. )
>>>>
>>>> v5
>>>>     * Move the patch that adds the Smrnmi extension to the last patch.
>>>>     ( Thank Alistair for the suggestion. )
>>>>     * Implement an M-mode software PoC for this with implemented handlers.
>>>>     ( Thank Andrew Jones for the suggestion. )
>>>>     * Add a commit message to all patches of the series.
>>>>     ( Thank Andrew Jones for the suggestion. )
>>>>
>>>> v4
>>>>     * Fix some coding style issues.
>>>>     ( Thank Daniel for the suggestions. )
>>>>
>>>> v3
>>>>     * Update to the newest version of Smrnmi extension specification.
>>>>
>>>> v2
>>>>     * split up the series into more commits for convenience of review.
>>>>     * add missing rnmi_irqvec and rnmi_excpvec properties to riscv_harts.
>>>>
>>>> Tommy Wu (5):
>>>>     target/riscv: Add `ext_smrnmi` in the RISCVCPUConfig.
>>>>     target/riscv: Handle Smrnmi interrupt and exception.
>>>>     target/riscv: Add Smrnmi CSRs.
>>>>     target/riscv: Add Smrnmi mnret instruction.
>>>>     target/riscv: Add Smrnmi cpu extension.
>>>>
>>>>    hw/riscv/riscv_hart.c                         | 18 ++++
>>>>    include/hw/riscv/riscv_hart.h                 |  4 +
>>>>    target/riscv/cpu.c                            | 18 ++++
>>>>    target/riscv/cpu.h                            | 10 +++
>>>>    target/riscv/cpu_bits.h                       | 23 ++++++
>>>>    target/riscv/cpu_cfg.h                        |  1 +
>>>>    target/riscv/cpu_helper.c                     | 80 ++++++++++++++++--
>>>>    target/riscv/csr.c                            | 82 +++++++++++++++++++
>>>>    target/riscv/helper.h                         |  1 +
>>>>    target/riscv/insn32.decode                    |  3 +
>>>>    .../riscv/insn_trans/trans_privileged.c.inc   | 12 +++
>>>>    target/riscv/op_helper.c                      | 49 +++++++++--
>>>>    12 files changed, 291 insertions(+), 10 deletions(-)
>>>>
>>
>>

