Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16B2C00528
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 09:47:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qMmjh-0005eO-MX; Fri, 21 Jul 2023 05:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qMmjc-0005b4-TO
 for qemu-riscv@nongnu.org; Fri, 21 Jul 2023 05:47:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qMmja-0006ci-CU
 for qemu-riscv@nongnu.org; Fri, 21 Jul 2023 05:47:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689932857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IyqG/kgcZTvr5bpBhu31pUNPGXnlZGiR/9HMe/ytHwk=;
 b=PZSwhXs/3aXJNpTCnibgb49vaozgI4wzG3D+Ylwa6JJ5bLC4Z67SaaSk64T6+wcwpsj0dS
 WwQxo4T45+g6X0jkJm1RPw5ZQnjVSmD/xe9i0Ezy0Mg6GvaSij8s166Hz78wkn3bQJVtSY
 60zHg/0C6Hcj4K2z1N2vSmRFFzBVADI=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-woTNg4ZvOC2xWXJOdB52eA-1; Fri, 21 Jul 2023 05:47:33 -0400
X-MC-Unique: woTNg4ZvOC2xWXJOdB52eA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C21932A59562;
 Fri, 21 Jul 2023 09:47:32 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFEA7492C13;
 Fri, 21 Jul 2023 09:47:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-stable@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 2/2] hw/char/riscv_htif: Fix the console syscall on big endian
 hosts
Date: Fri, 21 Jul 2023 11:47:20 +0200
Message-Id: <20230721094720.902454-3-thuth@redhat.com>
In-Reply-To: <20230721094720.902454-1-thuth@redhat.com>
References: <20230721094720.902454-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Values that have been read via cpu_physical_memory_read() from the
guest's memory have to be swapped in case the host endianess differs
from the guest.

Fixes: a6e13e31d5 ("riscv_htif: Support console output via proxy syscall")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/char/riscv_htif.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index f96df40124..40de6b8b77 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -30,6 +30,7 @@
 #include "qemu/timer.h"
 #include "qemu/error-report.h"
 #include "exec/address-spaces.h"
+#include "exec/tswap.h"
 #include "sysemu/dma.h"
 
 #define RISCV_DEBUG_HTIF 0
@@ -209,11 +210,11 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
             } else {
                 uint64_t syscall[8];
                 cpu_physical_memory_read(payload, syscall, sizeof(syscall));
-                if (syscall[0] == PK_SYS_WRITE &&
-                    syscall[1] == HTIF_DEV_CONSOLE &&
-                    syscall[3] == HTIF_CONSOLE_CMD_PUTC) {
+                if (tswap64(syscall[0]) == PK_SYS_WRITE &&
+                    tswap64(syscall[1]) == HTIF_DEV_CONSOLE &&
+                    tswap64(syscall[3]) == HTIF_CONSOLE_CMD_PUTC) {
                     uint8_t ch;
-                    cpu_physical_memory_read(syscall[2], &ch, 1);
+                    cpu_physical_memory_read(tswap64(syscall[2]), &ch, 1);
                     qemu_chr_fe_write(&s->chr, &ch, 1);
                     resp = 0x100 | (uint8_t)payload;
                 } else {
-- 
2.39.3


