Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90821C369C2
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 08:01:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u78YM-0002oh-AN; Tue, 22 Apr 2025 04:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u78YK-0002oM-Se
 for qemu-riscv@nongnu.org; Tue, 22 Apr 2025 04:00:25 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u78YI-0007TH-VR
 for qemu-riscv@nongnu.org; Tue, 22 Apr 2025 04:00:24 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso31777475e9.2
 for <qemu-riscv@nongnu.org>; Tue, 22 Apr 2025 01:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745308821; x=1745913621; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XQhecFhUt0uSRhihZ4E1MU1NFxNs2sSpQDUgPh/erBs=;
 b=VQG0AXW29ABVSvwgTuE4qoPGWPnyvLEx+m6wo4sJ6d2k5Py+CkGabkqWV/TLZOIABL
 6kyAmetnVeSU4Q+ZAsgUTFIUZzdyPgjhmbQR8/+8xFoomb8c9QGcgDPFjx4ify7l9GWa
 I57B5Gtnu+nJbzDyEZ2mek6rikLiCtG4IvcQJmLHgXN3KvJSAFkejq3v8OBFFKmeL486
 tvtuKhZgT0KQKYnnpx/z4wIquopxnopwUU+Vpc0VYfJfnnariw03xu3E7dV3cpYDl3T0
 ua7C4FU5WIQXk4jUoYqsZ0V1WfKksh5SUZRi00o/yegFh02xWXkxRoYoOvn4IRr9cv7k
 VIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745308821; x=1745913621;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XQhecFhUt0uSRhihZ4E1MU1NFxNs2sSpQDUgPh/erBs=;
 b=WLv3sssTrb8MjDhsnGeZTdV9eCLBeuVi+rBK33101fpfaLArPMwbicRr50YhwEUvTs
 CLmqEYIUwnX0o7wxCnwt3KOlLsq52YG6gpkqYZIpUm+prPc2SnmfMe/ai8KUfnZzHMWu
 PhcJ4GaS1Vy/AYs0UiMmmYtsegN2Oy6oHjvpt790O700ITpHG6oWSv91SkVMEt+ruYcI
 Qm1qfYudQ8O0b5DKqxLKSC7ol3QfSOSEB97pSrn3TwCaf8uwZ2gJDfKK2udjWI4cfvDq
 BB4l3JswtYYbxPD2OpjKfOs7k8S2dqqpiI3X5O4tRpt4E1d5e7ZhnWRXHr5MWV8xXRqD
 7oJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9KIWvaGKfR29lxkFXMmNYRtOwzI4RJKDCUNBr6qPYv1SLmXZpzto790lZQ3wWmE7rC0MyugaPj3hG@nongnu.org
X-Gm-Message-State: AOJu0YzLdCPQUpAg+/iuyc0rAV1gVJx0WuMFHv7ZGUO7CneVobMq1eUC
 AK7hEpA+uaUbNK3UJNMPxWXQs2LmstEF/fjG+mIbJA8QwRHjQ8UWkZchyNftHzk=
X-Gm-Gg: ASbGncupFUdyIcg130Zb6WM9IM81f5Mtp+8T4zICbu6CYhZ3KuNuy94xd1i47BzsrJ/
 rfx6aQVYtRDsTaAhe2FbMyW3GyNRJoglKhEuITpMaT0E+3e5n+/uy38IT/NVAFlSarf50ZvCEcG
 UQ0rKZ7rCKeddh0xTtnr/K8Rr04okX9uUe0vtcvXXJsbQIFG7GYASJOXeHA8c6wp2cdaUM6ziGf
 PGUtiGicNBgKJ53TOOzsGxdei8DmT3CfJdb6Nyr+5UOKRHlOtBuq8XiGwxQzD5CdfdNu6f7Mqgs
 SsTkymuofFQM6S7agfITIb783cNtNXb//w98/d9ZNWUfIlp4l33nmwSwsChqX4/woZ7dbwiVRdu
 c14UEoPgo
X-Google-Smtp-Source: AGHT+IFfJp4Bc6zt4wTIvHO/z4cA5Qhg+02hJvNDChtgMI3w3TKC6EGRgLVN/9qGkeBz0z2r/QmpYg==
X-Received: by 2002:a05:600c:5395:b0:43d:db5:7b1a with SMTP id
 5b1f17b1804b1-4406ab96f63mr135440195e9.12.1745308820916; 
 Tue, 22 Apr 2025 01:00:20 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4a4be2sm14065833f8f.83.2025.04.22.01.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 01:00:20 -0700 (PDT)
Message-ID: <2b3ca5a6-a2fb-414b-bbcf-f2ec9ce2df28@linaro.org>
Date: Tue, 22 Apr 2025 10:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] acpi: Add machine option to disable SPCR table
To: Li Chen <me@linux.beauty>, Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Song Gao <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Sunil V L <sunilvl@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <87a588wsc9.wl-me@linux.beauty>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87a588wsc9.wl-me@linux.beauty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Hi,

On 22/4/25 09:47, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
> 
> The ACPI SPCR (Serial Port Console Redirection) table allows firmware
> to specify a preferred serial console device to the operating system.
> On ARM64 systems, Linux by default respects this table: even if the
> kernel command line does not include a hardware serial console (e.g.,
> "console=ttyAMA0"), the kernel still register the serial device
> referenced by SPCR as a printk console.
> 
> While this behavior is standard-compliant, it can lead to situations
> where guest console behavior is influenced by platform firmware rather
> than user-specified configuration. To make guest console behavior more
> predictable and under user control, this patch introduces a machine
> option to explicitly disable SPCR table exposure:
> 
>      -machine spcr=off

Please add some tests in tests/qtest/bios-tables-test.c.

> 
> By default, the option is enabled (spcr=on), preserving existing
> behavior. When disabled, QEMU will omit the SPCR table from the guest's
> ACPI namespace, ensuring that only consoles explicitly declared in the
> kernel command line are registered.
> 
> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> ---
>   hw/arm/virt-acpi-build.c       |  5 ++++-
>   hw/core/machine.c              | 22 ++++++++++++++++++++++
>   hw/loongarch/virt-acpi-build.c |  4 +++-
>   hw/riscv/virt-acpi-build.c     |  5 ++++-
>   include/hw/boards.h            |  1 +
>   qemu-options.hx                |  5 +++++
>   6 files changed, 39 insertions(+), 3 deletions(-)



