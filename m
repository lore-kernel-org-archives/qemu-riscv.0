Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D206CC5475B
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 06:56:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rkf0e-00051C-8d; Thu, 14 Mar 2024 02:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkf0Z-000501-DK
 for qemu-riscv@nongnu.org; Thu, 14 Mar 2024 02:56:07 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkf0U-00059J-RY
 for qemu-riscv@nongnu.org; Thu, 14 Mar 2024 02:56:07 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-56845954ffeso690696a12.2
 for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2024 23:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710399359; x=1711004159; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OoRN8P3vPwGYPfJkKxlvnqFCqIX6kQhkspBgssYnqoM=;
 b=JmB7HbkbWXLgpitMhRXfGyR2RMVxqWZuRdVa/CSowzUT4nieBmXPJUVFqjxQSLT1wv
 zjBd8tXABSv7Mb/h7EcqMeyna7e5SjOiqvwGp/R6xQRr/ecNg5G8NGY4GtSorBoOHEKc
 NZg5hBtQUgYhzPpCOChSF+ZaRxzjmGWKOrq4XTA7ezk/0anJfUGr4EDrOUfw4v8WCfao
 7Ut+c/aNp+8SiLJy9PAsdWUGSTiju8QcjwhsjugcoAxvy7Efg68Ru/f0yuVW912ON3ZN
 ghCx/bBQ4Hw+y0FjP2gEcs03fDxbLJH0ydWL5hzZOc4s0u2BmeGYO/9bZEaL3o3CPvPz
 WK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710399359; x=1711004159;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OoRN8P3vPwGYPfJkKxlvnqFCqIX6kQhkspBgssYnqoM=;
 b=QOWyAwmJlvAlN6JqL9s6m3ErCpfUKMddg/JAAM09WBSFxkeouEOfhKmEU8uonMQ0zb
 MIQCb5NlZoDrUhvRMYfPl6lsgaCytYG2JTnp/0P8GvXc6vfECaVxuSIhoE+vnF17uMf2
 mg/xKncwTBcKMjyJRbQriO5V/n2lSFxDdCDY2+sn267VcXmMOa8gQvz7N57eBmkdMZdU
 h5mupXQT2U7/8czPaMQChT+ZbQMibUbxDMtcrUpiSeFjkLfCnQDlD8SIeCDCAcqw3bRm
 uZWykZQoz5IG9/A+FXIbA2MteyXpWF+YnqMm2HEliFXm2N3LQxZOmHGRAO1/mTH5LD4r
 GjdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFPFLYQc6EfSObjTi6E2yuyHHvaUJDuwuv913YwrDc+lHq9Ouh0HNITAWUu5Q6CfYnLs1915Z7VJlbqkqRv2T3905m8FQ=
X-Gm-Message-State: AOJu0YwOORWRPiY4I5a8krzMB4EcJk4cJQmMrh2ADvmSXN/jldfl8FH6
 mBQnJi/j81yCLf3X5uD4DrDXIMQE0hwIev9ovfB9n7OGonrHFiIl1yFITrj2JKA=
X-Google-Smtp-Source: AGHT+IEKdzTTtqBP0uQKkwakXdbDB9fVFfya0HI+F2S/Bxp99eTGmQ756JVudKC/1mIOs5CALfZ7Iw==
X-Received: by 2002:a17:907:a4c3:b0:a44:4c7e:fc07 with SMTP id
 vq3-20020a170907a4c300b00a444c7efc07mr468869ejc.0.1710399359166; 
 Wed, 13 Mar 2024 23:55:59 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.175.89])
 by smtp.gmail.com with ESMTPSA id
 en2-20020a17090728c200b00a4674ad8ab9sm168216ejc.211.2024.03.13.23.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 23:55:58 -0700 (PDT)
Message-ID: <2fe169fc-1a41-44ff-b829-82b5c23f9344@linaro.org>
Date: Thu, 14 Mar 2024 07:55:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] target/riscv/kvm: fix timebase-frequency when
 using KVM acceleration
Content-Language: en-US
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com, 
 jim.shu@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>
References: <20240314061510.9800-1-yongxuan.wang@sifive.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240314061510.9800-1-yongxuan.wang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 14/3/24 07:15, Yong-Xuan Wang wrote:
> The timebase-frequency of guest OS should be the same with host
> machine. The timebase-frequency value in DTS should be got from
> hypervisor when using KVM acceleration.
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> 
> ---
> Changelog
> v2:
> - update the function definition
> - restructure if-else statement

Thanks!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> ---
>   hw/riscv/virt.c              | 2 ++
>   target/riscv/kvm/kvm-cpu.c   | 9 +++++++++
>   target/riscv/kvm/kvm_riscv.h | 1 +
>   3 files changed, 12 insertions(+)



