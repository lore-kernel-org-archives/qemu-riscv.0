Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmtBr-0004YU-Ls
	for mharc-qemu-riscv@gnu.org; Tue, 16 Nov 2021 02:47:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmtBo-0004UW-4t
 for qemu-riscv@nongnu.org; Tue, 16 Nov 2021 02:47:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmtBm-0000ip-8X
 for qemu-riscv@nongnu.org; Tue, 16 Nov 2021 02:47:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637048853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pej0BvoWZ3cp9gwa8IVAvA5/kRkXJWghrp9vqCi+qjM=;
 b=VG5xvcUx74EwdEN8mEosk5dzrxikRTMhr902IIRJ4673qYx6yHnyJ9GqIZf1rrx1LkWLZB
 cH3q9s0lL0du4/pCN1qmehcxO89CnDFm79w+6fpl0CoqlU6ImBmErGfdGKYLsaI15Hv7Am
 BscH2V1UFfiA9Ni2elFZEysck4wIoFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-_GEhH1P2NLmUV_UA_vjWtQ-1; Tue, 16 Nov 2021 02:47:28 -0500
X-MC-Unique: _GEhH1P2NLmUV_UA_vjWtQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DAD510168C6;
 Tue, 16 Nov 2021 07:47:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C00E75C1A1;
 Tue, 16 Nov 2021 07:47:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2790811380A7; Tue, 16 Nov 2021 08:47:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: peter.maydell@linaro.org,  bin.meng@windriver.com,
 mark.cave-ayland@ilande.co.uk,  qemu-devel@nongnu.org,
 jcd@tribudubois.net,  qemu-block@nongnu.org,  andrew.smirnov@gmail.com,
 hskinnemoen@google.com,  joel@jms.id.au,  atar4qemu@gmail.com,
 alistair@alistair23.me,  b.galvani@gmail.com,  nieklinnenbank@gmail.com,
 qemu-arm@nongnu.org,  clg@kaod.org,  kwolf@redhat.com,
 qemu-riscv@nongnu.org,  andrew@aj.id.au,  Andrew.Baumann@microsoft.com,
 sundeep.lkml@gmail.com,  kfting@nuvoton.com,  hreitz@redhat.com,
 palmer@dabbelt.com
Subject: Re: [PATCH RFC 2/2] hw: Replace drive_get_next() by drive_get()
References: <20211115125536.3341681-1-armbru@redhat.com>
 <20211115125536.3341681-3-armbru@redhat.com>
 <5b799ad5-a552-454f-dcc7-1ea6de22b397@amsat.org>
 <87lf1pfm2z.fsf@dusky.pond.sub.org>
 <b18519f7-7198-0965-a528-2d1a45c7c93c@amsat.org>
Date: Tue, 16 Nov 2021 08:47:22 +0100
In-Reply-To: <b18519f7-7198-0965-a528-2d1a45c7c93c@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 15 Nov 2021 22:15:12
 +0100")
Message-ID: <878rxoczjp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-List-Received-Date: Tue, 16 Nov 2021 07:47:36 -0000

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 11/15/21 16:57, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
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
>
>>>> @@ -435,11 +438,13 @@ static void aspeed_machine_init(MachineState *ma=
chine)
>>>>      }
>>>> =20
>>>>      for (i =3D 0; i < bmc->soc.sdhci.num_slots; i++) {
>>>> -        sdhci_attach_drive(&bmc->soc.sdhci.slots[i], drive_get_next(I=
F_SD));
>>>> +        sdhci_attach_drive(&bmc->soc.sdhci.slots[i],
>>>> +                           drive_get(IF_SD, 0, i));
>>>
>>> If we put SD on bus #0, ...
>>>
>>>>      }
>>>> =20
>>>>      if (bmc->soc.emmc.num_slots) {
>>>> -        sdhci_attach_drive(&bmc->soc.emmc.slots[0], drive_get_next(IF=
_SD));
>>>> +        sdhci_attach_drive(&bmc->soc.emmc.slots[0],
>>>> +                           drive_get(IF_SD, 0, bmc->soc.sdhci.num_slo=
ts));
>>>
>>> ... we'd want to put eMMC on bus #1
>>=20
>> Using separate buses for different kinds of devices would be neater, but
>> it also would be an incompatible change.  This patch keeps existing
>> bus/unit numbers working.  drive_get_next() can only use bus 0.
>>=20
>>>                                      but I see having eMMC cards on a
>>> IF_SD bus as a bug, since these cards are soldered on the board.
>>=20
>> IF_SD is not a bus, it's an "block interface type", which is really just
>> a user interface thing.
>
> Why are we discriminating by "block interface type" then?
>
> What is the difference between "block interfaces"? I see a block drive
> as a generic unit, usable on multiple hardware devices.
>
> I never really understood how this "block interface type" helps
> developers and users. I thought BlockInterfaceType and DriveInfo
> were legacy / deprecated APIs we want to get rid of; and we would
> come up with a replacement API using BlockDeviceInfo or providing
> a BlockFrontend state of the art object.
> Anyway, I suppose the explanation is buried in the git history
> before the last 8 years. I need to keep reading.

In the beginning (v0.4.2), there was -hda and -hdb, and life was simple.

Then there was -hdc, -hdd, -cdrom (v0.5.1), -fda, -fdb (v0.6.0),
-mtdblock, -sd, -pflash (v0.9.1).

All these options do two things: they create a block backend, and they
request the board to create a certain block frontend for it, similar to
other options of this vintage, like -serial, -parallel, and -net.
Boards generally ignore requests they don't understand, but that's just
sloppiness.

For each set of related options, there was a global variable holding the
requests: bs_table[] for -hda, -hdb, -hdc, -hdd, -cdrom; fd_table[]
-fda, -fdb; mtd_bdrv for -mtd; sd_drv for -ds; pflash_table[] for
-pflash.

The options replaced prior ones, except for -pflash, which appended to
its table.

bs_table[]'s index had a peculiar meaning: it's bus * MAX_IDE_DEVS +
unit.  This ensures that -hda (index 0) goes on IDE bus 0 as unit 0;
-hdb on bus 0, unit 1; -hdc on 1, 0; -hdc on 1, 1.

Life was now complicated enough for a generalization (v0.9.1), so there
was -drive (v0.9.1).  All the variables holding requests were fused into
drives_table[].  Table elements are identified by (type, bus, unit),
where type is an enum whose members correspond to the old global
variables: IF_IDE for bs_table[], IF_FLOPPY for fd_table[], and so
forth.  So:

    -hda becomes type =3D IF_IDE, bus =3D 0, unit =3D 0
    -hdb becomes type =3D IF_IDE, bus =3D 0, unit =3D 1
    ...
    -sd becomes type =3D IF_SD, bus =3D 0, unit =3D 0
    1st -pflash becomes type =3D IF_PFLASH, bus =3D 0, unit =3D 0
    2nd -pflash becomes type =3D IF_PFLASH, bus =3D 0, unit =3D 1
    ...

Other mappings from old to new global variables would have been
possible.  I figure this one was chosen because it comes with a
reasonable user interface.  Identifying block devices by (interface
type, bus, unit) is certainly nicer than by index in bs_table[].  Since
bus and/or unit make sense only with some interface types, they are
optional.

Things calmed down for a couple of years, until -device appeared
(v0.12).  Now we needed a way to define just a backend, without
requesting a frontend from the board.  Instead of inventing a new
option, this became IF_NONE, with meaningless bus and unit.

Over the next years, the block layer outgrew -drive's limited
capabilities to define frontends.  -blockdev appeard (v1.7.0) and
matured over several releases.  I don't remember exactly when it became
stable, relegating -drive if=3Dnone to legacy status.

What's *not* legacy is -drive with other interface types, simply because
there is no replacement.  Yet.  We clearly want one.

Questions?


