Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C046CAC5AE
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 20:31:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v1W8O-0000iC-56; Wed, 24 Sep 2025 16:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1v1W8G-0000hQ-EI
 for qemu-riscv@nongnu.org; Wed, 24 Sep 2025 16:30:32 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1v1W85-0007Yt-P4
 for qemu-riscv@nongnu.org; Wed, 24 Sep 2025 16:30:31 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-6353e91a04aso111181d50.2
 for <qemu-riscv@nongnu.org>; Wed, 24 Sep 2025 13:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1758745817; x=1759350617; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FTuDQF9zXmn9U0UoAIk+2JX1nQHHEydEwUFb5dgsHgE=;
 b=AfQvujr7L503s8hW3CBurQuEBP5FJ0pP9L6kbrwLDZ/AshoL4E906pmgK359LVOPkO
 pI1OyhZQ5yFxWLQQuFm+7OZ2XmPxAaFaayZSAZLMV3PosXeNC1yfs1m2LCxa/oC48wKw
 rCh5i9J3T0ymIqKajdzACFCfiaOa348sAJb62o7jMS7yWnTPo4mwdv4FtNfPOEUHGpS5
 WGKmHSs5uP4OzgvXRhyDUCG6/sQnJ38ATxo/6VwPthkXMPREZMWjGmPcMvhfeCvbOJWm
 udnBu0bKNLP7s2CYpXQPpbaRGXGTUmAGshJtJDQ1C7uBuBrD3U0GNn6OyFXGsClKpMWk
 Jdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758745817; x=1759350617;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FTuDQF9zXmn9U0UoAIk+2JX1nQHHEydEwUFb5dgsHgE=;
 b=ditp1Zm4FV9uKRwSvyPKKG59yMCihcpTKpCKeGYDci9TPo0N1WtTRIl0f2+t/0zKD9
 vCnBEIQc1pD8XIZFZgsj2PS8/LKE1ktvfLOeppPbPPR2VKaeLfXETfYbiwdH6FFgaYoG
 LZpGc/HelXzHpc3aeEGJsGMzo1VX6X0fR25ZpYWboc49hxwNjbvVeuUODoJw5Dag+AKs
 i0xgGQ71qJOS+874bgwO9tJQfDt0fUchaMwcq7LY/s/RgzldvpWtW5wxHBP3ZK/2eZy5
 UTFQHk+kv9x4qlMsf35U2Fw7kDpIsAjOlIR/VNzOja6r0sWZPmJRxIzRfMcVzbLM6J5D
 EcRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCiLbw3rOoMX+bTs0wWKEQdrhoE6HgteZ2l6zKjODruA0kCoV8sX9WCot1X3O3UNP8wjdY8PSBlEYs@nongnu.org
X-Gm-Message-State: AOJu0YwI/GRukufM9U5W/Ttr1/oixSU7Soibz1bH5HkRJDa6smL98qwP
 Azgixh4i3wYkCWjtikexVp2lreXxIwzsiDV9jA+X7SaiDYbCP4qyfgkypkEgPyXsDnA=
X-Gm-Gg: ASbGncujUbtzh9vu4u6gn2J1oGgkfE2bO4+HpMwnE9A7Q018mD4NzdiXlULUxRQcnhC
 Z5PTbqqDXqKdnZXnPf+JKuBmuwqfwVNR7/srVUeiokOnk/hBwot1euYQzcSKwxptEduazAHpUi2
 gFlb+pCXGFj6PtvmV87t58ShoY4QcpzAs5wQyBErJcGoPqAbX7n8ksVUIgO5YAN0OkKslS6AY4i
 wWNfVbMmSD/YpKpaOjrdC6rvEblqBQg7eq570zftmV0r0XsLf1vb3gr9wHgiWxQPbaQ//z/fP97
 F7AA0eRHwXs307t6ji2Bn8XoAWD8nBOsVjRyVuXWWT9/JPOgyFE5S/NllI1CyGPDLl0gsWfRkhz
 +nLxSZyMri8+Y2O33XZyTJ7FD0jw95cStdTnP7Vq2PQ==
X-Google-Smtp-Source: AGHT+IEo0ToDd65nMxjcKVOrJipoOYGWZMMtv6EqZuB8UfsIU8JhhQfds7+U5HDWBzi3XFjdfUf3PA==
X-Received: by 2002:a05:690e:160a:b0:636:1784:c5ff with SMTP id
 956f58d0204a3-6361a7156eemr594115d50.11.1758745816843; 
 Wed, 24 Sep 2025 13:30:16 -0700 (PDT)
Received: from localhost ([173.23.183.85]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-75210e5afa0sm22166757b3.3.2025.09.24.13.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 13:30:16 -0700 (PDT)
Date: Wed, 24 Sep 2025 15:30:15 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] target/riscv/kvm: Use riscv_cpu_is_32bit() when handling
 SBI_DBCN reg
Message-ID: <20250924-56f55a61a8428438eb6252ce@orel>
References: <20250924164515.51782-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250924164515.51782-1-philmd@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=ajones@ventanamicro.com; helo=mail-yx1-xb131.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Wed, Sep 24, 2025 at 06:45:15PM +0200, Philippe Mathieu-Daudé wrote:
> Use the existing riscv_cpu_is_32bit() helper to check for 32-bit CPU.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/riscv/kvm/kvm-cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 5c19062c19b..187c2c9501e 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1588,7 +1588,7 @@ static void kvm_riscv_handle_sbi_dbcn(CPUState *cs, struct kvm_run *run)
>           * Handle the case where a 32 bit CPU is running in a
>           * 64 bit addressing env.
>           */
> -        if (riscv_cpu_mxl(&cpu->env) == MXL_RV32) {
> +        if (riscv_cpu_is_32bit(cpu)) {
>              addr |= (uint64_t)run->riscv_sbi.args[2] << 32;
>          }
>  
> -- 
> 2.51.0
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

