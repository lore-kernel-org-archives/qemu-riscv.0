Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j03Kq-0000HJ-9B
	for mharc-qemu-riscv@gnu.org; Fri, 07 Feb 2020 08:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54196)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j03Kn-0000El-8g
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 08:06:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j03Km-0007yk-5M
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 08:06:13 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44868
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j03Km-0007yO-1s
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 08:06:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581080771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G95PTwCCtptgBScLxDFzyGKSIIGgkKDhimn6aS+h6BE=;
 b=APWoxhON+Ldd+AxFkT73/PEufnK/1IzT+CZgD4oE5+euAMIWDIO7AM5BERGixkHFVjKgxM
 Tw2lhUp7iynRsQu8GXwivxq2KiOzm8tbX+gNdIMaF9DDwwQJSzrb/tVqzm9c05cMH2ARbl
 S/EU149LzO34DgrOzOb4Jwi/sQWf4FA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-0GYQxoM5N3mjwWsInLhiGg-1; Fri, 07 Feb 2020 08:06:08 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62BF51081FA2;
 Fri,  7 Feb 2020 13:06:04 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-120.brq.redhat.com [10.40.204.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6938E5C28C;
 Fri,  7 Feb 2020 13:05:50 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Anthony Green <green@moxielogic.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <rth@twiddle.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Michael Walle <michael@walle.cc>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Helge Deller <deller@gmx.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Marek Vasut <marex@denx.de>,
 Jia Liu <proljc@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Huth <huth@tuxfamily.org>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Subject: [PATCH v3 3/3] vl: Abort if multiple machines are registered as
 default
Date: Fri,  7 Feb 2020 14:04:53 +0100
Message-Id: <20200207130453.16666-4-philmd@redhat.com>
In-Reply-To: <20200207130453.16666-1-philmd@redhat.com>
References: <20200207130453.16666-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 0GYQxoM5N3mjwWsInLhiGg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Fri, 07 Feb 2020 13:06:14 -0000

It would be confusing to have multiple default machines.
Abort if this ever occurs.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Use assert() instead of human friendly message (Marc-Andr=C3=A9)

Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com>
Cc: Laurent Vivier <laurent@vivier.eu>
---
 vl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/vl.c b/vl.c
index 7dcb0879c4..b3e0f7af25 100644
--- a/vl.c
+++ b/vl.c
@@ -2354,6 +2354,8 @@ static MachineClass *machine_parse(const char *name, =
GSList *machines)
     GSList *el;
=20
     if (is_help_option(name)) {
+        int default_count =3D 0;
+
         printf("Supported machines are:\n");
         machines =3D g_slist_sort(machines, machine_class_cmp);
         for (el =3D machines; el; el =3D el->next) {
@@ -2364,7 +2366,9 @@ static MachineClass *machine_parse(const char *name, =
GSList *machines)
             printf("%-20s %s%s%s\n", mc->name, mc->desc,
                    mc->is_default ? " (default)" : "",
                    mc->deprecation_reason ? " (deprecated)" : "");
+            default_count +=3D !!mc->is_default;
         }
+        assert(default_count <=3D 1);
         exit(0);
     }
=20
--=20
2.21.1


