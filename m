Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626EAEB64D7
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 01:09:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qC8p9-0004Zs-EI; Wed, 21 Jun 2023 21:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC8op-0004QK-34; Wed, 21 Jun 2023 21:09:04 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC8om-0006N2-Az; Wed, 21 Jun 2023 21:09:01 -0400
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-44096f01658so2431719137.0; 
 Wed, 21 Jun 2023 18:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687396137; x=1689988137;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cEcNWBytzxnOplEjsyOKl2dkWZIKKWz97YG5KkSH7/4=;
 b=P70twXkFtdgdqS41U6cwcXcptvfa5F+ZUMIJ102TftYPg5ZKrtF3219/fCphYeIEFn
 gaUOV7b3lyw0JWrrXqNh6eTGc8T/cp22RvpDxbytPPlMGzo13D8uSu5DGcokJNWJ/xSF
 rxtnkBjHAL5H40lHl1rrMpUvBTl2Za81bwb8sVHSy03ibuau2QnR3tcT0AsdfvAXMDwN
 jXVCRdKO6Dmp3VUhGDMPUF3eKr7GpI1rIKy2ZDkJtelp1ljwEboX9TrlreNNu2xBYj90
 YAi+9zJKDLXUY0LbxWmRTllNkW/3M8Of9JqCtGvMzJx1O2GWISP0nVjI6YUhHzhuVIcr
 NCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687396137; x=1689988137;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cEcNWBytzxnOplEjsyOKl2dkWZIKKWz97YG5KkSH7/4=;
 b=KumR30buDTha4dD/wBUQRCPX2e1ZbDBPdHt4fl+nprXZnnn5aFXMa4Dr0t62pfrbZn
 5MIa0dgHWuXZUoNfhgyWDIONzh4oeIAFhkmXoxdhZ/ZNH7xB8AZv2Jxw2zj9IzhKKIhH
 fJICf+qG2IuI4zkGzfr+LyzCHH2oyI63LEmzvpLBM7FJtrdvcAaesxs7DaLD/fg9PvDM
 e+QC+czhoX9A6j7JvD5yS3CPTz+xkzhoWmvSZJOv14oSfFW9Q/uLgblApzSsVnHOrzyU
 7b88uzu27C9mzQ4QJ0nibK3rBArHLJkbgVJ5R4zjy7dD3UHACBb7fNr6oogSF6mDdORt
 Wt5A==
X-Gm-Message-State: AC+VfDwkcMwPEueotBCvoc4jxBdUog30F8J007uBnWYfl7bLIPERk7TV
 BdWz1n5Ce0t+cmPgb4kL0gZMbAXFeVKBGNGnamE=
X-Google-Smtp-Source: ACHHUZ4nLovmBB5DXUEhsKr+frw4s5V5fecqW+0KyjRIsgnUJSsUJltdjQUHnxmwVcfS81Ir4a2BE5j272eszPJgCiI=
X-Received: by 2002:a05:6102:2749:b0:440:b616:6a7b with SMTP id
 p9-20020a056102274900b00440b6166a7bmr6603589vsu.8.1687396136816; Wed, 21 Jun
 2023 18:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230613205857.495165-1-dbarboza@ventanamicro.com>
 <20230613205857.495165-5-dbarboza@ventanamicro.com>
In-Reply-To: <20230613205857.495165-5-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Jun 2023 11:08:30 +1000
Message-ID: <CAKmqyKO6kGiS3yvv3bTk1p7rPSFZnRwPni1gjYfTtv84eW8fUA@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] target/riscv/cpu.c: restrict 'mimpid' value
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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

On Wed, Jun 14, 2023 at 7:01=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Following the same logic used with 'mvendorid' let's also restrict
> 'mimpid' for named CPUs. Generic CPUs keep setting the value freely.
>
> Note that we're getting rid of the default RISCV_CPU_MARCHID value. The
> reason is that this is not a good default since it's dynamic, changing
> with with every QEMU version, regardless of whether the actual
> implementation of the CPU changed from one QEMU version to the other.
> Named CPU should set it to a meaningful value instead and generic CPUs
> can set whatever they want.
>
> This is the error thrown for an invalid 'mimpid' value for the veyron-v1
> CPU:
>
> $ ./qemu-system-riscv64 -M virt -nographic -cpu veyron-v1,mimpid=3D2
> qemu-system-riscv64: can't apply global veyron-v1-riscv-cpu.mimpid=3D2:
>     Unable to change veyron-v1-riscv-cpu mimpid (0x111)
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 34 ++++++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6a9a6d34eb..39c550682a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -42,7 +42,6 @@
>  #define RISCV_CPU_MARCHID   ((QEMU_VERSION_MAJOR << 16) | \
>                               (QEMU_VERSION_MINOR << 8)  | \
>                               (QEMU_VERSION_MICRO))
> -#define RISCV_CPU_MIMPID    RISCV_CPU_MARCHID
>
>  static const char riscv_single_letter_exts[] =3D "IEMAFDQCPVH";
>
> @@ -1735,7 +1734,6 @@ static Property riscv_cpu_properties[] =3D {
>      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>
>      DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCH=
ID),
> -    DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID)=
,
>
>  #ifndef CONFIG_USER_ONLY
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVE=
C),
> @@ -1854,6 +1852,35 @@ static void cpu_get_mvendorid(Object *obj, Visitor=
 *v, const char *name,
>      visit_type_bool(v, name, &value, errp);
>  }
>
> +static void cpu_set_mimpid(Object *obj, Visitor *v, const char *name,
> +                           void *opaque, Error **errp)
> +{
> +    bool dynamic_cpu =3D riscv_cpu_is_dynamic(obj);
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    uint64_t prev_val =3D cpu->cfg.mimpid;
> +    uint64_t value;
> +
> +    if (!visit_type_uint64(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (!dynamic_cpu && prev_val !=3D value) {
> +        error_setg(errp, "Unable to change %s mimpid (0x%lx)",
> +                   object_get_typename(obj), prev_val);
> +        return;
> +    }
> +
> +    cpu->cfg.mimpid =3D value;
> +}
> +
> +static void cpu_get_mimpid(Object *obj, Visitor *v, const char *name,
> +                           void *opaque, Error **errp)
> +{
> +    bool value =3D RISCV_CPU(obj)->cfg.mimpid;
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
>  static void riscv_cpu_class_init(ObjectClass *c, void *data)
>  {
>      RISCVCPUClass *mcc =3D RISCV_CPU_CLASS(c);
> @@ -1888,6 +1915,9 @@ static void riscv_cpu_class_init(ObjectClass *c, vo=
id *data)
>      object_class_property_add(c, "mvendorid", "uint32", cpu_get_mvendori=
d,
>                                cpu_set_mvendorid, NULL, NULL);
>
> +    object_class_property_add(c, "mimpid", "uint64", cpu_get_mimpid,
> +                              cpu_set_mimpid, NULL, NULL);
> +
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>
> --
> 2.40.1
>
>

