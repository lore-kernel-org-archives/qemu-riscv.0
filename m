Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j04ZX-000709-Pm
	for mharc-qemu-riscv@gnu.org; Fri, 07 Feb 2020 09:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49568)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1j04ZV-0006va-OH
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 09:25:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1j04ZU-0004nL-LI
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 09:25:29 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43651
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1j04ZU-0004m9-HQ
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 09:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581085528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5giItzpYoo3JEelMMhtzAC6x4a3E/6AQgX4HqCHDuJE=;
 b=IrHwujr/KKkbDeHhI84y6uoAT3xB3bdXzhobs+Hc779Fre61PaQKCDn36Y3k/t6tmrTHbH
 nvFujgk5lY7BvuIMRr5ImXG+GkrgV9q4uxOfgkyeWmyBIEUtOBlefH7wyhVyLuOS0NjEzq
 DS66vCTVVupZzi6liC7eym9xectia2M=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-SXlYcNPcN2efdApe2SItkA-1; Fri, 07 Feb 2020 09:25:26 -0500
Received: by mail-qk1-f197.google.com with SMTP id r145so1508451qke.8
 for <qemu-riscv@nongnu.org>; Fri, 07 Feb 2020 06:25:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zs6K5DgkRqHV/ngJLTDOx4/uc8Jnp+hvbLz9w49py/Q=;
 b=jeDS1D8UoXMJUIUFR4p+pqOAsDWeWqdE5c9ItnsJM/B9URYa99xCvmzhNt7TqWmWgo
 62b5bE4ua3NKaECqS6U8P+5sWOfDM05qgeKzkBWYYcLd1akpqFOmp5m0/Hj6FGVp6isf
 op5xhVqt5+qIqGgySR+z870x9tkOSc5G1qU4WmEoc4oJWD7pG7D4cwwKfsMTgz0x72RF
 /gazJKNR4jS/rElcT+m/txvtr/YPMQiXbQ35Et/u7F5JVZjpRcGHMBdUd/rYUexkWdvt
 7S4k7aCmlb7YZ0kAvit35DDgDQxnjdftVVWD26rr5ozz5H6HxiiDY6ZjAI6DOUkDjWuK
 oQnQ==
X-Gm-Message-State: APjAAAWBLXmbTz2Dhq55FGSDrq29eTPljj4uuGmH/934aeGRPde7UT2C
 m62UZlXTKbh1zWFj1Lsghk6jfR0rvxtNdoeBi1pqzwjxsOdEv2lYAJ8G4FuvgPRyrYKOBvrKt13
 GBrTR/DKgm5pi0Ns=
X-Received: by 2002:ac8:607:: with SMTP id d7mr7573957qth.271.1581085525614;
 Fri, 07 Feb 2020 06:25:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqzmFBmC/C8aFTepE2yfJ9wB6lNLabovEOWo1q8396V/RXiRthP2BnpsoYobvSJMZLQVX0nzfQ==
X-Received: by 2002:ac8:607:: with SMTP id d7mr7573905qth.271.1581085525317;
 Fri, 07 Feb 2020 06:25:25 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id m204sm1407189qke.35.2020.02.07.06.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 06:25:24 -0800 (PST)
Date: Fri, 7 Feb 2020 09:25:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Anthony Green <green@moxielogic.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <rth@twiddle.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Michael Walle <michael@walle.cc>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Marek Vasut <marex@denx.de>, Jia Liu <proljc@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Huth <huth@tuxfamily.org>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v3 2/3] hw: Make MachineClass::is_default a boolean type
Message-ID: <20200207092450-mutt-send-email-mst@kernel.org>
References: <20200207130453.16666-1-philmd@redhat.com>
 <20200207130453.16666-3-philmd@redhat.com>
 <20200207091138-mutt-send-email-mst@kernel.org>
 <16ec9b38-94e4-bd2d-a47f-83a27289ab47@vivier.eu>
MIME-Version: 1.0
In-Reply-To: <16ec9b38-94e4-bd2d-a47f-83a27289ab47@vivier.eu>
X-MC-Unique: SXlYcNPcN2efdApe2SItkA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
X-List-Received-Date: Fri, 07 Feb 2020 14:25:31 -0000

On Fri, Feb 07, 2020 at 03:22:19PM +0100, Laurent Vivier wrote:
> Le 07/02/2020 =E0 15:11, Michael S. Tsirkin a =E9crit=A0:
> > On Fri, Feb 07, 2020 at 02:04:52PM +0100, Philippe Mathieu-Daud=E9 wrot=
e:
> >> There's no good reason for it to be type int, change it to bool.
> >>
> >> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> >> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> >=20
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >=20
> >> ---
> >> v3: new patch
> >> ---
> >>  include/hw/boards.h                      |  2 +-
> >>  hw/alpha/dp264.c                         |  2 +-
> >>  hw/cris/axis_dev88.c                     |  2 +-
> >>  hw/hppa/machine.c                        |  2 +-
> >>  hw/i386/pc_piix.c                        | 10 +++++-----
> >>  hw/lm32/lm32_boards.c                    |  2 +-
> >>  hw/m68k/mcf5208.c                        |  2 +-
> >>  hw/microblaze/petalogix_s3adsp1800_mmu.c |  2 +-
> >>  hw/mips/mips_malta.c                     |  2 +-
> >>  hw/moxie/moxiesim.c                      |  2 +-
> >>  hw/nios2/10m50_devboard.c                |  2 +-
> >>  hw/openrisc/openrisc_sim.c               |  2 +-
> >>  hw/ppc/mac_oldworld.c                    |  2 +-
> >>  hw/ppc/spapr.c                           |  2 +-
> >>  hw/riscv/spike.c                         |  2 +-
> >>  hw/s390x/s390-virtio-ccw.c               |  2 +-
> >>  hw/sh4/shix.c                            |  2 +-
> >>  hw/sparc/sun4m.c                         |  2 +-
> >>  hw/sparc64/niagara.c                     |  2 +-
> >>  hw/sparc64/sun4u.c                       |  4 ++--
> >>  hw/unicore32/puv3.c                      |  2 +-
> >>  21 files changed, 26 insertions(+), 26 deletions(-)
> >>
> ...
> >> diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
> >> index 5eb2d097b9..81a1748fad 100644
> >> --- a/hw/sparc64/niagara.c
> >> +++ b/hw/sparc64/niagara.c
> >> @@ -170,7 +170,7 @@ static void niagara_class_init(ObjectClass *oc, vo=
id *data)
> >> =20
> >>      mc->desc =3D "Sun4v platform, Niagara";
> >>      mc->init =3D niagara_init;
> >> -    mc->max_cpus =3D 1; /* XXX for now */
> >> +    mc->max_cpus =3D true; /* XXX for now */
>=20
> what happened here ^^^
>=20
> >>      mc->default_boot_order =3D "c";
> >>      mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("Sun-UltraSparc-T1")=
;
> >>  }
> >> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> >> index b7ac42f7a5..3c2c9d2eb0 100644
> >> --- a/hw/sparc64/sun4u.c
> >> +++ b/hw/sparc64/sun4u.c
> >> @@ -816,7 +816,7 @@ static void sun4u_class_init(ObjectClass *oc, void=
 *data)
> >>      mc->init =3D sun4u_init;
> >>      mc->block_default_type =3D IF_IDE;
> >>      mc->max_cpus =3D 1; /* XXX for now */
> >> -    mc->is_default =3D 1;
> >> +    mc->is_default =3D true;
> >>      mc->default_boot_order =3D "c";
> >>      mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("TI-UltraSparc-IIi")=
;
> >>      mc->ignore_boot_device_suffixes =3D true;
> >> @@ -841,7 +841,7 @@ static void sun4v_class_init(ObjectClass *oc, void=
 *data)
> >>      mc->desc =3D "Sun4v platform";
> >>      mc->init =3D sun4v_init;
> >>      mc->block_default_type =3D IF_IDE;
> >> -    mc->max_cpus =3D 1; /* XXX for now */
> >> +    mc->max_cpus =3D true; /* XXX for now */
>=20
> and here ^^
>=20
> Thanks,
> Laurent

Ooh good catch. Which probably means we don't have a unit test for these
...


