Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B81BC7EE24
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 04:18:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4wEm-000769-VL; Fri, 02 Jun 2023 00:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4wEl-00075Q-By; Fri, 02 Jun 2023 00:18:03 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4wEj-0005fn-5v; Fri, 02 Jun 2023 00:18:02 -0400
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-783f88ce557so602788241.3; 
 Thu, 01 Jun 2023 21:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685679479; x=1688271479;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sfnS3Ss2unv4dgYVAG7D50gKcm9DhNLu2TnjcCoEDto=;
 b=ciNBFsES5aUnkLVJWmrgV3O6NiL72a27qXV7Ulz6aN1sBex06fG/RtXxcdQz1X8ZFR
 mpgVHBO5gmt3D2MYKfXUJPMSHONpf8Q9/1OZl9D8Rf5XWmg0ikiUU9tVDZZKKooNflli
 EAWwSFLWQDGxCV+rSmX6qNuK2of0qoKn0bJktMdvhwLwAv2gXcsC+65CTEKTmxpd0n7o
 IBzAI7QeIAg7m6q9jmRuSC8jwQs1qOG1i4252OFNv+XMIw7h9DssVDpkSutQpZ7XJ5OT
 zPInzl7MPhfjTABbHcjEUhcF2w/5V9bbp36pjouaO8HIgqSIjLNCyjfDafAgUrQLWmQT
 Sy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685679479; x=1688271479;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sfnS3Ss2unv4dgYVAG7D50gKcm9DhNLu2TnjcCoEDto=;
 b=fVtFtQC2QhNvQuExc3B8Yv+xxge7N61RoXlFpYR0vPqJIvqAup9YJ31wo/qwDq0fTX
 T9Io9kXkhVmv3pPPw0KczXqvZJFkS/7Ga7iFIRruceLXL5Ugt2wjA2Whk/Cxivq2cR+P
 RJOeuXUjP3zz8nUGvbtr2Z/EBg4MlDk53MYnxs4pDhDbJ3MLOXQKO89iOp/NMMrj7BGE
 pnHcGux99S6MvnDy0pzoOpIb/PWDxGvWKpBqmkRW5gTr3fNv/sDP+3EqfXZWEtv1XiHy
 DGLtilDuu26QIg0c06YQ5VC11SmC4wAn9J1dIfY5mz+Ksgut14+fPeVvY9uRqbwgkrf5
 HrhA==
X-Gm-Message-State: AC+VfDwKQNAF9+Y2x9QdpPxb1+3W58977iohg++DJ1JAJqeubhYO6ern
 q6ZhTWbEFetwXZgxtSKPhBJUnc87+wkI4GBBEJI=
X-Google-Smtp-Source: ACHHUZ75ZNDbKLbwacZjdT4fxf8WW2BF93LwFnjed0xtQ8uhkI03Ijrwf13di5VYNWYCvBOEVETJPMzHg/DRWTM6c7g=
X-Received: by 2002:a1f:4192:0:b0:461:3f81:aa43 with SMTP id
 o140-20020a1f4192000000b004613f81aa43mr6254vka.2.1685679479644; Thu, 01 Jun
 2023 21:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230530194623.272652-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 2 Jun 2023 14:17:33 +1000
Message-ID: <CAKmqyKMqtx4VPQeBfYGL1soUWX+33pZpt3YoP5faOww7P6FwFA@mail.gmail.com>
Subject: Re: [PATCH 01/16] target/riscv: skip features setup for KVM CPUs
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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

On Wed, May 31, 2023 at 5:49=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> As it is today it's not possible to use '-cpu host' if the RISC-V host
> has RVH enabled. This is the resulting error:
>
> $ sudo ./qemu/build/qemu-system-riscv64 \
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
> and setup during riscv_cpu_realize() that it doesn't apply KVM CPUs.
> Validating the feature set for those CPUs is a KVM problem that should
> be handled in KVM specific code.
>
> The new riscv_cpu_realize_features() helper contains all validation
> logic that are not applicable to KVM CPUs. riscv_cpu_realize() verifies
> if we're dealing with a KVM CPU and, if not, execute the new helper to
> proceed with the usual realize() logic for all other CPUs.
>
> [1] lib/sbi/sbi_hart.c, hart_detect_features()
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 41 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 32 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 938c7bd87b..72f5433776 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -331,6 +331,15 @@ static void set_satp_mode_default_map(RISCVCPU *cpu)
>  }
>  #endif
>
> +static bool riscv_running_KVM(void)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    return kvm_enabled();
> +#else
> +    return false;
> +#endif
> +}
> +
>  static void riscv_any_cpu_init(Object *obj)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
> @@ -1295,20 +1304,12 @@ static void riscv_cpu_validate_misa_priv(CPURISCV=
State *env, Error **errp)
>      }
>  }
>
> -static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> +static void riscv_cpu_realize_features(DeviceState *dev, Error **errp)
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
> @@ -1354,6 +1355,28 @@ static void riscv_cpu_realize(DeviceState *dev, Er=
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
> +    if (!riscv_running_KVM()) {
> +        riscv_cpu_realize_features(dev, &local_err);
> +        if (local_err !=3D NULL) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +    }
>
>      riscv_cpu_finalize_features(cpu, &local_err);
>      if (local_err !=3D NULL) {
> --
> 2.40.1
>
>

