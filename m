Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozaeN-0004LW-G7
	for mharc-qemu-riscv@gnu.org; Mon, 28 Nov 2022 04:42:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozaeA-0004J9-0X
 for qemu-riscv@nongnu.org; Mon, 28 Nov 2022 04:41:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozae8-0007Qn-FD
 for qemu-riscv@nongnu.org; Mon, 28 Nov 2022 04:41:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669628511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyTfzcYvUwNyh5nc3qDQgo1OuSflc6q4bmmLIQTAoqY=;
 b=CsbXmYwwCXaxRST3SkEybZiW+PDrOxk3EuW0tJx2CYjTrVeW6ZAszI/g20BAFZAfVKd6td
 JBrl9zJzW+yjrVdOezgwDp+4wzvSXe2VwAWqNL6JB8oZxWTzY+LNxkqFdKNuzBTDmNdcSB
 JgyDH8elMxAKBC4d9CT0PioK6isfRXk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-SbAiio-APR-6ALGZzBVvzQ-1; Mon, 28 Nov 2022 04:41:49 -0500
X-MC-Unique: SbAiio-APR-6ALGZzBVvzQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C50883817967;
 Mon, 28 Nov 2022 09:41:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45A9340C2087;
 Mon, 28 Nov 2022 09:41:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1CA2821E688F; Mon, 28 Nov 2022 10:41:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, yuval.shaia.ml@gmail.com,
 marcel.apfelbaum@gmail.com, mst@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, pavel.dovgaluk@ispras.ru, alex.bennee@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mrolnik@gmail.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com, berrange@redhat.com,
 thuth@redhat.com, lvivier@redhat.com, suhang16@mails.ucas.ac.cn,
 chen.zhang@intel.com, lizhijian@fujitsu.com, stefanha@redhat.com,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, virtio-fs@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 3/3] ppc4xx_sdram: Simplify sdram_ddr_size() to return
 directly
Date: Mon, 28 Nov 2022 10:41:38 +0100
Message-Id: <20221128094138.2824623-4-armbru@redhat.com>
In-Reply-To: <20221128094138.2824623-1-armbru@redhat.com>
References: <20221128094138.2824623-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 28 Nov 2022 09:41:55 -0000

Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/ppc4xx_sdram.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
index 54bf9a2b44..a24c80b1d2 100644
--- a/hw/ppc/ppc4xx_sdram.c
+++ b/hw/ppc/ppc4xx_sdram.c
@@ -192,17 +192,13 @@ static inline hwaddr sdram_ddr_base(uint32_t bcr)
 
 static hwaddr sdram_ddr_size(uint32_t bcr)
 {
-    hwaddr size;
-    int sh;
+    int sh = (bcr >> 17) & 0x7;
 
-    sh = (bcr >> 17) & 0x7;
     if (sh == 7) {
-        size = -1;
-    } else {
-        size = (4 * MiB) << sh;
+        return -1;
     }
 
-    return size;
+    return (4 * MiB) << sh;
 }
 
 static uint32_t sdram_ddr_dcr_read(void *opaque, int dcrn)
-- 
2.37.3


