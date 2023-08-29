Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC88DC71153
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 22:43:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qb7Q7-0004LT-Hm; Tue, 29 Aug 2023 18:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qb7Jb-0003J4-25
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 18:36:03 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qb7JX-00018n-KJ
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 18:36:02 -0400
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3a85b1b7574so3348954b6e.2
 for <qemu-riscv@nongnu.org>; Tue, 29 Aug 2023 15:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693348557; x=1693953357; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N9XCTzrL+n1Dpo93VatswWGQTJhitcA2tHH0l8EnUjg=;
 b=f+ifr2dfr5Pw8d35Ahkv83xoGYUHfoBZQkMzLpjPP51k5dtRLg3Is0Rc+mENZGiTIz
 CUo/QUw+X+/zZhiUVrba4rojUZdoNa1v7qBJT2owrPMVvvgLY+KjbZ1gmPsa6iWTqaN6
 5ltOuvj62zdr9UfCgl8z76ulbY5RCDiqCPnNix2wHTFw7MfG1hL7FHGom01O7p3/3uz6
 FTIOXXJdPMKCu6H5RIkJX/uEpSmzGWV06cuym3iVzTewfGv9c25REF29Rx3HzcZ7kNw1
 VYne9SYWMnAQr8NiSzRZw/T8iBahGx9rY4Wa40+/tMH3Km3aCp1qGV2v6WWh9NRHf7u5
 TdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693348557; x=1693953357;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N9XCTzrL+n1Dpo93VatswWGQTJhitcA2tHH0l8EnUjg=;
 b=jGbEiULCpF4QOnTyUksYHySqspb8He25fjvQxHDnCmasPwItEWN5M4fYLzjlmTpCmW
 jBTK895pY+pZd9ozPV+0Iol6mlh7/CMHX6gU0Xwd6xLsv/tMOpzNCCdurcncrVvRhEcK
 NN7BWhuVr0O9mJw9Ked6+rTS7SSpiAWzLypXmfaEksQAaOQTd/oRZfWg/3qPeSHhQ3VK
 bxz2hlAsNDA18txTv/d8dTga46crkfFdDx+UtxHRMoUf8kdVht0qnztX5Sk2GNDipBAR
 67U7xcsqijTGUje7MiQvB7RSsjaoylc7t7/ZjUfVZp3VudtbHoTv0armRHvtiKFdI8SC
 dQ/A==
X-Gm-Message-State: AOJu0YxpxpBBciDc/uC74fpOgkYHMazIuDZUAwVmEWz4D+S58NjXLuNE
 Xo2vnnpXnn9ikaEGX+ebLple2g==
X-Google-Smtp-Source: AGHT+IFrrFIDrpd9Xqf2JPPSEXlEYfZkRo0Ak0uZPVuM0QtwXJNhdZM78z3vLCCmaaMlM+LWpUW+3Q==
X-Received: by 2002:a05:6808:1794:b0:3a7:36f9:51aa with SMTP id
 bg20-20020a056808179400b003a736f951aamr694176oib.17.1693348557269; 
 Tue, 29 Aug 2023 15:35:57 -0700 (PDT)
Received: from [192.168.68.108] ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 c6-20020aca1c06000000b003a5b027ccb2sm4976233oic.38.2023.08.29.15.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 15:35:56 -0700 (PDT)
Message-ID: <347984ea-3532-45b5-a9d7-1c3539b99b76@ventanamicro.com>
Date: Tue, 29 Aug 2023 19:35:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] hw/intc/riscv_aplic.c fix non-KVM --enable-debug build
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230829122144.464489-1-dbarboza@ventanamicro.com>
 <20230829122144.464489-2-dbarboza@ventanamicro.com>
 <19b33c0d-fe00-a108-81cf-eed4b0b238f5@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <19b33c0d-fe00-a108-81cf-eed4b0b238f5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
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



On 8/29/23 11:17, Philippe Mathieu-Daudé wrote:
> On 29/8/23 14:21, Daniel Henrique Barboza wrote:
>> Commit 6df0b37e2ab breaks a --enable-debug build in a non-KVM
>> environment with the following error:
>>
>> /usr/bin/ld: libqemu-riscv64-softmmu.fa.p/hw_intc_riscv_aplic.c.o: in function `riscv_kvm_aplic_request':
>> ./qemu/build/../hw/intc/riscv_aplic.c:486: undefined reference to `kvm_set_irq'
>> collect2: error: ld returned 1 exit status
>>
>> This happens because the debug build will poke into the
>> 'if (is_kvm_aia(aplic->msimode))' block and fail to find a reference to
>> the KVM only function riscv_kvm_aplic_request().
>>
>> Make riscv_kvm_aplic_request() a no-op if we're not building KVM.
>>
>> Fixes: 6df0b37e2ab ("target/riscv: update APLIC and IMSIC to support KVM AIA")
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   hw/intc/riscv_aplic.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
>> index 592c3ce768..b634738bda 100644
>> --- a/hw/intc/riscv_aplic.c
>> +++ b/hw/intc/riscv_aplic.c
>> @@ -483,7 +483,9 @@ static uint32_t riscv_aplic_idc_claimi(RISCVAPLICState *aplic, uint32_t idc)
>>   static void riscv_kvm_aplic_request(void *opaque, int irq, int level)
>>   {
>> +#ifdef CONFIG_KVM
>>       kvm_set_irq(kvm_state, irq, !!level);
>> +#endif
>>   }
> 
> Can we use kvm_enabled() to let the compiler elide KVM code
> when !CONFIG_KVM?
> 
> -- >8 --
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index 592c3ce768..f28d0d3237 100644
> @@ -155,7 +155,7 @@
>    */
>   static bool is_kvm_aia(bool msimode)
>   {
> -    return kvm_irqchip_in_kernel() && msimode;
> +    return kvm_enabled() && kvm_irqchip_in_kernel() && msimode;

Apparently we can't:


$ git diff
diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index b634738bda..f28d0d3237 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -155,7 +155,7 @@
   */
  static bool is_kvm_aia(bool msimode)
  {
-    return kvm_irqchip_in_kernel() && msimode;
+    return kvm_enabled() && kvm_irqchip_in_kernel() && msimode;
  }
  
  static uint32_t riscv_aplic_read_input_word(RISCVAPLICState *aplic,
@@ -483,9 +483,7 @@ static uint32_t riscv_aplic_idc_claimi(RISCVAPLICState *aplic, uint32_t idc)
  
  static void riscv_kvm_aplic_request(void *opaque, int irq, int level)
  {
-#ifdef CONFIG_KVM
      kvm_set_irq(kvm_state, irq, !!level);
-#endif
  }

Same error appears:


/usr/bin/ld: libqemu-riscv64-softmmu.fa.p/hw_intc_riscv_aplic.c.o: in function `riscv_kvm_aplic_request':
/home/danielhb/work/qemu/build/../hw/intc/riscv_aplic.c:486: undefined reference to `kvm_set_irq'
collect2: error: ld returned 1 exit status


Thanks,


Daniel



>   }
> ---
> 

