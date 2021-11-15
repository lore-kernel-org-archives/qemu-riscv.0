Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmcWd-0008Pv-7c
	for mharc-qemu-riscv@gnu.org; Mon, 15 Nov 2021 08:59:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmcWb-0008P1-Qr; Mon, 15 Nov 2021 08:59:57 -0500
Received: from [2a00:1450:4864:20::42a] (port=46895
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmcWZ-0007fw-VZ; Mon, 15 Nov 2021 08:59:57 -0500
Received: by mail-wr1-x42a.google.com with SMTP id u1so30910779wru.13;
 Mon, 15 Nov 2021 05:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vaj/3uTZGSNhF1Z2VfOfqJusUbdCarifgwLV0njRbhE=;
 b=ETsYELfR6LIvbj5aCZlh7C5GlAzDRNORvKNIF1+dKYPC1wXc4BZcK+sALEXeEJDuCS
 7RIEWSe+5XzShDSb5yFpN2nDtXYp0rOI2mb2wv0Vw/asqjnn3i2on+ZVck3D0eKqOq2z
 c50TLBkxM9xvJk89DFcmwhKsi5DB3FPyEvpgYYN+VvdGoky3D+DBU8ritTU7kt1vo5Kq
 c9fjSep+OEULbDgDUrge45GvEuvFCwTitjjnZ7dzzsI/7fzp0SdwLCqgeu9XGv2TY9dA
 vQosvW0crGlc0fFhPCGl7poiB+rMBMpAEzDMn6mReRiQPjh0EUAAyHF7KriVueAl9R6C
 a5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vaj/3uTZGSNhF1Z2VfOfqJusUbdCarifgwLV0njRbhE=;
 b=xKfgbdcTBBGAyBnJoH8RDaVRs3xjoNhWQz7zsPV7z0ws4pgGmixmWqHauqgWXaQuvM
 sMFchuczfgZPdxv/3U3vJjsCAhEmtKvBtL7HgRZPXjZe5k00ZDb5oDaO6UqbHclCGEJ/
 4O1Bu/epJqyPBopJkjF8EuDlZa4fKeii1TGQrMa0fkWGhlD1Dp8wXNjEKQomB/Ib7koL
 qMCYzmLETtxOaobPflsJeqW1NcvrnT8LiaLx20G7lu4j/HHOcKRz874M+75rOMdCSYgc
 +xWVqLgKN1JFid0zoQdvnu+UqilvFspDw85oTgnSR4V8mLPT6QiI6yN2ph+e8Z69ia7o
 u9XQ==
X-Gm-Message-State: AOAM530Hbb8SaTLnxILHX8Ff+4CRcRJYcGbDfCFPcLAFyzmN5aJObNcy
 syYeExe8GiGF7GmNTJ6kyVk=
X-Google-Smtp-Source: ABdhPJzRAuQaO7OysuDytlhzBL7/ec70C+vzam8UJxw9uoh0/75iLJV4Nx5H7F48gVVN0Y7ZpqRNlQ==
X-Received: by 2002:a5d:6691:: with SMTP id l17mr47085485wru.227.1636984793625; 
 Mon, 15 Nov 2021 05:59:53 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c16sm14034565wrx.96.2021.11.15.05.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 05:59:52 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <5b799ad5-a552-454f-dcc7-1ea6de22b397@amsat.org>
Date: Mon, 15 Nov 2021 14:59:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH RFC 2/2] hw: Replace drive_get_next() by drive_get()
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, bin.meng@windriver.com,
 mark.cave-ayland@ilande.co.uk, sundeep.lkml@gmail.com,
 qemu-block@nongnu.org, andrew.smirnov@gmail.com, hskinnemoen@google.com,
 joel@jms.id.au, atar4qemu@gmail.com, alistair@alistair23.me,
 b.galvani@gmail.com, nieklinnenbank@gmail.com, qemu-arm@nongnu.org,
 clg@kaod.org, kwolf@redhat.com, qemu-riscv@nongnu.org, andrew@aj.id.au,
 Andrew.Baumann@microsoft.com, jcd@tribudubois.net, kfting@nuvoton.com,
 hreitz@redhat.com, palmer@dabbelt.com
References: <20211115125536.3341681-1-armbru@redhat.com>
 <20211115125536.3341681-3-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211115125536.3341681-3-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.278,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 15 Nov 2021 13:59:58 -0000

On 11/15/21 13:55, Markus Armbruster wrote:
> drive_get_next() is basically a bad idea.  It returns the "next" block
> backend of a certain interface type.  "Next" means bus=0,unit=N, where
> subsequent calls count N up from zero, per interface type.
> 
> This lets you define unit numbers implicitly by execution order.  If the
> order changes, or new calls appear "in the middle", unit numbers change.
> ABI break.  Hard to spot in review.
> 
> Explicit is better than implicit: use drive_get() directly.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/sysemu/blockdev.h           |  1 -
>  blockdev.c                          | 10 ----------
>  hw/arm/aspeed.c                     | 21 +++++++++++++--------
>  hw/arm/cubieboard.c                 |  2 +-
>  hw/arm/imx25_pdk.c                  |  2 +-
>  hw/arm/integratorcp.c               |  2 +-
>  hw/arm/mcimx6ul-evk.c               |  2 +-
>  hw/arm/mcimx7d-sabre.c              |  2 +-
>  hw/arm/msf2-som.c                   |  2 +-
>  hw/arm/npcm7xx_boards.c             |  6 +++---
>  hw/arm/orangepi.c                   |  2 +-
>  hw/arm/raspi.c                      |  2 +-
>  hw/arm/realview.c                   |  2 +-
>  hw/arm/sabrelite.c                  |  2 +-
>  hw/arm/versatilepb.c                |  4 ++--
>  hw/arm/vexpress.c                   |  6 +++---
>  hw/arm/xilinx_zynq.c                | 16 +++++++++-------
>  hw/arm/xlnx-versal-virt.c           |  3 ++-
>  hw/arm/xlnx-zcu102.c                |  6 +++---
>  hw/microblaze/petalogix_ml605_mmu.c |  2 +-
>  hw/misc/sifive_u_otp.c              |  2 +-
>  hw/riscv/microchip_pfsoc.c          |  2 +-
>  hw/sparc64/niagara.c                |  2 +-
>  23 files changed, 49 insertions(+), 52 deletions(-)

> @@ -435,11 +438,13 @@ static void aspeed_machine_init(MachineState *machine)
>      }
>  
>      for (i = 0; i < bmc->soc.sdhci.num_slots; i++) {
> -        sdhci_attach_drive(&bmc->soc.sdhci.slots[i], drive_get_next(IF_SD));
> +        sdhci_attach_drive(&bmc->soc.sdhci.slots[i],
> +                           drive_get(IF_SD, 0, i));

If we put SD on bus #0, ...

>      }
>  
>      if (bmc->soc.emmc.num_slots) {
> -        sdhci_attach_drive(&bmc->soc.emmc.slots[0], drive_get_next(IF_SD));
> +        sdhci_attach_drive(&bmc->soc.emmc.slots[0],
> +                           drive_get(IF_SD, 0, bmc->soc.sdhci.num_slots));

... we'd want to put eMMC on bus #1, but I see having eMMC cards on a
IF_SD bus as a bug, since these cards are soldered on the board.

> --- a/hw/arm/vexpress.c
> +++ b/hw/arm/vexpress.c
> @@ -625,7 +625,7 @@ static void vexpress_common_init(MachineState *machine)
>                            qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_WPROT));
>      qdev_connect_gpio_out_named(dev, "card-inserted", 0,
>                            qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_CARDIN));
> -    dinfo = drive_get_next(IF_SD);
> +    dinfo = drive_get(IF_SD, 0, 0);

Can we have one interface refactor per patch (IF_SD, IF_PFLASH, IF_MTD...)?

> @@ -657,7 +657,7 @@ static void vexpress_common_init(MachineState *machine)
>  
>      sysbus_create_simple("pl111", map[VE_CLCD], pic[14]);
>  
> -    dinfo = drive_get_next(IF_PFLASH);
> +    dinfo = drive_get(IF_PFLASH, 0, 0);

> -static inline void zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
> -                                         bool is_qspi)
> +static inline int zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
> +                                        bool is_qspi, int unit0)
>  {
> +    int unit = unit0;
>      DeviceState *dev;
>      SysBusDevice *busdev;
>      SSIBus *spi;
> @@ -156,7 +157,7 @@ static inline void zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
>          spi = (SSIBus *)qdev_get_child_bus(dev, bus_name);
>  
>          for (j = 0; j < num_ss; ++j) {
> -            DriveInfo *dinfo = drive_get_next(IF_MTD);
> +            DriveInfo *dinfo = drive_get(IF_MTD, 0, unit++);

> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index 3dc2b5e8ca..45eb19ab3b 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -190,7 +190,7 @@ static void xlnx_zcu102_init(MachineState *machine)
>          BusState *spi_bus;
>          DeviceState *flash_dev;
>          qemu_irq cs_line;
> -        DriveInfo *dinfo = drive_get_next(IF_MTD);
> +        DriveInfo *dinfo = drive_get(IF_MTD, 0, i);

If this is bus #0, ...

>          gchar *bus_name = g_strdup_printf("spi%d", i);
>  
>          spi_bus = qdev_get_child_bus(DEVICE(&s->soc), bus_name);
> @@ -212,7 +212,7 @@ static void xlnx_zcu102_init(MachineState *machine)
>          BusState *spi_bus;
>          DeviceState *flash_dev;
>          qemu_irq cs_line;
> -        DriveInfo *dinfo = drive_get_next(IF_MTD);
> +        DriveInfo *dinfo = drive_get(IF_MTD, 0, XLNX_ZYNQMP_NUM_SPIS + i);

... I'd expect we use bus #1 here (different connector on the board).

>          int bus = i / XLNX_ZYNQMP_NUM_QSPI_BUS_CS;
>          gchar *bus_name = g_strdup_printf("qspi%d", bus);

