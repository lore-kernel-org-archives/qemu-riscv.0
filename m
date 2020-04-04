Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jKbmy-0002h5-DO
	for mharc-qemu-riscv@gnu.org; Sat, 04 Apr 2020 01:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59113)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jKbmv-0002ds-51
 for qemu-riscv@nongnu.org; Sat, 04 Apr 2020 01:56:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jKbmt-0002He-DL
 for qemu-riscv@nongnu.org; Sat, 04 Apr 2020 01:56:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58613
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jKbmt-0002H6-3a
 for qemu-riscv@nongnu.org; Sat, 04 Apr 2020 01:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585979770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tbu+yhQJvJC1lvCLLfqKnvLXIL2FpNXjo1kKksMp9Os=;
 b=hdd84qoifPYM1xCKcn36sk8ByCy+8qPVROmF1A+AmUFKlKIlRnn8N/0/neecGzi1KDkxf0
 EU5kL7jEaCVY062tAvY4QFk4tMpn5HmBnuaFk3kXNEUF9eVK3yKOxDYuk8GXM5X8WatiRU
 M2znzJJz7HJVTQVQZBnUs+FOp51eeBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-WHxLg8XsMc6whceK-6e6Bg-1; Sat, 04 Apr 2020 01:56:06 -0400
X-MC-Unique: WHxLg8XsMc6whceK-6e6Bg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7EC113FB;
 Sat,  4 Apr 2020 05:56:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-152.ams2.redhat.com
 [10.36.112.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A20610002A8;
 Sat,  4 Apr 2020 05:55:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0C4841138610; Sat,  4 Apr 2020 07:55:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Paul Burton
 <pburton@wavecomp.com>,  Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,  Eduardo Habkost
 <ehabkost@redhat.com>,  Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org,  David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org,  Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>,  Andrew Baumann
 <Andrew.Baumann@microsoft.com>,  Jean-Christophe Dubois
 <jcd@tribudubois.net>,  qemu-ppc@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH-for-5.0 00/12] hw: Add missing error-propagation code
References: <20200325191830.16553-1-f4bug@amsat.org>
 <87r1x8vet0.fsf@dusky.pond.sub.org>
 <dbee4e3d-afba-827d-4950-2ac9b99419ab@redhat.com>
Date: Sat, 04 Apr 2020 07:55:54 +0200
In-Reply-To: <dbee4e3d-afba-827d-4950-2ac9b99419ab@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 3 Apr 2020 19:53:01
 +0200")
Message-ID: <87mu7r23rp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Sat, 04 Apr 2020 05:56:14 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Hi Markus, Peter.
>
> On 3/31/20 3:23 PM, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>
>>> This series is inspired of Peter fix:
>>> "hw/arm/xlnx-zynqmp.c: fix some error-handling code"
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg691636.html
>>>
>>> Add a cocci script to fix the other places.
>>>
>>> Based-on: <20200324134947.15384-1-peter.maydell@linaro.org>
>>
>> I skimmed the code patches [PATCH 02-12/12], and they look like bug
>> fixes.  Other reviewers raised a few issues.
>>
>> I also skimmed the Coccinelle script [PATCH 01].  Peter pointed out a
>> few things it apparently missed (e.g. in review of PATCH 06+11).
>> Moreover, the bug pattern applies beyond object_property_set() &
>> friends.  Perhaps the script can be generalized.  No reason to hold
>> fixes.  We may want to add suitable notes to the scipt, though.
>>
>> Can you address the reviews in a v2, so we can get the fixes into -rc1,
>> due today?
>
> Status on this series (sorry I didn't update earlier).
>
> I addressed Peter's comments, improved/simplified/documented the cocci
> script (which I split in smaller ones).
>
> Peter suggested other functions can be checked too, not only the
> "^object_property_set_.*" matches. Indeed, more patches added. Some
> are big.
>
> Another suggestion is replace in init() 'NULL' Error* final argument
> by &error_abort. This can be another series on top.
> However I noticed we can reduce the error_propagate() generated calls
> in many places, when both init()/realize() exist and the property set
> is not dependent of parent operation, by moving these calls from
> realize() to init(). Another cocci script. But to make sense it has to
> be run previous the "add missing error_propagate" one.
>
> While writing the cocci patches, I had 3 different Coccinelle failures.
> Failures not due to a spatch bug, but timeout because C source hard to
> process. Indeed the C source code was dubious, could get some
> simplification rewrite. Then spatch could transform them. More patches
> in the middle.
>
> Now I'm at 47 patches, the reviewed patches at the end of the series.
> Too much for RC2. Since I don't think these are critical bugs, but
> improvements, are you OK to postpone this series to 5.1?

Punting bug fixes to a later release is always kind of sad, but getting
that many patches reviewed properly in time for -rc2 feels hopeless, and
the bugs old and unthreatending on first glance.

> If you think a patch deserves to be in 5.0, point me at it and I can
> send it ASAP with comments addressed. Else I'll post my series as
> -for-5.1 soon.

I'm okay with punting the whole series to 5.1.

We have quite some Error work pending for 5.1.  Beware of conflicts.

In particular, I now plan to make object_property_set() & friends return
a useful value.  This should make your patches a bit smaller.


