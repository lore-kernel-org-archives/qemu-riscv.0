Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD75CD4F54
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 May 2026 20:27:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wShKI-0004m3-DB; Thu, 28 May 2026 16:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wShJl-000422-Re
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 16:27:05 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wShJh-0005wA-R5
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 16:26:59 -0400
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-4903974854dso65827665e9.3
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 13:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780000014; x=1780604814; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xNTPn+gmQ82SaXvIT20IITc/F5jgqou+vaofjLdxEA0=;
 b=Xh8DtZkwrgWavwjhquWd8ZAvBe0vuJ2NdKOHnVMTkUNfsH/gvNKLyWg/+ZgmITNHha
 pd0k62rmzo0PlB9suWV7+bfd6dEhLQyUhh8V2PiOZHT1BjIfIKW1v5EHUqPjT9jjUd48
 w8ZWf+ltOIMR1zcPwkNlUVGI+b9DvzsZMCrPYjqcOVfcWRxV7DPfrJi5axnpB7WpVSen
 zUA1SuyK/BTfZ38jHFl5rX/aapaFJkYX1MgxmN8lXhYuAEkyZZtiwymkqaSuaP1Dw5p/
 k9a8kNiPqBHWreMXsCq8h9KKJpOGL/aJTvI268UcjUDvEzpW1rcnS2SEqaCzTaoGPdeD
 wCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780000014; x=1780604814;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xNTPn+gmQ82SaXvIT20IITc/F5jgqou+vaofjLdxEA0=;
 b=D1dzz4OE8ZBXBrnrcKxhFRpmZ0P2kN2trtVjhNc+kfjUAINliPVgyINn7bIy99yd1f
 sgFZFapXESk0djVFiIw37GPjVx3a0TURUDtgDnPEvldb0eu5pUlS9zfS1oNMzAYaptiX
 gZfBHVr0EnTvgTXX0V3LBPBbscj+TlRRnjkY3bAxpOL2yylTFCF/aohkTV74FT2NN/WD
 GkNq0iX5Zwmfln6V7d5v/takkxL8oRyo+iZSXzMCpE/lRo+8Q2FSYACrBIyMn3NMnmx4
 TW5tz2+Qv9JlRtGp+kcOSSgyYxfmf3jYV83L/YhtS+iLc/jkZY9DJ0836RljOMZb2Hqu
 2H+A==
X-Gm-Message-State: AOJu0Yxe2vFKa+7PTxfa0WTf7wqasy071w9L23q8pR3O5HRDXdWFuvDQ
 3TMcP7BW9JUk9tit7mnpZch4codz4dtg0AMdzw+UbF/GmyTj+2p8o76Tso4gZQH+65E=
X-Gm-Gg: Acq92OHY2jDZvEvNsQPx6XeWmZk9JMA6a0fFdNfoZ47KTYMkBs35M7To/hlsO4dk+uU
 YalyL38AQFxjxCiG+8LFqIzviOUYPPmaSKxNZtjzuLI5PnuVWogjJPXiIrRnWtIQLlVfj+PVdYq
 CNSSqQE+k76G/jXXd7aV7d/sPbhSCtocbH6+kwvfoW2Hzl1hqVVcp1fWcPDUDNm0kod3MnLLnFY
 g21xXYZSFhj1LqwtLz3AkOZu8kLeDxOpzBaL8VRrSQv2EY644xI64t4mDvTl/+Qcb0QiclWcfZ6
 28yVt2Krz5va6vvPIkK4PJkFJ776kf3/vsFj6QNvrgVMbO+e4O4OC8T1hTvZ8QR01RxofDdQVat
 s34Ixp5SV+JH/NiZQOtqkO/+qX4Y8HHlAQ/QAFa4wBIsz03IDRlCgUCY7naXzKK76LUy+tbrgsg
 j2FicQndBAf3P1OTptn6eyipSqp4rnFvay8zVuaz30bpM1eF5EN48Ciqa/IW365uZVcwUl3OZqZ
 Umw
X-Received: by 2002:a05:600c:4f53:b0:48f:e26a:1744 with SMTP id
 5b1f17b1804b1-4909c07e7d7mr877585e9.9.1780000014302; 
 Thu, 28 May 2026 13:26:54 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909264fbf2sm65396095e9.5.2026.05.28.13.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 13:26:53 -0700 (PDT)
Message-ID: <24a46c31-c53f-41f3-a67d-bd1aadd200d9@linaro.org>
Date: Thu, 28 May 2026 22:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/12] Add RISC-V big-endian target support
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Djordje Todorovic
 <Djordje.Todorovic@htecgroup.com>, Anton Johansson <anjo@rev.ng>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20260527201348.29511-1-philmd@linaro.org>
 <163e423e-a31b-47a4-a7af-a446a3b89fee@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <163e423e-a31b-47a4-a7af-a446a3b89fee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x341.google.com
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

On 28/5/26 21:36, Pierrick Bouvier wrote:
> On 5/27/2026 1:13 PM, Philippe Mathieu-Daudé wrote:
>> v11:
>> - rewrite some patches while reviewing for mainstream integration
>>
>> v10 cover from Djordje:
>>
>> Hi all,
>>
>> This series adds big-endian data support for RISC-V system emulation.
>>
>> Following the discussion on previous versions, this series models
>> fixed-endian harts, not a mixed-endian implementation where software can
>> toggle MBE/SBE/UBE at runtime. The reset value of MBE/SBE/UBE is selected
>> from the CPU configuration. These bits remain outside the
>> mstatus/mstatush/sstatus writable masks, so they are effectively hardwired
>> to 0 for the default little-endian CPUs and to 1 when `big-endian=on`.
>>
>> The user-visible `big-endian` CPU property is exposed only after the data
>> path, boot path, and page-table walk support are in place, so the series
>> remains bisectable.
>>
>> Djordje Todorovic (6):
>>    target/riscv: Implement runtime data endianness via MSTATUS bits
>>    target/riscv: Fix page table walk endianness for big-endian harts
>>    target/riscv: Add big-endian CPU configuration field and reset logic
>>    hw/riscv/boot: Honour data endianness
>>    target/riscv: Expose and document the CPU 'big-endian' property
>>    tests/functional: Add RISC-V endianness test
>>
>> Philippe Mathieu-Daudé (6):
>>    target/riscv: Initialize DisasContext::mo_endian once
>>    target/riscv: Assert PTE.N/PBMT bits are not expected on RV32
>>    target/riscv: De-indent some code in get_physical_address()
>>    target/riscv: Remove target_ulong use in get_physical_address()
>>    hw/riscv/boot: Rewrite setup_rom_reset_vec() using load/store API
>>    hw/riscv/boot: Replace cpu_to_le32() -> const_le32()
>>
>>   docs/system/target-riscv.rst                  | 29 ++++++
>>   target/riscv/cpu.h                            |  1 +
>>   target/riscv/internals.h                      | 29 ++++--
>>   target/riscv/cpu_cfg_fields.h.inc             |  1 +
>>   hw/riscv/boot.c                               | 93 ++++++++++---------
>>   target/riscv/cpu.c                            | 15 ++-
>>   target/riscv/cpu_helper.c                     | 44 +++++----
>>   target/riscv/tcg/tcg-cpu.c                    |  2 +
>>   target/riscv/translate.c                      | 22 ++---
>>   target/riscv/insn_trans/trans_rva.c.inc       |  4 +-
>>   target/riscv/insn_trans/trans_rvd.c.inc       |  4 +-
>>   target/riscv/insn_trans/trans_rvf.c.inc       |  4 +-
>>   target/riscv/insn_trans/trans_rvi.c.inc       |  8 +-
>>   target/riscv/insn_trans/trans_rvzacas.c.inc   |  4 +-
>>   target/riscv/insn_trans/trans_rvzalasr.c.inc  |  4 +-
>>   target/riscv/insn_trans/trans_rvzce.c.inc     |  4 +-
>>   target/riscv/insn_trans/trans_rvzfh.c.inc     |  4 +-
>>   target/riscv/insn_trans/trans_rvzicfiss.c.inc |  4 +-
>>   target/riscv/insn_trans/trans_xmips.c.inc     |  8 +-
>>   target/riscv/insn_trans/trans_xthead.c.inc    | 16 ++--
>>   target/riscv/insn_trans/trans_zilsd.c.inc     |  4 +-
>>   tests/functional/riscv64/meson.build          |  1 +
>>   tests/functional/riscv64/test_endianness.py   | 57 ++++++++++++
>>   23 files changed, 240 insertions(+), 122 deletions(-)
>>   create mode 100644 tests/functional/riscv64/test_endianness.py
>>
> 
> Seems there are some build failures:
> https://github.com/p-b-o/qemu-ci/actions/runs/26537039673

IIUC this branch was applied /before/ commit c2444a426ec ("Merge
tag 'single-binary-20260527'). Now it depends on Alistair riscv
queue so I need to wait before respinning.


> 
> Regards,
> Pierrick


