Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mo3Xf-0001Jc-KZ
	for mharc-qemu-riscv@gnu.org; Fri, 19 Nov 2021 08:02:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3Xd-0001EM-Sq; Fri, 19 Nov 2021 08:02:57 -0500
Received: from [2607:f8b0:4864:20::135] (port=43944
 helo=mail-il1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3Xb-0002Kp-HN; Fri, 19 Nov 2021 08:02:57 -0500
Received: by mail-il1-x135.google.com with SMTP id s14so10124361ilv.10;
 Fri, 19 Nov 2021 05:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KLih65B6mQHyeOo4GGrCFNiDI4jDPAKBKS1NrCHFzB8=;
 b=AFWVSiBHtPttYLeOpQRSuX4pD255CiOqCA9/74ZQ2vxUS+iMHOPuz5oh7pFUozQpyE
 Bk5VjVbmN1AWuvxImzWf9l3KCIiez9xLFdGKrcs8qwlbDfX0v88k8x1sMCNgwN94SgE1
 wYEg+fxEHsyyFp2T4wYiJU8K0FHWNAWKeyMuvoWlmmEXvb1xUv3/yA/KWIx/YfTdJhF8
 dMsFUszOQ149aCV4Et7Dq6/jLQ7qSJzUQJ+bTr2Xoyaf+pvwZdl20AAeF7tECPLnPPUY
 LOZJtmeEHMgL9sdvhPVIcpBw8zD3QZ2vNLaPR+Z1HvFzngfTKVOcgOVOr08FC2C97/iA
 baRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KLih65B6mQHyeOo4GGrCFNiDI4jDPAKBKS1NrCHFzB8=;
 b=QibcQ3v0mxfKH1BpG+qyLBvJHuRJqui9Y4w6TI5vd/SbhvRI++G6gdyq/YW910m0pr
 qHYbBnezs6ASAaGxc7eP/XdqtK7mQYKJuNxGlJ5wQSU+/DE8x51Vx3D6TNY+tMvZCcJW
 OYiKhM5Kq/jVtRk2M37yflVXGIGX0VA6iFU7vgJS0jESzwWaxrE5kduDHYxSSgw3cDbQ
 KVeU0BtPzWsubiA4MXIyVSy7LVwTOw83Oa5YisauUMQYXwif1VmDnZKYtKo4aXGT6kGE
 ToV23t+RT9VMp2XGLx8/bhweYMyc0OBV279pO82Q17wbodjXISWUuCudLWFCsWhwObI4
 B/CQ==
X-Gm-Message-State: AOAM5308IPZ9eoHja62dMfXfXvlugH2gr9ahLwT+p7H8JyZtfpnnwaK3
 gZGQ9RFtVMxHuOABrigBIgzKVoLaalHFXZ5xb0w=
X-Google-Smtp-Source: ABdhPJwksB3LAV6TpN80FhTPeDBIgP4iiLaNntclDv6NFtI41m+VjK3ehD62QG/Ha+CvqVYiSXyrxeZ46+RLdL26rf8=
X-Received: by 2002:a92:cda2:: with SMTP id g2mr4678549ild.46.1637326973576;
 Fri, 19 Nov 2021 05:02:53 -0800 (PST)
MIME-Version: 1.0
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-3-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-3-armbru@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Nov 2021 23:02:26 +1000
Message-ID: <CAKmqyKNRQRJQgVEZyb7xOJkoaAn2aZsfo6eByXeHsGCQ9XWgkQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] hw: Replace trivial drive_get_next() by
 drive_get()
To: Markus Armbruster <armbru@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Bin Meng <bin.meng@windriver.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, 
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
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
X-List-Received-Date: Fri, 19 Nov 2021 13:02:58 -0000

On Thu, Nov 18, 2021 at 2:42 AM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> drive_get_next() is basically a bad idea.  It returns the "next" block
> backend of a certain interface type.  "Next" means bus=3D0,unit=3DN, wher=
e
> subsequent calls count N up from zero, per interface type.
>
> This lets you define unit numbers implicitly by execution order.  If the
> order changes, or new calls appear "in the middle", unit numbers change.
> ABI break.  Hard to spot in review.
>
> A number of machines connect just one backend with drive_get_next().
> Change them to use drive_get() directly.  This makes the (zero) unit
> number explicit in the code.
>
> Cc: Beniamino Galvani <b.galvani@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
> Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
> Cc: "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>
> Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
> Cc: Alistair Francis <Alistair.Francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Michael Tokarev <mjt@tls.msk.ru>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-riscv@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/cubieboard.c        | 2 +-
>  hw/arm/integratorcp.c      | 2 +-
>  hw/arm/msf2-som.c          | 2 +-
>  hw/arm/orangepi.c          | 2 +-
>  hw/arm/raspi.c             | 2 +-
>  hw/arm/realview.c          | 2 +-
>  hw/arm/sabrelite.c         | 2 +-
>  hw/misc/sifive_u_otp.c     | 2 +-
>  hw/riscv/microchip_pfsoc.c | 2 +-
>  hw/riscv/sifive_u.c        | 2 +-
>  hw/sparc64/niagara.c       | 2 +-
>  11 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
> index 294ba5de6e..5e3372a3c7 100644
> --- a/hw/arm/cubieboard.c
> +++ b/hw/arm/cubieboard.c
> @@ -81,7 +81,7 @@ static void cubieboard_init(MachineState *machine)
>      }
>
>      /* Retrieve SD bus */
> -    di =3D drive_get_next(IF_SD);
> +    di =3D drive_get(IF_SD, 0, 0);
>      blk =3D di ? blk_by_legacy_dinfo(di) : NULL;
>      bus =3D qdev_get_child_bus(DEVICE(a10), "sd-bus");
>
> diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
> index 16e8985953..b109ece3ae 100644
> --- a/hw/arm/integratorcp.c
> +++ b/hw/arm/integratorcp.c
> @@ -649,7 +649,7 @@ static void integratorcp_init(MachineState *machine)
>                            qdev_get_gpio_in_named(icp, ICP_GPIO_MMC_WPROT=
, 0));
>      qdev_connect_gpio_out_named(dev, "card-inserted", 0,
>                            qdev_get_gpio_in_named(icp, ICP_GPIO_MMC_CARDI=
N, 0));
> -    dinfo =3D drive_get_next(IF_SD);
> +    dinfo =3D drive_get(IF_SD, 0, 0);
>      if (dinfo) {
>          DeviceState *card;
>
> diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
> index 396e8b9913..d9f881690e 100644
> --- a/hw/arm/msf2-som.c
> +++ b/hw/arm/msf2-som.c
> @@ -45,7 +45,7 @@ static void emcraft_sf2_s2s010_init(MachineState *machi=
ne)
>      DeviceState *spi_flash;
>      MSF2State *soc;
>      MachineClass *mc =3D MACHINE_GET_CLASS(machine);
> -    DriveInfo *dinfo =3D drive_get_next(IF_MTD);
> +    DriveInfo *dinfo =3D drive_get(IF_MTD, 0, 0);
>      qemu_irq cs_line;
>      BusState *spi_bus;
>      MemoryRegion *sysmem =3D get_system_memory();
> diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
> index 0cf9895ce7..e796382236 100644
> --- a/hw/arm/orangepi.c
> +++ b/hw/arm/orangepi.c
> @@ -85,7 +85,7 @@ static void orangepi_init(MachineState *machine)
>      qdev_realize(DEVICE(h3), NULL, &error_abort);
>
>      /* Retrieve SD bus */
> -    di =3D drive_get_next(IF_SD);
> +    di =3D drive_get(IF_SD, 0, 0);
>      blk =3D di ? blk_by_legacy_dinfo(di) : NULL;
>      bus =3D qdev_get_child_bus(DEVICE(h3), "sd-bus");
>
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 146d35382b..b4dd6c1e99 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -284,7 +284,7 @@ static void raspi_machine_init(MachineState *machine)
>      qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
>
>      /* Create and plug in the SD cards */
> -    di =3D drive_get_next(IF_SD);
> +    di =3D drive_get(IF_SD, 0, 0);
>      blk =3D di ? blk_by_legacy_dinfo(di) : NULL;
>      bus =3D qdev_get_child_bus(DEVICE(&s->soc), "sd-bus");
>      if (bus =3D=3D NULL) {
> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> index 1c54316ba3..ddc70b54a5 100644
> --- a/hw/arm/realview.c
> +++ b/hw/arm/realview.c
> @@ -237,7 +237,7 @@ static void realview_init(MachineState *machine,
>          qemu_irq_invert(qdev_get_gpio_in(gpio2, 0)));
>      qdev_connect_gpio_out_named(dev, "card-read-only", 0, mmc_irq[0]);
>      qdev_connect_gpio_out_named(dev, "card-inserted", 0, mmc_irq[1]);
> -    dinfo =3D drive_get_next(IF_SD);
> +    dinfo =3D drive_get(IF_SD, 0, 0);
>      if (dinfo) {
>          DeviceState *card;
>
> diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
> index 553608e583..cce49aa25c 100644
> --- a/hw/arm/sabrelite.c
> +++ b/hw/arm/sabrelite.c
> @@ -76,7 +76,7 @@ static void sabrelite_init(MachineState *machine)
>              if (spi_bus) {
>                  DeviceState *flash_dev;
>                  qemu_irq cs_line;
> -                DriveInfo *dinfo =3D drive_get_next(IF_MTD);
> +                DriveInfo *dinfo =3D drive_get(IF_MTD, 0, 0);
>
>                  flash_dev =3D qdev_new("sst25vf016b");
>                  if (dinfo) {
> diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
> index 18aa0bd55d..5d5a8c8a90 100644
> --- a/hw/misc/sifive_u_otp.c
> +++ b/hw/misc/sifive_u_otp.c
> @@ -209,7 +209,7 @@ static void sifive_u_otp_realize(DeviceState *dev, Er=
ror **errp)
>                            TYPE_SIFIVE_U_OTP, SIFIVE_U_OTP_REG_SIZE);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
>
> -    dinfo =3D drive_get_next(IF_NONE);
> +    dinfo =3D drive_get(IF_NONE, 0, 0);
>      if (dinfo) {
>          int ret;
>          uint64_t perm;
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 57d779fb55..d1d065efbc 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -458,7 +458,7 @@ static void microchip_icicle_kit_machine_init(Machine=
State *machine)
>      target_ulong firmware_end_addr, kernel_start_addr;
>      uint64_t kernel_entry;
>      uint32_t fdt_load_addr;
> -    DriveInfo *dinfo =3D drive_get_next(IF_SD);
> +    DriveInfo *dinfo =3D drive_get(IF_SD, 0, 0);
>
>      /* Sanity check on RAM size */
>      if (machine->ram_size < mc->default_ram_size) {
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index a4ecadaf12..aa74e67889 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -672,7 +672,7 @@ static void sifive_u_machine_init(MachineState *machi=
ne)
>
>      /* Connect an SPI flash to SPI0 */
>      flash_dev =3D qdev_new("is25wp256");
> -    dinfo =3D drive_get_next(IF_MTD);
> +    dinfo =3D drive_get(IF_MTD, 0, 0);
>      if (dinfo) {
>          qdev_prop_set_drive_err(flash_dev, "drive",
>                                  blk_by_legacy_dinfo(dinfo),
> diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
> index f3e42d0326..ccad2c43a3 100644
> --- a/hw/sparc64/niagara.c
> +++ b/hw/sparc64/niagara.c
> @@ -98,7 +98,7 @@ static void add_rom_or_fail(const char *file, const hwa=
ddr addr)
>  static void niagara_init(MachineState *machine)
>  {
>      NiagaraBoardState *s =3D g_new(NiagaraBoardState, 1);
> -    DriveInfo *dinfo =3D drive_get_next(IF_PFLASH);
> +    DriveInfo *dinfo =3D drive_get(IF_PFLASH, 0, 0);
>      MemoryRegion *sysmem =3D get_system_memory();
>
>      /* init CPUs */
> --
> 2.31.1
>
>

