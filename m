Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCUba-0001A7-3y
	for mharc-qemu-riscv@gnu.org; Mon, 23 Sep 2019 16:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36575)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iCUbX-00018w-Em
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 16:06:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iCUbW-0005BP-9x
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 16:06:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51454)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iCUbK-00057Q-TR; Mon, 23 Sep 2019 16:06:27 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 06205307CDE7;
 Mon, 23 Sep 2019 20:06:24 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 630F819D70;
 Mon, 23 Sep 2019 20:05:50 +0000 (UTC)
Subject: Re: [RFC v2 6/9] scripts: add coccinelle script to use auto
 propagated errp
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
 <20190923161231.22028-7-vsementsov@virtuozzo.com>
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
Message-ID: <57e97ed0-b1a1-d209-fc23-cf41ec467157@redhat.com>
Date: Mon, 23 Sep 2019 15:05:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923161231.22028-7-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 23 Sep 2019 20:06:24 +0000 (UTC)
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
X-List-Received-Date: Mon, 23 Sep 2019 20:06:40 -0000

On 9/23/19 11:12 AM, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  scripts/coccinelle/auto-propagated-errp.cocci | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 scripts/coccinelle/auto-propagated-errp.cocci
> 
> diff --git a/scripts/coccinelle/auto-propagated-errp.cocci b/scripts/coccinelle/auto-propagated-errp.cocci
> new file mode 100644
> index 0000000000..1a3f006f0b
> --- /dev/null
> +++ b/scripts/coccinelle/auto-propagated-errp.cocci
> @@ -0,0 +1,82 @@
> +@@
> +identifier fn;
> +identifier local_err;
> +@@
> +
> + fn(..., Error **errp)
> + {
> ++    ERRP_FUNCTION_BEGIN();
> + }

This doesn't catch functions where Error **errp is not the last
parameter.  Some examples (some of which may need independent tweaking
in their own right for being inconsistent, although we DO want errp to
appear before any 'format, ...' arguments):

block/ssh.c:sftp_error_setg(Error **errp, BDRVSSHState *s, const char
*fs, ...)
exec.c:static void ram_block_add(RAMBlock *new_block, Error **errp, bool
shared)

Does running this Coccinelle script 2 times in a row add a second
ERRP_FUNCTION_BEGIN() line?  We want it to be idempotent (no changes on
a second run).  (Admittedly, I did not actually test that yet).  Also, I
don't know if this can be tweaked to avoid adding the line to a function
with an empty body, maybe:

 fn(..., Error **errp, ...)
 {
+    ERRP_FUNCTION_BEGIN();
     ...
 }

to only add it to a function that already has a body (thanks to the ...)
- but I'm fuzzy enough on Coccinelle that I may be saying something
totally wrong.

> +
> +@rule1@
> +identifier fn;
> +identifier local_err;
> +@@
> +
> + fn(..., Error **errp)
> + {
> +     <...
> +-    Error *local_err = NULL;
> +     ...>
> + }
> +
> +@@
> +identifier rule1.fn;
> +identifier rule1.local_err;
> +identifier out;
> +@@
> +
> + fn(...)
> + {
> +     <...
> +-    goto out;
> ++    return;
> +     ...>
> +- out:
> +-    error_propagate(errp, local_err);
> + }
> +
> +@@
> +identifier rule1.fn;
> +identifier rule1.local_err;
> +@@
> +
> + fn(...)
> + {
> +     <...
> +(
> +-    error_free(local_err);
> +-    local_err = NULL;
> ++    error_free_errp(errp);
> +|
> +-    error_free(local_err);
> ++    error_free_errp(errp);
> +|
> +-    error_report_err(local_err);
> ++    error_report_errp(errp);
> +|
> +-    warn_report_err(local_err);
> ++    warn_report_errp(errp);
> +|
> +-    error_propagate(errp, local_err);
> +)
> +     ...>
> + }
> +
> +@@
> +identifier rule1.fn;
> +identifier rule1.local_err;
> +@@
> +
> + fn(...)
> + {
> +     <...
> +(
> +-    &local_err
> ++    errp
> +|
> +-    local_err
> ++    *errp
> +)
> +     ...>
> + }
> 

Overall, the script makes sense in my reading (but no idea if it
actually catches everything we want, or if it missed something).  At any
rate, once patch 7 is split into more manageable chunks, we can
definitely spot-check results to make sure they all look reasonable.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

