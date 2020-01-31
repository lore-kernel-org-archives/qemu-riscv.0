Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ixUME-0003oZ-Qj
	for mharc-qemu-riscv@gnu.org; Fri, 31 Jan 2020 06:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ixUMA-0003lm-MC
 for qemu-riscv@nongnu.org; Fri, 31 Jan 2020 06:21:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ixUM8-00083N-Om
 for qemu-riscv@nongnu.org; Fri, 31 Jan 2020 06:21:02 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:44236)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ixUM4-0007wi-N6; Fri, 31 Jan 2020 06:20:57 -0500
Received: by mail-yw1-f65.google.com with SMTP id t141so4274809ywc.11;
 Fri, 31 Jan 2020 03:20:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zbZ1Zr02zgbuu5FcJZu6KdN991TWDZ+GAwZPE7eywGA=;
 b=IazKwUfjOxUxMTSwSN0mUpu850y7sFv9udMwlp/PFDjzVNUd2wn/Z5pV1QLi7QNNAh
 xFSSIBZnF1t16ooxv4kwRT/CM7bDFyiBQLV09y+e8C98aoEDeC1+PWnA4kOL2Sdzmgza
 p090CIjGOFHnLItv11t5Vh7ob9I6jTn7X/+5WGugIGQHETAkvJ2lRt8TlFnc8zzi2sJi
 gCXnCaPXu7I7LmjXJ/m/X49btwfEX38WQRvvjIKtA3OLURixYWSO1BPeCj8Fu3bwCEu0
 ZFbl2FQzy3odDRdFMAMA2s1uV0RAuIOjwmTBP/URbSS9+cTMkrX/7GGpOi50llb65onm
 ne8Q==
X-Gm-Message-State: APjAAAW8ROz0IQO0lvxdTS2tJ+Z0MKG4TNT/eA8KzYGmrj2NULkdp+vC
 eEXftbTrLMTza96hNCOFavJ6pgqJgC/hYkao/aU=
X-Google-Smtp-Source: APXvYqwFSOd3Y9qHIOl0t3Go4rLtedbFeiZPmz3UTeQaPPG0Lu4uGs7ep02wPWRYJxvk6QvEKgTecq+iC36ileB2dmI=
X-Received: by 2002:a25:e696:: with SMTP id d144mr8050604ybh.316.1580469655897; 
 Fri, 31 Jan 2020 03:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20200124005131.16276-1-f4bug@amsat.org>
 <20200124005131.16276-13-f4bug@amsat.org>
 <875zh1yw38.fsf@linaro.org> <790c5181-c4b0-ea7b-f4e4-07bacae220b2@redhat.com>
 <20200124120722.705ae8bac5cfc939dae2db5f@kent.ac.uk>
 <CAL1e-=hCH7WQU-10zrOZW5imibZxAz7Ao0DVxekJEjSVB5pQhA@mail.gmail.com>
In-Reply-To: <CAL1e-=hCH7WQU-10zrOZW5imibZxAz7Ao0DVxekJEjSVB5pQhA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 31 Jan 2020 12:20:44 +0100
Message-ID: <CAAdtpL5VDkU69A-C80i+GuvVqjmE5px+NEtxbOV-ecdp6OVmKA@mail.gmail.com>
Subject: Re: [PATCH rc2 12/25] hw/timer: Add limited support for Atmel 16 bit
 timer peripheral
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Cc: Sarah Harris <seh53@kent.ac.uk>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "S.Harris" <S.E.Harris@kent.ac.uk>, "E.Robbins" <E.J.C.Robbins@kent.ac.uk>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mrolnik@gmail.com" <mrolnik@gmail.com>, 
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>, 
 "me@xcancerberox.com.ar" <me@xcancerberox.com.ar>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "imammedo@redhat.com" <imammedo@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Eric Blake <eblake@redhat.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "dovgaluk@ispras.ru" <dovgaluk@ispras.ru>,
 Eduardo Habkost <ehabkost@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.161.65
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
X-List-Received-Date: Fri, 31 Jan 2020 11:21:04 -0000

On Thu, Jan 30, 2020 at 11:44 PM Aleksandar Markovic
<aleksandar.m.mail@gmail.com> wrote:
> On Fri, Jan 24, 2020 at 1:07 PM Sarah Harris <seh53@kent.ac.uk> wrote:
> >
> > Hi,
> >
> > Do I understand correctly that you need Ed to email a "Signed-off-by: E=
d Robbins <email>" himself?
> > Ed's cc'ed already, but I'll email him directly to make sure he's seen =
this discussion.
> >
> > Sarah
> >
>
> All authors should have their "Signed-off-by:" line in the commit
> message. That is what Alex meant. I will fix that in rc4.

I am not sure this works that way...

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign=
-your-work-the-developer-s-certificate-of-origin

  The sign-off is a simple line at the end of the explanation for the
patch, which certifies that you wrote it or otherwise have the right
to pass it on as an open-source patch.

1/ https://www.mail-archive.com/qemu-devel@nongnu.org/msg620936.html
- Ed requires the MIT license (https://opensource.org/licenses/MIT)
- Sarah has the right to pass Ed's patch as an open-source patch, and
signs the Developer=E2=80=99s Certificate of Origin

  "The contribution is based upon previous work that, to the best of
my knowledge, is covered under an appropriate open source license and
I have the right under that license to submit that work with
modifications, whether created in whole or in part by me, under the
same open source license (unless I am permitted to submit under a
different license), as indicated in the file;"

2/ https://www.mail-archive.com/qemu-devel@nongnu.org/msg675573.html
- License is changed to LGPLv2 (https://opensource.org/licenses/LGPL-2.1)
- Ed appears as having signed the Developer=E2=80=99s Certificate of Origin=
 himself

  "The contribution was created in whole or in part by me and I have
the right to submit it under the open source license indicated in the
file;"

IANAL so I'd like to get advises from the others.

