Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26642CC6B1A
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 09:33:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGvMb-0003Sf-BD; Wed, 14 Oct 2026 05:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvMX-0003Fy-MN
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:33:29 -0400
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvMV-0000Sh-Gw
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:33:29 -0400
Received: by mail-dl1-x122b.google.com with SMTP id
 a92af1059eb24-14394530ec6so2716606c88.1
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 02:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791970406; x=1792575206; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=11InmadDq7bj535f7c3NHs1B3mhGvA7oeUNBn5cdzMU=;
 b=gc5r9k5vx4huZrRt+Uo7J7fWoVlrKMYVtkwiahF/aIOVFLsidDHH41HdUpCM71GBQS
 kcyN0leUh60AaafmYUoPks8Re3n42p9BT1xmAYQ4O97V05v4rJiaL4rNJvWyTID/G+VJ
 uxudsNVl8XHTXRuN9nk7fAQEwXHoMdtRqbydr410gY/VtaawwV0dh6OwPA5MEehuItH5
 /IILKygCRZvl3QzSa97ny/ZlpsIWvgK0CqrVodKH7pRBbjNKo6IwgpB4M0wyXkZLxhbJ
 izG4/WEWWy2dWKFq9HUYFH1e7dThjiAW8snxtSLvz5ZuCcec5L8OdAr2j73Xjze06enB
 4f4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791970406; x=1792575206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=11InmadDq7bj535f7c3NHs1B3mhGvA7oeUNBn5cdzMU=;
 b=Bay0DKjzdmmYnmYCh/jlomeInSXMFnJ7M5kMcXgRlJlEeYlRJpxYng5vStI1D/5fmF
 oM2vX7i+MU1UicWPEb57eXRi1rFhRcrELSBI7VpDV/y1e6k7fg/eRMoM8M1/yFbum9QS
 URYaj9XKBuBLFStMKrXZbSz82cr2tnSBsp4HDpDEX5Z6t/mjwFp7gzq0Oa9DxEFtP7uy
 E2+UdC8T748XWChTjOxck/LY7kFwzEyQSigRyh9+i56+ysh75QkF85NS9OVvuvPDgEKU
 QPNmgoQ71maNyiE4X8CSxkxNMRbLtZ8LvpUWcViFQnHNctt/Xzt5wjXlrAgi1HszSROT
 4u6g==
X-Forwarded-Encrypted: i=1;
 AKwUvByBsO/599D428vigr9n1NklC3zfj9cWXuqlm2Xg7wyykaaR65v/PKxCopxIf5XrA1WoZ2gyJKB58tyc@nongnu.org
X-Gm-Message-State: AFq9FYJcnJ/piVyAIXSqvA+JmsAzXPCuCVnEt/7BCY+iqfIvDJS37rCb
 1C03gDBhxtMhHiIezMiCakcFCosz5tmPUhW5Yo7jAIg/DhJhvLwha07f
X-Gm-Gg: AYBFou2AQQpqnv40oEPy5G2lAm/zukptHu/ysvbXMbbCsSPho5OvxsSrHM5VUFrNS+O
 5tEs9stJjlYHRz6yp90awhIrHKI/NQHu9DFefv1SuMTyFB9lXWcB9TzSB35pKZM1UeXFoqsOmtY
 /v0vvDfHpH+8rAUZj2joz4/tZH6P+jls20LlFCGKxBO20/GjpEJ/mBLj3kLJXmR2Q7TgGbhYBmj
 lmnpnJuBsLx9Ce8gX+TaRPMTH0Z5tPD/49WUhw1f6rxoxvGxOG+pEnEuMj8AgKpe18U3in9E+he
 E+GzMGCz6TDZHplfT74Q9rAFivxOSoWAVLnKmrG/Ls7kZjbtMTiUGc1avQpnVA6j4q7mb4vt3qq
 tz720X3IFDzKPxSdd0sTgPpYPrg3NWcWfvfDgyTUU16mTEZIepk3CDnuwIBPC5yDWM+LmYUrRJD
 tlZibW2IU26NiDQzxNrIikaZVTE+z5HF/5lUKzaNueBtBtIGkF/ZjXMDUYoN/fGC1EfGwh5Ut/y
 GLu1GXiHYK9Bt4uLw==
X-Received: by 2002:a05:701b:42c2:10b0:168:6ad8:e88c with SMTP id
 a92af1059eb24-16a63757d80mr24501847c88.39.1791970405985; 
 Wed, 14 Oct 2026 02:33:25 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1698de65af7sm48769303c88.0.2026.10.14.02.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:33:25 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <17746591750@163.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Eric Farman <farman@linux.ibm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fam Zheng <fam@euphon.net>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Chao Liu <chao.liu@processmission.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH 08/34] hw: add MachineClass::targets with a usage and test
Date: Wed, 14 Oct 2026 17:31:18 +0800
Message-ID: <20261014093152.834-9-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261014093152.834-1-luoyonggang@gmail.com>
References: <20261014093152.834-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122b;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Add a target bitmask to MachineClass, defaulting to QEMU_ARCH_ALL.
Update "clipper" machine as a demo/test

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/alpha/dp264.c               |  2 ++
 hw/core/machine.c              |  3 +++
 include/hw/core/boards.h       |  6 ++++++
 tests/unit/test-multi-target.c | 33 ++++++++++++++++++++++++++++++++-
 4 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index f928e0cee82..6be573c88bc 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -7,6 +7,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/base-arch-defs.h"
 #include "target/alpha/cpu.h"
 #include "exec/target_page.h"
 #include "elf.h"
@@ -203,6 +204,7 @@ static void clipper_init(MachineState *machine)
 
 static void clipper_machine_init(MachineClass *mc)
 {
+    mc->targets = QEMU_ARCH_ALPHA;
     mc->desc = "Alpha DP264/CLIPPER";
     mc->init = clipper_init;
     mc->block_default_type = IF_IDE;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index d9ac4b419a3..5c6f3cb0f68 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/base-arch-defs.h"
 #include "qemu/units.h"
 #include "qemu/accel.h"
 #include "system/replay.h"
@@ -1068,6 +1069,8 @@ static void machine_class_init(ObjectClass *oc, const void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
+    mc->targets = QEMU_ARCH_ALL;
+
     /* Default 128 MB as guest ram size */
     mc->default_ram_size = 128 * MiB;
     mc->rom_file_has_mr = true;
diff --git a/include/hw/core/boards.h b/include/hw/core/boards.h
index d0e4ad98201..d7713c45836 100644
--- a/include/hw/core/boards.h
+++ b/include/hw/core/boards.h
@@ -186,6 +186,11 @@ typedef struct {
  * MachineClass:
  * @deprecation_reason: If set, the machine is marked as deprecated. The
  *    string should provide some clear information about what to use instead.
+ * @targets: bitmask of EmuTarget values supported by this machine. Each
+ *    target is represented by QEMU_ARCH_BIT(EMU_TARGET_*).
+ *    QEMU_ARCH_* masks may be used when the machine supports every target
+ *    in that architecture family. Defaults to QEMU_ARCH_ALL; machines that
+ *    support a narrower set of targets should declare that set explicitly.
  * @max_cpus: maximum number of CPUs supported. Default: 1
  * @min_cpus: minimum number of CPUs supported. Default: 1
  * @default_cpus: number of CPUs instantiated if none are specified. Default: 1
@@ -273,6 +278,7 @@ struct MachineClass {
     const char *alias;
     const char *desc;
     const char *deprecation_reason;
+    uint64_t targets;
 
     void (*init)(MachineState *state);
     void (*reset)(MachineState *state, ResetType type);
diff --git a/tests/unit/test-multi-target.c b/tests/unit/test-multi-target.c
index a91fe8e6d07..c2922e0fed5 100644
--- a/tests/unit/test-multi-target.c
+++ b/tests/unit/test-multi-target.c
@@ -13,6 +13,8 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/core/boards.h"
+#include "qemu/base-arch-defs.h"
 #include "qemu/module.h"
 #include "qemu/target-info.h"
 #include "qemu/target-info-qom.h"
@@ -32,6 +34,17 @@ int (*qemu_main)(void);
 
 static GSList *targets;
 
+static bool target_arch_available(uint64_t arch_mask)
+{
+    for (GSList *l = targets; l; l = l->next) {
+        const TargetInfo *ti = TARGET_INFO_CLASS(l->data)->target_info;
+        if (QEMU_ARCH_BIT(ti->target_arch) & arch_mask) {
+            return true;
+        }
+    }
+    return false;
+}
+
 static void test_qom_types_are_unique(void)
 {
     g_assert(targets);
@@ -41,6 +54,22 @@ static void test_qom_types_are_unique(void)
     g_assert_true(targets == target_info_qom_get_targets());
 }
 
+static void test_machine_targets(void)
+{
+    ObjectClass *oc;
+
+    oc = object_class_by_name(TYPE_MACHINE);
+    g_assert_nonnull(oc);
+    g_assert_cmpuint(MACHINE_CLASS(oc)->targets, ==, QEMU_ARCH_ALL);
+
+    if (target_arch_available(QEMU_ARCH_ALPHA)) {
+        oc = object_class_by_name(MACHINE_TYPE_NAME("clipper"));
+        g_assert_nonnull(oc);
+        g_assert_cmpuint(MACHINE_CLASS(oc)->targets, ==,
+                         QEMU_ARCH_BIT(EMU_TARGET_ALPHA));
+    }
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
@@ -54,6 +83,8 @@ int main(int argc, char **argv)
     module_call_init(MODULE_INIT_QOM);
 
     g_test_add_func("/multi-targets/qom-types-are-unique",
-                   test_qom_types_are_unique);
+                    test_qom_types_are_unique);
+    g_test_add_func("/multi-targets/machine-targets",
+                    test_machine_targets);
     return g_test_run();
 }
-- 
2.55.0.windows.3


