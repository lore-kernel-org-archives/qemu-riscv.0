Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jOKho-0004q0-Tn
	for mharc-qemu-riscv@gnu.org; Tue, 14 Apr 2020 08:30:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33770)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jOKhf-0004jC-Sc
 for qemu-riscv@nongnu.org; Tue, 14 Apr 2020 08:30:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jOKhd-0008KH-W5
 for qemu-riscv@nongnu.org; Tue, 14 Apr 2020 08:30:11 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:33612
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jOKhc-0008JC-Q6
 for qemu-riscv@nongnu.org; Tue, 14 Apr 2020 08:30:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586867408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mRy3uiNfqn1wYKIgSvGw0/w0aZlVZpMzMPmvZODeLMU=;
 b=F2eFQ/kCvt3nb0cakpnGhdFHniteHbSOu2vSk3fPI7nK7+TU13ZO4mqYRB2dQPA2DOEdX0
 vhV2EFxeRPLsDJolQio6tDmhU31KDHf541ncYZ7ORolkwMotCAcdvKV+9cJNg4VMcVXakW
 2WwjGTbsZCc3bKqJpe46Ogpzuw76JnY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-LOXLgciKOnepHXR8NfvgXQ-1; Tue, 14 Apr 2020 08:30:06 -0400
X-MC-Unique: LOXLgciKOnepHXR8NfvgXQ-1
Received: by mail-wm1-f71.google.com with SMTP id b203so3690243wmd.6
 for <qemu-riscv@nongnu.org>; Tue, 14 Apr 2020 05:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=89f3HfIxGtyCwGbicp7SH5wF0RbSJiR4Pg4t8CjkheE=;
 b=KSiPbk6JKgFc6hPXSHGk130JTq+qWxz5JmOd0Xx5lufuozXoSAaP1Zg+S82uNna1T2
 4R5rJsBUTV+OIv15IOeNuguiNvb4mmteLRqyN9GSD3MmRzyBJgmS/22KKkIHur+dmJ/a
 L4R+h9rwEjfLt8GXTRLonOmIbBnzlpQ9AYTl61vwMOKUvvwO4aMdY87p3nfFYhk1RP+Z
 pVU5pbporHpvxVEkKPsdeh6ww2VJWKXoaRQlPBhqM47qfp8+bzHOtMTblkScFBEoPGJp
 npNgUGaEXZY+eVRuG8RP6iYzLHTqsZjsMHfVda7yWCajPQ8W2B2G6S/JR9rXEJL2tYFj
 I/3Q==
X-Gm-Message-State: AGi0PuY1VixtkE9HihgGPax9G5JcrIhCCWiEqTL7l2Zvuhzbs+BtTvXW
 tkJBDTXayz58cgihh8WbK8Pvc9iKm5IzM3mYMRXxLCzcXH9LpUk7rksElxogZDnn4A8RYGvdsHh
 926kzMadTR9JK5e4=
X-Received: by 2002:adf:e4c5:: with SMTP id v5mr7663263wrm.143.1586867405083; 
 Tue, 14 Apr 2020 05:30:05 -0700 (PDT)
X-Google-Smtp-Source: APiQypKSkvSeGEjNJliPtICYSPNogxdsHPBFjxKxE8EijFmahDArIrB3cHQWfl0UKLFkZM4opDF42Q==
X-Received: by 2002:adf:e4c5:: with SMTP id v5mr7663206wrm.143.1586867404770; 
 Tue, 14 Apr 2020 05:30:04 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id p5sm20566572wrg.49.2020.04.14.05.30.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2020 05:30:04 -0700 (PDT)
Subject: Re: [PATCH-for-5.1 v3 02/24] scripts/coccinelle: Script to simplify
 DeviceClass error propagation
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Wen Congyang <wencongyang2@huawei.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200412223619.11284-1-f4bug@amsat.org>
 <20200412223619.11284-3-f4bug@amsat.org> <875ze2tfvc.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <23ad6d04-1f42-29b8-caa6-6506cf1b7422@redhat.com>
Date: Tue, 14 Apr 2020 14:30:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <875ze2tfvc.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Tue, 14 Apr 2020 12:30:19 -0000

On 4/14/20 2:24 PM, Markus Armbruster wrote:
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>=20
>> When a device uses an Error* with data not modified before realize(),
>> this call can be moved to init(). Add a Coccinelle patch to find such
>> uses.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>   ...implify-init-realize-error_propagate.cocci | 69 +++++++++++++++++++
>>   MAINTAINERS                                   |  1 +
>>   2 files changed, 70 insertions(+)
>>   create mode 100644 scripts/coccinelle/simplify-init-realize-error_prop=
agate.cocci
>>
>> diff --git a/scripts/coccinelle/simplify-init-realize-error_propagate.co=
cci b/scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>> new file mode 100644
>> index 0000000000..2e3ec4d98a
>> --- /dev/null
>> +++ b/scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>> @@ -0,0 +1,69 @@
>> +// Find error-propagation calls that don't need to be in DeviceClass::r=
ealize()
>> +// because they don't use information user can change before calling re=
alize(),
>> +// so they can be moved to DeviceClass:initfn() where error propagation=
 is not
>> +// needed.
>> +//
>> +// Copyright: (C) 2020 Philippe Mathieu-Daud=C3=A9
>> +// This work is licensed under the terms of the GNU GPLv2 or later.
>> +//
>> +// spatch \
>> +//  --macro-file scripts/cocci-macro-file.h \
>> +//  --sp-file \
>> +//    scripts/coccinelle/simplify-init-realize-error_propagate.cocci \
>> +//  --timeout 60
>> +//
>> +// Inspired by https://www.mail-archive.com/qemu-devel@nongnu.org/msg69=
2500.html
>> +
>> +
>> +@ match_class_init @
>> +TypeInfo info;
>> +identifier class_initfn;
>> +@@
>> +    info.class_init =3D class_initfn;
>> +
>> +
>> +@ match_instance_init @
>> +TypeInfo info;
>> +identifier instance_initfn;
>> +@@
>> +    info.instance_init =3D instance_initfn;
>> +
>> +
>> +@ match_realize @
>> +identifier match_class_init.class_initfn;
>> +DeviceClass *dc;
>> +identifier realizefn;
>> +@@
>> +void class_initfn(...)
>> +{
>> +    ...
>> +    dc->realize =3D realizefn;
>> +    ...
>> +}
>=20
> I'm afraid this misses realize() methods of DeviceClass subclasses.
> Consider PCI device "i6300esb" (picked just because it's simple).
>=20
> pci_device_class_init() sets DeviceClass method realize() to
> pci_qdev_realize().  pci_qdev_realize() does the work common to all PCI
> devices, and calls PCIDeviceClass method realize() for the work specific
> to the PCI device at hand.
>=20
> i6300esb_class_init() sets PCIDeviceClass method realize() to
> i6300esb_realize().
>=20
> Your first rule should match i6300esb_info alright, and thus identify
> i6300esb_class_init() as a class_init() method.
>=20
> But your third rule can't match i6300esb_class_init()'s
>=20
>      k->realize =3D i6300esb_realize;
>=20
> because @k is a PCIDeviceClass, not a DeviceClass.
>=20
> I think it also misses cases that have a realize(), but no
> instance_init().
>=20
> Finding only some instances of an anti-pattern can still be useful.  But
> you should explain the script's limitations then, both in the script and
> the commit message.

OK.

>=20
>> +
>> +
>> +@ propagate_in_realize @
>> +identifier match_realize.realizefn;
>> +identifier err;
>> +identifier errp;
>> +identifier func_with_errp =3D~ "(?!object_property_set_link)";
>=20
> What are you trying to accomplish with this lookahead assertion?

"match all func_with_errp() except object_property_set_link()"?

>=20
>> +symbol error_abort, error_fatal;
>> +position pos;
>> +@@
>> +void realizefn@pos(..., Error **errp)
>> +{
>> +    ...
>> +    Error *err =3D NULL;
>=20
> Why is this line required for a match?

Hmmm maybe I was expecting a local_err... else a left-over from previous=20
intents :)

>=20
>> +    <+...
>> +    func_with_errp(..., \(&error_abort\|&error_fatal\));
>> +    ...+>
>> +}
>> +
>> +
>> +@ script:python @
>> +initfn << match_instance_init.instance_initfn;
>> +realizefn << match_realize.realizefn;
>> +p << propagate_in_realize.pos;
>> +@@
>> +print('>>> possible moves from {}() to {}() in {}:{}'
>> +      .format(initfn, realizefn, p[0].file, p[0].line))
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 642c8e0b6b..6203543ec0 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2058,6 +2058,7 @@ F: scripts/coccinelle/err-bad-newline.cocci
>>   F: scripts/coccinelle/error-use-after-free.cocci
>>   F: scripts/coccinelle/error_propagate_null.cocci
>>   F: scripts/coccinelle/remove_local_err.cocci
>> +F: scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>>   F: scripts/coccinelle/use-error_fatal.cocci
>>  =20
>>   GDB stub
>=20


