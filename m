Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3F3EB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 08:24:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEmwk-0008V7-Ox; Thu, 29 Jun 2023 04:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qEmwi-0008US-I6
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 04:24:08 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qEmwg-0003Ud-ND
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 04:24:08 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b6a16254a4so5685211fa.0
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 01:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688027044; x=1690619044;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7X6tLUM/tGbcnRW+EigreUhcB69tEqKSxspkIcV3Mr8=;
 b=Yu1WgjDURZDjMBdlvVTwJcw5UNZbXjB9cbeJsC1I77+w4wNmTIDkMwZlcp6KS2WZLW
 R8BTfkLWbrq8sTPqIYCyssxL51Pk1YgT/R0nyA6xhnynhiE57NzFzJv9ZZ0UaKIpto92
 SzSdLB8fdnPTjhT6zWNYkNO7858zkC7nyF2v3PSjjnTwsDDijQU/X1H3SMHCftmKsKR+
 OAIZf/3jx7cPUaJAeBFK/f6U5E9hTaFs4Hn/YnTqbSIK7B1N+/rcK1ABq9E1Ueyk9tGM
 hEjcJp777N3/VC9nszciITJ6B0tuUI5kR3KNZ75uxIAnHvsY4HGtquXOG33acKPLIUjx
 gS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688027044; x=1690619044;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7X6tLUM/tGbcnRW+EigreUhcB69tEqKSxspkIcV3Mr8=;
 b=BBdzVCwlk6sTaj7GMAHbrsZes0+iHHfkHppHlV5X76tcDqx1K7dARCh1eXc8KF8bX4
 JCB9jlUY7V2vBOktnX5Bi9b+C3Yy6eMrXDl6teDIyZtYtDXa8uxNBhiakF1ugIiCDPY5
 oozSwyOsKpekQW3SFvyY9G1UZoY3CoN8wWNmeN9KyH3zXrplKaYDlzR9CLUwxo82a5ir
 ZN4fErjQF74s3pXCvJcePkeeKJrKihT7fBJVs/7p+zT2xWO4d9dbPyghzdOUwIYwfy5O
 woEQKmSuhjgMwD4b+A2Yq3LQsbO8vHprAkKpouxQ9lWf6JP7R1ebdTcGT76pruN+b4F9
 IxfQ==
X-Gm-Message-State: AC+VfDxqUGN7dun8mOXx4iX95t+mrzWN2pXaMw8RovHThPqEzkY+wtgM
 9XLNIY1ku4ZMWD5CwXgw81qaCg==
X-Google-Smtp-Source: ACHHUZ5OhhWBRbQjLV5wipFegvQRnsE6aBs7p0czGQ7DsyWJTZmikbhi4boX09b10u7NVtHjjJwP1Q==
X-Received: by 2002:a2e:878d:0:b0:2b6:b8bd:6606 with SMTP id
 n13-20020a2e878d000000b002b6b8bd6606mr4402606lji.22.1688027043369; 
 Thu, 29 Jun 2023 01:24:03 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a7bc4ce000000b003fbaf9abf2fsm4226019wmk.23.2023.06.29.01.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 01:24:02 -0700 (PDT)
Date: Thu, 29 Jun 2023 10:24:01 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org
Subject: Re: [PATCH v6 01/20] target/riscv: skip features setup for KVM CPUs
Message-ID: <20230629-7c5ce376cf635706ec88e266@orel>
References: <20230628213033.170315-1-dbarboza@ventanamicro.com>
 <20230628213033.170315-2-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628213033.170315-2-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=ajones@ventanamicro.com; helo=mail-lj1-x235.google.com
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

On Wed, Jun 28, 2023 at 06:30:14PM -0300, Daniel Henrique Barboza wrote:
> As it is today it's not possible to use '-cpu host' if the RISC-V host
> has RVH enabled. This is the resulting error:
> 
> $ sudo ./qemu/build/qemu-system-riscv64 \
>     -machine virt,accel=kvm -m 2G -smp 1 \
>     -nographic -snapshot -kernel ./guest_imgs/Image  \
>     -initrd ./guest_imgs/rootfs_kvm_riscv64.img \
>     -append "earlycon=sbi root=/dev/ram rw" \
>     -cpu host
> qemu-system-riscv64: H extension requires priv spec 1.12.0
> 
> This happens because we're checking for priv spec for all CPUs, and
> since we're not setting  env->priv_ver for the 'host' CPU, it's being
> default to zero (i.e. PRIV_SPEC_1_10_0).
> 
> In reality env->priv_ver does not make sense when running with the KVM
> 'host' CPU. It's used to gate certain CSRs/extensions during translation
> to make them unavailable if the hart declares an older spec version. It
> doesn't have any other use. E.g. OpenSBI version 1.2 retrieves the spec
> checking if the CSR_MCOUNTEREN, CSR_MCOUNTINHIBIT and CSR_MENVCFG CSRs
> are available [1].
> 
> 'priv_ver' is just one example. We're doing a lot of feature validation
> and setup during riscv_cpu_realize() that it doesn't apply to KVM CPUs.
> Validating the feature set for those CPUs is a KVM problem that should
> be handled in KVM specific code.
> 
> The new riscv_cpu_realize_tcg() helper contains all validation logic that
> are applicable to TCG CPUs only. riscv_cpu_realize() verifies if we're
> running TCG and, if it's the case, proceed with the usual TCG realize()
> logic.
> 
> [1] lib/sbi/sbi_hart.c, hart_detect_features()
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 35 +++++++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index fb8458bf74..bbb201a2b3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -34,6 +34,7 @@
>  #include "migration/vmstate.h"
>  #include "fpu/softfloat-helpers.h"
>  #include "sysemu/kvm.h"
> +#include "sysemu/tcg.h"
>  #include "kvm_riscv.h"
>  #include "tcg/tcg.h"
>  
> @@ -1308,20 +1309,12 @@ static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
>      }
>  }
>  
> -static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> +static void riscv_cpu_realize_tcg(DeviceState *dev, Error **errp)
>  {
> -    CPUState *cs = CPU(dev);
>      RISCVCPU *cpu = RISCV_CPU(dev);
>      CPURISCVState *env = &cpu->env;
> -    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
>      Error *local_err = NULL;
>  
> -    cpu_exec_realizefn(cs, &local_err);
> -    if (local_err != NULL) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -
>      riscv_cpu_validate_misa_mxl(cpu, &local_err);
>      if (local_err != NULL) {
>          error_propagate(errp, local_err);
> @@ -1356,7 +1349,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      }
>  
>  #ifndef CONFIG_USER_ONLY
> -    cs->tcg_cflags |= CF_PCREL;
> +    CPU(dev)->tcg_cflags |= CF_PCREL;
>  
>      if (cpu->cfg.ext_sstc) {
>          riscv_timer_init(cpu);
> @@ -1369,6 +1362,28 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          }
>       }
>  #endif
> +}
> +
> +static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> +{
> +    CPUState *cs = CPU(dev);
> +    RISCVCPU *cpu = RISCV_CPU(dev);
> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
> +    Error *local_err = NULL;
> +
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +    if (tcg_enabled()) {
> +        riscv_cpu_realize_tcg(dev, &local_err);
> +        if (local_err != NULL) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +    }
>  
>      riscv_cpu_finalize_features(cpu, &local_err);
>      if (local_err != NULL) {
> -- 
> 2.41.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

