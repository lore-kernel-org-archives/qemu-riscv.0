Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D58C4345F
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 13:43:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rytxA-0005qx-Dp; Mon, 22 Apr 2024 09:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rytx8-0005oo-Eb
 for qemu-riscv@nongnu.org; Mon, 22 Apr 2024 09:43:26 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rytx6-0007qj-KA
 for qemu-riscv@nongnu.org; Mon, 22 Apr 2024 09:43:26 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5720d52eb10so888762a12.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Apr 2024 06:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1713793403; x=1714398203; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nGQkPv4m2z9EI2iKsw1AFJwH5qqanLv5zdewOw8PZtM=;
 b=LWrjwlnHgbw5dvUiw14Onszct5HrQQF0mxqoACO5g+64jmD2EHRUPIppy1wARQgOrF
 3l7tePES+PPd186jnoS5jema+TOy2zWflArPNUB1BXvfZpWU0J8c58J6/UHPtGvmrd0e
 wuqa5txe0VOKUf+/PwmxEGSnRCsmj0Sr8MpLtLn3MZh5U7ZHDQeftKUuE0X9zb0gLMjB
 NFcjBLgNGibihOssaBfJy/IvdfD6eaQ7Gj3WeyynsFccZmqVR/tPuO+x8Dt3Uxy0PWyF
 yVNqpuF6FJqvndJAONQXZz8RhRmIazvva4lrHjBL6GNVaqngHUDa5ITNCUguK1lOw8Xt
 EjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713793403; x=1714398203;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nGQkPv4m2z9EI2iKsw1AFJwH5qqanLv5zdewOw8PZtM=;
 b=mvN/fnQKWsA46n1jo0tSi/uXdGMLanv6MqwJ2oXVshAdyHRhFRXKTIFhORWahkYxPr
 vzeoI73ajiNjVqW3XnmalJ++PzSeZwgLUq3Xa1aZzrVgHojScnmMnUlk5u0ffRTHkXTK
 7uWWlOFAcXfIXdJp221icmZshLt9dZzK4vxP1q2FbZ4CTf28Q6TlyxAxvoi727HAkcYD
 PyYBAMqQ0DhBODMibTnaRjvkcIMWKP7FPybVceWEFwBM+K+CdB6dK6tJyJEf7oB5T+Tw
 sguVpHc5QGywuGdV/BVznStOD9WKTY04lgIfYlElvhUtnxhvBKVOxqu13bY9KCK4+1H5
 Eh0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4CS2ichh7lAk5OImfcKsxTqN9JHbZHLSOiC/7fLUt3PvgjPCdms+QQIZ/NM8gRn42AkJWPjIUDp+bJ1hyQ6Ibmx02AdA=
X-Gm-Message-State: AOJu0YyS9DZ8FcyY4BPY6NhpsZ0Z7BsqcAQE+wKAUKRRKmSdYDF9WmFa
 oSmNxPC7DsP70eEteI8hN2slo5l5lNjwbD3AUzDiidVteown7GaFu4g9dgl+3Uw=
X-Google-Smtp-Source: AGHT+IGuf/znZGI1pI1xeELZuFJP7IbDgwIFIfbuA1QTUS42xous2k2DUnZVFE6K3pi2+Nw0L3x4XQ==
X-Received: by 2002:a17:906:c1c5:b0:a51:d522:13dd with SMTP id
 bw5-20020a170906c1c500b00a51d52213ddmr7476809ejb.47.1713793403140; 
 Mon, 22 Apr 2024 06:43:23 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a170906c08f00b00a553574ae71sm5743547ejz.7.2024.04.22.06.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 06:43:22 -0700 (PDT)
Date: Mon, 22 Apr 2024 15:43:21 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH] target/riscv/kvm: tolerate KVM disable ext errors
Message-ID: <20240422-8145ee4f1a24e27ac9dcb1b3@orel>
References: <20240422131253.313869-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422131253.313869-1-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Apr 22, 2024 at 10:12:53AM -0300, Daniel Henrique Barboza wrote:
> Running a KVM guest using a 6.9-rc3 kernel, in a 6.8 host that has zkr
> enabled, will fail with a kernel oops SIGILL right at the start. The
> reason is that we can't expose zkr without implementing the SEED CSR.
> Disabling zkr in the guest would be a workaround, but if the KVM doesn't
> allow it we'll error out and never boot.
> 
> In hindsight this is too strict. If we keep proceeding, despite not
> disabling the extension in the KVM vcpu, we'll not add extension in
                                                        ^ the
> riscv,isa. The guest kernel will be unaware of the extension, i.e. it
 ^ the

> doesn't matter if the KVM vcpu has it enabled underneath or not. So it's
> ok to keep booting in this case.
> 
> Change our current logic to not error out if we fail to disable an
> extension in kvm_set_one_reg(): throw an warning instead and keep
> booting.  We'll keep the existing behavior when we fail to enable an
> extension in KVM, since adding the extension in riscv,isa at this point
> will cause a guest malfunction because the extension isn't enabled in
> the vcpu.

I'd probably add a sentence or two explaining why we still want to warn,
which is because KVM is stating that while you may think you're disabling
an extension, that extension's behavior (instructions, etc.) will still
be exposed to the guest since there's no way not to expose it.  The user
should be aware that a guest could use it anyway, since that means the
attempt to disable it can't be relied upon for migration compatibility of
arbitrary guests. The guest needs to be well behaved, i.e. one that won't
try to use any extensions which aren't in the ISA string. So, disabling
these types of extensions either shouldn't generally be done (so a noisy
warning helps prohibit that) or done for debug purposes (where a noisy
warning is fine).

> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm/kvm-cpu.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 6a6c6cae80..261ca24504 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -427,10 +427,14 @@ static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs)
>          reg = kvm_cpu_cfg_get(cpu, multi_ext_cfg);
>          ret = kvm_set_one_reg(cs, id, &reg);
>          if (ret != 0) {
> -            error_report("Unable to %s extension %s in KVM, error %d",
> -                         reg ? "enable" : "disable",
> -                         multi_ext_cfg->name, ret);
> -            exit(EXIT_FAILURE);
> +            if (reg) {
> +                error_report("Unable to enable extension %s in KVM, error %d",
> +                             multi_ext_cfg->name, ret);
> +                exit(EXIT_FAILURE);
> +            } else {

Maybe we should check for a specific error. Is it EINVAL? If we do, then
the message below would drop the (error %d) part and instead state
explicitly that it cannot disable this extension since it's not possible.

> +                warn_report("KVM did not disable extension %s (error %d)",

s/did not/cannot/

> +                            multi_ext_cfg->name, ret);
> +            }
>          }
>      }
>  }
> -- 
> 2.44.0
>

Thanks,
drew

