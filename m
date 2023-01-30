Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMU7e-0005t1-Vs
	for mharc-qemu-riscv@gnu.org; Mon, 30 Jan 2023 08:22:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU73-0004yA-Ht
 for qemu-riscv@nongnu.org; Mon, 30 Jan 2023 08:22:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6o-0005kC-Sm
 for qemu-riscv@nongnu.org; Mon, 30 Jan 2023 08:22:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675084923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yo8RxmgtVnXL0bS5vFdivfD1QYbRW3xw/y/5lPafAos=;
 b=KvD/AnLKxiEI3XGnfUoV9FY6owQrrl81ZZ8/TLSEJ2uwAMwMvZQYqbqhCS+yEiQnu6K0hq
 sjZ0AJWjCundppnsTdXvhQDqrWdpcfPiHaS6yVzMxga5pSHz/wkduZwN+IVx+EOfdwLUDO
 xZcmnqfEuD0kdEkgyH/+6y6RqOtwXNI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-VoGU1dxEMEmw3cT9DBkhhg-1; Mon, 30 Jan 2023 08:21:59 -0500
X-MC-Unique: VoGU1dxEMEmw3cT9DBkhhg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C00138030D5;
 Mon, 30 Jan 2023 13:21:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 974CA492B03;
 Mon, 30 Jan 2023 13:21:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 64FC121E6914; Mon, 30 Jan 2023 14:21:56 +0100 (CET)
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
Subject: [PATCH v5 13/20] target/hexagon: Clean up includes
Date: Mon, 30 Jan 2023 14:21:49 +0100
Message-Id: <20230130132156.1868019-14-armbru@redhat.com>
In-Reply-To: <20230130132156.1868019-1-armbru@redhat.com>
References: <20230130132156.1868019-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
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
X-List-Received-Date: Mon, 30 Jan 2023 13:22:22 -0000

Clean up includes so that qemu/osdep.h is included first in .c, and
not in .h, and headers which it implies are not included manually.

This commit was created with scripts/clean-includes.

Changes to standalone programs dropped, because these intentionally
don't use qemu/osdep.h:

    target/hexagon/gen_dectree_import.c
    target/hexagon/gen_semantics.c
    target/hexagon/idef-parser/idef-parser.h
    target/hexagon/idef-parser/parser-helpers.c
    target/hexagon/idef-parser/parser-helpers.h

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 target/hexagon/hex_arch_types.h | 1 -
 target/hexagon/mmvec/macros.h   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/target/hexagon/hex_arch_types.h b/target/hexagon/hex_arch_types.h
index 885f68f760..52a7f2b2f3 100644
--- a/target/hexagon/hex_arch_types.h
+++ b/target/hexagon/hex_arch_types.h
@@ -18,7 +18,6 @@
 #ifndef HEXAGON_HEX_ARCH_TYPES_H
 #define HEXAGON_HEX_ARCH_TYPES_H
 
-#include "qemu/osdep.h"
 #include "mmvec/mmvec.h"
 #include "qemu/int128.h"
 
diff --git a/target/hexagon/mmvec/macros.h b/target/hexagon/mmvec/macros.h
index 8c864e8c68..1201d778d0 100644
--- a/target/hexagon/mmvec/macros.h
+++ b/target/hexagon/mmvec/macros.h
@@ -18,7 +18,6 @@
 #ifndef HEXAGON_MMVEC_MACROS_H
 #define HEXAGON_MMVEC_MACROS_H
 
-#include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "arch.h"
 #include "mmvec/system_ext_mmvec.h"
-- 
2.39.0


