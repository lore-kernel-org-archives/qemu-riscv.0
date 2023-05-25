Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0AAC77B7C
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 May 2023 02:18:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q20Xs-0001lq-MP; Wed, 24 May 2023 22:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q20Xi-0001kx-ID; Wed, 24 May 2023 22:17:32 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q20Xh-0000CK-5J; Wed, 24 May 2023 22:17:30 -0400
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-439719278f9so150110137.2; 
 Wed, 24 May 2023 19:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684981045; x=1687573045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5q5sBpUtvGRMtshpdCKIcabPrIxDRv23Xs8C06frLl4=;
 b=f+cAmYARNHB6/7AVswuzZ++Ec7qtHQ5PrZb2Lkf/zq9PeKvll/yEpkw3caOzAafugN
 oRp5YrbvUdT5DDEQf3XuHWbqNVTrhoRf8kh6hEjHCw9yv+T0L5tvf6A+8HjhdZe6+LzM
 ubvCppyaEHW3EKFLpnyOpTEgLuBhGHPdm0LW7/KIsmGW6VYlQ5fFACoHvMAAhExfkzmU
 81FpRFvTKbpHh/zdJSnPh2GJxlYBf3/i2nvkaBzwK3csDyzNM9/DLfAaoVb2IxdoBIjK
 hV43KsAekhdz82kM72sBGe71WXDwnROGtrfNwH8QbDLlOGcGm7uK4/5ayzj6ko1JJJ+d
 VXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684981045; x=1687573045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5q5sBpUtvGRMtshpdCKIcabPrIxDRv23Xs8C06frLl4=;
 b=N0172eFsabw3fJxpT49K7DXidTfyh4DV9SQ5WmAjX036XHzhE/veTOs15wMoVSZmWT
 Df6nweKWU4aZMLttCWPJhl5zAuAb/5qZucmuYF2xNQc8goqR677fG9s68XL5+buZAyKe
 n2wf9OvBLLd7N8pxWsm6Hpl/6Pxq//TrpUz2Eq7Qze2IAC9rndt+cGL8q5Zwq/Q60xaq
 YLbGpTOXOadzOqvtfFYp+E0gZQtEjCYFY6v3NIGcrkC2tFW6Wq0hcBcfQHa6dpXTP+SA
 T0Q8gByOfXWCcdIHorB4R+J//gmsIO71ppP+sY54hLa2wCFq6WPsGtxLR41+Cv11KeCw
 tL8Q==
X-Gm-Message-State: AC+VfDz4El5LNtprCCxHXqLvpr0nQJ47gUT2BtPSEAqWIJzlyD63c22q
 YmiVQY3Lb+emmxPTbnys5SV7GVbAPbuCYijjFFE=
X-Google-Smtp-Source: ACHHUZ72omDAP2tVzavSEdwpr0WxpFBaVXHK5lScogxR+roRazIbyBnYOLCFig0K6ryu14qCghseHUEqDTVULbsC528=
X-Received: by 2002:a05:6102:3c1:b0:430:3aec:efb8 with SMTP id
 n1-20020a05610203c100b004303aecefb8mr5208847vsq.28.1684981045527; Wed, 24 May
 2023 19:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230520054510.68822-1-philmd@linaro.org>
 <20230520054510.68822-4-philmd@linaro.org>
In-Reply-To: <20230520054510.68822-4-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 25 May 2023 12:16:59 +1000
Message-ID: <CAKmqyKMZiXJaBVECiv0RoHJvr3MkL-55kG-uLhA3nbU8Xyzy0Q@mail.gmail.com>
Subject: Re: [PATCH 3/5] hw/riscv/opentitan: Add TYPE_OPENTITAN_MACHINE
 definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
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

On Sat, May 20, 2023 at 3:46=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> QOM type names are usually defined as TYPE_FOO.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/riscv/opentitan.h | 2 ++
>  hw/riscv/opentitan.c         | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> index c40b05052a..fd70226ed8 100644
> --- a/include/hw/riscv/opentitan.h
> +++ b/include/hw/riscv/opentitan.h
> @@ -53,6 +53,8 @@ struct LowRISCIbexSoCState {
>      MemoryRegion flash_alias;
>  };
>
> +#define TYPE_OPENTITAN_MACHINE "opentitan"
> +
>  typedef struct OpenTitanState {
>      /*< private >*/
>      SysBusDevice parent_obj;
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 294955eeea..7d7159ea30 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -118,7 +118,7 @@ static void opentitan_machine_class_init(MachineClass=
 *mc)
>      mc->default_ram_size =3D ibex_memmap[IBEX_DEV_RAM].size;
>  }
>
> -DEFINE_MACHINE("opentitan", opentitan_machine_class_init)
> +DEFINE_MACHINE(TYPE_OPENTITAN_MACHINE, opentitan_machine_class_init)
>
>  static void lowrisc_ibex_soc_init(Object *obj)
>  {
> --
> 2.38.1
>
>

