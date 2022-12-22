Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8KND-0007Wm-RE
	for mharc-qemu-riscv@gnu.org; Thu, 22 Dec 2022 07:08:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8KNB-0007Ue-Qw
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 07:08:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8KN6-0004bG-8l
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 07:08:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671710903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DtlmAGI4tYrX1qCtGmQnW9EFq9Qipk3gRJ1ke0PpJ/0=;
 b=exzMvOY2hmYBggiEliQkXwj+UKtUMiAkA1YUQIjJtiIsuu2PuDtz4jlqKykAQEhBOK7+XR
 AP83HME1V0KDZJIpSA0AEz3LkM0s5NaVFAukIh4hzObrjE1l/RTTQvxr0SiWZRnoFZrZN/
 hLdQO8LoENm/qMckKsAwT47AKx4PFNE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-hBt_20iEPaeh8n8l9jXqyA-1; Thu, 22 Dec 2022 07:08:16 -0500
X-MC-Unique: hBt_20iEPaeh8n8l9jXqyA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E2E885A588;
 Thu, 22 Dec 2022 12:08:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67646C16028;
 Thu, 22 Dec 2022 12:08:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 43C3421E691E; Thu, 22 Dec 2022 13:08:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, laurent@vivier.eu, edgar.iglesias@gmail.com,
 Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 marcel.apfelbaum@gmail.com, yangxiaojuan@loongson.cn, gaosong@loongson.cn,
 richard.henderson@linaro.org, deller@gmx.de, jasowang@redhat.com,
 vikram.garhwal@amd.com, francisco.iglesias@amd.com, clg@kaod.org,
 kraxel@redhat.com, marcandre.lureau@redhat.com, riku.voipio@iki.fi,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 crwulff@gmail.com, marex@denx.de,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v2 1/4] include/hw/virtio: Break inclusion loop
Date: Thu, 22 Dec 2022 13:08:10 +0100
Message-Id: <20221222120813.727830-2-armbru@redhat.com>
In-Reply-To: <20221222120813.727830-1-armbru@redhat.com>
References: <20221222120813.727830-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-List-Received-Date: Thu, 22 Dec 2022 12:08:30 -0000

hw/virtio/virtio.h and hw/virtio/vhost.h include each other.  The
former doesn't actually need the latter, so drop that inclusion to
break the loop.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/hw/virtio/virtio.h | 1 -
 hw/virtio/virtio-qmp.c     | 1 +
 hw/virtio/virtio.c         | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 24561e933a..48ab2117b5 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -22,7 +22,6 @@
 #include "standard-headers/linux/virtio_config.h"
 #include "standard-headers/linux/virtio_ring.h"
 #include "qom/object.h"
-#include "hw/virtio/vhost.h"
 
 /*
  * A guest should never accept this. It implies negotiation is broken
diff --git a/hw/virtio/virtio-qmp.c b/hw/virtio/virtio-qmp.c
index 8e7282658f..3d4497da99 100644
--- a/hw/virtio/virtio-qmp.c
+++ b/hw/virtio/virtio-qmp.c
@@ -11,6 +11,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/virtio/virtio.h"
+#include "hw/virtio/vhost.h"
 #include "virtio-qmp.h"
 
 #include "standard-headers/linux/virtio_ids.h"
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 289eb71045..0ec6ff9ae4 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -25,6 +25,7 @@
 #include "qom/object_interfaces.h"
 #include "hw/core/cpu.h"
 #include "hw/virtio/virtio.h"
+#include "hw/virtio/vhost.h"
 #include "migration/qemu-file-types.h"
 #include "qemu/atomic.h"
 #include "hw/virtio/virtio-bus.h"
-- 
2.38.1


