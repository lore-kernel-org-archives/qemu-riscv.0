Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iIxSa-0000Wu-Fz
	for mharc-qemu-riscv@gnu.org; Fri, 11 Oct 2019 12:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37995)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxSU-0000Mc-AX
 for qemu-riscv@nongnu.org; Fri, 11 Oct 2019 12:08:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxSQ-0005k2-2P
 for qemu-riscv@nongnu.org; Fri, 11 Oct 2019 12:08:02 -0400
Received: from relay.sw.ru ([185.231.240.75]:48104)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxRj-0004GF-LL; Fri, 11 Oct 2019 12:07:15 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQb-0003XG-IB; Fri, 11 Oct 2019 19:06:05 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, vsementsov@virtuozzo.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Stefan Weil <sw@weilnetz.de>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 Eric Blake <eblake@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Alberto Garcia <berto@igalia.com>, Jason Dillaman <dillaman@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Liu Yuan <namei.unix@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Greg Kurz <groug@kaod.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paul Burton <pburton@wavecomp.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, David Gibson <david@gibson.dropbear.id.au>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jason Wang <jasowang@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Yuval Shaia <yuval.shaia@oracle.com>, Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Hannes Reinecke <hare@suse.com>,
 Michael Walle <michael@walle.cc>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefan Berger <stefanb@linux.ibm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Luigi Rizzo <rizzo@iet.unipi.it>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
 Vincenzo Maffione <v.maffione@gmail.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Anthony Green <green@moxielogic.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-block@nongnu.org,
 integration@gluster.org, sheepdog@lists.wpkg.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [RFC v5 025/126] scripts: add coccinelle script to use auto
 propagated errp
Date: Fri, 11 Oct 2019 19:04:11 +0300
Message-Id: <20191011160552.22907-26-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191011160552.22907-1-vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
X-List-Received-Date: Fri, 11 Oct 2019 16:08:07 -0000

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

CC: Gerd Hoffmann <kraxel@redhat.com>
CC: "Gonglei (Arei)" <arei.gonglei@huawei.com>
CC: Eduardo Habkost <ehabkost@redhat.com>
CC: Igor Mammedov <imammedo@redhat.com>
CC: Laurent Vivier <lvivier@redhat.com>
CC: Amit Shah <amit@kernel.org>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Max Reitz <mreitz@redhat.com>
CC: John Snow <jsnow@redhat.com>
CC: Ari Sundholm <ari@tuxera.com>
CC: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>
CC: Fam Zheng <fam@euphon.net>
CC: Stefan Weil <sw@weilnetz.de>
CC: Ronnie Sahlberg <ronniesahlberg@gmail.com>
CC: Peter Lieven <pl@kamp.de>
CC: Eric Blake <eblake@redhat.com>
CC: "Denis V. Lunev" <den@openvz.org>
CC: Markus Armbruster <armbru@redhat.com>
CC: Alberto Garcia <berto@igalia.com>
CC: Jason Dillaman <dillaman@redhat.com>
CC: Wen Congyang <wencongyang2@huawei.com>
CC: Xie Changlong <xiechanglong.d@gmail.com>
CC: Liu Yuan <namei.unix@gmail.com>
CC: "Richard W.M. Jones" <rjones@redhat.com>
CC: Jeff Cody <codyprime@gmail.com>
CC: "Marc-André Lureau" <marcandre.lureau@redhat.com>
CC: "Daniel P. Berrangé" <berrange@redhat.com>
CC: Richard Henderson <rth@twiddle.net>
CC: Greg Kurz <groug@kaod.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
CC: Beniamino Galvani <b.galvani@gmail.com>
CC: Peter Maydell <peter.maydell@linaro.org>
CC: "Cédric Le Goater" <clg@kaod.org>
CC: Andrew Jeffery <andrew@aj.id.au>
CC: Joel Stanley <joel@jms.id.au>
CC: Andrew Baumann <Andrew.Baumann@microsoft.com>
CC: "Philippe Mathieu-Daudé" <philmd@redhat.com>
CC: Antony Pavlov <antonynpavlov@gmail.com>
CC: Jean-Christophe Dubois <jcd@tribudubois.net>
CC: Peter Chubb <peter.chubb@nicta.com.au>
CC: Subbaraya Sundeep <sundeep.lkml@gmail.com>
CC: Eric Auger <eric.auger@redhat.com>
CC: Alistair Francis <alistair@alistair23.me>
CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Anthony Perard <anthony.perard@citrix.com>
CC: Paul Durrant <paul@xen.org>
CC: Paul Burton <pburton@wavecomp.com>
CC: Aleksandar Rikalo <arikalo@wavecomp.com>
CC: Chris Wulff <crwulff@gmail.com>
CC: Marek Vasut <marex@denx.de>
CC: David Gibson <david@gibson.dropbear.id.au>
CC: Cornelia Huck <cohuck@redhat.com>
CC: Halil Pasic <pasic@linux.ibm.com>
CC: Christian Borntraeger <borntraeger@de.ibm.com>
CC: "Hervé Poussineau" <hpoussin@reactos.org>
CC: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
CC: Aurelien Jarno <aurelien@aurel32.net>
CC: Aleksandar Markovic <amarkovic@wavecomp.com>
CC: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: Jason Wang <jasowang@redhat.com>
CC: Laszlo Ersek <lersek@redhat.com>
CC: Yuval Shaia <yuval.shaia@oracle.com>
CC: Palmer Dabbelt <palmer@sifive.com>
CC: Sagar Karandikar <sagark@eecs.berkeley.edu>
CC: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
CC: David Hildenbrand <david@redhat.com>
CC: Thomas Huth <thuth@redhat.com>
CC: Eric Farman <farman@linux.ibm.com>
CC: Matthew Rosato <mjrosato@linux.ibm.com>
CC: Hannes Reinecke <hare@suse.com>
CC: Michael Walle <michael@walle.cc>
CC: Artyom Tarasenko <atar4qemu@gmail.com>
CC: Stefan Berger <stefanb@linux.ibm.com>
CC: Samuel Thibault <samuel.thibault@ens-lyon.org>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Tony Krowiak <akrowiak@linux.ibm.com>
CC: Pierre Morel <pmorel@linux.ibm.com>
CC: Michael Roth <mdroth@linux.vnet.ibm.com>
CC: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
CC: Juan Quintela <quintela@redhat.com>
CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
CC: Luigi Rizzo <rizzo@iet.unipi.it>
CC: Giuseppe Lettieri <g.lettieri@iet.unipi.it>
CC: Vincenzo Maffione <v.maffione@gmail.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>
CC: Anthony Green <green@moxielogic.com>
CC: Stafford Horne <shorne@gmail.com>
CC: Guan Xuetao <gxt@mprc.pku.edu.cn>
CC: Max Filippov <jcmvbkbc@gmail.com>
CC: qemu-block@nongnu.org
CC: integration@gluster.org
CC: sheepdog@lists.wpkg.org
CC: qemu-arm@nongnu.org
CC: xen-devel@lists.xenproject.org
CC: qemu-ppc@nongnu.org
CC: qemu-s390x@nongnu.org
CC: qemu-riscv@nongnu.org

 scripts/coccinelle/auto-propagated-errp.cocci | 118 ++++++++++++++++++
 1 file changed, 118 insertions(+)
 create mode 100644 scripts/coccinelle/auto-propagated-errp.cocci

diff --git a/scripts/coccinelle/auto-propagated-errp.cocci b/scripts/coccinelle/auto-propagated-errp.cocci
new file mode 100644
index 0000000000..d9731620aa
--- /dev/null
+++ b/scripts/coccinelle/auto-propagated-errp.cocci
@@ -0,0 +1,118 @@
+@rule0@
+// Add invocation to errp-functions where necessary
+identifier fn, local_err;
+symbol errp;
+@@
+
+ fn(..., Error **errp, ...)
+ {
++   ERRP_AUTO_PROPAGATE();
+    <+...
+(
+    error_append_hint(errp, ...);
+|
+    error_prepend(errp, ...);
+|
+    Error *local_err = NULL;
+)
+    ...+>
+ }
+
+@@
+// Drop doubled invocation
+identifier rule0.fn;
+@@
+
+ fn(...)
+{
+-   ERRP_AUTO_PROPAGATE();
+    ERRP_AUTO_PROPAGATE();
+    ...
+}
+
+@rule1@
+// Drop local_err
+identifier fn, local_err;
+symbol errp;
+@@
+
+ fn(..., Error **errp, ...)
+ {
+     <...
+-    Error *local_err = NULL;
+     ...>
+ }
+
+@@
+// Handle pattern with goto, otherwise we'll finish up
+// with labels at function end which will not compile.
+identifier rule1.fn;
+identifier rule1.local_err;
+identifier OUT;
+@@
+
+ fn(...)
+ {
+     <...
+-    goto OUT;
++    return;
+     ...>
+- OUT:
+-    error_propagate(errp, local_err);
+ }
+
+@@
+identifier rule1.fn;
+identifier rule1.local_err;
+@@
+
+ fn(...)
+ {
+     <...
+(
+-    error_free(local_err);
+-    local_err = NULL;
++    error_free_errp(errp);
+|
+-    error_free(local_err);
++    error_free_errp(errp);
+|
+-    error_report_err(local_err);
++    error_report_errp(errp);
+|
+-    warn_report_err(local_err);
++    warn_report_errp(errp);
+|
+-    error_propagate_prepend(errp, local_err,
++    error_prepend(errp,
+                              ...);
+|
+-    error_propagate(errp, local_err);
+)
+     ...>
+ }
+
+@@
+identifier rule1.fn;
+identifier rule1.local_err;
+@@
+
+ fn(...)
+ {
+     <...
+(
+-    &local_err
++    errp
+|
+-    local_err
++    *errp
+)
+     ...>
+ }
+
+@@
+symbol errp;
+@@
+
+- *errp != NULL
++ *errp
-- 
2.21.0


