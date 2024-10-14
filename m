Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BA2CFC501
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 07:35:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t0Fc6-0001Ai-OB; Mon, 14 Oct 2024 03:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1t0Fbw-00019h-94
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2024 03:35:24 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1t0Fbt-0007vV-Ec
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2024 03:35:23 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4311c575172so28312255e9.2
 for <qemu-riscv@nongnu.org>; Mon, 14 Oct 2024 00:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728891318; x=1729496118;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FMZNn7K2BoCZyaqKh3tfGkloTDN0hQwbHWX0WFQoxuw=;
 b=ibAKG81TeHGDZrM9nnZpR2BMRzROJPCtySNuI/5o078Ud3EY+UVuYETtwhKJHpvzFz
 +8bFpjv8XEBq5L3SnP9J8Mk+LxIst/+WVuk0ojFJfftT3Er5jlZc+T4cdkfTX0ATz2Rx
 W7cSjDeOJRWUCh/BzJxM0DA9Ke81rNNpUW2PSBm869KNPdQmnbJtnkLYaq89Y3uZen9I
 z1wfpr9yAD5Wa/PuEfSVWeMbS37Ewtueo623+hWgQA/2YKc9Jya06S5tonOTpzEi+smA
 WJZgc+9oNPbFo7MQx/1GvqIGGMiitCJF9IjvaAE+JsTuaD60mUJLIW4IGtBSjqZYpJrj
 3zYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728891318; x=1729496118;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FMZNn7K2BoCZyaqKh3tfGkloTDN0hQwbHWX0WFQoxuw=;
 b=FHsBChT/ULJgX6dbku94On+UlgD0BPQRss0WJjBkWWh9+gPxGgsna2r3N7DEmrPoiX
 WKOAWxZAKG5WYXMHG6NHdR9I5MlvaT+DJsneBwAbeiyXaykl0I+8F8Sou0t5uW1TKfhA
 6N5zdb8zqNcMpie4y7p/07+XQJ0kXkLoucoTazXNeSvQ3GrXBZgzVM90fmZb297Hsrue
 2Cqri6CDELNdZheJILPS5MDdKFj3e2ULM9cKZ+2BkJselZtO3asaqlrL4MRajzTbwtHH
 PMPx/W9R4kWctVhual5wMpahGw9V2LPHnAs4yrs+a6hi664eSgz4+aMFVubRDucm9L3r
 8VrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlvoYi7VaSO1JfBDaJ3Q/KPJ8YhlkelskM3gHgxLHVZ0IrwuUTuIY/GUmwulF4wUlMglLaDJiRLupP@nongnu.org
X-Gm-Message-State: AOJu0YxS8p1D0iuwmMTSko2jJYKS6ZAWBOr/6tvMWfwylaOWsZkBC00W
 CYuq8f/zlR+xu0E/Ep/U/aLJ1CdaxyU2p/TW9nyldhurTLyPzT0Ayagp12IHJHI=
X-Google-Smtp-Source: AGHT+IFp0k1bPM+VMEN0GNMIqWNwHKbLmSJo/3d/55t/fU9gWm4f0GNTqJR8NRsLR8lPxS+CkpNPJw==
X-Received: by 2002:adf:e9c1:0:b0:37d:4f1b:35a with SMTP id
 ffacd0b85a97d-37d551988c2mr7568129f8f.3.1728891318074; 
 Mon, 14 Oct 2024 00:35:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626?
 ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b6a87desm10659848f8f.5.2024.10.14.00.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 00:35:17 -0700 (PDT)
Message-ID: <c8460f0c-d82f-414b-b55f-d9f227244a9f@rivosinc.com>
Date: Mon, 14 Oct 2024 09:35:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] target/riscv: Add Smrnmi support.
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Tommy Wu <tommy.wu@sifive.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: frank.chang@sifive.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 ajones@ventanamicro.com
References: <20240902071358.1061693-1-tommy.wu@sifive.com>
 <6e7a184f-3b47-480d-bd56-fef2e89beda6@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <6e7a184f-3b47-480d-bd56-fef2e89beda6@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=cleger@rivosinc.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



On 11/10/2024 13:38, Daniel Henrique Barboza wrote:
> Hi Tommy,
> 
> 
> Do you plan to send a new version of this work soon? This series is a
> prerequisite
> of "target/riscv: Add support for Smdbltrp and Ssdbltrp extensions" and
> we need
> this series merged first. We have minor comments from Clément and

Hi Henrique,

If that's easier, I can still remove the dependency on Smrnmi and add
support for that later.

Clément

> Alistair so
> hopefully it shouldn't be too much work.
> 
> The code freeze for 9.2 will happen in the first/second week of
> November, so if you
> could send a new version to be merged in the next PR that would be great.
> 
> 
> Thanks,
> 
> Daniel
> 
> 
> 
> On 9/2/24 4:13 AM, Tommy Wu wrote:
>> This patchset added support for Smrnmi Extension in RISC-V.
>>
>> There are four new CSRs and one new instruction added to allow NMI to be
>> resumable in RISC-V, which are:
>>
>> =============================================================
>>    * mnscratch (0x740)
>>    * mnepc     (0x741)
>>    * mncause   (0x742)
>>    * mnstatus  (0x744)
>> =============================================================
>>    * mnret: To return from RNMI interrupt/exception handler.
>> =============================================================
>>
>> RNMI also has higher priority than any other interrupts or exceptions
>> and cannot be disabled by software.
>>
>> RNMI may be used to route to other devices such as Bus Error Unit or
>> Watchdog Timer in the future.
>>
>> The interrupt/exception trap handler addresses of RNMI are
>> implementation defined.
>>
>> If anyone wants to test the patches, we can use the customized
>> OpenSBI[1],
>> and the customized QEMU[2].
>>
>> We implemented a PoC RNMI trap handler in the customized OpenSBI.
>> In the customized QEMU, we use the Smrnmi patches and the patch from
>> Damien Hedde[3]. The patch from Damien Hedde can be used to inject
>> the RNMI signal with the qmp command.
>>
>> [1] https://github.com/TommyWu-fdgkhdkgh/opensbi/tree/dev/twu/master
>> [2] https://github.com/TommyWu-fdgkhdkgh/qemu/tree/dev/twu/master
>> [3] https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg06232.html
>>
>> Test commands :
>> $ ./build/qemu-system-riscv64 -M virt -cpu rv64,smrnmi=true,
>> rnmi-interrupt-vector={Offset of the RNMI handler in the customized
>> OpenSBI.} -m 4G -smp 2 -serial mon:stdio -serial null -nographic
>> -bios fw_jump.elf -kernel Image -initrd rootfs.cpio
>> -qmp unix:/tmp/qmp-sock,server,wait=off
>>
>> Use qmp command to inject the RNMI interrupt.
>> $ ./scripts/qmp/qmp-shell /tmp/qmp-sock
>> (QEMU)  gpio-set path=/machine/soc0/harts[0] gpio=riscv.cpu.rnmi
>> number=0 value=true
>>
>> (QEMU)  gpio-set path=/machine/soc0/harts[0] gpio=riscv.cpu.rnmi
>> number=0 value=false
>>
>> Changelog:
>>
>> v6
>>    * Delete the redundant code in `riscv_cpu_do_interrupt`.
>>    ( Thank Alvin for the suggestion. )
>>    * Split the shared code in `helper_mret` and `helper_mnret` into a
>>      helper function `check_ret_from_m_mode`.
>>    ( Thank Alistair for the suggestion. )
>>
>> v5
>>    * Move the patch that adds the Smrnmi extension to the last patch.
>>    ( Thank Alistair for the suggestion. )
>>    * Implement an M-mode software PoC for this with implemented handlers.
>>    ( Thank Andrew Jones for the suggestion. )
>>    * Add a commit message to all patches of the series.
>>    ( Thank Andrew Jones for the suggestion. )
>>
>> v4
>>    * Fix some coding style issues.
>>    ( Thank Daniel for the suggestions. )
>>
>> v3
>>    * Update to the newest version of Smrnmi extension specification.
>>
>> v2
>>    * split up the series into more commits for convenience of review.
>>    * add missing rnmi_irqvec and rnmi_excpvec properties to riscv_harts.
>>
>> Tommy Wu (5):
>>    target/riscv: Add `ext_smrnmi` in the RISCVCPUConfig.
>>    target/riscv: Handle Smrnmi interrupt and exception.
>>    target/riscv: Add Smrnmi CSRs.
>>    target/riscv: Add Smrnmi mnret instruction.
>>    target/riscv: Add Smrnmi cpu extension.
>>
>>   hw/riscv/riscv_hart.c                         | 18 ++++
>>   include/hw/riscv/riscv_hart.h                 |  4 +
>>   target/riscv/cpu.c                            | 18 ++++
>>   target/riscv/cpu.h                            | 10 +++
>>   target/riscv/cpu_bits.h                       | 23 ++++++
>>   target/riscv/cpu_cfg.h                        |  1 +
>>   target/riscv/cpu_helper.c                     | 80 ++++++++++++++++--
>>   target/riscv/csr.c                            | 82 +++++++++++++++++++
>>   target/riscv/helper.h                         |  1 +
>>   target/riscv/insn32.decode                    |  3 +
>>   .../riscv/insn_trans/trans_privileged.c.inc   | 12 +++
>>   target/riscv/op_helper.c                      | 49 +++++++++--
>>   12 files changed, 291 insertions(+), 10 deletions(-)
>>


