Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ihuj1-0007fk-1v
	for mharc-qemu-riscv@gnu.org; Thu, 19 Dec 2019 07:16:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59139)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ihuix-0007dY-HL
 for qemu-riscv@nongnu.org; Thu, 19 Dec 2019 07:16:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ihuiu-0002r6-UK
 for qemu-riscv@nongnu.org; Thu, 19 Dec 2019 07:16:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53571
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ihuiu-0002mH-Lh
 for qemu-riscv@nongnu.org; Thu, 19 Dec 2019 07:16:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576757768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BG6PkLmSL2pjmhhB/FbOkgZYwFjUekTzuEU4/82gflc=;
 b=P1mmEqwQzIP8F0ZMMgVcccM5bJXW2PTvl7wNxtygQ3Eiw79KmIffT8PI19hPmsSGm20Wbx
 61/eS5pfTdzYhZtccWL7OxCnid4q+iUCRpPdwqr7q7ObAgt2F8DtXCJELGzC70IpCpBqVi
 K4l8WdjOc8juB2plIPWoJxn8L4obFiI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-tSMJREfxMfiGGg5W44LUMg-1; Thu, 19 Dec 2019 07:16:06 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DCF5107ACC5;
 Thu, 19 Dec 2019 12:16:01 +0000 (UTC)
Received: from gondolin (ovpn-117-134.ams2.redhat.com [10.36.117.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 248825C54A;
 Thu, 19 Dec 2019 12:15:30 +0000 (UTC)
Date: Thu, 19 Dec 2019 13:15:26 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, Andrzej Zaborowski <balrogg@gmail.com>, Peter
 Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, Alistair Francis
 <alistair@alistair23.me>, Antony Pavlov <antonynpavlov@gmail.com>, Igor
 Mitsyanko <i.mitsyanko@gmail.com>, Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Peter Chubb
 <peter.chubb@nicta.com.au>, Alberto Garcia <berto@igalia.com>, Michael
 Walle <michael@walle.cc>, Thomas Huth <huth@tuxfamily.org>, Joel Stanley
 <joel@jms.id.au>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Laurent Vivier <lvivier@redhat.com>, Amit Shah
 <amit@kernel.org>, Corey Minyard <minyard@acm.org>, Paul Burton
 <pburton@wavecomp.com>, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Aleksandar Markovic
 <amarkovic@wavecomp.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sagar
 Karandikar <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Gerd Hoffmann <kraxel@redhat.com>, Samuel
 Thibault <samuel.thibault@ens-lyon.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>, Zhang Chen
 <chen.zhang@intel.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang
 <jasowang@redhat.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [RFC PATCH v2 14/14] chardev: Use QEMUChrEvent enum in
 IOEventHandler typedef
Message-ID: <20191219131526.776cdcb0.cohuck@redhat.com>
In-Reply-To: <20191218172009.8868-15-philmd@redhat.com>
References: <20191218172009.8868-1-philmd@redhat.com>
 <20191218172009.8868-15-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: tSMJREfxMfiGGg5W44LUMg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Thu, 19 Dec 2019 12:16:13 -0000

On Wed, 18 Dec 2019 18:20:09 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> The Chardev events are listed in the QEMUChrEvent enum.
>=20
> By using the enum in the IOEventHandler typedef we:
>=20
> - make the IOEventHandler type more explicit (this handler
>   process out-of-band information, while the IOReadHandler
>   is in-band),
> - help static code analyzers.
>=20
> This patch was produced with the following spatch script:
>=20
>   @match@
>   expression backend, opaque, context, set_open;
>   identifier fd_can_read, fd_read, fd_event, be_change;
>   @@
>   qemu_chr_fe_set_handlers(backend, fd_can_read, fd_read, fd_event,
>                            be_change, opaque, context, set_open);
>=20
>   @depends on match@
>   identifier opaque, event;
>   identifier match.fd_event;
>   @@
>    static
>   -void fd_event(void *opaque, int event)
>   +void fd_event(void *opaque, QEMUChrEvent event)
>    {
>    ...
>    }
>=20
> Then the following files were manually modified:
>=20
>   - include/chardev/char-fe.h
>   - include/chardev/char.h
>   - include/chardev/char-mux.h
>   - chardev/char.c
>   - chardev/char-mux.c
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

(...)

> diff --git a/hw/char/terminal3270.c b/hw/char/terminal3270.c
> index 2aab04fd4b..f7aba12565 100644
> --- a/hw/char/terminal3270.c
> +++ b/hw/char/terminal3270.c
> @@ -142,7 +142,7 @@ static void terminal_read(void *opaque, const uint8_t=
 *buf, int size)
>      }
>  }
> =20
> -static void chr_event(void *opaque, int event)
> +static void chr_event(void *opaque, QEMUChrEvent event)
>  {
>      Terminal3270 *t =3D opaque;
>      CcwDevice *ccw_dev =3D CCW_DEVICE(t);

Acked-by: Cornelia Huck <cohuck@redhat.com>


