Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9003AD49209
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Nov 2024 10:42:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tCzDG-0006WR-T2; Mon, 18 Nov 2024 05:42:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tCzDF-0006W6-9z
 for qemu-riscv@nongnu.org; Mon, 18 Nov 2024 05:42:33 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tCzDD-0003AR-A8
 for qemu-riscv@nongnu.org; Mon, 18 Nov 2024 05:42:33 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9e8522c10bso645980266b.1
 for <qemu-riscv@nongnu.org>; Mon, 18 Nov 2024 02:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731926550; x=1732531350; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2syny+s4jJRELc7DPFjJv1xMD2q+3yY7VElrsd8GBCE=;
 b=RxzEfxIrDOxrSaPV+mx5WRhZeZ/DJWT7jGqGzk7/CJfeXaO2ztWk4+D7dCtl0yeMIE
 KuEtMr1umLK5MrboJyzL0XH43+FoaqXfomh1hmUM17WkMyC4M+b279rgpFgKCFf7MLoS
 722L2GTAe1rWX0WwUHRqy02cNocVYMXgbiYBPNQA9GSUQVPVgWS/Xv272x5u23HZg1s2
 LZQejeCw9krGawZ03v6TF1JiyjuuxyaL5IsX4y1jxYJPUilwdHH1u6EVhp3dMpymLpk+
 ZwpvNHPvaAoeqbd+RBf9dXLa8BYvJs1CWMMc6y4Zun5XBdqxzporCKVBPm0iuXO12Lm0
 mXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731926550; x=1732531350;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2syny+s4jJRELc7DPFjJv1xMD2q+3yY7VElrsd8GBCE=;
 b=VSBaOKRm1QE8kEto0PgAbdYnbG75GvfxT4RDa47oHXQTutruk7c76behaPnDguMW8D
 MV7Gnoh74rurJHX6xHPsWGVXE0pb8qHVSM4DxxGx0XACYuCYdAcOKfwv590Av6zNBU4G
 tLAkefME/5DIxR3r+QvqsyPmSelKgepF85pKuttW+wAC8QBrbKNA0jC0wDALjgJPiGSE
 SkvTPA00kiJ8bCtA1/y4sw+6BKIassjyL2r/cjUIgWjpxsrJQSWoRJGieaYtojCiHRbv
 nCfJ+nJeIYPMKiO28ZMp+l4+nYFCW4Lo/gpy9Y88rY2wMn8gCkBGEs3BJMPPnPf2Bmid
 zDyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4Q7ZkoX2m9s8+oKAY8ygQwa8D4m5j3Jb3WIv4iEmtXCCQz3uDBgzfoGLOAeOGaTXasIfTT3SYN0g8@nongnu.org
X-Gm-Message-State: AOJu0Yyel4Su4mJunBAsbZAp8uWrGwYCH5KUOta3VRRjc01oSHBwySK6
 SzxHfnU0470dq6r44ZccewCRzny+v7ddmTCYLLAB6Sm5nSfDaShM+b2CaxmsETU=
X-Google-Smtp-Source: AGHT+IEV5hARpXOF9qX/d4z1jhND9QotVMbhtUSD8AsIZ95gkfFSAiOTf/n2FbLk+IwAyW/DQ8G3jw==
X-Received: by 2002:a17:907:7b84:b0:a99:3db2:eb00 with SMTP id
 a640c23a62f3a-aa2078168cfmr1507671266b.28.1731926549741; 
 Mon, 18 Nov 2024 02:42:29 -0800 (PST)
Received: from [192.168.69.197] ([176.187.198.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa4b9357088sm85068666b.23.2024.11.18.02.42.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2024 02:42:28 -0800 (PST)
Message-ID: <b8ef1ecd-fc75-4554-862b-39436bd6d056@linaro.org>
Date: Mon, 18 Nov 2024 11:42:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hw/riscv: Add Microblaze V generic board
To: Alistair Francis <alistair23@gmail.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Michal Simek <michal.simek@amd.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>
References: <20241104174328.383212-1-sai.pavan.boddu@amd.com>
 <CAKmqyKPQ8RaUe71pLftF52+Q=oHCP98rxgfF4kiOOP9bXM7XuQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAKmqyKPQ8RaUe71pLftF52+Q=oHCP98rxgfF4kiOOP9bXM7XuQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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

On 18/11/24 06:07, Alistair Francis wrote:
> On Tue, Nov 5, 2024 at 3:43 AM Sai Pavan Boddu <sai.pavan.boddu@amd.com> wrote:
>>
>> Add a basic board with interrupt controller (intc), timer, serial
>> (uartlite), small memory called LMB@0 (128kB) and DDR@0x80000000
>> (configured via command line eg. -m 2g).
>> This is basic configuration which matches HW generated out of AMD Vivado
>> (design tools). But initial configuration is going beyond what it is
>> configured by default because validation should be done on other
>> configurations too. That's why wire also additional uart16500, axi
>> ethernet(with axi dma).
>> GPIOs, i2c and qspi is also listed for completeness.
>>
>> IRQ map is: (addr)
>> 0 - timer (0x41c00000)
>> 1 - uartlite (0x40600000)
>> 2 - i2c (0x40800000)
>> 3 - qspi (0x44a00000)
>> 4 - uart16550 (0x44a10000)
>> 5 - emaclite (0x40e00000)
>> 6 - timer2 (0x41c10000)
>> 7 - axi emac (0x40c00000)
>> 8 - axi dma (0x41e00000)
>> 9 - axi dma
>> 10 - gpio (0x40000000)
>> 11 - gpio2 (0x40010000)
>> 12 - gpio3 (0x40020000)
>>
>> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
>> Signed-off-by: Michal Simek <michal.simek@amd.com>
>> Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
>> ---
>> Changes for V2:
>>      Make changes to support -cpu switch
>>      Remove setting of default board
>>      Include doc to toctree
>>      Remove setting of 'imac' extensions as they are available by
>>      default.
>> Chages for V3:
>>      Replace virt with generic
>>      Update doc with supported riscv extensions
>>      Change base CPU to TYPE_RISCV_CPU_BASE
>>
>>
>>   MAINTAINERS                                |   6 +
>>   docs/system/riscv/microblaze-v-generic.rst |  45 +++++
>>   docs/system/target-riscv.rst               |   1 +
>>   hw/riscv/microblaze-v-generic.c            | 182 +++++++++++++++++++++
>>   hw/riscv/Kconfig                           |   8 +
>>   hw/riscv/meson.build                       |   1 +
>>   6 files changed, 243 insertions(+)
>>   create mode 100644 docs/system/riscv/microblaze-v-generic.rst
>>   create mode 100644 hw/riscv/microblaze-v-generic.c


>> diff --git a/docs/system/riscv/microblaze-v-generic.rst b/docs/system/riscv/microblaze-v-generic.rst
>> new file mode 100644
>> index 00000000000..71e9e655f66
>> --- /dev/null
>> +++ b/docs/system/riscv/microblaze-v-generic.rst
>> @@ -0,0 +1,45 @@
>> +Microblaze-V generic board (``amd-microblaze-v-generic``)
>> +=========================================================
>> +The AMD MicroBlaze™ V processor is a soft-core RISC-V processor IP for AMD adaptive SoCs and FPGAs.
>> +The MicroBlaze V processor is based on a 32-bit / 64-bit RISC-V instruction set architecture (ISA)
>> +and its fully hardware compatible with the classic MicroBlaze processor.
> 
> I'm not sure "fully hardware compatible" is the right thing to say
> here as it's a different ISA.

I'm also confused. "fully hardware compatible" seems extracted from
a sales speech. Maybe clarify mentioning 'peripherals'?

> Maybe just say that it works with the existing Microblaze IP
> 
>> +
>> +More details here:
>> +https://docs.amd.com/r/en-US/ug1629-microblaze-v-user-guide/MicroBlaze-V-Architecture
>> +
>> +The microblaze-v generic board in QEMU has following supported devices
> 
> The supported devices should probably be listed here


>> +
>> +Implemented devices:
>> +
>> +    - timer
>> +    - uartlite
>> +    - uart16550
>> +    - emaclite
>> +    - timer2
>> +    - axi emac
>> +    - axi dma


