Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCRAY-0003R8-L1
	for mharc-qemu-riscv@gnu.org; Mon, 23 Sep 2019 12:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57674)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCQxs-0002in-NI
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 12:13:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCQxq-00045Y-9x
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 12:13:28 -0400
Received: from relay.sw.ru ([185.231.240.75]:39520)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQxM-0003aF-A4; Mon, 23 Sep 2019 12:12:56 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQwz-0001Fp-8w; Mon, 23 Sep 2019 19:12:33 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, berrange@redhat.com, arei.gonglei@huawei.com,
 ehabkost@redhat.com, imammedo@redhat.com, lvivier@redhat.com,
 amit@kernel.org, kwolf@redhat.com, mreitz@redhat.com, ari@tuxera.com,
 pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, stefanha@redhat.com,
 jsnow@redhat.com, sw@weilnetz.de, fam@euphon.net, ronniesahlberg@gmail.com,
 pl@kamp.de, eblake@redhat.com, den@openvz.org, armbru@redhat.com,
 berto@igalia.com, dillaman@redhat.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, namei.unix@gmail.com, rjones@redhat.com,
 codyprime@gmail.com, marcandre.lureau@redhat.com, rth@twiddle.net,
 groug@kaod.org, mst@redhat.com, marcel.apfelbaum@gmail.com,
 b.galvani@gmail.com, peter.maydell@linaro.org,
 Andrew.Baumann@microsoft.com, philmd@redhat.com, antonynpavlov@gmail.com,
 jcd@tribudubois.net, peter.chubb@nicta.com.au, sundeep.lkml@gmail.com,
 joel@jms.id.au, eric.auger@redhat.com, alistair@alistair23.me,
 balrogg@gmail.com, edgar.iglesias@gmail.com, sstabellini@kernel.org,
 anthony.perard@citrix.com, paul.durrant@citrix.com, pburton@wavecomp.com,
 arikalo@wavecomp.com, clg@kaod.org, andrew@aj.id.au, crwulff@gmail.com,
 marex@denx.de, david@gibson.dropbear.id.au, pasic@linux.ibm.com,
 cohuck@redhat.com, borntraeger@de.ibm.com, hpoussin@reactos.org,
 xiaoguangrong.eric@gmail.com, aurelien@aurel32.net, amarkovic@wavecomp.com,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com, lersek@redhat.com,
 palmer@sifive.com, sagark@eecs.berkeley.edu,
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
 qemu-riscv@nongnu.org, vsementsov@virtuozzo.com
Subject: [RFC v2 3/9] errp: rename errp to errp_in where it is IN-argument
Date: Mon, 23 Sep 2019 19:12:25 +0300
Message-Id: <20190923161231.22028-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190923161231.22028-1-vsementsov@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
X-Mailman-Approved-At: Mon, 23 Sep 2019 12:26:31 -0400
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
X-List-Received-Date: Mon, 23 Sep 2019 16:13:31 -0000

Error **errp is almost always OUT-argument: it's assumed to be NULL, or
pointer to NULL-initialized pointer, or pointer to error_abort or
error_fatal, for callee to report error.

But very few functions (most of the are error API) instead get Error
**errp as IN-argument: it's assumed to be set, and callee should clean
it. In such cases, rename errp to errp_in.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/monitor/hmp.h |  2 +-
 include/qapi/error.h  |  8 ++++----
 ui/vnc.h              |  2 +-
 monitor/hmp-cmds.c    |  8 ++++----
 ui/vnc.c              | 10 +++++-----
 util/error.c          |  2 +-
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index a0e9511440..f929814f1a 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -16,7 +16,7 @@
 
 #include "qemu/readline.h"
 
-void hmp_handle_error(Monitor *mon, Error **errp);
+void hmp_handle_error(Monitor *mon, Error **errp_in);
 
 void hmp_info_name(Monitor *mon, const QDict *qdict);
 void hmp_info_version(Monitor *mon, const QDict *qdict);
diff --git a/include/qapi/error.h b/include/qapi/error.h
index 551385aa91..4264d22223 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -283,7 +283,7 @@ void error_free(Error *err);
 /*
  * Convenience function to assert that *@errp is set, then silently free it.
  */
-void error_free_or_abort(Error **errp);
+void error_free_or_abort(Error **errp_in);
 
 /*
  * Convenience function to warn_report() and free @err.
@@ -301,19 +301,19 @@ void error_report_err(Error *err);
  * Functions to clean Error **errp: call corresponding Error *err cleaning
  * function an set pointer to NULL
  */
-static inline void error_free_errp(Error **errp)
+static inline void error_free_errp(Error **errp_in)
 {
     error_free(*errp_in);
     *errp_in = NULL;
 }
 
-static inline void error_report_errp(Error **errp)
+static inline void error_report_errp(Error **errp_in)
 {
     error_report_err(*errp_in);
     *errp_in = NULL;
 }
 
-static inline void warn_report_errp(Error **errp)
+static inline void warn_report_errp(Error **errp_in)
 {
     warn_report_err(*errp_in);
     *errp_in = NULL;
diff --git a/ui/vnc.h b/ui/vnc.h
index fea79c2fc9..00e0b48f2f 100644
--- a/ui/vnc.h
+++ b/ui/vnc.h
@@ -547,7 +547,7 @@ uint32_t read_u32(uint8_t *data, size_t offset);
 
 /* Protocol stage functions */
 void vnc_client_error(VncState *vs);
-size_t vnc_client_io_error(VncState *vs, ssize_t ret, Error **errp);
+size_t vnc_client_io_error(VncState *vs, ssize_t ret, Error **errp_in);
 
 void start_client_init(VncState *vs);
 void start_auth_vnc(VncState *vs);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index b2551c16d1..941d5d0a45 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -60,11 +60,11 @@
 #include <spice/enums.h>
 #endif
 
-void hmp_handle_error(Monitor *mon, Error **errp)
+void hmp_handle_error(Monitor *mon, Error **errp_in)
 {
-    assert(errp);
-    if (*errp) {
-        error_reportf_err(*errp, "Error: ");
+    assert(errp_in);
+    if (*errp_in) {
+        error_reportf_err(*errp_in, "Error: ");
     }
 }
 
diff --git a/ui/vnc.c b/ui/vnc.c
index 87b8045afe..9d6384d9b1 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -1312,7 +1312,7 @@ void vnc_disconnect_finish(VncState *vs)
     g_free(vs);
 }
 
-size_t vnc_client_io_error(VncState *vs, ssize_t ret, Error **errp)
+size_t vnc_client_io_error(VncState *vs, ssize_t ret, Error **errp_in)
 {
     if (ret <= 0) {
         if (ret == 0) {
@@ -1320,14 +1320,14 @@ size_t vnc_client_io_error(VncState *vs, ssize_t ret, Error **errp)
             vnc_disconnect_start(vs);
         } else if (ret != QIO_CHANNEL_ERR_BLOCK) {
             trace_vnc_client_io_error(vs, vs->ioc,
-                                      errp ? error_get_pretty(*errp) :
+                                      errp_in ? error_get_pretty(*errp_in) :
                                       "Unknown");
             vnc_disconnect_start(vs);
         }
 
-        if (errp) {
-            error_free(*errp);
-            *errp = NULL;
+        if (errp_in) {
+            error_free(*errp_in);
+            *errp_in = NULL;
         }
         return 0;
     }
diff --git a/util/error.c b/util/error.c
index dfba091757..b3ff3832d6 100644
--- a/util/error.c
+++ b/util/error.c
@@ -271,7 +271,7 @@ void error_free(Error *err)
     }
 }
 
-void error_free_or_abort(Error **errp)
+void error_free_or_abort(Error **errp_in)
 {
     assert(errp_in && *errp_in);
     error_free(*errp_in);
-- 
2.21.0


