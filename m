Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jTfpC-0001yW-GD
	for mharc-qemu-riscv@gnu.org; Wed, 29 Apr 2020 02:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38824)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTfp5-0001vl-IK
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 02:03:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTfp3-0005Ux-QB
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 02:03:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29412
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jTfp3-0005UU-E0
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 02:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588140232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8LYLa4KmQKZn2Q6Gc2pl5AKUX38QDno+ks/+CM7uAs=;
 b=ck+ND5/OcN0e3HMzZK5KIIuntJ5F2twkP49BnhzSa+Lg5+IP8njuXN9PQZ16odvNTl2t4U
 32nl54aONd0st6W1PFkyBqcv0n9Uqvj3AwnDj7M6fh1OhEj9DrlUbNQQBs6OMuhQLIYjhX
 IU6JH3IxVd2sz0a9+UV+gNBVlLS0Vuw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-fmpifmRiOLy0DDikxt1m1Q-1; Wed, 29 Apr 2020 02:03:48 -0400
X-MC-Unique: fmpifmRiOLy0DDikxt1m1Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D755D1005510;
 Wed, 29 Apr 2020 06:03:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 127335D9E5;
 Wed, 29 Apr 2020 06:03:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 74C2011358BC; Wed, 29 Apr 2020 08:03:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org,  Fam Zheng <fam@euphon.net>,  Peter Maydell
 <peter.maydell@linaro.org>,  Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>,  Alistair Francis
 <Alistair.Francis@wdc.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 qemu-block@nongnu.org,  Markus Armbruster <armbru@redhat.com>,  Max Reitz
 <mreitz@redhat.com>,  Joel Stanley <joel@jms.id.au>,  =?utf-8?Q?Marc-Andr?=
 =?utf-8?Q?=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Richard Henderson <rth@twiddle.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,  Eduardo
 Habkost <ehabkost@redhat.com>,  Xie Changlong <xiechanglong.d@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,  Beniamino Galvani
 <b.galvani@gmail.com>,  qemu-arm@nongnu.org,  Peter Chubb
 <peter.chubb@nicta.com.au>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,  qemu-riscv@nongnu.org,  Andrew Jeffery
 <andrew@aj.id.au>,  Wen Congyang <wencongyang2@huawei.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,  qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,  Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH-for-5.1 v3 01/24] various: Remove suspicious '\' character
 outside of #define in C code
References: <20200412223619.11284-1-f4bug@amsat.org>
 <20200412223619.11284-2-f4bug@amsat.org>
Date: Wed, 29 Apr 2020 08:03:35 +0200
In-Reply-To: <20200412223619.11284-2-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 13 Apr 2020 00:35:56
 +0200")
Message-ID: <87v9livnew.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 01:18:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
X-List-Received-Date: Wed, 29 Apr 2020 06:03:59 -0000

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Fixes the following coccinelle warnings:
>
>   $ spatch --sp-file --verbose-parsing  ... \
>       scripts/coccinelle/remove_local_err.cocci
>   ...
>   SUSPICIOUS: a \ character appears outside of a #define at ./target/ppc/=
translate_init.inc.c:5213
[...]
>   SUSPICIOUS: a \ character appears outside of a #define at ./block/repli=
cation.c:173
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

I'm queuing this patch just to get it out of the way.  Thanks!


