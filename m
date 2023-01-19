Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIOuf-0006b7-50
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 02:00:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuC-0006KN-Ch
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 02:00:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOu6-00087K-Fr
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 02:00:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674111605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f/VVKT1WHi4fvcl9ZZ90491J4Of9RC38BDq4Nz8FniA=;
 b=WaXOb2QoxXPJC0A6TdgsHBvJLlv/QryPr++hPkYT/rSXWuusf1LoDpwnOXnR3zsfCf5oVx
 y7ybb4rv6xV0ebfN6RowmuBLH+XPjs8tonx4uYbIVWvJCyEpwRfl9X4F5SGLejzmUizfkP
 igpQ3dyB0APFWJArUwiURaRNU/I489w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-h0uIO5eLMuGsc7HOrq1grQ-1; Thu, 19 Jan 2023 02:00:03 -0500
X-MC-Unique: h0uIO5eLMuGsc7HOrq1grQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 054D780D0E3;
 Thu, 19 Jan 2023 07:00:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00F952166B2A;
 Thu, 19 Jan 2023 07:00:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4A6DA21E6681; Thu, 19 Jan 2023 07:59:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com, philmd@linaro.org,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v4 04/19] bsd-user: Clean up includes
Date: Thu, 19 Jan 2023 07:59:44 +0100
Message-Id: <20230119065959.3104012-5-armbru@redhat.com>
In-Reply-To: <20230119065959.3104012-1-armbru@redhat.com>
References: <20230119065959.3104012-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2023 07:00:14 -0000

Clean up includes so that osdep.h is included first and headers
which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 bsd-user/bsd-proc.h               | 4 ----
 bsd-user/qemu.h                   | 1 -
 bsd-user/arm/signal.c             | 1 +
 bsd-user/arm/target_arch_cpu.c    | 2 ++
 bsd-user/freebsd/os-sys.c         | 1 +
 bsd-user/i386/signal.c            | 1 +
 bsd-user/i386/target_arch_cpu.c   | 3 +--
 bsd-user/main.c                   | 4 +---
 bsd-user/strace.c                 | 1 -
 bsd-user/x86_64/signal.c          | 1 +
 bsd-user/x86_64/target_arch_cpu.c | 3 +--
 11 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/bsd-user/bsd-proc.h b/bsd-user/bsd-proc.h
index 68b66e571d..a1061bffb8 100644
--- a/bsd-user/bsd-proc.h
+++ b/bsd-user/bsd-proc.h
@@ -20,11 +20,7 @@
 #ifndef BSD_PROC_H_
 #define BSD_PROC_H_
 
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/time.h>
 #include <sys/resource.h>
-#include <unistd.h>
 
 /* exit(2) */
 static inline abi_long do_bsd_exit(void *cpu_env, abi_long arg1)
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index be6105385e..0ceecfb6df 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -17,7 +17,6 @@
 #ifndef QEMU_H
 #define QEMU_H
 
-#include "qemu/osdep.h"
 #include "cpu.h"
 #include "qemu/units.h"
 #include "exec/cpu_ldst.h"
diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
index 2b1dd745d1..9734407543 100644
--- a/bsd-user/arm/signal.c
+++ b/bsd-user/arm/signal.c
@@ -17,6 +17,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
 #include "qemu.h"
 
 /*
diff --git a/bsd-user/arm/target_arch_cpu.c b/bsd-user/arm/target_arch_cpu.c
index 02bf9149d5..fe38ae2210 100644
--- a/bsd-user/arm/target_arch_cpu.c
+++ b/bsd-user/arm/target_arch_cpu.c
@@ -16,6 +16,8 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
+
+#include "qemu/osdep.h"
 #include "target_arch.h"
 
 void target_cpu_set_tls(CPUARMState *env, target_ulong newtls)
diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index 309e27b9d6..1676ec10f8 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -17,6 +17,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
 #include "qemu.h"
 #include "target_arch_sysarch.h"
 
diff --git a/bsd-user/i386/signal.c b/bsd-user/i386/signal.c
index 5dd975ce56..a3131047b8 100644
--- a/bsd-user/i386/signal.c
+++ b/bsd-user/i386/signal.c
@@ -17,6 +17,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
 #include "qemu.h"
 
 /*
diff --git a/bsd-user/i386/target_arch_cpu.c b/bsd-user/i386/target_arch_cpu.c
index d349e45299..2a3af2ddef 100644
--- a/bsd-user/i386/target_arch_cpu.c
+++ b/bsd-user/i386/target_arch_cpu.c
@@ -17,9 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <sys/types.h>
-
 #include "qemu/osdep.h"
+
 #include "cpu.h"
 #include "qemu.h"
 #include "qemu/timer.h"
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 6f09180d65..41290e16f9 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -18,12 +18,10 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <sys/types.h>
-#include <sys/time.h>
+#include "qemu/osdep.h"
 #include <sys/resource.h>
 #include <sys/sysctl.h>
 
-#include "qemu/osdep.h"
 #include "qemu/help-texts.h"
 #include "qemu/units.h"
 #include "qemu/accel.h"
diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index a77d10dd6b..96499751eb 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -20,7 +20,6 @@
 #include <sys/select.h>
 #include <sys/syscall.h>
 #include <sys/ioccom.h>
-#include <ctype.h>
 
 #include "qemu.h"
 
diff --git a/bsd-user/x86_64/signal.c b/bsd-user/x86_64/signal.c
index c3875bc4c6..46cb865180 100644
--- a/bsd-user/x86_64/signal.c
+++ b/bsd-user/x86_64/signal.c
@@ -16,6 +16,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
 #include "qemu.h"
 
 /*
diff --git a/bsd-user/x86_64/target_arch_cpu.c b/bsd-user/x86_64/target_arch_cpu.c
index be7bd10720..1d32f18907 100644
--- a/bsd-user/x86_64/target_arch_cpu.c
+++ b/bsd-user/x86_64/target_arch_cpu.c
@@ -17,9 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <sys/types.h>
-
 #include "qemu/osdep.h"
+
 #include "cpu.h"
 #include "qemu.h"
 #include "qemu/timer.h"
-- 
2.39.0


