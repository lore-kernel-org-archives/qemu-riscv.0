Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6510C77B7C
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 May 2023 02:21:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q20am-0003J1-Hx; Wed, 24 May 2023 22:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q20ak-0003Hc-Pq; Wed, 24 May 2023 22:20:38 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q20aj-000142-5k; Wed, 24 May 2023 22:20:38 -0400
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-456e4f4ea83so9044e0c.3; 
 Wed, 24 May 2023 19:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684981234; x=1687573234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ffeMTynjXA7u9+bljpUT1IpC2UK15C9IOUz2SqnPQlU=;
 b=Z7COVXEeqzpS99g17WmaKd8JQptieAFDxo3aZtVj5YsOQYrEKFPfjpSdSgZarwb3gP
 k9MM4VRbqcJvkzBCJ29y6eXDRBH+k8ZJOVvLiHghlXYARp2qCDenhgqG2HKuYLboTS/E
 27thGs4fchoCCBuf1N7QrByxNPTeW9k6e7GVhQ5udW6XTbduompjL9W+Qb4JzU9kFZ5Q
 SuD5cRXZkduIGaUdvx9LPl5phqa+cCJ3QinAyDl6hXBEdcVSAkjXSxWKIIl6LYA9/2Oe
 n/NVVMx7lU3NF20ugL9SuO2jtPySywPPPPzXWhouzakxTUDUSF5r0dwK9PYyeEgLslzR
 KxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684981234; x=1687573234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ffeMTynjXA7u9+bljpUT1IpC2UK15C9IOUz2SqnPQlU=;
 b=Z4cB5aS2MeESEDUSgkHDU6ZqclyHI2pA3EJWbERxEoFzPXaAq9mLu/k9ws51ERbOME
 TblgvdgkJ2e3jZwYaUzMGCNfdbQsD+1/C2Bi8uxJ6vEeC4JSSMehODZmQLveKtWgCwxa
 JKea6LBgrXlr/hOrW1lP4OO9PRLKRQwWs23nNymhybfLLHXbgzV/I+f9qDcd7sHwBfLQ
 BM4soFY4Tf4+4Ro52Tqvjv/Xs+o4SuJnu5H6NeNanb0iaFrKZuWGowYNWuGzj/4KsAZR
 /TeznOPyDtrZqxL2938KZUguGw7gIgApJIhT2QlZ0h0iXTStgzqCRoyFbZM1rsIv3Udz
 Hg0Q==
X-Gm-Message-State: AC+VfDxrl4mENGISoUca875wwftQGm2qyu65bom7L26LWsd1S8rlPUlH
 PxTgQ//gmQhOpdR9w8yfupVV5DZK7fVO8DwnNYU=
X-Google-Smtp-Source: ACHHUZ6OIdOsGEiIOuXJKH8bek/y/Hd/3AHZjxQUZvoCWRsPaebiBQy9L8nmUL9GaxMZvRwrZhj2Fy2+BHXwT2VpXHo=
X-Received: by 2002:a67:f7cd:0:b0:439:72ae:f5e7 with SMTP id
 a13-20020a67f7cd000000b0043972aef5e7mr490560vsp.25.1684981234574; Wed, 24 May
 2023 19:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230520054510.68822-1-philmd@linaro.org>
 <20230520054510.68822-6-philmd@linaro.org>
In-Reply-To: <20230520054510.68822-6-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 25 May 2023 12:20:08 +1000
Message-ID: <CAKmqyKOSXWZm394M16CFEqFiQFo=+D5xEmwhorP=sCuohfoDMg@mail.gmail.com>
Subject: Re: [PATCH 5/5] hw/riscv/opentitan: Correct OpenTitanState parent
 type/size
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
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
> OpenTitanState is the 'machine' (or 'board') state: it isn't
> a SysBus device, but inherits from the MachineState type.
> Correct the instance size.
> Doing so we  avoid leaking an OpenTitanState pointer in
> opentitan_machine_init().
>
> Fixes: fe0fe4735e ("riscv: Initial commit of OpenTitan machine")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/riscv/opentitan.h | 3 ++-
>  hw/riscv/opentitan.c         | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> index 806ff73528..609473d07b 100644
> --- a/include/hw/riscv/opentitan.h
> +++ b/include/hw/riscv/opentitan.h
> @@ -55,10 +55,11 @@ struct LowRISCIbexSoCState {
>  };
>
>  #define TYPE_OPENTITAN_MACHINE MACHINE_TYPE_NAME("opentitan")
> +OBJECT_DECLARE_SIMPLE_TYPE(OpenTitanState, OPENTITAN_MACHINE)
>
>  typedef struct OpenTitanState {
>      /*< private >*/
> -    SysBusDevice parent_obj;
> +    MachineState parent_obj;
>
>      /*< public >*/
>      LowRISCIbexSoCState soc;
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 9535308197..6a2fcc4ade 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -78,8 +78,8 @@ static const MemMapEntry ibex_memmap[] =3D {
>  static void opentitan_machine_init(MachineState *machine)
>  {
>      MachineClass *mc =3D MACHINE_GET_CLASS(machine);
> +    OpenTitanState *s =3D OPENTITAN_MACHINE(machine);
>      const MemMapEntry *memmap =3D ibex_memmap;
> -    OpenTitanState *s =3D g_new0(OpenTitanState, 1);
>      MemoryRegion *sys_mem =3D get_system_memory();
>
>      if (machine->ram_size !=3D mc->default_ram_size) {
> @@ -330,6 +330,7 @@ static const TypeInfo open_titan_types[] =3D {
>      }, {
>          .name           =3D TYPE_OPENTITAN_MACHINE,
>          .parent         =3D TYPE_MACHINE,
> +        .instance_size  =3D sizeof(OpenTitanState),
>          .class_init     =3D opentitan_machine_class_init,
>      }
>  };
> --
> 2.38.1
>
>

