Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6F3C10F15
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 09:56:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rzZM1-0004L0-ME; Wed, 24 Apr 2024 05:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzZM0-0004Km-Lt
 for qemu-riscv@nongnu.org; Wed, 24 Apr 2024 05:55:52 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzZLy-0007lj-QA
 for qemu-riscv@nongnu.org; Wed, 24 Apr 2024 05:55:52 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-34a7e47d164so4171319f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 24 Apr 2024 02:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713952549; x=1714557349; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=plBgM7Mzo/JhuzXa8aMMZ3nZa0XciMHnM8kXA2l9pkA=;
 b=xWVJni44+cfVC77JtAsdhRR1DIZx42aGBeVDipCt6rYdYc4+VXNpMOX9C983T97p/d
 FNBL90KP7bZP7czYc17pFuKXpueOk3XaDVzSWADCR1K6/NIW+6uC1BqADaBvtfDd6Omn
 L0uxkU1/Cg+UMtqXiPYVj4vihYc4oDM3H7MfXlCJABZOrcXILtujYi0/u7iL2LK6FSs0
 MbPf1+bvDyCeZoJZiy/hzxJ5TWX8R/T7/e7adDBRX4WKPOWmKWSBLiXoe9ZhcUgYLNhH
 AfE2GheIay4TWTutm0kcFjNoB2OR3ozSigrOxcWhJLq5c81N4Cz7sts5T6gdLX0Xh5Cy
 1qcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713952549; x=1714557349;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=plBgM7Mzo/JhuzXa8aMMZ3nZa0XciMHnM8kXA2l9pkA=;
 b=dHA1CAnbpGKl/5hnPZDvLYI7jXBBJ76YzznbOmSzJ7BGsB4pcCGPDidSOBFHOpV4/7
 UOQeDZIjPgspocAr9Sc9TuD7q0vmUZPID+xoCFl1691ykguzyCv4Eop5KF6BglHNgrar
 0+Gh8ttzgdZ2ZKtqcnqzRP4+v3hbXijAcA30JuN4ILmx/KzmYAkXz3ziMw9KUYW2cszq
 /FDOTUKRMeoVx74Eu7NwpP/IC8uAJzZ4+WRJ+A322mzC2Q+dtcQrdxLconmk9pkNwQLi
 DMWtiNKpPOV95xgIhpjum2YppUiLJmue5TceU97wu/S9L2gJS4oHywj+sokUlKdGdsRb
 PbVQ==
X-Gm-Message-State: AOJu0YzztjK1+jxXytRcIIppGby27+EIyDSk9g8CNo9mo4J0dHkSQfQh
 1iDvsbOyBQLJh6Yz9zZEkfjFm1vUi6kGqcGBGyxEajDbNtf//bfNhxLVrYtFs7U=
X-Google-Smtp-Source: AGHT+IGnn8+69RrPbwnJAXVNkb6ZqC2VXSWpV0sbr26lTVO6qncPhx10N7VGFhz8hx5wTb1X1qRd8Q==
X-Received: by 2002:adf:c04c:0:b0:346:b452:1740 with SMTP id
 c12-20020adfc04c000000b00346b4521740mr1308529wrf.3.1713952549029; 
 Wed, 24 Apr 2024 02:55:49 -0700 (PDT)
Received: from [192.168.1.102] (mon75-h03-176-184-51-42.dsl.sta.abo.bbox.fr.
 [176.184.51.42]) by smtp.gmail.com with ESMTPSA id
 z6-20020adff1c6000000b00343ad4bca7dsm16755948wro.85.2024.04.24.02.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 02:55:48 -0700 (PDT)
Message-ID: <82079170-9d82-46d5-81e4-44d3b38b551f@linaro.org>
Date: Wed, 24 Apr 2024 11:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/riscv/kvm: remove sneaky strerrorname_np()
 instance
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 thuth@redhat.com, alex.bennee@linaro.org, mjt@tls.msk.ru,
 ajones@ventanamicro.com
References: <20240424094700.453356-1-dbarboza@ventanamicro.com>
 <20240424094700.453356-2-dbarboza@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240424094700.453356-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 24/4/24 11:46, Daniel Henrique Barboza wrote:
> Commit d424db2354 excluded some strerrorname_np() instances because they
> break musl libc builds. Another instance happened to slip by via commit
> d4ff3da8f4.
> 
> Remove it before it causes trouble again.
> 
> Fixes: d4ff3da8f4 (target/riscv/kvm: initialize 'vlenb' via get-reg-list)
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/kvm/kvm-cpu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 6a6c6cae80..ee69ea9785 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1054,8 +1054,8 @@ static void kvm_riscv_read_vlenb(RISCVCPU *cpu, KVMScratchCPU *kvmcpu,
>   
>           ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
>           if (ret != 0) {
> -            error_report("Unable to read vlenb register, error code: %s",
> -                         strerrorname_np(errno));
> +            error_report("Unable to read vlenb register, error code: %d",
> +                         errno);

Why not use "%s" strerror(errno)?

>               exit(EXIT_FAILURE);
>           }
>   


