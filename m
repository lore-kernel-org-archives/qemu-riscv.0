Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iuyQA-0007qC-Pt
	for mharc-qemu-riscv@gnu.org; Fri, 24 Jan 2020 07:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54383)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iuyQ7-0007mj-ML
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 07:50:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iuyQ6-0003RO-GF
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 07:50:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24064
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iuyQ6-0003P3-Cw
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 07:50:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579870241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+mp3//erqSzd3/gVz70vg47VpR5prs2RkavX6aqb1Y=;
 b=WtKjxWxpNMgOkD1A/+tld1Gt3PF/33DSXr65qnjfbVfDlLVp3+oRInDQ32ytIO73Ix+EyF
 N8/jea8xt2lhBBAirb5mBAIUlwVmInde7rquBLrSsw1VyQR7+ZuZnFpMZMjdpMNru28t5o
 zNQ9puaI6nKSULAyalQibydg0bfrNaw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-CARgVwVFPd-Yu4CLt59q_A-1; Fri, 24 Jan 2020 07:50:40 -0500
Received: by mail-wr1-f72.google.com with SMTP id z10so1095707wrt.21
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2020 04:50:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pZFI9gdEY18DUnDJSvo+WwYq1TaEIq/5uGQsvODasOA=;
 b=IjyQ0JPtTjr3WtqNx9KBko+Fz0IwBrLvN6qeHT4zX3WiohI1aKoFRjz2tQBTEeaJFG
 epakwAVzMWIgrXdCJHfasxjZWMZ2E66pOQCklo1auwj+W3eJf2FUQOkguws85VChyIa7
 JDzqOx9qIWlpZjoY3Oa5X0rsxNuBXGf+EL9W0KnY80gMp3IRsF74hysHAmUqga7fYdjm
 rDNUy0iFXqDtzsoUur5T+2n9BewrfJqn3LsKika2I41/bjpwJ8/WG0sKVY8otyZX151i
 BNHZrwnYj93z4WIdnFmLCwDIh25z16D23mZ6lmFKgoy03Xp2GGNN65yKrqxR8D/QtI0h
 ndrQ==
X-Gm-Message-State: APjAAAUgKqIsjee+ivPwn+42r/mNO2T4STnr2slr9PAZygul9cYqs6iC
 5KygI9G+pmSezbVXAVtTCom9tYJkV+IU3ZuO1ZxYqHtQ0xvMOcDM9BkvCTwX4wZCK7v1Zpvkvnq
 Xndbi6dybK10Kf5w=
X-Received: by 2002:a1c:a515:: with SMTP id o21mr3312381wme.85.1579870238901; 
 Fri, 24 Jan 2020 04:50:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqy9xuGA+8xUOx+T4ycfpMnXOJQ4+8Vv1fgz+eVy24bn2FurvT1MnntKKwP6G2KHUFlpOsFwCg==
X-Received: by 2002:a1c:a515:: with SMTP id o21mr3312350wme.85.1579870238661; 
 Fri, 24 Jan 2020 04:50:38 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id p17sm6819636wmk.30.2020.01.24.04.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2020 04:50:38 -0800 (PST)
Subject: Re: [PATCH rc2 12/25] hw/timer: Add limited support for Atmel 16 bit
 timer peripheral
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-devel@nongnu.org, mrolnik@gmail.com,
 richard.henderson@linaro.org, me@xcancerberox.com.ar
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 S.E.Harris@kent.ac.uk, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, dovgaluk@ispras.ru,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 imammedo@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, aleksandar.m.mail@gmail.com
References: <20200124005131.16276-1-f4bug@amsat.org>
 <20200124005131.16276-13-f4bug@amsat.org>
 <4f9a6d13-63b3-3df6-ecd9-def3908f90b3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3adbf3cf-37bf-237e-7c8f-1f2e9e7a5a70@redhat.com>
Date: Fri, 24 Jan 2020 13:50:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <4f9a6d13-63b3-3df6-ecd9-def3908f90b3@redhat.com>
Content-Language: en-US
X-MC-Unique: CARgVwVFPd-Yu4CLt59q_A-1
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
X-List-Received-Date: Fri, 24 Jan 2020 12:50:45 -0000

On 1/24/20 9:16 AM, Thomas Huth wrote:
> On 24/01/2020 01.51, Philippe Mathieu-Daud=C3=A9 wrote:
>> From: Michael Rolnik <mrolnik@gmail.com>
>>
>> These were designed to facilitate testing but should provide enough
>> function to be useful in other contexts.  Only a subset of the functions
>> of each peripheral is implemented, mainly due to the lack of a standard
>> way to handle electrical connections (like GPIO pins).
>>
>> Signed-off-by: Sarah Harris <S.E.Harris@kent.ac.uk>
>> Message-Id: <20200118191416.19934-13-mrolnik@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> [rth: Squash info mtree fixes and a file rename from f4bug, which was:]
>> Suggested-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> [PMD: Use qemu_log_mask(LOG_UNIMP), replace goto by return]
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>> rc2: Use qemu_log_mask(LOG_UNIMP), replace goto by return (thuth)
>> ---
>>   include/hw/timer/atmel_timer16.h |  94 +++++
>>   hw/timer/atmel_timer16.c         | 605 +++++++++++++++++++++++++++++++
>>   hw/timer/Kconfig                 |   3 +
>>   hw/timer/Makefile.objs           |   2 +
>>   4 files changed, 704 insertions(+)
>>   create mode 100644 include/hw/timer/atmel_timer16.h
>>   create mode 100644 hw/timer/atmel_timer16.c
> [...]
>> +static void avr_timer16_clksrc_update(AVRTimer16State *t16)
>> +{
>> +    uint16_t divider =3D 0;
>> +    switch (CLKSRC(t16)) {
>> +    case T16_CLKSRC_EXT_FALLING:
>> +    case T16_CLKSRC_EXT_RISING:
>> +        qemu_log_mask(LOG_UNIMP, "%s: external clock source unsupported=
\n",
>> +                      __func__);
>> +        break;
>> +    case T16_CLKSRC_STOPPED:
>> +        break;
>> +    case T16_CLKSRC_DIV1:
>> +        divider =3D 1;
>> +        break;
>> +    case T16_CLKSRC_DIV8:
>> +        divider =3D 8;
>> +        break;
>> +    case T16_CLKSRC_DIV64:
>> +        divider =3D 64;
>> +        break;
>> +    case T16_CLKSRC_DIV256:
>> +        divider =3D 256;
>> +        break;
>> +    case T16_CLKSRC_DIV1024:
>> +        divider =3D 1024;
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +    if (divider) {
>> +        t16->freq_hz =3D t16->cpu_freq_hz / divider;
>> +        t16->period_ns =3D NANOSECONDS_PER_SECOND / t16->freq_hz;
>> +        DB_PRINT("Timer frequency %" PRIu64 " hz, period %" PRIu64 " ns=
 (%f s)",
>> +                 t16->freq_hz, t16->period_ns, 1 / (double)t16->freq_hz=
);
>> +    }
>> +    return;
>> +}
>=20
> You can remove the "return;" at the end of the function now, too.

Oops I didn't notice.

Richard, do you mind to remove this single line?

Thanks both :)


