Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqzsS-0004Av-9R
	for mharc-qemu-riscv@gnu.org; Tue, 05 Feb 2019 07:31:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gqzsK-00048Q-Gv
	for qemu-riscv@nongnu.org; Tue, 05 Feb 2019 07:30:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gqzsJ-0001GQ-KR
	for qemu-riscv@nongnu.org; Tue, 05 Feb 2019 07:30:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45746)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gqzsC-00019Y-J6; Tue, 05 Feb 2019 07:30:45 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7278A3DBF8;
	Tue,  5 Feb 2019 12:30:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-113.ams2.redhat.com
	[10.36.116.113])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AB3579C01;
	Tue,  5 Feb 2019 12:30:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D4FD211386C5; Tue,  5 Feb 2019 13:30:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  qemu-riscv@nongnu.org,  QEMU
	Trivial <qemu-trivial@nongnu.org>,  QEMU Developers
	<qemu-devel@nongnu.org>,  Stefano Garzarella <sgarzare@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, David Gibson
	<david@gibson.dropbear.id.au>
References: <20190204211204.27321-1-philmd@redhat.com>
	<20190204211204.27321-4-philmd@redhat.com>
	<87a7jaag7q.fsf@dusky.pond.sub.org>
	<CAFEAcA8-YDTnszv7Mk+F+OAxGJSmdu4yEio1j-E477HNbh-SOQ@mail.gmail.com>
	<20190205110417.GF20321@redhat.com>
Date: Tue, 05 Feb 2019 13:30:16 +0100
In-Reply-To: <20190205110417.GF20321@redhat.com> ("Daniel P. =?utf-8?Q?Ber?=
	=?utf-8?Q?rang=C3=A9=22's?=
	message of "Tue, 5 Feb 2019 11:04:17 +0000")
Message-ID: <87bm3qto2v.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 05 Feb 2019 12:30:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Tue, 05 Feb 2019 12:30:58 -0000

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Feb 05, 2019 at 10:56:51AM +0000, Peter Maydell wrote:
>> On Tue, 5 Feb 2019 at 06:44, Markus Armbruster <armbru@redhat.com> wrote:
>> > There are two justifiable function comment placement styles: (1) next =
to
>> > definition, and (2) next to declaration if it's in a header, else next
>> > to definition.
>> >
>> > The rationale for the latter is having the headers do double-duty as
>> > interface documentation.
>> >
>> > The rationale for the former is consistently placing the function
>> > comments close to the code gives them a fighting chance to actually
>> > match the code.
>> >
>> > I'm in the "next to definition" camp.  If you want concise interface
>> > specification, use something like Sphinx.
>>=20
>> I'm in the "next to declaration" camp. I don't want to have
>> to wade into your implementation to find out what it does:
>> document it for me in the interface, please.
>
> I'm already looking at the header file to identify the function signature,
> having the explanation / docs at the same place is desirable, especially
> when the C file name is completely different from the header file name
> forcing me to go grepping the code base to find where it is implemented.

If going to a definition of takes you more than a few keystrokes, your
editor is grossly deficient.

> The .c files are already volumous in size so not amenable to browsing
> for the purpose of reading the docs.
>
> Regards,
> Daniel

