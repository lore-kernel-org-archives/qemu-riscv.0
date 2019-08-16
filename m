Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyaw0-0002fu-0Z
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 08:02:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53660)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1hyavx-0002f2-3S
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 08:02:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hyavv-0003Ft-Hw
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 08:02:16 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35237)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hyavv-0003F4-Aa
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 08:02:15 -0400
Received: by mail-oi1-x244.google.com with SMTP id a127so4628662oii.2
 for <qemu-riscv@nongnu.org>; Fri, 16 Aug 2019 05:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mTlvEQlwQxD+m3KCNTaQoPeyNkMz5awwGRbjpwvjjP4=;
 b=clEWcOMwE8ig/swEBxhVv+eYRtLzVRYzOdNAT4xBz1bX72Ll6PNcMUKCk6v0uVvLrx
 gbPx/m8UOIXYiXCZbrLpf9UIGtcyFWe7DpeZw9T7/T8Ukh1ODM3ao3EOPf2kOk0uuVjQ
 bUZeznpOmQhe1FUF+okF/+PPmA8KUpDPhIhiJ7wBKTtPULvEjTz4+xf/Fli6y5ADfXjz
 wAtUkjimkuWh5hiC4Rnby+nHeZvZAls0ZUvR8nPjlmWmUtVuBOh2dpRg3fJCFwuHmrRL
 UX+oNlk9YxiwIXoNhIrGB+3JVYzEm4z+G8k4kxE8nzAserwn7lO+4r8E+ID6L6GcAsSq
 0SZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mTlvEQlwQxD+m3KCNTaQoPeyNkMz5awwGRbjpwvjjP4=;
 b=G9AV2LJ2x1tigcvf043peNpM13JOkxx0uSFI9u33u7Hzvew2lvG+nsC0xzimOKV/mn
 4ORFr/5pM0V5FaAg29TLJf8MASK98JTxQ0cDWGVYk6XRymLFej62v+QhxY5hsOhtsGST
 DvUmCyIhjIs+flWaFxq+vnUMTjh1sc7SO0qFIvapsPdSqvMBUIfWw811fmOLZplihZZe
 eKJ2rhQdh53DdN12ZPK0g9dDSROSJUIN+JZQj28bqhTDVnWtIjjHQmdKpYPETeCR3oir
 2utQ3Mx+5o06NlGQh8byiAW+H8yk2DkQ2g/0+CXPTevOUtiu21UA++Ii2GvxXN/l+QtY
 jXiw==
X-Gm-Message-State: APjAAAV2E8I5FgUwtZXG96YL2P3o3LWKlhpH0NlwNnWDbqz+hmYDxaBi
 gKcT/jni7cYmUMQaNw5haSwIjGZ0zXvtFAt0WM/SaA==
X-Google-Smtp-Source: APXvYqzT39k/DlDCfREc8tggE6tDp2LZAzaRwF8MATMyYj9oD8OFY8BqjW5qOATbiqowbjnwyMf+8eWQlW3FZMdwwIU=
X-Received: by 2002:aca:6185:: with SMTP id v127mr4861732oib.163.1565956934256; 
 Fri, 16 Aug 2019 05:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <a7d6eede-b152-4c06-8945-9607c663b99c@redhat.com> <1565955445398.83897@bt.com>
In-Reply-To: <1565955445398.83897@bt.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Aug 2019 13:02:03 +0100
Message-ID: <CAFEAcA-nihW1nuMOL-XCR_QxUXSXji=noe4eDNPHxkib4-_a6A@mail.gmail.com>
To: tony.nguyen@bt.com
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, 
 Rob Herring <robh@kernel.org>, Peter Chubb <peter.chubb@nicta.com.au>, 
 sundeep subbaraya <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
 andrzej zaborowski <balrogg@gmail.com>, Eric Auger <eric.auger@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Michael Walle <michael@walle.cc>,
 Kevin Wolf <kwolf@redhat.com>, 
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>, 
 Keith Busch <keith.busch@intel.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Andrew Baumann <Andrew.Baumann@microsoft.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, 
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, 
 Thomas Huth <huth@tuxfamily.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Aleksandar Rikalo <arikalo@wavecomp.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
 Guan Xuetao <gxt@mprc.pku.edu.cn>, David Gibson <david@gibson.dropbear.id.au>, 
 Helge Deller <deller@gmx.de>, Eduardo Habkost <ehabkost@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, 
 Paul Durrant <paul.durrant@citrix.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Alberto Garcia <berto@igalia.com>, Corey Minyard <minyard@acm.org>,
 Paul Burton <pburton@wavecomp.com>, 
 Jiri Slaby <jslaby@suse.cz>, Jean-Christophe DUBOIS <jcd@tribudubois.net>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Anthony Green <green@moxielogic.com>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Laszlo Ersek <lersek@redhat.com>, 
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>, 
 Yuval Shaia <yuval.shaia@oracle.com>, Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Collin Walling <walling@linux.ibm.com>, 
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>, Fam Zheng <fam@euphon.net>,
 Hannes Reinecke <hare@suse.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Stefan Berger <stefanb@linux.ibm.com>, 
 Alex Williamson <alex.williamson@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, claudio.fontana@suse.com, 
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
 Qemu-block <qemu-block@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>, 
 "open list:X86" <xen-devel@lists.xenproject.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 qemu-s390x <qemu-s390x@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v7 00/42] Invert Endian bit in
 SPARCv9 MMU TTE
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
X-List-Received-Date: Fri, 16 Aug 2019 12:02:18 -0000

On Fri, 16 Aug 2019 at 12:37, <tony.nguyen@bt.com> wrote:
>
> Hi Phillippe,
>
> On 8/16/19 7:58 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >On 8/16/19 8:28 AM, tony.nguyen@bt.com wrote:
> >> For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
> >> targets from the set of target/hw/*/device.o.
> >>
> >> If the set of targets are all little or all big endian, re-declare
> >> the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
> >> respectively.
> >
> >If only little endian targets use a device, that doesn't mean the device
> >is designed in little endian...
> >
> >Then if a big endian target plan to use this device, it will require
> >more work and you might have introduced regressions...
> >
> >I'm not sure this is a safe move.
> >
> >> This *naive* deduction may result in genuinely native endian devices
> >> being incorrectly declared as little or big endian, but should not
> >> introduce regressions for current targets.
> >
>
> Roger. Evidently too naive. TBH, most devices I've never heard of...

OTOH it's worth noting that it's quite likely that most of
the implementations of these DEVICE_NATIVE_ENDIAN devices
picked it in an equally naive way, by just copying some other
device's code...

thanks
-- PMM

