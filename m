Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIOvB-00072V-Go
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 02:01:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuY-0006Xc-Gr
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 02:00:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuM-0008CJ-SV
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 02:00:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674111610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PM2W6BJvS1SCT2/L4hzmf86UBM6uCRYswhKFoahaeoE=;
 b=gAZkPldxUKVjOPST6FDgpvqIwMsM9MhD14Dvccm8XzN9FLZjnPClOq26QoWXOIG+rIrm+K
 qRyAO01rU1Oc9yoEA7j8U4fzD//YHL9ZM7dTgovyO1VTEUMjIt0uM2L/+UTwxf1tnnSj8I
 L/QkZBgQr8ZIoRABUvq4bxRjv8t/rMk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-nYu3z3D-OOGiJSytUB5CKQ-1; Thu, 19 Jan 2023 02:00:06 -0500
X-MC-Unique: nYu3z3D-OOGiJSytUB5CKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15EE4101A55E;
 Thu, 19 Jan 2023 07:00:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C498040C6EC4;
 Thu, 19 Jan 2023 07:00:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6FB0A21E5DE0; Thu, 19 Jan 2023 07:59:59 +0100 (CET)
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
Subject: [PATCH v4 16/19] Fix non-first inclusions of qemu/osdep.h
Date: Thu, 19 Jan 2023 07:59:56 +0100
Message-Id: <20230119065959.3104012-17-armbru@redhat.com>
In-Reply-To: <20230119065959.3104012-1-armbru@redhat.com>
References: <20230119065959.3104012-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 19 Jan 2023 07:00:35 -0000

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 audio/sndioaudio.c       |  2 +-
 backends/hostmem-epc.c   |  2 +-
 block/export/vduse-blk.c |  2 +-
 hw/hyperv/syndbg.c       |  2 +-
 util/async-teardown.c    | 12 ++++--------
 5 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/audio/sndioaudio.c b/audio/sndioaudio.c
index 632b0e3825..3fde01fdbd 100644
--- a/audio/sndioaudio.c
+++ b/audio/sndioaudio.c
@@ -14,9 +14,9 @@
  * to recording, which is what guest systems expect.
  */
 
+#include "qemu/osdep.h"
 #include <poll.h>
 #include <sndio.h>
-#include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "audio.h"
 #include "trace.h"
diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
index 037292d267..4e162d6789 100644
--- a/backends/hostmem-epc.c
+++ b/backends/hostmem-epc.c
@@ -9,9 +9,9 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  */
-#include <sys/ioctl.h>
 
 #include "qemu/osdep.h"
+#include <sys/ioctl.h>
 #include "qom/object_interfaces.h"
 #include "qapi/error.h"
 #include "sysemu/hostmem.h"
diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index 350d6fdaf0..f7ae44e3ce 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -10,9 +10,9 @@
  * later.  See the COPYING file in the top-level directory.
  */
 
+#include "qemu/osdep.h"
 #include <sys/eventfd.h>
 
-#include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "block/export.h"
 #include "qemu/error-report.h"
diff --git a/hw/hyperv/syndbg.c b/hw/hyperv/syndbg.c
index 16d04cfdc6..94fe1b534b 100644
--- a/hw/hyperv/syndbg.c
+++ b/hw/hyperv/syndbg.c
@@ -5,8 +5,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include "qemu/ctype.h"
 #include "qemu/osdep.h"
+#include "qemu/ctype.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/sockets.h"
diff --git a/util/async-teardown.c b/util/async-teardown.c
index 62bfce1b3c..62cdeb0f20 100644
--- a/util/async-teardown.c
+++ b/util/async-teardown.c
@@ -10,16 +10,12 @@
  * option) any later version.  See the COPYING file in the top-level directory.
  *
  */
-#include <stdlib.h>
-#include <stdio.h>
-#include <sys/types.h>
-#include <dirent.h>
-#include <sys/prctl.h>
-#include <signal.h>
-#include <sched.h>
-#include <unistd.h>
 
 #include "qemu/osdep.h"
+#include <dirent.h>
+#include <sys/prctl.h>
+#include <sched.h>
+
 #include "qemu/async-teardown.h"
 
 #ifdef _SC_THREAD_STACK_MIN
-- 
2.39.0


