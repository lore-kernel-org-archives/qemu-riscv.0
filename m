Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j5WAQ-0004xp-L2
	for mharc-qemu-riscv@gnu.org; Sat, 22 Feb 2020 09:54:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54996)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1j5WAO-0004xf-Mz
 for qemu-riscv@nongnu.org; Sat, 22 Feb 2020 09:54:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1j5WAN-0006L9-IU
 for qemu-riscv@nongnu.org; Sat, 22 Feb 2020 09:54:04 -0500
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:33268)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1j5WAN-0006L5-Cu; Sat, 22 Feb 2020 09:54:03 -0500
Received: by mail-yb1-xb42.google.com with SMTP id w190so2363912ybc.0;
 Sat, 22 Feb 2020 06:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7YsbAnkdQt3X6ziTeJUQA4xOEptsf8l/5Q5je+Dv9Rs=;
 b=tWazbDPJHBSFCpn3VVoFlFavVZLrsZTX3KD6+6JMXauDFStrjdgxY4JoWMS874hAQs
 T9dUDMx9QVyvqqt1BCeTjtqrn2GTnVbRfRBMKdpiNrhXx52R4d10K9K+MsaT2ogFxjAY
 PCPqkKxJAe+ATF5eOD1IaoMUybMTJsw66heVv4QrbTHHDZ+jRirSH5ttwpSbGWNlcBR3
 p+2n9YrqokYhdei2MzJbpcTdy8iBFJTfKanxDbXQtnmsWvKOb3irFzpsvlKEAFQsswqZ
 kA/2D/+X5QwbiuFJtwVYDyiNyQwEnFFtgCZTDbu2+R9qjpjE9PDbb/ryrdUXoerxpxSp
 Nzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7YsbAnkdQt3X6ziTeJUQA4xOEptsf8l/5Q5je+Dv9Rs=;
 b=d931gDdCNnUnocK+Kz3GYObeerBmh/TUMHNei1psvcJ7U1nXLqsFz7JBV32W7mnDq0
 u7NbKbncXvsMEmnFbleonngIUfLPPbAP2TgDWYdljPJWmdzQefwlC/BSgrq5QpacwQ9E
 fDAQVEOx+uDcWNK2nPq0ioYNd0F4aYO6KN0OQl/R+SWcxPHkaX/VA7eORHAV0HYVstW0
 Bq4kD+TzRWrH89HjRqhMtVzC86NE5jMWKDg+4m39NOgHKbUzPHq+u/Cs+sDAMNzCrdS9
 pF+GZaf4VKabVYY8xEoIrI0i2+fei8FERXbSlep0L5O4lTEkIzf6nesrTwpO1NbtJ8xr
 dtmQ==
X-Gm-Message-State: APjAAAU2imbQwmAGRHzga0E4XjXSzwMonstQZks1ZBqC2vbmHcwm7H1m
 91rRcH26BrOgugkq1AIx8bMQ3XH1P8pc7BtS63Q=
X-Google-Smtp-Source: APXvYqwym35chQAHBebh0dkTanLZr/1x8Z9HvzGdOvK4D4MeYRCp7LJg/0rkisjuaamk5/3za7VCG6j3W0rRaLddua8=
X-Received: by 2002:a25:9986:: with SMTP id p6mr4045981ybo.392.1582383242622; 
 Sat, 22 Feb 2020 06:54:02 -0800 (PST)
MIME-Version: 1.0
References: <1582209758-2996-1-git-send-email-bmeng.cn@gmail.com>
 <f92f1ec7-ac03-a012-f232-32c533beb9d2@redhat.com>
 <CAEUhbmV9ouup0aqrUvEfpGFAoggVNJXw-PLD0xYurBXg+h3OMA@mail.gmail.com>
 <CAAhSdy0edkypzbhhLw2g52F2w6GrS46OKi461Fghuk5AZfCjgQ@mail.gmail.com>
 <fa5088d2-2f9a-6df6-3d34-d8c0c7c34df0@redhat.com>
In-Reply-To: <fa5088d2-2f9a-6df6-3d34-d8c0c7c34df0@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 22 Feb 2020 22:53:51 +0800
Message-ID: <CAEUhbmWEsjVeOkZ_7+Xa1e3MDwTx-1_KF5COrgGd3V-1zSBzJg@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: roms: Add 32-bit OpenSBI firmware image for
 sifive_u
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Anup Patel <anup@brainfault.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b42
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
X-List-Received-Date: Sat, 22 Feb 2020 14:54:06 -0000

Hi Philippe,

On Fri, Feb 21, 2020 at 4:54 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 2/21/20 6:54 AM, Anup Patel wrote:
> > On Fri, Feb 21, 2020 at 8:08 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> Hi Philippe,
> >>
> >> On Fri, Feb 21, 2020 at 1:31 AM Philippe Mathieu-Daud=C3=A9
> >> <philmd@redhat.com> wrote:
> >>>
> >>> Hi Bin,
> >>>
> >>> On 2/20/20 3:42 PM, Bin Meng wrote:
> >>>> Although the real world SiFive HiFive Unleashed board is a 64-bit
> >>>> hardware configuration, with QEMU it is possible to test 32-bit
> >>>> configuration with the same hardware features.
> >>>>
> >>>> This updates the roms Makefile to add the build rules for creating
> >>>> the 32-bit OpenSBI firmware image for sifive_u machine. A pre-built
> >>>> OpenSBI image (built from commit 3e7d666) has been added as the
> >>>> default bios for 32-bit sifive_u machine.
> >>>
> >>> With QEMU:
> >>>
> >>> fatal: ambiguous argument '3e7d666': unknown revision or path not in =
the
> >>> working tree.
> >>>
> >>> This looks like an OpenSBI commit but QEMU only include up to v0.5.
> >>>
> >>> Can you build v0.5? Else can you update the submodule?
> >>>
> >>
> >> Will do in v2.
> >
> > We plan to release OpenSBI v0.6 on monday (24th Feb 2020) so maybe
> > you can update all RISC-V ROM images based on OpenSBI v0.6 ??
>
> Sounds cleaner.

Yes, will update all RISC-V ROM images to v0.6 in v2.

>
> Suggestions when updating a QEMU git-submodule:
>
>
> - Include output of submodule 'git-log --reverse --oneline'
>
> - Send series/pull-request with 'git-format-patch --no-binary'
>

Sure. I believe with "--no-binary" I will need provide a repo for pull?

> >
> >>
> >>> Also, can you add a CI job to build this, so we have reproducible bui=
lds
> >>> (see QEMU commit 71920809ceabed as example)?
> >>
> >> I cannot find any document for how to test CI job with gitlab CI. Does
> >> QEMU has a public CI runner for testing?
>
> There is:
>
> https://wiki.qemu.org/Testing
> https://wiki.qemu.org/Testing/CI
>
> Currently you can use whatever CI best suits you (although long term is
> probably to rely more on GitLab, because it allows adding runners on
> particular hardware/setup).

Thank you very much for the pointers. I will add a CI job in v2.

Regards,
Bin

