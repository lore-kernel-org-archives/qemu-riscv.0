Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AF7C83F2D
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 01:52:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qcykn-0007iB-2H; Sun, 03 Sep 2023 21:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qcykl-0007hs-Gw; Sun, 03 Sep 2023 21:51:47 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qcykj-0007oY-8k; Sun, 03 Sep 2023 21:51:47 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-44ee1123667so1200018137.0; 
 Sun, 03 Sep 2023 18:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693792304; x=1694397104; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IkEcNAY7huu8WVbIaLimcsA36aQP6UZpf209Y7SOdzE=;
 b=IAvtSMbgRoF1DTIlSKHWYyE9j/Tx3b6fAPAlt6yYMEuXz4G+f1FKePcZDRL7LY5i1h
 /gRNGPBRuwKeBakZyHLZYKy64jadiyb36u31DPwUS553jGL/TIOBA7DgxoHb2+2EvaGG
 TBG0eoZWtcLDKynXVz1XPKXzLzVFeDxHVEKt0b1q+B24/5EnkccKGUb+gFV5Slhwhdm6
 ofnrFDxjIrNJIV/jVttoyhfdlRTn0taGgpfeJsDmlmAEeHAE1v+YQHgKsXpb93sYdsRR
 3xZJcm9LxdDw7+RAWX2nhUZXAt3b3JlmpjzSV9gAnUeJ+BdBO6Tw9L4NS1rSvWMw3gIw
 /zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693792304; x=1694397104;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IkEcNAY7huu8WVbIaLimcsA36aQP6UZpf209Y7SOdzE=;
 b=AJKqJ6WDbSXKrh/8UE/DpMmF3H7Y9QBSHQU1lr3tKvepdHYLPAw2ouQb7wkY9ZRQc/
 0nlGRDDBretN7kw5vXRqkR7ujmKi+CEQr2HtRqIY64nKYTMl984aN35Eu5Jli7KsIh6a
 WzrOW+hYxNr72PbtOrPiEUNZeaDjsBg8RHsXk+M10d3Ru4bFCRoPecYXGOxSpHvFWPkx
 bDyqL9Y5wQetLTIq99tEchUOKXjRO34IU15EAMLgiPdtOnmHddlBQs5uXHK7su5u/Aip
 qrndkJHpqWE2LU5QznZLpYa03mKq312JBv0OtaywHQDRtX9jWn9H3tpSILFUaCLEZWAx
 RwTA==
X-Gm-Message-State: AOJu0YzVrVJJJO4T9orsSfkD6CWh8ueY+uB/5S0ud/ldEARN6jGFHh0W
 r496S4lMNYoL/ChxBbJCQ83uUvOKnqfWtCBpYoc=
X-Google-Smtp-Source: AGHT+IGXtULHUHDb/WBHtNGzoMFaGDtGCn12r6FBjuXT40j6uJE0T7MgHioSuLzR3u0jNTBxeP/YOb/38aimtWhgWt8=
X-Received: by 2002:a05:6102:3576:b0:44d:4c07:f203 with SMTP id
 bh22-20020a056102357600b0044d4c07f203mr5042180vsb.17.1693792303849; Sun, 03
 Sep 2023 18:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
 <20230901194627.1214811-8-dbarboza@ventanamicro.com>
In-Reply-To: <20230901194627.1214811-8-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 4 Sep 2023 11:51:17 +1000
Message-ID: <CAKmqyKNGV2dUmT10P1hwjnDzduyFhzQ6p+eGyss-hoWDZJW6Nw@mail.gmail.com>
Subject: Re: [PATCH v9 07/20] target/riscv/cpu.c: add
 riscv_cpu_add_qdev_prop_array()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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

On Sat, Sep 2, 2023 at 5:49=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The code inside riscv_cpu_add_user_properties() became quite repetitive
> after recent changes. Add a helper to hide the repetition away.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 29 +++++++++++++----------------
>  1 file changed, 13 insertions(+), 16 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 86d536f242..d484d63bcd 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1951,6 +1951,15 @@ static void cpu_set_cfg_unavailable(Object *obj, V=
isitor *v,
>  }
>  #endif
>
> +static void riscv_cpu_add_qdev_prop_array(DeviceState *dev, Property *ar=
ray)
> +{
> +    g_assert(array);
> +
> +    for (Property *prop =3D array; prop && prop->name; prop++) {
> +        qdev_property_add_static(dev, prop);
> +    }
> +}
> +
>  #ifndef CONFIG_USER_ONLY
>  static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop=
_name)
>  {
> @@ -2007,7 +2016,6 @@ static void riscv_cpu_add_kvm_properties(Object *ob=
j)
>   */
>  static void riscv_cpu_add_user_properties(Object *obj)
>  {
> -    Property *prop;
>      DeviceState *dev =3D DEVICE(obj);
>
>  #ifndef CONFIG_USER_ONLY
> @@ -2021,21 +2029,10 @@ static void riscv_cpu_add_user_properties(Object =
*obj)
>
>      riscv_cpu_add_misa_properties(obj);
>
> -    for (prop =3D riscv_cpu_extensions; prop && prop->name; prop++) {
> -        qdev_property_add_static(dev, prop);
> -    }
> -
> -    for (prop =3D riscv_cpu_options; prop && prop->name; prop++) {
> -        qdev_property_add_static(dev, prop);
> -    }
> -
> -    for (prop =3D riscv_cpu_vendor_exts; prop && prop->name; prop++) {
> -        qdev_property_add_static(dev, prop);
> -    }
> -
> -    for (prop =3D riscv_cpu_experimental_exts; prop && prop->name; prop+=
+) {
> -        qdev_property_add_static(dev, prop);
> -    }
> +    riscv_cpu_add_qdev_prop_array(dev, riscv_cpu_extensions);
> +    riscv_cpu_add_qdev_prop_array(dev, riscv_cpu_options);
> +    riscv_cpu_add_qdev_prop_array(dev, riscv_cpu_vendor_exts);
> +    riscv_cpu_add_qdev_prop_array(dev, riscv_cpu_experimental_exts);
>  }
>
>  static Property riscv_cpu_properties[] =3D {
> --
> 2.41.0
>
>

