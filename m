Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BDBE7717D
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 15:20:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tM7SF-0004zV-9p; Fri, 13 Dec 2024 10:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7RP-0004P9-IN
 for qemu-riscv@nongnu.org; Fri, 13 Dec 2024 10:18:59 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7RH-000562-Dt
 for qemu-riscv@nongnu.org; Fri, 13 Dec 2024 10:18:54 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa66c1345caso118643466b.3
 for <qemu-riscv@nongnu.org>; Fri, 13 Dec 2024 07:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734103125; x=1734707925;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gqDHKMOlEu3HBZNTrJ3yF3ObzpqK7FWFnJX02jcPijQ=;
 b=YW84ivYtptdEuVLos/kapXeUvcCjJn3MX32cR7t05uCbFIok2i0sOHBUB7d12p5Pdh
 0sKK4kAPlkP9mB3Be6PIlsYOyPu41w2vQLokVwr3WIgK8Y848fTCb0blIFdmU09KICsx
 MociAzyx5cIVCiOUmzwhKM0uKOXa1PV1PQDhup5wIAwcyH3BEzXmdWHfwbrjqa9YMBSJ
 MTVqfGy2LkNSuepV85kQlnrlqY55VZLJw0Glv0fnDHGAsoFKt4R2cFDJMdEszhRviQo2
 QEc0Q5BtdND+C3cC/7/Jdz997Y2RRJ58PJk2od/Hx45QpWQ4w5VgpUWYbnmld283Bu1r
 czRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734103125; x=1734707925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gqDHKMOlEu3HBZNTrJ3yF3ObzpqK7FWFnJX02jcPijQ=;
 b=ZDJphPWgfqcvz6Ku6ogPNJTHyE8cZLD/zTBXqKSQ0IVfUvLia5eiXnTOC80oqgpPil
 Zf19n0q1Ln/+n98Hi7/1lDEuVudtz7VzU2o0k/JGCJyNuI+Ehz160N8AHyrAXx5O8ayJ
 wqSve5bFHbuPpE1/PLlFgaH4sY7RczgprsK6IIt3Yqg4tkVmNHfAHbNeVRcj1H2yelHD
 MmOcAn3lCyuXDQxgGZXUqCNcrkiUwdMGaQjKnsuhQdgG5bfDmo9+NMZtJZtJfIA8vhV2
 9Iv3ScjUGPFTf4I5GEB5U27fM3qND0Z1MlRH9V8koehY1LRaPNDTp3C5GH7xEEbXsJjG
 go6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1Y2HHKJat4lsJr/cJtQoJ3rizs67Ux1LxjImhLh2jpExbzdJWpCGhSoviP/G8eVyx1SYeDfM4YgIo@nongnu.org
X-Gm-Message-State: AOJu0YwMyv2UCUpH0MBpeZ+d/ebdABdYWxbZydsGJlhr+wIgzGb30nyc
 Lg9Ye6G5vNHhq6hdl8w2n3oli5N6CO5NSRwvugIx12GX2c9t9Bp+e6Mr1DLXXw==
X-Gm-Gg: ASbGncu/5/3gRZuYMGQ7m7lEFjMlkfe4ZK0aEtVQqWOU3ci/Vyd+ONIMu9b48Zi00ZW
 WOsyGXFOaeeWr6Uh0XgvJHqxFl9OXnzElOZE9Hof0RJKGnJ9xMlJ9CJZK9Jr4C8TpBKrK5ncgNI
 lmNDqC4Ivxg/k4MbvHHuI5UXD/QxAI5tvDiRPIgcXvbYh5ZYrGx6kUHQiKPJe6flX8l4xYTCwX5
 oUZPZ7wh7fu69/RNjZXfs+VpmcECJPnXwEn8hBcWf1SJCEJi6fyHZJNrsW9ncTVeXQNUYi/ipUN
 l5Y3RhXiJUutdA8CBYEayR/YmKzExGCO
X-Google-Smtp-Source: AGHT+IHsre1uf1bY28+Fn8S2p+Yue2C2yaapKMH+3Ch5MEKQareUN02+vOl5U1fO7yogcKoSRnhNuQ==
X-Received: by 2002:a17:907:3dab:b0:aa6:9372:cac7 with SMTP id
 a640c23a62f3a-aab779b1333mr390447366b.31.1734103124710; 
 Fri, 13 Dec 2024 07:18:44 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab8dd35b19sm29284166b.33.2024.12.13.07.18.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 07:18:44 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu
Subject: [PATCH v13 04/15] hw/display/apple-gfx: Adds configurable mode list
Date: Fri, 13 Dec 2024 16:17:54 +0100
Message-Id: <20241213151821.65748-5-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241213151821.65748-1-phil@philjordan.eu>
References: <20241213151821.65748-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::635;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x635.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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

This change adds a property 'display_modes' on the graphics device
which permits specifying a list of display modes. (screen resolution
and refresh rate)

The property is an array of a custom type to make the syntax slightly
less awkward to use, for example:

-device '{"driver":"apple-gfx-pci", "display-modes":["1920x1080@60", "3840x2160@60"]}'

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---

v4:

 * Switched to the native array property type, which recently gained
	 command line support.
 * The property has also been added to the -mmio variant.
 * Tidied up the code a little.

v5:

 * Better error handling and buffer management in property parsing and
   output.

v6:

 * Switched to using NSMutableArray for the mode list to avoid need for
   allocating a temporary array - previously done with alloca.

v7:

 * Simplified error handling in property parsing

v8:

 * More consistent integer variable types.

v9:

 * Re-ordered type definitions so we can drop a 'struct' keyword.

 hw/display/apple-gfx-mmio.m |   8 +++
 hw/display/apple-gfx-pci.m  |   9 ++-
 hw/display/apple-gfx.h      |  11 +++
 hw/display/apple-gfx.m      | 135 +++++++++++++++++++++++++++++++-----
 hw/display/trace-events     |   2 +
 5 files changed, 145 insertions(+), 20 deletions(-)

diff --git a/hw/display/apple-gfx-mmio.m b/hw/display/apple-gfx-mmio.m
index 1a46ff48b75..13052419f09 100644
--- a/hw/display/apple-gfx-mmio.m
+++ b/hw/display/apple-gfx-mmio.m
@@ -258,6 +258,12 @@ static void apple_gfx_mmio_reset(Object *obj, ResetType type)
     [s->common.pgdev reset];
 }
 
+static Property apple_gfx_mmio_properties[] = {
+    DEFINE_PROP_ARRAY("display-modes", AppleGFXMMIOState,
+                      common.num_display_modes, common.display_modes,
+                      qdev_prop_display_mode, AppleGFXDisplayMode),
+    DEFINE_PROP_END_OF_LIST(),
+};
 
 static void apple_gfx_mmio_class_init(ObjectClass *klass, void *data)
 {
@@ -267,6 +273,8 @@ static void apple_gfx_mmio_class_init(ObjectClass *klass, void *data)
     rc->phases.hold = apple_gfx_mmio_reset;
     dc->hotpluggable = false;
     dc->realize = apple_gfx_mmio_realize;
+
+    device_class_set_props(dc, apple_gfx_mmio_properties);
 }
 
 static TypeInfo apple_gfx_mmio_types[] = {
diff --git a/hw/display/apple-gfx-pci.m b/hw/display/apple-gfx-pci.m
index 5ff6a487cfc..765b210287d 100644
--- a/hw/display/apple-gfx-pci.m
+++ b/hw/display/apple-gfx-pci.m
@@ -114,6 +114,13 @@ static void apple_gfx_pci_reset(Object *obj, ResetType type)
     [s->common.pgdev reset];
 }
 
+static Property apple_gfx_pci_properties[] = {
+    DEFINE_PROP_ARRAY("display-modes", AppleGFXPCIState,
+                      common.num_display_modes, common.display_modes,
+                      qdev_prop_display_mode, AppleGFXDisplayMode),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void apple_gfx_pci_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -130,7 +137,7 @@ static void apple_gfx_pci_class_init(ObjectClass *klass, void *data)
     pci->class_id = PCI_CLASS_DISPLAY_OTHER;
     pci->realize = apple_gfx_pci_realize;
 
-    /* TODO: Property for setting mode list */
+    device_class_set_props(dc, apple_gfx_pci_properties);
 }
 
 static TypeInfo apple_gfx_pci_types[] = {
diff --git a/hw/display/apple-gfx.h b/hw/display/apple-gfx.h
index ef2455e3bdc..a1160bf6619 100644
--- a/hw/display/apple-gfx.h
+++ b/hw/display/apple-gfx.h
@@ -16,6 +16,7 @@
 #import <ParavirtualizedGraphics/ParavirtualizedGraphics.h>
 #include "qemu/typedefs.h"
 #include "exec/memory.h"
+#include "hw/qdev-properties.h"
 #include "ui/surface.h"
 
 @class PGDeviceDescriptor;
@@ -27,6 +28,12 @@
 
 typedef QTAILQ_HEAD(, PGTask_s) PGTaskList;
 
+typedef struct AppleGFXDisplayMode {
+    uint16_t width_px;
+    uint16_t height_px;
+    uint16_t refresh_rate_hz;
+} AppleGFXDisplayMode;
+
 typedef struct AppleGFXState {
     /* Initialised on init/realize() */
     MemoryRegion iomem_gfx;
@@ -35,6 +42,8 @@ typedef struct AppleGFXState {
     QemuConsole *con;
     id<MTLDevice> mtl;
     id<MTLCommandQueue> mtl_queue;
+    AppleGFXDisplayMode *display_modes;
+    uint32_t num_display_modes;
 
     /* List `tasks` is protected by task_mutex */
     QemuMutex task_mutex;
@@ -62,5 +71,7 @@ void *apple_gfx_host_ptr_for_gpa_range(uint64_t guest_physical,
                                        uint64_t length, bool read_only,
                                        MemoryRegion **mapping_in_region);
 
+extern const PropertyInfo qdev_prop_display_mode;
+
 #endif
 
diff --git a/hw/display/apple-gfx.m b/hw/display/apple-gfx.m
index bfaff2b2be2..f83ef497bf8 100644
--- a/hw/display/apple-gfx.m
+++ b/hw/display/apple-gfx.m
@@ -31,9 +31,10 @@
 #include "sysemu/dma.h"
 #include "ui/console.h"
 
-static const PGDisplayCoord_t apple_gfx_modes[] = {
-    { .x = 1440, .y = 1080 },
-    { .x = 1280, .y = 1024 },
+static const AppleGFXDisplayMode apple_gfx_default_modes[] = {
+    { 1920, 1080, 60 },
+    { 1440, 1080, 60 },
+    { 1280, 1024, 60 },
 };
 
 static Error *apple_gfx_mig_blocker;
@@ -690,22 +691,24 @@ static void new_frame_handler_bh(void *opaque)
     return disp_desc;
 }
 
-static NSArray<PGDisplayMode*>* apple_gfx_prepare_display_mode_array(void)
+static NSArray<PGDisplayMode *> *apple_gfx_create_display_mode_array(
+    const AppleGFXDisplayMode display_modes[], uint32_t display_mode_count)
 {
-    PGDisplayMode *modes[ARRAY_SIZE(apple_gfx_modes)];
-    NSArray<PGDisplayMode*>* mode_array;
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(apple_gfx_modes); i++) {
-        modes[i] =
-            [[PGDisplayMode alloc] initWithSizeInPixels:apple_gfx_modes[i] refreshRateInHz:60.];
-    }
-
-    mode_array = [NSArray arrayWithObjects:modes count:ARRAY_SIZE(apple_gfx_modes)];
-
-    for (i = 0; i < ARRAY_SIZE(apple_gfx_modes); i++) {
-        [modes[i] release];
-        modes[i] = nil;
+    uint32_t i;
+    PGDisplayMode *mode_obj;
+    NSMutableArray<PGDisplayMode *> *mode_array =
+        [[NSMutableArray alloc] initWithCapacity:display_mode_count];
+
+    for (i = 0; i < display_mode_count; i++) {
+        const AppleGFXDisplayMode *mode = &display_modes[i];
+        trace_apple_gfx_display_mode(i, mode->width_px, mode->height_px);
+        PGDisplayCoord_t mode_size = { mode->width_px, mode->height_px };
+
+        mode_obj =
+            [[PGDisplayMode alloc] initWithSizeInPixels:mode_size
+                                        refreshRateInHz:mode->refresh_rate_hz];
+        [mode_array addObject:mode_obj];
+        [mode_obj release];
     }
 
     return mode_array;
@@ -741,6 +744,9 @@ bool apple_gfx_common_realize(AppleGFXState *s, DeviceState *dev,
                               PGDeviceDescriptor *desc, Error **errp)
 {
     PGDisplayDescriptor *disp_desc;
+    const AppleGFXDisplayMode *display_modes = apple_gfx_default_modes;
+    uint32_t num_display_modes = ARRAY_SIZE(apple_gfx_default_modes);
+    NSArray<PGDisplayMode *> *mode_array;
 
     if (apple_gfx_mig_blocker == NULL) {
         error_setg(&apple_gfx_mig_blocker,
@@ -776,8 +782,99 @@ bool apple_gfx_common_realize(AppleGFXState *s, DeviceState *dev,
                                               port:0
                                          serialNum:next_pgdisplay_serial_num++];
     [disp_desc release];
-    s->pgdisp.modeList = apple_gfx_prepare_display_mode_array();
+
+    if (s->display_modes != NULL && s->num_display_modes > 0) {
+        trace_apple_gfx_common_realize_modes_property(s->num_display_modes);
+        display_modes = s->display_modes;
+        num_display_modes = s->num_display_modes;
+    }
+    s->pgdisp.modeList = mode_array =
+        apple_gfx_create_display_mode_array(display_modes, num_display_modes);
+    [mode_array release];
 
     s->con = graphic_console_init(dev, 0, &apple_gfx_fb_ops, s);
     return true;
 }
+
+/* ------ Display mode list device property ------ */
+
+static void apple_gfx_get_display_mode(Object *obj, Visitor *v,
+                                       const char *name, void *opaque,
+                                       Error **errp)
+{
+    Property *prop = opaque;
+    AppleGFXDisplayMode *mode = object_field_prop_ptr(obj, prop);
+    /* 3 uint16s (max 5 digits) + 2 separator characters + nul. */
+    char buffer[5 * 3 + 2 + 1];
+    char *pos = buffer;
+
+    int rc = snprintf(buffer, sizeof(buffer),
+                      "%"PRIu16"x%"PRIu16"@%"PRIu16,
+                      mode->width_px, mode->height_px,
+                      mode->refresh_rate_hz);
+    assert(rc < sizeof(buffer));
+
+    visit_type_str(v, name, &pos, errp);
+}
+
+static void apple_gfx_set_display_mode(Object *obj, Visitor *v,
+                                       const char *name, void *opaque,
+                                       Error **errp)
+{
+    Property *prop = opaque;
+    AppleGFXDisplayMode *mode = object_field_prop_ptr(obj, prop);
+    const char *endptr;
+    g_autofree char *str = NULL;
+    int ret;
+    int val;
+
+    if (!visit_type_str(v, name, &str, errp)) {
+        return;
+    }
+
+    endptr = str;
+
+    ret = qemu_strtoi(endptr, &endptr, 10, &val);
+    if (ret || val > UINT16_MAX || val <= 0) {
+        error_setg(errp, "width in '%s' must be a decimal integer number "
+                   "of pixels in the range 1..65535", name);
+        return;
+    }
+    mode->width_px = val;
+    if (*endptr != 'x') {
+        goto separator_error;
+    }
+
+    ret = qemu_strtoi(endptr + 1, &endptr, 10, &val);
+    if (ret || val > UINT16_MAX || val <= 0) {
+        error_setg(errp, "height in '%s' must be a decimal integer number "
+                   "of pixels in the range 1..65535", name);
+        return;
+    }
+    mode->height_px = val;
+    if (*endptr != '@') {
+        goto separator_error;
+    }
+
+    ret = qemu_strtoi(endptr + 1, &endptr, 10, &val);
+    if (ret || val > UINT16_MAX || val <= 0) {
+        error_setg(errp, "refresh rate in '%s'"
+                   " must be a positive decimal integer (Hertz)", name);
+        return;
+    }
+    mode->refresh_rate_hz = val;
+    return;
+
+separator_error:
+    error_setg(errp, "Each display mode takes the format "
+               "'<width>x<height>@<rate>'");
+}
+
+const PropertyInfo qdev_prop_display_mode = {
+    .name  = "display_mode",
+    .description =
+        "Display mode in pixels and Hertz, as <width>x<height>@<refresh-rate> "
+        "Example: 3840x2160@60",
+    .get   = apple_gfx_get_display_mode,
+    .set   = apple_gfx_set_display_mode,
+};
diff --git a/hw/display/trace-events b/hw/display/trace-events
index a50e4eea0c0..52786e6e184 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -212,6 +212,8 @@ apple_gfx_cursor_set(uint32_t bpp, uint64_t width, uint64_t height) "bpp=%d widt
 apple_gfx_cursor_show(uint32_t show) "show=%d"
 apple_gfx_cursor_move(void) ""
 apple_gfx_common_init(const char *device_name, size_t mmio_size) "device: %s; MMIO size: %zu bytes"
+apple_gfx_common_realize_modes_property(uint32_t num_modes) "using %u modes supplied by 'display-modes' device property"
+apple_gfx_display_mode(uint32_t mode_idx, uint16_t width_px, uint16_t height_px) "mode %2"PRIu32": %4"PRIu16"x%4"PRIu16
 
 # apple-gfx-mmio.m
 apple_gfx_mmio_iosfc_read(uint64_t offset, uint64_t res) "offset=0x%"PRIx64" res=0x%"PRIx64
-- 
2.39.5 (Apple Git-154)


