Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jO7I2-0005kb-CS
	for mharc-qemu-riscv@gnu.org; Mon, 13 Apr 2020 18:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44802)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jO7Hy-0005gq-OT
 for qemu-riscv@nongnu.org; Mon, 13 Apr 2020 18:10:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jO7Hx-0004B8-KW
 for qemu-riscv@nongnu.org; Mon, 13 Apr 2020 18:10:46 -0400
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42]:42935)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jO7Hl-000492-8J; Mon, 13 Apr 2020 18:10:33 -0400
Received: by mail-vk1-xa42.google.com with SMTP id q7so2665428vkb.9;
 Mon, 13 Apr 2020 15:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yp3uRyXUbrr7K91bFkqtrR4DLr8WXPjvVNnCPGpgGQg=;
 b=dDJdDPg47GYhwoaf0VeWtQsObtsxM3ssPsRwKCQ7QQ7fiDkn8JrTFq49U5kkbdzme9
 Ka4MCRTMhdZwLGfofa+VkAFx688GuPlONs8XlBe2ILGUxr2H8SpFQecTqjHwmAJVg5+P
 CiYWwVyQgK7/ktpfhrI8QcUx1cvIJrLD6HYF46ZSkUyILjmKS+pAcPnQppuIyxE4Ub2C
 aZwkxQRDyzGTy7DENx/lyV97+P1V6mdVyiuzpP1MH8EMD03ZNYDSAmuFQH2xwsiORrr9
 G5hvhKyHlMlHWLWXTaG9OgAOItMKYZG9MyVYQpLIHSf0NS0F6hZlGoj8CSVr3XIfeh9S
 +9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yp3uRyXUbrr7K91bFkqtrR4DLr8WXPjvVNnCPGpgGQg=;
 b=K7fWpAEql+NimJeZxTGZ87nbUthevik8A6rRB86hG33fnQSfucHOE6kGz7cwwituEV
 yXybImSiopK39IrZ4BN0GOItFtDf9tS5ovffxrG4QH0di9n/0OI17tWkLcszTPD9bQU2
 ripYQMfw+XEBnHVzH87v3tg+QabO74fk8AyWABaot/4bzn9KMDMqMyAdP4fAbKgWskm6
 NS4DoTuVfDMKHZRMZra2g4/VZ50uajuuUFOG9bdO11pd+lyAIuNB2L7Mr+ab0PRj/aV5
 TUz5N1ZRpDVG1ye0imNetv+3YpcVtapbhxnmal1oscOfEkaqbJ/1Wi3ivyZfMrt75XjT
 sfqw==
X-Gm-Message-State: AGi0PuYIegpY14/bYVjfq57RyIm6HhUL3crze7ineowwM0FDp5N74PwJ
 qqMR9FxU2ZpUmRwY/0wzLFRGVnnjNaLd1o/TCck=
X-Google-Smtp-Source: APiQypL97HggeFJ4X/uff2PFl60r3VwDAqyPSwJ2rcbFBRTJBA3w9H2QlP3dadkXvQqxXYa6c0zez7NlUmGt7WDBHNE=
X-Received: by 2002:a1f:a090:: with SMTP id j138mr13057801vke.37.1586815832589; 
 Mon, 13 Apr 2020 15:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200412223619.11284-1-f4bug@amsat.org>
 <20200412223619.11284-14-f4bug@amsat.org>
In-Reply-To: <20200412223619.11284-14-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Apr 2020 15:02:16 -0700
Message-ID: <CAKmqyKPRM=BTEfFU5=UvN0QMr5K3LAUzTPgd-0wPbA5okaMq7A@mail.gmail.com>
Subject: Re: [PATCH-for-5.1 v3 13/24] hw/arm/stm32f205_soc: Move some code
 from realize() to init()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Andrew Jeffery <andrew@aj.id.au>, Wen Congyang <wencongyang2@huawei.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "open list:New World" <qemu-ppc@nongnu.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::a42
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Apr 2020 22:10:49 -0000

On Sun, Apr 12, 2020 at 3:42 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Coccinelle reported:
>
>   $ spatch ... --timeout 60 --sp-file \
>     scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>   HANDLING: ./hw/arm/stm32f205_soc.c
>   >>> possible moves from stm32f205_soc_initfn() to stm32f205_soc_realize=
() in ./hw/arm/stm32f205_soc.c:83
>
> Move the calls using &error_fatal which don't depend on input
> updated before realize() to init().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v3: Typo 'depend of' -> 'depend on' (eblake)
> ---
>  hw/arm/stm32f205_soc.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
> index 42f4e44134..76b0b0e9be 100644
> --- a/hw/arm/stm32f205_soc.c
> +++ b/hw/arm/stm32f205_soc.c
> @@ -49,6 +49,7 @@ static const int spi_irq[STM_NUM_SPIS] =3D {35, 36, 51}=
;
>  static void stm32f205_soc_initfn(Object *obj)
>  {
>      STM32F205State *s =3D STM32F205_SOC(obj);
> +    MemoryRegion *system_memory =3D get_system_memory();
>      int i;
>
>      sysbus_init_child_obj(obj, "armv7m", &s->armv7m, sizeof(s->armv7m),
> @@ -78,6 +79,14 @@ static void stm32f205_soc_initfn(Object *obj)
>          sysbus_init_child_obj(obj, "spi[*]", &s->spi[i], sizeof(s->spi[i=
]),
>                                TYPE_STM32F2XX_SPI);
>      }
> +
> +    memory_region_init_ram(&s->sram, NULL, "STM32F205.sram", SRAM_SIZE,
> +                           &error_fatal);
> +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sr=
am);
> +
> +    memory_region_init_rom(&s->flash, obj, "STM32F205.flash",
> +                           FLASH_SIZE, &error_fatal);
> +    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s->f=
lash);
>  }
>
>  static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
> @@ -87,19 +96,10 @@ static void stm32f205_soc_realize(DeviceState *dev_so=
c, Error **errp)
>      SysBusDevice *busdev;
>      Error *err =3D NULL;
>      int i;
> -    MemoryRegion *system_memory =3D get_system_memory();
>
> -    memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F205.flash"=
,
> -                           FLASH_SIZE, &error_fatal);
>      memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
>                               "STM32F205.flash.alias", &s->flash, 0, FLAS=
H_SIZE);
> -
> -    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s->f=
lash);
> -    memory_region_add_subregion(system_memory, 0, &s->flash_alias);
> -
> -    memory_region_init_ram(&s->sram, NULL, "STM32F205.sram", SRAM_SIZE,
> -                           &error_fatal);
> -    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sr=
am);
> +    memory_region_add_subregion(get_system_memory(), 0, &s->flash_alias)=
;
>
>      armv7m =3D DEVICE(&s->armv7m);
>      qdev_prop_set_uint32(armv7m, "num-irq", 96);
> --
> 2.21.1
>
>

