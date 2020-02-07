Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j07yp-0006PW-Ue
	for mharc-qemu-riscv@gnu.org; Fri, 07 Feb 2020 13:03:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48891)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1j07yn-0006MB-GQ
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 13:03:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1j07ym-0005SJ-He
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 13:03:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20839
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1j07ym-0005R5-Dw
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 13:03:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581098628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bBudopyfhwH5xkGLf0SNi5BpET08FAfrlSh6VM4Qjwg=;
 b=G7c5mj3fJWe02d4yDSscUb1avvQGB7YI/Eym4uiJudu6XuItz27WlWMm7+DgH9lpPDtVRq
 AYR66hSygS3m6llgtE/sObExwfyTyS3lcwOVrOajnJnVf+gOkYa5drhoSGOsZFEJsqgyzF
 8calCbyZ0/pKa/lpYMuljm1DiGIrVOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-er1pd2aRPxmLGATOyQ4zQQ-1; Fri, 07 Feb 2020 13:03:44 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F93A8010D6;
 Fri,  7 Feb 2020 18:03:39 +0000 (UTC)
Received: from localhost (unused-10-15-17-6.yyz.redhat.com [10.15.17.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D865F1001B34;
 Fri,  7 Feb 2020 18:03:29 +0000 (UTC)
Date: Fri, 7 Feb 2020 13:03:28 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Jia Liu <proljc@gmail.com>, qemu-trivial@nongnu.org,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-s390x@nongnu.org, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v4 0/3] Make MachineClass::is_default boolean, refuse
 multiple default machines
Message-ID: <20200207180328.GI412524@habkost.net>
References: <20200207161948.15972-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200207161948.15972-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: er1pd2aRPxmLGATOyQ4zQQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
X-List-Received-Date: Fri, 07 Feb 2020 18:03:51 -0000

On Fri, Feb 07, 2020 at 05:19:45PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Cleanup after reviewing "ppc: function to setup latest class options":
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg677709.html
>=20
> Since v3:
> - addressed Laurent & Michael comments

Queued, thanks!

--=20
Eduardo


