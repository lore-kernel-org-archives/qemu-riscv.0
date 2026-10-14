Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA469CC6B1D
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 09:34:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGvLY-0002F0-4r; Wed, 14 Oct 2026 05:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvLR-0002EE-BK
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:32:21 -0400
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvLP-0000K8-ED
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:32:21 -0400
Received: by mail-dl1-x122f.google.com with SMTP id
 a92af1059eb24-154e9d2d979so563350c88.1
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 02:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791970338; x=1792575138; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rSqKSRhEqnstEH7SJXTfujA+NHTWwnjZ9T7JL0yO7Dk=;
 b=cbh2zRGNuE97IHFiDeTfDxakb8gs8WMtfdoKP3fI2zHZ3pPNP9p6hqna6fmCq3ZLed
 7PGsK3kBHQai9I0F0Yh/pWGExUwUhE8giVaoC0ncIgbvyW/M362gO8wQiboNsF02A7zr
 iPby/q78GC/T3GXp2qEurgFSgfJpgxfibSzoj9RysXG9BprOfw4UHNy2Q73Meityl+Sk
 DmifPqbzRcFJmPOWJUOL4kpaEQOtLKMvquBpyeuo5cmpLqlXkhFvBoliO9Y+QtQMui4O
 I9hKZPWGFt4OzAZRWM0dDeChrp6G0kIBukhjudxv0vqYMsZVdFVc5gVnKnUdDQX859GR
 BXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791970338; x=1792575138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rSqKSRhEqnstEH7SJXTfujA+NHTWwnjZ9T7JL0yO7Dk=;
 b=QB28Y181HhDHxeWEP/U5qpD4QytnaUw718XcAlzjx80T7o57BHRL7JjCo3CN1dxYgU
 D+ZBCcWiiL8YUHzbjpfeZ+YnrsyUSN9uiTN7pOfrCUvuHhJIXa7XGIV2GnXNmHSJ5etk
 tCdRZXU4TYDP8R+U/KzXtkzJw1c7YSSiD9CF5/+FyrkOEhLZtkZFZi4pZER5G118wslr
 1rpekJlad/q90I8XG6ckzk4fM8eVq34OMtCCuTN0uietJJFPBYoYcQyizJmMwAHQnuSb
 xs26W7xTT6J0Wr6LIrPgnEW3kR9kEIXwiBO/BVhd4+sZ2WmhtGdcbThy2oSzVSxGEFVb
 2AqA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwgVfUx9LEqearIJCk8y58JbAqqS6xaEMAJUfPy90KeyDxdez9njjBlvP/m42uZnY8cBrSJgaR4HoCQ@nongnu.org
X-Gm-Message-State: AFq9FYLIOWPQbT5lbmmEvnmlD8AhbUC+EdURQTsrGwa+E0V8oJHIgyJ6
 HayNxI3+Wv3iS2R0N5AbXkZW4e07hrFesfZ7zrYREOAtx2rahSCPZM2o
X-Gm-Gg: AYBFou3tMVQ0M5TzaPxixC3/Zx9AvVIB31y2LIIiPz4dPzkyuQyum0oCLpok1Y44Znn
 DltcH2tS8+CFcOeLgGtnNnaH9CV1qEyhZKWSiKskM5Tqkx2rBC2hnVZQXIL/PCWt/LMt5N/UTg2
 HinzEYcdFd2ueechPfHHRoysmm30t3ibvZPXIM07mQa2hV6BhA4gqsSjh2DzCETB7kvNTp3+cJy
 8HuXkVgqpXhEMqBg/kFe7QycmanMMQZWCxnN822aKKbEWl7Ju4D9D8Xc9rA46g8b4RUs3ntgBE4
 gKNFI/wVwrK2E4Y5dcZ88D17RyG0bWEN3XB/d3Q2Mu7PV8uoq1ATmCShTCf++koOzCBmVEnz5sy
 qyrncsTzcHEu9swvtttgz2siKryLQ2D+/JYvuPVp8pV0YMcCF5DhxRz1t8ZdizbipmfC6oL5YPp
 DuZZoB1sG6bABLcBZmj65W7wLv2+GRXR1Haqj+aqZrBMXLM0GRIxe0ZMbZ0tG8dwqaGfOrnUdAH
 KIB+Aco0GNwnOjy4Jq/Zd+PL32H
X-Received: by 2002:a05:7022:7e8c:b0:143:1bb1:b3c3 with SMTP id
 a92af1059eb24-16a5ce94210mr21692046c88.14.1791970337648; 
 Wed, 14 Oct 2026 02:32:17 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1698de65af7sm48769303c88.0.2026.10.14.02.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:32:16 -0700 (PDT)
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
Subject: [PATCH 01/34] qemu/base-arch-defs: extract QEMU_ARCH_BIT for
 QEMU_ARCH_* enums
Date: Wed, 14 Oct 2026 17:31:11 +0800
Message-ID: <20261014093152.834-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261014093152.834-1-luoyonggang@gmail.com>
References: <20261014093152.834-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_75_100=0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/base-arch-defs.h | 60 ++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/include/qemu/base-arch-defs.h b/include/qemu/base-arch-defs.h
index f33465738c9..806ad8094a4 100644
--- a/include/qemu/base-arch-defs.h
+++ b/include/qemu/base-arch-defs.h
@@ -9,36 +9,38 @@
 
 #include "qapi/qapi-types-machine.h"
 
+#define QEMU_ARCH_BIT(target) (1UL << (target))
+
 enum {
-    QEMU_ARCH_ALPHA =       (1UL << SYS_EMU_TARGET_ALPHA),
-    QEMU_ARCH_ARM =         (1UL << SYS_EMU_TARGET_ARM) |
-                            (1UL << SYS_EMU_TARGET_AARCH64),
-    QEMU_ARCH_I386 =        (1UL << SYS_EMU_TARGET_I386) |
-                            (1UL << SYS_EMU_TARGET_X86_64),
-    QEMU_ARCH_M68K =        (1UL << SYS_EMU_TARGET_M68K),
-    QEMU_ARCH_MICROBLAZE =  (1UL << SYS_EMU_TARGET_MICROBLAZE),
-    QEMU_ARCH_MIPS =        (1UL << SYS_EMU_TARGET_MIPS) |
-                            (1UL << SYS_EMU_TARGET_MIPSEL) |
-                            (1UL << SYS_EMU_TARGET_MIPS64) |
-                            (1UL << SYS_EMU_TARGET_MIPS64EL),
-    QEMU_ARCH_PPC =         (1UL << SYS_EMU_TARGET_PPC) |
-                            (1UL << SYS_EMU_TARGET_PPC64),
-    QEMU_ARCH_S390X =       (1UL << SYS_EMU_TARGET_S390X),
-    QEMU_ARCH_SH4 =         (1UL << SYS_EMU_TARGET_SH4) |
-                            (1UL << SYS_EMU_TARGET_SH4EB),
-    QEMU_ARCH_SPARC =       (1UL << SYS_EMU_TARGET_SPARC) |
-                            (1UL << SYS_EMU_TARGET_SPARC64),
-    QEMU_ARCH_XTENSA =      (1UL << SYS_EMU_TARGET_XTENSA) |
-                            (1UL << SYS_EMU_TARGET_XTENSAEB),
-    QEMU_ARCH_OR1K =        (1UL << SYS_EMU_TARGET_OR1K),
-    QEMU_ARCH_TRICORE =     (1UL << SYS_EMU_TARGET_TRICORE),
-    QEMU_ARCH_HPPA =        (1UL << SYS_EMU_TARGET_HPPA),
-    QEMU_ARCH_RISCV =       (1UL << SYS_EMU_TARGET_RISCV32) |
-                            (1UL << SYS_EMU_TARGET_RISCV64),
-    QEMU_ARCH_RX =          (1UL << SYS_EMU_TARGET_RX),
-    QEMU_ARCH_AVR =         (1UL << SYS_EMU_TARGET_AVR),
-    QEMU_ARCH_HEXAGON =     (1UL << SYS_EMU_TARGET_HEXAGON),
-    QEMU_ARCH_LOONGARCH =   (1UL << SYS_EMU_TARGET_LOONGARCH64),
+    QEMU_ARCH_ALPHA =       QEMU_ARCH_BIT(SYS_EMU_TARGET_ALPHA),
+    QEMU_ARCH_ARM =         QEMU_ARCH_BIT(SYS_EMU_TARGET_ARM) |
+                            QEMU_ARCH_BIT(SYS_EMU_TARGET_AARCH64),
+    QEMU_ARCH_I386 =        QEMU_ARCH_BIT(SYS_EMU_TARGET_I386) |
+                            QEMU_ARCH_BIT(SYS_EMU_TARGET_X86_64),
+    QEMU_ARCH_M68K =        QEMU_ARCH_BIT(SYS_EMU_TARGET_M68K),
+    QEMU_ARCH_MICROBLAZE =  QEMU_ARCH_BIT(SYS_EMU_TARGET_MICROBLAZE),
+    QEMU_ARCH_MIPS =        QEMU_ARCH_BIT(SYS_EMU_TARGET_MIPS) |
+                            QEMU_ARCH_BIT(SYS_EMU_TARGET_MIPSEL) |
+                            QEMU_ARCH_BIT(SYS_EMU_TARGET_MIPS64) |
+                            QEMU_ARCH_BIT(SYS_EMU_TARGET_MIPS64EL),
+    QEMU_ARCH_PPC =         QEMU_ARCH_BIT(SYS_EMU_TARGET_PPC) |
+                            QEMU_ARCH_BIT(SYS_EMU_TARGET_PPC64),
+    QEMU_ARCH_S390X =       QEMU_ARCH_BIT(SYS_EMU_TARGET_S390X),
+    QEMU_ARCH_SH4 =         QEMU_ARCH_BIT(SYS_EMU_TARGET_SH4) |
+                            QEMU_ARCH_BIT(SYS_EMU_TARGET_SH4EB),
+    QEMU_ARCH_SPARC =       QEMU_ARCH_BIT(SYS_EMU_TARGET_SPARC) |
+                            QEMU_ARCH_BIT(SYS_EMU_TARGET_SPARC64),
+    QEMU_ARCH_XTENSA =      QEMU_ARCH_BIT(SYS_EMU_TARGET_XTENSA) |
+                            QEMU_ARCH_BIT(SYS_EMU_TARGET_XTENSAEB),
+    QEMU_ARCH_OR1K =        QEMU_ARCH_BIT(SYS_EMU_TARGET_OR1K),
+    QEMU_ARCH_TRICORE =     QEMU_ARCH_BIT(SYS_EMU_TARGET_TRICORE),
+    QEMU_ARCH_HPPA =        QEMU_ARCH_BIT(SYS_EMU_TARGET_HPPA),
+    QEMU_ARCH_RISCV =       QEMU_ARCH_BIT(SYS_EMU_TARGET_RISCV32) |
+                            QEMU_ARCH_BIT(SYS_EMU_TARGET_RISCV64),
+    QEMU_ARCH_RX =          QEMU_ARCH_BIT(SYS_EMU_TARGET_RX),
+    QEMU_ARCH_AVR =         QEMU_ARCH_BIT(SYS_EMU_TARGET_AVR),
+    QEMU_ARCH_HEXAGON =     QEMU_ARCH_BIT(SYS_EMU_TARGET_HEXAGON),
+    QEMU_ARCH_LOONGARCH =   QEMU_ARCH_BIT(SYS_EMU_TARGET_LOONGARCH64),
     QEMU_ARCH_ALL =         UINT32_MAX,
 };
 
-- 
2.55.0.windows.3


