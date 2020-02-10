Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j14no-0001JL-Di
	for mharc-qemu-riscv@gnu.org; Mon, 10 Feb 2020 03:52:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39929)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1j14nl-0001GF-5Z
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2020 03:52:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1j14ni-0006pn-Sp
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2020 03:52:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34205
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1j14ni-0006nS-BW
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2020 03:52:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581324736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2qvLKvR6lloHNcabmzeKz5cd3QuLin2gQzKbfn4c1EY=;
 b=K9JTACotr7DiW/tV5zas8y+F0fw9VjTrBV9UDhOGCsSShOphOCXr5mfSvP39qjmA2mKdZz
 1LNN8n2jap4mIIJNWBTQb9p72nlobhRGSCawubwUHojHocSrcDFuyGbjuH2gBrglT7/q/N
 pDrrvdb1wCtrkPG9j6y2hrrjctipG7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-vdjG_Zp9MVeI9HmFOvkC0w-1; Mon, 10 Feb 2020 03:52:15 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1F6C107ACC7;
 Mon, 10 Feb 2020 08:52:09 +0000 (UTC)
Received: from gondolin (ovpn-117-244.ams2.redhat.com [10.36.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A4015C1D4;
 Mon, 10 Feb 2020 08:51:45 +0000 (UTC)
Date: Mon, 10 Feb 2020 09:51:42 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, qemu-ppc@nongnu.org, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, David Gibson <david@gibson.dropbear.id.au>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Anthony Green <green@moxielogic.com>, Richard Henderson
 <richard.henderson@linaro.org>, Artyom Tarasenko <atar4qemu@gmail.com>,
 qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org, "Michael S.
 Tsirkin" <mst@redhat.com>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>, Michael
 Walle <michael@walle.cc>, Halil Pasic <pasic@linux.ibm.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-s390x@nongnu.org, Richard
 Henderson <rth@twiddle.net>, Thomas Huth <huth@tuxfamily.org>, Magnus Damm
 <magnus.damm@gmail.com>, David Hildenbrand <david@redhat.com>, Chris Wulff
 <crwulff@gmail.com>, Stafford Horne <shorne@gmail.com>, Helge Deller
 <deller@gmx.de>, Alistair Francis <Alistair.Francis@wdc.com>, Jia Liu
 <proljc@gmail.com>
Subject: Re: [PATCH v4 2/3] hw: Make MachineClass::is_default a boolean type
Message-ID: <20200210095142.7fe048e9.cohuck@redhat.com>
In-Reply-To: <20200207161948.15972-3-philmd@redhat.com>
References: <20200207161948.15972-1-philmd@redhat.com>
 <20200207161948.15972-3-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: vdjG_Zp9MVeI9HmFOvkC0w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 10 Feb 2020 08:52:23 -0000

On Fri,  7 Feb 2020 17:19:47 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> There's no good reason for it to be type int, change it to bool.
>=20
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v4:
> - fixed incorrect changes to max_cpus (Laurent)
> - describe field
> ---
>  include/hw/boards.h                      |  4 +++-
>  hw/alpha/dp264.c                         |  2 +-
>  hw/cris/axis_dev88.c                     |  2 +-
>  hw/hppa/machine.c                        |  2 +-
>  hw/i386/pc_piix.c                        | 10 +++++-----
>  hw/lm32/lm32_boards.c                    |  2 +-
>  hw/m68k/mcf5208.c                        |  2 +-
>  hw/microblaze/petalogix_s3adsp1800_mmu.c |  2 +-
>  hw/mips/mips_malta.c                     |  2 +-
>  hw/moxie/moxiesim.c                      |  2 +-
>  hw/nios2/10m50_devboard.c                |  2 +-
>  hw/openrisc/openrisc_sim.c               |  2 +-
>  hw/ppc/mac_oldworld.c                    |  2 +-
>  hw/ppc/spapr.c                           |  2 +-
>  hw/riscv/spike.c                         |  2 +-
>  hw/s390x/s390-virtio-ccw.c               |  2 +-
>  hw/sh4/shix.c                            |  2 +-
>  hw/sparc/sun4m.c                         |  2 +-
>  hw/sparc64/sun4u.c                       |  2 +-
>  hw/unicore32/puv3.c                      |  2 +-
>  20 files changed, 26 insertions(+), 24 deletions(-)

s390 part:

Acked-by: Cornelia Huck <cohuck@redhat.com>


