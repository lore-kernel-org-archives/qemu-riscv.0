Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF23C19776
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 13:33:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1to0Ui-0007TD-HJ; Fri, 28 Feb 2025 08:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1to0UY-0007PV-R2
 for qemu-riscv@nongnu.org; Fri, 28 Feb 2025 08:33:31 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1to0US-0003Hm-KY
 for qemu-riscv@nongnu.org; Fri, 28 Feb 2025 08:33:22 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-439846bc7eeso13535615e9.3
 for <qemu-riscv@nongnu.org>; Fri, 28 Feb 2025 05:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740749596; x=1741354396; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aDunVQWwNW7VC09jfEEoUzT5xw1HesdU3D9g2CzzH/I=;
 b=nsXushVIu22HI9O099GrOpLgF7ABs7uI1lLMtEPznsRnp4T4dW2+InBh01yLfiAS0j
 Qn/26Ol0It49gfJ3Sbv8DW1ZqzKay4NoIVyJIxIRHe7/bzzNzafR38DB0m8P+bkwKdz+
 HlN2qsFc3szGVMGloqNLgN+AsbgDWfA6SCmVXQPSJQbkoXBWDDvMdd46jeb7BFbgXZ5j
 fO5Bi1+c8TXwo4UDVC5lx/p5ZsawN5+OrHak8EaaRwL2gqv0SqwhB69/Ce+Pb+6zNPGp
 6CKbtnwKEkom0+4FiMB1HGvi6F9ytE+t6xezzzmyDyCFooMc/GKOEn0SV4OmbrLRMO7g
 e7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740749596; x=1741354396;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aDunVQWwNW7VC09jfEEoUzT5xw1HesdU3D9g2CzzH/I=;
 b=EftJBDDMsF19zWTL5Ub0xLtHS1ntHZBuKUMzQPAvXBkQZ54SAXre9az8hkUb66Sl/e
 liZIGSlbSYQq1LSlXbfyW4doTlgro14m8A5Z50KppGWdjAMpeMck76Hwfvn+36SjFTgm
 6KEQrSUFxnD/Sq/fIrc3SCLLnxfy9YfoBWZs6aMkErFQ/ZQg8mXOyPsfMdcABxd/bMYz
 XWsIXFlxAVsR98y8f2/G8ERv91+os9+3yGSq1n9Uy+x/h4aGSdNxXHeR1Wu18H/nqglI
 D3+mQPFn9sFhNtpuSHQbW5g1ZQwqmIq5I9PV6WWIKBszyjIkwpemc6v2+4z3GwNtEazh
 b6Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLOMiu/rlPEWhmHmsSDNxrh455j4PPkVybTiDtzoQ3mgGrJT9lLRM2KJsOxFzttucccnhuqjz9bw2+@nongnu.org
X-Gm-Message-State: AOJu0YxNYq6faoLhZsFMkZ/uHoh8GYX9eSVHxTXV/oaa7LwGqRNqs8Xc
 Lsa1KvUPxNSFx11eiBIZDyFZeLjzXgf4KWFKRs/jpwrOj+3+PEqN+VKG9j10rJ4=
X-Gm-Gg: ASbGncuCK56qccZVoDZTR7zOeg7RG5GAPMs0oprj6bDB4U77WpF8elaIddHUWMtjEwV
 jfV+OmqeC+uYn1DWcV93JZS7YPSynRgw9BgBw4B7KMrEfqBG43KQbDRsKkROaFjWri1Uh5nupzu
 sip4fQVhQDSPoZZLiTESQAt5ZxrM1ai7e32fcwNubRy69LphbiZziwq0Q5mU8W1AE0om3Gkoh/K
 Z3ET+ZEhGs33OFXfLETD6t6acM4pKkUQkvKYmiahTRCwDdGOB9w2qJ1U34ycL4BRk+BPCkBH8fd
 EZ4OXEIre15AvQ==
X-Google-Smtp-Source: AGHT+IFAlnC/dUIv5d+Yarpg28X7ZIDP5qSwenuRlxBS8JqU6gH2bOKJtymuKmuLg2EI6UZRI9Q7yw==
X-Received: by 2002:a05:600c:1548:b0:439:685e:d4c8 with SMTP id
 5b1f17b1804b1-43ba66fec18mr30150455e9.15.1740749596123; 
 Fri, 28 Feb 2025 05:33:16 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5711fcsm92605425e9.28.2025.02.28.05.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 05:33:15 -0800 (PST)
Date: Fri, 28 Feb 2025 14:33:14 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, greentime.hu@sifive.com, 
 vincent.chen@sifive.com, frank.chang@sifive.com, jim.shu@sifive.com, 
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: Re: [PATCH v2 7/8] docs: update the description about RISC-V AIA
Message-ID: <20250228-2444e574d55bf88c1427e28b@orel>
References: <20250224082417.31382-1-yongxuan.wang@sifive.com>
 <20250224082417.31382-8-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224082417.31382-8-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32b.google.com
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

On Mon, Feb 24, 2025 at 04:24:14PM +0800, Yong-Xuan Wang wrote:
> Add the description about "-accel kvm,kernel-irqchip=off" into
> docs/specs/riscv-aia.rst and docs/system/riscv/virt.rst.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  docs/specs/riscv-aia.rst   | 24 ++++++++++++++++++------
>  docs/system/riscv/virt.rst | 10 ++++++----
>  2 files changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/docs/specs/riscv-aia.rst b/docs/specs/riscv-aia.rst
> index 8097e2f89744..38797cca4998 100644
> --- a/docs/specs/riscv-aia.rst
> +++ b/docs/specs/riscv-aia.rst
> @@ -25,11 +25,16 @@ When running KVM:
>  - no m-mode is provided, so there is no m-mode APLIC or IMSIC emulation regardless of
>    the AIA mode chosen
>  - with "aia=aplic", s-mode APLIC will be emulated by userspace
> -- with "aia=aplic-imsic" there are two possibilities.  If no additional KVM option
> -  is provided there will be no APLIC or IMSIC emulation in userspace, and the virtual
> -  machine will use the provided in-kernel APLIC and IMSIC controllers.  If the user
> -  chooses to use the irqchip in split mode via "-accel kvm,kernel-irqchip=split",
> -  s-mode APLIC will be emulated while using the s-mode IMSIC from the irqchip
> +- with "aia=aplic-imsic" there are three possibilities.
> +    - If no additional KVM option is provided there will be no APLIC or IMSIC emulation
> +      in userspace, and the virtual machine will use the provided in-kernel APLIC and
> +      IMSIC controllers.
> +    - If the user chooses to use the irqchip in split mode via
> +      "-accel kvm,kernel-irqchip=split", s-mode APLIC will be emulated while using
> +      the s-mode IMSIC from the irqchip.
> +    - If the user disables the in-kernel irqchip via "-accel kvm,kernel-irqchip=off",
> +      both s-mode APLIC and IMSIC controller will be emulated.
> +
>  
>  The following table summarizes how the AIA and accelerator options defines what
>  we will emulate in userspace:
> @@ -75,9 +80,16 @@ we will emulate in userspace:
>       - in-kernel
>       - in-kernel
>     * - kvm
> -     - irqchip=split
> +     - kernel-irqchip=split
>       - aplic-imsic
>       - n/a
>       - n/a
>       - emul
>       - in-kernel
> +   * - kvm
> +     - kernel-irqchip=off
> +     - aplic-imsic
> +     - n/a
> +     - n/a
> +     - emul
> +     - emul
> diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
> index 60850970ce83..96d7ee1ebc64 100644
> --- a/docs/system/riscv/virt.rst
> +++ b/docs/system/riscv/virt.rst
> @@ -129,12 +129,14 @@ The following machine-specific options are supported:
>    MSIs. When not specified, this option is assumed to be "none" which selects
>    SiFive PLIC to handle wired interrupts.
>  
> -  This option also interacts with '-accel kvm'.  When using "aia=aplic-imsic"
> -  with KVM, it is possible to set the use of the kernel irqchip in split mode
> +  This option also interacts with '-accel kvm', when using "aia=aplic-imsic"
> +  with KVM.  It is possible to set the use of the kernel irqchip in split mode
>    by using "-accel kvm,kernel-irqchip=split".  In this case the ``virt`` machine
>    will emulate the APLIC controller instead of using the APLIC controller from
> -  the irqchip.  See :ref:`riscv-aia` for more details on all available AIA
> -  modes.
> +  the in-kernel irqchip. Or the kernel irqchip can be disabled by using
> +  "-accel kvm,kernel-irqchip=off". In this case the ``virt`` machine will
> +  emulate the APLIC and IMSIC controller in user-space instead of using in-kernel
> +  irqchip.  See :ref:`riscv-aia` for more details on all available AIA modes.
>  
>  - aia-guests=nnn
>  
> -- 
> 2.17.1
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

