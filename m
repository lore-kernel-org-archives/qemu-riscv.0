Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89732C41535
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 12:36:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rD1zl-00029f-26; Tue, 12 Dec 2023 07:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1zT-0001d7-O0
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:36:02 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1zN-00084A-6P
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:35:58 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-55193d5e8cdso568313a12.1
 for <qemu-riscv@nongnu.org>; Tue, 12 Dec 2023 04:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702384551; x=1702989351; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LKqz8+rrRr+9OnCGqaF5kY8vCRVBvOcgtedefIMaXhg=;
 b=clg2mqmydxRNRTwPDDRhBiigC3feteSdyx7+Hml+Mxs3YtXPpucbIdJv1SilSgbsQQ
 tj6//2kA939H18wW4sLHwE0NsgSmTuXxvcOkS2EkX0PcswEIOWJGWz1ZLNPeLXVE8uvT
 D/51MkExjRqtGdsyaWSTjMQ5rQJH2BCvnK8Zzp62EiOJFMDPHsMfgqYAdSknYfqqo5wx
 jvBu5o8pnE/KzYc0owZuI4wy6kmmmdWIBYtCqXFVyfjM+LNx5mLoqil2AqbxzMB0T5ex
 23wI4y/1aMDYCSuxzCJzbQwcGG1Zg+ogmpUDhfNXfvaP4DXB/cT1zNiq3PSQXRq81V95
 q/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702384551; x=1702989351;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LKqz8+rrRr+9OnCGqaF5kY8vCRVBvOcgtedefIMaXhg=;
 b=Za0umQdePHl5EXYVpRr7FDV3kj/hPO3rA8HwfdxrqI3AyCVDVcXGMPqQpA0BK9mrMT
 XZ7fASSuqGWlfGkCi/Avt+VdlZ1KhlGKaRM9GEkabUkqwlNzXj/DoyIKrw2wMVLKKZTy
 6lhtimygQ1M7A6gAziw6ddSXbmuYLXXchy/CArfWQOpNNSNxs4RxywKLi7gJv0I473U1
 TK1QeIYg4pPYWgODqCYqfuHaVpZGm/r6duNIN6ppQkChU4Ga6y0y9XFkWc4X3DSULTrB
 xLPSTehnu3mJhnVO8/iJtGX1Qb8ayaltvyFha7uNwUfvX3dUhCc+hb2qJm66yjrGAHCV
 Odow==
X-Gm-Message-State: AOJu0YykoYfjxGy5lH6LOjxmnj4IbehGN9p3ZbofXF8m7MPB4svmnwgp
 Vx0anNgltiI5u5bkFfPJ2seYcw==
X-Google-Smtp-Source: AGHT+IGdDBxwOjO3s57fwqNR4JkxK+RE/jCphEdV6BIZvfrVWSyPEmapbhmFWj4HyfkEWxLwnIJvJQ==
X-Received: by 2002:a50:9515:0:b0:54c:6386:a1a3 with SMTP id
 u21-20020a509515000000b0054c6386a1a3mr3554851eda.15.1702384551619; 
 Tue, 12 Dec 2023 04:35:51 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a50cc48000000b0054c9df4317dsm4657860edi.7.2023.12.12.04.35.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Dec 2023 04:35:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v2 15/23] exec: Declare target_words_bigendian() in
 'exec/tswap.h'
Date: Tue, 12 Dec 2023 13:33:51 +0100
Message-ID: <20231212123401.37493-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We usually check target endianess before swapping values,
so target_words_bigendian() declaration makes sense in
"exec/tswap.h" with the target swapping helpers.

Remove "hw/core/cpu.h" when it was only included to get
the target_words_bigendian() declaration.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/tswap.h     | 12 +++++++++++-
 include/hw/core/cpu.h    | 11 -----------
 cpu-target.c             |  1 +
 disas/disas.c            |  1 +
 hw/audio/virtio-snd.c    |  2 +-
 hw/core/cpu-sysemu.c     |  2 +-
 hw/core/generic-loader.c |  2 +-
 hw/display/vga.c         |  2 +-
 hw/virtio/virtio.c       |  1 +
 9 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/include/exec/tswap.h b/include/exec/tswap.h
index 68944a880b..77954bbc2b 100644
--- a/include/exec/tswap.h
+++ b/include/exec/tswap.h
@@ -8,9 +8,19 @@
 #ifndef TSWAP_H
 #define TSWAP_H
 
-#include "hw/core/cpu.h"
 #include "qemu/bswap.h"
 
+/**
+ * target_words_bigendian:
+ * Returns true if the (default) endianness of the target is big endian,
+ * false otherwise. Note that in target-specific code, you can use
+ * TARGET_BIG_ENDIAN directly instead. On the other hand, common
+ * code should normally never need to know about the endianness of the
+ * target, so please do *not* use this function unless you know very well
+ * what you are doing!
+ */
+bool target_words_bigendian(void);
+
 /*
  * If we're in target-specific code, we can hard-code the swapping
  * condition, otherwise we have to do (slower) run-time checks.
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 3208b938f7..d6b077da71 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1153,17 +1153,6 @@ bool cpu_exec_realizefn(CPUState *cpu, Error **errp);
 void cpu_exec_unrealizefn(CPUState *cpu);
 void cpu_exec_reset_hold(CPUState *cpu);
 
-/**
- * target_words_bigendian:
- * Returns true if the (default) endianness of the target is big endian,
- * false otherwise. Note that in target-specific code, you can use
- * TARGET_BIG_ENDIAN directly instead. On the other hand, common
- * code should normally never need to know about the endianness of the
- * target, so please do *not* use this function unless you know very well
- * what you are doing!
- */
-bool target_words_bigendian(void);
-
 const char *target_name(void);
 
 void page_size_init(void);
diff --git a/cpu-target.c b/cpu-target.c
index 997ca2e846..4c1e19ca81 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -33,6 +33,7 @@
 #endif
 #include "sysemu/cpus.h"
 #include "sysemu/tcg.h"
+#include "exec/tswap.h"
 #include "exec/replay-core.h"
 #include "exec/cpu-common.h"
 #include "exec/exec-all.h"
diff --git a/disas/disas.c b/disas/disas.c
index 0d2d06c2ec..89a1e7d767 100644
--- a/disas/disas.c
+++ b/disas/disas.c
@@ -6,6 +6,7 @@
 #include "disas/disas.h"
 #include "disas/capstone.h"
 #include "hw/core/cpu.h"
+#include "exec/tswap.h"
 #include "exec/memory.h"
 
 /* Filled in by elfload.c.  Simplistic, but will do for now. */
diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index 137fa77a01..a80f23aa71 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -20,11 +20,11 @@
 #include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "include/qemu/lockable.h"
+#include "exec/tswap.h"
 #include "sysemu/runstate.h"
 #include "trace.h"
 #include "qapi/error.h"
 #include "hw/audio/virtio-snd.h"
-#include "hw/core/cpu.h"
 
 #define VIRTIO_SOUND_VM_VERSION 1
 #define VIRTIO_SOUND_JACK_DEFAULT 0
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index d0d6a910f9..2a9a2a4eb5 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "hw/core/cpu.h"
+#include "exec/tswap.h"
 #include "hw/core/sysemu-cpu-ops.h"
 
 bool cpu_paging_enabled(const CPUState *cpu)
diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index d4b5c501d8..ea8628b892 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -31,7 +31,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/core/cpu.h"
+#include "exec/tswap.h"
 #include "sysemu/dma.h"
 #include "sysemu/reset.h"
 #include "hw/boards.h"
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 37557c3442..d11a30a785 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -26,7 +26,7 @@
 #include "qemu/units.h"
 #include "sysemu/reset.h"
 #include "qapi/error.h"
-#include "hw/core/cpu.h"
+#include "exec/tswap.h"
 #include "hw/display/vga.h"
 #include "hw/i386/x86.h"
 #include "hw/pci/pci.h"
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 3a160f86ed..28dc1f4c15 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -20,6 +20,7 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
+#include "exec/tswap.h"
 #include "qom/object_interfaces.h"
 #include "hw/core/cpu.h"
 #include "hw/virtio/virtio.h"
-- 
2.41.0


