Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gr1BM-0006Gr-6o
	for mharc-qemu-riscv@gnu.org; Tue, 05 Feb 2019 08:54:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gqyX3-0003xT-GP
	for qemu-riscv@nongnu.org; Tue, 05 Feb 2019 06:04:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gqyWw-0001g2-Ov
	for qemu-riscv@nongnu.org; Tue, 05 Feb 2019 06:04:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37286)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1gqyWq-0001YU-A5; Tue, 05 Feb 2019 06:04:36 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7DB68667A;
	Tue,  5 Feb 2019 11:04:25 +0000 (UTC)
Received: from redhat.com (unknown [10.36.112.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92B245D6A6;
	Tue,  5 Feb 2019 11:04:20 +0000 (UTC)
Date: Tue, 5 Feb 2019 11:04:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-riscv@nongnu.org,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <20190205110417.GF20321@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20190204211204.27321-1-philmd@redhat.com>
	<20190204211204.27321-4-philmd@redhat.com>
	<87a7jaag7q.fsf@dusky.pond.sub.org>
	<CAFEAcA8-YDTnszv7Mk+F+OAxGJSmdu4yEio1j-E477HNbh-SOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA8-YDTnszv7Mk+F+OAxGJSmdu4yEio1j-E477HNbh-SOQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 05 Feb 2019 11:04:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Tue, 05 Feb 2019 08:54:34 -0500
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 3/3] util/cutils: Move
 function documentations to the header
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2019 11:04:55 -0000

On Tue, Feb 05, 2019 at 10:56:51AM +0000, Peter Maydell wrote:
> On Tue, 5 Feb 2019 at 06:44, Markus Armbruster <armbru@redhat.com> wrote:
> > There are two justifiable function comment placement styles: (1) next to
> > definition, and (2) next to declaration if it's in a header, else next
> > to definition.
> >
> > The rationale for the latter is having the headers do double-duty as
> > interface documentation.
> >
> > The rationale for the former is consistently placing the function
> > comments close to the code gives them a fighting chance to actually
> > match the code.
> >
> > I'm in the "next to definition" camp.  If you want concise interface
> > specification, use something like Sphinx.
> 
> I'm in the "next to declaration" camp. I don't want to have
> to wade into your implementation to find out what it does:
> document it for me in the interface, please.

I'm already looking at the header file to identify the function signature,
having the explanation / docs at the same place is desirable, especially
when the C file name is completely different from the header file name
forcing me to go grepping the code base to find where it is implemented.
The .c files are already volumous in size so not amenable to browsing
for the purpose of reading the docs.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

