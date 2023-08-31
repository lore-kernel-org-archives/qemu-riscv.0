Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70A3C83F12
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:19:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhaV-0004ZG-CZ; Thu, 31 Aug 2023 09:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbhaS-0004U5-1e
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:19:53 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbhaO-0005Au-WE
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:19:51 -0400
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so98270466b.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 06:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693487986; x=1694092786; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lG8KFBDF0e0Rk16UcvLLdRikexZwA9mu8s0dUdhz7u0=;
 b=V2fYwWYuUJSkr1NVgAtjanMk2Ql2C8Lll0uT9EAxZnmuRNNTq4aGD2CMrNzyI2yuO4
 qinQSAANtKeRV0YATakZCAZ0YaqGnqX8lGH62UH/2Rn0H0wxKYe+zWKXEHCWJgODuk45
 oLXRC6zbUx/UuF8Mtq96Dg40WJYY48pKPqX4vwRxqPkLJqJBgaZexjdzsT946HBSGQz3
 dB5Wxr7Lee1dVq2k83183klDFwGUDCcuv438jkgu7FC5pKeiBrETdKpjk4QGKKBqIjCi
 aO24qhKuWt7byBffAtIC7fsrrw+MwFrydEYhf+nZw3fb58Xth/sHHQ+yR/Bb/Q42nfjo
 R6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693487986; x=1694092786;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lG8KFBDF0e0Rk16UcvLLdRikexZwA9mu8s0dUdhz7u0=;
 b=Tsy/J77hs9FpuHbVNSLfuKqjBoenyV4m3bXvmyXt3WFZexE8OSLdmK0zkX1vGTlH1c
 wCWew7h/QjtsbhjfszELLVbXd3ZARFKn5ygQ1zWWPMnx8oJsMyTXgBfvvQfdAMOt7TUS
 Clg9fX2Vo2tCZfiqlWyO1qqChVHgrK5ozhLQQuWi3CN/jkt02FGyYNmWZPMiRJy8AuvK
 3VURScnPxGqrN1zY0yIKfFP0JJDgaEgoM659p0t69Y65sBgWf9Jetvn9KRF5VOpB8xok
 9pve5piws4T7yhEMWrZ/ZbE9bGYQE+8GNA/H8BI05/yGwzl4f40ACF1eCMAER78MoLHs
 DjfQ==
X-Gm-Message-State: AOJu0YzR+aklntfY/WFkpjHPu+HjPqL9jyH8dPk4R/bEnwUSE5WKSgCc
 Uu+jCJ7f4uusv05hW+T1+eKffQ==
X-Google-Smtp-Source: AGHT+IFRvufRONR9bpk+WzB5HiciN/EoCchZLiPVt6UmpNDUD4lhacThNCNqvxrvwBcSMhkI2Nqw8g==
X-Received: by 2002:a17:907:78c4:b0:9a2:256a:65ca with SMTP id
 kv4-20020a17090778c400b009a2256a65camr4372976ejc.14.1693487985586; 
 Thu, 31 Aug 2023 06:19:45 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 fx4-20020a170906b74400b009887f4e0291sm753665ejb.27.2023.08.31.06.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 06:19:45 -0700 (PDT)
Date: Thu, 31 Aug 2023 15:19:44 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH RESEND v8 12/20] target/riscv: deprecate the 'any' CPU type
Message-ID: <20230831-0bdd700ffe84ea667111a712@orel>
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
 <20230824221440.484675-13-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824221440.484675-13-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x644.google.com
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

On Thu, Aug 24, 2023 at 07:14:32PM -0300, Daniel Henrique Barboza wrote:
> The 'any' CPU type was introduced in commit dc5bd18fa5725 ("RISC-V CPU
> Core Definition"), being around since the beginning. It's not an easy
> CPU to use: it's undocumented and its name doesn't tell users much about
> what the CPU is supposed to bring. 'git log' doesn't help us either in
> knowing what was the original design of this CPU type.
> 
> The closest we have is a comment from Alistair [1] where he recalls from
> memory that the 'any' CPU is supposed to behave like the newly added
> 'max' CPU. He also suggested that the 'any' CPU should be removed.
> 
> The default CPUs are rv32 and rv64, so removing the 'any' CPU will have
> impact only on users that might have a script that uses '-cpu any'.
> And those users are better off using the default CPUs or the new 'max'
> CPU.
> 
> We would love to just remove the code and be done with it, but one does
> not simply remove a feature in QEMU. We'll put the CPU in quarantine
> first, letting users know that we have the intent of removing it in the
> future.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-07/msg02891.html
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  docs/about/deprecated.rst | 12 ++++++++++++
>  target/riscv/cpu.c        |  5 +++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 92a2bafd2b..4ced7427ac 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -371,6 +371,18 @@ QEMU's ``vhost`` feature, which would eliminate the high latency costs under
>  which the 9p ``proxy`` backend currently suffers. However as of to date nobody
>  has indicated plans for such kind of reimplementation unfortunately.
>  
> +RISC-V 'any' CPU type ``-cpu any`` (since 8.2)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The 'any' CPU type was introduced back in 2018 and has been around since the
> +initial RISC-V QEMU port. Its usage has always been unclear: users don't know
> +what to expect from a CPU called 'any', and in fact the CPU does not do anything
> +special that aren't already done by the default CPUs rv32/rv64.
                ^ isn't

> +
> +After the introduction of the 'max' CPU type RISC-V now has a good coverage
                                               ^ ,

> +of generic CPUs: rv32 and rv64 as default CPUs and 'max' as a feature complete
> +CPU for both 32 and 64 bit builds. Users are then discouraged to use the 'any'
> +CPU type starting in 8.2.
>  
>  Block device options
>  ''''''''''''''''''''
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8dc85f75bb..913b64264f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1522,6 +1522,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
>      Error *local_err = NULL;
>  
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_RISCV_CPU_ANY) != NULL) {
> +        warn_report("The 'any' CPU is deprecated and will be "
> +                    "removed in the future.");
> +    }
> +
>      cpu_exec_realizefn(cs, &local_err);
>      if (local_err != NULL) {
>          error_propagate(errp, local_err);
> -- 
> 2.41.0
> 
>

Besides the text edits,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

