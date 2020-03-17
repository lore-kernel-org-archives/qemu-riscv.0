Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jEDKV-0002e1-94
	for mharc-qemu-riscv@gnu.org; Tue, 17 Mar 2020 10:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46605)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1jEDKS-0002bN-Gd
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 10:36:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1jEDKR-0004WX-Fp
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 10:36:24 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:44008)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1jEDKR-0004U2-CM
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 10:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584455783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VJHYpdUhlXlHilDsciLtfAG4qlypYMH79V8zbhLt73c=;
 b=aT1MUxnfmMWi9dhWdfi09JXsmTs+pNG1RXk9nVNUu1MZYuiMNWFpvxCrTQ5Kpb8CC240NJ
 p5aJO05TYYL5sEH8SVaU6o0W3SrTh/hifNDY9UezNFED9hkT2v0IE5qrUfwtB1uHIr5cJv
 0ilqvHyfgIe90UW3QCn90CY1dQSjpT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-TbSTdG9NPTaNRdcHbajZjA-1; Tue, 17 Mar 2020 10:36:19 -0400
X-MC-Unique: TbSTdG9NPTaNRdcHbajZjA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A63FA801E53;
 Tue, 17 Mar 2020 14:36:15 +0000 (UTC)
Received: from localhost (ovpn-118-148.rdu2.redhat.com [10.10.118.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 742645DE52;
 Tue, 17 Mar 2020 14:36:10 +0000 (UTC)
Date: Tue, 17 Mar 2020 10:36:09 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Marek Vasut <marex@denx.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH] cpu: Use DeviceClass reset instead of a special CPUClass
 reset
Message-ID: <20200317143609.GG1817047@habkost.net>
References: <20200303100511.5498-1-peter.maydell@linaro.org>
 <c71dbe77-a883-361b-e33c-ed85ce07c0de@redhat.com>
 <CAFEAcA-gZnOVD9MPwUBCcA4fvrTSaE1xEvd9dyr_r1RctiPJhg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-gZnOVD9MPwUBCcA4fvrTSaE1xEvd9dyr_r1RctiPJhg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
X-List-Received-Date: Tue, 17 Mar 2020 14:36:25 -0000

On Tue, Mar 17, 2020 at 11:09:22AM +0000, Peter Maydell wrote:
> On Tue, 17 Mar 2020 at 11:01, Philippe Mathieu-Daud=E9 <philmd@redhat.com=
> wrote:
> >
> > ping
>=20
> Eduardo said he'd queued it -- I've been assuming he'll send
> a pullreq for it.

It will be on today's pull request, sorry for the delay.

--=20
Eduardo


