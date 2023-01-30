Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMU7h-0005yi-AJ
	for mharc-qemu-riscv@gnu.org; Mon, 30 Jan 2023 08:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6v-0004RP-Nj
 for qemu-riscv@nongnu.org; Mon, 30 Jan 2023 08:22:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6m-0005i3-SE
 for qemu-riscv@nongnu.org; Mon, 30 Jan 2023 08:22:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675084921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Lsooe6AIqRlDKr8oVmxGSClV1yzmJJRHR2bzlPP/6Q=;
 b=NdA4bzwX+/krxPxNjfprKL/2VSDN4AnWZYjzqA4rwQQwRJV/Lujoi4hXfOZwpIBFbgqeoK
 SL6lIK6E/P2BtxvlXfIa5u9A1gdcpNro+3pmZ/cZEJWXPTR9imxAfHrTYdbkDC9mjMhBNy
 jhXGIC34j/KAqO1f+OrBdog6CDj+sp4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-DanFbV5BNXyokyNA3sjBkw-1; Mon, 30 Jan 2023 08:21:59 -0500
X-MC-Unique: DanFbV5BNXyokyNA3sjBkw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A143C183B3D1;
 Mon, 30 Jan 2023 13:21:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B06640C2004;
 Mon, 30 Jan 2023 13:21:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5C15021E6901; Mon, 30 Jan 2023 14:21:56 +0100 (CET)
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
Subject: [PATCH v5 10/20] qga: Clean up includes
Date: Mon, 30 Jan 2023 14:21:46 +0100
Message-Id: <20230130132156.1868019-11-armbru@redhat.com>
In-Reply-To: <20230130132156.1868019-1-armbru@redhat.com>
References: <20230130132156.1868019-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
X-List-Received-Date: Mon, 30 Jan 2023 13:22:14 -0000

Clean up includes so that qemu/osdep.h is included first in .c, and
not in .h, and headers which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 qga/cutils.h         | 2 --
 qga/commands-posix.c | 1 -
 qga/cutils.c         | 3 ++-
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/qga/cutils.h b/qga/cutils.h
index f0f30a7d28..c1f2f4b17a 100644
--- a/qga/cutils.h
+++ b/qga/cutils.h
@@ -1,8 +1,6 @@
 #ifndef CUTILS_H_
 #define CUTILS_H_
 
-#include "qemu/osdep.h"
-
 int qga_open_cloexec(const char *name, int flags, mode_t mode);
 
 #endif /* CUTILS_H_ */
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index ebd33a643c..079689d79a 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -51,7 +51,6 @@
 #else
 #include <net/ethernet.h>
 #endif
-#include <sys/types.h>
 #ifdef CONFIG_SOLARIS
 #include <sys/sockio.h>
 #endif
diff --git a/qga/cutils.c b/qga/cutils.c
index b8e142ef64..b21bcf3683 100644
--- a/qga/cutils.c
+++ b/qga/cutils.c
@@ -2,8 +2,9 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  */
-#include "cutils.h"
 
+#include "qemu/osdep.h"
+#include "cutils.h"
 #include "qapi/error.h"
 
 /**
-- 
2.39.0


