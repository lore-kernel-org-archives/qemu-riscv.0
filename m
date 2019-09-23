Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCTDT-0003r3-Pt
	for mharc-qemu-riscv@gnu.org; Mon, 23 Sep 2019 14:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51427)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iCTDQ-0003na-Iq
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 14:37:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iCTDP-0003Nb-GD
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 14:37:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:10785)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iCTDF-0003KR-77; Mon, 23 Sep 2019 14:37:29 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5833310DCC84;
 Mon, 23 Sep 2019 18:37:27 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9317460C5E;
 Mon, 23 Sep 2019 18:35:52 +0000 (UTC)
Subject: Re: [RFC v2 3/9] errp: rename errp to errp_in where it is IN-argument
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
 <20190923161231.22028-4-vsementsov@virtuozzo.com>
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
Message-ID: <8ad05d4f-e7e6-d7b5-dce4-c4d24ac81e0e@redhat.com>
Date: Mon, 23 Sep 2019 13:35:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923161231.22028-4-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Mon, 23 Sep 2019 18:37:28 +0000 (UTC)
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
X-List-Received-Date: Mon, 23 Sep 2019 18:37:42 -0000

On 9/23/19 11:12 AM, Vladimir Sementsov-Ogievskiy wrote:
> Error **errp is almost always OUT-argument: it's assumed to be NULL, or
> pointer to NULL-initialized pointer, or pointer to error_abort or
> error_fatal, for callee to report error.
> 
> But very few functions (most of the are error API) instead get Error
> **errp as IN-argument: it's assumed to be set, and callee should clean
> it. In such cases, rename errp to errp_in.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/monitor/hmp.h |  2 +-
>  include/qapi/error.h  |  8 ++++----
>  ui/vnc.h              |  2 +-
>  monitor/hmp-cmds.c    |  8 ++++----
>  ui/vnc.c              | 10 +++++-----
>  util/error.c          |  2 +-
>  6 files changed, 16 insertions(+), 16 deletions(-)

This is worthwhile, regardless of the fate of the rest of the series.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

