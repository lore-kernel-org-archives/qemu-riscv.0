Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iuu8f-0005YU-AP
	for mharc-qemu-riscv@gnu.org; Fri, 24 Jan 2020 03:16:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50004)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iuu8d-0005YE-OF
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 03:16:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iuu8c-0006Do-KG
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 03:16:23 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43805
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iuu8c-0006DA-HL
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 03:16:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579853782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=5C8+m9fW+yJuLZ5D0kzdXtsOvXz97zVzTYHauIP1HK0=;
 b=JsUFQcf7J9sZmq8IegUNYsftSTBFBHnxOF/MbYyZGEUr6f8hweR6aCwfPYIPJIipbqa5U3
 mRzmgqNsp+YjCTOD1oaf7y3zvZSVTg/8cKJj08fHa21/p8ch5Q5CRPaETtZSjcjo95JUs8
 373vV1LtWgszbAotWjSxVNPN8p0LD7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-9DAd2k-rM1OIir67totBKA-1; Fri, 24 Jan 2020 03:16:20 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 185C0100550E;
 Fri, 24 Jan 2020 08:16:18 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-156.ams2.redhat.com [10.36.116.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0FA960BF3;
 Fri, 24 Jan 2020 08:16:07 +0000 (UTC)
Subject: Re: [PATCH rc2 12/25] hw/timer: Add limited support for Atmel 16 bit
 timer peripheral
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, mrolnik@gmail.com, richard.henderson@linaro.org,
 me@xcancerberox.com.ar
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 S.E.Harris@kent.ac.uk, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, dovgaluk@ispras.ru,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 imammedo@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, aleksandar.m.mail@gmail.com
References: <20200124005131.16276-1-f4bug@amsat.org>
 <20200124005131.16276-13-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <4f9a6d13-63b3-3df6-ecd9-def3908f90b3@redhat.com>
Date: Fri, 24 Jan 2020 09:16:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200124005131.16276-13-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 9DAd2k-rM1OIir67totBKA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Fri, 24 Jan 2020 08:16:25 -0000

On 24/01/2020 01.51, Philippe Mathieu-Daud=C3=A9 wrote:
> From: Michael Rolnik <mrolnik@gmail.com>
>=20
> These were designed to facilitate testing but should provide enough
> function to be useful in other contexts.  Only a subset of the functions
> of each peripheral is implemented, mainly due to the lack of a standard
> way to handle electrical connections (like GPIO pins).
>=20
> Signed-off-by: Sarah Harris <S.E.Harris@kent.ac.uk>
> Message-Id: <20200118191416.19934-13-mrolnik@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> [rth: Squash info mtree fixes and a file rename from f4bug, which was:]
> Suggested-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> [PMD: Use qemu_log_mask(LOG_UNIMP), replace goto by return]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> rc2: Use qemu_log_mask(LOG_UNIMP), replace goto by return (thuth)
> ---
>  include/hw/timer/atmel_timer16.h |  94 +++++
>  hw/timer/atmel_timer16.c         | 605 +++++++++++++++++++++++++++++++
>  hw/timer/Kconfig                 |   3 +
>  hw/timer/Makefile.objs           |   2 +
>  4 files changed, 704 insertions(+)
>  create mode 100644 include/hw/timer/atmel_timer16.h
>  create mode 100644 hw/timer/atmel_timer16.c
[...]
> +static void avr_timer16_clksrc_update(AVRTimer16State *t16)
> +{
> +    uint16_t divider =3D 0;
> +    switch (CLKSRC(t16)) {
> +    case T16_CLKSRC_EXT_FALLING:
> +    case T16_CLKSRC_EXT_RISING:
> +        qemu_log_mask(LOG_UNIMP, "%s: external clock source unsupported\=
n",
> +                      __func__);
> +        break;
> +    case T16_CLKSRC_STOPPED:
> +        break;
> +    case T16_CLKSRC_DIV1:
> +        divider =3D 1;
> +        break;
> +    case T16_CLKSRC_DIV8:
> +        divider =3D 8;
> +        break;
> +    case T16_CLKSRC_DIV64:
> +        divider =3D 64;
> +        break;
> +    case T16_CLKSRC_DIV256:
> +        divider =3D 256;
> +        break;
> +    case T16_CLKSRC_DIV1024:
> +        divider =3D 1024;
> +        break;
> +    default:
> +        break;
> +    }
> +    if (divider) {
> +        t16->freq_hz =3D t16->cpu_freq_hz / divider;
> +        t16->period_ns =3D NANOSECONDS_PER_SECOND / t16->freq_hz;
> +        DB_PRINT("Timer frequency %" PRIu64 " hz, period %" PRIu64 " ns =
(%f s)",
> +                 t16->freq_hz, t16->period_ns, 1 / (double)t16->freq_hz)=
;
> +    }
> +    return;
> +}

You can remove the "return;" at the end of the function now, too.

 Thomas


