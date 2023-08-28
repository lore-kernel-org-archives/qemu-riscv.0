Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37EEC83F12
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 16:39:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qafGd-0004Ak-FU; Mon, 28 Aug 2023 12:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qafGc-00049u-6p
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 12:39:06 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qafGY-0006MX-Ov
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 12:39:06 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-31c73c21113so3057946f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 09:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693240741; x=1693845541;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tBTGbnF8Sr5FNXIyV3MwNTQfSe5GNPg8siv2LVDAl0k=;
 b=wfWTvHeIgaI5OxAzs1KM82/pXXo1yHIdyi9eezHUNWadHe3FCDPTP5U7P71TjpIQA8
 N1KM30VJH+x/FxLpDjwsvPzNG1K7NFMD1UjSO3NOfbfp6+JQ63hYowWzPEw1qRSrZ4IU
 WuS77YXih8aQF3wXkkaDoiUXqvJAy8dfoWkZIKhqD5FDXvPW8nXzvOzDCEqHT48nqwjd
 RUBuXEkeFJSM7J08CUbhaLeaAgBUfw77Yls2SqPO37oUgGSyNluzptvVVm8/Jisbku+g
 OhkXNNvAEenk5VXmqym+oQQE8ph9GNYUU4bCxA65dgLOnIVP6c6UEDeGigw3rMQzNN9z
 ZLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693240741; x=1693845541;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tBTGbnF8Sr5FNXIyV3MwNTQfSe5GNPg8siv2LVDAl0k=;
 b=P9r4OSsdJmuf0VbfP6XDJSXLxPiRc34GmA8aPD1eBiYywOalxgCMsdILqwS2YgBpUE
 5o8O8Fjybvy22OfxALYxoFY1iwgAFQyo19ICjFAEd5Ll0JdOrFnpTj3sh2/VNie8DkMQ
 vVstiBkfqT+v9lExs8ItQq7uBFEk95PrJ7ZKYnrfZSt+5vStB2UIhCupOU4PZwCZTE2n
 dmKAEJVHN+Uscag+pSPs4g6LSVmkU2fQ6Fi7Is4S5uu7Dw3Nlt1MB2hHdJwNO1kY+hWU
 ibXNn4L85CK6BbcGxaeY0BsuChv61sAc0tc3LfftRgVcfk4XJhRYurzaSOPeqTbyDVr1
 bOkQ==
X-Gm-Message-State: AOJu0Yx8KTRMkodVL2MMkjU6W3BCeaj6O56/pQuB4sYTeUy6nLbkfKZ/
 Ztn4PXyIbR54+tFNWJgGT09GEg==
X-Google-Smtp-Source: AGHT+IE4DXi9pTV82qudjTwMJN4vPLYjicb6RxTjB2Big2/gg2h6GemwMb4CgqfgHyBaGXd9j8YRsA==
X-Received: by 2002:adf:a459:0:b0:31c:e933:9593 with SMTP id
 e25-20020adfa459000000b0031ce9339593mr3193623wra.6.1693240740922; 
 Mon, 28 Aug 2023 09:39:00 -0700 (PDT)
Received: from [192.168.69.115] ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a5d6a11000000b003142e438e8csm10969998wru.26.2023.08.28.09.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 09:38:59 -0700 (PDT)
Message-ID: <ce33b3b2-564e-a8c5-dfc8-ae7f6644dc88@linaro.org>
Date: Mon, 28 Aug 2023 18:38:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 11/20] target/riscv: introduce KVM AccelCPUClass
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-12-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230825130853.511782-12-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.169,
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

On 25/8/23 15:08, Daniel Henrique Barboza wrote:
> Add a KVM accelerator class like we did with TCG. The difference is
> that, at least for now, we won't be using a realize() implementation for
> this accelerator.
> 
> We'll start by assiging kvm_riscv_cpu_add_kvm_properties(), renamed to
> kvm_cpu_instance_init(), as a 'cpu_instance_init' implementation. Change
> riscv_cpu_post_init() to invoke accel_cpu_instance_init(), which will go
> through the 'cpu_instance_init' impl of the current acceleration (if
> available) and execute it. The end result is that the KVM initial setup,
> i.e. starting registers and adding its specific properties, will be done
> via this hook.
> 
> riscv_cpu_add_user_properties() is still being called via the common
> post_init() function, thus we still need the "if kvm then return" logic
> inside it for now. We'll deal with it when TCG accel class get its own
> 'cpu_instance_init' implementation.
> 
> riscv_add_satp_mode_properties() is now being exported from cpu.c since
> it's a common helper between KVM and TCG.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c       |  8 ++---
>   target/riscv/cpu.h       |  1 +
>   target/riscv/kvm.c       | 64 +++++++++++++++++++++++++++-------------
>   target/riscv/kvm_riscv.h |  1 -
>   4 files changed, 49 insertions(+), 25 deletions(-)


> -static void riscv_add_satp_mode_properties(Object *obj)
> +void riscv_add_satp_mode_properties(Object *obj)
>   {
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
> @@ -1199,6 +1199,8 @@ static void riscv_cpu_post_init(Object *obj)
>       RISCVCPU *cpu = RISCV_CPU(obj);
>       RISCVCPUClass *rcc = RISCV_CPU_GET_CLASS(cpu);
>   
> +    accel_cpu_instance_init(CPU(obj));
> +
>       if (rcc->user_extension_properties) {
>           riscv_cpu_add_user_properties(obj);
>       }
> @@ -1561,12 +1563,10 @@ static void riscv_cpu_add_multiext_prop_array(Object *obj,
>   static void riscv_cpu_add_user_properties(Object *obj)
>   {
>   #ifndef CONFIG_USER_ONLY
> -    riscv_add_satp_mode_properties(obj);
> -
>       if (kvm_enabled()) {
> -        kvm_riscv_cpu_add_kvm_properties(obj);
>           return;
>       }

Maybe in a preliminary patch:

if (tcg_enabled()) {

> +    riscv_add_satp_mode_properties(obj);

}

then remove the 'if kvm_enabled' in this patch?

>   #endif


