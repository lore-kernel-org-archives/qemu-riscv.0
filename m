Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED1DC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 04:58:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLcHK-0003RB-9l; Thu, 04 Jan 2024 23:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcHI-0003QC-0i; Thu, 04 Jan 2024 23:57:52 -0500
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcHG-0007bL-C1; Thu, 04 Jan 2024 23:57:51 -0500
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-7cd17b33a5eso418132241.1; 
 Thu, 04 Jan 2024 20:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704430669; x=1705035469; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jaV3eWHt3AkJfuPpbd1Dk5EQQzyOyx0kLW3Y9zFY0l8=;
 b=jkQ10feDm1lYEph3R3Nk1aCDYdM1R0ApGWNKk7jCkPj0Bp7VWU+wmDVL59TMZvXZ/5
 QiueFPGguWIMPY11NccujJuVcqcL7SnqA9zDp7gCNXWXLfYHEuEaRturGcEwdIRNL+HD
 WRkLZQy182k3yy5cNTNUbEfNjHswcTJKfGHWXcE9j8sZjnVXYg5dIpVQnUFQ/gJTpeo2
 ZfKQGTQnvmubs7waWJLtxGoctInAO2h9BHYZUWC2lahq7AMrj8wN9xhwsrvAA5/SNSs5
 lffdGUO0SHxMnL1cpFX0BWDHBEySUf05krAD6nYDqY7CxMTszSmTfljt2kK7wESRTAsl
 6JRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704430669; x=1705035469;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jaV3eWHt3AkJfuPpbd1Dk5EQQzyOyx0kLW3Y9zFY0l8=;
 b=GYg9FhKsVMfug4bDg1oJQXqMU5PIf/f7MIpD+aB6j85wGk43TkBNuTBU/bgmnmHqqe
 RKKYRlynhanbBQ+eU79KGgk1L4NoS2DWzwYF5wR/jkHIThOWEgXd6x1YbJu5naWFYsKO
 yk3rRAkgtgAHvot7dHr4pWTRYgMcHjV2gFViL26SUlhhLnSg150g0idWuJ0MHcRXWUEM
 LV0afVWpwYlN2LDG91Z06krtCd2sgpCs16UEFiBaShV7J6DUPqTAedDBosDY1cIscVGf
 Zn3FELXemdax8O9ENJ/HyzQf21vEgKahwzsozZP3oJ0ITG6m3eXboqkXmgy1dFem+Pp/
 CCTg==
X-Gm-Message-State: AOJu0YwFv+84ffyJCiA2ASQOfs/3yb8Yfm7QlPQCbx+eV8kn3oMB6s9M
 M6sc3X+nEvqdD51N9SGjUbiV4DDwGBMgavnffBw=
X-Google-Smtp-Source: AGHT+IGiiFN3uilzin8OsN2Zk2wcUtZVAVPHEgp1fMG63t9SqSGBYNSlH2QCS9k0Zpyryl06ZxzNL8tQuMYNDOVnpwg=
X-Received: by 2002:a05:6102:6cb:b0:467:b81a:5d91 with SMTP id
 m11-20020a05610206cb00b00467b81a5d91mr6031vsg.17.1704430668693; Thu, 04 Jan
 2024 20:57:48 -0800 (PST)
MIME-Version: 1.0
References: <20240103174013.147279-1-dbarboza@ventanamicro.com>
 <20240103174013.147279-13-dbarboza@ventanamicro.com>
In-Reply-To: <20240103174013.147279-13-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 14:57:22 +1000
Message-ID: <CAKmqyKPya02aJ6-xGsV6ecBp5s1DJUP19TANCD2jhz_Mefrz1Q@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] target/riscv: move 'cboz_blocksize' to
 riscv_cpu_properties[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, vladimir.isaev@syntacore.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92a.google.com
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

On Thu, Jan 4, 2024 at 4:56=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Do the same we did with 'cbom_blocksize' in the previous patch.
>
> Remove the now unused kvm_cpu_set_cbomz_blksize() setter.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 38 +++++++++++++++++++++++++++++++++++++-
>  target/riscv/kvm/kvm-cpu.c | 28 ----------------------------
>  2 files changed, 37 insertions(+), 29 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b510cb94fc..1e35b73e40 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1277,6 +1277,7 @@ static void riscv_cpu_init(Object *obj)
>      cpu->cfg.vlen =3D 128;
>      cpu->cfg.elen =3D 64;
>      cpu->cfg.cbom_blocksize =3D 64;
> +    cpu->cfg.cboz_blocksize =3D 64;
>      cpu->env.vext_ver =3D VEXT_VERSION_1_00_0;
>  }
>
> @@ -1858,8 +1859,42 @@ static const PropertyInfo prop_cbom_blksize =3D {
>      .set =3D prop_cbom_blksize_set,
>  };
>
> +static void prop_cboz_blksize_set(Object *obj, Visitor *v, const char *n=
ame,
> +                                  void *opaque, Error **errp)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    uint16_t value;
> +
> +    if (!visit_type_uint16(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (value !=3D cpu->cfg.cboz_blocksize && riscv_cpu_is_vendor(obj)) =
{
> +        cpu_set_prop_err(cpu, name, errp);
> +        error_append_hint(errp, "Current '%s' val: %u\n",
> +                          name, cpu->cfg.cboz_blocksize);
> +        return;
> +    }
> +
> +    cpu_option_add_user_setting(name, value);
> +    cpu->cfg.cboz_blocksize =3D value;
> +}
> +
> +static void prop_cboz_blksize_get(Object *obj, Visitor *v, const char *n=
ame,
> +                         void *opaque, Error **errp)
> +{
> +    uint16_t value =3D RISCV_CPU(obj)->cfg.cboz_blocksize;
> +
> +    visit_type_uint16(v, name, &value, errp);
> +}
> +
> +static const PropertyInfo prop_cboz_blksize =3D {
> +    .name =3D "cboz_blocksize",
> +    .get =3D prop_cboz_blksize_get,
> +    .set =3D prop_cboz_blksize_set,
> +};
> +
>  Property riscv_cpu_options[] =3D {
> -    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 6=
4),
>
>      DEFINE_PROP_END_OF_LIST(),
>  };
> @@ -1880,6 +1915,7 @@ static Property riscv_cpu_properties[] =3D {
>      {.name =3D "elen", .info =3D &prop_elen},
>
>      {.name =3D "cbom_blocksize", .info =3D &prop_cbom_blksize},
> +    {.name =3D "cboz_blocksize", .info =3D &prop_cboz_blksize},
>
>  #ifndef CONFIG_USER_ONLY
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVE=
C),
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 1866b56913..137a8ab2bb 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -343,30 +343,6 @@ static KVMCPUConfig kvm_cboz_blocksize =3D {
>      .kvm_reg_id =3D KVM_REG_RISCV_CONFIG_REG(zicboz_block_size)
>  };
>
> -static void kvm_cpu_set_cbomz_blksize(Object *obj, Visitor *v,
> -                                      const char *name,
> -                                      void *opaque, Error **errp)
> -{
> -    KVMCPUConfig *cbomz_cfg =3D opaque;
> -    RISCVCPU *cpu =3D RISCV_CPU(obj);
> -    uint16_t value, *host_val;
> -
> -    if (!visit_type_uint16(v, name, &value, errp)) {
> -        return;
> -    }
> -
> -    host_val =3D kvmconfig_get_cfg_addr(cpu, cbomz_cfg);
> -
> -    if (value !=3D *host_val) {
> -        error_report("Unable to set %s to a different value than "
> -                     "the host (%u)",
> -                     cbomz_cfg->name, *host_val);
> -        exit(EXIT_FAILURE);
> -    }
> -
> -    cbomz_cfg->user_set =3D true;
> -}
> -
>  static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs=
)
>  {
>      CPURISCVState *env =3D &cpu->env;
> @@ -484,10 +460,6 @@ static void kvm_riscv_add_cpu_user_properties(Object=
 *cpu_obj)
>                              NULL, multi_cfg);
>      }
>
> -    object_property_add(cpu_obj, "cboz_blocksize", "uint16",
> -                        NULL, kvm_cpu_set_cbomz_blksize,
> -                        NULL, &kvm_cboz_blocksize);
> -
>      riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_extensions);
>      riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_vendor_exts)=
;
>      riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_experimental=
_exts);
> --
> 2.43.0
>
>

