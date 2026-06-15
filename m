Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2D8CD98C7
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 11:51:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZ5qb-0006Kb-Cv; Mon, 15 Jun 2026 07:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZ5qX-0006Jl-G1
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 07:51:17 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZ5qV-0006gl-KG
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 07:51:17 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-68d23430690so5943528a12.3
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 04:51:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781524274; cv=none;
 d=google.com; s=arc-20240605;
 b=i5NrazoZLsUMHCFUqs16hG6EFU0YCQBgrl8lovCVF/x/C4J2Uetuwa6S5zul9ZrDug
 yG8g1J0s1d/pLjMjGzMvVZ1JcLtrKOEr4XDWfUR6M9R5p53dtpideBYREADjjtJ4qe8H
 UGsLqJPECc8jU0cN3lFqabkvFy53ukGBMU24g+CBPwtGfTBHe3CfZKyI759k3nLNrlNP
 I5y/yg8CXgve00uxSwt28kLJXJLEZ1TuF/Xpioig9d6aIy5EtW4B114iqS9OErusUl+p
 A5n8OE8cxhcqsXz1NWUpEE3DVSpXgn4SkVyLVg+L+jEkeunyjb6UNAdZGUvVWwoZPq3c
 0okg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=o8ITxXPVAXJIl7DYU1ZGSTuJwscSmRvrE+T7BLiEatQ=;
 fh=MKWeYI/Tw7JYuQKbgBXjlniYn6vztlQFVEUHQqInXMo=;
 b=klB7b0BCAZJ37GN9cnpFzse1+oP3WnYcrFpv7Dete2IJ6dBZS3ZYIcOnk4CFNrmYJ4
 IxoyQSygNEvjTAo/FYo/QLvKVCh7apc0TrWs5C3j1FWRfzk1HHdWXD6Em/rOaqApA8P2
 C1iEOcrYpAytSUvMdBJyacdEzJzRmBEYXLsuVA9z+ykncHup5JwJoGAyWhDw8LJuAgf5
 nBRC/T0F3xuZPQ2HA3Fhc4siWi4jFDSQk/uhUZxj3Rg3NjYcBoGAavhs7nKJOJHMIFUK
 KoV9V5vcQqxWwcj8ghsXV13ibIPpj9L6DtTZNf81III7EPKBVqe88xNSDs9/GXx3pe6j
 gTTw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781524274; x=1782129074; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o8ITxXPVAXJIl7DYU1ZGSTuJwscSmRvrE+T7BLiEatQ=;
 b=sy7A89SD4ppMpKXpiiFNmIXxTyeSHxr2BGkLiUbhUOpqtQF53Ho5/WeVOyaTV/3TFL
 Zp1dyx7X4nrwvL7gAjooeG0YBS8myQMdu8VO+GbbWzZaRUdT8GOoEKWwC4PPpPCHXsZz
 otIzFJFiY00G0sFhG+Sq7jq5ESJ//dmrgyvgJVqwuEB0ykRWzUxalmrZwH9WjZMhAhSf
 nuaZht3TUJlfssMRJGfTBt5+Z5O1m2SlbBjJwymxQn1xsBu2t8s9dCnDSEvoX/Z3d46G
 EiX5LsRV9rvWXviNJbyXvPCQ/mLridRulidTmv1MP6669baELGMZYHVI9rGMr27lXLUM
 SSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781524274; x=1782129074;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o8ITxXPVAXJIl7DYU1ZGSTuJwscSmRvrE+T7BLiEatQ=;
 b=I8zGwmqEacJyBDZHi1C/PvYtUwGMo/iY0/meLFWvFGRaYRGjIUOQQhCd24LhZahbxQ
 Bqulilb7btgTp/UoZNdciiqwzEG40rIUQ8TSx82zexJ+EaFMjhP/W0phLHrsWYh51b61
 Cno88vzF9whM4aNZuvi9TWcsNSR1LEvwOsCy4j1m/YrC48mS4+DCJeIgkQO/fFJEPRjq
 1sGaYg+0Am/UEuzhWkx/rNxSbeke24zwA5RLaVZj1WTZWJgMlJ+tj3LocahMkTMT1R1K
 wMUe4H6nn9KHZVOUvMUzsXmvbZVNy3YkDEdvEKoFcTrX/yqlorB/O2KFWtv8+5Qz08Ks
 HHfQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8jN6JFdvalyPtL64Y9WkKCUR2l0wKe6sSFmPpyYJiZbS3zYFehrZOKgaI7jnT4mSIozQXTKzpRvHGD@nongnu.org
X-Gm-Message-State: AOJu0YyvQ/hAvMYuqYlyA0fqvqX3sy+s6z8+zsFl4m/6UwFtsm3ovANh
 1H3oxNX6RuWRhumqQ+e1qMWBBPFFaPQdMSkh0a35Ok9Q3KXqVXjupiGv7phsbzAUz7YQg2PinKn
 iyGVq2IDay3QvF3Y9GvVXudSN3kq7kSk=
X-Gm-Gg: Acq92OHHrqLEAR2w6gSuNloKg0Z379Er2ZXjYSVLmq6hos7yfXq3IZRJOiatDdlXgkj
 YqJCh7uHKNuppl8QI5AUluCuvBYhOKzzhguz00ithFvDIAgO2pGRQdJiOEM6zAUdc4q2Cb3IUzD
 1lm7yfYYY1JM/IORDOYMvM/NKAwdSEXVLcBdjhtZHKQFYqGdIdAREY4+4U5Aay/uCBTOs3ePp2q
 Wc89FTSK+es4BlWHq1IEhbgKG4M9B+oufrfmHH6OwJ8WGu/BkLYEkw6FAjpQ37tmYJ0i8k45qrp
 l0CBIvXY
X-Received: by 2002:a05:6402:4496:b0:691:52e1:646 with SMTP id
 4fb4d7f45d1cf-693c6a6af35mr4034562a12.18.1781524274021; Mon, 15 Jun 2026
 04:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260603065859.592063-1-joel@jms.id.au>
 <20260603065859.592063-12-joel@jms.id.au>
In-Reply-To: <20260603065859.592063-12-joel@jms.id.au>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Jun 2026 21:50:46 +1000
X-Gm-Features: AVVi8Cd4Z5hoiOLfbSTM3T5mJ_azApCWKfSXkUAfBEwTi8duNM8rfTXPK-cBLW4
Message-ID: <CAKmqyKMeMhkUD_uhCXTtXXNJ2fEJNJqQYvuEpYmbWn9D-ubM_w@mail.gmail.com>
Subject: Re: [PATCH v8 11/12] hw/riscv/atlantis: Integrate i2c controllers
To: Joel Stanley <joel@jms.id.au>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Nicholas Piggin <npiggin@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 Michael Ellerman <mpe@kernel.org>, Joel Stanley <jms@oss.tenstorrent.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52d.google.com
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

On Wed, Jun 3, 2026 at 5:03=E2=80=AFPM Joel Stanley <joel@jms.id.au> wrote:
>
> Add DesignWare I2C controllers to the tt-atlantis machine.
>
> Provide a fixed clock in the device tree so that the Linux driver probes
> without WARNing.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/riscv/tt_atlantis.h | 14 ++++++++
>  hw/riscv/tt_atlantis.c         | 59 ++++++++++++++++++++++++++++++++++
>  hw/riscv/Kconfig               |  1 +
>  3 files changed, 74 insertions(+)
>
> diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlanti=
s.h
> index a17732ce8114..7f7d4a5a5905 100644
> --- a/include/hw/riscv/tt_atlantis.h
> +++ b/include/hw/riscv/tt_atlantis.h
> @@ -11,12 +11,15 @@
>
>  #include "hw/core/boards.h"
>  #include "hw/core/sysbus.h"
> +#include "hw/i2c/designware_i2c.h"
>  #include "hw/intc/riscv_imsic.h"
>  #include "hw/riscv/riscv_hart.h"
>
>  #define TYPE_TT_ATLANTIS_MACHINE MACHINE_TYPE_NAME("tt-atlantis")
>  OBJECT_DECLARE_SIMPLE_TYPE(TTAtlantisState, TT_ATLANTIS_MACHINE)
>
> +#define TT_ATL_NUM_I2C 5
> +
>  struct TTAtlantisState {
>      /*< private >*/
>      MachineState parent;
> @@ -27,11 +30,17 @@ struct TTAtlantisState {
>
>      RISCVHartArrayState soc;
>      DeviceState *irqchip;
> +    DesignWareI2CState i2c[TT_ATL_NUM_I2C];
>
>      int fdt_size;
>  };
>
>  enum {
> +    TT_ATL_I2C0_IRQ =3D 33,
> +    TT_ATL_I2C1_IRQ =3D 34,
> +    TT_ATL_I2C2_IRQ =3D 35,
> +    TT_ATL_I2C3_IRQ =3D 36,
> +    TT_ATL_I2C4_IRQ =3D 37,
>      TT_ATL_UART1_IRQ =3D 39,
>  };
>
> @@ -40,6 +49,11 @@ enum {
>      TT_ATL_BOOTROM,
>      TT_ATL_DDR_LO,
>      TT_ATL_DDR_HI,
> +    TT_ATL_I2C0,
> +    TT_ATL_I2C1,
> +    TT_ATL_I2C2,
> +    TT_ATL_I2C3,
> +    TT_ATL_I2C4,
>      TT_ATL_MAPLIC,
>      TT_ATL_MIMSIC,
>      TT_ATL_SAPLIC,
> diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
> index 5de138578b48..b1ff0cbe2f61 100644
> --- a/hw/riscv/tt_atlantis.c
> +++ b/hw/riscv/tt_atlantis.c
> @@ -53,6 +53,11 @@ static const MemMapEntry tt_atlantis_memmap[] =3D {
>      [TT_ATL_ACLINT] =3D           { 0xa2180000,       0x10000 },
>      [TT_ATL_SIMSIC] =3D           { 0xa4000000,      0x200000 },
>      [TT_ATL_MAPLIC] =3D           { 0xcc000000,     0x4000000 },
> +    [TT_ATL_I2C0] =3D             { 0xd4040000,       0x10000 },
> +    [TT_ATL_I2C1] =3D             { 0xd4050000,       0x10000 },
> +    [TT_ATL_I2C2] =3D             { 0xd4060000,       0x10000 },
> +    [TT_ATL_I2C3] =3D             { 0xd4070000,       0x10000 },
> +    [TT_ATL_I2C4] =3D             { 0xd4080000,       0x10000 },
>      [TT_ATL_UART1] =3D            { 0xd4110000,       0x10000 },
>      [TT_ATL_SAPLIC] =3D           { 0xe8000000,     0x4000000 },
>      [TT_ATL_DDR_HI] =3D          { 0x100000000,  0x1000000000 },
> @@ -333,10 +338,40 @@ static void create_fdt_rng(void *fdt)
>      qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_se=
ed));
>  }
>
> +static void create_fdt_clk(void *fdt, const char *clock_name,
> +                           uint32_t freq, uint32_t phandle)
> +{
> +    g_autofree char *name =3D g_strdup_printf("/clocks/%s", clock_name);
> +
> +    qemu_fdt_add_path(fdt, name);
> +    qemu_fdt_setprop_string(fdt, name, "compatible", "fixed-clock");
> +    qemu_fdt_setprop_string(fdt, name, "clock-output-names", clock_name)=
;
> +    qemu_fdt_setprop_cell(fdt, name, "#clock-cells", 0);
> +    qemu_fdt_setprop_cell(fdt, name, "clock-frequency", freq);
> +    qemu_fdt_setprop_cell(fdt, name, "phandle", phandle);
> +}
> +
> +static void create_fdt_i2c(void *fdt, const MemMapEntry *mem, uint32_t i=
rq,
> +                           uint32_t irqchip_phandle, uint32_t clk_phandl=
e)
> +{
> +    g_autofree char *name =3D g_strdup_printf("/soc/i2c@%"HWADDR_PRIX, m=
em->base);
> +
> +    qemu_fdt_add_subnode(fdt, name);
> +    qemu_fdt_setprop_string(fdt, name, "compatible", "snps,designware-i2=
c");
> +    qemu_fdt_setprop_sized_cells(fdt, name, "reg", 2, mem->base, 2, mem-=
>size);
> +    qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", irqchip_phandle=
);
> +    qemu_fdt_setprop_cells(fdt, name, "interrupts", irq, 0x4);
> +    qemu_fdt_setprop_cell(fdt, name, "clocks", clk_phandle);
> +    qemu_fdt_setprop_cell(fdt, name, "clock-frequency", 100000);
> +    qemu_fdt_setprop_cell(fdt, name, "#address-cells", 1);
> +    qemu_fdt_setprop_cell(fdt, name, "#size-cells", 0);
> +}
> +
>  static void finalize_fdt(TTAtlantisState *s)
>  {
>      uint32_t aplic_s_phandle =3D next_phandle();
>      uint32_t imsic_s_phandle =3D next_phandle();
> +    uint32_t periph_clk_phandle =3D next_phandle();
>      void *fdt =3D MACHINE(s)->fdt;
>
>      create_fdt_cpu(s, s->memmap, aplic_s_phandle, imsic_s_phandle);
> @@ -350,6 +385,15 @@ static void finalize_fdt(TTAtlantisState *s)
>
>      create_fdt_uart(fdt, &s->memmap[TT_ATL_UART1], TT_ATL_UART1_IRQ,
>                      aplic_s_phandle);
> +
> +    create_fdt_clk(fdt, "periph-clk", 100000000, periph_clk_phandle);
> +
> +    for (int i =3D 0; i < TT_ATL_NUM_I2C; i++) {
> +        create_fdt_i2c(fdt,
> +                       &s->memmap[TT_ATL_I2C0 + i],
> +                       TT_ATL_I2C0_IRQ + i,
> +                       aplic_s_phandle, periph_clk_phandle);
> +    }
>  }
>
>  static void create_fdt(TTAtlantisState *s)
> @@ -581,6 +625,21 @@ static void tt_atlantis_machine_init(MachineState *m=
achine)
>                                  s->memmap[TT_ATL_UART1].base,
>                                  s->memmap[TT_ATL_UART1].size);
>
> +    /* I2C */
> +    for (int i =3D 0; i < TT_ATL_NUM_I2C; i++) {
> +        SysBusDevice *sbd;
> +
> +        object_initialize_child(OBJECT(s), "i2c[*]", &s->i2c[i],
> +                                TYPE_DESIGNWARE_I2C);
> +        sbd =3D SYS_BUS_DEVICE(&s->i2c[i]);
> +        sysbus_realize(sbd, &error_fatal);
> +        memory_region_add_subregion(system_memory,
> +                                    s->memmap[TT_ATL_I2C0 + i].base,
> +                                    sysbus_mmio_get_region(sbd, 0));
> +        sysbus_connect_irq(sbd, 0,
> +                           qdev_get_gpio_in(s->irqchip, TT_ATL_I2C0_IRQ =
+ i));
> +    }
> +
>      /* Load or create device tree */
>      if (machine->dtb) {
>          load_fdt(s);
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index aaf029c9ed5e..38180a903fbf 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -129,6 +129,7 @@ config TENSTORRENT
>      select RISCV_IMSIC
>      select SERIAL_MM
>      select DEVICE_TREE
> +    select DESIGNWARE_I2C
>
>  config XIANGSHAN_KUNMINGHU
>      bool
> --
> 2.47.3
>
>

