Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iXQ74-0002Wv-Sn
	for mharc-qemu-riscv@gnu.org; Wed, 20 Nov 2019 08:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36810)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iXPoM-00027k-3o
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2019 08:14:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iXPoK-0008AQ-4N
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2019 08:14:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56127
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iXPoJ-00089G-Vv
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2019 08:14:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574255659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FPXFGLzziNWXlHtDlx+id3E16uwnVocjU9q+wnQ7Ym4=;
 b=dklurGm/7LUnexueoMxxcQrygijCTwfIJvZYLKHFm1hQEmFKOcszmhD/wdO+OX6BUepCf+
 BXhcHekTLc2wgpHFDfZ7VXDBXwJ+KigXqqmtBNOI5MRmg8Z7AgFLpWtsGi612eClJYnFPV
 rI5OwB43QGtKd1XEDYAiQYpw2dtk+9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-8D4dw5wwPgemGbK8SniO-Q-1; Wed, 20 Nov 2019 08:14:17 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A3C01005502;
 Wed, 20 Nov 2019 13:14:13 +0000 (UTC)
Received: from linux.fritz.box (unknown [10.36.118.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E45636106E;
 Wed, 20 Nov 2019 13:13:23 +0000 (UTC)
Date: Wed, 20 Nov 2019 14:13:22 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Ari Sundholm <ari@tuxera.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Weil <sw@weilnetz.de>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Peter Lieven <pl@kamp.de>, Denis Lunev <den@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, Jason Dillaman <dillaman@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Liu Yuan <namei.unix@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Greg Kurz <groug@kaod.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul@xen.org>, Paul Burton <pburton@wavecomp.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jason Wang <jasowang@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Yuval Shaia <yuval.shaia@oracle.com>, Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Hildenbrand <david@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Hannes Reinecke <hare@suse.com>, Michael Walle <michael@walle.cc>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefan Berger <stefanb@linux.ibm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Luigi Rizzo <rizzo@iet.unipi.it>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
 Vincenzo Maffione <v.maffione@gmail.com>,
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
Subject: Re: [RFC v5 000/126] error: auto propagated local_err
Message-ID: <20191120131322.GB5779@linux.fritz.box>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <d1756cd0-8ad7-1e6c-b127-59ed24c5e512@virtuozzo.com>
 <538354c8-7ba9-8b1c-476e-5733c418207b@virtuozzo.com>
 <606dbe22-0d1e-66bb-aba9-681ca7961623@redhat.com>
MIME-Version: 1.0
In-Reply-To: <606dbe22-0d1e-66bb-aba9-681ca7961623@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 8D4dw5wwPgemGbK8SniO-Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-Mailman-Approved-At: Wed, 20 Nov 2019 08:33:41 -0500
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
X-List-Received-Date: Wed, 20 Nov 2019 13:14:23 -0000

Am 20.11.2019 um 13:59 hat Eric Blake geschrieben:
> On 11/20/19 3:50 AM, Vladimir Sementsov-Ogievskiy wrote:
> > Okay...
> >=20
> > I think that:
> >=20
> > 1. A lot of efforts (not only my, I think reviewing is already exceeded=
 generation efforts)
> >     are made, it would be sad to lose them.
> >=20
> > 2. It's safe enough to apply only part of generated patches: we just fi=
x error_abort/error_fatal
> >     in more popular subsystems, what's wrong with that? Why not to cove=
r 80% cases by 20% efforts?
> >=20
> > 3. It's obviously impossible to merge the whole series. A lot of time p=
assed, series diverges.
> >=20
> >=20
> > So I propose the following plan:
> >=20
> > 1. I resend small separate series of preparation patches per maintainer=
. They are good anyway.
> >=20
> > 2. We commit patch with macro (changing MUST to SHOULD in documentation=
) and coccinelle script.
> >      (or that may be combined with the first series from [3.])
> >=20
> > 3. When one of preparations taken to maintainer's tree, I send generate=
d patches for
> >      its maintainer.
>=20
> I'd still prefer waiting for direction from Markus.  We've been tied up b=
y
> other things (KVM Forum, 4.2 release), but now that we are in freeze, thi=
s
> is actually a GOOD time for Markus to finally get back to this series, an=
d
> there is going to be less rebasing needed if we can apply the entire clea=
nup
> right as 5.0 development opens in a couple of weeks.

Actually, that's possibly the worst possible time for avoiding conflicts
because during freeze, maintainers are collecting stuff in private
branches for weeks without getting it into master.

If you are the one who gets merged first (what are the odds?), that
solves the problem for you, but then everyone else will get conflicts.

I like Vladimir's new plan.

Kevin


