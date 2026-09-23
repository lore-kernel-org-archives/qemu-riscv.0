Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CE2C9830C
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 13:20:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9MtQ-0001Nt-BF; Wed, 23 Sep 2026 09:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mr9-00008S-7Q
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:17:56 -0400
Received: from mail-dy2-x24.google.com ([2607:f8b0:4864:36::24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mqv-0006on-1D
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:17:46 -0400
Received: by mail-dy2-x24.google.com with SMTP id
 5a478bee46e88-33b9e805130so667922eec.1
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 06:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169456; x=1790774256; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ElUpYvhknnIwSPfbcSK8wY490g/9t35RPhM2WyomKNg=;
 b=lbK/NVRk36tdEvYYVWBEm6GNOgkZwMj1jUVOI86Dl51L3KyvNgcfAwaoLc6tetQ3pG
 C4AobTIEw4yciB9FakFGgaMLUboVuAUClB1H2psQiOywZDw43gxeoa9xyGWFm5H69jif
 YnYwT1qqR1JBKkBcRL74V8vUNT99LwIhMhDfV5XrJOk0VbjUC+/Yog+M8t8vnzvmzQva
 fy+ydk174CoezTBHL5knhCXmPpWcmYscIaQLtWRynfomf/fLFl9cY2ehPTWNH7hlw/Nz
 qUBaeUZUqOvqUuq76gbaUq4DfVlP9ViB60JIe2dRWfa7MKFP++jxMBgpOz+Hbx8BpoD1
 +qbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169456; x=1790774256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ElUpYvhknnIwSPfbcSK8wY490g/9t35RPhM2WyomKNg=;
 b=Zw6PytcicMqgt5dbFYAJWMZxs7osxGXRDsS+IkPYHDmSkg/tX7P5KAh2va8bI/SYLt
 fmgT30xJVGP4QIAoO+aCgkUxIQf5EZU4MniWddVzCEsPNa3hIH5I7DRxfJK9zMDKWzuz
 DQYrKzsiV25+ZmjyeBKwBYnA9TazhtkTgOTIt5J0acxbsESbB24/x7i1o/0gyYBT8emg
 n8s/ka4Cfjh7Edi4xBVaKy/6l6WYNBensZkzH0/LF2Yuz8yrjsxI6Y1JC0BPyObKWTFY
 oC3oDlKa3sopEhtbIvWih2papP6E0oa5ckmLMGAIJThoH9TtcYrLpg4htisasOSMpd3+
 /HoQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByCJfnwceOgp4sszPAhxas+f4Pgvk2ErFxA3pcwWRIcNIfK2Fm4jluasVoVMVfkqbhHJ+fZoNkNwp3Y@nongnu.org
X-Gm-Message-State: AFuF++kIvOu2iyIfTUveHIYwp0E8IIr5H6hDsTlo9dHLoVBRgQsj9CPP
 GIWpaIl4BKpLO2SV5h+AUEH57ugaxs5CiYRCa+rCTVUCuEfQb6GSTTXp
X-Gm-Gg: AYBFou2CAU6ePxhv4zcKsBWXhq9JePhrzNnUdGya4amHmr2g8nem3qv4954oXMNKFg2
 MYfQ9MAqdk/sVXRVmj832r6VKDA2HxU9RUQAuBq0Is72sVZPMrqEkFCpBt+MzXGxd2D8Ejff05c
 kNxyfijfW8sdFz9Hjt39tjTc3vey5ST4Nl9RZP0Z98xoW03RM4Rm4+OKFLJRfOM0hpSUWQ/+AM8
 N1nkATZ0Y3fXGdZPdWC6yRSOzdvwri3SwfCX1R5lOMYRVd857aTYr4B8bchU1u/RmbVMrwBfOxi
 EZNfW6sZ/oKZ4rlAkEqX5CH6pDnXFMPXYEBEmcif82csMdab94EavJ/tH6Fvj97DtqVUJtYACjj
 AEttAqvw1ApineFNmn5ZooH1q9CYViNSjmE0q/SHPIjtZspf9dVv+29GaL17GW66wt0y6O5yD1K
 R3MdHMtj3eZCDaAUoKRpGoHru6dwTlGFmyk+1OqvzIJe67h9o/KX+HUCnmva3Mioe4iYPGMPMGv
 imTBCLtYW7skcFIrmdYMFTW9LP//iJF4S7BxOZtyA==
X-Received: by 2002:a05:7300:b286:b0:30e:f0a5:8762 with SMTP id
 5a478bee46e88-33e8d9ca3c8mr2607807eec.19.1790169455486; 
 Wed, 23 Sep 2026 06:17:35 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:17:33 -0700 (PDT)
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
Subject: [PATCH v3 005/114] target-info: set cpu_type from TARGET_BASE_ARCH
Date: Wed, 23 Sep 2026 21:14:39 +0800
Message-ID: <20260923131635.1894-6-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::24;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x24.google.com
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

target-info-def.c no longer includes cpu.h, so CPU_RESOLVING_TYPE
is unavailable. Emit TARGET_BASE_ARCH as an uppercase identifier in
config-target.h and set cpu_type to TYPE_${TARGET_BASE_ARCH}_CPU.

Alias the base-arch tokens whose QOM name differs: TYPE_I386_CPU,
TYPE_OR1K_CPU, TYPE_PPC_CPU, TYPE_S390X_CPU, and TYPE_SH4_CPU.

Drop the ArchCPU parent_obj and env offsetof checks with the cpu.h
include. Page-size checks stay, via cpu-param.h.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/target-info-def.h |  2 +-
 meson.build                    |  1 +
 target-info-def.c              | 11 +++--------
 target/i386/cpu-qom.h          |  1 +
 target/or1k/cpu-qom.h          |  1 +
 target/ppc/cpu-qom.h           |  1 +
 target/s390x/cpu-qom.h         |  1 +
 target/sh4/cpu-qom.h           |  1 +
 8 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/include/qemu/target-info-def.h b/include/qemu/target-info-def.h
index 8019d2c7196..ebd88463aea 100644
--- a/include/qemu/target-info-def.h
+++ b/include/qemu/target-info-def.h
@@ -19,7 +19,7 @@ typedef struct TargetInfo {
     SysEmuTarget target_arch;
     /* runtime equivalent of TARGET_LONG_BITS definition */
     unsigned long_bits;
-    /* runtime equivalent of CPU_RESOLVING_TYPE definition */
+    /* runtime equivalent of TYPE_${TARGET_BASE_ARCH}_CPU definition */
     const char *cpu_type;
     /* related to TARGET_BIG_ENDIAN definition */
     EndianMode endianness;
diff --git a/meson.build b/meson.build
index 8bd2d725ca0..20345860c9f 100644
--- a/meson.build
+++ b/meson.build
@@ -3378,6 +3378,7 @@ foreach target : target_dirs
       # Note that TARGET_BASE_ARCH ends up in config-target.h but it is
       # not used to select files from sourcesets.
       config_target_data.set('TARGET_' + v.to_upper(), 1)
+      config_target_data.set(k, v.to_upper())
     elif k == 'TARGET_NAME' or k == 'CONFIG_QEMU_INTERP_PREFIX'
       config_target_data.set_quoted(k, v)
     elif v == 'y'
diff --git a/target-info-def.c b/target-info-def.c
index fa19cabc55f..f167f5f2ac1 100644
--- a/target-info-def.c
+++ b/target-info-def.c
@@ -10,15 +10,10 @@
 #include "qemu/target-info.h"
 #include "qemu/target-info-def.h"
 #include "qemu/target-info-init.h"
-#include "hw/core/boards.h"
-#include "cpu.h"
-#include "exec/cpu-defs.h"
+#include "cpu-qom.h"
+#include "cpu-param.h"
 #include "exec/page-vary.h"
 
-/* Validate correct placement of CPUArchState. */
-QEMU_BUILD_BUG_ON(offsetof(ArchCPU, parent_obj) != 0);
-QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) != sizeof(CPUState));
-
 /* Validate target page size, if invariant. */
 #ifndef TARGET_PAGE_BITS_VARY
 QEMU_BUILD_BUG_ON(TARGET_PAGE_BITS < TARGET_PAGE_BITS_MIN);
@@ -28,7 +23,7 @@ static const TargetInfo target_info_stub = {
     .target_name = TARGET_NAME,
     .target_arch = glue(SYS_EMU_TARGET_, TARGET_ARCH),
     .long_bits = TARGET_LONG_BITS,
-    .cpu_type = CPU_RESOLVING_TYPE,
+    .cpu_type = glue(TYPE_, glue(TARGET_BASE_ARCH, _CPU)),
     .endianness = TARGET_BIG_ENDIAN ? ENDIAN_MODE_BIG : ENDIAN_MODE_LITTLE,
 #ifdef TARGET_PAGE_BITS_VARY
     .page_bits_vary = true,
diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
index d4e216d000c..7619c4a4826 100644
--- a/target/i386/cpu-qom.h
+++ b/target/i386/cpu-qom.h
@@ -27,6 +27,7 @@
 #else
 #define TYPE_X86_CPU "i386-cpu"
 #endif
+#define TYPE_I386_CPU TYPE_X86_CPU
 
 OBJECT_DECLARE_CPU_TYPE(X86CPU, X86CPUClass, X86_CPU)
 
diff --git a/target/or1k/cpu-qom.h b/target/or1k/cpu-qom.h
index 14bac33312e..c0d5e9e81ba 100644
--- a/target/or1k/cpu-qom.h
+++ b/target/or1k/cpu-qom.h
@@ -12,6 +12,7 @@
 #include "hw/core/cpu.h"
 
 #define TYPE_OPENRISC_CPU "or1k-cpu"
+#define TYPE_OR1K_CPU TYPE_OPENRISC_CPU
 
 OBJECT_DECLARE_CPU_TYPE(OpenRISCCPU, OpenRISCCPUClass, OPENRISC_CPU)
 
diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 8247fa23367..428cdc85488 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -28,6 +28,7 @@
 #else
 #define TYPE_POWERPC_CPU "powerpc-cpu"
 #endif
+#define TYPE_PPC_CPU TYPE_POWERPC_CPU
 
 OBJECT_DECLARE_CPU_TYPE(PowerPCCPU, PowerPCCPUClass, POWERPC_CPU)
 
diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
index c59bb1eab15..07a8c881fe5 100644
--- a/target/s390x/cpu-qom.h
+++ b/target/s390x/cpu-qom.h
@@ -23,6 +23,7 @@
 #include "hw/core/cpu.h"
 
 #define TYPE_S390_CPU "s390x-cpu"
+#define TYPE_S390X_CPU TYPE_S390_CPU
 
 OBJECT_DECLARE_CPU_TYPE(S390CPU, S390CPUClass, S390_CPU)
 
diff --git a/target/sh4/cpu-qom.h b/target/sh4/cpu-qom.h
index 6cf5fbb0745..08fa92106e9 100644
--- a/target/sh4/cpu-qom.h
+++ b/target/sh4/cpu-qom.h
@@ -23,6 +23,7 @@
 #include "hw/core/cpu.h"
 
 #define TYPE_SUPERH_CPU "superh-cpu"
+#define TYPE_SH4_CPU TYPE_SUPERH_CPU
 
 #define TYPE_SH7750R_CPU SUPERH_CPU_TYPE_NAME("sh7750r")
 #define TYPE_SH7751R_CPU SUPERH_CPU_TYPE_NAME("sh7751r")
-- 
2.52.0.windows.1


