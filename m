Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCRAY-0003Qf-CY
	for mharc-qemu-riscv@gnu.org; Mon, 23 Sep 2019 12:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57639)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCQxq-0002i7-CV
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 12:13:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCQxn-00044O-OM
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 12:13:26 -0400
Received: from relay.sw.ru ([185.231.240.75]:39522)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQxM-0003aE-IE; Mon, 23 Sep 2019 12:12:56 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQwy-0001Fp-8L; Mon, 23 Sep 2019 19:12:32 +0300
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
Subject: [RFC v2 1/9] error: auto propagated local_err
Date: Mon, 23 Sep 2019 19:12:23 +0300
Message-Id: <20190923161231.22028-2-vsementsov@virtuozzo.com>
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

Here is introduced ERRP_FUNCTION_BEGIN macro, to be used at start of
any function with errp parameter.

It has three goals:

1. Fix issue with error_fatal & error_append_hint: user can't see these
hints, because exit() happens in error_setg earlier than hint is
appended. [Reported by Greg Kurz]

2. Fix issue with error_abort & error_propagate: when we wrap
error_abort by local_err+error_propagate, resulting coredump will
refer to error_propagate and not to the place where error happened.
(the macro itself don't fix the issue, but it allows to [3.] drop all
local_err+error_propagate pattern, which will definitely fix the issue)
[Reported by Kevin Wolf]

3. Drop local_err+error_propagate pattern, which is used to workaround
void functions with errp parameter, when caller wants to know resulting
status. (Note: actually these functions should be merely updated to
return int error code).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qapi/error.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/qapi/error.h b/include/qapi/error.h
index 3f95141a01..f6f4fa0fac 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -322,6 +322,43 @@ void error_set_internal(Error **errp,
                         ErrorClass err_class, const char *fmt, ...)
     GCC_FMT_ATTR(6, 7);
 
+typedef struct ErrorPropagator {
+    Error *local_err;
+    Error **errp;
+} ErrorPropagator;
+
+static inline void error_propagator_cleanup(ErrorPropagator *prop)
+{
+    error_propagate(prop->errp, prop->local_err);
+}
+
+G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(ErrorPropagator, error_propagator_cleanup);
+
+/*
+ * ERRP_FUNCTION_BEGIN
+ *
+ * This macro MUST be the first line of EACH function with Error **errp
+ * parameter.
+ *
+ * If errp is NULL or points to error_fatal, it is rewritten to point to
+ * local Error object, which will be automatically propagated to original
+ * errp on function exit (see error_propagator_cleanup).
+ *
+ * After invocation of this macro it is always safe to dereference errp
+ * (as it's not NULL anymore) and to append hint (by error_append_hint)
+ * (as, if it was error_fatal, we swapped it by local_error to be
+ * propagated on cleanup).
+ *
+ * Note: we don't wrap error_abort case, as we want resulting coredump
+ * to point to the place where the error happened, not to error_propagate.
+ */
+#define ERRP_FUNCTION_BEGIN() \
+g_auto(ErrorPropagator) __auto_errp_prop = {.errp = errp}; \
+Error **__local_errp_unused __attribute__ ((unused)) = \
+    (errp = (errp == NULL || *errp == error_fatal ? \
+             &__auto_errp_prop.local_err : errp))
+
+
 /*
  * Special error destination to abort on error.
  * See error_setg() and error_propagate() for details.
-- 
2.21.0


