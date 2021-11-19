Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mo3aF-0003da-JO
	for mharc-qemu-riscv@gnu.org; Fri, 19 Nov 2021 08:05:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3a4-0003b2-6h; Fri, 19 Nov 2021 08:05:32 -0500
Received: from [2607:f8b0:4864:20::133] (port=43960
 helo=mail-il1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3a1-0003Tk-Hz; Fri, 19 Nov 2021 08:05:27 -0500
Received: by mail-il1-x133.google.com with SMTP id s14so10131597ilv.10;
 Fri, 19 Nov 2021 05:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CoqYXV2MKbJj7YZE3rDxpsTOo8HygkWpcdGEQ1UE9IY=;
 b=LL1ITD2IlILvp2qrTxmeHhUK74F6WhvMFGUYziBGGqTCEGPoXduXjW5YYBtlYme8fS
 xnQCuYGmlukaAjQ45kx+SrlmRVQKNVq+tn8hY+9xX1v+2bCNt+5s5xLk+KwTFoD21zEb
 /HdAgXtu+9oLH7Y27Tnn6ku1e1IEiKCfQ40ZUoctKMwlj9HdDUDfFzm6KveLpU/aRljL
 scc/3fuLj1by2MdhfBJrWJBn0NernJmfuzvH4E85aM1qRWsia7Hnxwabknugoys1AJos
 LwsuDTgsf1ZRFUYHckxanrZjFVqmDmgYCOab02yx4Uz470XZ0o0yoOe7Sa0IRUc3icRh
 RFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CoqYXV2MKbJj7YZE3rDxpsTOo8HygkWpcdGEQ1UE9IY=;
 b=D52Fb586ZEtciFUhSNMslwpZ8//QJcfalgJt167Us71hTzoPw553ZwoMquuNpXIkCA
 05RnjOUe+KJflVefQcAIbdTsRjaHNPG4WUCY5lfgeU5mYLSN+mBcg7ZbdRyO/wpVncer
 o79CB5PQ9ueWzOH8WjS3VrUDzS36aCpIx1zvQ0H2J/uD5aKgdCnm7WHagITM7BWwyvTF
 xw2HiqOTZpvEKA5ATFCBnntkn1+Ibx8rZ2fM39V7ZqsySBcbCfZwN0jIqRsStBybC8dt
 q2mTYhyQTRrkfMcunYIz1/7GAw25zu7mgaHdb8MjnMba7K98Altb07lKr9B9eavKiTDG
 rqHA==
X-Gm-Message-State: AOAM530co0Qty+ziwUPyhhmJPfKyHWZkIPbl8pa1PYIgElBFs1k/T+L4
 tooP0sIvxA5zatJ4yhKXwCTHCD5LymKWo8Y8nk4=
X-Google-Smtp-Source: ABdhPJwXONl0RLXi96MBcruIU03SCUcq6PuZFAix70jnprsWh/kNDvq2KwDnrrrjvX5dSf1d59+UJy6522oCfz/waVY=
X-Received: by 2002:a05:6e02:1bec:: with SMTP id
 y12mr4329689ilv.74.1637327119918; 
 Fri, 19 Nov 2021 05:05:19 -0800 (PST)
MIME-Version: 1.0
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-2-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-2-armbru@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Nov 2021 23:04:52 +1000
Message-ID: <CAKmqyKNMsvp4GBMznqHdP7JiTPBYsK4RnvBHP+EtjcWmhdeHvA@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] hw/sd/ssi-sd: Do not create SD card within
 controller's realize
To: Markus Armbruster <armbru@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 19 Nov 2021 13:05:39 -0000

On Thu, Nov 18, 2021 at 2:35 AM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> ssi_sd_realize() creates an "sd-card" device.  This is inappropriate,
> and marked FIXME.
>
> Move it to the boards that create these devices.  Prior art: commit
> eb4f566bbb for device "generic-sdhci", and commit 26c607b86b for
> device "pl181".
>
> The device remains not user-creatable, because its users should (and
> do) wire up its GPIO chip-select line.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Alistair Francis <Alistair.Francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-riscv@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/stellaris.c  | 15 ++++++++++++++-
>  hw/riscv/sifive_u.c | 13 ++++++++++++-
>  hw/sd/ssi-sd.c      | 29 +----------------------------
>  3 files changed, 27 insertions(+), 30 deletions(-)
>
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 78827ace6b..b6c8a5d609 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -10,6 +10,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/sysbus.h"
> +#include "hw/sd/sd.h"
>  #include "hw/ssi/ssi.h"
>  #include "hw/arm/boot.h"
>  #include "qemu/timer.h"
> @@ -1157,6 +1158,9 @@ static void stellaris_init(MachineState *ms, stella=
ris_board_info *board)
>              void *bus;
>              DeviceState *sddev;
>              DeviceState *ssddev;
> +            DriveInfo *dinfo;
> +            DeviceState *carddev;
> +            BlockBackend *blk;
>
>              /*
>               * Some boards have both an OLED controller and SD card conn=
ected to
> @@ -1221,8 +1225,17 @@ static void stellaris_init(MachineState *ms, stell=
aris_board_info *board)
>               *  - Make the ssd0323 OLED controller chipselect active-low
>               */
>              bus =3D qdev_get_child_bus(dev, "ssi");
> -
>              sddev =3D ssi_create_peripheral(bus, "ssi-sd");
> +
> +            dinfo =3D drive_get(IF_SD, 0, 0);
> +            blk =3D dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
> +            carddev =3D qdev_new(TYPE_SD_CARD);
> +            qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal)=
;
> +            qdev_prop_set_bit(carddev, "spi", true);
> +            qdev_realize_and_unref(carddev,
> +                                   qdev_get_child_bus(sddev, "sd-bus"),
> +                                   &error_fatal);
> +
>              ssddev =3D ssi_create_peripheral(bus, "ssd0323");
>              gpio_out[GPIO_D][0] =3D qemu_irq_split(
>                      qdev_get_gpio_in_named(sddev, SSI_GPIO_CS, 0),
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 589ae72a59..a4ecadaf12 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -46,6 +46,7 @@
>  #include "hw/char/serial.h"
>  #include "hw/cpu/cluster.h"
>  #include "hw/misc/unimp.h"
> +#include "hw/sd/sd.h"
>  #include "hw/ssi/ssi.h"
>  #include "target/riscv/cpu.h"
>  #include "hw/riscv/riscv_hart.h"
> @@ -536,7 +537,8 @@ static void sifive_u_machine_init(MachineState *machi=
ne)
>      uint32_t fdt_load_addr;
>      uint64_t kernel_entry;
>      DriveInfo *dinfo;
> -    DeviceState *flash_dev, *sd_dev;
> +    BlockBackend *blk;
> +    DeviceState *flash_dev, *sd_dev, *card_dev;
>      qemu_irq flash_cs, sd_cs;
>
>      /* Initialize SoC */
> @@ -686,6 +688,15 @@ static void sifive_u_machine_init(MachineState *mach=
ine)
>
>      sd_cs =3D qdev_get_gpio_in_named(sd_dev, SSI_GPIO_CS, 0);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.spi2), 1, sd_cs);
> +
> +    dinfo =3D drive_get(IF_SD, 0, 0);
> +    blk =3D dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
> +    card_dev =3D qdev_new(TYPE_SD_CARD);
> +    qdev_prop_set_drive_err(card_dev, "drive", blk, &error_fatal);
> +    qdev_prop_set_bit(card_dev, "spi", true);
> +    qdev_realize_and_unref(card_dev,
> +                           qdev_get_child_bus(sd_dev, "sd-bus"),
> +                           &error_fatal);
>  }
>
>  static bool sifive_u_machine_get_start_in_flash(Object *obj, Error **err=
p)
> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> index e60854eeef..167c03b780 100644
> --- a/hw/sd/ssi-sd.c
> +++ b/hw/sd/ssi-sd.c
> @@ -368,36 +368,9 @@ static const VMStateDescription vmstate_ssi_sd =3D {
>
>  static void ssi_sd_realize(SSIPeripheral *d, Error **errp)
>  {
> -    ERRP_GUARD();
>      ssi_sd_state *s =3D SSI_SD(d);
> -    DeviceState *carddev;
> -    DriveInfo *dinfo;
>
>      qbus_init(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS, DEVICE(d), "sd-b=
us");
> -
> -    /* Create and plug in the sd card */
> -    /* FIXME use a qdev drive property instead of drive_get_next() */
> -    dinfo =3D drive_get_next(IF_SD);
> -    carddev =3D qdev_new(TYPE_SD_CARD);
> -    if (dinfo) {
> -        if (!qdev_prop_set_drive_err(carddev, "drive",
> -                                     blk_by_legacy_dinfo(dinfo), errp)) =
{
> -            goto fail;
> -        }
> -    }
> -
> -    if (!object_property_set_bool(OBJECT(carddev), "spi", true, errp)) {
> -        goto fail;
> -    }
> -
> -    if (!qdev_realize_and_unref(carddev, BUS(&s->sdbus), errp)) {
> -        goto fail;
> -    }
> -
> -    return;
> -
> -fail:
> -    error_prepend(errp, "failed to init SD card: ");
>  }
>
>  static void ssi_sd_reset(DeviceState *dev)
> @@ -426,7 +399,7 @@ static void ssi_sd_class_init(ObjectClass *klass, voi=
d *data)
>      k->cs_polarity =3D SSI_CS_LOW;
>      dc->vmsd =3D &vmstate_ssi_sd;
>      dc->reset =3D ssi_sd_reset;
> -    /* Reason: init() method uses drive_get_next() */
> +    /* Reason: GPIO chip-select line should be wired up */
>      dc->user_creatable =3D false;
>  }
>
> --
> 2.31.1
>
>

