Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jO7V0-0003GZ-2v
	for mharc-qemu-riscv@gnu.org; Mon, 13 Apr 2020 18:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46571)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jO7Ux-0003AH-LQ
 for qemu-riscv@nongnu.org; Mon, 13 Apr 2020 18:24:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jO7Uw-0006Se-5Y
 for qemu-riscv@nongnu.org; Mon, 13 Apr 2020 18:24:11 -0400
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41]:46365)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jO7Uo-0006LT-5T; Mon, 13 Apr 2020 18:24:02 -0400
Received: by mail-vs1-xe41.google.com with SMTP id h189so6419400vsc.13;
 Mon, 13 Apr 2020 15:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=00mEsRo2bzgYeyCBB/qVfWiSej9R1kMUMqztNKgMU0c=;
 b=tOouTCBx3ptVp4gVS/cR4yrG1ApwoJGxTUAvngORUG1xwpH4Zt/ArgjRHeDa1UNLs1
 goDaT1DvP6lcia/czzXxmre84Ofz9X9LiQ9yZKpZRhCJwewq/BsFVP2FLOQ5xO5mRuvM
 iKYJ7Nd93hzzwe+I/JZ0uuCbjEgnydmCf+7T6TnRhWh4J/9/s4mIQMkchEhHKzaS7vGg
 1FPb8cpm3jXBz2LiuMpFCAlODXxaaKVy8pYA0M0Nj6yQlqYAMDQjVKW3Wej95sQP7oL/
 v/XRJzOITTKYmVv8OYw8NFYkFyMp/ClJJiaIZmhqdkTF/ffHlIv8iu8g6L6Fks1x5FB+
 7wyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=00mEsRo2bzgYeyCBB/qVfWiSej9R1kMUMqztNKgMU0c=;
 b=oRg/zAGAkxjBUkUqR9VPQdzuYILWfupz5Ffd+dgtKBTti+h8DJhPu4A/sP8Vz2GJoY
 pkeLbESd+VpCPc8MfU2uW2lKC/pQt7LAfbMT3lTh0qtGos9q5Be5UGL6geSqTmzUB+Fi
 y1hTho/uJs82Fyfa8+U8n6hDzwJ8weQTJw3BOOGMgqw8T5YlOqBeTR8UPfaOUgroh9DC
 uzqWWph6tjYGsgcSWZUFllRh11LvQ+fDNkc1Gha0VaVAcceqaPivmtP/h02B/XS/xPBt
 vXBPKVNHFAAp52mi5o9UWHjIxfJqwZ/XDGNEjFCVd7ms15DX4k52wVtzA8Qy5q4nupLY
 MhRA==
X-Gm-Message-State: AGi0PuZKJKaXLGQMW8BK2pyPEzSh12ipYmI33Fi/zZwhVR6HdF3sPdxn
 LAfHPQa7duhCbLGjoV2rl8YP4ppXXOMv7Q7miDA=
X-Google-Smtp-Source: APiQypKoywq6b1pEBAQfUIo3UnrjLUoL9DCM5vU/bXQs/8dzJPECdH7Nn36SLKXLGkuaarNZ6qObo28JgnX/63asziE=
X-Received: by 2002:a67:1b81:: with SMTP id
 b123mr13177867vsb.172.1586816640437; 
 Mon, 13 Apr 2020 15:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200412223619.11284-1-f4bug@amsat.org>
 <20200412223619.11284-24-f4bug@amsat.org>
In-Reply-To: <20200412223619.11284-24-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Apr 2020 15:15:43 -0700
Message-ID: <CAKmqyKMXQVr9jSjWy2ByJZh5_YNhFrn3We9rVP6iSWFF736CjA@mail.gmail.com>
Subject: Re: [PATCH-for-5.1 v3 23/24] hw/riscv/sifive_u: Move some code from
 realize() to init()
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
X-Received-From: 2607:f8b0:4864:20::e41
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
X-List-Received-Date: Mon, 13 Apr 2020 22:24:13 -0000

On Sun, Apr 12, 2020 at 3:48 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Coccinelle reported:
>
>   $ spatch ... --timeout 60 --sp-file \
>     scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>   HANDLING: ./hw/riscv/sifive_u.c
>   >>> possible moves from riscv_sifive_u_soc_init() to riscv_sifive_u_soc=
_realize() in ./hw/riscv/sifive_u.c:473
>
> Move the calls using &error_abort which don't depend on input
> updated before realize() to init().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v3: Typo 'depend of' -> 'depend on' (eblake)
> ---
>  hw/riscv/sifive_u.c | 42 ++++++++++++++++++++++--------------------
>  1 file changed, 22 insertions(+), 20 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 96177c1977..7bf1f30a35 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -406,6 +406,8 @@ static void riscv_sifive_u_init(MachineState *machine=
)
>  static void riscv_sifive_u_soc_init(Object *obj)
>  {
>      MachineState *ms =3D MACHINE(qdev_get_machine());
> +    const struct MemmapEntry *memmap =3D sifive_u_memmap;
> +    MemoryRegion *system_memory =3D get_system_memory();
>      SiFiveUSoCState *s =3D RISCV_U_SOC(obj);
>
>      object_initialize_child(obj, "e-cluster", &s->e_cluster,
> @@ -443,6 +445,26 @@ static void riscv_sifive_u_soc_init(Object *obj)
>                            TYPE_CADENCE_GEM);
>      object_property_set_int(OBJECT(&s->gem), GEM_REVISION, "revision",
>                              &error_abort);
> +
> +    /* boot rom */
> +    memory_region_init_rom(&s->mask_rom, obj, "riscv.sifive.u.mrom",
> +                           memmap[SIFIVE_U_MROM].size, &error_fatal);
> +    memory_region_add_subregion(system_memory, memmap[SIFIVE_U_MROM].bas=
e,
> +                                &s->mask_rom);
> +
> +    /*
> +     * Add L2-LIM at reset size.
> +     * This should be reduced in size as the L2 Cache Controller WayEnab=
le
> +     * register is incremented. Unfortunately I don't see a nice (or any=
) way
> +     * to handle reducing or blocking out the L2 LIM while still allowin=
g it
> +     * be re returned to all enabled after a reset. For the time being, =
just
> +     * leave it enabled all the time. This won't break anything, but wil=
l be
> +     * too generous to misbehaving guests.
> +     */
> +    memory_region_init_ram(&s->l2lim_mem, NULL, "riscv.sifive.u.l2lim",
> +                           memmap[SIFIVE_U_L2LIM].size, &error_fatal);
> +    memory_region_add_subregion(system_memory, memmap[SIFIVE_U_L2LIM].ba=
se,
> +                                &s->l2lim_mem);
>  }
>
>  static bool sifive_u_get_start_in_flash(Object *obj, Error **errp)
> @@ -500,26 +522,6 @@ static void riscv_sifive_u_soc_realize(DeviceState *=
dev, Error **errp)
>      object_property_set_bool(OBJECT(&s->u_cluster), true, "realized",
>                               &error_abort);
>
> -    /* boot rom */
> -    memory_region_init_rom(&s->mask_rom, OBJECT(dev), "riscv.sifive.u.mr=
om",
> -                           memmap[SIFIVE_U_MROM].size, &error_fatal);
> -    memory_region_add_subregion(system_memory, memmap[SIFIVE_U_MROM].bas=
e,
> -                                &s->mask_rom);
> -
> -    /*
> -     * Add L2-LIM at reset size.
> -     * This should be reduced in size as the L2 Cache Controller WayEnab=
le
> -     * register is incremented. Unfortunately I don't see a nice (or any=
) way
> -     * to handle reducing or blocking out the L2 LIM while still allowin=
g it
> -     * be re returned to all enabled after a reset. For the time being, =
just
> -     * leave it enabled all the time. This won't break anything, but wil=
l be
> -     * too generous to misbehaving guests.
> -     */
> -    memory_region_init_ram(&s->l2lim_mem, NULL, "riscv.sifive.u.l2lim",
> -                           memmap[SIFIVE_U_L2LIM].size, &error_fatal);
> -    memory_region_add_subregion(system_memory, memmap[SIFIVE_U_L2LIM].ba=
se,
> -                                &s->l2lim_mem);
> -
>      /* create PLIC hart topology configuration string */
>      plic_hart_config_len =3D (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1) *
>                             ms->smp.cpus;
> --
> 2.21.1
>
>

