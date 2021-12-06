Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1muDDE-0001pR-IJ
	for mharc-qemu-riscv@gnu.org; Mon, 06 Dec 2021 07:35:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1muDD4-0001lZ-Aa
 for qemu-riscv@nongnu.org; Mon, 06 Dec 2021 07:35:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1muDCz-0003bB-BE
 for qemu-riscv@nongnu.org; Mon, 06 Dec 2021 07:35:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638794101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NUtrJqK3wUAMb5eiBVNGE5aHlgdymb6vCYIWJKCdnTw=;
 b=f0x5UE/z/DEGDCDrkhlZjDpPDr5v5oVfx8slKi4VT2ZEZQwH2gPXYt64WuLk9KE6WiVFB/
 6JKohL1gXg0gXd229Pe2K+lztlG88wqAK6nmpnY/9fFIQcunvmmE+OSOaZcePISxHpC7gh
 c6kbeNJxuQ7lTniVRP9Tvre5kifoYAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-Fw2eJf1SPqO-9RiMdOFL-w-1; Mon, 06 Dec 2021 07:34:58 -0500
X-MC-Unique: Fw2eJf1SPqO-9RiMdOFL-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58D9010168C3;
 Mon,  6 Dec 2021 12:34:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D56CD694BF;
 Mon,  6 Dec 2021 12:34:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 61FE1113865F; Mon,  6 Dec 2021 13:34:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
 qemu-riscv@nongnu.org,  qemu-block@nongnu.org,  Bin Meng
 <bin.meng@windriver.com>,  qemu-arm@nongnu.org,  Alistair Francis
 <Alistair.Francis@wdc.com>,  Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2 01/13] hw/sd/ssi-sd: Do not create SD card within
 controller's realize
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-2-armbru@redhat.com>
 <575fcf95-f4f0-3d88-ab08-b4d21f2da354@amsat.org>
Date: Mon, 06 Dec 2021 13:34:54 +0100
In-Reply-To: <575fcf95-f4f0-3d88-ab08-b4d21f2da354@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 17 Nov 2021 20:45:15
 +0100")
Message-ID: <87tufllxn5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 06 Dec 2021 12:35:14 -0000

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Hi Markus, Peter,
>
> On 11/17/21 17:33, Markus Armbruster wrote:
>> ssi_sd_realize() creates an "sd-card" device.  This is inappropriate,
>> and marked FIXME.
>>=20
>> Move it to the boards that create these devices.  Prior art: commit
>> eb4f566bbb for device "generic-sdhci", and commit 26c607b86b for
>> device "pl181".
>>=20
>> The device remains not user-creatable, because its users should (and
>> do) wire up its GPIO chip-select line.
>>=20
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Alistair Francis <Alistair.Francis@wdc.com>
>> Cc: Bin Meng <bin.meng@windriver.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>
>> Cc: qemu-arm@nongnu.org
>> Cc: qemu-riscv@nongnu.org
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
>> ---
>>  hw/arm/stellaris.c  | 15 ++++++++++++++-
>>  hw/riscv/sifive_u.c | 13 ++++++++++++-
>>  hw/sd/ssi-sd.c      | 29 +----------------------------
>>  3 files changed, 27 insertions(+), 30 deletions(-)
>>=20
>> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
>> index 78827ace6b..b6c8a5d609 100644
>> --- a/hw/arm/stellaris.c
>> +++ b/hw/arm/stellaris.c
>> @@ -10,6 +10,7 @@
>>  #include "qemu/osdep.h"
>>  #include "qapi/error.h"
>>  #include "hw/sysbus.h"
>> +#include "hw/sd/sd.h"
>>  #include "hw/ssi/ssi.h"
>>  #include "hw/arm/boot.h"
>>  #include "qemu/timer.h"
>> @@ -1157,6 +1158,9 @@ static void stellaris_init(MachineState *ms, stell=
aris_board_info *board)
>>              void *bus;
>>              DeviceState *sddev;
>>              DeviceState *ssddev;
>> +            DriveInfo *dinfo;
>> +            DeviceState *carddev;
>> +            BlockBackend *blk;
>> =20
>>              /*
>>               * Some boards have both an OLED controller and SD card con=
nected to
>> @@ -1221,8 +1225,17 @@ static void stellaris_init(MachineState *ms, stel=
laris_board_info *board)
>>               *  - Make the ssd0323 OLED controller chipselect active-lo=
w
>>               */
>>              bus =3D qdev_get_child_bus(dev, "ssi");
>> -
>>              sddev =3D ssi_create_peripheral(bus, "ssi-sd");
>> +
>> +            dinfo =3D drive_get(IF_SD, 0, 0);
>> +            blk =3D dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
>> +            carddev =3D qdev_new(TYPE_SD_CARD);
>> +            qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal=
);
>
> I guess a already asked this once but don't remember now... What is the
> point of creating a SD card without drive? Is this due to the old design
> issue we hotplug the drive to the SD card and not the SD card on the SD
> bus?

Device model "sd-card" implements BlockdevOps method change_media_cb().
This menas it models a device with a removable medium.  No drive behaves
like no medium.  I guess it's an SD card reader.

>
>> +            qdev_prop_set_bit(carddev, "spi", true);
>> +            qdev_realize_and_unref(carddev,
>> +                                   qdev_get_child_bus(sddev, "sd-bus"),
>> +                                   &error_fatal);
>> +


