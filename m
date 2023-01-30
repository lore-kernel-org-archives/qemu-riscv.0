Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMU70-0004or-SQ
	for mharc-qemu-riscv@gnu.org; Mon, 30 Jan 2023 08:22:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6n-0004F3-Be
 for qemu-riscv@nongnu.org; Mon, 30 Jan 2023 08:22:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6k-0005hK-JI
 for qemu-riscv@nongnu.org; Mon, 30 Jan 2023 08:22:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675084921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FMxl36Bz4aHtswUyLTzYVqdyTS4VJBWDPTNwMT0G9V8=;
 b=XJyKHnJ30WMGN0vsQPhzOrdmKioDuHyDOb4xCSN1spR4rRhQ42RszbXTjXpg13Z3OE6aX2
 8yssH+aNfu4yi3e3htGZEdPLdImS7uQs/JmFjBOgfBTQGtWpOZkojh1B3jFOXURguqXgmr
 MUYIRGTOYwJZqikWdmDCkWjoxepKC4k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-b-Z2UpSLM6WIbTHrrKki1Q-1; Mon, 30 Jan 2023 08:21:59 -0500
X-MC-Unique: b-Z2UpSLM6WIbTHrrKki1Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AB7B183B3CB;
 Mon, 30 Jan 2023 13:21:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 642E22026D4B;
 Mon, 30 Jan 2023 13:21:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5302A21E6A26; Mon, 30 Jan 2023 14:21:56 +0100 (CET)
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
Subject: [PATCH v5 07/20] hw/cxl: Clean up includes
Date: Mon, 30 Jan 2023 14:21:43 +0100
Message-Id: <20230130132156.1868019-8-armbru@redhat.com>
In-Reply-To: <20230130132156.1868019-1-armbru@redhat.com>
References: <20230130132156.1868019-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
X-List-Received-Date: Mon, 30 Jan 2023 13:22:12 -0000

Clean up includes so that qemu/osdep.h is included first in .c, and
not in .h, and headers which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl_component.h | 2 --
 include/hw/cxl/cxl_host.h      | 1 -
 include/hw/cxl/cxl_pci.h       | 1 -
 3 files changed, 4 deletions(-)

diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
index 5dca21e95b..692d7a5507 100644
--- a/include/hw/cxl/cxl_component.h
+++ b/include/hw/cxl/cxl_component.h
@@ -15,9 +15,7 @@
 #define CXL2_COMPONENT_CM_REGION_SIZE 0x1000
 #define CXL2_COMPONENT_BLOCK_SIZE 0x10000
 
-#include "qemu/compiler.h"
 #include "qemu/range.h"
-#include "qemu/typedefs.h"
 #include "hw/cxl/cxl_cdat.h"
 #include "hw/register.h"
 #include "qapi/error.h"
diff --git a/include/hw/cxl/cxl_host.h b/include/hw/cxl/cxl_host.h
index a1b662ce40..c9bc9c7c50 100644
--- a/include/hw/cxl/cxl_host.h
+++ b/include/hw/cxl/cxl_host.h
@@ -7,7 +7,6 @@
  * COPYING file in the top-level directory.
  */
 
-#include "qemu/osdep.h"
 #include "hw/cxl/cxl.h"
 #include "hw/boards.h"
 
diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
index 01e15ed5b4..407be95b9e 100644
--- a/include/hw/cxl/cxl_pci.h
+++ b/include/hw/cxl/cxl_pci.h
@@ -10,7 +10,6 @@
 #ifndef CXL_PCI_H
 #define CXL_PCI_H
 
-#include "qemu/compiler.h"
 
 #define CXL_VENDOR_ID 0x1e98
 
-- 
2.39.0


