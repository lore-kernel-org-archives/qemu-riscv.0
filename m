Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmxLs-0004np-Qb
	for mharc-qemu-riscv@gnu.org; Tue, 16 Nov 2021 07:14:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mmxLr-0004nF-KK; Tue, 16 Nov 2021 07:14:15 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:55397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mmxLp-0007Hm-Mh; Tue, 16 Nov 2021 07:14:15 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.129])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A2903CBD4E58;
 Tue, 16 Nov 2021 13:14:08 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 16 Nov
 2021 13:14:06 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001aa53b0e9-be97-48a3-aa81-70644c80001f,
 BFAEB7FE3C4E2C4D96001007C3BA12B7689A693E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 129.41.46.1
Message-ID: <f5336551-b29c-393f-4047-ed36a1b98f6f@kaod.org>
Date: Tue, 16 Nov 2021 13:14:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH RFC 2/2] hw: Replace drive_get_next() by drive_get()
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
CC: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>,
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
 <39b908d3-57aa-ab1e-f10a-87afd887a341@kaod.org>
 <87h7ccbg8i.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87h7ccbg8i.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: adf773a4-d0ae-418d-9518-bf619d4e356b
X-Ovh-Tracer-Id: 11569747445414136732
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfedvgdefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
X-List-Received-Date: Tue, 16 Nov 2021 12:14:16 -0000

On 11/16/21 10:29, Markus Armbruster wrote:
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> On 11/15/21 16:57, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>>
>>>> On 11/15/21 13:55, Markus Armbruster wrote:
>>>>> drive_get_next() is basically a bad idea.  It returns the "next" block
>>>>> backend of a certain interface type.  "Next" means bus=0,unit=N, where
>>>>> subsequent calls count N up from zero, per interface type.
>>>>>
>>>>> This lets you define unit numbers implicitly by execution order.  If the
>>>>> order changes, or new calls appear "in the middle", unit numbers change.
>>>>> ABI break.  Hard to spot in review.
>>>>>
>>>>> Explicit is better than implicit: use drive_get() directly.
>>>>>
>>>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>>>> ---
>>>>>    include/sysemu/blockdev.h           |  1 -
>>>>>    blockdev.c                          | 10 ----------
>>>>>    hw/arm/aspeed.c                     | 21 +++++++++++++--------
>>>>>    hw/arm/cubieboard.c                 |  2 +-
>>>>>    hw/arm/imx25_pdk.c                  |  2 +-
>>>>>    hw/arm/integratorcp.c               |  2 +-
>>>>>    hw/arm/mcimx6ul-evk.c               |  2 +-
>>>>>    hw/arm/mcimx7d-sabre.c              |  2 +-
>>>>>    hw/arm/msf2-som.c                   |  2 +-
>>>>>    hw/arm/npcm7xx_boards.c             |  6 +++---
>>>>>    hw/arm/orangepi.c                   |  2 +-
>>>>>    hw/arm/raspi.c                      |  2 +-
>>>>>    hw/arm/realview.c                   |  2 +-
>>>>>    hw/arm/sabrelite.c                  |  2 +-
>>>>>    hw/arm/versatilepb.c                |  4 ++--
>>>>>    hw/arm/vexpress.c                   |  6 +++---
>>>>>    hw/arm/xilinx_zynq.c                | 16 +++++++++-------
>>>>>    hw/arm/xlnx-versal-virt.c           |  3 ++-
>>>>>    hw/arm/xlnx-zcu102.c                |  6 +++---
>>>>>    hw/microblaze/petalogix_ml605_mmu.c |  2 +-
>>>>>    hw/misc/sifive_u_otp.c              |  2 +-
>>>>>    hw/riscv/microchip_pfsoc.c          |  2 +-
>>>>>    hw/sparc64/niagara.c                |  2 +-
>>>>>    23 files changed, 49 insertions(+), 52 deletions(-)
>>>>
>>>>> @@ -435,11 +438,13 @@ static void aspeed_machine_init(MachineState *machine)
>>>>>        }
>>>>>          for (i = 0; i < bmc->soc.sdhci.num_slots; i++) {
>>>>> -        sdhci_attach_drive(&bmc->soc.sdhci.slots[i], drive_get_next(IF_SD));
>>>>> +        sdhci_attach_drive(&bmc->soc.sdhci.slots[i],
>>>>> +                           drive_get(IF_SD, 0, i));
>>>>
>>>> If we put SD on bus #0, ...
>>>>
>>>>>        }
>>>>>          if (bmc->soc.emmc.num_slots) {
>>>>> -        sdhci_attach_drive(&bmc->soc.emmc.slots[0], drive_get_next(IF_SD));
>>>>> +        sdhci_attach_drive(&bmc->soc.emmc.slots[0],
>>>>> +                           drive_get(IF_SD, 0, bmc->soc.sdhci.num_slots));
>>>>
>>>> ... we'd want to put eMMC on bus #1
>>>
>>> Using separate buses for different kinds of devices would be neater, but
>>> it also would be an incompatible change.  This patch keeps existing
>>> bus/unit numbers working.  drive_get_next() can only use bus 0.
>>
>> All Aspeed SoCs have 3 SPI busses, each with multiple CS, and also multiple
>> sdhci controllers with multiple slots.
>>
>> How drives are defined for the aspeed machines can/should be improved.
>> The machine init iterates on the command line drives, attaches the
>> DriveInfo, in the order found, to a m25p80 device model first and then
>> follows on with the SD devices. This is fragile clearly and a bus+id
>> would be most welcome to identify the drive backend.
>>
>> May be this is a prereq for this patchset ?
> 
> Such a change will probably be easier to review after this patch,
> because then it's just a matter of changing / dumbing down parameters to
> drive_get().

ok.

> I can't judge whether incompatible change is okay here.

It looks ok to me since you are using the number of possible devices
of the previous controller as an offset for drive_get().

Thanks,

C.

