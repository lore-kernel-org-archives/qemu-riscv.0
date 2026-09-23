Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B4AC9830B
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 13:21:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9Muf-0002WO-Tc; Wed, 23 Sep 2026 09:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mrj-0000P1-2g
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:18:37 -0400
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mrf-0006v2-VR
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:18:26 -0400
Received: by mail-dl2-x0f.google.com with SMTP id
 a92af1059eb24-142dd04edb5so1431132c88.2
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 06:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169502; x=1790774302; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yqkLIHs8nht5THiWcj2P453LN93rHp/TnF9wI3rp1V4=;
 b=ommQnWUpcJDJiR6l56NFITObmh5aqsyWTpAQWWfZNH27p6HUD8qgpznivXTzyx9lqk
 EFbc4tLbMLO38106wDCoL6vOal81n1W6H2FVtoqPClYWDBapKYF0a+/mwyPMmGMISrPw
 3eDvVe+MI2qd6Wo93eeaEWOhEBzvL5txi/CBUIQlrPb0NTERCvO0qOLoDugfUypundg2
 0sWYqXPpK3Kym9EH3JH1O3Dy3CszziYo3SUb9c6b/viUKwu5AMo1/6RNDEkqCULYGifr
 zoJyezPxpk374r54k7v30s2MOZBqJwuEaBGeotlaVs4jY9vmsdLlvz+uwiCTVUAEToqi
 1btA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169502; x=1790774302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yqkLIHs8nht5THiWcj2P453LN93rHp/TnF9wI3rp1V4=;
 b=kmQjyw6oXCRUl/G5JF1XS77jUEumsfm1dPEd8ZnpsHPY6pui+AqG6836S2FDcEbFaD
 kLWBH3k7T6ztDLuGqk7LpW5Gep7+kqLqnuVgykL/TWIz8JSuykqFT34Uo09KQUziY9nX
 fkL9/l14xwl3mBKfRNGSOjDB5Lmra87CJZwg0KKl/2rfmy+tQPgqNKhbA2XUxhl/loWS
 HUyHfQUpMOD7BuwBwX9KQvqLMVx8N8NOTbZbDo/n9zhzD64FOXd23+cxdOlmXgbd0XzC
 ZYYMTIAhS1nPDxdwprp5ZE8QT78eurEK3MHQj8fLlHUGvDEpu+/Z6QMdwukOgrqoyHZD
 Gn/g==
X-Forwarded-Encrypted: i=1;
 AKwUvBzagTbO5IVNfVSTMAuPYkXUnSLQuwnKdCx2g/RtVHSwzFWPl+LlDpzNpSxntLCKN2LGBt89LLbjw0ym@nongnu.org
X-Gm-Message-State: AFuF++ntExtXScbSMcsF8EEqb27BsR40KhkKj/Nr2Elbh6gYhspVyfNl
 QtEMKVxj/82vjjJzYiolsnAxXNUUF8qGlLUxnexicSJHkcPLc6lahVNO
X-Gm-Gg: AYBFou24UzG6w5l3tZAdfY2gIrIuh9+AWH4Rwv6x1H56pdxVlfgyDoBEbtbsbO+O5BU
 Bva/qdryFm9kY9J8qyC1+HaNescrdrGrwCxCNTdlp/D6knQfryBBsFrmljeiiPiwSx1sb3qL5iL
 8PelJOlWC1qreDqLF7VttDEfahU5Ox0KeOvrFJ2eMy6m6r4pt/BFXKirWzS+A6yoVmR7HJUxKn7
 Tn5ALH211rO5z175bdI86LOQs91SrWtuuv1uF66BxvAu9VscOcdg9HfdT/gPvXrDwQCDY0J3DJ6
 sxvvtq9PxTiFOIvfHgmfb6smxIrUzzCGps3pSLadbHofdxWoGtHGEpYnbGyIt45+LxYcz7onDMu
 heaDQn4zWWFWHp/120uaTDz7yGWCzAug4mNZ/QPnBXN4N7kCZaRuiG+KWOURYiNDNEiMKeyGQOh
 ExwmtVHLuW3MeeYD/AhH//ckPx2LbGvj1BQRwCy8esLXN28fxHkpZg12RpeLQk4kjIbc3HrztzM
 +FnTt0LL63LOkrBuiZixnk/1k2knNBWSZCkbxKUEg==
X-Received: by 2002:a05:7022:fa9:b0:143:2719:a501 with SMTP id
 a92af1059eb24-144f9173969mr4195539c88.40.1790169493859; 
 Wed, 23 Sep 2026 06:18:13 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:18:12 -0700 (PDT)
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
Subject: [PATCH v3 009/114] tests/unit: add test-target-info
Date: Wed, 23 Sep 2026 21:14:43 +0800
Message-ID: <20260923131635.1894-10-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0f.google.com
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

Collect each target-info-def.c object in target_info_def_objects,
keyed by target dir. Link every value so constructors fill the
list. Assert target_info() is not NULL and target_info_list() has
one entry per linked object.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 meson.build                   |  6 +++++-
 tests/unit/meson.build        |  4 ++++
 tests/unit/test-target-info.c | 38 +++++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 tests/unit/test-target-info.c

diff --git a/meson.build b/meson.build
index 9a6a80fd0c8..776d38c5afd 100644
--- a/meson.build
+++ b/meson.build
@@ -4260,6 +4260,8 @@ endif
 
 traceable = []
 emulators = {}
+target_info_def = files('target-info-def.c')
+target_info_def_objects = {}
 foreach target : target_dirs
   config_target = config_target_mak[target]
   target_name = config_target['TARGET_NAME']
@@ -4331,7 +4333,7 @@ foreach target : target_dirs
     endif
   endif
 
-  arch_srcs += files('target-info-def.c')
+  arch_srcs += target_info_def
 
   if target_base_arch in target_arch
     t = target_arch[target_base_arch].apply(config_target, strict: false)
@@ -4409,6 +4411,8 @@ foreach target : target_dirs
                  c_args: c_args,
                  build_by_default: false)
 
+  target_info_def_objects += {target: lib.extract_objects(target_info_def)}
+
   if target.endswith('-softmmu')
     execs = [{
       'name': 'qemu-system-' + target_name,
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index e47bc7225ab..dc980a35955 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -43,6 +43,10 @@ tests = {
   'test-qgraph': ['../qtest/libqos/qgraph.c'],
   'check-qom-interface': [qom],
   'check-qom-proplist': [qom],
+  'test-target-info': [qom, declare_dependency(
+    objects: target_info_def_objects.values(),
+    compile_args: ['-DTARGET_INFO_DEF_COUNT=@0@'.format(
+      target_info_def_objects.values().length())])],
   'test-qemu-opts': [],
   'test-keyval': [testqapi],
   'test-logging': [],
diff --git a/tests/unit/test-target-info.c b/tests/unit/test-target-info.c
new file mode 100644
index 00000000000..e6de9b259e8
--- /dev/null
+++ b/tests/unit/test-target-info.c
@@ -0,0 +1,38 @@
+/*
+ * TargetInfo unit tests
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/target-info.h"
+#include "qemu/target-info-def.h"
+
+static int target_info_list_count(void)
+{
+    TargetInfoNode *node;
+    int n = 0;
+
+    QLIST_FOREACH(node, target_info_list(), next) {
+        n++;
+    }
+    return n;
+}
+
+static void test_target_info_not_null(void)
+{
+    g_assert_nonnull(target_info());
+}
+
+static void test_target_info_list_count(void)
+{
+    g_assert_cmpint(target_info_list_count(), ==, TARGET_INFO_DEF_COUNT);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+    g_test_add_func("/target-info/not-null", test_target_info_not_null);
+    g_test_add_func("/target-info/list-count", test_target_info_list_count);
+    return g_test_run();
+}
-- 
2.52.0.windows.1


