Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71068CCF9E0
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 11:13:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDhcf-0003sv-4E; Tue, 28 Oct 2025 07:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDhcb-0003sU-F6
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 07:12:13 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDhcT-00018r-0p
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 07:12:12 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4710683a644so48894205e9.0
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 04:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761649922; x=1762254722; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xJyDe36il24B8sHiFvFIFNoNSBcoJYvI1h9pUm1P3RY=;
 b=sboEoPSwkOZ04zuHEonm+P65EEaW2LvF1bnpdx4RjHICwmDXnCUGvYWhHGcI9OSPzd
 SivB0WRsSCzLyt4S77EPx2eZ5oRer3OqDqgsdddG1LBAg3G+t3IsQYxLLli0XZ8wXRhb
 D/nHLHFYma5qw/lrZHpnU6dSxYdIiguAf3r+VpF7/S4CvdNGHndGlwgWtiGfWhUNfzl/
 Nf/4vBTSTQwjQNDjk/+LNgJT+HjxlFvJZND7sSaM7dc+5WaKJHsXxc9lu+FYsRYqaldy
 nPAnV1yKSkAoRzggqwHg7LRU/RF7ieP55bXEFxKChl/pZsz7toRRuzLt5McM8zeEJxS5
 h8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761649922; x=1762254722;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xJyDe36il24B8sHiFvFIFNoNSBcoJYvI1h9pUm1P3RY=;
 b=P013OuDNbzr/K54KlERlM0yLjRRg3ytbodARO1FdP37pKfE7CXKOVpG0ZU5VFFxugS
 yExjkawcs9TtvXrVI3IG6djhkn8+W0l57t4wdqFfES+wF3524wLqPUOD+u1zQ54qH4Bn
 rIdHKnc/NZKEzGfmdmuOpfj/EpbkYsELP4PeeKLxdPUK2t0JSUcbV3doKZGM4jXzvKCk
 HTOB3r5lrQtu3S84RG4ejBrjimfuvAJwZlpGBeHtDaugNnERAnE4HI0XLWUNigU+MwBm
 j4cUablXt2YKfCFP7YgbRwDFoitN80sR2W+hoCw7Wsvq+1BS36Zk8b5woYd9hyxIb+8o
 /Uew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnQBNjE8IIREv8yOfX/obf6OWT4AUy2+98lJot0A21MsVmV5fsajOA573c3mOHRT/Iudma1IcOJNZB@nongnu.org
X-Gm-Message-State: AOJu0Yy8hgQtMTp8XhzjrDqqD0M5kax90C83732TeOIpzJriiB24clDc
 HF9rqHnxj5DGWIjUiWyXf98sqHYY9t42CYutd8GpRE0QqfiYEsqv0XX8HyZzDzgFcTQ=
X-Gm-Gg: ASbGnctwuMfM/shmOinC+gj2oebtWt4iAXia6THAfACPMMMbOtaDKadQtCvqX0HQZH9
 nW+/LG2GzECRF/qRq5KSjcRAwKLEGj12Rm4zcRB/4NpUg/FAY0sMuq/hew+/zFyiTCcsnjOzJrY
 JKDTi8O7mRQQeU1teXU5QacO/LHmVRDGraXN9/7FYWxlmEm/W7nkZvtPtjVc/ANDoGv1CXVZAr7
 y4PJAHEqnFBx01EQe/hFGMo4eAuKKf/Yr0pDSCZe3zS3+g1Csh7u5tgYE2Z1wCOtjRn9G4ZkHja
 93HshqwXs2d+pIZEWLmh5TvgJbOmpSfAbP3iI5r1Kqs3ONynHIWEP5Utx9bWvNacayItpXw1eHO
 m8k+mvqpca9MEWuGByHtLT3ST6FY0sDVj8IIBbbkBu414bhn+Ze4bn5yQVIsnAnW4S08NryzMOT
 l1R3OFw7h7Ton3/2x1mvSMKhQ6kyAlJpChAO5vupBoJMELdPXO
X-Google-Smtp-Source: AGHT+IFe0Jziub8Wkt6LRYvZxNA1eoqQ+qP4ZgX/WCg11/8ilB/4Wi9IcsvRs9aJGN2mdW6ilHaNSA==
X-Received: by 2002:a05:600c:5246:b0:46e:6339:79c5 with SMTP id
 5b1f17b1804b1-4771812e415mr29792195e9.5.1761649921716; 
 Tue, 28 Oct 2025 04:12:01 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd4a5cc4sm187031775e9.11.2025.10.28.04.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 04:12:01 -0700 (PDT)
Message-ID: <262b5b0b-ad9e-4a69-a5e8-f8948bc14d62@linaro.org>
Date: Tue, 28 Oct 2025 12:11:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] hw/sysbus: Spring cleanups (part 1)
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org
References: <20251028080258.23309-1-philmd@linaro.org>
 <CAJ+F1CJYxKD23TFCy1-rbZf0Y_mSMdyVH=nFDM6eomDhVpmHYA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAJ+F1CJYxKD23TFCy1-rbZf0Y_mSMdyVH=nFDM6eomDhVpmHYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 28/10/25 09:49, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Oct 28, 2025 at 12:04 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> - Use proper SysBus accessors
>>
>> Since v1:
>> - Reduce series
>>
>> Philippe Mathieu-Daudé (7):
>>    hw/sysbus: Use memory_region_name()
>>    hw/i386/microvm: Use proper SysBus accessors
>>    hw/i386/ioapic: Use proper SysBus accessors
>>    hw/timer/hpet: Use proper SysBus accessors
>>    hw/acpi/cxl: Use proper SysBus accessors
>>    hw/ppc/e500: Use proper SysBus accessors
>>    hw/pci-bridge/pci_expander_bridge: Use proper SysBus accessors
>>
> 
> There are a bunch of compilation issues that I will let you address for v3.

Sorry, this is based on my latest PR:
https://github.com/philmd/qemu/releases/tag/hw-misc-20251028
Based-on: <20251028074901.22062-1-philmd@linaro.org>

