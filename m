Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ihvZ4-0001p9-Un
	for mharc-qemu-riscv@gnu.org; Thu, 19 Dec 2019 08:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35422)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihvYy-0001k6-Tw
 for qemu-riscv@nongnu.org; Thu, 19 Dec 2019 08:09:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihvYu-0006uh-MT
 for qemu-riscv@nongnu.org; Thu, 19 Dec 2019 08:09:55 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48304
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihvYu-0006oA-D5
 for qemu-riscv@nongnu.org; Thu, 19 Dec 2019 08:09:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576760991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SuzS+0RI392neHe9EkEjexF+DgTfoqg6pQIc+0/RiGk=;
 b=BG5bgpOlcZCOc34IZa9IDTwbAF624+Ozykpd+fRWXYWpM0V6HwKcD1co3NQaalSqwpFGV1
 eTwY0o0a53iQupFtoFzuNTBjMDhwQk3fsPlQa551f54S4kBXs6APpDs2i+cKbgJ6qAUgPX
 9nhpqlcyHbWf7x0Dn22JrEQsAAuWCDQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-H9Qp9LyiMQyqV1wvMuvJbQ-1; Thu, 19 Dec 2019 08:09:49 -0500
Received: by mail-ed1-f71.google.com with SMTP id b13so3497641edf.0
 for <qemu-riscv@nongnu.org>; Thu, 19 Dec 2019 05:09:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ni05vfEtEsgSJx+IszN8ATEGfrX2nnauYNLHkipway8=;
 b=dEoSAP6gAJB1/3D68gXX+w4PX8xEsf3N3iGPo3rst/l72P/qjk6M/VxypLHo2BC5mY
 1lEt+0YxsC+PUoAdOmT0VZS2jS0vbOaOXOjBOJPNs8s14GaqUXXZNaMqAKFhBCEByLnx
 f0Vg5GXzoJagooWhPM873eAFVJiL2P5iJgV4537fXaUKmcolAsMJSl56aisIIvvoollP
 a77F5PU7U2cl6xU/7IpRU3FGd0jDPfjcWKiVcu36wp5hH2jT0wCH0/b3qgDfqXNj43sK
 uPQZqEKpZ5a5VXCEB/aCp8LHfRBgtgSYdO4p9LGlF+dsJhTVBlfq6M/4yL27coNMpK6o
 odmg==
X-Gm-Message-State: APjAAAWzoxHcM7Qk10bcfkCiYnoikiQZATpWkMn/NLU08RwvZOPEGNGu
 Pi7qCwz1W/21yWETnhoGizPP6Iu67Vrp0Yn6O9vES8c8bT8YvYzSPQNLK+6t37qNr1uhp7y50cz
 wUzVDqUjiJaGH7t4=
X-Received: by 2002:a50:8522:: with SMTP id 31mr9076198edr.237.1576760987691; 
 Thu, 19 Dec 2019 05:09:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqz/adgrbgJoCgmy56SiGC2LIO/SZZdbSv5QlB93ULWzoIEaQX5tN2zW1BKIP1XXj+7bB7rUng==
X-Received: by 2002:a50:8522:: with SMTP id 31mr9076104edr.237.1576760986995; 
 Thu, 19 Dec 2019 05:09:46 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id e2sm474808eja.37.2019.12.19.05.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2019 05:09:46 -0800 (PST)
Subject: Re: [RFC PATCH 13/14] hw/char/terminal3270: Explicit ignored
 QEMUChrEvent in IOEventHandler
To: Markus Armbruster <armbru@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Paul Burton <pburton@wavecomp.com>,
 Jason Wang <jasowang@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alberto Garcia <berto@igalia.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Joel Stanley <joel@jms.id.au>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Laurent Vivier
 <lvivier@redhat.com>, Corey Minyard <minyard@acm.org>,
 Amit Shah <amit@kernel.org>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-riscv@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Huth <huth@tuxfamily.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20191217163808.20068-1-philmd@redhat.com>
 <20191217163808.20068-14-philmd@redhat.com>
 <87sglgx0w1.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <214a1da6-d974-4f98-0113-ea0b1ea9f244@redhat.com>
Date: Thu, 19 Dec 2019 14:09:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87sglgx0w1.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-MC-Unique: H9Qp9LyiMQyqV1wvMuvJbQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Thu, 19 Dec 2019 13:09:59 -0000

Hi Markus,

On 12/19/19 7:52 AM, Markus Armbruster wrote:
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>=20
>> The Chardev events are listed in the QEMUChrEvent enum. To be
>> able to use this enum in the IOEventHandler typedef, we need to
>> explicit when frontends ignore some events, to silent GCC the
>> following warnings:
>>
>>      CC      s390x-softmmu/hw/char/terminal3270.o
>>    hw/char/terminal3270.c: In function =E2=80=98chr_event=E2=80=99:
>>    hw/char/terminal3270.c:156:5: error: enumeration value =E2=80=98CHR_E=
VENT_BREAK=E2=80=99 not handled in switch [-Werror=3Dswitch]
>>      156 |     switch (event) {
>>          |     ^~~~~~
>>    hw/char/terminal3270.c:156:5: error: enumeration value =E2=80=98CHR_E=
VENT_MUX_IN=E2=80=99 not handled in switch [-Werror=3Dswitch]
>>    hw/char/terminal3270.c:156:5: error: enumeration value =E2=80=98CHR_E=
VENT_MUX_OUT=E2=80=99 not handled in switch [-Werror=3Dswitch]
>>    cc1: all warnings being treated as errors
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>> Cc: Cornelia Huck <cohuck@redhat.com>
>> Cc: Halil Pasic <pasic@linux.ibm.com>
>> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
>> Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: qemu-s390x@nongnu.org
>> ---
>>   hw/char/terminal3270.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/char/terminal3270.c b/hw/char/terminal3270.c
>> index 6859c1bcb2..9e59a2d92b 100644
>> --- a/hw/char/terminal3270.c
>> +++ b/hw/char/terminal3270.c
>> @@ -166,6 +166,9 @@ static void chr_event(void *opaque, int event)
>>           sch->curr_status.scsw.dstat =3D SCSW_DSTAT_DEVICE_END;
>>           css_conditional_io_interrupt(sch);
>>           break;
>> +    default:
>> +        /* Ignore */
>> +        break;
>>       }
>>   }
>=20
> I doubt the /* Ignore */ comment is worth its keep.

OK I don't mind dropping it.

> Splitting PATCH 02-13 feels excessive to me.

I agree, but I have the feeling when a patch touch many subsystems, we=20
don't wait for all the maintainers to Ack it, we are fine with 2 or 3.
In this case, maybe a subsystem neglected a QEMUChrEvent case, so I=20
prefer to have each of them to confirm we can ignore the missing cases.

In v2 I don't replace by a 'default' entry, all the cases are explicit.

Regards,

Phil.


