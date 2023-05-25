Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CDDC77B7C
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 May 2023 02:19:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q20ZS-0002XK-K3; Wed, 24 May 2023 22:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q20ZQ-0002Wp-EF; Wed, 24 May 2023 22:19:16 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q20ZO-0000ay-PJ; Wed, 24 May 2023 22:19:16 -0400
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-4394a8f26d5so160106137.0; 
 Wed, 24 May 2023 19:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684981153; x=1687573153;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nxZlrl6twJy0DsgyEX9xo2n3qMoFuNKHuyfN+IPM1yw=;
 b=OswxONMvhimzIuUiZpkgDcTRBmygVbrTrSPdt7rPpjsAMuqDV57JfLn+UFE+1/T9oW
 bQ24MMpk/qgEbQbh/ATCRwuNuIUEOhI9t2+xq3VwCnRURECd0cyiS3kKCKNGg/iasCPT
 TKdt78v7RI/tcmakou1hYlCJ7xXkIND3DPM3EEDn+Uej8DUEL2iJW9Qu4WvKR5YgmYah
 41HrQjT2s5DZA9TpERcoRYJaPzVpIWaB/d4MdXHjbhWp2ybrOJlyPLhU7eNbTzLr8elw
 CiLgTwCwqISf3fct7XoLuQ5AwJBH+7Ip6IU863MUZzrLsOpZHTi2IyHQsHlEscC0apXA
 0S9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684981153; x=1687573153;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nxZlrl6twJy0DsgyEX9xo2n3qMoFuNKHuyfN+IPM1yw=;
 b=CD5t0kkDMjpMp0bmFAyMGeDYhplc61rtywvODI/1yVhXyp/uFW2jv0zYIb43lwA7K6
 RljBiZH+aWqDfUfuQ2w5UNmE1++K+3mVnc/aYkdue1HCXVMCfxetLwjGo1e566R/gaj6
 iH7yxw4aAKnQnEjzLfbUiLIC1UMScyP7m346/Q2Q7lp+o2s602s+YynKRBm1mEgUsRDW
 u0LpmVqrOs+mTrhk8jiqHn8IKDJma59z7IZcH3aFRooof07KL4xGGKgxmVjSAMu+nkI5
 UF9pSLf1I6jW7rQjsKf+Q3pNYMpVnlMzG8Io2aV0rE3JkGLUKcfRj8yAb7p19pi+ZbjD
 Wu3Q==
X-Gm-Message-State: AC+VfDzzCP3lkvhg0LQO/0epKEAXgt4iHROEX51lIUAMfxT44WEY4YHl
 A4QBF2uRxPwOY1wzW2pTkLkbI66ctGuOk4f7I0A=
X-Google-Smtp-Source: ACHHUZ7+CqheQqNU/1WAvMwEgrtQpH+fZlc2VrAE4WfW+4JYyxDwc9mD2My6jwfVZgxvcCuNHtew04wQVJu1AV0TTR0=
X-Received: by 2002:a67:f9d2:0:b0:437:e506:c1ab with SMTP id
 c18-20020a67f9d2000000b00437e506c1abmr5348479vsq.29.1684981153046; Wed, 24
 May 2023 19:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230520054510.68822-1-philmd@linaro.org>
 <20230520054510.68822-5-philmd@linaro.org>
In-Reply-To: <20230520054510.68822-5-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 25 May 2023 12:18:47 +1000
Message-ID: <CAKmqyKN0JxqNKK81ST2n+OKXt1oNHL-ncwiS5kkyrhWzMqNyng@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw/riscv/opentitan: Explicit machine type definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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
> Expand the DEFINE_MACHINE() macro, converting the class_init()
> handler.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/riscv/opentitan.h |  3 ++-
>  hw/riscv/opentitan.c         | 10 +++++++---
>  2 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> index fd70226ed8..806ff73528 100644
> --- a/include/hw/riscv/opentitan.h
> +++ b/include/hw/riscv/opentitan.h
> @@ -24,6 +24,7 @@
>  #include "hw/char/ibex_uart.h"
>  #include "hw/timer/ibex_timer.h"
>  #include "hw/ssi/ibex_spi_host.h"
> +#include "hw/boards.h"
>  #include "qom/object.h"
>
>  #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
> @@ -53,7 +54,7 @@ struct LowRISCIbexSoCState {
>      MemoryRegion flash_alias;
>  };
>
> -#define TYPE_OPENTITAN_MACHINE "opentitan"
> +#define TYPE_OPENTITAN_MACHINE MACHINE_TYPE_NAME("opentitan")
>
>  typedef struct OpenTitanState {
>      /*< private >*/
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 7d7159ea30..9535308197 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -108,8 +108,10 @@ static void opentitan_machine_init(MachineState *mac=
hine)
>      }
>  }
>
> -static void opentitan_machine_class_init(MachineClass *mc)
> +static void opentitan_machine_class_init(ObjectClass *oc, void *data)
>  {
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +
>      mc->desc =3D "RISC-V Board compatible with OpenTitan";
>      mc->init =3D opentitan_machine_init;
>      mc->max_cpus =3D 1;
> @@ -118,8 +120,6 @@ static void opentitan_machine_class_init(MachineClass=
 *mc)
>      mc->default_ram_size =3D ibex_memmap[IBEX_DEV_RAM].size;
>  }
>
> -DEFINE_MACHINE(TYPE_OPENTITAN_MACHINE, opentitan_machine_class_init)
> -
>  static void lowrisc_ibex_soc_init(Object *obj)
>  {
>      LowRISCIbexSoCState *s =3D RISCV_IBEX_SOC(obj);
> @@ -327,6 +327,10 @@ static const TypeInfo open_titan_types[] =3D {
>          .instance_size  =3D sizeof(LowRISCIbexSoCState),
>          .instance_init  =3D lowrisc_ibex_soc_init,
>          .class_init     =3D lowrisc_ibex_soc_class_init,
> +    }, {
> +        .name           =3D TYPE_OPENTITAN_MACHINE,
> +        .parent         =3D TYPE_MACHINE,
> +        .class_init     =3D opentitan_machine_class_init,
>      }
>  };
>
> --
> 2.38.1
>
>

