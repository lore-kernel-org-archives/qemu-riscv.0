Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCUK6-0000l1-ON
	for mharc-qemu-riscv@gnu.org; Mon, 23 Sep 2019 15:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33367)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iCUK4-0000kS-76
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 15:48:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iCUK2-000765-TT
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 15:48:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45248)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iCUJr-00072v-KW; Mon, 23 Sep 2019 15:48:23 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EB77730833C1;
 Mon, 23 Sep 2019 19:48:21 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50FBB6017E;
 Mon, 23 Sep 2019 19:47:28 +0000 (UTC)
Subject: Re: [RFC v2 0/9] error: auto propagated local_err
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
Cc: kraxel@redhat.com, berrange@redhat.com, arei.gonglei@huawei.com,
 ehabkost@redhat.com, imammedo@redhat.com, lvivier@redhat.com,
 amit@kernel.org, kwolf@redhat.com, mreitz@redhat.com, ari@tuxera.com,
 pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, stefanha@redhat.com,
 jsnow@redhat.com, sw@weilnetz.de, fam@euphon.net, ronniesahlberg@gmail.com,
 pl@kamp.de, den@openvz.org, armbru@redhat.com, berto@igalia.com,
 dillaman@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 namei.unix@gmail.com, rjones@redhat.com, codyprime@gmail.com,
 marcandre.lureau@redhat.com, rth@twiddle.net, groug@kaod.org,
 mst@redhat.com, marcel.apfelbaum@gmail.com, b.galvani@gmail.com,
 peter.maydell@linaro.org, Andrew.Baumann@microsoft.com, philmd@redhat.com,
 antonynpavlov@gmail.com, jcd@tribudubois.net, peter.chubb@nicta.com.au,
 sundeep.lkml@gmail.com, joel@jms.id.au, eric.auger@redhat.com,
 alistair@alistair23.me, balrogg@gmail.com, edgar.iglesias@gmail.com,
 sstabellini@kernel.org, anthony.perard@citrix.com, paul.durrant@citrix.com,
 pburton@wavecomp.com, arikalo@wavecomp.com, clg@kaod.org, andrew@aj.id.au,
 crwulff@gmail.com, marex@denx.de, david@gibson.dropbear.id.au,
 pasic@linux.ibm.com, cohuck@redhat.com, borntraeger@de.ibm.com,
 hpoussin@reactos.org, xiaoguangrong.eric@gmail.com, aurelien@aurel32.net,
 amarkovic@wavecomp.com, mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 lersek@redhat.com, palmer@sifive.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, david@redhat.com, thuth@redhat.com,
 farman@linux.ibm.com, walling@linux.ibm.com, hare@suse.com,
 michael@walle.cc, atar4qemu@gmail.com, stefanb@linux.ibm.com,
 samuel.thibault@ens-lyon.org, akrowiak@linux.ibm.com, pmorel@linux.ibm.com,
 alex.williamson@redhat.com, mdroth@linux.vnet.ibm.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, dgilbert@redhat.com,
 rizzo@iet.unipi.it, g.lettieri@iet.unipi.it, v.maffione@gmail.com,
 jan.kiszka@siemens.com, green@moxielogic.com, shorne@gmail.com,
 gxt@mprc.pku.edu.cn, jcmvbkbc@gmail.com, qemu-block@nongnu.org,
 integration@gluster.org, sheepdog@lists.wpkg.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
 xsBNBEvHyWwBCACw7DwsQIh0kAbUXyqhfiKAKOTVu6OiMGffw2w90Ggrp4bdVKmCaEXlrVLU
 xphBM8mb+wsFkU+pq9YR621WXo9REYVIl0FxKeQo9dyQBZ/XvmUMka4NOmHtFg74nvkpJFCD
 TUNzmqfcjdKhfFV0d7P/ixKQeZr2WP1xMcjmAQY5YvQ2lUoHP43m8TtpB1LkjyYBCodd+LkV
 GmCx2Bop1LSblbvbrOm2bKpZdBPjncRNob73eTpIXEutvEaHH72LzpzksfcKM+M18cyRH+nP
 sAd98xIbVjm3Jm4k4d5oQyE2HwOur+trk2EcxTgdp17QapuWPwMfhaNq3runaX7x34zhABEB
 AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAegQTAQgAJAIbAwULCQgHAwUV
 CgkICwUWAgMBAAIeAQIXgAUCS8fL9QIZAQAKCRCnoWtKJSdDahBHCACbl/5FGkUqJ89GAjeX
 RjpAeJtdKhujir0iS4CMSIng7fCiGZ0fNJCpL5RpViSo03Q7l37ss+No+dJI8KtAp6ID+PMz
 wTJe5Egtv/KGUKSDvOLYJ9WIIbftEObekP+GBpWP2+KbpADsc7EsNd70sYxExD3liwVJYqLc
 Rw7so1PEIFp+Ni9A1DrBR5NaJBnno2PHzHPTS9nmZVYm/4I32qkLXOcdX0XElO8VPDoVobG6
 gELf4v/vIImdmxLh/w5WctUpBhWWIfQDvSOW2VZDOihm7pzhQodr3QP/GDLfpK6wI7exeu3P
 pfPtqwa06s1pae3ad13mZGzkBdNKs1HEm8x6zsBNBEvHyWwBCADGkMFzFjmmyqAEn5D+Mt4P
 zPdO8NatsDw8Qit3Rmzu+kUygxyYbz52ZO40WUu7EgQ5kDTOeRPnTOd7awWDQcl1gGBXgrkR
 pAlQ0l0ReO57Q0eglFydLMi5bkwYhfY+TwDPMh3aOP5qBXkm4qIYSsxb8A+i00P72AqFb9Q7
 3weG/flxSPApLYQE5qWGSXjOkXJv42NGS6o6gd4RmD6Ap5e8ACo1lSMPfTpGzXlt4aRkBfvb
 NCfNsQikLZzFYDLbQgKBA33BDeV6vNJ9Cj0SgEGOkYyed4I6AbU0kIy1hHAm1r6+sAnEdIKj
 cHi3xWH/UPrZW5flM8Kqo14OTDkI9EtlABEBAAHCwF8EGAEIAAkFAkvHyWwCGwwACgkQp6Fr
 SiUnQ2q03wgAmRFGDeXzc58NX0NrDijUu0zx3Lns/qZ9VrkSWbNZBFjpWKaeL1fdVeE4TDGm
 I5mRRIsStjQzc2R9b+2VBUhlAqY1nAiBDv0Qnt+9cLiuEICeUwlyl42YdwpmY0ELcy5+u6wz
 mK/jxrYOpzXKDwLq5k4X+hmGuSNWWAN3gHiJqmJZPkhFPUIozZUCeEc76pS/IUN72NfprZmF
 Dp6/QDjDFtfS39bHSWXKVZUbqaMPqlj/z6Ugk027/3GUjHHr8WkeL1ezWepYDY7WSoXwfoAL
 2UXYsMAr/uUncSKlfjvArhsej0S4zbqim2ZY6S8aRWw94J3bSvJR+Nwbs34GPTD4Pg==
Organization: Red Hat, Inc.
Message-ID: <d1527fdc-b5e8-093a-9206-6f7ceeece2ac@redhat.com>
Date: Mon, 23 Sep 2019 14:47:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923161231.22028-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 23 Sep 2019 19:48:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Mon, 23 Sep 2019 19:48:37 -0000

On 9/23/19 11:12 AM, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> Here is a proposal of auto propagation for local_err, to not call
> error_propagate on every exit point, when we deal with local_err.
> 
> It also fixes two issues:
> 1. Fix issue with error_fatal & error_append_hint: user can't see these
> hints, because exit() happens in error_setg earlier than hint is
> appended. [Reported by Greg Kurz]
> 
> 2. Fix issue with error_abort & error_propagate: when we wrap
> error_abort by local_err+error_propagate, resulting coredump will
> refer to error_propagate and not to the place where error happened.
> (the macro itself don't fix the issue, but it allows to [3.] drop all

doesn't

> local_err+error_propagate pattern, which will definitely fix the issue)
> [Reported by Kevin Wolf]
> 
> It's still an RFC, due to the following reasons:
> 
> 1. I'm new to coccinella, so I failed to do the following pattern:
> 
>  <...
> - goto out;
> + return;
>  ...>
> - out:
> - error_propagate(errp, local_err)
> 
> So, here is compilation fix 08.. Who can help with it? If nobody, 08 is
> to be merged to 07 by hand.

I'm not sure either; but I agree that if we can't figure out how to make
Coccinelle do quite what we want, that we are better off squashing in
compile fixes.

Also, while I like Coccinelle for automating the conversion, it's harder
to get everyone to run it; it would be nice if we could also figure out
a patch to scripts/checkpatch.pl that for any instance of 'Error
**errp)\n{\n' not followed by either } or the new macro, we flag that as
a checkpatch warning or error.

> 
> 2. Question about using new macro in empty stub functions - see 09

It would be nice if we could exempt empty functions - no need to use the
macro if there is no function body otherwise.  I'm not sure if
Coccinelle can do that filtering during the conversion, or if we clean
up by hand after the fact.

> 
> 3. What to do with huge auto-generated commit 07? Should I split it
> per-maintainer or per-subsystem, or leave it as-is?

It's big. I'd split it into multiple patches (and reduce the cc - except
for the cover letter, the rest of the patches can be limited to the
actual maintainer/subsystem affected rather than everyone involved
anywhere else in the series. With the current large cc, anyone that
replies gets several mail bounces about "too many recipients").  It may
be easier to split along directory boundaries than by maintainer
boundaries.  Markus has applied large tree-wide Coccinelle cleanups
before, maybe he has some advice.

> 
> 4. Also, checkpatch has some complains about 07 patch:
>   - using tabs.. (hmm exactly stubs functions..)
>   - empty ifs
>   Again, I don't see any ways to fix it other that by hand and merge to
>   07..

Hand cleanups for formatting or compilation fixes to Coccinelle's work
is not an uncommon issue after large patches; thankfully it's also not
very difficult (and surprisingly needed in very few places compared to
how much actually gets touched).

> 
> ==================
> 
> Also, if we decide, that this all is too huge, here is plan B:
> 
> 1. apply 01
> 2. fix only functions that don't use local_err and use
> error_append_hint, by just invocation of new macro at function start -
> it will substitute Greg's series with no pain.
> 3[optional]. Do full update for some subsystems, for example, only for
> block* and nbd*

Even if we go with plan B, it's still worth checking in a Coccinelle
script that we can periodically run to make sure we aren't missing out
on the use of the macro where it is needed.

> 
> Vladimir Sementsov-Ogievskiy (9):
>   error: auto propagated local_err
>   qapi/error: add (Error **errp) cleaning APIs
>   errp: rename errp to errp_in where it is IN-argument
>   hw/core/loader-fit: fix freeing errp in fit_load_fdt
>   net/net: fix local variable shadowing in net_client_init
>   scripts: add coccinelle script to use auto propagated errp
>   Use auto-propagated errp
>   fix-compilation: empty goto
>   fix-compilation: includes
> 
>  include/hw/pci-host/spapr.h                   |   2 +
>  include/monitor/hmp.h                         |   2 +-
>  include/qapi/error.h                          |  61 ++++-
>  target/ppc/kvm_ppc.h                          |   3 +
>  target/s390x/cpu_models.h                     |   3 +
>  ui/vnc.h                                      |   2 +-

>  vl.c                                          |  13 +-
>  scripts/coccinelle/auto-propagated-errp.cocci |  82 +++++++
>  319 files changed, 2729 insertions(+), 4245 deletions(-)
>  create mode 100644 scripts/coccinelle/auto-propagated-errp.cocci

The diffstat is huge, but promising.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

