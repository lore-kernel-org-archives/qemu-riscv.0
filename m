Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED3DC4725D
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:42:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQnAy-0003iJ-1J; Fri, 19 Jan 2024 06:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAw-0003e3-5w
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:36:42 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAu-0002pU-3t
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:36:41 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40e8d3b29f2so7168205e9.1
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664199; x=1706268999; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1bDfprnFlfsfXltzGvRi/dALsYabn5U/Cj2d9HyuVIo=;
 b=h8Cubpe3S+tE5+65/G+uhpZUJZLKVVUWbQtT7wwtTUQU8OABdqnMF21STV8TgzMTpB
 rBu0Yw70GRw+koXNthMmD0slIs2cpNk1bx1Z6piK+XnCu7QVOkePmoZDtD1Y/yITHeP5
 WGg9hyDWmxdZ4xp4OK4kvEUukDAFbULe0TaB+ZKRk/97DYW4mtzUt1g9vDdUEFrIamVD
 N6ZFAg21BybvJr4vYURmHTc+q60KpAPaaPJ4Luu/Wp7EtXNkU8DrF08eMF+F0wYKAdGb
 U3MIzOUkzMgjAyiqli23ybmxb8XpJ5K0GtbCn/raYcz5YQCwPkLTkvTGNW2iWdvDY2VK
 Pf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664199; x=1706268999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1bDfprnFlfsfXltzGvRi/dALsYabn5U/Cj2d9HyuVIo=;
 b=uQeocsR/Dfm1/9nB1uMZ9Xpew/2f37KfI9ASlnKZjkVnOF5W83ZVoS26E28+b+zeLf
 grkPmuTyNt+w0jgVusrsMIxzMyzIbejysTxqEYkw+ifJKqTK3ouwghpJIBe1PDd2FD1F
 POx1I8SW+97G1RoLuO2p4cJvMFAUNRHnLPsDvx8LXw/ihk/38u3tvRW6EKX2UcNO4ZyA
 kZbfNEtLenFL4KNYyW4mqJa3+ku+So3mMyEv8zbHPG3477RGa2PmrqbLDBQYMcR3g9ee
 Ljsu3oyFtOaXtT5AnWDWuO+jssF+SfewzHxFlCrhK7VwjAvKbXY5uneGwpEh/T9aC7Mm
 MVmA==
X-Gm-Message-State: AOJu0YwrGejBsFVyh2ZqmlBIpkQzArpdrrlbzgk0055J2ymrB9sR/aFt
 OttR0IyTbxJGvZUtjKW0SUqyGoCGNo/i8PHTl43fx7p8LKxY2Ijy/yth2vXZ6dw=
X-Google-Smtp-Source: AGHT+IG4O5u9L95Ke2IEnxuqTvJvjGgz+CBHCwnqrlxnxyZLRADIJlXsXZawf3rRKA6P8+NHKR2xZw==
X-Received: by 2002:a05:600c:4313:b0:40d:94da:ff40 with SMTP id
 p19-20020a05600c431300b0040d94daff40mr912937wme.195.1705664198876; 
 Fri, 19 Jan 2024 03:36:38 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 h5-20020a05600c314500b0040e5e21cd7bsm28384501wmo.11.2024.01.19.03.36.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:36:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 20/36] hw/pflash: implement update buffer for block writes
Date: Fri, 19 Jan 2024 12:34:49 +0100
Message-ID: <20240119113507.31951-21-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Gerd Hoffmann <kraxel@redhat.com>

Add an update buffer where all block updates are staged.
Flush or discard updates properly, so we should never see
half-completed block writes in pflash storage.

Drop a bunch of FIXME comments ;)

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240108160900.104835-4-kraxel@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/pflash_cfi01.c | 110 ++++++++++++++++++++++++++++++----------
 hw/block/pflash_cfi02.c |   2 +-
 hw/block/trace-events   |   7 ++-
 3 files changed, 89 insertions(+), 30 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 8434a45cab..f956f8bcf7 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -80,16 +80,39 @@ struct PFlashCFI01 {
     uint16_t ident3;
     uint8_t cfi_table[0x52];
     uint64_t counter;
-    unsigned int writeblock_size;
+    uint32_t writeblock_size;
     MemoryRegion mem;
     char *name;
     void *storage;
     VMChangeStateEntry *vmstate;
     bool old_multiple_chip_handling;
+
+    /* block update buffer */
+    unsigned char *blk_bytes;
+    uint32_t blk_offset;
 };
 
 static int pflash_post_load(void *opaque, int version_id);
 
+static bool pflash_blk_write_state_needed(void *opaque)
+{
+    PFlashCFI01 *pfl = opaque;
+
+    return (pfl->blk_offset != -1);
+}
+
+static const VMStateDescription vmstate_pflash_blk_write = {
+    .name = "pflash_cfi01_blk_write",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pflash_blk_write_state_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_VBUFFER_UINT32(blk_bytes, PFlashCFI01, 0, NULL, writeblock_size),
+        VMSTATE_UINT32(blk_offset, PFlashCFI01),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_pflash = {
     .name = "pflash_cfi01",
     .version_id = 1,
@@ -101,6 +124,10 @@ static const VMStateDescription vmstate_pflash = {
         VMSTATE_UINT8(status, PFlashCFI01),
         VMSTATE_UINT64(counter, PFlashCFI01),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription * const []) {
+        &vmstate_pflash_blk_write,
+        NULL
     }
 };
 
@@ -376,13 +403,55 @@ static void pflash_update(PFlashCFI01 *pfl, int offset,
     }
 }
 
+/* copy current flash content to block update buffer */
+static void pflash_blk_write_start(PFlashCFI01 *pfl, hwaddr offset)
+{
+    hwaddr mask = ~(pfl->writeblock_size - 1);
+
+    trace_pflash_write_block_start(pfl->name, pfl->counter);
+    pfl->blk_offset = offset & mask;
+    memcpy(pfl->blk_bytes, pfl->storage + pfl->blk_offset,
+           pfl->writeblock_size);
+}
+
+/* commit block update buffer changes */
+static void pflash_blk_write_flush(PFlashCFI01 *pfl)
+{
+    g_assert(pfl->blk_offset != -1);
+    trace_pflash_write_block_flush(pfl->name);
+    memcpy(pfl->storage + pfl->blk_offset, pfl->blk_bytes,
+           pfl->writeblock_size);
+    pflash_update(pfl, pfl->blk_offset, pfl->writeblock_size);
+    pfl->blk_offset = -1;
+}
+
+/* discard block update buffer changes */
+static void pflash_blk_write_abort(PFlashCFI01 *pfl)
+{
+    trace_pflash_write_block_abort(pfl->name);
+    pfl->blk_offset = -1;
+}
+
 static inline void pflash_data_write(PFlashCFI01 *pfl, hwaddr offset,
                                      uint32_t value, int width, int be)
 {
     uint8_t *p;
 
-    trace_pflash_data_write(pfl->name, offset, width, value, pfl->counter);
-    p = pfl->storage + offset;
+    if (pfl->blk_offset != -1) {
+        /* block write: redirect writes to block update buffer */
+        if ((offset < pfl->blk_offset) ||
+            (offset + width > pfl->blk_offset + pfl->writeblock_size)) {
+            pfl->status |= 0x10; /* Programming error */
+            return;
+        }
+        trace_pflash_data_write_block(pfl->name, offset, width, value,
+                                      pfl->counter);
+        p = pfl->blk_bytes + (offset - pfl->blk_offset);
+    } else {
+        /* write directly to storage */
+        trace_pflash_data_write(pfl->name, offset, width, value);
+        p = pfl->storage + offset;
+    }
 
     if (be) {
         stn_be_p(p, width, value);
@@ -503,9 +572,9 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             } else {
                 value = extract32(value, 0, pfl->bank_width * 8);
             }
-            trace_pflash_write_block(pfl->name, value);
             pfl->counter = value;
             pfl->wcycle++;
+            pflash_blk_write_start(pfl, offset);
             break;
         case 0x60:
             if (cmd == 0xd0) {
@@ -536,12 +605,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
         switch (pfl->cmd) {
         case 0xe8: /* Block write */
             /* FIXME check @offset, @width */
-            if (!pfl->ro) {
-                /*
-                 * FIXME writing straight to memory is *wrong*.  We
-                 * should write to a buffer, and flush it to memory
-                 * only on confirm command (see below).
-                 */
+            if (!pfl->ro && (pfl->blk_offset != -1)) {
                 pflash_data_write(pfl, offset, value, width, be);
             } else {
                 pfl->status |= 0x10; /* Programming error */
@@ -550,18 +614,8 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             pfl->status |= 0x80;
 
             if (!pfl->counter) {
-                hwaddr mask = pfl->writeblock_size - 1;
-                mask = ~mask;
-
                 trace_pflash_write(pfl->name, "block write finished");
                 pfl->wcycle++;
-                if (!pfl->ro) {
-                    /* Flush the entire write buffer onto backing storage.  */
-                    /* FIXME premature! */
-                    pflash_update(pfl, offset & mask, pfl->writeblock_size);
-                } else {
-                    pfl->status |= 0x10; /* Programming error */
-                }
             }
 
             pfl->counter--;
@@ -573,20 +627,17 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
     case 3: /* Confirm mode */
         switch (pfl->cmd) {
         case 0xe8: /* Block write */
-            if (cmd == 0xd0) {
-                /* FIXME this is where we should write out the buffer */
+            if ((cmd == 0xd0) && !(pfl->status & 0x10)) {
+                pflash_blk_write_flush(pfl);
                 pfl->wcycle = 0;
                 pfl->status |= 0x80;
             } else {
-                qemu_log_mask(LOG_UNIMP,
-                    "%s: Aborting write to buffer not implemented,"
-                    " the data is already written to storage!\n"
-                    "Flash device reset into READ mode.\n",
-                    __func__);
+                pflash_blk_write_abort(pfl);
                 goto mode_read_array;
             }
             break;
         default:
+            pflash_blk_write_abort(pfl);
             goto error_flash;
         }
         break;
@@ -820,6 +871,9 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
     pfl->cmd = 0x00;
     pfl->status = 0x80; /* WSM ready */
     pflash_cfi01_fill_cfi_table(pfl);
+
+    pfl->blk_bytes = g_malloc(pfl->writeblock_size);
+    pfl->blk_offset = -1;
 }
 
 static void pflash_cfi01_system_reset(DeviceState *dev)
@@ -839,6 +893,8 @@ static void pflash_cfi01_system_reset(DeviceState *dev)
      * This model deliberately ignores this delay.
      */
     pfl->status = 0x80;
+
+    pfl->blk_offset = -1;
 }
 
 static Property pflash_cfi01_properties[] = {
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 2a99b286b0..6fa56f14c0 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -546,7 +546,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
                 }
                 goto reset_flash;
             }
-            trace_pflash_data_write(pfl->name, offset, width, value, 0);
+            trace_pflash_data_write(pfl->name, offset, width, value);
             if (!pfl->ro) {
                 p = (uint8_t *)pfl->storage + offset;
                 if (pfl->be) {
diff --git a/hw/block/trace-events b/hw/block/trace-events
index bab21d3a1c..cc9a9f2460 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -12,7 +12,8 @@ fdctrl_tc_pulse(int level) "TC pulse: %u"
 pflash_chip_erase_invalid(const char *name, uint64_t offset) "%s: chip erase: invalid address 0x%" PRIx64
 pflash_chip_erase_start(const char *name) "%s: start chip erase"
 pflash_data_read(const char *name, uint64_t offset, unsigned size, uint32_t value) "%s: data offset:0x%04"PRIx64" size:%u value:0x%04x"
-pflash_data_write(const char *name, uint64_t offset, unsigned size, uint32_t value, uint64_t counter) "%s: data offset:0x%04"PRIx64" size:%u value:0x%04x counter:0x%016"PRIx64
+pflash_data_write(const char *name, uint64_t offset, unsigned size, uint32_t value) "%s: data offset:0x%04"PRIx64" size:%u value:0x%04x"
+pflash_data_write_block(const char *name, uint64_t offset, unsigned size, uint32_t value, uint64_t counter) "%s: data offset:0x%04"PRIx64" size:%u value:0x%04x counter:0x%016"PRIx64
 pflash_device_id(const char *name, uint16_t id) "%s: read device ID: 0x%04x"
 pflash_device_info(const char *name, uint64_t offset) "%s: read device information offset:0x%04" PRIx64
 pflash_erase_complete(const char *name) "%s: sector erase complete"
@@ -32,7 +33,9 @@ pflash_unlock0_failed(const char *name, uint64_t offset, uint8_t cmd, uint16_t a
 pflash_unlock1_failed(const char *name, uint64_t offset, uint8_t cmd) "%s: unlock0 failed 0x%" PRIx64 " 0x%02x"
 pflash_unsupported_device_configuration(const char *name, uint8_t width, uint8_t max) "%s: unsupported device configuration: device_width:%d max_device_width:%d"
 pflash_write(const char *name, const char *str) "%s: %s"
-pflash_write_block(const char *name, uint32_t value) "%s: block write: bytes:0x%x"
+pflash_write_block_start(const char *name, uint32_t value) "%s: block write start: bytes:0x%x"
+pflash_write_block_flush(const char *name) "%s: block write flush"
+pflash_write_block_abort(const char *name) "%s: block write abort"
 pflash_write_block_erase(const char *name, uint64_t offset, uint64_t len) "%s: block erase offset:0x%" PRIx64 " bytes:0x%" PRIx64
 pflash_write_failed(const char *name, uint64_t offset, uint8_t cmd) "%s: command failed 0x%" PRIx64 " 0x%02x"
 pflash_write_invalid(const char *name, uint8_t cmd) "%s: invalid write for command 0x%02x"
-- 
2.41.0


