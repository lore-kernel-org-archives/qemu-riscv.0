Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6290DE77170
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 20:27:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIvwv-0007Q4-L2; Wed, 04 Dec 2024 15:26:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvwt-0007Pp-Of
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 15:26:15 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvws-0006zY-0S
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 15:26:15 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-434a8640763so1429245e9.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Dec 2024 12:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733343972; x=1733948772; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m1RIE5+ukFowaj7qHZ6IcTnrqgT2AW8n48ucXO2dhS0=;
 b=GfVsU7IyO93eg5TienZnTWiud2BVDp961Au9iueryaXGHHxsSE5+OIgvy5aav+J6j0
 iFj9ReTl9yIEFFwIcem7tWhUVlTJhb5w2LAZ1K0pNJFQ7lA8s7AY79Kd8Vg+dGafTNWP
 ECFJv/88555Zt31CvtFyDigvuV2yANIXIMIjJpLhiDf/36IYmECsZpvLKo/Fiyu+iwyj
 odCezX9IRqGbRLT7pYjCOrVw2hbwZFsrR0KejG9p49k6ylSkpNbPuDTjEoqmh1XH1DUr
 QCeD2fzXnpNfV2YNqPW+alwG854lOkVPMLw+ypdCRAUtx7HnYFBP2NAem4vXwWIOjqK2
 NSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733343972; x=1733948772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m1RIE5+ukFowaj7qHZ6IcTnrqgT2AW8n48ucXO2dhS0=;
 b=vpiDDgGa54V+KU/G+hAxc+4BKXHH+6fUCd7gATAXaWaDF6+X8uPUuJJF0N6DavJ0B+
 ag01hXDzc4ZuOU/+JcCtVjcph3Ljw4eBUI8Py8H7kD/lUP0pq1bljYZ+0LjUG6QNMomA
 1VjLH1H1H/uR2aNCuBkN+5/scCDdKlg6dscNoNqL9Sck6WpNrx7Qeg8qW57UIHyTawEG
 W7KtocpzyHptBLJld0ZQv5KCV1WUUuVakciydavrLPheXnZSypL5U+Y1VF+8qYtX5YCP
 2wMG1+rkx6UzMQkFKlP9Z3SnPIYGd640CBEceiht7mG0+PO4znNHBi0idgODGIEOxbSw
 Z61w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK6acQbH9Z6eTtXP+D6cJezsXXHyfbdaiSu4Mf8Yg8YI2BsSUgkjWMWJgwe/4wWYXYgGfW6ZT/5h6B@nongnu.org
X-Gm-Message-State: AOJu0YwdTa9MWQHYqthQyA3RSZwrCOuyykrn0WqkocDcG6gW/nGL3OgL
 DmDkaIsVvEbS1h2yGcERBmA2FgUxnCor6N5FdltZxu07z6mBWhhD5LiLEwxAGsk=
X-Gm-Gg: ASbGncvy2i2CBSXbi2Elv7EknUwyLUlL8BhdhNIz7n/hrz/knEvKJeRK6VpATlboQ4T
 JGSbU09Tc1xxFpkKQJYrn3F/UEnKtrlTxVjUy32njsOuieITtGeTjMjYxYHG4uoP0u68BnkhFfe
 hho2DNx38tBMGC1M5lLjTtUQnJd726UWls1VXQXgld/tcVbdXEE4Hyj+R5CTY1CvGXMxDBJnvBN
 N6lpV5qTjtUZVrFz8Wu4JxKgdQTR/+DPt46B6sI/8rsPDDiqbyvSrHBsBMJ9j9h+NxNG78RJYFb
 gOAwGdRFiHdORltlajbX9082
X-Google-Smtp-Source: AGHT+IGXhwpuvROhVg5Eagj4XtkzGHltgdEVnCyeX3LY5U9qfbLEMjF9256hEmEL1EeT6+IKKEYpGQ==
X-Received: by 2002:a05:600c:3108:b0:434:9f78:17d2 with SMTP id
 5b1f17b1804b1-434d0a1d675mr64752805e9.29.1733343972461; 
 Wed, 04 Dec 2024 12:26:12 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52a90a2sm34906725e9.36.2024.12.04.12.26.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:26:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 01/20] exec/tswap: Rename target_words_bigendian ->
 qemu_binary_is_bigendian
Date: Wed,  4 Dec 2024 21:25:43 +0100
Message-ID: <20241204202602.58083-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

target_words_bigendian() doesn't return whether a target vCPU
expects data in big-endian order, but whether the *binary* has
been compiled with big-endian flavor by default. Rename it
appropriately to reduce confusion. Mechanical change doing:

  $ sed -i -e s/target_words_bigendian/qemu_binary_is_bigendian/ \
      $(git grep -l target_words_bigendian)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/tswap.h     | 18 +++++++++---------
 cpu-target.c             |  2 +-
 disas/disas-common.c     |  2 +-
 hw/core/cpu-sysemu.c     |  2 +-
 hw/core/generic-loader.c |  2 +-
 hw/display/vga.c         |  4 ++--
 hw/virtio/virtio.c       |  2 +-
 system/qtest.c           |  2 +-
 8 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/include/exec/tswap.h b/include/exec/tswap.h
index ecd4faef015..0113ff88fcc 100644
--- a/include/exec/tswap.h
+++ b/include/exec/tswap.h
@@ -11,15 +11,15 @@
 #include "qemu/bswap.h"
 
 /**
- * target_words_bigendian:
- * Returns true if the (default) endianness of the target is big endian,
- * false otherwise. Note that in target-specific code, you can use
- * TARGET_BIG_ENDIAN directly instead. On the other hand, common
- * code should normally never need to know about the endianness of the
- * target, so please do *not* use this function unless you know very well
- * what you are doing!
+ * qemu_binary_is_bigendian: Returns QEMU binary default endianness
+ *
+ * Returns whether the QEMU binary is built for big endianness flavor
+ * by default.
+ * vCPUs use this flavor by default when their endianness is not specified.
+ *
+ * This is not a clear API so please do *not* use this function.
  */
-bool target_words_bigendian(void);
+bool qemu_binary_is_bigendian(void);
 
 /*
  * If we're in target-specific code, we can hard-code the swapping
@@ -28,7 +28,7 @@ bool target_words_bigendian(void);
 #ifdef COMPILING_PER_TARGET
 #define target_needs_bswap()  (HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN)
 #else
-#define target_needs_bswap()  (HOST_BIG_ENDIAN != target_words_bigendian())
+#define target_needs_bswap()  (HOST_BIG_ENDIAN != qemu_binary_is_bigendian())
 #endif /* COMPILING_PER_TARGET */
 
 static inline uint16_t tswap16(uint16_t s)
diff --git a/cpu-target.c b/cpu-target.c
index 499facf7747..ff8c55a810a 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -463,7 +463,7 @@ out:
 }
 #endif
 
-bool target_words_bigendian(void)
+bool qemu_binary_is_bigendian(void)
 {
     return TARGET_BIG_ENDIAN;
 }
diff --git a/disas/disas-common.c b/disas/disas-common.c
index de61f6d8a12..7377de0715c 100644
--- a/disas/disas-common.c
+++ b/disas/disas-common.c
@@ -61,7 +61,7 @@ void disas_initialize_debug_target(CPUDebug *s, CPUState *cpu)
 
     s->cpu = cpu;
     s->info.print_address_func = print_address;
-    if (target_words_bigendian()) {
+    if (qemu_binary_is_bigendian()) {
         s->info.endian = BFD_ENDIAN_BIG;
     } else {
         s->info.endian =  BFD_ENDIAN_LITTLE;
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 2a9a2a4eb54..4b85face02b 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -129,7 +129,7 @@ bool cpu_virtio_is_big_endian(CPUState *cpu)
     if (cc->sysemu_ops->virtio_is_big_endian) {
         return cc->sysemu_ops->virtio_is_big_endian(cpu);
     }
-    return target_words_bigendian();
+    return qemu_binary_is_bigendian();
 }
 
 GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index ea8628b8926..abdd4c08a38 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -134,7 +134,7 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
         s->cpu = first_cpu;
     }
 
-    big_endian = target_words_bigendian();
+    big_endian = qemu_binary_is_bigendian();
 
     if (s->file) {
         AddressSpace *as = s->cpu ? s->cpu->as :  NULL;
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 6dbbbf49073..6be02006000 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -2116,7 +2116,7 @@ static bool vga_endian_state_needed(void *opaque)
      * default one, thus ensuring backward compatibility for
      * migration of the common case
      */
-    return s->big_endian_fb != target_words_bigendian();
+    return s->big_endian_fb != qemu_binary_is_bigendian();
 }
 
 static const VMStateDescription vmstate_vga_endian = {
@@ -2264,7 +2264,7 @@ bool vga_common_init(VGACommonState *s, Object *obj, Error **errp)
      * into a device attribute set by the machine/platform to remove
      * all target endian dependencies from this file.
      */
-    s->big_endian_fb = target_words_bigendian();
+    s->big_endian_fb = qemu_binary_is_bigendian();
 
     vga_dirty_log_start(s);
 
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index f12c4aa81eb..b3dede476ed 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2248,7 +2248,7 @@ int virtio_set_status(VirtIODevice *vdev, uint8_t val)
 
 static enum virtio_device_endian virtio_default_endian(void)
 {
-    if (target_words_bigendian()) {
+    if (qemu_binary_is_bigendian()) {
         return VIRTIO_DEVICE_ENDIAN_BIG;
     } else {
         return VIRTIO_DEVICE_ENDIAN_LITTLE;
diff --git a/system/qtest.c b/system/qtest.c
index 12703a20455..8675a0bd316 100644
--- a/system/qtest.c
+++ b/system/qtest.c
@@ -704,7 +704,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         qtest_send(chr, "OK\n");
     } else if (strcmp(words[0], "endianness") == 0) {
         qtest_send_prefix(chr);
-        if (target_words_bigendian()) {
+        if (qemu_binary_is_bigendian()) {
             qtest_sendf(chr, "OK big\n");
         } else {
             qtest_sendf(chr, "OK little\n");
-- 
2.45.2


