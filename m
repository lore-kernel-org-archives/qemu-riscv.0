Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmuD1-0002Pq-6y
	for mharc-qemu-riscv@gnu.org; Tue, 16 Nov 2021 03:52:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mmuCz-0002Ml-MK
 for qemu-riscv@nongnu.org; Tue, 16 Nov 2021 03:52:53 -0500
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:47597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mmuCv-0004NS-D6
 for qemu-riscv@nongnu.org; Tue, 16 Nov 2021 03:52:53 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.83])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 8676E21164;
 Tue, 16 Nov 2021 08:52:36 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 16 Nov
 2021 09:52:35 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002438fb881-263f-4874-bd42-dc49b64a6641,
 310E1383184C0BED186E98051F63AF21DB481FBB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <39b908d3-57aa-ab1e-f10a-87afd887a341@kaod.org>
Date: Tue, 16 Nov 2021 09:52:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH RFC 2/2] hw: Replace drive_get_next() by drive_get()
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
CC: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>,
 <bin.meng@windriver.com>, <mark.cave-ayland@ilande.co.uk>,
 <sundeep.lkml@gmail.com>, <qemu-block@nongnu.org>,
 <andrew.smirnov@gmail.com>, <hskinnemoen@google.com>, <joel@jms.id.au>,
 <atar4qemu@gmail.com>, <alistair@alistair23.me>, <b.galvani@gmail.com>,
 <nieklinnenbank@gmail.com>, <qemu-arm@nongnu.org>, <kwolf@redhat.com>,
 <qemu-riscv@nongnu.org>, <andrew@aj.id.au>, <Andrew.Baumann@microsoft.com>,
 <jcd@tribudubois.net>, <kfting@nuvoton.com>, <hreitz@redhat.com>,
 <palmer@dabbelt.com>
References: <20211115125536.3341681-1-armbru@redhat.com>
 <20211115125536.3341681-3-armbru@redhat.com>
 <5b799ad5-a552-454f-dcc7-1ea6de22b397@amsat.org>
 <87lf1pfm2z.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87lf1pfm2z.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0d4e6971-ec72-4ec5-92df-7c74c3da06dd
X-Ovh-Tracer-Id: 8166152024786176924
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfedugdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.446,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 16 Nov 2021 08:52:53 -0000

On 11/15/21 16:57, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> On 11/15/21 13:55, Markus Armbruster wrote:
>>> drive_get_next() is basically a bad idea.  It returns the "next" block
>>> backend of a certain interface type.  "Next" means bus=0,unit=N, where
>>> subsequent calls count N up from zero, per interface type.
>>>
>>> This lets you define unit numbers implicitly by execution order.  If the
>>> order changes, or new calls appear "in the middle", unit numbers change.
>>> ABI break.  Hard to spot in review.
>>>
>>> Explicit is better than implicit: use drive_get() directly.
>>>
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---
>>>   include/sysemu/blockdev.h           |  1 -
>>>   blockdev.c                          | 10 ----------
>>>   hw/arm/aspeed.c                     | 21 +++++++++++++--------
>>>   hw/arm/cubieboard.c                 |  2 +-
>>>   hw/arm/imx25_pdk.c                  |  2 +-
>>>   hw/arm/integratorcp.c               |  2 +-
>>>   hw/arm/mcimx6ul-evk.c               |  2 +-
>>>   hw/arm/mcimx7d-sabre.c              |  2 +-
>>>   hw/arm/msf2-som.c                   |  2 +-
>>>   hw/arm/npcm7xx_boards.c             |  6 +++---
>>>   hw/arm/orangepi.c                   |  2 +-
>>>   hw/arm/raspi.c                      |  2 +-
>>>   hw/arm/realview.c                   |  2 +-
>>>   hw/arm/sabrelite.c                  |  2 +-
>>>   hw/arm/versatilepb.c                |  4 ++--
>>>   hw/arm/vexpress.c                   |  6 +++---
>>>   hw/arm/xilinx_zynq.c                | 16 +++++++++-------
>>>   hw/arm/xlnx-versal-virt.c           |  3 ++-
>>>   hw/arm/xlnx-zcu102.c                |  6 +++---
>>>   hw/microblaze/petalogix_ml605_mmu.c |  2 +-
>>>   hw/misc/sifive_u_otp.c              |  2 +-
>>>   hw/riscv/microchip_pfsoc.c          |  2 +-
>>>   hw/sparc64/niagara.c                |  2 +-
>>>   23 files changed, 49 insertions(+), 52 deletions(-)
>>
>>> @@ -435,11 +438,13 @@ static void aspeed_machine_init(MachineState *machine)
>>>       }
>>>   
>>>       for (i = 0; i < bmc->soc.sdhci.num_slots; i++) {
>>> -        sdhci_attach_drive(&bmc->soc.sdhci.slots[i], drive_get_next(IF_SD));
>>> +        sdhci_attach_drive(&bmc->soc.sdhci.slots[i],
>>> +                           drive_get(IF_SD, 0, i));
>>
>> If we put SD on bus #0, ...
>>
>>>       }
>>>   
>>>       if (bmc->soc.emmc.num_slots) {
>>> -        sdhci_attach_drive(&bmc->soc.emmc.slots[0], drive_get_next(IF_SD));
>>> +        sdhci_attach_drive(&bmc->soc.emmc.slots[0],
>>> +                           drive_get(IF_SD, 0, bmc->soc.sdhci.num_slots));
>>
>> ... we'd want to put eMMC on bus #1
> 
> Using separate buses for different kinds of devices would be neater, but
> it also would be an incompatible change.  This patch keeps existing
> bus/unit numbers working.  drive_get_next() can only use bus 0.

All Aspeed SoCs have 3 SPI busses, each with multiple CS, and also multiple
sdhci controllers with multiple slots.

How drives are defined for the aspeed machines can/should be improved.
The machine init iterates on the command line drives, attaches the
DriveInfo, in the order found, to a m25p80 device model first and then
follows on with the SD devices. This is fragile clearly and a bus+id
would be most welcome to identify the drive backend.

May be this is a prereq for this patchset ?

Thanks,

C.


> 
>>                                       but I see having eMMC cards on a
>> IF_SD bus as a bug, since these cards are soldered on the board.
> 
> IF_SD is not a bus, it's an "block interface type", which is really just
> a user interface thing.
> 
>>> --- a/hw/arm/vexpress.c
>>> +++ b/hw/arm/vexpress.c
>>> @@ -625,7 +625,7 @@ static void vexpress_common_init(MachineState *machine)
>>>                             qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_WPROT));
>>>       qdev_connect_gpio_out_named(dev, "card-inserted", 0,
>>>                             qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_CARDIN));
>>> -    dinfo = drive_get_next(IF_SD);
>>> +    dinfo = drive_get(IF_SD, 0, 0);
>>
>> Can we have one interface refactor per patch (IF_SD, IF_PFLASH, IF_MTD...)?
> 
> Peter asked for one patch per "board/SoC model".  I'll do whatever helps
> reviewers.
> 
>>> @@ -657,7 +657,7 @@ static void vexpress_common_init(MachineState *machine)
>>>   
>>>       sysbus_create_simple("pl111", map[VE_CLCD], pic[14]);
>>>   
>>> -    dinfo = drive_get_next(IF_PFLASH);
>>> +    dinfo = drive_get(IF_PFLASH, 0, 0);
>>
>>> -static inline void zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
>>> -                                         bool is_qspi)
>>> +static inline int zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
>>> +                                        bool is_qspi, int unit0)
>>>   {
>>> +    int unit = unit0;
>>>       DeviceState *dev;
>>>       SysBusDevice *busdev;
>>>       SSIBus *spi;
>>> @@ -156,7 +157,7 @@ static inline void zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
>>>           spi = (SSIBus *)qdev_get_child_bus(dev, bus_name);
>>>   
>>>           for (j = 0; j < num_ss; ++j) {
>>> -            DriveInfo *dinfo = drive_get_next(IF_MTD);
>>> +            DriveInfo *dinfo = drive_get(IF_MTD, 0, unit++);
>>
>>> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
>>> index 3dc2b5e8ca..45eb19ab3b 100644
>>> --- a/hw/arm/xlnx-zcu102.c
>>> +++ b/hw/arm/xlnx-zcu102.c
>>> @@ -190,7 +190,7 @@ static void xlnx_zcu102_init(MachineState *machine)
>>>           BusState *spi_bus;
>>>           DeviceState *flash_dev;
>>>           qemu_irq cs_line;
>>> -        DriveInfo *dinfo = drive_get_next(IF_MTD);
>>> +        DriveInfo *dinfo = drive_get(IF_MTD, 0, i);
>>
>> If this is bus #0, ...
>>
>>>           gchar *bus_name = g_strdup_printf("spi%d", i);
>>>   
>>>           spi_bus = qdev_get_child_bus(DEVICE(&s->soc), bus_name);
>>> @@ -212,7 +212,7 @@ static void xlnx_zcu102_init(MachineState *machine)
>>>           BusState *spi_bus;
>>>           DeviceState *flash_dev;
>>>           qemu_irq cs_line;
>>> -        DriveInfo *dinfo = drive_get_next(IF_MTD);
>>> +        DriveInfo *dinfo = drive_get(IF_MTD, 0, XLNX_ZYNQMP_NUM_SPIS + i);
>>
>> ... I'd expect we use bus #1 here (different connector on the board).
> 
> See above.
> 
>>>           int bus = i / XLNX_ZYNQMP_NUM_QSPI_BUS_CS;
>>>           gchar *bus_name = g_strdup_printf("qspi%d", bus);
> 


