Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD65C83F14
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 14:17:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qazX7-0007rr-Rb; Tue, 29 Aug 2023 10:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qazX6-0007rd-2o
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 10:17:28 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qazX1-00013X-Vg
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 10:17:27 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fef34c33d6so42033755e9.3
 for <qemu-riscv@nongnu.org>; Tue, 29 Aug 2023 07:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693318634; x=1693923434;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o34Lj+FJgL6L1XBRPJvbECpQDqbYroMYp6RnXsQcZ0w=;
 b=YqEMTFoMHh4OoagoQjl1DYFH0PaMV6JslP3L92NaJnKJ6n12qMzFQfE+j8GKSf1ZyT
 /C86xjx1kiNbastEwExW7MmW8jOPk3qhqcCB+Hok6VwuHbHOv790/JFMEhbUqhBWFrTj
 DpR3taxbwK77Df8dSg4kw+qeKcFO/FFYzoeyJ+ZUfqeTDAd/7Q8nk3nbUabZUZJc63n1
 54OM7tRymfOMvURtrciwL1c4BrgmiojkZtLkAthZwS237tn2C8kBJV+/e+QUUxcqy48X
 HyLMmPeqEPTjYFE6JAOF5jVzGYQSchKactrrlbnGa4q5xD78XGExSZxXv00O0Lc8ILYz
 FElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693318634; x=1693923434;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o34Lj+FJgL6L1XBRPJvbECpQDqbYroMYp6RnXsQcZ0w=;
 b=WDrGCCNJg07YKFcd4rcSNslKyFE6H83a+KMdcUOJ6/nHpT4K5gnmJNX0wa/4AA0dIX
 MREJVYjn40Czr/Q50poGvNgzD2u6jKYlNp08HTNp8RUnFY/4BXFmst0K/dqCKrDiMyMK
 yC11tof6Ny6t6JXYDHElQ3x6bPAm9qTvrImH63cJAMqQ6vDbVy33A/T8KC0DwUQJpxIl
 WToD7O6RG/q2dDwN7aWx+Dv9ZCPJHXiTTLVLdRLCFlBfjvwyOWTT+AcyHStsxQzpnC9c
 V6riwLvdvN3+TAvj3D88chRCVbyxoWrAOLAuHocoDaIyJg/DSSJiGZwklhXRCBGobw+i
 1z3Q==
X-Gm-Message-State: AOJu0Yxf+Em9d7PAkc8LEOXxqHY/7DDu5e98nc+vSh792SegUEOKC2tw
 zfaARERkHJCk6Frf2taf6IaG4w==
X-Google-Smtp-Source: AGHT+IEZrK6lAx2zX/71jHHy294dOn42oDyTWxUvmJKfJH0l8o/aUZdDvSwwXMkXuDuyxFHpZQZLSw==
X-Received: by 2002:a1c:790e:0:b0:3fe:1232:93fa with SMTP id
 l14-20020a1c790e000000b003fe123293famr22387550wme.22.1693318633788; 
 Tue, 29 Aug 2023 07:17:13 -0700 (PDT)
Received: from [192.168.69.115] (sml13-h01-176-184-15-56.dsl.sta.abo.bbox.fr.
 [176.184.15.56]) by smtp.gmail.com with ESMTPSA id
 l7-20020a1c7907000000b003fe4ca8decdsm17284602wme.31.2023.08.29.07.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 07:17:13 -0700 (PDT)
Message-ID: <19b33c0d-fe00-a108-81cf-eed4b0b238f5@linaro.org>
Date: Tue, 29 Aug 2023 16:17:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] hw/intc/riscv_aplic.c fix non-KVM --enable-debug build
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230829122144.464489-1-dbarboza@ventanamicro.com>
 <20230829122144.464489-2-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230829122144.464489-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
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

On 29/8/23 14:21, Daniel Henrique Barboza wrote:
> Commit 6df0b37e2ab breaks a --enable-debug build in a non-KVM
> environment with the following error:
> 
> /usr/bin/ld: libqemu-riscv64-softmmu.fa.p/hw_intc_riscv_aplic.c.o: in function `riscv_kvm_aplic_request':
> ./qemu/build/../hw/intc/riscv_aplic.c:486: undefined reference to `kvm_set_irq'
> collect2: error: ld returned 1 exit status
> 
> This happens because the debug build will poke into the
> 'if (is_kvm_aia(aplic->msimode))' block and fail to find a reference to
> the KVM only function riscv_kvm_aplic_request().
> 
> Make riscv_kvm_aplic_request() a no-op if we're not building KVM.
> 
> Fixes: 6df0b37e2ab ("target/riscv: update APLIC and IMSIC to support KVM AIA")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/intc/riscv_aplic.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index 592c3ce768..b634738bda 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -483,7 +483,9 @@ static uint32_t riscv_aplic_idc_claimi(RISCVAPLICState *aplic, uint32_t idc)
>   
>   static void riscv_kvm_aplic_request(void *opaque, int irq, int level)
>   {
> +#ifdef CONFIG_KVM
>       kvm_set_irq(kvm_state, irq, !!level);
> +#endif
>   }

Can we use kvm_enabled() to let the compiler elide KVM code
when !CONFIG_KVM?

-- >8 --
diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index 592c3ce768..f28d0d3237 100644
@@ -155,7 +155,7 @@
   */
  static bool is_kvm_aia(bool msimode)
  {
-    return kvm_irqchip_in_kernel() && msimode;
+    return kvm_enabled() && kvm_irqchip_in_kernel() && msimode;
  }
---


