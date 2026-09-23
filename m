Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80399C982FA
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 13:24:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9MxL-0007aH-KN; Wed, 23 Sep 2026 09:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MtR-0001Rw-E0
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:20:14 -0400
Received: from mail-dy2-x10.google.com ([2607:f8b0:4864:36::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MtO-00078I-Kn
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:20:13 -0400
Received: by mail-dy2-x10.google.com with SMTP id
 5a478bee46e88-328664e051fso1021281eec.1
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 06:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169599; x=1790774399; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bgYFeWF3ExMdjkoIhx1M6bQ8cLDb8ZfAeE7NuNbtMe0=;
 b=Ym4CUzI8Rk+LGbQFyrIhX7w1k60kgtJ5Nmonx9WV9oMNNpm/C6pkKmOdCLGTc+ENIF
 UkfTGeHvPLla7QIOEywo8ZXE1lrE7EWVrNDkXEKkrfSPY6lS2YDWB/rNdm0lVJ4cv8qR
 tYiN4cuKX2quNR6xo60zb8Nt+zButSU7Fa3FOQmtvirRASnYAHvvdyQaSgEzltxlM3+3
 ++eBdUMYDCt4op/P5G6Iow3AZuOHjF3XGwViot3vNJ77J4QeSX0tdHnlG1O19mNNdiBR
 DiQZvRSSURMFLVomLtRqC+Qa1hNFPm2r6tln2DO/W7zz99L/+EExxHjgF/W2iD/nhGmL
 pAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169599; x=1790774399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bgYFeWF3ExMdjkoIhx1M6bQ8cLDb8ZfAeE7NuNbtMe0=;
 b=nZJs9xS4Fz3VqztG1HfobshP2VL3tXWaAr++mlBLPwlu9H3xHSDTcyF5boRUgGSgAD
 H2my9824c2Mug5nZ1qX6Ay7oTkfYWge9H5OrBzX6CPrJ9vbB/QbC+MwZaArATJpEWPVc
 ibJwGjGBfbDEKUXLI79rPfz5/wi04RbuDrew6Cp72k/rswQmu2/SJ+VCEsY83sWpxmPd
 TKsDM2g+gXqRd0GucaQALuRYV/qk6z3VWWr0rE1105yAtdHx6iB1m+fLMj+FVt8ZmvGg
 YbkMlKfL9Bryctoi96/iTP1dTZVoR1RiRtAjTsRbq1TVSnzsDgHWrKU+qm4Dlc/dhK/B
 YwxQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBz3u8qM6H1QC7X3kH6/14xpdUYMQ68lyZu/GWl3iN631YSF75yoD2CYz6rSHlzJCeiuSO9d1E7Rl0qH@nongnu.org
X-Gm-Message-State: AFuF++kH6GHvnq0ZPC0SvSxHJU77CEKGBQqIHCHNqWSMllO8YtktfN+q
 aCat5yxARsBSUmKydzMyJMlf/eMuBTrQaS43zHddKCQJMZ+MeKRraHo6
X-Gm-Gg: AYBFou3JSPeXUI1ipFt0dxH+Kzr+4Chgwp0kaTpliZBGIPcbNq8y1OKkYiYd0er5Mcv
 r3JiK5sABl+ZBQDpJXd8VpTqyU+XIgtk/hEJAdRhrkGM9inIuC6ZAsPTcIMos1aA92ojACO1Arf
 V9g85RcTgJ3kMtQ870FUliIjJIEsqtSuOyAUj4240NPV+ZO8w0Mnav7Oij624cqXYvETztLZkYB
 AerWa24xFTYb3O4Cd2IlVS0chi3fx5jfglnq1nCuG85uJP36IckFyrQARYT2YzZGynUI+R3LbWq
 OOwIdOEvmCR5wWv2DWLiiCHhwG9/TCXUjZgkKLxyJIZ0WSwgNLjJApFdJ4PF76RGN783ehV2Q+j
 RCin/vfZUG3RXiOCnhbyAo0oeoIe1upFite4F+mh05/m+nBdY1HZyBmgq06RSTIgLMqToc8KALD
 iVjSY6smGxBZw/0wNt33v1MDHwzi30UrydT4Aj12Z9bl4PdIwI7VavRetGL7BbZKVaiufrihgcF
 Z5nNTmaenBNr9eQtS2xhgvnS7eMEC4=
X-Received: by 2002:a05:7300:220d:b0:33b:f206:845 with SMTP id
 5a478bee46e88-33e8e0b4537mr4054962eec.32.1790169598799; 
 Wed, 23 Sep 2026 06:19:58 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:19:57 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, xen-devel@lists.xenproject.org,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Fabiano Rosas <farosas@suse.de>, Xianglai Li <lixianglai@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Song Gao <17746591750@163.com>, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 018/114] qom: register late types through
 module_call_init_fn
Date: Wed, 23 Sep 2026 21:14:52 +0800
Message-ID: <20260923131635.1894-19-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Display early_init, the console-vc fallback, the PPC KVM host CPU,
and unit-test types register after MODULE_INIT_QOM. Route them
through module_call_init_fn so they take the same before/init/after
path as a late DSO.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/ppc/kvm.c                      | 12 +++++++++++-
 tests/unit/check-qom-interface.c      | 12 +++++++++---
 tests/unit/check-qom-proplist.c       | 13 +++++++++----
 tests/unit/test-io-channel-websock.c  |  7 ++++++-
 tests/unit/test-io-task.c             |  7 ++++++-
 tests/unit/test-qdev-global-props.c   | 14 ++++++++++----
 tests/unit/test-qdev.c                |  8 +++++++-
 tests/unit/test-ram-discard-manager.c |  7 ++++++-
 ui/console-vc.c                       | 13 ++++++++++---
 ui/dbus.c                             |  8 +++++++-
 ui/gtk.c                              | 10 +++++++++-
 ui/spice-app.c                        |  7 ++++++-
 12 files changed, 96 insertions(+), 22 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 8e89a6c665c..a3c16850a18 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -22,6 +22,7 @@
 #include <linux/kvm.h>
 
 #include "qapi/error.h"
+#include "qemu/module.h"
 #include "qemu/error-report.h"
 #include "cpu.h"
 #include "cpu-models.h"
@@ -2706,6 +2707,13 @@ static void pseries_machine_class_fixup(ObjectClass *oc, void *opaque)
     mc->default_cpu_type = TYPE_HOST_POWERPC_CPU;
 }
 
+static TypeInfo host_cpu_type_info;
+
+static void kvm_ppc_register_host_cpu_type_qom(void)
+{
+    type_register_static(&host_cpu_type_info);
+}
+
 static int kvm_ppc_register_host_cpu_type(void)
 {
     TypeInfo type_info = {
@@ -2722,7 +2730,9 @@ static int kvm_ppc_register_host_cpu_type(void)
         return -1;
     }
     type_info.parent = object_class_get_name(OBJECT_CLASS(pvr_pcc));
-    type_register_static(&type_info);
+    host_cpu_type_info = type_info;
+    module_call_init_fn(MODULE_INIT_QOM, kvm_ppc_register_host_cpu_type_qom,
+                        &error_abort);
     /* override TCG default cpu type with 'host' cpu model */
     object_class_foreach(pseries_machine_class_fixup, TYPE_SPAPR_MACHINE,
                          false, NULL);
diff --git a/tests/unit/check-qom-interface.c b/tests/unit/check-qom-interface.c
index 86ae5f6c3b1..1da051ed98b 100644
--- a/tests/unit/check-qom-interface.c
+++ b/tests/unit/check-qom-interface.c
@@ -12,6 +12,7 @@
 #include "qemu/osdep.h"
 
 #include "qom/object.h"
+#include "qapi/error.h"
 #include "qemu/module.h"
 
 
@@ -86,14 +87,19 @@ static void interface_intermediate_test(void)
     test_interface_impl(TYPE_INTERMEDIATE_IMPL);
 }
 
+static void register_types(void)
+{
+    type_register_static(&test_if_info);
+    type_register_static(&direct_impl_info);
+    type_register_static(&intermediate_impl_info);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
     module_call_init(MODULE_INIT_QOM);
-    type_register_static(&test_if_info);
-    type_register_static(&direct_impl_info);
-    type_register_static(&intermediate_impl_info);
+    module_call_init_fn(MODULE_INIT_QOM, register_types, &error_abort);
 
     g_test_add_func("/qom/interface/direct_impl", interface_direct_test);
     g_test_add_func("/qom/interface/intermediate_impl",
diff --git a/tests/unit/check-qom-proplist.c b/tests/unit/check-qom-proplist.c
index 89de92b7d91..074a69a7fd3 100644
--- a/tests/unit/check-qom-proplist.c
+++ b/tests/unit/check-qom-proplist.c
@@ -703,15 +703,20 @@ static void test_qom_partial_path(void)
     object_unparent(cont1);
 }
 
-int main(int argc, char **argv)
+static void register_types(void)
 {
-    g_test_init(&argc, &argv, NULL);
-
-    module_call_init(MODULE_INIT_QOM);
     type_register_static(&dummy_info);
     type_register_static(&dummy_dev_info);
     type_register_static(&dummy_bus_info);
     type_register_static(&dummy_backend_info);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    module_call_init(MODULE_INIT_QOM);
+    module_call_init_fn(MODULE_INIT_QOM, register_types, &error_abort);
 
     g_test_add_func("/qom/proplist/createlist/tree",
                     test_dummy_createlist_tree);
diff --git a/tests/unit/test-io-channel-websock.c b/tests/unit/test-io-channel-websock.c
index 88da24f993d..d4a92572866 100644
--- a/tests/unit/test-io-channel-websock.c
+++ b/tests/unit/test-io-channel-websock.c
@@ -219,10 +219,15 @@ static void test_websock_stalled_write(const void *opaque)
     g_assert_true(g_str_has_prefix(reply, "HTTP/1.1 400 Bad Request\r\n"));
 }
 
+static void register_types(void)
+{
+    type_register_static(&qio_channel_stall_info);
+}
+
 int main(int argc, char **argv)
 {
     module_call_init(MODULE_INIT_QOM);
-    type_register_static(&qio_channel_stall_info);
+    module_call_init_fn(MODULE_INIT_QOM, register_types, &error_abort);
     g_test_init(&argc, &argv, NULL);
 
 #define TEST_BAD_REQUEST(name, request)                         \
diff --git a/tests/unit/test-io-task.c b/tests/unit/test-io-task.c
index b1c8ecb7abb..55c4a64f041 100644
--- a/tests/unit/test-io-task.c
+++ b/tests/unit/test-io-task.c
@@ -279,11 +279,16 @@ static void test_task_thread_failure(void)
 }
 
 
+static void register_types(void)
+{
+    type_register_static(&dummy_info);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
     module_call_init(MODULE_INIT_QOM);
-    type_register_static(&dummy_info);
+    module_call_init_fn(MODULE_INIT_QOM, register_types, &error_abort);
     g_test_add_func("/crypto/task/complete", test_task_complete);
     g_test_add_func("/crypto/task/cancel", test_task_cancel);
     g_test_add_func("/crypto/task/datafree", test_task_data_free);
diff --git a/tests/unit/test-qdev-global-props.c b/tests/unit/test-qdev-global-props.c
index 8ea362cbb90..e0aaee05d8b 100644
--- a/tests/unit/test-qdev-global-props.c
+++ b/tests/unit/test-qdev-global-props.c
@@ -27,6 +27,7 @@
 #include "hw/core/qdev-properties.h"
 #include "qom/object.h"
 #include "qapi/error.h"
+#include "qemu/module.h"
 #include "qapi/visitor.h"
 
 
@@ -302,17 +303,22 @@ static void test_subclass_global_props(void)
     g_assert_cmpuint(mt->prop2, ==, 104);
 }
 
-int main(int argc, char **argv)
+static void register_types(void)
 {
-    g_test_init(&argc, &argv, NULL);
-
-    module_call_init(MODULE_INIT_QOM);
     type_register_static(&static_prop_type);
     type_register_static(&subclass_type);
     type_register_static(&dynamic_prop_type);
     type_register_static(&hotplug_type);
     type_register_static(&nohotplug_type);
     type_register_static(&nondevice_type);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    module_call_init(MODULE_INIT_QOM);
+    module_call_init_fn(MODULE_INIT_QOM, register_types, &error_abort);
 
     test_init_machine();
 
diff --git a/tests/unit/test-qdev.c b/tests/unit/test-qdev.c
index 77c3eee7171..5755fa57b58 100644
--- a/tests/unit/test-qdev.c
+++ b/tests/unit/test-qdev.c
@@ -2,6 +2,7 @@
 #include "hw/core/qdev-properties.h"
 #include "qom/object.h"
 #include "qapi/error.h"
+#include "qemu/module.h"
 #include "qapi/visitor.h"
 
 
@@ -89,12 +90,17 @@ static void test_qdev_double_realization(void)
 }
 
 
+static void register_types(void)
+{
+    type_register_static(&my_dev_type_info);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
     module_call_init(MODULE_INIT_QOM);
-    type_register_static(&my_dev_type_info);
+    module_call_init_fn(MODULE_INIT_QOM, register_types, &error_abort);
     test_init_machine();
 
     g_test_add_func("/qdev/free-properties",
diff --git a/tests/unit/test-ram-discard-manager.c b/tests/unit/test-ram-discard-manager.c
index 3d39a1e94ba..5bdcf9b074c 100644
--- a/tests/unit/test-ram-discard-manager.c
+++ b/tests/unit/test-ram-discard-manager.c
@@ -1187,12 +1187,17 @@ static void test_replay_discarded(void)
     test_teardown();
 }
 
+static void register_types(void)
+{
+    type_register_static(&test_rds_info);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
     module_call_init(MODULE_INIT_QOM);
-    type_register_static(&test_rds_info);
+    module_call_init_fn(MODULE_INIT_QOM, register_types, &error_abort);
 
     g_test_add_func("/ram-discard-manager/single-source/basic",
                     test_single_source_basic);
diff --git a/ui/console-vc.c b/ui/console-vc.c
index 53d9e9d39b3..c998a0dd807 100644
--- a/ui/console-vc.c
+++ b/ui/console-vc.c
@@ -6,6 +6,7 @@
 
 #include "chardev/char.h"
 #include "qapi/error.h"
+#include "qemu/module.h"
 #include "qemu/option.h"
 #include "qemu/queue.h"
 #include "qom/compat-properties.h"
@@ -349,10 +350,16 @@ static const TypeInfo char_vc_type_info = {
     .class_init = char_vc_class_init,
 };
 
+static void register_default_char_vc(void)
+{
+    type_register_static(&char_vc_type_info);
+}
+
 void qemu_console_early_init(void)
 {
-    /* set the default vc driver */
-    if (!object_class_by_name(TYPE_CHARDEV_VC)) {
-        type_register_static(&char_vc_type_info);
+    /* set the default vc driver if a display backend did not */
+    if (object_class_by_name(TYPE_CHARDEV_VC)) {
+        return;
     }
+    module_call_init_fn(MODULE_INIT_QOM, register_default_char_vc, &error_abort);
 }
diff --git a/ui/dbus.c b/ui/dbus.c
index 7be0f8e2611..34b33bb9ca1 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -38,6 +38,7 @@
 #include "qemu/audio.h"
 #include "audio/audio_int.h" /* FIXME: use QOM dynamic cast instead of drv->name */
 #include "qapi/error.h"
+#include "qemu/module.h"
 #include "trace.h"
 
 #include "dbus.h"
@@ -623,6 +624,11 @@ static const TypeInfo dbus_vc_type_info = {
     .class_init = dbus_vc_class_init,
 };
 
+static void register_dbus_char_vc(void)
+{
+    type_register_static(&dbus_vc_type_info);
+}
+
 static void
 early_dbus_init(DisplayOptions *opts)
 {
@@ -638,7 +644,7 @@ early_dbus_init(DisplayOptions *opts)
 
     using_dbus_display = 1;
 
-    type_register_static(&dbus_vc_type_info);
+    module_call_init_fn(MODULE_INIT_QOM, register_dbus_char_vc, &error_abort);
 }
 
 static void
diff --git a/ui/gtk.c b/ui/gtk.c
index ed7ffc06b15..2ddc1f8a901 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -38,6 +38,7 @@
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
+#include "qemu/module.h"
 #include "qemu-main.h"
 
 #include "ui/console.h"
@@ -2893,6 +2894,13 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
     qemu_main = NULL;
 }
 
+#if defined(CONFIG_VTE)
+static void register_gtk_char_vc(void)
+{
+    type_register_static(&char_gd_vc_type_info);
+}
+#endif
+
 static void early_gtk_display_init(DisplayOptions *opts)
 {
     /* The QEMU code relies on the assumption that it's always run in
@@ -2946,7 +2954,7 @@ static void early_gtk_display_init(DisplayOptions *opts)
     keycode_map = gd_get_keymap(&keycode_maplen, &keycode_xorgevdev);
 
 #if defined(CONFIG_VTE)
-    type_register_static(&char_gd_vc_type_info);
+    module_call_init_fn(MODULE_INIT_QOM, register_gtk_char_vc, &error_abort);
 #endif
 }
 
diff --git a/ui/spice-app.c b/ui/spice-app.c
index fe3df62bfa5..dae3415ec8d 100644
--- a/ui/spice-app.c
+++ b/ui/spice-app.c
@@ -132,6 +132,11 @@ static void spice_app_cleanup(void)
     g_clear_pointer(&app_dir, g_free);
 }
 
+static void register_spice_char_vc(void)
+{
+    type_register_static(&char_vc_type_info);
+}
+
 static void spice_app_display_early_init(DisplayOptions *opts)
 {
     QemuOpts *qopts;
@@ -170,7 +175,7 @@ static void spice_app_display_early_init(DisplayOptions *opts)
         exit(1);
     }
 
-    type_register_static(&char_vc_type_info);
+    module_call_init_fn(MODULE_INIT_QOM, register_spice_char_vc, &error_abort);
 
     sock_path = g_strjoin("", app_dir, "/", "spice.sock", NULL);
     qopts = qemu_opts_create(list, NULL, 0, &error_abort);
-- 
2.52.0.windows.1


