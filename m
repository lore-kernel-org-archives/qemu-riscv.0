Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEB5C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 05:02:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLcL8-0004Vx-MB; Fri, 05 Jan 2024 00:01:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcL6-0004VN-Ce; Fri, 05 Jan 2024 00:01:48 -0500
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcL4-0004wv-O7; Fri, 05 Jan 2024 00:01:48 -0500
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-7cd42bc0f1dso375095241.1; 
 Thu, 04 Jan 2024 21:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704430905; x=1705035705; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ktf3SHSlzcwR9Tpu7F7DJwNP9RlrcT5Haiz4Zl8Y3Xw=;
 b=C43v3qg8kb9EY1I51Oh3nXmeJ9r4BF3H4f9sVGW9L1eS1PVMDQdq+fhTjn3uLIIACE
 jnAZqIropDXT4G2/AOQDxIfwytPqyo61wZVXlGCEXHjic1f6fEvOgkU/8csb1Z189GWP
 Yn0j1Ua1QEf+tJioGSHEKWv/rlTevV1zt2ZBUoCbyy04PqvcV7cHeCfx3OFlwtYECr9n
 m4wMUL+zA/fgNMxAV5hLMpbOCMIuZB4uUlHQO7ZqWGeE6+JV6Grlt5CKGEKmEHjviF5T
 WywiAaH4REPAwYS08AwFR7C4I3DViYoJe3R21l/YcfbNu4prQDSslSEf8Ln18KnTuawi
 NoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704430905; x=1705035705;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ktf3SHSlzcwR9Tpu7F7DJwNP9RlrcT5Haiz4Zl8Y3Xw=;
 b=Vi6mwKc4ug+dClyN0ZfIiw8T37A1hC+Wo71kbnKk0oizAMPnDoi9vrd34dotvsv0+a
 86J6bbfan0WdSpux7pycuHyT6tliPuZ48Ai0KD3yVIr5pwJzsrx/qCKHQB9AzJ9aRx2s
 TLIlF9qxWZ/VB6BNP+MJRBabTUy9Gs0iZzJNC1gMNsKXio4oamDJlR2s+Z46otrh2FDT
 rb3urR0TlH4hbtgRBvhlPT0nrMd7j6FnUkwpb+I2dUcHi9iVzKNkzwjnFbKA7vNyTPDT
 giz7X1c9J6XjhfBt16+1ii0RlhppI+iqZ0/Gm6IlKdjHWIY1GWTpFv8s176ZBC5Xhnyn
 hybg==
X-Gm-Message-State: AOJu0YyKj4jGKnGGYfFg7A678ZuyanS6wYVZ2h5ysb8ckEl6mMRj3Kjk
 dmjqoJ44g4k3S3MYUOAr2OuHs7nQiXCbUihXRtk=
X-Google-Smtp-Source: AGHT+IGhJh1q7Ey4dMGozqqXs9Ri6V+bcQnRbNF8JxSBr3u9W6l1VCn3PRtn81FheD6EyczovF8gCOZ54RDeeIXb4/A=
X-Received: by 2002:a05:6102:559c:b0:467:4b38:42ff with SMTP id
 dc28-20020a056102559c00b004674b3842ffmr1569120vsb.33.1704430905378; Thu, 04
 Jan 2024 21:01:45 -0800 (PST)
MIME-Version: 1.0
References: <20240103174013.147279-1-dbarboza@ventanamicro.com>
 <20240103174013.147279-14-dbarboza@ventanamicro.com>
In-Reply-To: <20240103174013.147279-14-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 15:01:00 +1000
Message-ID: <CAKmqyKNL_MoKXY_y44a=RiNTo05BuPqit1Nvz=gD157R+xb6=A@mail.gmail.com>
Subject: Re: [PATCH v3 13/16] target/riscv: remove riscv_cpu_options[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, vladimir.isaev@syntacore.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
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

On Thu, Jan 4, 2024 at 3:45=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The array is empty and can be removed.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 5 -----
>  target/riscv/cpu.h         | 1 -
>  target/riscv/kvm/kvm-cpu.c | 9 ---------
>  target/riscv/tcg/tcg-cpu.c | 4 ----
>  4 files changed, 19 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1e35b73e40..0d0197a8ef 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1894,11 +1894,6 @@ static const PropertyInfo prop_cboz_blksize =3D {
>      .set =3D prop_cboz_blksize_set,
>  };
>
> -Property riscv_cpu_options[] =3D {
> -
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
>  static Property riscv_cpu_properties[] =3D {
>      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 484c32e607..59e23708d1 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -773,7 +773,6 @@ extern const RISCVCPUMultiExtConfig riscv_cpu_extensi=
ons[];
>  extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[];
>  extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
>  extern const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[];
> -extern Property riscv_cpu_options[];
>
>  typedef struct isa_ext_data {
>      const char *name;
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 137a8ab2bb..5800abc9c6 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1443,19 +1443,10 @@ void kvm_riscv_aia_create(MachineState *machine, =
uint64_t group_shift,
>  static void kvm_cpu_instance_init(CPUState *cs)
>  {
>      Object *obj =3D OBJECT(RISCV_CPU(cs));
> -    DeviceState *dev =3D DEVICE(obj);
>
>      riscv_init_kvm_registers(obj);
>
>      kvm_riscv_add_cpu_user_properties(obj);
> -
> -    for (Property *prop =3D riscv_cpu_options; prop && prop->name; prop+=
+) {
> -        /* Check if we have a specific KVM handler for the option */
> -        if (object_property_find(obj, prop->name)) {
> -            continue;
> -        }
> -        qdev_property_add_static(dev, prop);
> -    }
>  }
>
>  void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 84064ef7e0..d3eeedc758 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -889,10 +889,6 @@ static void riscv_cpu_add_user_properties(Object *ob=
j)
>      riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_experimental_exts);
>
>      riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts);
> -
> -    for (Property *prop =3D riscv_cpu_options; prop && prop->name; prop+=
+) {
> -        qdev_property_add_static(DEVICE(obj), prop);
> -    }
>  }
>
>  /*
> --
> 2.43.0
>
>

