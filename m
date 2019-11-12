Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iUWWP-0003sC-9m
	for mharc-qemu-riscv@gnu.org; Tue, 12 Nov 2019 08:47:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52172)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iUWWM-0003qH-OR
 for qemu-riscv@nongnu.org; Tue, 12 Nov 2019 08:47:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iUWWK-00064V-PD
 for qemu-riscv@nongnu.org; Tue, 12 Nov 2019 08:47:50 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41754
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iUWWG-0005qI-Mw
 for qemu-riscv@nongnu.org; Tue, 12 Nov 2019 08:47:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573566454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RYLIFYQlGm9Ki6YHiQ6cr/ujzB2VBpC1BfYM0Iim6bA=;
 b=T5gs3IXM0rIlCcCwqVoTT3fxfphT9IDzAu5lpjrKz1S/Ont/MGqPVSQcjjX0cfoeZbDVG3
 +OAETxwth7WuECnYXEmL9ike/D2ISd6i84TDiy1ohTfQps1c+95XtM04U3b2YJWBghw9bU
 9HIdadj1fy1s+Ip19xWOTLQm365Rc+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-zlx4a0vzMP2Ou6GrLn4HXA-1; Tue, 12 Nov 2019 08:47:31 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DF3385EE6D;
 Tue, 12 Nov 2019 13:47:27 +0000 (UTC)
Received: from gondolin (dhcp-192-218.str.redhat.com [10.33.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CE076106A;
 Tue, 12 Nov 2019 13:46:40 +0000 (UTC)
Date: Tue, 12 Nov 2019 14:46:38 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "armbru@redhat.com"
 <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, "Gonglei (Arei)"
 <arei.gonglei@huawei.com>, Eduardo Habkost <ehabkost@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Amit
 Shah <amit@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, John Snow <jsnow@redhat.com>, Ari Sundholm
 <ari@tuxera.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Paolo Bonzini
 <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng
 <fam@euphon.net>, Stefan Weil <sw@weilnetz.de>, Ronnie Sahlberg
 <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>, Eric Blake
 <eblake@redhat.com>, Denis Lunev <den@virtuozzo.com>, Alberto Garcia
 <berto@igalia.com>, Jason Dillaman <dillaman@redhat.com>, Wen Congyang
 <wencongyang2@huawei.com>, Xie Changlong <xiechanglong.d@gmail.com>, Liu
 Yuan <namei.unix@gmail.com>, "Richard W.M. Jones" <rjones@redhat.com>, Jeff
 Cody <codyprime@gmail.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Richard Henderson <rth@twiddle.net>, Greg Kurz
 <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?Q8OpZHJpYw==?= Le
 Goater <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>, Antony Pavlov
 <antonynpavlov@gmail.com>, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Chubb <peter.chubb@nicta.com.au>, Subbaraya Sundeep
 <sundeep.lkml@gmail.com>, Eric Auger <eric.auger@redhat.com>, Alistair
 Francis <alistair@alistair23.me>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paul Burton <pburton@wavecomp.com>, Aleksandar Rikalo
 <arikalo@wavecomp.com>, Chris Wulff <crwulff@gmail.com>, Marek Vasut
 <marex@denx.de>, David Gibson <david@gibson.dropbear.id.au>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>, Xiao Guangrong
 <xiaoguangrong.eric@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Jason Wang <jasowang@redhat.com>, Laszlo
 Ersek <lersek@redhat.com>, Yuval Shaia <yuval.shaia@oracle.com>, Palmer
 Dabbelt <palmer@sifive.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, David Hildenbrand
 <david@redhat.com>, Thomas Huth <thuth@redhat.com>, Eric Farman
 <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Hannes
 Reinecke <hare@suse.com>, Michael Walle <michael@walle.cc>, Artyom
 Tarasenko <atar4qemu@gmail.com>, Stefan Berger <stefanb@linux.ibm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Alex Williamson
 <alex.williamson@redhat.com>, Tony Krowiak <akrowiak@linux.ibm.com>, Pierre
 Morel <pmorel@linux.ibm.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Luigi Rizzo <rizzo@iet.unipi.it>, Giuseppe Lettieri
 <g.lettieri@iet.unipi.it>, Vincenzo Maffione <v.maffione@gmail.com>, Jan
 Kiszka <jan.kiszka@siemens.com>, Anthony Green <green@moxielogic.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Max
 Filippov <jcmvbkbc@gmail.com>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "integration@gluster.org"
 <integration@gluster.org>, "sheepdog@lists.wpkg.org"
 <sheepdog@lists.wpkg.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, "qemu-s390x@nongnu.org"
 <qemu-s390x@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: Re: [RFC v5 000/126] error: auto propagated local_err
Message-ID: <20191112144638.4baf555a.cohuck@redhat.com>
In-Reply-To: <CAMxuvawy_TStTDXYoNF0zFjh6eOF1EUKe6BYAxUo_S9-cxMPSg@mail.gmail.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <d1756cd0-8ad7-1e6c-b127-59ed24c5e512@virtuozzo.com>
 <CAMxuvawy_TStTDXYoNF0zFjh6eOF1EUKe6BYAxUo_S9-cxMPSg@mail.gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: zlx4a0vzMP2Ou6GrLn4HXA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-List-Received-Date: Tue, 12 Nov 2019 13:47:52 -0000

On Fri, 8 Nov 2019 22:57:25 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:

> Hi
>=20
> On Fri, Nov 8, 2019 at 7:31 PM Vladimir Sementsov-Ogievskiy
> <vsementsov@virtuozzo.com> wrote:
> >
> > Finally, what is the plan?
> >
> > Markus what do you think?
> >
> > Now a lot of patches are reviewed, but a lot of are not.
> >
> > Is there any hope that all patches will be reviewed? Should I resend th=
e
> > whole series, or may be reduce it to reviewed subsystems only? =20
>=20
> I don't think we have well established rules for whole-tree cleanups
> like this. In the past, several cleanup series got lost.

Yes, it is always problematic if a series touches a lot of different
subsystems.

>=20
> It will take ages to get every subsystem maintainer to review the
> patches. Most likely, since they are quite systematic, there isn't
> much to say and it is easy to miss something that has some hidden
> ramifications. Perhaps whole-tree cleanups should require at least 2
> reviewers to bypass the subsytem maintainer review? But my past
> experience with this kind of exercice doesn't encourage me, and
> probably I am not the only one.

It's not just the reviews; it's easy to miss compile problems on less
mainstream architectures (and even easier to miss functional problems
there, although they are probably less likely with automated rework.)
CI can probably help, but that's something for the future.

Anyway, I've now gotten around to that series; spotted one problem in
s390x code, I think.

One thing that's helpful for such a large series is a git branch that
makes it easy to give the series a quick go. (You can use patchew, but
it takes time before it gets all mails, so just pushing it somewhere
and letting people know is a good idea anyway.)


