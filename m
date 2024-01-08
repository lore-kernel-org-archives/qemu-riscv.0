Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E496AC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 16:29:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rMsVU-0000s4-39; Mon, 08 Jan 2024 11:29:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rMsVT-0000rn-4e
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 11:29:43 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rMsVR-0006Fb-Hs
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 11:29:42 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-28c2b8d6f2aso1126987a91.2
 for <qemu-riscv@nongnu.org>; Mon, 08 Jan 2024 08:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704731380; x=1705336180; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nFThXpVWTp3vAVjFntpSh6XeTunn2gZi/FSzemxlmoE=;
 b=LG1g9RWQSfBYE5vnBdsaI4ZuLmPivIFHubWqai9zKBcY88Mp63JDJ43bFJw1nszKwI
 RM7QoK1C4bZmSutaC+Lg85X2PKE3DYsxL0yWGU6EhkUTXpkRXBBlLLY/fERegizatNCV
 PzUezbt4YBOmnkTZOgAgHMSTJK41YcfrRjq18fdIUiJK3UzpWXjhicn7N8js1zCpuNC/
 QN2U7tyrUZ28sXkw0sr4g0u8qSLVPlubFN/qWlQdfBQ95u2FnzkNshEK61/8//+XZAgR
 6Hi9lIp6u84zLB5V6mNjharRE+kdzev961XLCsvmWXgKaQZrXFEQrBwnjc4en2Iqss9B
 C6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704731380; x=1705336180;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nFThXpVWTp3vAVjFntpSh6XeTunn2gZi/FSzemxlmoE=;
 b=Usskk5zGctTy4e4erdJZUdWM0+d4sY8YUcz5JyNNabxwk0VQJXHDn9sZwMxl7Jz3vT
 9Mz8Pnow5EdwnxGQo2XGS8fd/RMiz0mw6K2YNDmgyf45+m+n50NVU1Xv3Cr1zn29HqDh
 HQXwh40GUpUATJMUdvKy+VCaUEhlNPnT7IeoovBn22Ke6iWT/CMjgstPN7O26ko4K5kK
 RRvMPBzoXj1h9fskc50UdJKSfzlxh7LxAc0HPBBc/+lc4fKEQYmxLYGQXmo6wMcvo+S/
 7kXC/hPI8V8tDi9Q5dNt37qBgdieGFAE0AaSGETnzmaTe0l2VE6bfAPighUOY2QGg6LW
 hOtg==
X-Gm-Message-State: AOJu0YwO7daSrS9qNEqjdvdTBWbBrPnIaVpsDqu+dy52lomk9yMDpIO+
 NBewHhS1yLrBMnwR+WoX8zPsqqYzGzelMg==
X-Google-Smtp-Source: AGHT+IFDV8VFm9s9cu+GGBoBJdxZtd4WnEcUqvibHbzLCplTvCbuTE8BunpwU6cr8lKBcrPe+ItEag==
X-Received: by 2002:a17:90a:d315:b0:28c:d85:9807 with SMTP id
 p21-20020a17090ad31500b0028c0d859807mr1192409pju.78.1704731379773; 
 Mon, 08 Jan 2024 08:29:39 -0800 (PST)
Received: from [192.168.68.110] ([189.79.22.11])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a17090a318500b00286f2b39a95sm190927pjb.31.2024.01.08.08.29.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 08:29:38 -0800 (PST)
Message-ID: <3c0d046b-45a2-4cd5-93b6-4f7391518f4c@ventanamicro.com>
Date: Mon, 8 Jan 2024 13:29:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] target/riscv: Ensure mideleg is set correctly on reset
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>, zhiwei_liu@linux.alibaba.com,
 qemu-riscv@nongnu.org, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-devel@nongnu.org, liwei1518@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>
References: <20240108001328.280222-1-alistair.francis@wdc.com>
 <20240108001328.280222-4-alistair.francis@wdc.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240108001328.280222-4-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1032.google.com
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



On 1/7/24 21:13, Alistair Francis wrote:
> Bits 10, 6, 2 and 12 of mideleg are read only 1 when the Hypervisor is
> enabled. We currently only set them on accesses to mideleg, but they
> aren't correctly set on reset. Let's ensure they are always the correct
> value.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1617
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b07a76ef6b..e20ff46c23 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -891,6 +891,14 @@ static void riscv_cpu_reset_hold(Object *obj)
>       /* mmte is supposed to have pm.current hardwired to 1 */
>       env->mmte |= (EXT_STATUS_INITIAL | MMTE_M_PM_CURRENT);
>   
> +    /*
> +     * Bits 10, 6, 2 and 12 of mideleg are read only 1 when the Hypervisor
> +     * extension is enabled.
> +     */
> +    if (riscv_has_ext(env, RVH)) {
> +        env->mideleg |= HS_MODE_INTERRUPTS;
> +    }
> +
>       /*
>        * Clear mseccfg and unlock all the PMP entries upon reset.
>        * This is allowed as per the priv and smepmp specifications

