Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVAP-0002Nc-Lw
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAL-0002Gu-DP
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:43:57 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAA-0000c3-Dp
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:43:56 -0400
Received: by mail-wm1-x32e.google.com with SMTP id p16so13109525wmq.5
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tRC8fgG8iCpSOIjOKosXJGOasPWQrMaIPqKcrWrmcng=;
 b=jICR+apECfEhCXQeArj+TuKXov5ECTX7lbhYOk4/YMFSqpqfP9y/INkz3jCDH6EmXk
 0MY5FYH/b6+05FZPbTN4ZPIuQf7T5vkpVtBNHkgsLQHLB0D6cTgF0I4rHNU043JSA2V/
 iQmZPDBdA8eZ+KYS+h6qXJKpnWjAlKPSubIfK1qySCvnGiXSBGI4YdcG7FvzWPYq+Lw/
 vzwz9CRsjeDiqcpxaUhoaRru281652kpHQW1a7mp4MREBekcGHC/ZyWGkoJlkanwT1Pw
 +ME2Cgr+STkynH/9wM0zkyVOqn5uhCXdo/Ree+ynVyqtFycAOtco+/XWxtc4W3hYWqS5
 tcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tRC8fgG8iCpSOIjOKosXJGOasPWQrMaIPqKcrWrmcng=;
 b=ONRlwEUdu9EM12TxDiv+GgutZYopO7+urDEevTLxz7RHWNUFpmxbwhY6F6+QkJVV1i
 Lkbw1BkykXgq3UEZmk6KZv6conDC6DFsVhwhbvgpraAOgPUFYbdl1KjvLpbBHv38SweG
 dqA43quvic69vKyqe/78CRcfjqkZfIrEkUfGRol3GTGnvYZDDGcKuS5KRWJDiVxy23C0
 Ag+jrJT5rssnHDTmOpnH5RwZDwsgXsdwtlhvxPI+9uDZ+Ux9Sm6z+G/VKUUBADG7Za4L
 3p4MhDdD2aVhIkduuhb7q7pFXrdM713ladlLw6Kz5G/7yz9ARHDxKOZ0U5eSUDNGKPv+
 PiyQ==
X-Gm-Message-State: AO0yUKV6gOA6stG3uSSNgbaCi7vgO9u/SlCwJrgMHKkxq9YB8Ir+sARg
 kjAEVkmecngnqbpyXUxpY8c6pQ==
X-Google-Smtp-Source: AK7set/HCFmkGj4jNHrrBiqZ41Ml7FiodOB3XFyut2rHb9qqOftJSbBGpOhEQ5lFWp0fVXC/nIFesg==
X-Received: by 2002:a05:600c:a4c:b0:3ed:2e02:1c02 with SMTP id
 c12-20020a05600c0a4c00b003ed2e021c02mr5813762wmq.23.1678902225020; 
 Wed, 15 Mar 2023 10:43:45 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c15-20020adfef4f000000b002c55ec7f661sm5353013wrp.5.2023.03.15.10.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:43:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D4C51FFC8;
 Wed, 15 Mar 2023 17:43:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-riscv@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Cleber Rosa <crosa@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Alexandre Iooss <erdnaxe@crans.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-ppc@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Vijai Kumar K <vijai@behindbytes.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Gibson <david@gibson.dropbear.id.au>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, David Woodhouse <dwmw2@infradead.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Tyrone Ting <kfting@nuvoton.com>, Kevin Wolf <kwolf@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Paul Durrant <paul@xen.org>,
 Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 16/32] include/qemu: Split out plugin-event.h
Date: Wed, 15 Mar 2023 17:43:15 +0000
Message-Id: <20230315174331.2959-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
X-List-Received-Date: Wed, 15 Mar 2023 17:43:57 -0000

From: Richard Henderson <richard.henderson@linaro.org>

The usage in hw/core/cpu.h only requires QEMU_PLUGIN_EV_MAX.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230310195252.210956-7-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/core/cpu.h       |  2 +-
 include/qemu/plugin-event.h | 26 ++++++++++++++++++++++++++
 include/qemu/plugin.h       | 17 +----------------
 3 files changed, 28 insertions(+), 17 deletions(-)
 create mode 100644 include/qemu/plugin-event.h

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 75689bff02..821e937020 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -30,7 +30,7 @@
 #include "qemu/rcu_queue.h"
 #include "qemu/queue.h"
 #include "qemu/thread.h"
-#include "qemu/plugin.h"
+#include "qemu/plugin-event.h"
 #include "qom/object.h"
 
 typedef int (*WriteCoreDumpFunction)(const void *buf, size_t size,
diff --git a/include/qemu/plugin-event.h b/include/qemu/plugin-event.h
new file mode 100644
index 0000000000..7056d8427b
--- /dev/null
+++ b/include/qemu/plugin-event.h
@@ -0,0 +1,26 @@
+/*
+ * Copyright (C) 2017, Emilio G. Cota <cota@braap.org>
+ *
+ * License: GNU GPL, version 2 or later.
+ *   See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_PLUGIN_EVENT_H
+#define QEMU_PLUGIN_EVENT_H
+
+/*
+ * Events that plugins can subscribe to.
+ */
+enum qemu_plugin_event {
+    QEMU_PLUGIN_EV_VCPU_INIT,
+    QEMU_PLUGIN_EV_VCPU_EXIT,
+    QEMU_PLUGIN_EV_VCPU_TB_TRANS,
+    QEMU_PLUGIN_EV_VCPU_IDLE,
+    QEMU_PLUGIN_EV_VCPU_RESUME,
+    QEMU_PLUGIN_EV_VCPU_SYSCALL,
+    QEMU_PLUGIN_EV_VCPU_SYSCALL_RET,
+    QEMU_PLUGIN_EV_FLUSH,
+    QEMU_PLUGIN_EV_ATEXIT,
+    QEMU_PLUGIN_EV_MAX, /* total number of plugin events we support */
+};
+
+#endif /* QEMU_PLUGIN_EVENT_H */
diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index e0ebedef84..6bf4bce188 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -12,24 +12,9 @@
 #include "qemu/error-report.h"
 #include "qemu/queue.h"
 #include "qemu/option.h"
+#include "qemu/plugin-event.h"
 #include "exec/memopidx.h"
 
-/*
- * Events that plugins can subscribe to.
- */
-enum qemu_plugin_event {
-    QEMU_PLUGIN_EV_VCPU_INIT,
-    QEMU_PLUGIN_EV_VCPU_EXIT,
-    QEMU_PLUGIN_EV_VCPU_TB_TRANS,
-    QEMU_PLUGIN_EV_VCPU_IDLE,
-    QEMU_PLUGIN_EV_VCPU_RESUME,
-    QEMU_PLUGIN_EV_VCPU_SYSCALL,
-    QEMU_PLUGIN_EV_VCPU_SYSCALL_RET,
-    QEMU_PLUGIN_EV_FLUSH,
-    QEMU_PLUGIN_EV_ATEXIT,
-    QEMU_PLUGIN_EV_MAX, /* total number of plugin events we support */
-};
-
 /*
  * Option parsing/processing.
  * Note that we can load an arbitrary number of plugins.
-- 
2.39.2


