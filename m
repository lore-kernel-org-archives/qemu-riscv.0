Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jKQVO-0004ui-8e
	for mharc-qemu-riscv@gnu.org; Fri, 03 Apr 2020 13:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56634)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jKQVK-0004tB-W0
 for qemu-riscv@nongnu.org; Fri, 03 Apr 2020 13:53:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jKQVI-0007yf-RG
 for qemu-riscv@nongnu.org; Fri, 03 Apr 2020 13:53:18 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:31808
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jKQVH-0007qS-0I
 for qemu-riscv@nongnu.org; Fri, 03 Apr 2020 13:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585936393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H529rtZ0TN4I1+HCsrzJINnZseN+poJpG4qtjyvjDig=;
 b=QYcHCng5wtXzDKv0BIolliWo7242CtyxLyi6SRArYQt29rAI2HQY8YIXU/U/XqqMrNdjso
 iwSCEdgA9j8pleR2t5T2/HjCJZ0qCwVM0s02y+RCEXP+2v0MOEGF4xJnPTCK95vbRF3ajL
 Ggb/GxK08l/JCCgLqvG8abI6tasa3Io=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-FIJprFWMPMO7I1NZ8SW7DA-1; Fri, 03 Apr 2020 13:53:07 -0400
X-MC-Unique: FIJprFWMPMO7I1NZ8SW7DA-1
Received: by mail-ed1-f69.google.com with SMTP id b9so6082112edj.10
 for <qemu-riscv@nongnu.org>; Fri, 03 Apr 2020 10:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1VA98oNVWz7SqUTNvo1NAoiIC7S0Y83T0p7iYkAvaPY=;
 b=qaY8QgeWaTfvPVBhLfK/6nJh8oXDwXMNWdto1WH7ZP0BmPFqVnf89bc/an6tTT+zR4
 P+Mg5Vzvskz7ChAAW3i8HfAjHU8LJhjmaxZ1k313TTw1RiLUKamNNA7l8zRvCb65bwd0
 hBgRcNbIr5K92DgpOs8eNej/APtDGc39hYPGzghKaZ/PnP8Hvvm47WhBiL2VAheDv1A2
 TMzRS4QS5EGU5ueK/QKiJf6X30dE+nCsVfj7+Vk/gx2jA+GAn0wBqWYbMfuF2RFgJhvR
 n95vTavfFLxP81dTADPPO4gCNntqIm4OgDjMDuy2+ewLSd1AxZfCfwhgVDiu9q/38Wwe
 htlg==
X-Gm-Message-State: AGi0Puaw96P1PInfb/oTRH92viuQz5vZgvV4FU+J51ZNC3QF7Vseu9UA
 GLgP2Nwv2tkFhdq9rqVs7Mg7gJEiLRSxoW3Iv9vbUBPzdnTchUUG0/EdoBCFu3zfUlrrWvMlcKI
 1cw3iE21pI3AX5jI=
X-Received: by 2002:aa7:c607:: with SMTP id h7mr8966561edq.73.1585936386135;
 Fri, 03 Apr 2020 10:53:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypKzt2HufSVIs7T92OEiiXVQ0XZux6Ey806Zs6pHEfbnboWqrW8Hrra/UUWyLqdXg14c+OEh9Q==
X-Received: by 2002:aa7:c607:: with SMTP id h7mr8966529edq.73.1585936385913;
 Fri, 03 Apr 2020 10:53:05 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id v13sm1506007edj.62.2020.04.03.10.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Apr 2020 10:53:05 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 00/12] hw: Add missing error-propagation code
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20200325191830.16553-1-f4bug@amsat.org>
 <87r1x8vet0.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dbee4e3d-afba-827d-4950-2ac9b99419ab@redhat.com>
Date: Fri, 3 Apr 2020 19:53:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <87r1x8vet0.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Fri, 03 Apr 2020 17:53:20 -0000

Hi Markus, Peter.

On 3/31/20 3:23 PM, Markus Armbruster wrote:
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>=20
>> This series is inspired of Peter fix:
>> "hw/arm/xlnx-zynqmp.c: fix some error-handling code"
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg691636.html
>>
>> Add a cocci script to fix the other places.
>>
>> Based-on: <20200324134947.15384-1-peter.maydell@linaro.org>
>=20
> I skimmed the code patches [PATCH 02-12/12], and they look like bug
> fixes.  Other reviewers raised a few issues.
>=20
> I also skimmed the Coccinelle script [PATCH 01].  Peter pointed out a
> few things it apparently missed (e.g. in review of PATCH 06+11).
> Moreover, the bug pattern applies beyond object_property_set() &
> friends.  Perhaps the script can be generalized.  No reason to hold
> fixes.  We may want to add suitable notes to the scipt, though.
>=20
> Can you address the reviews in a v2, so we can get the fixes into -rc1,
> due today?

Status on this series (sorry I didn't update earlier).

I addressed Peter's comments, improved/simplified/documented the cocci=20
script (which I split in smaller ones).

Peter suggested other functions can be checked too, not only the=20
"^object_property_set_.*" matches. Indeed, more patches added. Some are big=
.

Another suggestion is replace in init() 'NULL' Error* final argument by=20
&error_abort. This can be another series on top.
However I noticed we can reduce the error_propagate() generated calls in=20
many places, when both init()/realize() exist and the property set is=20
not dependent of parent operation, by moving these calls from realize()=20
to init(). Another cocci script. But to make sense it has to be run=20
previous the "add missing error_propagate" one.

While writing the cocci patches, I had 3 different Coccinelle failures.
Failures not due to a spatch bug, but timeout because C source hard to=20
process. Indeed the C source code was dubious, could get some=20
simplification rewrite. Then spatch could transform them. More patches=20
in the middle.

Now I'm at 47 patches, the reviewed patches at the end of the series.
Too much for RC2. Since I don't think these are critical bugs, but=20
improvements, are you OK to postpone this series to 5.1?

If you think a patch deserves to be in 5.0, point me at it and I can=20
send it ASAP with comments addressed. Else I'll post my series as=20
-for-5.1 soon.

Regards,

Phil.


