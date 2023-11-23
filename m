Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633E5C61D85
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 10:23:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r66s0-0003D1-88; Thu, 23 Nov 2023 05:23:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r66rz-0003CX-51
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 05:23:39 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r66rx-0002lV-Ga
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 05:23:38 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40b27b498c3so4640405e9.0
 for <qemu-riscv@nongnu.org>; Thu, 23 Nov 2023 02:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700735016; x=1701339816; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BQXlq2DBaRvDl0dUwf6hitoVzbMvjzP4AsQvCnP7xJc=;
 b=R6BtQrTmj0nKyRSUcUZNRmKnn8JMRjOnOEiGG7rxecv2dEpq1GGpJiNXKG1P31i0ie
 QYKuGFEOwgmfvSKiLQV7zWU4/dY5K7hprcq4uQU9zLCDm9zwoCx+X5Qm9qb41NxcEYTM
 ZJREiIrB3LA7ONPXs8LOpbRH886JXRzQFwVwDmdeHMek5ZeB4lrEK/WzmGxJkN8AcPxP
 dNduG7yU7r0IpwOl8j78N6dhnNMccaYUP1Tr5NeiY7VkEAMcxMmF4UWLKeSd9vIFTWk2
 cfwx1a0kdD8qXi1TQ+8sOHQM/yedZV38BIKzta+Zb8oQRnw30t/2ClJIsg9e81KoRHbL
 ct7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700735016; x=1701339816;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BQXlq2DBaRvDl0dUwf6hitoVzbMvjzP4AsQvCnP7xJc=;
 b=vpxgLlhYkDy30SWTN8JDyRnvxBj19IOT86dxApY9se88kJejr1GK2Vz2UmmtoO0Ji7
 F5LjmY/clA9p6XJX4YScFUMB2N9oTWpHWBM/BmGiS7AmOdA/k1BpFTezEaO1GAmeBIUt
 agDi/oOkMqAMR/OzFICzcnID+C79ZLIS8bSQ7PkyqzTyqig5ZGECnLPql+T77MyxrY9/
 WaU0dhc1elTxMcoEhQ3scwDvThRDWvqjY7NsrPBuXoMnYlu5a0zzp7wYASsl1eAAkxvS
 iT+RgGm6bSwrXo8v9Wo0TrCoguYJ/dQdASsAGY0rmwnIuLFZZvgQlySM0uvcFr7d1t8t
 Ujlw==
X-Gm-Message-State: AOJu0YzCWIyL+4/8l9099iCZktT/lAZtqA8E6FhEX5smCh87ABoHJmKe
 WTJcWLDoWBd6nYMjNtA4vybuuN3iGaAFea3RNTs=
X-Google-Smtp-Source: AGHT+IEemMFpGEFEPgsAp7CH2cAZXG0zxAZgZvKV9H81rmOvRXXj+yTnDHlcQN9feY6l8KiIhCVTrg==
X-Received: by 2002:a05:600c:5250:b0:409:1841:3f42 with SMTP id
 fc16-20020a05600c525000b0040918413f42mr3625320wmb.13.1700735015882; 
 Thu, 23 Nov 2023 02:23:35 -0800 (PST)
Received: from [192.168.69.100] ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 24-20020a05600c231800b0040b36050f1bsm1464159wmo.44.2023.11.23.02.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 02:23:35 -0800 (PST)
Message-ID: <5cb07d83-934d-4db0-8fee-3146f3751743@linaro.org>
Date: Thu, 23 Nov 2023 11:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-8.2] target/riscv/kvm: fix shadowing in
 kvm_riscv_(get|put)_regs_csr
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20231123101338.1040134-1-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123101338.1040134-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 23/11/23 11:13, Daniel Henrique Barboza wrote:
> KVM_RISCV_GET_CSR() and KVM_RISCV_SET_CSR() use an 'int ret' variable
> that is used to do an early 'return' if ret > 0. Both are being called
> in functions that are also declaring a 'ret' integer, initialized with
> '0', and this integer is used as return of the function.
> 
> The result is that the compiler is less than pleased and is pointing
> shadowing errors:
> 
> ../target/riscv/kvm/kvm-cpu.c: In function 'kvm_riscv_get_regs_csr':
> ../target/riscv/kvm/kvm-cpu.c:90:13: error: declaration of 'ret' shadows a previous local [-Werror=shadow=compatible-local]
>     90 |         int ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, csr), &reg); \
>        |             ^~~
> ../target/riscv/kvm/kvm-cpu.c:539:5: note: in expansion of macro 'KVM_RISCV_GET_CSR'
>    539 |     KVM_RISCV_GET_CSR(cs, env, sstatus, env->mstatus);
>        |     ^~~~~~~~~~~~~~~~~
> ../target/riscv/kvm/kvm-cpu.c:536:9: note: shadowed declaration is here
>    536 |     int ret = 0;


> The macros are doing early returns for non-zero returns and the local
> 'ret' variable for both functions is used just to do 'return 0', so
> remove them from kvm_riscv_get_regs_csr() and kvm_riscv_put_regs_csr()
> and do a straight 'return 0' in the end.
> 
> For good measure let's also rename the 'ret' variables in
> KVM_RISCV_GET_CSR() and KVM_RISCV_SET_CSR() to '_ret' to make them more
> resilient to these kind of errors.
> 
> Fixes: 937f0b4512 ("target/riscv: Implement kvm_arch_get_registers")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/kvm/kvm-cpu.c | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



