Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5562EEB64DD
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 07:16:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qElt0-0001XR-8f; Thu, 29 Jun 2023 03:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qElss-0001Ub-Te
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 03:16:10 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qElsq-0005lk-2V
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 03:16:06 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbab0d0b88so2427305e9.0
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 00:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688022960; x=1690614960;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mhuGH43rqskaJ9lzn6R+EiBCIw/7R/2pgPj63zxHnNM=;
 b=pcJOrr9oHxOvAw6nv0w1e4luzPiEtAISELbw1JU+/ROg0CUFVUZfiw1b6ouurZ06Q2
 22QExn065uGDkjyvMpSTgsR4IsOL+vJAG55B/Bx+ykX5l13kdbTOk7wF2Vnz4cMdprDm
 im1sbYn2zJ6SwyR8bYOGGZkRVGBmnBMeaSf2jt9i//Y+kRAFG21NbJbaf9heuEhK3I/A
 thwZ/nMOXkS5Eczortw+ol32uH0jfTSGk3RzLI8DudU/cgtpdyzDxxaha8XSYcFH7bvM
 7lPUXloLSJkU0YRkt1UnSDrglDVDpdmNdHgGZ2O9eeZmHrwVWJZ7WJAfdJR5PJlkUVkT
 0eQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688022960; x=1690614960;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mhuGH43rqskaJ9lzn6R+EiBCIw/7R/2pgPj63zxHnNM=;
 b=CCUWd0jF/fEf2kaNfvWLQ7OfVzpW1dJA5btHkRx9/JmEApJX7ZcFT1ydhkVZMRs9xY
 s4kxquIxudRWDxblHHDxPLIRlu8+qNFXKhkYxeSshl/J/+ZPiRSm2km+7dXh8dh47UOr
 E0fzT/31QbrcoDg93P32HsKrXQgytjVTXoasQ1AbgDApS63I2Mq8Q1JyKSE2GywUFfpx
 nxGSO3Kzt9MITsYl5Ni1/wio3FDGtwCDz0xWxg49XlRJ0AgMBU7zNVEEleGi2VZ34Wqm
 D+jMCV7AvZ+GPo8q3o1sXKZVYyxRjRiieFTjv7MME1G5ScFj5b7Zja0EHFJHd6kc8uJ8
 HRdQ==
X-Gm-Message-State: AC+VfDxj/1wxmFCXL3pcY+rjvN/psCMRL/NPGcuJ3uTY6WYl1lpw2UZI
 nQWTwW1VENGcHdysyluaoaWAJg==
X-Google-Smtp-Source: ACHHUZ56Q2TQ+Fk/4ZjCSpq7eeWP20ehxWdYwyapJh+t/Mg6++L3e1nkxi7Zqz0u5jbDOFlLtdudig==
X-Received: by 2002:a05:600c:5014:b0:3fa:9996:8e03 with SMTP id
 n20-20020a05600c501400b003fa99968e03mr3450547wmr.10.1688022960256; 
 Thu, 29 Jun 2023 00:16:00 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.166.242])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a05600c21c900b003fb40ec9475sm8668765wmj.11.2023.06.29.00.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 00:15:59 -0700 (PDT)
Message-ID: <b13a2a4f-0c80-1539-11ea-f517a1009073@linaro.org>
Date: Thu, 29 Jun 2023 09:15:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] target/riscv: Remove unuseful KVM stubs
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 kvm@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Alistair Francis <alistair.francis@wdc.com>
References: <20230620081611.88158-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230620081611.88158-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

ping?

On 20/6/23 10:16, Philippe Mathieu-Daudé wrote:
> Since we always check whether KVM is enabled before calling
> kvm_riscv_reset_vcpu() and kvm_riscv_set_irq(), their call
> is elided by the compiler when KVM is not available.
> Therefore the stubs are not even linked. Remove them.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/riscv/kvm-stub.c  | 30 ------------------------------
>   target/riscv/kvm.c       |  4 +---
>   target/riscv/meson.build |  2 +-
>   3 files changed, 2 insertions(+), 34 deletions(-)
>   delete mode 100644 target/riscv/kvm-stub.c
> 
> diff --git a/target/riscv/kvm-stub.c b/target/riscv/kvm-stub.c
> deleted file mode 100644
> index 4e8fc31a21..0000000000
> --- a/target/riscv/kvm-stub.c
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -/*
> - * QEMU KVM RISC-V specific function stubs
> - *
> - * Copyright (c) 2020 Huawei Technologies Co., Ltd
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms and conditions of the GNU General Public License,
> - * version 2 or later, as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope it will be useful, but WITHOUT
> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> - * more details.
> - *
> - * You should have received a copy of the GNU General Public License along with
> - * this program.  If not, see <http://www.gnu.org/licenses/>.
> - */
> -#include "qemu/osdep.h"
> -#include "cpu.h"
> -#include "kvm_riscv.h"
> -
> -void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
> -{
> -    abort();
> -}
> -
> -void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
> -{
> -    abort();
> -}
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 0f932a5b96..52884bbe15 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -503,9 +503,7 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
>   {
>       CPURISCVState *env = &cpu->env;
>   
> -    if (!kvm_enabled()) {
> -        return;
> -    }
> +    assert(kvm_enabled());
>       env->pc = cpu->env.kernel_addr;
>       env->gpr[10] = kvm_arch_vcpu_id(CPU(cpu)); /* a0 */
>       env->gpr[11] = cpu->env.fdt_addr;          /* a1 */
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index e1ff6d9b95..37fc2cf487 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -22,7 +22,7 @@ riscv_ss.add(files(
>     'crypto_helper.c',
>     'zce_helper.c'
>   ))
> -riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
> +riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
>   
>   riscv_softmmu_ss = ss.source_set()
>   riscv_softmmu_ss.add(files(


