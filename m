Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j06OA-0002bv-FU
	for mharc-qemu-riscv@gnu.org; Fri, 07 Feb 2020 11:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54658)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j06O8-0002ZE-Ej
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 11:21:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j06O7-0006wP-EE
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 11:21:52 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:38590
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j06O7-0006v2-B4
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 11:21:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581092511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WkEfF1yWOwbM58Nn71tObxTOpGgWqOKG+23nqswcMZw=;
 b=HyKU15BoyBXZOeuRJb7cxxZ3UXoOPlf5YEAicvHhjUmuTFsbI+AiYFjWGl8ImUQqqqSBkR
 WhaAG+r2LRh9ie2SOSnCPGm1KQ2rKB4KlBfJNo+7dTsLO8uVD1G3eaHtmAzXHdSBCk1hGd
 jBt16YCtHK8NDEh8dCgc9KO33Cz19sQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-y2zPQzbFO2GgF2qsUL7uxw-1; Fri, 07 Feb 2020 11:21:36 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B31488014D8;
 Fri,  7 Feb 2020 16:21:32 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-88.brq.redhat.com [10.40.204.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 963A8790D8;
 Fri,  7 Feb 2020 16:21:10 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, qemu-ppc@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Anthony Green <green@moxielogic.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-trivial@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Marek Vasut <marex@denx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Walle <michael@walle.cc>,
 Halil Pasic <pasic@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <huth@tuxfamily.org>,
 Magnus Damm <magnus.damm@gmail.com>, David Hildenbrand <david@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Helge Deller <deller@gmx.de>, Alistair Francis <Alistair.Francis@wdc.com>,
 Jia Liu <proljc@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Subject: [PATCH v4 3/3] vl: Abort if multiple machines are registered as
 default
Date: Fri,  7 Feb 2020 17:19:48 +0100
Message-Id: <20200207161948.15972-4-philmd@redhat.com>
In-Reply-To: <20200207161948.15972-1-philmd@redhat.com>
References: <20200207161948.15972-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: y2zPQzbFO2GgF2qsUL7uxw-1
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
X-List-Received-Date: Fri, 07 Feb 2020 16:21:53 -0000

It would be confusing to have multiple default machines.
Abort if this ever occurs.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Use assert() instead of human friendly message (Marc-Andr=C3=A9)
v3: Move the check to find_machine() (Michael)

Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Michael S. Tsirkin <mst@redhat.com>
---
 vl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index 7dcb0879c4..ebc203af0d 100644
--- a/vl.c
+++ b/vl.c
@@ -1184,16 +1184,18 @@ static MachineClass *find_machine(const char *name,=
 GSList *machines)
 static MachineClass *find_default_machine(GSList *machines)
 {
     GSList *el;
+    MachineClass *default_machineclass =3D NULL;
=20
     for (el =3D machines; el; el =3D el->next) {
         MachineClass *mc =3D el->data;
=20
         if (mc->is_default) {
-            return mc;
+            assert(default_machineclass =3D=3D NULL && "Multiple default m=
achines");
+            default_machineclass =3D mc;
         }
     }
=20
-    return NULL;
+    return default_machineclass;
 }
=20
 static int machine_help_func(QemuOpts *opts, MachineState *machine)
--=20
2.21.1


