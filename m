Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hpd0w-00027t-DO
	for mharc-qemu-riscv@gnu.org; Mon, 22 Jul 2019 14:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40954)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hpd0t-0001wU-P3
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 14:26:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hpd0r-0002Z7-Se
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 14:26:18 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:34248)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hpd0m-0002Vt-OS; Mon, 22 Jul 2019 14:26:13 -0400
Received: by mail-lj1-x244.google.com with SMTP id p17so38563717ljg.1;
 Mon, 22 Jul 2019 11:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XnXm48m9ipg/WN3CxUkWMt9IuAcSwBJl1WhAU5TtDIE=;
 b=aNbdEwK+ER39LDq/H/hXltsZlDQk/piVqMynOgqpclVrGoqB7MKNWvAQ2+rkbryrno
 0xg1E0BhiFSjSChK8c3Sq4hkPLS8jFvNdzyrsr+c26ebgqLLUT+LMeCjCpnBRsW5BymI
 fW+plQr525QRVTf0gveE40gcT6tO++JldKp4d7Mmx3X0dQrTSlTOPPLAT3Ixm4WvEAtw
 GyyYYuWxh5YuwMEmvaFr1wC4XdB9JsIdNG4VCyz1ls70ewdcNXCPjlytTf/7ZiDeqpZn
 cKnBhbSv5+PiQDuXjU/PxkdQkLnYQEQnPaTKUe1yMum6PvoXxXcQs1oCyh+rhvdxMrtu
 A6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XnXm48m9ipg/WN3CxUkWMt9IuAcSwBJl1WhAU5TtDIE=;
 b=BdjoSxLN629jP7nYVkUjdue+2Zn68HXZtYEZb/88HNMYPS68viyhqq+cNEkhGorEKQ
 yAMDglzBKjNF/n3v/1E7TAreQ6nb9KpN07cUDregEDk0KGzGjl4ms8D8w7kyjn9ikGSh
 V2bznPBYA3drmawF3ytKTDn+x+tmKVzBgcRlaab88y8xWzE0hpR2yD6lsSMT0+rGha07
 8oHLluKG4h8cAyZ+d+po9JBpulmyG/iqbYWruUpDC3MwHM73ZFTlDj4GvBWKyHNE7Dfs
 W8WQ6SFKY9qoYynJVRDHj1/gLcX59iucJJ6A9mcdzdOgRwjcTKLbKSlqyncuXyHTbEGq
 +PNQ==
X-Gm-Message-State: APjAAAVbleIwoaDgTXNEkyB4gf+ANYVE6kxbRPem9nhYJKpwt0GKRC22
 Y9QOAZ7zqkCxzsQGMBkARQRiXGfB0nPdPTTTDlY=
X-Google-Smtp-Source: APXvYqxtk+tr4GlZTl1GWV9hyhINcEHi1Ncg8QAPG/Y9Z4G0J9i40W1cdxlhEXzRc+YC0QA5rEnwS/5kr7cVWEtezEw=
X-Received: by 2002:a2e:9758:: with SMTP id f24mr37395224ljj.58.1563819970521; 
 Mon, 22 Jul 2019 11:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <edd3c94d357207e3862d1f5fec7e7346e70831f4.1563559494.git.alistair.francis@wdc.com>
 <550d4158-d7dd-c38b-3082-302184a20883@redhat.com>
In-Reply-To: <550d4158-d7dd-c38b-3082-302184a20883@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jul 2019 11:22:43 -0700
Message-ID: <CAKmqyKNnkToYf3Y025Hpv1e8jazMVjxhjAaOBtn0ajcHSFaTUA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 1/1] riscv/boot: Fixup the
 RISC-V firmware warning
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
X-List-Received-Date: Mon, 22 Jul 2019 18:26:21 -0000

On Sat, Jul 20, 2019 at 2:30 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 7/19/19 8:05 PM, Alistair Francis wrote:
> > Fix a typo in the warning message displayed to users, don't print the
> > message when running inside qtest and don't mention a specific QEMU
> > version for the deprecation.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/boot.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > index 5dee63011b..4b32ab1d26 100644
> > --- a/hw/riscv/boot.c
> > +++ b/hw/riscv/boot.c
> > @@ -26,6 +26,7 @@
> >  #include "hw/riscv/boot.h"
> >  #include "hw/boards.h"
> >  #include "elf.h"
> > +#include "sysemu/qtest.h"
> >
> >  #if defined(TARGET_RISCV32)
> >  # define KERNEL_BOOT_ADDRESS 0x80400000
> > @@ -46,10 +47,13 @@ void riscv_find_and_load_firmware(MachineState *mac=
hine,
> >           * In the future this defaul will change to loading the prebui=
lt
> >           * OpenSBI firmware. Let's warn the user and then continue.
> >          */
> > -        warn_report("No -bios option specified. Not loading a firmware=
.");
> > -        warn_report("This default will change in QEMU 4.3. Please use =
the " \
> > -                    "-bios option to aviod breakages when this happens=
.");
> > -        warn_report("See QEMU's deprecation documentation for details"=
);
> > +        if (!qtest_enabled()) {
> > +            warn_report("No -bios option specified. Not loading a firm=
ware.");
> > +            warn_report("This default will change in a future QEMU rel=
ease. " \
> > +                        "Please use the -bios option to avoid breakage=
s when "\
> > +                        "this happens.");
> > +            warn_report("See QEMU's deprecation documentation for deta=
ils");
>
> Maybe a final '.' in the last warning to be consistent with the previous
> lines?

Done in v2.

>
> Regardless:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks!

Alistair

>
> > +        }
> >          return;
> >      }
> >
> >

