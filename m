Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC30C9830C
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 13:24:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9Mxg-0008R6-CY; Wed, 23 Sep 2026 09:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mt5-00014W-JJ
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:19:58 -0400
Received: from mail-dy2-x10.google.com ([2607:f8b0:4864:36::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mt3-00075k-FQ
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:19:51 -0400
Received: by mail-dy2-x10.google.com with SMTP id
 5a478bee46e88-33bf5a1c4d9so899838eec.3
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 06:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169578; x=1790774378; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XCBFYSF9Q0sqUJeK2F1X4ZcpeRW05ELn0GxDHlBCHlc=;
 b=IBM8417DKQrBTYbwPgGeSdTjNk2cOenj8tNLbw+vjTgdrQZSkqGef6e3IbjXIcHyBD
 X1GzuCiHnwBqTV9CR1t92PzPBmJzgJB8m7JFsF2rQKhTVqjdKY6Rw1q6gdMVnXUnHtGr
 G5Q8SLgAfz0axb1nIwzRP0WftkUJJYtSL1z2JkXmNS3yxLB4pWCWGtYu8P+8NipymnN7
 4+prPsCSuL5mKZoNOXTeBBLGKtRJItMSQEWcb2EZZpnh5nFau4nJucXhroR46rMJUnX4
 MfLZKJhemzoedX9JKil+EEX6onhbW0e1KwjJmkaSB+LTCLR9fUdjHsCEah9pnjEFsICC
 te+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169578; x=1790774378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XCBFYSF9Q0sqUJeK2F1X4ZcpeRW05ELn0GxDHlBCHlc=;
 b=zor0kNAQJvZ4vr0qL/PQy3fgHk62F8hbP6K4YClQChmKASjpHcTRfNF6GQFjmViNdc
 0R+ysgOiQoPJSRd3q8LvzQnd+O+J+Bl3W4qU1Ps/Lh+MaUdPpgATWN06i+oLbzIPWu1P
 oeQSGR/QgLt7u5TRYTn4U4f7I3faeWuqVIY6J7n12xZHcDRBYQmxqf4fPwikCAD1Kxj1
 +pIsEH2XJ/PaoIbz3lkU47cA4T7rXKiAOoasKLs59jqrtvystNEXdEtOWUCpMh102i6O
 uSip9BmNLt1bn8dQwUm6GD3oYwPiqhPmXAV6FUDS2XVwgD9iSp8HHbil1eHCid+HrXmv
 Snig==
X-Forwarded-Encrypted: i=1;
 AKwUvBw3v9/0gmO88YajVBS3yds/L1G3kHP5AKsyJhYLxc2uIt80RgyzWGtKZzdo6oNTkcICvTEq4iV/OOWX@nongnu.org
X-Gm-Message-State: AFuF++lYiNQRbUP+wa3lYcwbvVjOChMQsIFAFIx/7lqVmRRQjsDmb3TU
 J9qNKSGbX6mj5ia0bml2Mn/tknsTGv8vZvzkyvfPy4yHhM7Dkro6hVQP
X-Gm-Gg: AYBFou2J9JbRhpm8QLs5w67TP1KQIKdu8FVfPQr0xcMMKvO7g5mPxDpn0ed3HmNV+8X
 5hDU5UeossjNtAw5mQC/ouncpJE5kmjhTiMHu7modYtHD/iByh1scPWrgJaHWPKyz2z2q/FOnAl
 z6QslfB/H8sJSKEqe3D8GLcQeE77mIEz4uyPreUb2z9EWIhVg/23QIApc/Bytou0Bq/YansNGLk
 OVSGA9SeZ1HtsIcVzZtngwLdvpRmOvXudLjcs6T48NopIC9trANf73Wxb1kP1HQKRTpX+QoP8HD
 VtqvqJydc1SvexDKqH3zhttLTmeWkk61gLjoclT2oLfoG0e6/0BWMfX8YmVVKzHZOy0fMH0g4gn
 jOBeqRbpMaP4MNIYgnw9rU8xPLQtTF6sKSboVdHqvVOmzpeByHHXEfjF24yaDF59hm39x1OyZ0x
 Ob5rD7NnFlKJ+8XGebHcOwDBocK975WXzlCN37ZZHgoP5/s9AQbfnBO1uWtx8Pk//Fpou8R2FUb
 haIJhxi3PMrKmp7bo8EGzrs5/ncRQi4zcorqgaszg==
X-Received: by 2002:a05:693c:41c1:10b0:33e:84c3:a05b with SMTP id
 5a478bee46e88-33e8ddc79bcmr2415216eec.30.1790169577497; 
 Wed, 23 Sep 2026 06:19:37 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:19:33 -0700 (PDT)
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
Subject: [PATCH v3 016/114] module: use static ModuleEntry and per-type DSO
 lists
Date: Wed, 23 Sep 2026 21:14:50 +0800
Message-ID: <20260923131635.1894-17-luoyonggang@gmail.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

register_module_init malloc'd a ModuleEntry and a late DSO ran
from one shared list. Store each module_init in a static
ModuleEntry and keep a dso_list per init type. Concatenate a late
DSO onto the builtin list when that type is not done yet,
otherwise run it immediately.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/module.h   |  22 ++++++--
 include/qemu/queue.h    |  10 ++++
 rust/util/src/module.rs |  16 ++++--
 util/module.c           | 109 ++++++++++++++++++++++------------------
 4 files changed, 98 insertions(+), 59 deletions(-)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index 9885ac9afb3..34e05c75348 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -14,6 +14,7 @@
 #ifndef QEMU_MODULE_H
 #define QEMU_MODULE_H
 
+#include "qemu/queue.h"
 
 #define DSO_STAMP_FUN         glue(qemu_stamp, CONFIG_STAMP)
 #define DSO_STAMP_FUN_STR     stringify(DSO_STAMP_FUN)
@@ -26,16 +27,22 @@ void DSO_STAMP_FUN(void);
 void qemu_module_dummy(void);
 
 #define module_init(function, type)                                         \
+static ModuleEntry glue(qemu_module_entry_, function) = {                   \
+    .init = function,                                                       \
+};                                                                          \
 static void __attribute__((constructor)) do_qemu_init_ ## function(void)    \
 {                                                                           \
-    register_dso_module_init(function, type);                               \
+    register_dso_module_init(&glue(qemu_module_entry_, function), type);    \
 }
 #else
 /* This should not be used directly.  Use block_init etc. instead.  */
 #define module_init(function, type)                                         \
+static ModuleEntry glue(qemu_module_entry_, function) = {                   \
+    .init = function,                                                       \
+};                                                                          \
 static void __attribute__((constructor)) do_qemu_init_ ## function(void)    \
 {                                                                           \
-    register_module_init(function, type);                                   \
+    register_module_init(&glue(qemu_module_entry_, function), type);        \
 }
 #endif
 
@@ -51,6 +58,13 @@ typedef enum {
     MODULE_INIT_MAX
 } module_init_type;
 
+typedef void (ModuleInitFn)(void);
+
+typedef struct ModuleEntry {
+    ModuleInitFn *init;
+    QTAILQ_ENTRY(ModuleEntry) node;
+} ModuleEntry;
+
 #define block_init(function) module_init(function, MODULE_INIT_BLOCK)
 #define opts_init(function) module_init(function, MODULE_INIT_OPTS)
 #define type_init(function) module_init(function, MODULE_INIT_QOM)
@@ -64,8 +78,8 @@ typedef enum {
 #define block_module_load(lib, errp) module_load("block-", lib, errp)
 #define ui_module_load(lib, errp) module_load("ui-", lib, errp)
 
-void register_module_init(void (*fn)(void), module_init_type type);
-void register_dso_module_init(void (*fn)(void), module_init_type type);
+void register_module_init(ModuleEntry *e, module_init_type type);
+void register_dso_module_init(ModuleEntry *e, module_init_type type);
 
 void module_call_init(module_init_type type);
 
diff --git a/include/qemu/queue.h b/include/qemu/queue.h
index e029e7bf669..06ebe8b1dfc 100644
--- a/include/qemu/queue.h
+++ b/include/qemu/queue.h
@@ -470,6 +470,16 @@ union {                                                                 \
         (left)->field.tqe_circ.tql_prev->tql_next = (right)->field.tqe_next; \
     } while (/*CONSTCOND*/0)
 
+#define QTAILQ_CONCAT(head1, head2, field) do {                         \
+        if (!QTAILQ_EMPTY(head2)) {                                     \
+            (head1)->tqh_circ.tql_prev->tql_next = (head2)->tqh_first;  \
+            (head2)->tqh_first->field.tqe_circ.tql_prev =               \
+                (head1)->tqh_circ.tql_prev;                             \
+            (head1)->tqh_circ.tql_prev = (head2)->tqh_circ.tql_prev;    \
+            QTAILQ_INIT(head2);                                         \
+        }                                                               \
+} while (/*CONSTCOND*/0)
+
 #define QTAILQ_FOREACH(var, head, field)                                \
         for ((var) = ((head)->tqh_first);                               \
                 (var);                                                  \
diff --git a/rust/util/src/module.rs b/rust/util/src/module.rs
index 06c45fc142b..45d8b67d6dc 100644
--- a/rust/util/src/module.rs
+++ b/rust/util/src/module.rs
@@ -8,6 +8,16 @@
 macro_rules! module_init {
     ($type:ident => $body:block) => {
         const _: () = {
+            extern "C" fn init_fn() {
+                $body
+            }
+
+            static mut ENTRY: $crate::bindings::ModuleEntry =
+                $crate::bindings::ModuleEntry {
+                    init: Some(init_fn),
+                    ..unsafe { ::core::mem::zeroed() }
+                };
+
             #[used]
             #[cfg_attr(
                 not(any(target_vendor = "apple", target_os = "windows")),
@@ -16,14 +26,10 @@ macro_rules! module_init {
             #[cfg_attr(target_vendor = "apple", link_section = "__DATA,__mod_init_func")]
             #[cfg_attr(target_os = "windows", link_section = ".CRT$XCU")]
             pub static LOAD_MODULE: extern "C" fn() = {
-                extern "C" fn init_fn() {
-                    $body
-                }
-
                 extern "C" fn ctor_fn() {
                     unsafe {
                         $crate::bindings::register_module_init(
-                            Some(init_fn),
+                            ::core::ptr::addr_of_mut!(ENTRY),
                             $crate::bindings::module_init_type::$type,
                         );
                     }
diff --git a/util/module.c b/util/module.c
index 8f8e6994f11..6c5980542f6 100644
--- a/util/module.c
+++ b/util/module.c
@@ -27,19 +27,26 @@
 #endif
 #include "trace.h"
 
-typedef struct ModuleEntry
+typedef QTAILQ_HEAD(, ModuleEntry) ModuleEntryList;
+
+typedef struct ModuleInit
 {
-    void (*init)(void);
-    QTAILQ_ENTRY(ModuleEntry) node;
     module_init_type type;
-} ModuleEntry;
+    ModuleEntryList list;
+    ModuleEntryList dso_list;
+    bool done;
+} ModuleInit;
 
-typedef QTAILQ_HEAD(, ModuleEntry) ModuleTypeList;
+static ModuleInit module_inits[MODULE_INIT_MAX];
 
-static ModuleTypeList init_type_list[MODULE_INIT_MAX];
-static bool modules_init_done[MODULE_INIT_MAX];
+static void empty_dso_lists(void)
+{
+    int i;
 
-static ModuleTypeList dso_init_list;
+    for (i = 0; i < MODULE_INIT_MAX; i++) {
+        QTAILQ_INIT(&module_inits[i].dso_list);
+    }
+}
 
 static void init_lists(void)
 {
@@ -51,65 +58,56 @@ static void init_lists(void)
     }
 
     for (i = 0; i < MODULE_INIT_MAX; i++) {
-        QTAILQ_INIT(&init_type_list[i]);
+        module_inits[i].type = i;
+        QTAILQ_INIT(&module_inits[i].list);
     }
-
-    QTAILQ_INIT(&dso_init_list);
+    empty_dso_lists();
 
     inited = 1;
 }
 
-
-static ModuleTypeList *find_type(module_init_type type)
+static ModuleInit *find_type(module_init_type type)
 {
     init_lists();
 
-    return &init_type_list[type];
+    return &module_inits[type];
 }
 
-void register_module_init(void (*fn)(void), module_init_type type)
+static void module_init_add(ModuleEntryList *list, ModuleEntry *e)
 {
-    ModuleEntry *e;
-    ModuleTypeList *l;
-
-    e = g_malloc0(sizeof(*e));
-    e->init = fn;
-    e->type = type;
+    QTAILQ_INSERT_TAIL(list, e, node);
+}
 
-    l = find_type(type);
+void register_module_init(ModuleEntry *e, module_init_type type)
+{
+    module_init_add(&find_type(type)->list, e);
+}
 
-    QTAILQ_INSERT_TAIL(l, e, node);
+void register_dso_module_init(ModuleEntry *e, module_init_type type)
+{
+    module_init_add(&find_type(type)->dso_list, e);
 }
 
-void register_dso_module_init(void (*fn)(void), module_init_type type)
+static void module_init_run(ModuleInit *m, ModuleEntryList *list)
 {
     ModuleEntry *e;
 
-    init_lists();
-
-    e = g_malloc0(sizeof(*e));
-    e->init = fn;
-    e->type = type;
-
-    QTAILQ_INSERT_TAIL(&dso_init_list, e, node);
+    (void)m;
+    QTAILQ_FOREACH(e, list, node) {
+        e->init();
+    }
 }
 
 void module_call_init(module_init_type type)
 {
-    ModuleTypeList *l;
-    ModuleEntry *e;
+    ModuleInit *m = find_type(type);
 
-    if (modules_init_done[type]) {
+    if (m->done) {
         return;
     }
 
-    l = find_type(type);
-
-    QTAILQ_FOREACH(e, l, node) {
-        e->init();
-    }
-
-    modules_init_done[type] = true;
+    module_init_run(m, &m->list);
+    m->done = true;
 }
 
 #ifdef CONFIG_MODULES
@@ -159,10 +157,13 @@ static bool module_load_dso(const char *fname, bool export_symbols,
 {
     GModule *g_module;
     void (*sym)(void);
-    ModuleEntry *e, *next;
+    int i;
     int flags;
 
-    assert(QTAILQ_EMPTY(&dso_init_list));
+    init_lists();
+    for (i = 0; i < MODULE_INIT_MAX; i++) {
+        assert(QTAILQ_EMPTY(&module_inits[i].dso_list));
+    }
 
     flags = 0;
     if (!export_symbols) {
@@ -183,19 +184,27 @@ static bool module_load_dso(const char *fname, bool export_symbols,
             error_append_hint(errp,
                 "Only modules from the same build can be loaded.\n");
         }
+        empty_dso_lists();
         g_module_close(g_module);
         return false;
     }
 
-    QTAILQ_FOREACH(e, &dso_init_list, node) {
-        e->init();
-        register_module_init(e->init, e->type);
+    for (i = 0; i < MODULE_INIT_MAX; i++) {
+        ModuleInit *m = &module_inits[i];
+
+        if (QTAILQ_EMPTY(&m->dso_list)) {
+            continue;
+        }
+
+        if (!m->done) {
+            QTAILQ_CONCAT(&m->list, &m->dso_list, node);
+            continue;
+        }
+
+        module_init_run(m, &m->dso_list);
     }
     trace_module_load_module(fname);
-    QTAILQ_FOREACH_SAFE(e, &dso_init_list, node, next) {
-        QTAILQ_REMOVE(&dso_init_list, e, node);
-        g_free(e);
-    }
+    empty_dso_lists();
     return true;
 }
 
-- 
2.52.0.windows.1


