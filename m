Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D739BEDE98F
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 08:08:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qghOJ-0001LT-7W; Thu, 14 Sep 2023 04:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1qghOF-0001KM-9i; Thu, 14 Sep 2023 04:07:56 -0400
Received: from forward501b.mail.yandex.net ([178.154.239.145])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1qghOC-0006bl-7i; Thu, 14 Sep 2023 04:07:55 -0400
Received: from mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c08:9396:0:640:dd2a:0])
 by forward501b.mail.yandex.net (Yandex) with ESMTP id 137C15E606;
 Thu, 14 Sep 2023 11:07:46 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id e7bUnJIDWmI0-VMRU5piU; 
 Thu, 14 Sep 2023 11:07:45 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1694678865; bh=kzBWB1v9vn5aFgl0dNFf2jKKkNdKOiQWqEi58nCywks=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=akAcXPNoxxyGlCxeesp6mwrlkFuvGzfeAzCpj27FyrUCRoeViZltoBmAMyprqzsyw
 ywxeFLRBdUVBTZPhjfVV9EzZsALHJHieYz+S5D85wy+5NtcbWQ9o+rI/c8GxHHrRCk
 nQd+B0r/NPjMj+/F08AsUHe6tRlXn2NyBLA0b2zM=
Authentication-Results: mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net;
 dkim=pass header.i=@maquefel.me
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Cc: Nikita Shubin <n.shubin@yadro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH v2 2/2] hw/riscv: hart: allow other cpu instance
Date: Thu, 14 Sep 2023 11:07:40 +0300
Message-Id: <20230914080740.7561-3-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914080740.7561-1-nikita.shubin@maquefel.me>
References: <20230914080740.7561-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.145;
 envelope-from=nikita.shubin@maquefel.me; helo=forward501b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Nikita Shubin <n.shubin@yadro.com>

Allow using instances derivative from RISCVCPU

Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
---
 hw/riscv/riscv_hart.c         | 20 ++++++++++++--------
 include/hw/riscv/riscv_hart.h |  2 +-
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 613ea2aaa0..020ba18e8b 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -43,24 +43,28 @@ static void riscv_harts_cpu_reset(void *opaque)
 }
 
 static bool riscv_hart_realize(RISCVHartArrayState *s, int idx,
-                               char *cpu_type, Error **errp)
+                               char *cpu_type, size_t size, Error **errp)
 {
-    object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx], cpu_type);
-    qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "resetvec", s->resetvec);
-    s->harts[idx].env.mhartid = s->hartid_base + idx;
-    qemu_register_reset(riscv_harts_cpu_reset, &s->harts[idx]);
-    return qdev_realize(DEVICE(&s->harts[idx]), NULL, errp);
+    RISCVCPU *hart = s->harts[idx];
+    object_initialize_child_internal(OBJECT(s), "harts[*]",
+                                    hart, size, cpu_type);
+    qdev_prop_set_uint64(DEVICE(hart), "resetvec", s->resetvec);
+    hart->env.mhartid = s->hartid_base + idx;
+    qemu_register_reset(riscv_harts_cpu_reset, hart);
+    return qdev_realize(DEVICE(hart), NULL, errp);
 }
 
 static void riscv_harts_realize(DeviceState *dev, Error **errp)
 {
     RISCVHartArrayState *s = RISCV_HART_ARRAY(dev);
+    size_t size = object_type_get_instance_size(s->cpu_type);
     int n;
 
-    s->harts = g_new0(RISCVCPU, s->num_harts);
+    s->harts = g_new0(RISCVCPU *, s->num_harts);
 
     for (n = 0; n < s->num_harts; n++) {
-        if (!riscv_hart_realize(s, n, s->cpu_type, errp)) {
+        s->harts[n] = RISCV_CPU(object_new(s->cpu_type));
+        if (!riscv_hart_realize(s, n, s->cpu_type, size, errp)) {
             return;
         }
     }
diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
index 912b4a2682..5f6ef06411 100644
--- a/include/hw/riscv/riscv_hart.h
+++ b/include/hw/riscv/riscv_hart.h
@@ -38,7 +38,7 @@ struct RISCVHartArrayState {
     uint32_t hartid_base;
     char *cpu_type;
     uint64_t resetvec;
-    RISCVCPU *harts;
+    RISCVCPU **harts;
 };
 
 #endif
-- 
2.39.2


