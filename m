Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F39C83F10
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 12:48:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbh5e-0007Dh-Gl; Thu, 31 Aug 2023 08:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbh5d-0007DT-9X
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:48:01 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbh5b-0002Hk-0a
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:48:01 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-401ec23be82so7549365e9.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486077; x=1694090877; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MuKQEjqs7xtZpogq/M2NsngsOFq+Lr4SRZ+K71ruknQ=;
 b=eGlFW9cKKT/OQV1hHHt7zefp6ehh7nJFJE/wiXhU1PQJWlbx5XISEV9yEv+SA4odJa
 zeN4bv2nEYOPI9GnAa3O/A3KVEaZjHdBhtx/OSf+eP1QNGYuO7XUKRqCe22Cm4fLc/Va
 HdMc5Qdg7pphRAZ3XkawG3ysYC0MJEnvsICatLhgtKesSmVizfhGX+e3ccT8GI5trqMT
 xVPNHVuH4H5esGuQSaaxDeY/0+Or/G6PJfGw36qUg0RQNZRGn9zOQY0fsU7bf67HUsin
 dzU0TKjlySAjNLNfpiQrqeuQ62jl5sDi3OgNUWnVWcrs3XiQutbH/lB1r9VA+MfySioJ
 Dhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486077; x=1694090877;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MuKQEjqs7xtZpogq/M2NsngsOFq+Lr4SRZ+K71ruknQ=;
 b=POxqxXWOMkGeW+/oBxVGDvnoKcSExDwh71Akbk01nxIUYO8JJjliNMjsMFWKuEjiOt
 p5RXqdZVDJJSv0Rwf7jQwruRYFVJiilijHimlhK0nuawEpK8YphJ9WSO/fCQ0KOKTybd
 WITqzCkpB4ksNmP15zsVF95TSe4Bdemu5wPDD3APyKMmdkHyFRJ3NjWs0NhYDhzucBLp
 nyGEoXK0CwgPNMa8p7CSo+Zl4dYoZbKYPOae16D9pJXFuRfDfXrQPWXv+jrINRnM9ZRQ
 r1m0ptJzlp9KqWi8qmvASjJAvNy6j9eOLGWg5036mpleQF6HnhwPg782r9h+3g8YWFYZ
 4Tfw==
X-Gm-Message-State: AOJu0YyTdKXQoEJRb58PlZ5sI/2UsqETahovvbXLSkLSra1a15ZL2UpF
 9f1pg0+GneRxBHKNkD6DFo67wQ==
X-Google-Smtp-Source: AGHT+IEXcUi09vWHQhQyrCMQALpbyA0GFPvHq6+nlextyisEOtaU7wDKErFhskYBZAkgudz1d91xVQ==
X-Received: by 2002:a05:600c:214d:b0:401:bdd7:499d with SMTP id
 v13-20020a05600c214d00b00401bdd7499dmr4111475wml.25.1693486077308; 
 Thu, 31 Aug 2023 05:47:57 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a05600c0aca00b003fc0505be19sm1884577wmr.37.2023.08.31.05.47.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 05:47:56 -0700 (PDT)
Message-ID: <292f8ac7-402f-0da1-2f4e-40d5391c861a@linaro.org>
Date: Thu, 31 Aug 2023 14:47:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/2] hw/riscv/virt.c: fix non-KVM --enable-debug build
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, richard.henderson@linaro.org
References: <20230830133503.711138-1-dbarboza@ventanamicro.com>
 <20230830133503.711138-2-dbarboza@ventanamicro.com>
 <20230831-d3b40182209cb9054ceaed62@orel>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230831-d3b40182209cb9054ceaed62@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.478,
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

On 31/8/23 10:42, Andrew Jones wrote:
> On Wed, Aug 30, 2023 at 10:35:02AM -0300, Daniel Henrique Barboza wrote:
>> A build with --enable-debug and without KVM will fail as follows:
>>
>> /usr/bin/ld: libqemu-riscv64-softmmu.fa.p/hw_riscv_virt.c.o: in function `virt_machine_init':
>> ./qemu/build/../hw/riscv/virt.c:1465: undefined reference to `kvm_riscv_aia_create'
>>
>> This happens because the code block with "if virt_use_kvm_aia(s)" isn't
>> being ignored by the debug build, resulting in an undefined reference to
>> a KVM only function.
>>
>> Add a 'kvm_enabled()' conditional together with virt_use_kvm_aia() will
>> make the compiler crop the kvm_riscv_aia_create() call entirely from a
>> non-KVM build. Note that adding the 'kvm_enabled()' conditional inside
>> virt_use_kvm_aia() won't fix the build because this function would need
>> to be inlined multiple times to make the compiler zero out the entire
>> block.
>>
>> While we're at it, use kvm_enabled() in all instances where
>> virt_use_kvm_aia() is checked to allow the compiler to elide these other
>> kvm-only instances as well.
>>
>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>> Fixes: dbdb99948e ("target/riscv: select KVM AIA in riscv virt machine")
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   hw/riscv/virt.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)


> I think I'd prefer
> 
>   /* We need this inlined for debug (-O0) builds */
>   static inline QEMU_ALWAYS_INLINE bool virt_use_kvm_aia(RISCVVirtState *s)
>   {
>      return kvm_enabled() && kvm_irqchip_in_kernel() && s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;

Generally we should know whether KVM is enabled or not _before_
calling any foo_kvm() code, not after.

>   }


