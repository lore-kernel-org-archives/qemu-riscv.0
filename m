Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iUVvj-00071o-5T
	for mharc-qemu-riscv@gnu.org; Tue, 12 Nov 2019 08:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47703)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iUVvg-00070r-GJ
 for qemu-riscv@nongnu.org; Tue, 12 Nov 2019 08:09:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iUVvf-0007td-Fd
 for qemu-riscv@nongnu.org; Tue, 12 Nov 2019 08:09:56 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42862
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iUVvf-0007tH-Ai
 for qemu-riscv@nongnu.org; Tue, 12 Nov 2019 08:09:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573564194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ExOAjPbS2nTR50G1z/MZukkj/KFXFG4y01OM1qLbB7E=;
 b=g7oPESo2Ho1mOwfYzkmi0yTm3Vz+FZClOm8+qMupKxGD0n1NjTtLIK7aEcRtfyDtFjXd6p
 jmmV87hmKs+l2G7cAw7cTD8jCrhXQ1ur2wRSn0CDRllxS3hK6i8CGHL2H+6iqqrLVkuMAC
 G45aEi56358YnYs3IBQ+wE7BjNDJl8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-cJbp8iMbNVK94nX1TElAnA-1; Tue, 12 Nov 2019 08:09:53 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71F69800C72;
 Tue, 12 Nov 2019 13:09:49 +0000 (UTC)
Received: from gondolin (dhcp-192-218.str.redhat.com [10.33.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF1E05C1D8;
 Tue, 12 Nov 2019 13:08:57 +0000 (UTC)
Date: Tue, 12 Nov 2019 14:08:55 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, Gerd Hoffmann
 <kraxel@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eduardo
 Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, Kevin Wolf
 <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>, John Snow
 <jsnow@redhat.com>, Ari Sundholm <ari@tuxera.com>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, Paolo Bonzini <pbonzini@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Stefan Weil
 <sw@weilnetz.de>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven
 <pl@kamp.de>, Eric Blake <eblake@redhat.com>, "Denis V. Lunev"
 <den@openvz.org>, Alberto Garcia <berto@igalia.com>, Jason Dillaman
 <dillaman@redhat.com>, Wen Congyang <wencongyang2@huawei.com>, Xie
 Changlong <xiechanglong.d@gmail.com>, Liu Yuan <namei.unix@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, "Daniel
 P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Richard Henderson
 <rth@twiddle.net>, Greg Kurz <groug@kaod.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Beniamino
 Galvani <b.galvani@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@redhat.com>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Peter Chubb
 <peter.chubb@nicta.com.au>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Eric Auger <eric.auger@redhat.com>, Alistair Francis
 <alistair@alistair23.me>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
 <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, Paul Burton
 <pburton@wavecomp.com>, Aleksandar Rikalo <arikalo@wavecomp.com>, Chris
 Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>, David Gibson
 <david@gibson.dropbear.id.au>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@de.ibm.com>, =?UTF-8?B?SGVydsOp?= Poussineau
 <hpoussin@reactos.org>, Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Aleksandar Markovic
 <amarkovic@wavecomp.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jason Wang <jasowang@redhat.com>, Laszlo Ersek <lersek@redhat.com>, Yuval
 Shaia <yuval.shaia@oracle.com>, Palmer Dabbelt <palmer@sifive.com>, Sagar
 Karandikar <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, David Hildenbrand <david@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>, Matthew
 Rosato <mjrosato@linux.ibm.com>, Hannes Reinecke <hare@suse.com>, Michael
 Walle <michael@walle.cc>, Artyom Tarasenko <atar4qemu@gmail.com>, Stefan
 Berger <stefanb@linux.ibm.com>, Samuel Thibault
 <samuel.thibault@ens-lyon.org>, Alex Williamson
 <alex.williamson@redhat.com>, Tony Krowiak <akrowiak@linux.ibm.com>, Pierre
 Morel <pmorel@linux.ibm.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Luigi Rizzo <rizzo@iet.unipi.it>, Giuseppe Lettieri
 <g.lettieri@iet.unipi.it>, Vincenzo Maffione <v.maffione@gmail.com>, Jan
 Kiszka <jan.kiszka@siemens.com>, Anthony Green <green@moxielogic.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Max
 Filippov <jcmvbkbc@gmail.com>, qemu-block@nongnu.org,
 integration@gluster.org, sheepdog@lists.wpkg.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [RFC v5 026/126] python: add commit-per-subsystem.py
Message-ID: <20191112140855.5001fba9.cohuck@redhat.com>
In-Reply-To: <20191011160552.22907-27-vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <20191011160552.22907-27-vsementsov@virtuozzo.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: cJbp8iMbNVK94nX1TElAnA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
X-List-Received-Date: Tue, 12 Nov 2019 13:09:57 -0000

On Fri, 11 Oct 2019 19:04:12 +0300
Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:

> Add script to automatically commit tree-wide changes per-subsystem.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---

I think this still needs some notes as to the supposed usage.


