Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A530DEB64DD
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 01:27:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIffq-0007OF-BZ; Sun, 09 Jul 2023 21:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIffo-0007NY-F8; Sun, 09 Jul 2023 21:26:44 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIffm-00083x-To; Sun, 09 Jul 2023 21:26:44 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-4716e4adb14so1100950e0c.0; 
 Sun, 09 Jul 2023 18:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688952401; x=1691544401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J8NPUmwWJI2oAEO/WNKQ44AUDL20XbAFLF7KLU3/fwU=;
 b=DFpYZ4zQlenwumFFALIcuIFeaLA6XEbgO1qHdAS2OhOZBvXw4JwB+sGOaVgM/HJJX/
 Q31crdw17qeqeENWH9xQ9W6I4C5rWzgXHWMQLxpdhWpAo+SnGoVMMByRqLgVnFJRW+DH
 CXLjQzaUkILb9rpM6zctdQ2fHc4dqoLwYre0X4wUiNYGfT8u1mmYhj0af9iiWx44yX2g
 eoyw3orWXZXCO2SgPXYQ8lPXpD2Td9ln+m11TA92eqpL7z/t7ipsXCXwcbZFwkpIYJAL
 e6N/z941akEu+1uDM3cw1eBFyDY74tn4Rd4WmIbx3LKb6PtTD2UlTziE/9jwmXWZXv2E
 Ow0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688952401; x=1691544401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J8NPUmwWJI2oAEO/WNKQ44AUDL20XbAFLF7KLU3/fwU=;
 b=TaYA2iV3rDEuvKLJ/0tAGdCTzQVk9Tk5OJt3WjgbekXJLu5s2ETyYe8tCwpRy/xLND
 p1Y/ysb+lI6HdXhLdFUq1MHhZ9ArNBou//Qwrr3oXs5cpCqlDXnEhnjitq/MGdeRKKc4
 dc+yTKRbFED8jr+yH7SzrduxMLXJWgoBx6C1G4YzhtTvNs88OqxRslyNjTEdmPYKKiTk
 8TPFkkdNsnzAgPUEuDUvxDPKxhoGE535viyUa87PIFkStIWtDd9wW8uw+LxvJckdP0Lu
 ha/NE/r4iQOYS9Y4qd2iI8/4EkFvZCA8ZxLhEJ8vxrOEAccvs3+TAkDpaldE5hSVwksL
 4Riw==
X-Gm-Message-State: ABy/qLaehQVYb8In+b+M2SoyaBdu7jIADH7sovV0SDWieFgec7zCflJl
 tOBQCCh5n4JfJldLAFM3Tvo0npq+xdhbCq31eAE=
X-Google-Smtp-Source: APBJJlHOSFJvRlus/eQlNjERf8VsCFZcd8du8dQurwWQrm5V7Juo/1FneXR1rfZ127RcsWOp4Wki6voIIAkN0T1CupQ=
X-Received: by 2002:a1f:c14b:0:b0:471:a053:57f0 with SMTP id
 r72-20020a1fc14b000000b00471a05357f0mr4783006vkf.2.1688952401056; Sun, 09 Jul
 2023 18:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
 <20230706101738.460804-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230706101738.460804-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jul 2023 11:26:14 +1000
Message-ID: <CAKmqyKOODcBe=qGWCtNN3u6RxJXKOBsUSRsJMQct8=pn7JJbHg@mail.gmail.com>
Subject: Re: [PATCH v9 01/20] target/riscv: skip features setup for KVM CPUs
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Thu, Jul 6, 2023 at 8:18=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> As it is today it's not possible to use '-cpu host' if the RISC-V host
> has RVH enabled. This is the resulting error:
>
> $ ./qemu/build/qemu-system-riscv64 \
>     -machine virt,accel=3Dkvm -m 2G -smp 1 \
>     -nographic -snapshot -kernel ./guest_imgs/Image  \
>     -initrd ./guest_imgs/rootfs_kvm_riscv64.img \
>     -append "earlycon=3Dsbi root=3D/dev/ram rw" \
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
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 35 +++++++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index fd647534cf..6232e6513b 100644
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
> @@ -1386,20 +1387,12 @@ static void riscv_cpu_validate_misa_priv(CPURISCV=
State *env, Error **errp)
>      }
>  }
>
> -static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> +static void riscv_cpu_realize_tcg(DeviceState *dev, Error **errp)
>  {
> -    CPUState *cs =3D CPU(dev);
>      RISCVCPU *cpu =3D RISCV_CPU(dev);
>      CPURISCVState *env =3D &cpu->env;
> -    RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(dev);
>      Error *local_err =3D NULL;
>
> -    cpu_exec_realizefn(cs, &local_err);
> -    if (local_err !=3D NULL) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -
>      riscv_cpu_validate_misa_mxl(cpu, &local_err);
>      if (local_err !=3D NULL) {
>          error_propagate(errp, local_err);
> @@ -1434,7 +1427,7 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
>      }
>
>  #ifndef CONFIG_USER_ONLY
> -    cs->tcg_cflags |=3D CF_PCREL;
> +    CPU(dev)->tcg_cflags |=3D CF_PCREL;
>
>      if (cpu->cfg.ext_sstc) {
>          riscv_timer_init(cpu);
> @@ -1447,6 +1440,28 @@ static void riscv_cpu_realize(DeviceState *dev, Er=
ror **errp)
>          }
>       }
>  #endif
> +}
> +
> +static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> +{
> +    CPUState *cs =3D CPU(dev);
> +    RISCVCPU *cpu =3D RISCV_CPU(dev);
> +    RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(dev);
> +    Error *local_err =3D NULL;
> +
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +    if (tcg_enabled()) {
> +        riscv_cpu_realize_tcg(dev, &local_err);
> +        if (local_err !=3D NULL) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +    }
>
>      riscv_cpu_finalize_features(cpu, &local_err);
>      if (local_err !=3D NULL) {
> --
> 2.41.0
>
>

