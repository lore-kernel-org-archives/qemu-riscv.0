Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIOuh-0006cc-KL
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 02:00:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuI-0006LZ-Mz
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 02:00:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuF-0008CM-1a
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 02:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674111610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=crP6mBB8FenMMe0mP+YUj+myR0zA5GWaiOW3a613yRo=;
 b=ZxH08wEfsMWrle/MI2myWlmsZxJVaIemcm1hnYOpWZ8GxdqHxqRufX0Q4YNETUtsPkDlvl
 +dzP72MRKg/6PA/81AT95muJzwjtAOBxqpI3BxrU0Zsfjj1+ng+syoLkUqou44yjrwGquH
 dKILZnm90cSRkJjdQeTAnHRqNjmKmzA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-lGV4UpUgO7aRyKSfo5IU7g-1; Thu, 19 Jan 2023 02:00:06 -0500
X-MC-Unique: lGV4UpUgO7aRyKSfo5IU7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05827280BCA2;
 Thu, 19 Jan 2023 07:00:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCBC22166B29;
 Thu, 19 Jan 2023 07:00:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6C88621E5DCF; Thu, 19 Jan 2023 07:59:59 +0100 (CET)
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
Subject: [PATCH v4 15/19] accel: Clean up includes
Date: Thu, 19 Jan 2023 07:59:55 +0100
Message-Id: <20230119065959.3104012-16-armbru@redhat.com>
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
X-List-Received-Date: Thu, 19 Jan 2023 07:00:23 -0000

Clean up includes so that osdep.h is included first and headers
which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/sysemu/accel-blocker.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/sysemu/accel-blocker.h b/include/sysemu/accel-blocker.h
index 72020529ef..0733783bcc 100644
--- a/include/sysemu/accel-blocker.h
+++ b/include/sysemu/accel-blocker.h
@@ -14,7 +14,6 @@
 #ifndef ACCEL_BLOCKER_H
 #define ACCEL_BLOCKER_H
 
-#include "qemu/osdep.h"
 #include "sysemu/cpus.h"
 
 extern void accel_blocker_init(void);
-- 
2.39.0


