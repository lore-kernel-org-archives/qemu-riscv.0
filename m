Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hEqtw-00068w-WF
	for mharc-qemu-riscv@gnu.org; Fri, 12 Apr 2019 03:47:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ijc@hellion.org.uk>) id 1hEqtu-00067l-CQ
	for qemu-riscv@nongnu.org; Fri, 12 Apr 2019 03:47:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ijc@hellion.org.uk>) id 1hEqtt-0005v8-Is
	for qemu-riscv@nongnu.org; Fri, 12 Apr 2019 03:47:06 -0400
Received: from benson.default.arb33.uk0.bigv.io ([2001:41c9:1:41d::16]:57435)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ijc@hellion.org.uk>)
	id 1hEqtt-0005tc-Ak; Fri, 12 Apr 2019 03:47:05 -0400
Received: from 217-195-251-190.dsl.easynet.nl ([217.195.251.190]
	helo=surfer-172-29-6-129-hotspot.s-bit.nl)
	by benson.default.arb33.uk0.bigv.io with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <ijc@hellion.org.uk>)
	id 1hEqtj-0000FA-0W; Fri, 12 Apr 2019 08:46:55 +0100
Message-ID: <c6a72245aba41195916bf45c515486491167099e.camel@hellion.org.uk>
From: Ian Campbell <ijc@hellion.org.uk>
To: Alistair Francis <alistair23@gmail.com>, Peter Maydell
	<peter.maydell@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "palmer@sifive.com" <palmer@sifive.com>, 
	"qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Date: Fri, 12 Apr 2019 08:46:52 +0100
In-Reply-To: <CAKmqyKO779w8sYXcwtnJyCZN0TuKOAjUjd_xca4k2wff4vfEHQ@mail.gmail.com>
References: <cover.1554937288.git.alistair.francis@wdc.com>
	<9043c3a6bc54faa98ed9fedc0c6c929c993a0bf9.1554937288.git.alistair.francis@wdc.com>
	<20190411140629.3a672b39@redhat.com>
	<CAFEAcA-oOfZD=tas4QP3SeSOJJ+eM_9o=v05U=scsc78Z4p3FQ@mail.gmail.com>
	<CAKmqyKO779w8sYXcwtnJyCZN0TuKOAjUjd_xca4k2wff4vfEHQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:41c9:1:41d::16
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for 4.1 v3 6/6] riscv: Add a
 generic spike machine
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
X-List-Received-Date: Fri, 12 Apr 2019 07:47:07 -0000

On Thu, 2019-04-11 at 13:35 -0700, Alistair Francis wrote:
> > > > +    if (!qtest_enabled()) {
> > > > +        info_report("The Spike v1.09.1 machine has been
> > > > depreceated. "
> > > > +                    "Please use the deneric spike machine and
> > > > specify the ISA "
> > 
> > "generic"

Also "deprecated" not "depreceated".

Ian.


