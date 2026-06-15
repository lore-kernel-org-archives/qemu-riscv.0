Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FDCCD98DA
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 11:54:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZ5st-0007AK-4z; Mon, 15 Jun 2026 07:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZ5ss-0007A5-Cp
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 07:53:42 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZ5sq-000793-Mc
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 07:53:42 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-693c69b97e7so2837626a12.2
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 04:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781524419; cv=none;
 d=google.com; s=arc-20240605;
 b=AlD/YPhSaIF9NNqWuxwBp7y0g1mj5OilAT/SJU5ihmEA92vDBGRTxcb7P/Jy/Ti9U2
 bWsw3I+44ZHdFBHrf7iybBEQokLRwjZjIVa5Ac834Wib1VFhkfJkOmI1LiluCzamp+UF
 mq+RyX/QZ5c1O4nR+L46Rgc6Zht89Xy/ILyaA73BqwNRO0z2rUKGkVBCsIAQGrprfp1U
 H3ig+NVYxkBXXMkJ8gUld+NdL2524d8Wc+JAyS5cHkLsCCgZWHTZv8bbF9WFCSHTebxG
 pek587yM3dVZUP5f/qSIa36rmuRGOdXkqxZHoDzHFKG+qBcbR1JPtD7FKsWq6mYxjOKJ
 LnfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=irQGXNvX1c+hVsVW90WSq0r6lTfshMZUx1ief8C4dz4=;
 fh=MSISyaxE46FuVc5KruAuIeNtxv2Ig4TqGN4ZHkzBy6M=;
 b=h6yIkVoDUtHRzQCeetUtUdsj38l6072naFzhIEaXvNtPmaY7K2ckO580DhmqCii2x9
 J7FPD8QmY3IVwCOdoiXJgeL3AzAqi8tYPn/b6C/X14bbAlIVrw4FR010CIiZF0gwetPE
 ZlrobeihtTZU7GgE5akVjSmD0369DtPOj80aEnKWq6uY+8TsxUcOsxx1OpUS6EC4D3I0
 Kg1+LV50E2YACdyVAvbsT0CetZknr66TdVjdgH2z2R2d5K/Z4Elmbm9aXpvcq7E5H6E3
 B+X5HHVQmP2++QDW9tV7ML+lNwsk3k9EwM5Bl81iSIbR/ALBXJe0QRGTaWvMtV2+0vuh
 o2Sg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781524419; x=1782129219; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=irQGXNvX1c+hVsVW90WSq0r6lTfshMZUx1ief8C4dz4=;
 b=D1AghSwNaOaKneE4KqQ0LN/hNDY5c9VZiO+FHD26ENZ3x0Can2S6iuTSa80PtWHpUP
 Xru1vm5rdkXqPkgYpKbTH48C2qqYYboZGMOrzoazRhUFlsaNdJAMzYwX6RSx9p3iWJKm
 Vie6CzffiHCGrAxjDma1sw68BuUg0+tg+YwoRjYpV9txUzcro4dDUb3rJJ+HHgeuNZck
 FliIQXs+rQZ4Z0HfM/vfOe4ciSdFC8Nki6QExyiXjlPxBjRtk5KEVGKiE704thCQFHuM
 lmpm+Et4SU4v5KYF6j8KrTkf8AKVhegSyi0r747nJbymZkBd6gHXUH1j2LMavJB98Ncl
 v99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781524419; x=1782129219;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=irQGXNvX1c+hVsVW90WSq0r6lTfshMZUx1ief8C4dz4=;
 b=Zm61ExDTi2Dra6ILWe0G67Zct0KYQdTn9l24KFFkDB+vwB9vPb/Klti4e7HPaErhI5
 REje+MZQ21pV20cwbqOVF50wHqRQnoXzKS7UzKQfyFE0E6RVzG7dYXCv0phj4ED8+hst
 YdVS2NR0FC5xExlvaxNKS3Ds4jBrVx3uPvWjQ77NElzrOp1MjjBLqES9Jud7xq5OfFrt
 HYOE7yL+/7OWJJ0Cp2Kj4FU4isvAOQ5JjOBCIRptBynn2YHM6DWbcEFWt8aejZphyWSm
 8QEJryU12Ocs+mFV+oGrLyd/xwJWyU1UvqmbUKtyEH4ut/NkANZzwyo4W+Oi7iJF0mCv
 jrMg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+rHKSTX/OwCKNpMZyoFHW0z6fcx+up+yhrDONaBmr0hbFPpx5QSdNXGDnAH1P5HTCmNVQS1l+ONzmV@nongnu.org
X-Gm-Message-State: AOJu0YzDt3ijh4gSKPn0kEVeHq4jf7GU8HOgVtF7s8YlxjKfvSIZARiy
 p41tWpauRmRkFceWnzfCpOvhmYMnuF/+Mek5yMgYUXG+EdlWEZIFylCOeqmkFEOb6Gvu8thtlb5
 JPQk0fL+n31pMavlhNmMngWf8QoFz6/c=
X-Gm-Gg: Acq92OFydQHYrOvdroOKtgFsxyz2R9pC4kZeyE9hUUHlq2NFR1KyqgJnIZidWWjF+hJ
 VHeOX4QuQp+tgq3RxzflCdJTVcUCRXo9RoSJVSGEgLmdvIEEfHCnFf9fM1zgb3bguNvq9FxO8WQ
 bniBTZN8rVhKAEAJeBHG3a4GwlioQoaiu5jdZHGQRWq3wWvZ+/GaJ50PW83YUKRnNMeK2RaEeC0
 04T1GJ1J1x5t0rT8Sw9EnLEwjD7WGBnAK0fQx682/7wCS5u+0F6Q8x78GkykExpskfMFYGPDBG6
 AfoPif5W
X-Received: by 2002:a05:6402:26d1:b0:67c:a6d1:c48b with SMTP id
 4fb4d7f45d1cf-693784f79a5mr6316417a12.11.1781524418788; Mon, 15 Jun 2026
 04:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260603065859.592063-1-joel@jms.id.au>
 <20260603065859.592063-13-joel@jms.id.au>
In-Reply-To: <20260603065859.592063-13-joel@jms.id.au>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Jun 2026 21:53:12 +1000
X-Gm-Features: AVVi8Cf2KJ7rXoWCtc7Q__CCytATdOJt-YFA8v5cFn1PAS99aEtx51k0FHONeaw
Message-ID: <CAKmqyKOYeG24747aN-OyOCFi-Knb3vc5E0FV2PM-FstCmf3Xgg@mail.gmail.com>
Subject: Re: [PATCH v8 12/12] hw/riscv/atlantis: Add some i2c peripherals
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
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x535.google.com
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
> Add an I2C RTC device and a temperature sensor. These are not present
> on the board but help for testing.

It might be best to leave this out, if these aren't on the board
should they really go upstream?

Alistair

>
> The tmp105 is a lm75 compatible temperature sensor used by the
> SENSORS_LM75 Linux kernel driver.
>
> The ds1338 is a RTC device that is used by the RTC_DRV_DS1307 Linux
> kernel driver.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/riscv/tt_atlantis.c | 27 +++++++++++++++++++++++++++
>  hw/riscv/Kconfig       |  2 ++
>  2 files changed, 29 insertions(+)
>
> diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
> index b1ff0cbe2f61..5434650dd41e 100644
> --- a/hw/riscv/tt_atlantis.c
> +++ b/hw/riscv/tt_atlantis.c
> @@ -63,6 +63,13 @@ static const MemMapEntry tt_atlantis_memmap[] =3D {
>      [TT_ATL_DDR_HI] =3D          { 0x100000000,  0x1000000000 },
>  };
>
> +static I2CBus *i2c_get_bus(TTAtlantisState *s, unsigned busnr)
> +{
> +    assert(busnr < TT_ATL_NUM_I2C);
> +
> +    return s->i2c[busnr].bus;
> +}
> +
>  static uint32_t next_phandle(void)
>  {
>      static uint32_t phandle =3D 1;
> @@ -367,6 +374,19 @@ static void create_fdt_i2c(void *fdt, const MemMapEn=
try *mem, uint32_t irq,
>      qemu_fdt_setprop_cell(fdt, name, "#size-cells", 0);
>  }
>
> +static void create_fdt_i2c_device(TTAtlantisState *s, int bus,
> +                                  const char *compat, int addr)
> +{
> +    void *fdt =3D MACHINE(s)->fdt;
> +    hwaddr base =3D s->memmap[TT_ATL_I2C0 + bus].base;
> +    g_autofree char *name =3D g_strdup_printf("/soc/i2c@%"HWADDR_PRIX"/s=
ensor@%x",
> +                                            base, addr);
> +
> +    qemu_fdt_add_subnode(fdt, name);
> +    qemu_fdt_setprop_string(fdt, name, "compatible", compat);
> +    qemu_fdt_setprop_cell(fdt, name, "reg", addr);
> +}
> +
>  static void finalize_fdt(TTAtlantisState *s)
>  {
>      uint32_t aplic_s_phandle =3D next_phandle();
> @@ -394,6 +414,9 @@ static void finalize_fdt(TTAtlantisState *s)
>                         TT_ATL_I2C0_IRQ + i,
>                         aplic_s_phandle, periph_clk_phandle);
>      }
> +
> +    create_fdt_i2c_device(s, 0, "dallas,ds1338", 0x6f);
> +    create_fdt_i2c_device(s, 4, "ti,tmp105", 0x48);
>  }
>
>  static void create_fdt(TTAtlantisState *s)
> @@ -640,6 +663,10 @@ static void tt_atlantis_machine_init(MachineState *m=
achine)
>                             qdev_get_gpio_in(s->irqchip, TT_ATL_I2C0_IRQ =
+ i));
>      }
>
> +    /* I2C peripherals: qemu specific */
> +    i2c_slave_create_simple(i2c_get_bus(s, 0), "ds1338", 0x6f);
> +    i2c_slave_create_simple(i2c_get_bus(s, 4), "tmp105", 0x48);
> +
>      /* Load or create device tree */
>      if (machine->dtb) {
>          load_fdt(s);
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 38180a903fbf..ff2d250ee439 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -130,6 +130,8 @@ config TENSTORRENT
>      select SERIAL_MM
>      select DEVICE_TREE
>      select DESIGNWARE_I2C
> +    select DS1338
> +    select TMP105
>
>  config XIANGSHAN_KUNMINGHU
>      bool
> --
> 2.47.3
>
>

