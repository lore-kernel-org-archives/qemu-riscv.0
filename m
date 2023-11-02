Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030F1C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 09:24:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyTwB-0007Ve-1U; Thu, 02 Nov 2023 05:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qyTw9-0007Un-7U
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 05:24:25 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qyTw4-0000z2-BZ
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 05:24:24 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-53d9f001b35so1080336a12.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 02:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698917058; x=1699521858; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ThyEzkVNIiVb6nAy7TZXys/fnKFKeCuCXx4r7/agG6Y=;
 b=MiCHi/1CecC9OKiCLGDJaUbDIh6FMXtWQBuOEc2dtsyWm5DqFOXfVWLxS99SdHCEp6
 mFT8H/58Ot3EmiKMYo2l33JUWOh2/+aMvdzlE4PEqpNM8NsFmE9Lqt595c6chn6XbA+x
 AeSZfIT2EEZW0bw/FUxMq+pywn57eegdW/IY1ut4vtYaArNlsT7ijwR6YrYZWOrAoROZ
 /VNeJA11yejxHEo1W+oLhrLRdBY2BPtSAvCcrK/2tYj/s8SXwxDz1XOiVXhO3TavsZWN
 IJWYII5+/kkHgaXDM7Z91069imgET/1xVUOZp9tqgY4Y76woMSRp9uHxvbNeEyhyR0nY
 8kOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698917058; x=1699521858;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ThyEzkVNIiVb6nAy7TZXys/fnKFKeCuCXx4r7/agG6Y=;
 b=SznVdUfVm51Q7bpVijFCzrZmnjGYDZFLcdbYIyCbY/0MKktJxdsAy/DPmNKddWvP95
 2pHwGcI2bpsQq3UMWIYMBaGs6bxYDzjik5uY8lEz4H1Oul9xdP5UxUYwZlvYVMUxRCub
 tcusnJvL/vMDPlMWr+UmOWdSAXq4CT0TZcWy5afBYBqCSf257sr1KWqSol5GooL77lR0
 YZmOKk3cDGwKuWhfMEJvcZ7i+VbrWzZKMBn9ZjCb2496VrcpHGmgn5pjBNJ2FyBv3Yca
 XV0bKNX9eEiI/eF6ke6IKhyHmLZNGTegJBGrDXlsY/s1itTGi5mLl9vlwar3m1dK9yXo
 Hlvw==
X-Gm-Message-State: AOJu0YxSyyJ+S0VpYaigIu/2yfCVi5wW+CGWbtRMnM2ic4HQ5VhAxVhG
 FqDieEbAhuYiwQ2KTMZUkklKzcr5B1rLLf7+CIM=
X-Google-Smtp-Source: AGHT+IFlNBpRb5s8sOHt+eQ4iY4Cgl0IPb3HreUJXBAH0Gk6Ro7aLzZjNltpwOINWF5vckdlASEPUA==
X-Received: by 2002:a50:cc8e:0:b0:542:e844:5c9b with SMTP id
 q14-20020a50cc8e000000b00542e8445c9bmr11704372edi.13.1698917058116; 
 Thu, 02 Nov 2023 02:24:18 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a509316000000b0053df23511b0sm2102493eda.29.2023.11.02.02.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 02:24:17 -0700 (PDT)
Date: Thu, 2 Nov 2023 10:24:16 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v8 03/19] target/riscv/cpu.c: set satp_max_supported in
 cpu_riscv_set_satp()
Message-ID: <20231102-b74e75db47b353355c6e5d66@orel>
References: <20231101204204.345470-1-dbarboza@ventanamicro.com>
 <20231101204204.345470-4-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101204204.345470-4-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Wed, Nov 01, 2023 at 05:41:48PM -0300, Daniel Henrique Barboza wrote:
> The setter() for the boolean attributes that set satp_mode (sv32, sv39,
> sv48, sv57, sv64) considers that the CPU will always do a
> set_satp_mode_max_supported() during cpu_init().
> 
> This is not the case for the KVM 'host' CPU, and we'll add another CPU
> that won't set satp_mode_max() during cpu_init(). Users should be able
> to set a max_support in these circunstances.
> 
> Allow cpu_riscv_set_satp() to set satp_mode_max_supported if the CPU
> didn't set one prior.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 822970345c..9f6837ecb7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1100,6 +1100,7 @@ static void cpu_riscv_get_satp(Object *obj, Visitor *v, const char *name,
>  static void cpu_riscv_set_satp(Object *obj, Visitor *v, const char *name,
>                                 void *opaque, Error **errp)
>  {
> +    RISCVCPU *cpu = RISCV_CPU(obj);
>      RISCVSATPMap *satp_map = opaque;
>      uint8_t satp = satp_mode_from_str(name);
>      bool value;
> @@ -1108,6 +1109,16 @@ static void cpu_riscv_set_satp(Object *obj, Visitor *v, const char *name,
>          return;
>      }
>  
> +    /*
> +     * Allow users to set satp max supported if the CPU didn't
> +     * set any during cpu_init(). First value set to 'true'
> +     * in this case is assumed to be the max supported for
> +     * the CPU.

Hmm, doesn't that mean if a user does

 -cpu rv64,sv39=true,sv48=true

then the max is set to sv39 instead of sv48?

I made a mistake in my last review by stating we shouldn't set the max
supported satp for rv64i to the maximum satp that TCG supports. I forgot
how all of it worked. Setting the _supported_ modes to the maximum that
TCG supports makes sense as long as we don't default to any of them for
rv64i. So, I think we should return the set_satp_mode_max_supported() to
rv64i's definition (passing VM_1_10_SV57 or maybe even VM_1_10_SV64) and
then change set_satp_mode_default_map() to error out for rv64i (or maybe
for all "bare" type cpus).

> +     */
> +    if (value && cpu->cfg.satp_mode.supported == 0) {
> +        set_satp_mode_max_supported(cpu, satp);
> +    }
> +
>      satp_map->map = deposit32(satp_map->map, satp, 1, value);
>      satp_map->init |= 1 << satp;
>  }
> -- 
> 2.41.0
>

Thanks,
drew

