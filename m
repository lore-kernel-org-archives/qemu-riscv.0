Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNZoC-00069T-Mj
	for mharc-qemu-riscv@gnu.org; Thu, 02 Feb 2023 08:39:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnp-0005dQ-SZ
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 08:39:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnb-00088r-Jr
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 08:39:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675345122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XwzEO3ZQawUyZo8ixZ4rxULzkUrAMNz/Pht7lQz55io=;
 b=WIrLGFJ4BwpUlLK5nufFRvrXPEqmH70h5zmSAbQyJEdaRo55AgrR4AHeN8dug2Li2k/PYb
 HTMwHvSpcKpb4/uY+CSJXuEmEMynOjpDoRGtnr2N0hTJNa8E8mZ+pQjXawYibdMa41AKIZ
 lRFZD20KaquU2RgkPCEpP4q/jKcmHLY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-P8aHkW4BPUyatzySdDJttQ-1; Thu, 02 Feb 2023 08:38:38 -0500
X-MC-Unique: P8aHkW4BPUyatzySdDJttQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62366102F1ED;
 Thu,  2 Feb 2023 13:38:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39B0F492C3E;
 Thu,  2 Feb 2023 13:38:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E1DB721E691B; Thu,  2 Feb 2023 14:38:30 +0100 (CET)
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
Subject: [PATCH v6 17/20] Fix non-first inclusions of qemu/osdep.h
Date: Thu,  2 Feb 2023 14:38:27 +0100
Message-Id: <20230202133830.2152150-18-armbru@redhat.com>
In-Reply-To: <20230202133830.2152150-1-armbru@redhat.com>
References: <20230202133830.2152150-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
X-List-Received-Date: Thu, 02 Feb 2023 13:39:04 -0000

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
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


