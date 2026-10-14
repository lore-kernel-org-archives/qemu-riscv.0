Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797DDCC6B1D
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 09:46:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGvZV-0001Ov-Jo; Wed, 14 Oct 2026 05:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvYJ-0007eU-Vw
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:45:43 -0400
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvYG-0002Yz-5f
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:45:39 -0400
Received: by mail-dl1-x122e.google.com with SMTP id
 a92af1059eb24-1419d3416ceso1196656c88.0
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 02:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791971134; x=1792575934; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=47rkJyHTHaoX94n5mXjj187II58O48Rz7ARv90xXfM0=;
 b=ONtSK1PeuUDT4UL24kOqydC8AucdycHLbBv5rqEnzcHHzdIMT85fMSx0eV3xW95yzF
 1w6hr1dT0aXRzVOKYNx76+L4bhgNizVjfe1m9O7946GIpK1kkGN+tH54kvzuSpJD3T0Q
 A0bPTBsAHyTZCsf1Qb/60YSNzYpBEilGkHDiIyMZKt6F9MY51I4rTrdcSkD/noXvyRsu
 0OVoXyHitUhSKG6cWIoD0FWtRi+FxZB9aPisEovQqyEhPIOd3w6iN6KRt/OMn1Lr7KNe
 zaf6XMzjybqP0RZHsWkZ0GHZ9UZcThJLkQh94dDs7X0W+W+cYo6l0gUrBTjqp5xwXiy3
 apvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791971134; x=1792575934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=47rkJyHTHaoX94n5mXjj187II58O48Rz7ARv90xXfM0=;
 b=SzU5wjuUYysObEanbTenaR5XHhlIpheqsrIxY7DWhvs7TWJBJBoQKzEEfCuJ+mv591
 p1KPE1bGQn7SoN/clPiZBbNdQ9icon2jaCuGhhai9A5jIQyIeLW2XVlVZdZr/S9ciVZp
 ztVfWVBbcrhh10ejNqzFY+rURaMqsSHyOHa25+iupHepfD5h/FkhIyQvpF/ZIi2RK2LY
 FzBuVkUXW47YQzr/EzkxQAjEdmJdXVvzativXPCB/BfKXpDfEO6u4DRo5zxXx7SiwHnR
 gFYjnRlalR5QZxXfHpQKKg2346K1QQ51oyLXSMojFq07f/SX6pIFpOnHaU0HpMeriBou
 HBgQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwhO+XC7gi6BsHj/x07iaiLWslRkxdvLWQZS7uMou19QvZX7fESZQz6uqAVcsIgFvmHu0IHNvODwVeN@nongnu.org
X-Gm-Message-State: AFq9FYLUrPv+6lY7iPhGf0LMhxVOMn13znVZo/Gq1InZKDpehGQaLjMO
 W/8f4B9uXhhxUprB2/jqczvg+tdhnKP7MwQaCLhUZkd8F2mKRsDX8K4i
X-Gm-Gg: AYBFou2w+VtVvQhsTasnr+d8rrEnUpINPG/5PuKMP5Jrx+uGls2uICZsbUhuBNwhcKZ
 KjkkgZZNbg528EWBm8a2/muQU29fdIJOZWZXpy7/56jY2BBLX9b9lYuZaki0np2tslVGC/eYX9A
 7qHQ9YlBYLz9WA0p1sCMR7b7gjs5XFaQW1LYW/lpy67NCZLxX8w1UFAnrwTOrkQsdpLDVB6n9qT
 zIU1+bRljCh1Iot021pee4xXYFX86vlUq4iHRmZgWgZ8z/znDsnpUidOsAxzZw4Qdw1Ze5YPSp2
 111mgJLIIsC56RZO39feSXKqJXnX0CAwewUOaFbRIGkbc+g0qAYibW8xQkpGQh+A3Ifz5wAZkte
 c9X9JN20HW7hqzKK82YBJowTYmB78yk7lsDLOwAqzfiNDm9QP/qlICXd0t+zwBmr7r9M588RDXD
 Elx88QtQAnrWEkn5oifmizCirT5f9pTBkEA1B3ZNUBZ9J+c18RNxThdm3pBmWFtwsayUnSoX2tU
 AxmoQtdvbpwLD7SSA==
X-Received: by 2002:a05:7022:1582:b0:143:298e:913d with SMTP id
 a92af1059eb24-16a63b2edc7mr29904960c88.47.1791971134432; 
 Wed, 14 Oct 2026 02:45:34 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-169a31f6f5csm44348380c88.11.2026.10.14.02.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:45:33 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, Eric Blake <eblake@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-s390x@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 David Hildenbrand <david@kernel.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Fabiano Rosas <farosas@suse.de>,
 Song Gao <17746591750@163.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH 34/34] qdev: Handle device alias ambiguous under multi-target
 qemu
Date: Wed, 14 Oct 2026 17:41:49 +0800
Message-ID: <20261014094224.1976-19-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261014094224.1976-1-luoyonggang@gmail.com>
References: <20261014094224.1976-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

For example:

./qemu-system -device virtio-blk,help

will raise the following error:

qemu-system: -device virtio-blk,help: Device alias 'virtio-blk' is ambiguous without a selected machine
Specify -machine <arch>-<machine-name> or an unambiguous <machine-name>, or use a concrete device name:
  virtio-blk-device
  virtio-blk-pci

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/monitor/qdev.h |  7 ++++++
 system/qdev-monitor.c  | 52 ++++++++++++++++++++++++++++++++++++++----
 system/vl.c            |  7 +++---
 3 files changed, 58 insertions(+), 8 deletions(-)

diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
index 8f7e2f616cf..92dd4e35351 100644
--- a/include/monitor/qdev.h
+++ b/include/monitor/qdev.h
@@ -10,6 +10,13 @@ void hmp_info_qtree(MonitorHMP *hmp, const QDict *qdict);
 void hmp_info_qdm(MonitorHMP *hmp, const QDict *qdict);
 void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp);
 
+/**
+ * qdev_device_help: print device listing or property help when requested.
+ * @opts: device options
+ *
+ * Returns: 0 if no help was requested, 1 if handled, or -1 if an ambiguous
+ * alias prevented help. Other property-help errors retain the handled result.
+ */
 int qdev_device_help(QemuOpts *opts);
 DeviceState *qdev_device_add(QemuOpts *opts, Error **errp);
 DeviceState *qdev_device_add_from_qdict(const QDict *opts,
diff --git a/system/qdev-monitor.c b/system/qdev-monitor.c
index b3ca619f3c9..8ab19568b0d 100644
--- a/system/qdev-monitor.c
+++ b/system/qdev-monitor.c
@@ -24,6 +24,8 @@
 #include "monitor/monitor.h"
 #include "monitor/qdev.h"
 #include "qemu/base-arch-defs.h"
+#include "qemu/target-info.h"
+#include "qemu/target-info-def.h"
 #include "system/runstate.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-qdev.h"
@@ -217,10 +219,18 @@ static void qdev_print_devinfos(bool show_no_user)
     g_slist_free(list);
 }
 
-static const char *find_typename_by_alias(const char *alias)
+static const char *find_typename_by_alias(const char *alias, Error **errp)
 {
+    ERRP_GUARD();
+    bool unselected = target_combined_binary() && !target_info();
+    const char *match = NULL;
+    g_autoptr(GString) hints = NULL;
+    unsigned count = 0;
     int i;
 
+    if (unselected) {
+        hints = g_string_new(NULL);
+    }
     for (i = 0; qdev_alias_table[i].alias; i++) {
         if (qdev_alias_table[i].arch_mask &&
             !qemu_arch_available(qdev_alias_table[i].arch_mask)) {
@@ -228,11 +238,32 @@ static const char *find_typename_by_alias(const char *alias)
         }
 
         if (strcmp(qdev_alias_table[i].alias, alias) == 0) {
-            return qdev_alias_table[i].typename;
+            const char *typename = qdev_alias_table[i].typename;
+
+            if (!unselected) {
+                return typename;
+            }
+            ObjectClass *oc = module_object_class_by_name(typename);
+
+            if (!object_class_dynamic_cast(oc, TYPE_DEVICE) ||
+                object_class_is_abstract(oc)) {
+                continue;
+            }
+            match = typename;
+            count++;
+            g_string_append_printf(hints, "  %s\n", typename);
         }
     }
 
-    return NULL;
+    if (count > 1) {
+        error_setg(errp, "Device alias '%s' is ambiguous without a "
+                   "selected machine", alias);
+        error_append_hint(errp, "Specify -machine <arch>-<machine-name> or "
+                          "an unambiguous <machine-name>, or use a "
+                          "concrete device name:\n%s", hints->str);
+        return NULL;
+    }
+    return match;
 }
 
 static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
@@ -243,7 +274,13 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
 
     oc = module_object_class_by_name(*driver);
     if (!oc) {
-        const char *typename = find_typename_by_alias(*driver);
+        Error *local_err = NULL;
+        const char *typename = find_typename_by_alias(*driver, &local_err);
+
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return NULL;
+        }
 
         if (typename) {
             *driver = typename;
@@ -308,7 +345,12 @@ int qdev_device_help(QemuOpts *opts)
     }
 
     if (!object_class_by_name(driver)) {
-        const char *typename = find_typename_by_alias(driver);
+        const char *typename = find_typename_by_alias(driver, &local_err);
+
+        if (local_err) {
+            error_report_err(local_err);
+            return -1;
+        }
 
         if (typename) {
             driver = typename;
diff --git a/system/vl.c b/system/vl.c
index bad13393f24..068fa5e12ad 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -2795,9 +2795,10 @@ static void qemu_process_help_options(void)
         exit(0);
     }
 
-    if (qemu_opts_foreach(qemu_find_opts("device"),
-                          device_help_func, NULL, NULL)) {
-        exit(0);
+    int device_help = qemu_opts_foreach(qemu_find_opts("device"),
+                                      device_help_func, NULL, NULL);
+    if (device_help) {
+        exit(device_help < 0 ? EXIT_FAILURE : EXIT_SUCCESS);
     }
 
     /* -L help lists the data directories and exits. */
-- 
2.55.0.windows.3


