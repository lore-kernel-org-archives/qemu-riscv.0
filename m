Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF550CD98E4
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 03:08:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbV1U-0006fb-Eh; Sun, 21 Jun 2026 23:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbV1T-0006fM-CU
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 23:08:31 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbV1Q-0007ix-Lu
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 23:08:30 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-697763eeafcso2496672a12.3
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 20:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782097707; cv=none;
 d=google.com; s=arc-20240605;
 b=PUn31+ToRPf12abJsbh/R9aeY3BWH8JthWjD+/15Iap9YqZeEkmhl/E03YYrGewNvO
 Ti0lmtxKxi17rzhs5xGHchToCjltpyNWXxkbIzcOQmcUpHRBRAlviwqF7/C9YmiEdT+Z
 cf7uiyAUBaANdz5CYuhdM5+yT80JSVg76WfFry5pPCN15IkstH3IelPdeUttoOUJ0TuQ
 +GxipeUtamYzmC0wUWATJU6Ys4TT+37kjjuXVOu/Ed3l3Bg9ZGp3rG0EUvrj5Qe2jWph
 I9gL2ex7LqSwnuyX4odXWcmFre+8TDQg05pZQvpCIUkDG5cNK7JDSYUFewp1WJlSyRsu
 hGWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=pncSQEIlLQ0Rj1BcORGRv8Fy/DL6CzOrlm0xwdvMkGQ=;
 fh=E/ZNA/eJF2r5l5DLXfMFg7XkaEATFAtSlZ4D0cUeqdY=;
 b=S6HZLkPzaVyzgZMoKpV3JiIiDWo2FRTJfhuaUaYr3akEgL8hZHQrQVkJyEaXPPufhz
 xcRLLzmhHKLRz5OcHk0H1uBh55ihfeZGOR/Mh0GwQkRbSSlsugi1TjtFOVdXBiZBqQVC
 CC+C+lnuPRGRc6MosGzOD9N7kX2JL3zEljD2k2Yy+JKvpygSXgcjsOa9DHiNSdQ9uPZE
 6Q3eDS4Pjh7q5E2DnPHzST8dR3PcqyYGC2JSCaAXKi2unM+7kC6NBOHf+E6JkkmTtmFT
 YW4rTTHDRbAtbs6j9iv8G1Cp1XXb5YGh1njqOoReEWvz/60CadGFbGRlNkOyKPzpqZoR
 y7wg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782097707; x=1782702507; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pncSQEIlLQ0Rj1BcORGRv8Fy/DL6CzOrlm0xwdvMkGQ=;
 b=CHqM/Uj5bCuOW0KiTiSfbFU4BZhkNzUWeLGZOevzt5fJzv6JjKWS4dQObyUiBBo138
 NVopZpSHObQcfNnYvfP7Wf9IeCabZHAYtRiizmgX6sgSd3+IZkOzhRxD/onVuysprmlZ
 YAhVaCMKmwAtZbAWtdkVq53v71uYcZD0r5jbkwkaLy9LXKJPfp+9x7DQyoMmEF7To2Tc
 TJFS2Mmp3SQv1TWJhSVRCOEWo68P2s+yi6GTQzcW2okr7Jx3a7TnpR+OSDn1QjYhSdXz
 sbPYFClhHzDZZg20qZBNeQTd7yWXX6z3v14VC0I6uKl1PK0HHcLVViO2yzYoJ5oVQ8sZ
 EueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782097707; x=1782702507;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pncSQEIlLQ0Rj1BcORGRv8Fy/DL6CzOrlm0xwdvMkGQ=;
 b=gGdcWptgUt1fb4ZtIlPwV6yClPL5C0gxXmfvK4xk+c9l4CwODPCR/0FY1eIOvRwpXS
 cB6YYLgt6iuGB2CTU64gd+fvRpHScufNllGCme8uTAyltdP18qV3pvj16e4Kg74phZug
 79UF1Ot/vU0oWhHGcoNltkW+hAiPwE/k3flnCej/o0B4RzrBziRfZ3ja9X11h8Gs5fUn
 g/JNKdg7xv7vLAKo9M9gD2uhSdbVVg3QcPR10/6suJH4z5lvdQ27ffrkIXaNRQD+zv0d
 tnT0XPVWplfNVZlNQ4xRaO6W3tVH3z5Z3WftL36UOUYUVHKTO4G9rIdiNK6RNsVZT391
 tsFQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/ZnDzgRjpS8MkB0o0yb3ZrOS9cBNGHrVawwIOQFsEYyC0Q0SyTvNRhXIDy2BySWz/5OBN+cNGLYIfh@nongnu.org
X-Gm-Message-State: AOJu0YwJWovUbG9wQo4ISd4yndpPWTFLfoGvZsheFsy1jM0xVNla+6t3
 3R3tgepCKY48/U1w7xqpskUjuSWZlqiLxVGz98E1hYwRx5XrvgfUeL3sm/vmLYCpXqhYQoZsQ8H
 4tPlRI+k+u+FMjy5BUSQxsg1g2CcmV1g=
X-Gm-Gg: AfdE7cnGMMyuh8VcnMM0A4NJqh1zpHle0civza+jGSk1cJwJiE92IH5oVNYinEQyXgz
 5xa4wPE/8owW1cJjCw+X6Pb7CJRxkJ9Wm3nXue/2q0/kPIAYE8L5LqMiggNTLg3oxSdLXLC6ehd
 4bA86s/j9SYgVeYNihe2in/N9wMoxX+e/fx+oZCHfGuO6eZdvETewhBKOVjUtD2khcH36SS6pnD
 N+TjF9bBEuX91HaZVZJkQz3CTYBP13dLs90PcC4zC2Md4kDojtH/FekStlCIkOUkSbdzsNdtaQD
 0bRDrpt/CfHz147MOMq9K/NB6Bg=
X-Received: by 2002:a05:6402:5253:b0:697:96c2:b591 with SMTP id
 4fb4d7f45d1cf-69796c2c000mr1608348a12.11.1782097706663; Sun, 21 Jun 2026
 20:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260619044838.1054677-1-joel@jms.id.au>
 <20260619044838.1054677-13-joel@jms.id.au>
In-Reply-To: <20260619044838.1054677-13-joel@jms.id.au>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 13:08:00 +1000
X-Gm-Features: AVVi8CcTWzDnxdFOlNJCJHOy-hAGrK7CZiUGHT7Mpa3kl_vql1fp9BoIRDaa43U
Message-ID: <CAKmqyKNzcHh9emJdL7dSO2OhnMHoMqSUKJja-p+SLpqJoYJcFQ@mail.gmail.com>
Subject: Re: [PATCH v9 12/12] hw/riscv/atlantis: Add some i2c peripherals
To: Joel Stanley <joel@jms.id.au>
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Chris Rauer <crauer@google.com>, Alano Song <alanosong@163.com>,
 Michael Ellerman <mpe@kernel.org>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Nick Piggin <npiggin@gmail.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52e.google.com
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

On Fri, Jun 19, 2026 at 2:52=E2=80=AFPM Joel Stanley <joel@jms.id.au> wrote=
:
>
> Add an I2C RTC device and a temperature sensor. These are not present
> on the board but help for testing.
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

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/tt_atlantis.c | 27 +++++++++++++++++++++++++++
>  hw/riscv/Kconfig       |  2 ++
>  2 files changed, 29 insertions(+)
>
> diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
> index e6afd7627da8..9b64f26d2f76 100644
> --- a/hw/riscv/tt_atlantis.c
> +++ b/hw/riscv/tt_atlantis.c
> @@ -64,6 +64,13 @@ static const MemMapEntry tt_atlantis_memmap[] =3D {
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
>  static uint32_t fdt_phandle =3D 1;
>  static uint32_t next_phandle(void)
>  {
> @@ -309,6 +316,19 @@ static void create_fdt_i2c(void *fdt, const MemMapEn=
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
> @@ -336,6 +356,9 @@ static void finalize_fdt(TTAtlantisState *s)
>                         TT_ATL_I2C0_IRQ + i,
>                         aplic_s_phandle, periph_clk_phandle);
>      }
> +
> +    create_fdt_i2c_device(s, 0, "dallas,ds1338", 0x6f);
> +    create_fdt_i2c_device(s, 4, "ti,tmp105", 0x48);
>  }
>
>  static void create_fdt(TTAtlantisState *s)
> @@ -570,6 +593,10 @@ static void tt_atlantis_machine_init(MachineState *m=
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
> index dcce819bf6e9..de37c08caece 100644
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

