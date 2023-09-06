Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC553EB8FB8
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 10:23:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qdph2-0003Le-7G; Wed, 06 Sep 2023 06:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdph0-0003IA-O9
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 06:23:26 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdpgy-0001ii-Fp
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 06:23:26 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9a648f9d8e3so469938866b.1
 for <qemu-riscv@nongnu.org>; Wed, 06 Sep 2023 03:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693995802; x=1694600602; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=txJQvk2EzZdgYgATcIbEr45nHBa1cHGzQixKXDaayhk=;
 b=R/Thw5DU5xI83RIPwwH8xWBXkKz+5tYqcde6PNNPB/DWxgxF2xGFbkYtS39I3vn43j
 /UGnG6KTBRUT8MqJKfZQ8jHWUBR8Dsx8xqbYejMSeqr9gfImbUBUf4WhSR8lYQH2sOg2
 Hmm+TZOjP5N87qRRbzAZQeMvOFVTWoTVHFwXTa2BACWrY9QP4moFJCyUl8zXwpVkjGg4
 VQv0v/xTgZjlrdBD3oci/kNvakr4FemNVHYeEcssRRWElX1feXgdZFLdUAPwd6HG2Dah
 lbQ1YvMni1mbyUcEfPEo06IAFth/TGLlDr9GAjzjdZogqTUMUd+Sq3xYxalKNIjyQ2sP
 0eoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693995802; x=1694600602;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=txJQvk2EzZdgYgATcIbEr45nHBa1cHGzQixKXDaayhk=;
 b=DxIhNiGREUaiooV/njnqkf759IBoZawlAWgT0kkHgK+qIAcxrENPvblrCi6ZI7yIHa
 7Qoih5Wvnvtfuw/VmFr21ECqYoiDn+MKv97j0h2kUZjRjPVes1SynBHW4Fe4DQYf3t83
 BG6XNIw4WOlY9yUDz0RrQzXw3BsOnhT295wSSzcZBYHphffT3n31mWufHYw4SzPJJc2u
 mz9q/l4CGgHZ3KdIgGG7r7inFKFfOSYi8oHyX9eP4VXGPVwG+NpuIZvFXtRrBludxv7w
 J/bYiKFIkCTTZzrw7PvHajLDwZZe7vwKFU8DdcroBM2jlBPjOFILQeqsnhTKQBDrizw5
 JvnQ==
X-Gm-Message-State: AOJu0YznMqniBJTzUEyQRrHyVEOdw9IG318P3lz51bXkEYkJSOmpbATG
 exNX1gt1mIPvv1G0RGBaS47LKw==
X-Google-Smtp-Source: AGHT+IGyPMkiEl+AeR4f3J528bb1zZg3sCqzQFk4uGoNQpQ6RAqEfhWIdaIxfPj7M+zfhdGN6DcIPw==
X-Received: by 2002:a17:906:32cf:b0:994:4095:3abf with SMTP id
 k15-20020a17090632cf00b0099440953abfmr1953336ejk.14.1693995802403; 
 Wed, 06 Sep 2023 03:23:22 -0700 (PDT)
Received: from [192.168.69.115] (cou50-h01-176-172-51-223.dsl.sta.abo.bbox.fr.
 [176.172.51.223]) by smtp.gmail.com with ESMTPSA id
 t24-20020a1709064f1800b00992b1c93279sm8804685eju.110.2023.09.06.03.23.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Sep 2023 03:23:21 -0700 (PDT)
Message-ID: <f30d8589-8b59-2fd7-c38c-3f79508a4ac6@linaro.org>
Date: Wed, 6 Sep 2023 12:23:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v2 10/19] target/riscv: remove kvm-stub.c
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
 <20230906091647.1667171-11-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230906091647.1667171-11-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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

On 6/9/23 11:16, Daniel Henrique Barboza wrote:
> This file is not needed for some time now. All the stubs implemented in
> it (kvm_riscv_reset_vcpu() and kvm_riscv_set_irq()) are wrapped in 'if
> kvm_enabled()' blocks that the compiler will rip it out in non-KVM
> builds.
> 
> We'll also add non-KVM stubs for all functions declared in kvm_riscv.h.
> All stubs are implemented as g_asserted_not_reached(), meaning that we
> won't support them in non-KVM builds. This is done by other kvm headers
> like kvm_arm.h and kvm_ppc.h.

Aren't them also protected by kvm_enabled()? Otherwise shouldn't they?

> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/kvm-stub.c  | 30 ------------------------------
>   target/riscv/kvm_riscv.h | 31 +++++++++++++++++++++++++++++++
>   target/riscv/meson.build |  2 +-
>   3 files changed, 32 insertions(+), 31 deletions(-)
>   delete mode 100644 target/riscv/kvm-stub.c


> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
> index f6501e68e2..c9ecd9a967 100644
> --- a/target/riscv/kvm_riscv.h
> +++ b/target/riscv/kvm_riscv.h
> @@ -19,6 +19,7 @@
>   #ifndef QEMU_KVM_RISCV_H
>   #define QEMU_KVM_RISCV_H
>   
> +#ifdef CONFIG_KVM
>   void kvm_riscv_cpu_add_kvm_properties(Object *obj);

At a glance kvm_riscv_cpu_add_kvm_properties() is.
Keep the prototype declared (before #ifdef CONFIG_KVM) is enough for the
compiler to elide it.

>   void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
>   void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
> @@ -27,5 +28,35 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>                             uint64_t aplic_base, uint64_t imsic_base,
>                             uint64_t guest_num);
>   void riscv_kvm_aplic_request(void *opaque, int irq, int level);
> +#else
> +static inline void kvm_riscv_cpu_add_kvm_properties(Object *obj)
> +{
> +    g_assert_not_reached();
> +}
> +
> +static inline void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
> +{
> +    g_assert_not_reached();
> +}
> +
> +static inline void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
> +{
> +    g_assert_not_reached();
> +}
> +
> +static inline void kvm_riscv_aia_create(MachineState *machine,
> +                          uint64_t group_shift, uint64_t aia_irq_num,
> +                          uint64_t aia_msi_num, uint64_t aplic_base,
> +                          uint64_t imsic_base, uint64_t guest_num)
> +{
> +    g_assert_not_reached();
> +}
> +
> +static inline void riscv_kvm_aplic_request(void *opaque, int irq, int level)
> +{
> +    g_assert_not_reached();
> +}
> +
> +#endif /* CONFIG_KVM */


