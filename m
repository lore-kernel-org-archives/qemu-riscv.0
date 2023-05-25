Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F01C77B7A
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 May 2023 02:14:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q20U4-0008WB-Jy; Wed, 24 May 2023 22:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q20U0-0008VU-Jd; Wed, 24 May 2023 22:13:40 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q20Tz-0007ZM-3O; Wed, 24 May 2023 22:13:40 -0400
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-784205f0058so142923241.1; 
 Wed, 24 May 2023 19:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684980817; x=1687572817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YOHLY6Kc6x62n9K7zLmdokHNuHba9aFPFgGYJ50H6+g=;
 b=ePsgTZiOIoTclvvaax/p+KYd881jncA2nsUAew8w76CuPX9J4hJyasS/tcYxpsBkQg
 367tCEXLuGgaNoXB8K9/OI/D3w/DpjsLfpAk2jOsfqDUrOChJtT37LIeX9KrGc8HKW8q
 U1xEjkYSTPREfmUWMfbrkhXF/Ixq49tB9L5kNzZtanr3tNvB+5NPXFTy//8Fb+9W3OPB
 tuk21E+km4bwf6lCKN112zsu2A9nAtXnwFuxi0pNynRFwntYxg18/t8/nZBnXIuKus9D
 kZqPQ03GHVH3aGZD4iq1KNtbGRA6DRK75sLiU8f/vdcCKDXEmorY0j3pNAgAqwRUnWzi
 5O4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684980817; x=1687572817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YOHLY6Kc6x62n9K7zLmdokHNuHba9aFPFgGYJ50H6+g=;
 b=ZLVCvBes5Zw1mMYPCp0bePvFXFd8QLJtKsSZGkoj6hS/mupP+Bsq/OPKXWaTs7Ywr8
 gbUVEG9eyxQ6rRpviy31+zaTxzbfyQlXJdR/wpr/9XdXXIguxVAG6nEamyXk9T+u1nhU
 Bn4uDWWiriGAbYmk9oX8MRDAQucWvg+R6BoMrfXdtK4Px7Ayc72pdIkXIa15o2/YmPM8
 Q8bg1crYe8si4MI8XPe/DfbaTt8F2ca6VlTMSvxA3WrWuQV4/M1vQ+P9k0WIs3bsUw1K
 yQ/iR3FHPExk0WzwVCRRjZqEpSqCvkqK27/+QnGjc17my3Qa2p4LgZczepmwsEIzcv5p
 VKow==
X-Gm-Message-State: AC+VfDydi7aEqQ/MzMlWiiYvGwJ5ZPYaX/0oJ5n0PutNbka8Y6d2lKp3
 8SIXXTnYMR/zqu2VPY3qFcvwTg6uNL2N9rN/YOI=
X-Google-Smtp-Source: ACHHUZ4NsMEQ3tLvv3e485QXf2iGZa9pbMGr+PMHTdbH1dgZJN3FA3nWpuYNkP+Ved/6lGqXUfF/FTek8YlC5PqTPTc=
X-Received: by 2002:a67:fa07:0:b0:42e:658d:3c03 with SMTP id
 i7-20020a67fa07000000b0042e658d3c03mr5465069vsq.33.1684980817166; Wed, 24 May
 2023 19:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230520054510.68822-1-philmd@linaro.org>
 <20230520054510.68822-2-philmd@linaro.org>
In-Reply-To: <20230520054510.68822-2-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 25 May 2023 12:13:11 +1000
Message-ID: <CAKmqyKPJJJxfu_eSh8y1UPZffKNcsG6GEQxrP4jguhntPHRXQA@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/riscv/opentitan: Rename machine_[class]_init()
 functions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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

On Sat, May 20, 2023 at 3:47=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Follow QOM style which declares FOO_init() as instance
> initializer and FOO_class_init() as class initializer:
> rename the OpenTitan machine class/instance init()
> accordingly.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/opentitan.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index bc678766e7..2d21ee39c5 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -75,7 +75,7 @@ static const MemMapEntry ibex_memmap[] =3D {
>      [IBEX_DEV_FLASH_VIRTUAL] =3D  {  0x80000000,  0x80000     },
>  };
>
> -static void opentitan_board_init(MachineState *machine)
> +static void opentitan_machine_init(MachineState *machine)
>  {
>      MachineClass *mc =3D MACHINE_GET_CLASS(machine);
>      const MemMapEntry *memmap =3D ibex_memmap;
> @@ -108,17 +108,17 @@ static void opentitan_board_init(MachineState *mach=
ine)
>      }
>  }
>
> -static void opentitan_machine_init(MachineClass *mc)
> +static void opentitan_machine_class_init(MachineClass *mc)
>  {
>      mc->desc =3D "RISC-V Board compatible with OpenTitan";
> -    mc->init =3D opentitan_board_init;
> +    mc->init =3D opentitan_machine_init;
>      mc->max_cpus =3D 1;
>      mc->default_cpu_type =3D TYPE_RISCV_CPU_IBEX;
>      mc->default_ram_id =3D "riscv.lowrisc.ibex.ram";
>      mc->default_ram_size =3D ibex_memmap[IBEX_DEV_RAM].size;
>  }
>
> -DEFINE_MACHINE("opentitan", opentitan_machine_init)
> +DEFINE_MACHINE("opentitan", opentitan_machine_class_init)
>
>  static void lowrisc_ibex_soc_init(Object *obj)
>  {
> --
> 2.38.1
>
>

