Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68180E7D0C9
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 05:54:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qjZ72-00038E-V2; Fri, 22 Sep 2023 01:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qjZ6z-00035n-I3; Fri, 22 Sep 2023 01:53:57 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qjZ6x-0000iS-Lp; Fri, 22 Sep 2023 01:53:56 -0400
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-44ee3a547adso829127137.2; 
 Thu, 21 Sep 2023 22:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695362034; x=1695966834; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jzNFNMYSLF5wBSKkEr5evMbptt3DDIQYduMrQCljsmg=;
 b=NVCsk5ixye4keNgYhy7gs4MtAn2CxusCehknMCJtLaAgVoSZDh5iQLrc7TWlfqFq5I
 C207nB7e7kCiPdlNRd2HcFKW5L225LWrP3d24ptghCnCk0lLdxnnFYBhST9Jq93+bjk+
 NPrzCzKH1ijXybjRn1BAJcdH+qTETkfR7EAcr1LiNtIwWnWNjZGfY9OpK+tgfZxMgQf7
 VSkK8N9QmX/cKOuufnvG0g87S1uuUBrjulzvVzdr3WJDGLbOcaQlEGc8SjWLF2PwoDdZ
 JsNgMPUfykJHPFiusoA3wo2r51faWuzjrYkDYbJuA400AW2kC18aE2fy4nCiG1ULCmUH
 c1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695362034; x=1695966834;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jzNFNMYSLF5wBSKkEr5evMbptt3DDIQYduMrQCljsmg=;
 b=stqjgxqVAvNM3aian3Bxs5RURAtvpqL0FLEmCVEduBsOoGWROHK44cPxe6cez2rJJt
 YuzQIyD7nMDqEo2bybaoQLiX12zPqBoWGCludDB2igY8apghw83cyTmR9HRGk9d8rryn
 YVTAiaXh71rSA9bnLNImDduXd/t1yiTKIZOiseRNj28GOT7AqYUUjtMCx+hvItCbBYbS
 +LkcYnzo7AOl/sMAJ0wTK8n8Z/XQ4JXZi9qI408WuWLCK/qMCRkcLudfCzfQc/pUdIPF
 TlICZEFtKsPVh0mvddloLPV1QImo4z+zXI7cdy4h3tiH77QsV5e7M+OQpYr6/krN1QNC
 RIOQ==
X-Gm-Message-State: AOJu0YwJEF1CvEAxhSHQCrR6SU7oS2tZ91nOsQUt8LHNiXJBVpXlfreA
 AMje21Roc2mTjDxYdxZsnZUjKoRqDM9uxVzF2x8=
X-Google-Smtp-Source: AGHT+IHgqjBDp7tXQwx4r2grzMWOwYDIyuGtvmeStoDHake++sBoDltWS394wmiFqitsHIrGAaDqqbRCELifpCiLMrw=
X-Received: by 2002:a67:e8da:0:b0:44d:4b34:af92 with SMTP id
 y26-20020a67e8da000000b0044d4b34af92mr7358497vsn.7.1695362033919; Thu, 21 Sep
 2023 22:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
 <20230920112020.651006-7-dbarboza@ventanamicro.com>
In-Reply-To: <20230920112020.651006-7-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Sep 2023 15:53:27 +1000
Message-ID: <CAKmqyKNno9PPvpez_Mk_hH_UzWQMiThH7RMnpG6L25c5L3vG6Q@mail.gmail.com>
Subject: Re: [PATCH v3 06/19] target/riscv: move 'host' CPU declaration to
 kvm.c
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Wed, Sep 20, 2023 at 9:22=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> This CPU only exists if we're compiling with KVM so move it to the kvm
> specific file.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 15 ---------------
>  target/riscv/kvm.c | 21 +++++++++++++++++++++
>  2 files changed, 21 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 848b58e7c4..f8368ce274 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -652,18 +652,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>  }
>  #endif
>
> -#if defined(CONFIG_KVM)
> -static void riscv_host_cpu_init(Object *obj)
> -{
> -    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> -#if defined(TARGET_RISCV32)
> -    set_misa(env, MXL_RV32, 0);
> -#elif defined(TARGET_RISCV64)
> -    set_misa(env, MXL_RV64, 0);
> -#endif
> -}
> -#endif /* CONFIG_KVM */
> -
>  static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
>  {
>      ObjectClass *oc;
> @@ -2041,9 +2029,6 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>      },
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,      riscv_any_cpu_init),
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_MAX,      riscv_max_cpu_init),
> -#if defined(CONFIG_KVM)
> -    DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
> -#endif
>  #if defined(TARGET_RISCV32)
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE32,   rv32_base_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 1e4e4456b3..31d2ede4b6 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -1271,3 +1271,24 @@ void kvm_riscv_aia_create(MachineState *machine, u=
int64_t group_shift,
>
>      kvm_msi_via_irqfd_allowed =3D kvm_irqfds_enabled();
>  }
> +
> +static void riscv_host_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> +
> +#if defined(TARGET_RISCV32)
> +    env->misa_mxl_max =3D env->misa_mxl =3D MXL_RV32;
> +#elif defined(TARGET_RISCV64)
> +    env->misa_mxl_max =3D env->misa_mxl =3D MXL_RV64;
> +#endif
> +}
> +
> +static const TypeInfo riscv_kvm_cpu_type_infos[] =3D {
> +    {
> +        .name =3D TYPE_RISCV_CPU_HOST,
> +        .parent =3D TYPE_RISCV_CPU,
> +        .instance_init =3D riscv_host_cpu_init,
> +    }
> +};
> +
> +DEFINE_TYPES(riscv_kvm_cpu_type_infos)
> --
> 2.41.0
>
>

