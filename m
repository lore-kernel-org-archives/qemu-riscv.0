Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iXPai-0003eZ-5M
	for mharc-qemu-riscv@gnu.org; Wed, 20 Nov 2019 08:00:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33735)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iXPaf-0003Zr-77
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2019 08:00:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iXPad-0000K6-NU
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2019 08:00:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37287
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iXPad-0000Ix-GC
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2019 08:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574254810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rzXyhKN6JI07guKLYgMixvCs/MyYGuc0l5Klz8/DR+E=;
 b=ivuZ/1Qs/CsvNhawlMo9g0KP5SXItJgZbPwTAldLLNiJJBAzz/jocyUlhf/5+D1FRKD8UW
 W5WxOClBxF/BWLt/hrxVQ/RW9ZVc3O4nS55JvvHdy0JuTujM5sj9nfWJyykxijk9TTHBFd
 FxMNGB9hl4lTa0K3Dx2/Oz/myQWE0ug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-tkrQfcfNNXSPOST1rxoQEw-1; Wed, 20 Nov 2019 08:00:03 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1397191220;
 Wed, 20 Nov 2019 12:59:59 +0000 (UTC)
Received: from [10.3.116.221] (ovpn-116-221.phx2.redhat.com [10.3.116.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DEAB69300;
 Wed, 20 Nov 2019 12:59:16 +0000 (UTC)
Subject: Re: [RFC v5 000/126] error: auto propagated local_err
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "armbru@redhat.com" <armbru@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Stefan Weil <sw@weilnetz.de>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 Denis Lunev <den@virtuozzo.com>, Alberto Garcia <berto@igalia.com>,
 Jason Dillaman <dillaman@redhat.com>, Wen Congyang
 <wencongyang2@huawei.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 Liu Yuan <namei.unix@gmail.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Jeff Cody <codyprime@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Greg Kurz <groug@kaod.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Eric Auger <eric.auger@redhat.com>, Alistair Francis
 <alistair@alistair23.me>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paul Burton <pburton@wavecomp.com>, Aleksandar Rikalo
 <arikalo@wavecomp.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, David Gibson <david@gibson.dropbear.id.au>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jason Wang <jasowang@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Yuval Shaia <yuval.shaia@oracle.com>, Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Hannes Reinecke <hare@suse.com>, Michael Walle <michael@walle.cc>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Stefan Berger
 <stefanb@linux.ibm.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Luigi Rizzo <rizzo@iet.unipi.it>, Giuseppe Lettieri
 <g.lettieri@iet.unipi.it>, Vincenzo Maffione <v.maffione@gmail.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Anthony Green <green@moxielogic.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "integration@gluster.org" <integration@gluster.org>,
 "sheepdog@lists.wpkg.org" <sheepdog@lists.wpkg.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <d1756cd0-8ad7-1e6c-b127-59ed24c5e512@virtuozzo.com>
 <538354c8-7ba9-8b1c-476e-5733c418207b@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <606dbe22-0d1e-66bb-aba9-681ca7961623@redhat.com>
Date: Wed, 20 Nov 2019 06:59:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <538354c8-7ba9-8b1c-476e-5733c418207b@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: tkrQfcfNNXSPOST1rxoQEw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-List-Received-Date: Wed, 20 Nov 2019 13:00:14 -0000

On 11/20/19 3:50 AM, Vladimir Sementsov-Ogievskiy wrote:
> Okay...
>=20
> I think that:
>=20
> 1. A lot of efforts (not only my, I think reviewing is already exceeded g=
eneration efforts)
>     are made, it would be sad to lose them.
>=20
> 2. It's safe enough to apply only part of generated patches: we just fix =
error_abort/error_fatal
>     in more popular subsystems, what's wrong with that? Why not to cover =
80% cases by 20% efforts?
>=20
> 3. It's obviously impossible to merge the whole series. A lot of time pas=
sed, series diverges.
>=20
>=20
> So I propose the following plan:
>=20
> 1. I resend small separate series of preparation patches per maintainer. =
They are good anyway.
>=20
> 2. We commit patch with macro (changing MUST to SHOULD in documentation) =
and coccinelle script.
>      (or that may be combined with the first series from [3.])
>=20
> 3. When one of preparations taken to maintainer's tree, I send generated =
patches for
>      its maintainer.

I'd still prefer waiting for direction from Markus.  We've been tied up=20
by other things (KVM Forum, 4.2 release), but now that we are in freeze,=20
this is actually a GOOD time for Markus to finally get back to this=20
series, and there is going to be less rebasing needed if we can apply=20
the entire cleanup right as 5.0 development opens in a couple of weeks.


>=20
>=20
> If no objections during a week, I'll start that plan, hope someone will s=
upport it.
>=20
>=20


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


