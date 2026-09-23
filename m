Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB318C9830C
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 13:30:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9Mxm-0000e5-VW; Wed, 23 Sep 2026 09:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MtT-0001Z0-Gq
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:20:15 -0400
Received: from mail-dl2-x2b.google.com ([2607:f8b0:4864:38::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MtP-0007AP-19
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:20:15 -0400
Received: by mail-dl2-x2b.google.com with SMTP id
 a92af1059eb24-1438cb9b3a3so940070c88.2
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 06:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169609; x=1790774409; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=R0NEODEUKGZurnafAxCJE2mvY+onJpkfc8axTrsuyg4=;
 b=N4PgMxnHCgixIYJ1dOhVrAeLsx8E4uF1+xPqxwkY/8p5VhxuBqCjOqEhIzKseDSep6
 gaSzfu0ecTfbzVILJD4ZnfD+5vJBd7/wQDmfFrG5nKrlqB6+cuBtRWTvdvxM0sgCsOiM
 6eSMnz3chuHJAH0seal+HhqONwinWbZSVDn280OnLVXWQoIDgQIsRvFVc0W1RjU8wNFH
 royAG8Cvwks901A6hQoLjfVLn0C1K0Vs3/eLmEkJFdL9DT61YldOYHx5YWp9evQN0L8F
 bv/GEEomE/YMTzX2EPOqUVZUIaIFtyp6DLvwLy+eh1IG9OFJWt90j9Yv5rbagSMmECOh
 Ye5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169609; x=1790774409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=R0NEODEUKGZurnafAxCJE2mvY+onJpkfc8axTrsuyg4=;
 b=dYVtjUaNnHqiPM6huUJfHL11teF0hi4u2MOESMT4OwIYNKdET+axAQV032bqSMYBUt
 lixN54fzWMi0uKNNXMtvDYBSZO9g2jBj5/YlhBmF4e/YpSRFr3lMkGSdDwj8CiiHtZeH
 ik11QIvI6edHC9iit2KWw65EEFlxZqMDfdMbI256ESNcMTxN9DGhXNwfejLIKps5+UhQ
 ejY1jf+WMb6guSQHZ2JRaC2NvXNQlKLUUT7dNy1lZeVUO21MSheU8tdQsoZE0OKx5f+4
 J0nRtb9jP8SYaX+Gpsm2ABuKBPiIFp7XveiRn8CMSZuGelSBwldRHcXa2Q2eNUeaD5qw
 yUig==
X-Forwarded-Encrypted: i=1;
 AKwUvBxLnkH2L3xWAMSye0z6/5LgW3rPfbbSt/icWBJHqXYcYrYSjQEy0Iofh/6JD6I3UY03vWcX9AxhKN9A@nongnu.org
X-Gm-Message-State: AFuF++mSCrJ3NowpQXalmWtwcc/wdUeaOBRfVTTvv+zBg4WYv55v9YX8
 TwFpVcGHixrnrfqBFy5or69ciAHojKHebe1o7q0BeP73scDc+PbK69Sv
X-Gm-Gg: AYBFou3yrVxTgV4h5nfMwP/291lESZuY0q64jRJ9M04WKMbcazllqwJJitExjZhcIKC
 4RANKg6RCawFXpEhLwi1L1Wx8bMK9kLQmPdne+Bu+f4L+uGyXRrv/B82ioBfoAIW3vv9bui3e1l
 NAu3vwYexZX4ERMen0B+7vVX0vwWRxJNxum+YsKunNen43mG+lQh6b+wWWVFh4o347RFeFUvsEY
 35NLyb4RKCJYsMMhQAOpXX9HrddGBawHiw2iparEzfkVGDyjUO0a8UhknEXRpLqobOluCcB9iZI
 RNtRHqq1VL5VxWPiOSRTF/kplccpwh3fvpJgz+5Q0nzSoNNCnj0GW11RUKoboYbptl8Sqy930dX
 s3aPnksKFFXJRo5mFtTeQd/vZ6+17oXc3RzQGScke64+PJrw2BluxLp5yTiK2h8dFU2LBWDvciC
 eUF34jbms9YX68NxApMFMk+MV9trTUoGuHmphugoATNgBeKoTOwPrnnRrSizxYMlcRQTLlVekun
 n27Zmvh89cINMdbSxmHkbkWwXe+uh0=
X-Received: by 2002:a05:693c:60cd:b0:33b:e306:2e27 with SMTP id
 5a478bee46e88-33ea3eb055bmr2839410eec.5.1790169609054; 
 Wed, 23 Sep 2026 06:20:09 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:20:06 -0700 (PDT)
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
Subject: [PATCH v3 019/114] qom: inherit is_available and filter after
 MODULE_INIT_QOM
Date: Wed, 23 Sep 2026 21:14:53 +0800
Message-ID: <20260923131635.1894-20-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::2b;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x2b.google.com
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

Parents are not all registered at type_register time, so a type
cannot inherit is_available then.

After MODULE_INIT_QOM, and after a late DSO, inherit the callback
from the parent, drop types that fail target_info(), and report a
missing parent. Skip that filter for MODULE_INIT_PHASE_DSO_BEFORE.
The inherit walk colors each type once, so it is O(N) in the number
of types. TYPE_INTERFACE and TYPE_OBJECT use target_is_any().
type_register_static aborts if it runs outside the QOM before/after
hooks.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/target-info.h |   9 +++
 qom/object.c               | 134 +++++++++++++++++++++++++++++++++++--
 target-info.c              |   6 ++
 3 files changed, 145 insertions(+), 4 deletions(-)

diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index 440da63e6cf..790fc74e9d3 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -53,6 +53,15 @@ const char *target_cpu_type(void);
  */
 bool target_big_endian(void);
 
+/**
+ * target_is_any:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns true for every TargetInfo. Usable as TypeInfo.is_available
+ * for types that are not target-scoped (TYPE_OBJECT).
+ */
+bool target_is_any(const TargetInfo *ti);
+
 /**
  * target_is_base_arm:
  * @ti: TargetInfo to inspect
diff --git a/qom/object.c b/qom/object.c
index a3e75927e82..d0f9242ac99 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -14,6 +14,7 @@
 #include "qapi/error.h"
 #include "qom/compat-properties.h"
 #include "qom/object.h"
+#include "qemu/module.h"
 #include "qom/object_interfaces.h"
 #include "qemu/target-info-qapi.h"
 #include "qemu/cutils.h"
@@ -40,6 +41,7 @@
 #include "qobject/qnum.h"
 #include "qobject/qstring.h"
 #include "qemu/error-report.h"
+#include "qemu/queue.h"
 
 #define MAX_INTERFACES 32
 
@@ -81,11 +83,16 @@ struct TypeImpl
 
     int num_interfaces;
     InterfaceImpl interfaces[MAX_INTERFACES];
+
+    QTAILQ_ENTRY(TypeImpl) register_node;
 };
 
 static Type type_interface;
 
 static GHashTable *type_table;
+static QTAILQ_HEAD(, TypeImpl) type_register_list =
+    QTAILQ_HEAD_INITIALIZER(type_register_list);
+static bool type_qom_registering;
 
 static bool enumerating_types;
 
@@ -95,6 +102,21 @@ static void type_table_add(TypeImpl *ti)
     g_hash_table_insert(type_table, (void *)ti->name, ti);
 }
 
+static void type_table_remove(TypeImpl *ti)
+{
+    int i;
+
+    assert(!enumerating_types);
+    g_hash_table_remove(type_table, (void *)ti->name);
+    QTAILQ_REMOVE(&type_register_list, ti, register_node);
+    g_free((char *)ti->name);
+    g_free((char *)ti->parent);
+    for (i = 0; i < ti->num_interfaces; i++) {
+        g_free((char *)ti->interfaces[i].typename);
+    }
+    g_free(ti);
+}
+
 static TypeImpl *type_table_lookup(const char *name)
 {
     return g_hash_table_lookup(type_table, name);
@@ -171,18 +193,20 @@ static TypeImpl *type_register_internal(const TypeInfo *info)
         abort();
     }
 
-    if (info->is_available && !info->is_available(target_info())) {
-        return NULL;
-    }
-
     ti = type_new(info);
 
     type_table_add(ti);
+    QTAILQ_INSERT_TAIL(&type_register_list, ti, register_node);
     return ti;
 }
 
 TypeImpl *type_register_static(const TypeInfo *info)
 {
+    if (!type_qom_registering) {
+        fprintf(stderr, "Registering '%s' outside QOM before/after\n",
+                info->name);
+        abort();
+    }
     assert(info->parent);
     return type_register_internal(info);
 }
@@ -316,6 +340,8 @@ static void type_initialize_interface(TypeImpl *ti, TypeImpl *interface_type,
 
     iface_impl = type_new(&info);
     iface_impl->parent_type = parent_type;
+    g_assert(interface_type->is_available);
+    iface_impl->is_available = interface_type->is_available;
     type_initialize(iface_impl);
     g_free((char *)info.name);
 
@@ -1159,6 +1185,7 @@ bool object_class_is_secure(ObjectClass *klass)
 
 TypeIsAvailable *object_class_get_is_available(ObjectClass *klass)
 {
+    g_assert(klass->type->is_available);
     return klass->type->is_available;
 }
 
@@ -3297,12 +3324,109 @@ static void object_class_init(ObjectClass *klass, const void *data)
                                   NULL);
 }
 
+static bool type_qom_before(ModuleInitPhase phase, Error **errp)
+{
+    (void)errp;
+    (void)phase;
+
+    type_qom_registering = true;
+    return true;
+}
+
+enum TypeVisitColor {
+    TYPE_VISIT_GRAY = 1,
+    TYPE_VISIT_BLACK,
+};
+
+static bool type_update_is_available(TypeImpl *type, GHashTable *visit,
+                                     Error **errp)
+{
+    TypeImpl *parent;
+    gpointer color;
+
+    color = g_hash_table_lookup(visit, type);
+    if (color == GINT_TO_POINTER(TYPE_VISIT_BLACK)) {
+        return true;
+    }
+    if (color == GINT_TO_POINTER(TYPE_VISIT_GRAY)) {
+        error_setg(errp, "Type '%s' has a cyclic parent chain",
+                   type->name);
+        return false;
+    }
+
+    g_hash_table_insert(visit, type, GINT_TO_POINTER(TYPE_VISIT_GRAY));
+
+    parent = type_get_parent(type);
+    if (!parent) {
+        if (strcmp(type->name, TYPE_OBJECT) != 0 &&
+            strcmp(type->name, TYPE_INTERFACE) != 0) {
+            error_setg(errp,
+                       "Type '%s' does not inherit from %s or %s",
+                       type->name, TYPE_OBJECT, TYPE_INTERFACE);
+            return false;
+        }
+    } else {
+        if (!type_update_is_available(parent, visit, errp)) {
+            return false;
+        }
+        if (!type->is_available) {
+            type->is_available = parent->is_available;
+        }
+    }
+
+    g_hash_table_insert(visit, type, GINT_TO_POINTER(TYPE_VISIT_BLACK));
+    return true;
+}
+
+static bool type_qom_after(ModuleInitPhase phase, Error **errp)
+{
+    TypeImpl *type, *next;
+    GHashTable *visit;
+    Error *local_err = NULL;
+
+    type_qom_registering = false;
+    if (phase == MODULE_INIT_PHASE_DSO_BEFORE) {
+        return true;
+    }
+
+    visit = g_hash_table_new(NULL, NULL);
+    QTAILQ_FOREACH(type, &type_register_list, register_node) {
+        if (!type_update_is_available(type, visit, &local_err)) {
+            break;
+        }
+    }
+    g_hash_table_destroy(visit);
+
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return false;
+    }
+
+    QTAILQ_FOREACH_SAFE(type, &type_register_list, register_node, next) {
+        g_assert(type->is_available);
+        if (!type->is_available(target_info())) {
+            type_table_remove(type);
+        }
+    }
+
+    QTAILQ_FOREACH(type, &type_register_list, register_node) {
+        if (type->parent && !type_table_lookup(type->parent)) {
+            error_setg(errp, "Type '%s' is missing its parent '%s'",
+                       type->name, type->parent);
+            return false;
+        }
+    }
+
+    return true;
+}
+
 static void __attribute__((constructor)) register_types(void)
 {
     static const TypeInfo interface_info = {
         .name = TYPE_INTERFACE,
         .class_size = sizeof(InterfaceClass),
         .abstract = true,
+        .is_available = target_is_any,
     };
 
     static const TypeInfo object_info = {
@@ -3310,9 +3434,11 @@ static void __attribute__((constructor)) register_types(void)
         .instance_size = sizeof(Object),
         .class_init = object_class_init,
         .abstract = true,
+        .is_available = target_is_any,
     };
 
     type_table = g_hash_table_new(g_str_hash, g_str_equal);
     type_interface = type_register_internal(&interface_info);
     type_register_internal(&object_info);
+    register_module_hooks(MODULE_INIT_QOM, type_qom_before, type_qom_after);
 }
diff --git a/target-info.c b/target-info.c
index 36f75ece36f..a9ab4b465d3 100644
--- a/target-info.c
+++ b/target-info.c
@@ -96,6 +96,12 @@ bool target_big_endian(void)
     return target_endian_mode() == ENDIAN_MODE_BIG;
 }
 
+bool target_is_any(const TargetInfo *ti)
+{
+    (void)ti;
+    return true;
+}
+
 bool target_is_base_arm(const TargetInfo *ti)
 {
     switch (ti->target_arch) {
-- 
2.52.0.windows.1


