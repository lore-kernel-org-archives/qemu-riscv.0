Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNZoG-0006OZ-9f
	for mharc-qemu-riscv@gnu.org; Thu, 02 Feb 2023 08:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZns-0005hq-9N
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 08:39:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnb-00089g-Ug
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 08:39:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675345123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4bgpb4bpASxmEcWIyxQ7LpGXNyGvsKJ7HrcENKOYhp0=;
 b=e+32WjIxT0mSQM3CZs7aJ8iQw210o0gd6feeSlcGj2pRqplA0ZPKJ/qI1ek+iS6CCBhM24
 9oFlLCVo7Vkqf+2pPSKuGb3ThsKMlpMQHCdY7n+3GI73rjua5DnOdbCKHkcE9e7aryNpqx
 KtgErj/knowQ7yKVnbNZNI+AbFhuePQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-24yng0eVPYqeUANnERPgNA-1; Thu, 02 Feb 2023 08:38:39 -0500
X-MC-Unique: 24yng0eVPYqeUANnERPgNA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 632DE823DE9;
 Thu,  2 Feb 2023 13:38:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CD1A2166B33;
 Thu,  2 Feb 2023 13:38:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DA95B21E6916; Thu,  2 Feb 2023 14:38:30 +0100 (CET)
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
 qemu-riscv@nongnu.org, Eric Blake <eblake@redhat.com>
Subject: [PATCH v6 15/20] block: Clean up includes
Date: Thu,  2 Feb 2023 14:38:25 +0100
Message-Id: <20230202133830.2152150-16-armbru@redhat.com>
In-Reply-To: <20230202133830.2152150-1-armbru@redhat.com>
References: <20230202133830.2152150-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
X-List-Received-Date: Thu, 02 Feb 2023 13:39:07 -0000

This commit was created with scripts/clean-includes.

All .c should include qemu/osdep.h first.  The script performs three
related cleanups:

* Ensure .c files include qemu/osdep.h first.
* Including it in a .h is redundant, since the .c  already includes
  it.  Drop such inclusions.
* Likewise, including headers qemu/osdep.h includes is redundant.
  Drop these, too.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/block/graph-lock.h      | 1 -
 include/block/write-threshold.h | 2 --
 block/qapi.c                    | 1 -
 3 files changed, 4 deletions(-)

diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index 3ab924d5e2..18cc14de22 100644
--- a/include/block/graph-lock.h
+++ b/include/block/graph-lock.h
@@ -20,7 +20,6 @@
 #ifndef GRAPH_LOCK_H
 #define GRAPH_LOCK_H
 
-#include "qemu/osdep.h"
 #include "qemu/clang-tsa.h"
 
 /**
diff --git a/include/block/write-threshold.h b/include/block/write-threshold.h
index f50f923e7e..63d1583887 100644
--- a/include/block/write-threshold.h
+++ b/include/block/write-threshold.h
@@ -13,8 +13,6 @@
 #ifndef BLOCK_WRITE_THRESHOLD_H
 #define BLOCK_WRITE_THRESHOLD_H
 
-#include "qemu/typedefs.h"
-
 /*
  * bdrv_write_threshold_set:
  *
diff --git a/block/qapi.c b/block/qapi.c
index 9b4da12966..4f8df48cf4 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -40,7 +40,6 @@
 #include "qapi/qmp/qstring.h"
 #include "qemu/qemu-print.h"
 #include "sysemu/block-backend.h"
-#include "qemu/cutils.h"
 
 BlockDeviceInfo *bdrv_block_device_info(BlockBackend *blk,
                                         BlockDriverState *bs,
-- 
2.39.0


