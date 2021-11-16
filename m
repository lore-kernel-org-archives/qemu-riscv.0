Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmun0-0005hF-4E
	for mharc-qemu-riscv@gnu.org; Tue, 16 Nov 2021 04:30:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmumy-0005f4-G5
 for qemu-riscv@nongnu.org; Tue, 16 Nov 2021 04:30:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmumw-00014K-3x
 for qemu-riscv@nongnu.org; Tue, 16 Nov 2021 04:30:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637055001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LCl8U/D/Pa48qIvfVxZX4rYcYvDhz3Xjr1zYmbJqQjc=;
 b=YOC+wiSKIBFOO6+VOvtRJHOxCzBXKF2vnKTsmwZCKUpMMlDO3jp4uhz1nejRrTo35kY9Se
 5MRDyCeO1DM3wLE7bpNn0DskqIJSDL3o/gx/8pBvDmTWhZKNM83lskf0TqOvMaC33oCFnL
 LuHNwDnxH0Xpk3W1VYp6UbTngjAlFPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-4yDtXnA-PsayCco88Ft6cQ-1; Tue, 16 Nov 2021 04:29:56 -0500
X-MC-Unique: 4yDtXnA-PsayCco88Ft6cQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DF911023F55;
 Tue, 16 Nov 2021 09:29:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6DA05D6BA;
 Tue, 16 Nov 2021 09:29:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A7AFA11380A7; Tue, 16 Nov 2021 10:29:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>,
 <peter.maydell@linaro.org>,  <bin.meng@windriver.com>,
 <mark.cave-ayland@ilande.co.uk>,  <sundeep.lkml@gmail.com>,
 <qemu-block@nongnu.org>,  <andrew.smirnov@gmail.com>,
 <hskinnemoen@google.com>,  <joel@jms.id.au>,  <atar4qemu@gmail.com>,
 <alistair@alistair23.me>,  <b.galvani@gmail.com>,
 <nieklinnenbank@gmail.com>,  <qemu-arm@nongnu.org>,  <kwolf@redhat.com>,
 <qemu-riscv@nongnu.org>,  <andrew@aj.id.au>,
 <Andrew.Baumann@microsoft.com>,  <jcd@tribudubois.net>,
 <kfting@nuvoton.com>,  <hreitz@redhat.com>,  <palmer@dabbelt.com>
Subject: Re: [PATCH RFC 2/2] hw: Replace drive_get_next() by drive_get()
References: <20211115125536.3341681-1-armbru@redhat.com>
 <20211115125536.3341681-3-armbru@redhat.com>
 <5b799ad5-a552-454f-dcc7-1ea6de22b397@amsat.org>
 <87lf1pfm2z.fsf@dusky.pond.sub.org>
 <39b908d3-57aa-ab1e-f10a-87afd887a341@kaod.org>
Date: Tue, 16 Nov 2021 10:29:49 +0100
In-Reply-To: <39b908d3-57aa-ab1e-f10a-87afd887a341@kaod.org>
 (=?utf-8?Q?=22C=C3=A9dric?= Le
 Goater"'s message of "Tue, 16 Nov 2021 09:52:35 +0100")
Message-ID: <87h7ccbg8i.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 16 Nov 2021 09:30:04 -0000

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 11/15/21 16:57, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>=20
>>> On 11/15/21 13:55, Markus Armbruster wrote:
>>>> drive_get_next() is basically a bad idea.  It returns the "next" block
>>>> backend of a certain interface type.  "Next" means bus=3D0,unit=3DN, w=
here
>>>> subsequent calls count N up from zero, per interface type.
>>>>
>>>> This lets you define unit numbers implicitly by execution order.  If t=
he
>>>> order changes, or new calls appear "in the middle", unit numbers chang=
e.
>>>> ABI break.  Hard to spot in review.
>>>>
>>>> Explicit is better than implicit: use drive_get() directly.
>>>>
>>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>>> ---
>>>>   include/sysemu/blockdev.h           |  1 -
>>>>   blockdev.c                          | 10 ----------
>>>>   hw/arm/aspeed.c                     | 21 +++++++++++++--------
>>>>   hw/arm/cubieboard.c                 |  2 +-
>>>>   hw/arm/imx25_pdk.c                  |  2 +-
>>>>   hw/arm/integratorcp.c               |  2 +-
>>>>   hw/arm/mcimx6ul-evk.c               |  2 +-
>>>>   hw/arm/mcimx7d-sabre.c              |  2 +-
>>>>   hw/arm/msf2-som.c                   |  2 +-
>>>>   hw/arm/npcm7xx_boards.c             |  6 +++---
>>>>   hw/arm/orangepi.c                   |  2 +-
>>>>   hw/arm/raspi.c                      |  2 +-
>>>>   hw/arm/realview.c                   |  2 +-
>>>>   hw/arm/sabrelite.c                  |  2 +-
>>>>   hw/arm/versatilepb.c                |  4 ++--
>>>>   hw/arm/vexpress.c                   |  6 +++---
>>>>   hw/arm/xilinx_zynq.c                | 16 +++++++++-------
>>>>   hw/arm/xlnx-versal-virt.c           |  3 ++-
>>>>   hw/arm/xlnx-zcu102.c                |  6 +++---
>>>>   hw/microblaze/petalogix_ml605_mmu.c |  2 +-
>>>>   hw/misc/sifive_u_otp.c              |  2 +-
>>>>   hw/riscv/microchip_pfsoc.c          |  2 +-
>>>>   hw/sparc64/niagara.c                |  2 +-
>>>>   23 files changed, 49 insertions(+), 52 deletions(-)
>>>
>>>> @@ -435,11 +438,13 @@ static void aspeed_machine_init(MachineState *ma=
chine)
>>>>       }
>>>>         for (i =3D 0; i < bmc->soc.sdhci.num_slots; i++) {
>>>> -        sdhci_attach_drive(&bmc->soc.sdhci.slots[i], drive_get_next(I=
F_SD));
>>>> +        sdhci_attach_drive(&bmc->soc.sdhci.slots[i],
>>>> +                           drive_get(IF_SD, 0, i));
>>>
>>> If we put SD on bus #0, ...
>>>
>>>>       }
>>>>         if (bmc->soc.emmc.num_slots) {
>>>> -        sdhci_attach_drive(&bmc->soc.emmc.slots[0], drive_get_next(IF=
_SD));
>>>> +        sdhci_attach_drive(&bmc->soc.emmc.slots[0],
>>>> +                           drive_get(IF_SD, 0, bmc->soc.sdhci.num_slo=
ts));
>>>
>>> ... we'd want to put eMMC on bus #1
>>
>> Using separate buses for different kinds of devices would be neater, but
>> it also would be an incompatible change.  This patch keeps existing
>> bus/unit numbers working.  drive_get_next() can only use bus 0.
>
> All Aspeed SoCs have 3 SPI busses, each with multiple CS, and also multip=
le
> sdhci controllers with multiple slots.
>
> How drives are defined for the aspeed machines can/should be improved.
> The machine init iterates on the command line drives, attaches the
> DriveInfo, in the order found, to a m25p80 device model first and then
> follows on with the SD devices. This is fragile clearly and a bus+id
> would be most welcome to identify the drive backend.
>
> May be this is a prereq for this patchset ?

Such a change will probably be easier to review after this patch,
because then it's just a matter of changing / dumbing down parameters to
drive_get().

I can't judge whether incompatible change is okay here.


