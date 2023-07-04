Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E13EB64DA
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 14:47:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGhIT-0001nM-Rl; Tue, 04 Jul 2023 10:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qGhIR-0001mu-Lr
 for qemu-riscv@nongnu.org; Tue, 04 Jul 2023 10:46:27 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qGhIM-00024M-R1
 for qemu-riscv@nongnu.org; Tue, 04 Jul 2023 10:46:27 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9891c73e0fbso1029223066b.1
 for <qemu-riscv@nongnu.org>; Tue, 04 Jul 2023 07:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688481980; x=1691073980;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V1Ae3RuOxJhgI3BLugmtWq6zSsW+2ghmr3c9wVK5GFg=;
 b=pRSqaZGrtTWOvZr/isOwp6GM3vtrB6NZyPfVOZdLhRLvqlonBE1oN+OIsG7xN650tx
 msc5MaXPYAJlq+1A56sfyAxW4l7pUOmgJXmtr8OgoS0kWq8aokOG8y3K8dPh6IvZu9r0
 RRZSl5GPtoaZEaCrhkId8OaVBvphmdz4o/p6Bd+vqNCG/4Xab9kKKfv5ZA5wpJJL3TL9
 XwBelheP8ZhL6odLZBAh6eOziNGoK4VYjPhQmGUM4wevDAeoq1KzG6H8nPmPUolQITZu
 E/FNEdy2N9/A8u8S7ZpK2FfCQBYXD8KbWzTpHuxI02iubIbXNLQUj5uqDH1FBbltTF7x
 u7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688481980; x=1691073980;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V1Ae3RuOxJhgI3BLugmtWq6zSsW+2ghmr3c9wVK5GFg=;
 b=iSyAlfbaa3H4HJJsP7MHLxRFHPl9b1HHnmIrMQVNW+8uUcXPqq4ij30pIIqeeaJmH2
 noiJa24+YUoJZVPFIkNEr7KGWrCTAfqRHabv9Tlr14VoqMMfKzXFpmr7t4ldhQR9g7TF
 AH0ipjdyJoIFBGAG/wHv3hFIzsbAKYEYWPMMMx+vFLCXoEHOcW9llfPLWFcVR4jEkbzy
 CoDB0dRrdt+qh0x5vC83QK2WqSjlpWT8EaF2ceEWaAp4r0sGIKNX9UIlpIkQYgw1vXC7
 WxfK5RKUbdTevkYi0svFSXFcOk25sf+xqmK7DZ9Yo/Bcpp2Cdp6tQApXOXDJ4vmz3DXi
 h+gQ==
X-Gm-Message-State: AC+VfDzKyXPlLjrEgUY5ApYQYhQTOGfyNHUqdPRFGnMHMaJBBOujm/b4
 wIQ7F2hz6NHNQH5U8NvctyyrAg==
X-Google-Smtp-Source: APBJJlHjRSFZSI7aVge0lLdM56gpzgi/7b+9c350rXY0yAmVOGJ/CQlVtcVO4S9Z4q5yAY7mfB4oww==
X-Received: by 2002:a17:907:3fa3:b0:988:d841:7f90 with SMTP id
 hr35-20020a1709073fa300b00988d8417f90mr15606804ejc.27.1688481980507; 
 Tue, 04 Jul 2023 07:46:20 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a1709064a4c00b009932337747esm4805726ejv.86.2023.07.04.07.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 07:46:19 -0700 (PDT)
Date: Tue, 4 Jul 2023 16:46:18 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rkanwal@rivosinc.com, 
 anup@brainfault.org, dbarboza@ventanamicro.com, atishp@atishpatra.org, 
 vincent.chen@sifive.com, greentime.hu@sifive.com, frank.chang@sifive.com, 
 jim.shu@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Subject: Re: [PATCH v4 3/6] target/riscv: check the in-kernel irqchip support
Message-ID: <20230704-27481846a2cab7364d040a19@orel>
References: <20230621145500.25624-1-yongxuan.wang@sifive.com>
 <20230621145500.25624-4-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621145500.25624-4-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x631.google.com
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

On Wed, Jun 21, 2023 at 02:54:53PM +0000, Yong-Xuan Wang wrote:
> We check the in-kernel irqchip support when using KVM acceleration.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 0f932a5b96..eb469e8ca5 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -433,7 +433,18 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>  
>  int kvm_arch_irqchip_create(KVMState *s)
>  {
> -    return 0;
> +    if (kvm_kernel_irqchip_split()) {
> +        error_report("-machine kernel_irqchip=split is not supported "
> +                     "on RISC-V.");

It's best to not split error messages across lines. We can go to 90 chars
before checkpatch considers it an error, and I'd still consider it worse
to split an error message than to ignore checkpatch and exceed 90 chars.

> +        exit(1);
> +    }
> +
> +    /*
> +     * If we can create the VAIA using the newer device control API, we
> +     * let the device do this when it initializes itself, otherwise we
> +     * fall back to the old API

This comment appears lifted from arm, but the "fall back to the old API"
doesn't apply to riscv since riscv doesn't support KVM_CREATE_IRQCHIP.

> +     */
> +    return kvm_check_extension(s, KVM_CAP_DEVICE_CTRL);
>  }
>  
>  int kvm_arch_process_async_events(CPUState *cs)
> -- 
> 2.17.1
> 
>

Thanks,
drew

