Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j15Tv-0005W7-F1
	for mharc-qemu-riscv@gnu.org; Mon, 10 Feb 2020 04:35:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45529)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1j15Ts-0005V7-TZ
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2020 04:35:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1j15Tr-0005AB-QW
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2020 04:35:52 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:56699
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1j15Tr-00059W-NE
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2020 04:35:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581327351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=xuBMgiSqdTSsGF1dZsZw842HHLW31mEJyhLUTT87ehY=;
 b=X+9buSOACrAs+kekRTW79nju+80vxTboJf6At2t7r9MhBPZrP0Ihcl/uVhiUB4qyGjs+hm
 yPHKT+gJGndX+LfsDEdtnvYnrPGKR5LCZNfTzrR5itYUjzYEBPlr+Zu2XKRYn93FWMn7y5
 rCoKkPxndCCwmrdMgv30D7cBNBACa6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-Y0kBKoXXPk2KYvYl9-B9LA-1; Mon, 10 Feb 2020 04:35:49 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CD7E18A6EC2;
 Mon, 10 Feb 2020 09:35:45 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-219.ams2.redhat.com [10.36.116.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EC2960BF1;
 Mon, 10 Feb 2020 09:35:25 +0000 (UTC)
Subject: Tricore default machine (was: [PATCH v4 1/3] hw: Do not initialize
 MachineClass::is_default to 0)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Jia Liu <proljc@gmail.com>, qemu-trivial@nongnu.org,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20200207161948.15972-1-philmd@redhat.com>
 <20200207161948.15972-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <9590e020-226d-bc85-e496-95b4f0116f69@redhat.com>
Date: Mon, 10 Feb 2020 10:35:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200207161948.15972-2-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: Y0kBKoXXPk2KYvYl9-B9LA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Mon, 10 Feb 2020 09:35:54 -0000

On 07/02/2020 17.19, Philippe Mathieu-Daud=C3=A9 wrote:
> The MachineClass is already zeroed on creation.
>=20
> Note: The code setting is_default=3D0 in hw/i386/pc_piix.c is
>       different (related to compat options). When adding a
>       new versioned machine, we want it to be the new default,
>       so we have to mark the previous one as not default.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v3: new patch
> ---
>  hw/lm32/lm32_boards.c               | 1 -
>  hw/lm32/milkymist.c                 | 1 -
>  hw/m68k/q800.c                      | 1 -
>  hw/microblaze/petalogix_ml605_mmu.c | 1 -
>  hw/tricore/tricore_testboard.c      | 1 -
>  5 files changed, 5 deletions(-)
[...]
> diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboar=
d.c
> index 20c9ccb3ce..8ec2b5bddd 100644
> --- a/hw/tricore/tricore_testboard.c
> +++ b/hw/tricore/tricore_testboard.c
> @@ -105,7 +105,6 @@ static void ttb_machine_init(MachineClass *mc)
>  {
>      mc->desc =3D "a minimal TriCore board";
>      mc->init =3D tricoreboard_init;
> -    mc->is_default =3D 0;
>      mc->default_cpu_type =3D TRICORE_CPU_TYPE_NAME("tc1796");
>  }

I wonder whether we should simply make that machine the default for
qemu-system-tricore? There is only one machine here, and not having a
default machine always causes some headaches in the tests...
(see e.g. tests/qemu-iotests/check for example)

 Thomas


