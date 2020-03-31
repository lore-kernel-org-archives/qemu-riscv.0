Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jJKHn-0001eq-LD
	for mharc-qemu-riscv@gnu.org; Tue, 31 Mar 2020 13:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46821)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jJKHl-0001eP-C7
 for qemu-riscv@nongnu.org; Tue, 31 Mar 2020 13:02:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jJKHj-00080U-Ha
 for qemu-riscv@nongnu.org; Tue, 31 Mar 2020 13:02:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36389
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jJKHj-000808-Dj
 for qemu-riscv@nongnu.org; Tue, 31 Mar 2020 13:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585674163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sSTIpBUhuW1l8WUYuT333335bgK+YqNtERpWuDFuBwM=;
 b=ErReSaoOheP/BzMNPmA59oVB8XA/i8PeSZjzSlY2mGZYL3wOLu9KkNYdFtlYOsM7XhWMUG
 V8EjHOA46TBOQc7LHs0iAZIRutV6jSj7Xdpfe71RNG1abKmKDxeoruyeCzjxRnBn5pBO8T
 +EDwWenTuQxenaeDqN+gX6vrehmyuJc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-roHtCJlfPFGUJ1Fly3J6Og-1; Tue, 31 Mar 2020 13:02:41 -0400
X-MC-Unique: roHtCJlfPFGUJ1Fly3J6Og-1
Received: by mail-ed1-f69.google.com with SMTP id i61so19106666edc.2
 for <qemu-riscv@nongnu.org>; Tue, 31 Mar 2020 10:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VxPUOgxhW5CqurI1DXhkKMNh+pzCFBxZDrmIuW5r3m8=;
 b=tDpypHVQ9H60D4VUATdImQiZMFVgWHnVXEN9VgB1GuWECXb4jwJZ4rOCjKn9Y9Hrvw
 /k/tsjxSork0uv3sc3mUeW20KoDEo5ZqmEyGwB+VNH/Yfebad4F+phA8JBgyT0KLfVcq
 b1xXg8RmnG+wC4U2nO51br8YugXLhccQbyibNaoIluLfPzs5wKCyhaFMMOWGbFuC6b/M
 sCvdfzDwmWhF9fuHelXIXWCEi+FBBAHcueJZLwqeOF1bfRibup2iA37+HKPdZ24Zxpo1
 zxLSiYfsQJGfCT3Uf+fGtMKbhWbHoGlkhl/9glkjv4n2XE7mi1+AHnEtD/0UBGE8SjaN
 Lg0Q==
X-Gm-Message-State: ANhLgQ0f+yzXyleQbNiXtiHT5096a/xDw3QfYWCZOHYCxPp4OkYSR0sb
 AF86/nX0Vf2UXMCGt4WoxCXEGYGzdJGTI1RINBdEpmCrL2l7/dqRmpvJ3OoeF8CIkYmI9M+1/w1
 Ypvx1jgZdbpeuywQ=
X-Received: by 2002:a05:6402:206e:: with SMTP id
 bd14mr17555604edb.308.1585674160005; 
 Tue, 31 Mar 2020 10:02:40 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvdHL6KZbUMvwUDu00Vj1kMBX6eZskEG00dPf+VXEPKj8SoXLJjW0o/x3V3HLZjj5qOd12c5A==
X-Received: by 2002:a05:6402:206e:: with SMTP id
 bd14mr17555541edb.308.1585674159661; 
 Tue, 31 Mar 2020 10:02:39 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id j19sm2247453ejx.75.2020.03.31.10.02.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2020 10:02:38 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 12/12] hw/riscv/sifive_u: Add missing
 error-propagation code
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, Paul Burton
 <pburton@wavecomp.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-arm <qemu-arm@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-13-f4bug@amsat.org>
 <CAFEAcA-26fHbOp5saM+XBCz72fzfz+=+xtiXGRtWnc6CMoiakA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e293f19c-7005-16f0-57df-55ce953fe0a4@redhat.com>
Date: Tue, 31 Mar 2020 19:02:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-26fHbOp5saM+XBCz72fzfz+=+xtiXGRtWnc6CMoiakA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Tue, 31 Mar 2020 17:02:47 -0000

On 3/26/20 10:55 PM, Peter Maydell wrote:
> On Wed, 25 Mar 2020 at 19:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>>
>> Running the coccinelle script produced:
>>
>>    $ spatch \
>>      --macro-file scripts/cocci-macro-file.h --include-headers \
>>      --sp-file scripts/coccinelle/object_property_missing_error_propagat=
e.cocci \
>>      --keep-comments --smpl-spacing --dir hw
>>
>>    [[manual check required: error_propagate() might be missing in object=
_property_set_bool() hw/riscv/sifive_u.c:558:4]]
>>    [[manual check required: error_propagate() might be missing in object=
_property_set_bool() hw/riscv/sifive_u.c:561:4]]
>>
>> Add the missing error_propagate() after manual review.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>   hw/riscv/sifive_u.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>> index 56351c4faa..01e44018cd 100644
>> --- a/hw/riscv/sifive_u.c
>> +++ b/hw/riscv/sifive_u.c
>> @@ -473,113 +473,121 @@ static void riscv_sifive_u_machine_instance_init=
(Object *obj)
>>   static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
>>   {
>>       MachineState *ms =3D MACHINE(qdev_get_machine());
>>       SiFiveUSoCState *s =3D RISCV_U_SOC(dev);
>>       const struct MemmapEntry *memmap =3D sifive_u_memmap;
>>       MemoryRegion *system_memory =3D get_system_memory();
>>       MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
>>       MemoryRegion *l2lim_mem =3D g_new(MemoryRegion, 1);
>>       qemu_irq plic_gpios[SIFIVE_U_PLIC_NUM_SOURCES];
>>       char *plic_hart_config;
>>       size_t plic_hart_config_len;
>>       int i;
>>       Error *err =3D NULL;
>>       NICInfo *nd =3D &nd_table[0];
>>
>>       object_property_set_bool(OBJECT(&s->e_cpus), true, "realized",
>>                                &error_abort);
>>       object_property_set_bool(OBJECT(&s->u_cpus), true, "realized",
>>                                &error_abort);
>>       /*
>>        * The cluster must be realized after the RISC-V hart array contai=
ner,
>>        * as the container's CPU object is only created on realize, and t=
he
>>        * CPU must exist and have been parented into the cluster before t=
he
>>        * cluster is realized.
>>        */
>>       object_property_set_bool(OBJECT(&s->e_cluster), true, "realized",
>>                                &error_abort);
>>       object_property_set_bool(OBJECT(&s->u_cluster), true, "realized",
>>                                &error_abort);
>=20
> Different bug noticed in passing: these really ought not to be
> using error_abort to realize things, as realize is a fairly
> likely-to-fail operation on most objects (either now or in
> the future if the object implementation changes).

OK.

>=20
>>
>>       /* boot rom */
>>       memory_region_init_rom(mask_rom, OBJECT(dev), "riscv.sifive.u.mrom=
",
>>                              memmap[SIFIVE_U_MROM].size, &error_fatal);

What about this memory_region_init_rom() call (and later=20
memory_region_init_ram) using error_fatal, same reasoning right?

>>       memory_region_add_subregion(system_memory, memmap[SIFIVE_U_MROM].b=
ase,
>>                                   mask_rom);
>=20
>>       object_property_set_bool(OBJECT(&s->prci), true, "realized", &err)=
;
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->prci), 0, memmap[SIFIVE_U_PRCI]=
.base);
>>
>>       object_property_set_bool(OBJECT(&s->otp), true, "realized", &err);
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>=20
> The changes made in this patch are fine though:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>=20
> thanks
> -- PMM
>=20


