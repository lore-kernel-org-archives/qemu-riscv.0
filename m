Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jJGrr-0002RY-Jr
	for mharc-qemu-riscv@gnu.org; Tue, 31 Mar 2020 09:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42335)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jJGro-0002JP-MT
 for qemu-riscv@nongnu.org; Tue, 31 Mar 2020 09:23:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jJGrn-0006oL-E8
 for qemu-riscv@nongnu.org; Tue, 31 Mar 2020 09:23:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21794
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jJGrn-0006nn-B5
 for qemu-riscv@nongnu.org; Tue, 31 Mar 2020 09:23:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585661023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q9AV3zmhXly1oADjwZuu9kxsW2xfs8rViy6qV1bZpxU=;
 b=T21MuzDulVjqDISWtPl73R7rEe8jSqkxIGj5686RBZtpXLL+ry9BxOKnJ8YfIA+t08va0p
 AENYdzLm5mlSWJPXq57InMJKLip1xTG6D6aBUWuukckHRVwYpq90E4YgBEuhQXYgMN1CqS
 exrIYI8XFT9NlgofbGAyxag7Hj0wDVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-WSZlPJq2NmafmNw_DWvElw-1; Tue, 31 Mar 2020 09:23:36 -0400
X-MC-Unique: WSZlPJq2NmafmNw_DWvElw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29FD6DBB1;
 Tue, 31 Mar 2020 13:23:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-69.ams2.redhat.com
 [10.36.112.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2A335C21B;
 Tue, 31 Mar 2020 13:23:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4EE0A11385E2; Tue, 31 Mar 2020 15:23:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org,  Paul Burton <pburton@wavecomp.com>,  Sagar
 Karandikar <sagark@eecs.berkeley.edu>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Jason Wang <jasowang@redhat.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Alistair Francis
 <Alistair.Francis@wdc.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@redhat.com>,  Eduardo Habkost <ehabkost@redhat.com>,  Alistair
 Francis <alistair@alistair23.me>,  qemu-arm@nongnu.org,  David Gibson
 <david@gibson.dropbear.id.au>,  qemu-riscv@nongnu.org,  Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>,  Andrew Baumann
 <Andrew.Baumann@microsoft.com>,  Jean-Christophe Dubois
 <jcd@tribudubois.net>,  qemu-ppc@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH-for-5.0 00/12] hw: Add missing error-propagation code
References: <20200325191830.16553-1-f4bug@amsat.org>
Date: Tue, 31 Mar 2020 15:23:23 +0200
In-Reply-To: <20200325191830.16553-1-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 25 Mar 2020 20:18:18
 +0100")
Message-ID: <87r1x8vet0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Tue, 31 Mar 2020 13:23:46 -0000

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> This series is inspired of Peter fix:
> "hw/arm/xlnx-zynqmp.c: fix some error-handling code"
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg691636.html
>
> Add a cocci script to fix the other places.
>
> Based-on: <20200324134947.15384-1-peter.maydell@linaro.org>

I skimmed the code patches [PATCH 02-12/12], and they look like bug
fixes.  Other reviewers raised a few issues.

I also skimmed the Coccinelle script [PATCH 01].  Peter pointed out a
few things it apparently missed (e.g. in review of PATCH 06+11).
Moreover, the bug pattern applies beyond object_property_set() &
friends.  Perhaps the script can be generalized.  No reason to hold
fixes.  We may want to add suitable notes to the scipt, though.

Can you address the reviews in a v2, so we can get the fixes into -rc1,
due today?


