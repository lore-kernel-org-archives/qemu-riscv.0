Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ixIZA-0002oM-9X
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jan 2020 17:45:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55907)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ixIZ7-0002jo-Bj
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 17:45:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ixIZ6-0001tU-9O
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 17:45:37 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:42318)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1ixIZ1-0001sI-Ra; Thu, 30 Jan 2020 17:45:31 -0500
Received: by mail-oi1-x243.google.com with SMTP id j132so5316725oih.9;
 Thu, 30 Jan 2020 14:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JcxfzZwec7GQoZhYXHotQZGjHeZuvdXMNcsjDRHzQRI=;
 b=ek3tr0vvn9V/J/OLNKou/mQVStwv2K8r61gu9wat6aMtoc+Fwj9tdkw66HKDIu8web
 6Fk5fntVwFa1ikOSHGCqlVl4juF+DoVeLe8zV2M1jNfgTCtRd+7cLdzDX+CtMkyutPN1
 KiD6urOAsg39UGzix9PvrO3/Sbe9dxxePxHveM2u6PWSBdXKHbWDA0Iio2DDM8yBDlLj
 ShBtSnMYpp80IhI3ddxQBfDFeHNKZ5f8OfPNKcGV6/nZX0Cy+D+IsC2jlTv2wN8qXYej
 AUtRp8NIFo548J66+ms5gJ+h358cuERL6VUuKZ6U/CVk1hcy24xJNqfYAystyLXHmjaP
 c0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JcxfzZwec7GQoZhYXHotQZGjHeZuvdXMNcsjDRHzQRI=;
 b=pAeRNn0nljke1/IyxPfp/Obe8YAhjCbUQxQtBDS4e/zebiz4N5w/hpgB6sVjEdzBut
 nqHBl/hwKaWtUH1fN6LCE10FjWrMrcS3k8Udc9+u8RIK7OQx++E+kFrHSGotfvv4O+Zl
 hgfwJkUyhpW6T3D6XtFPm5RkKZtCUp+frdaPHSM425Ucx7JW5pTQ4EqBH/eaQ5+JeRFV
 zcHqetQRuHjq9waGHl005T7V5QsLH89Bz0mP8VwWVSSjVpICKmf4K2kU+gEWYGjOB28G
 CrTJscL0FnhUBYQrDI52YdzPVeNpoHJmvT3OVzf5oz53yvN3Ml0hP6NdsRsMk+dh5Ubn
 /CmQ==
X-Gm-Message-State: APjAAAVVwNGcIqbOlJdCW6S7r4h7s/WiEJu8yO+2QB27wrZB/qKTzT8d
 yFsP0pZV2HCWzZ8z8h8jlnJPAAAENOb2um9Bz28=
X-Google-Smtp-Source: APXvYqz/g0N2ozMQ/syNCDJa3Bz/z3piF3ge1RCaByHqCBweTm8rn0NM+qwC/z5Z+LHaTmrs07iQUTKcsid9DSuLmmY=
X-Received: by 2002:a05:6808:6c5:: with SMTP id
 m5mr4299657oih.106.1580424331083; 
 Thu, 30 Jan 2020 14:45:31 -0800 (PST)
MIME-Version: 1.0
References: <20200124005131.16276-1-f4bug@amsat.org>
 <20200124005131.16276-13-f4bug@amsat.org>
 <4f9a6d13-63b3-3df6-ecd9-def3908f90b3@redhat.com>
In-Reply-To: <4f9a6d13-63b3-3df6-ecd9-def3908f90b3@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 30 Jan 2020 23:45:20 +0100
Message-ID: <CAL1e-=jW5KCMCqK+4_sTT1-KdPGe7qh6O0Ve0rrNSQKmot=76w@mail.gmail.com>
Subject: Re: [PATCH rc2 12/25] hw/timer: Add limited support for Atmel 16 bit
 timer peripheral
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>, 
 Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Sarah Harris <S.E.Harris@kent.ac.uk>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Pavel Dovgalyuk <dovgaluk@ispras.ru>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-List-Received-Date: Thu, 30 Jan 2020 22:45:38 -0000

On Fri, Jan 24, 2020 at 9:16 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 24/01/2020 01.51, Philippe Mathieu-Daud=C3=A9 wrote:
> > From: Michael Rolnik <mrolnik@gmail.com>
> >
> > These were designed to facilitate testing but should provide enough
> > function to be useful in other contexts.  Only a subset of the function=
s
> > of each peripheral is implemented, mainly due to the lack of a standard
> > way to handle electrical connections (like GPIO pins).
> >
> > Signed-off-by: Sarah Harris <S.E.Harris@kent.ac.uk>
> > Message-Id: <20200118191416.19934-13-mrolnik@gmail.com>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > [rth: Squash info mtree fixes and a file rename from f4bug, which was:]
> > Suggested-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > [PMD: Use qemu_log_mask(LOG_UNIMP), replace goto by return]
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> > rc2: Use qemu_log_mask(LOG_UNIMP), replace goto by return (thuth)
> > ---
> >  include/hw/timer/atmel_timer16.h |  94 +++++
> >  hw/timer/atmel_timer16.c         | 605 +++++++++++++++++++++++++++++++
> >  hw/timer/Kconfig                 |   3 +
> >  hw/timer/Makefile.objs           |   2 +
> >  4 files changed, 704 insertions(+)
> >  create mode 100644 include/hw/timer/atmel_timer16.h
> >  create mode 100644 hw/timer/atmel_timer16.c
> [...]
> > +static void avr_timer16_clksrc_update(AVRTimer16State *t16)
> > +{
> > +    uint16_t divider =3D 0;
> > +    switch (CLKSRC(t16)) {
> > +    case T16_CLKSRC_EXT_FALLING:
> > +    case T16_CLKSRC_EXT_RISING:
> > +        qemu_log_mask(LOG_UNIMP, "%s: external clock source unsupporte=
d\n",
> > +                      __func__);
> > +        break;
> > +    case T16_CLKSRC_STOPPED:
> > +        break;
> > +    case T16_CLKSRC_DIV1:
> > +        divider =3D 1;
> > +        break;
> > +    case T16_CLKSRC_DIV8:
> > +        divider =3D 8;
> > +        break;
> > +    case T16_CLKSRC_DIV64:
> > +        divider =3D 64;
> > +        break;
> > +    case T16_CLKSRC_DIV256:
> > +        divider =3D 256;
> > +        break;
> > +    case T16_CLKSRC_DIV1024:
> > +        divider =3D 1024;
> > +        break;
> > +    default:
> > +        break;
> > +    }
> > +    if (divider) {
> > +        t16->freq_hz =3D t16->cpu_freq_hz / divider;
> > +        t16->period_ns =3D NANOSECONDS_PER_SECOND / t16->freq_hz;
> > +        DB_PRINT("Timer frequency %" PRIu64 " hz, period %" PRIu64 " n=
s (%f s)",
> > +                 t16->freq_hz, t16->period_ns, 1 / (double)t16->freq_h=
z);
> > +    }
> > +    return;
> > +}
>
> You can remove the "return;" at the end of the function now, too.
>

Will be fixed in rc4.

Aleksandar

>  Thomas
>

