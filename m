Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11909C83F2C
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 01:49:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qcyiI-0006st-K3; Sun, 03 Sep 2023 21:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qcyiH-0006sX-Hl; Sun, 03 Sep 2023 21:49:13 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qcyiF-0007HT-9u; Sun, 03 Sep 2023 21:49:13 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id
 ada2fe7eead31-44d526f96fcso64203137.1; 
 Sun, 03 Sep 2023 18:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693792150; x=1694396950; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E3/BtvmnnaepakbWlmfOJO9iAnSIKLeU1mrNC/i2kyw=;
 b=gC2133lD90zrz3/GGxKlZaB8z1TLDo6mlKNMvE94RHtJmWXDpv/mHs0RZaNzl4aZOw
 CQYIh0oqfAEDZQi9kBvAB62EOIj+waaZSV+2D/IUwFbVflBoiYc4/VjvfzRFQXa4Rmjn
 p54o05k0Ey8UBKeXLBun68j1LJmyeRZAXwkq1LzceYZQgOMzczopby/y5VKjPsFAiDB7
 CrTr1tUSBkwqins+UJP798w6ghy4hO+NiQwdsiZSbKXzxiXpR+Q7395RuFNsrEiMfby7
 h0f0LWtv+YM7lkhOioJAOukhplsn9nWhKB37MJ8m4uQ/7GSqin9HpLc0WRn0dGgw8zQJ
 KtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693792150; x=1694396950;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E3/BtvmnnaepakbWlmfOJO9iAnSIKLeU1mrNC/i2kyw=;
 b=gyLAMfsd7Iut5TxN8iN7N9y6pQx6P6gnackDlWdceU1mFQYa3TFLsNzfLrT6R0jCjl
 oC9hO7s+Kd5JyOVSaY/W1fsqAQaUaTlNqmKtPYNehZ4lmEhhC35hlAQoM2UKunowpmrf
 WmalP18GFV6vReqFSCcO9z7E5VPrDNSnVwG/sllCDAl6S4h+YoIBJvOvRqQH1duOXe5+
 mRRtGo6Zh6kWxalwsmmD2E9b5TJGHdvUoOhqJPn/6AmXWnU35XFXA0y9gwtxrBHW/s2h
 XcJEZYoujd6P9NySw6xhjTXnFDdBTJpRAe3z5+DT6DG6alT4/627j6CU661n8cx7X/xt
 viJw==
X-Gm-Message-State: AOJu0Yw28CtjJozT3dIVPeOMjWXP/dQWbazptkFj28fGMExnNeJKdVUX
 mCrI3OJMYksL9Hkrp67ikJYZMyvI9pL8bHypq7k=
X-Google-Smtp-Source: AGHT+IGYjrQ5l3JvmZSGIe6NoMQQ8v7Hb924X247jDv5SePgHKBDe5lBopwVdq6SydagI3BSUVZeomj80syuVINA0+Y=
X-Received: by 2002:a67:ff02:0:b0:44e:93f4:3c85 with SMTP id
 v2-20020a67ff02000000b0044e93f43c85mr4694880vsp.12.1693792149884; Sun, 03 Sep
 2023 18:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
 <20230901194627.1214811-5-dbarboza@ventanamicro.com>
In-Reply-To: <20230901194627.1214811-5-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 4 Sep 2023 11:48:43 +1000
Message-ID: <CAKmqyKN+cM+mQ3iTWXctdsRfX+-PTjH00WLSrdke=veh2wQU1g@mail.gmail.com>
Subject: Re: [PATCH v9 04/20] target/riscv: add DEFINE_PROP_END_OF_LIST() to
 riscv_cpu_options[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
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

On Sat, Sep 2, 2023 at 5:50=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Add DEFINE_PROP_END_OF_LIST() and eliminate the ARRAY_SIZE() usage when
> iterating in the riscv_cpu_options[] array, making it similar to what
> we already do when working with riscv_cpu_extensions[].
>
> We also have a more sophisticated motivation behind this change. In the
> future we might need to export riscv_cpu_options[] to other files, and
> ARRAY_LIST() doesn't work properly in that case because the array size
> isn't exposed to the header file. Here's a future sight of what we would
> deal with:
>
> ./target/riscv/kvm.c:1057:5: error: nested extern declaration of 'riscv_c=
pu_add_misa_properties' [-Werror=3Dnested-externs]
> n file included from ../target/riscv/kvm.c:19:
> home/danielhb/work/qemu/include/qemu/osdep.h:473:31: error: invalid appli=
cation of 'sizeof' to incomplete type 'const RISCVCPUMultiExtConfig[]'
>  473 | #define ARRAY_SIZE(x) ((sizeof(x) / sizeof((x)[0])) + \
>      |                               ^
> ./target/riscv/kvm.c:1047:29: note: in expansion of macro 'ARRAY_SIZE'
> 1047 |         for (int i =3D 0; i < ARRAY_SIZE(_array); i++) { \
>      |                             ^~~~~~~~~~
> ./target/riscv/kvm.c:1059:5: note: in expansion of macro 'ADD_UNAVAIL_KVM=
_PROP_ARRAY'
> 1059 |     ADD_UNAVAIL_KVM_PROP_ARRAY(obj, riscv_cpu_extensions);
>      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
> home/danielhb/work/qemu/include/qemu/osdep.h:473:31: error: invalid appli=
cation of 'sizeof' to incomplete type 'const RISCVCPUMultiExtConfig[]'
>  473 | #define ARRAY_SIZE(x) ((sizeof(x) / sizeof((x)[0])) + \
>      |                               ^
> ./target/riscv/kvm.c:1047:29: note: in expansion of macro 'ARRAY_SIZE'
> 1047 |         for (int i =3D 0; i < ARRAY_SIZE(_array); i++) { \
>
> Homogenize the present and change the future by using
> DEFINE_PROP_END_OF_LIST() in riscv_cpu_options[].
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8e6d316500..8662414906 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1922,6 +1922,8 @@ static Property riscv_cpu_options[] =3D {
>
>      DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 6=
4),
>      DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 6=
4),
> +
> +    DEFINE_PROP_END_OF_LIST(),
>  };
>
>  #ifndef CONFIG_USER_ONLY
> @@ -1973,12 +1975,12 @@ static void riscv_cpu_add_kvm_properties(Object *=
obj)
>          riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
>      }
>
> -    for (int i =3D 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
> +    for (prop =3D riscv_cpu_options; prop && prop->name; prop++) {
>          /* Check if KVM created the property already */
> -        if (object_property_find(obj, riscv_cpu_options[i].name)) {
> +        if (object_property_find(obj, prop->name)) {
>              continue;
>          }
> -        qdev_property_add_static(dev, &riscv_cpu_options[i]);
> +        qdev_property_add_static(dev, prop);
>      }
>  }
>  #endif
> @@ -2009,8 +2011,8 @@ static void riscv_cpu_add_user_properties(Object *o=
bj)
>          qdev_property_add_static(dev, prop);
>      }
>
> -    for (int i =3D 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
> -        qdev_property_add_static(dev, &riscv_cpu_options[i]);
> +    for (prop =3D riscv_cpu_options; prop && prop->name; prop++) {
> +        qdev_property_add_static(dev, prop);
>      }
>  }
>
> --
> 2.41.0
>
>

