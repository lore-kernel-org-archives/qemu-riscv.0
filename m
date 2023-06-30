Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6C7EB64DA
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 11:38:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFCS7-00041y-CR; Fri, 30 Jun 2023 07:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFCS5-00041e-CV
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 07:38:13 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFCS3-0001PZ-GM
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 07:38:13 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1b06777596cso1623911fac.2
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 04:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688125088; x=1690717088;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QNSDLMpqNgRHrErpjvOwJxdX/8ZBDXD/tjIE2wLFrwo=;
 b=n8xtPhG0P+DXLSTFY9xc468LDu+ZQckn+/Kl5N0nPUNdwsc1HBdKNYUKTlKBub47jP
 LtsKk4oOV/TRVPZjfaHx9wWXbA7tb/jzoJbaDr7MHcvn5Pwj6BuNXLKbTBjevnWFNaLM
 OaUBP3b2jVZfEq8bxfImS2b9gvxa155bf5/Am80zn0STGTEPHeT8JqMc5UfHt2++kRkD
 HPbJFeoAXqTgt3x4Ls5OUR00pVyjQY5cY8EjrJ7h0gIbP86rn2bEyg0ONus32tKpOWVO
 umfyYkHpTHQ9URtv+BSSb6tZxOrhLcCKsGbH4jpktEEJogr2CuKH5hPKui36eiEMvIvh
 Gp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688125088; x=1690717088;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QNSDLMpqNgRHrErpjvOwJxdX/8ZBDXD/tjIE2wLFrwo=;
 b=Qh6cUgpM1warWVofgapqYH/v5EkzyCys0B1mjICRrSVoTUeYYDOGjyBAEdTRAfEw+N
 WJ7gabgbmcLBHtB3dR6gGCiQMkD5QFtpkRZt33JAcGToNKeT6KmYti0L1k7mMCq3uSNs
 G6Evkji4/+BVCNYPfr05H+oHNvnNgMVkyzP2QDlFhzK9bH6QLqVOkavZxXH2LlWm1yM7
 VWgxwjF//r+1DU6TmDGN9kGzN+NejzrK1epuFzJeYVfPJCtrRS5aFw9HcMh/xIhvs+mH
 0KCp5qBxcH+cnM4b7DFqxlqhoesUWCgFZDp3ZjBmt5Xu1mcpiGmU6MMsflu0pFr81P3G
 lTDQ==
X-Gm-Message-State: AC+VfDyRCRrhZMeoFt4XTQeUKEW3kDWPlAXMVNOJJlqXrf3E5Q5CqdZd
 hj4+2JivoGVVJcwh0VK2TQBpuQ==
X-Google-Smtp-Source: APBJJlEA8S6sBDIVZ8QNlP9oBPkpbQcsagmQfZoaTHfjAyvvI/kHQhklkt+09qUy95TDBrcyGO490g==
X-Received: by 2002:a05:6870:170d:b0:1b0:6f63:736f with SMTP id
 h13-20020a056870170d00b001b06f63736fmr3723617oae.9.1688125088508; 
 Fri, 30 Jun 2023 04:38:08 -0700 (PDT)
Received: from ?IPV6:2804:18:1005:1891:f8a0:1703:4d3b:4d5d?
 ([2804:18:1005:1891:f8a0:1703:4d3b:4d5d])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a056870d60b00b001b0cad9f72esm1717043oaq.18.2023.06.30.04.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jun 2023 04:38:08 -0700 (PDT)
Message-ID: <23982ea3-dedb-5bef-fe50-7de45dd4df72@ventanamicro.com>
Date: Fri, 30 Jun 2023 08:38:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] target/riscv: Remove unuseful KVM stubs
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 kvm@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Alistair Francis <alistair.francis@wdc.com>
References: <20230620081611.88158-1-philmd@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230620081611.88158-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 6/20/23 05:16, Philippe Mathieu-Daudé wrote:
> Since we always check whether KVM is enabled before calling
> kvm_riscv_reset_vcpu() and kvm_riscv_set_irq(), their call
> is elided by the compiler when KVM is not available.

Had to google 'elided'. Nice touch.

> Therefore the stubs are not even linked. Remove them.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Tested with a simple KVM guest. Nothing bad happened.

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

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

