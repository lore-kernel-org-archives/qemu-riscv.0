Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4104AC48BC4
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 13:23:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rayB0-0003ix-QE; Fri, 16 Feb 2024 08:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rayAy-0003ie-Qq
 for qemu-riscv@nongnu.org; Fri, 16 Feb 2024 08:22:49 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rayAw-0004L9-MW
 for qemu-riscv@nongnu.org; Fri, 16 Feb 2024 08:22:48 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2906773c7e9so1516205a91.1
 for <qemu-riscv@nongnu.org>; Fri, 16 Feb 2024 05:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1708089765; x=1708694565; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2ULQ6zGJw6sA295fwNsjNCpIKe/+hkjRIauLMp7hLr8=;
 b=mP+Okxbz94uiIM//qc1U5gPPDfqpOCwKicKp3m6HGo5DEhY7qlNeKn/QUfHmaXKNhH
 dYm6jyvNBEHC6Tj7bXmt8CHveUxP1WB1PEwUdajXT7qHyLEeVqH8JrOJZ1zWZmR3z9UR
 vCX1YaXQvZ/yYlyefzhzKKg/tH1Md3qoqx6GoLYlTtDwaQvwZbZdGp6LW9cqK1bOQB+3
 oycBwH/qTQIQkPCpLGeSV252B4sIwYzfRDw2w+7CggaMfHff3qFO9LGdtJ7jSlL6XUhK
 z8uEU0SJEEJNtw90+FcrBa64+j0jsgIlx5T4oMvHzpigbRsSZjprrGKlIVGcnZuJOA4d
 lO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708089765; x=1708694565;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2ULQ6zGJw6sA295fwNsjNCpIKe/+hkjRIauLMp7hLr8=;
 b=nsJb7q8saLF0F4F7Iweu07Y9WZXMjsOYRog8TWV4ZiiFxwAQ3O6v63dRo3ePYHuzJK
 ei1PPbiKgGt7dxFdacLgRZzSbbIJwFxK7bdHG3PaFdzcLRbr5jXRKnEKIqcFzvDwjzBX
 +mH7V1IZfLMXUff8kfI+Rg7rM09v+I2M1qfo6wwIFkZqpZ0BwQQasQQU4eozL6ehl7jQ
 QzAYNK1AWPDKV8K6JxGx/cHhIGpGO7ZxwphV1KP4UiqBcVptmLN991S727eceGx9GwAZ
 zMjZAgXTklM09LvCP6721DeOV91Z4GZWReg6ArwDzJ5Jk38hnWWLjNW91Y+eOTNKgrum
 EqXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPXLwMJErd4Ib758x4fI4ObZLaSwV+y0gV+BbxStMezpTwB6Y3KMAlhPYoZWw0WOSEVZRbUfhAYVwdCupx7K84BhuAH1A=
X-Gm-Message-State: AOJu0YyNruimRcWjjh0g6BnTyw0gT8gLQaX+Lo1NTzb3K6COtA8vAFyP
 MCuoKKfrhtV7dCSSXMTVARHbfY1yuxL391wJ+UMNhc1mozo8XXGJj3ht59LvwO4=
X-Google-Smtp-Source: AGHT+IGTmaekq+uwPCu9V0nbDcKQGIbF2Z69wJFj03R1u2ENWQB7BatFKWhpLqDi6lU9zpsnV//z4w==
X-Received: by 2002:a17:90b:2357:b0:299:dd1:d0bf with SMTP id
 ms23-20020a17090b235700b002990dd1d0bfmr4552080pjb.0.1708089764941; 
 Fri, 16 Feb 2024 05:22:44 -0800 (PST)
Received: from [192.168.68.110] ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 t22-20020a17090a1c9600b00298e639d17esm3643324pjt.22.2024.02.16.05.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 05:22:44 -0800 (PST)
Message-ID: <d18d1a7e-3374-477e-b69e-d69c796b0d44@ventanamicro.com>
Date: Fri, 16 Feb 2024 10:22:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] target/riscv: Set the value of CSR tcontrol when
 trapping to M-mode
Content-Language: en-US
To: Alvin Chang <alvinga@andestech.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com
References: <20240216061332.50229-1-alvinga@andestech.com>
 <20240216061332.50229-4-alvinga@andestech.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240216061332.50229-4-alvinga@andestech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1033.google.com
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



On 2/16/24 03:13, Alvin Chang wrote:
>  From the RISC-V debug specification, it defines the following operations
> for CSR tcontrol when any trap into M-mode is taken:
> 1. tcontrol.MPTE is set to the value of tcontrol.MTE
> 2. tcontrol.MTE is set to 0
> 
> This commit implements the above operations into
> riscv_cpu_do_interrupt().
> 
> Signed-off-by: Alvin Chang <alvinga@andestech.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   target/riscv/cpu_helper.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index d462d95ee1..037ae21062 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1806,6 +1806,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>               riscv_cpu_set_virt_enabled(env, 0);
>           }
>   
> +        /* Trapping to M-mode. Set tcontrol CSR in debug Sdtrig extension. */
> +        s = env->tcontrol;
> +        s = set_field(s, TCONTROL_MPTE, get_field(s, TCONTROL_MTE));
> +        s = set_field(s, TCONTROL_MTE, 0);
> +        env->tcontrol = s;
> +
>           s = env->mstatus;
>           s = set_field(s, MSTATUS_MPIE, get_field(s, MSTATUS_MIE));
>           s = set_field(s, MSTATUS_MPP, env->priv);

