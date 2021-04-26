Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lb71Y-0000hv-NQ
	for mharc-qemu-riscv@gnu.org; Mon, 26 Apr 2021 15:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71X-0000fn-M0
 for qemu-riscv@nongnu.org; Mon, 26 Apr 2021 15:36:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71U-0000Kj-Gg
 for qemu-riscv@nongnu.org; Mon, 26 Apr 2021 15:36:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619465759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/SwK7FX3kH1UWtK3h3/1AavB3Zp9Tje3hQEQT9u6kU8=;
 b=bTcCzCsJoyopFVbLfDA4rtz0b5ErYzeocUXSq/yL3YKZMHA49TmXByoTd3+F082XVWWgzz
 aW2CYAcJ2QIcNg98NiGN7hkAlyemKIrCOuUdtwVjq6FRr/eFokb9Jjwq73cKwjOb8QcoN5
 3aI66QRgD7o+iNNFqDzEgbFONmuin2Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-gzN-eFBPO16OpWg0LvTSPQ-1; Mon, 26 Apr 2021 15:35:57 -0400
X-MC-Unique: gzN-eFBPO16OpWg0LvTSPQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 d15-20020a5d538f0000b02901027c18c581so19344080wrv.3
 for <qemu-riscv@nongnu.org>; Mon, 26 Apr 2021 12:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/SwK7FX3kH1UWtK3h3/1AavB3Zp9Tje3hQEQT9u6kU8=;
 b=O5zzDUd2Gml9jm1Zi55kgdBCHdm5gc4fTdRd0iSM/d61qP3ynMe5KKSgkVRB+K/6da
 GdqjbKoo2mzPjnA8kSFLj4u9xeli2tDalCMfDvDhKs9XlqyWGOJGI3HdU8cKjxeNdCbl
 uOvEk33FMdQGGSuUcImrROZ6vQvCDpnMhZJXuCLQNcR8oqZ7V/Pi52OMQ1Vg2WVtZfqk
 /g8mfr42tBrWEHI6nOOjikDJJ66YKWMsjnVnSa6QOY0TwVsFmW53kb0t+85gu8x5ZwGk
 xec42Q15U/dJSwvfCmHrItinRpF+WqUTD1zBL+YLtSTeQZ1kOJ46MVzMY8LTw2cxYLZF
 OZoQ==
X-Gm-Message-State: AOAM531J+ZtWv89z3Ypf/INfC0BEBnY3jdKjI/ShhtvbEt00luaO+zyo
 GzCUbYREe2TrU7ICbVv3fZpDFcR8ClNZqxiYuFu/N/KNm/Ln+w6NPITQXRvb6IODT2lk6YFDx72
 WZNIUgA+pUYGAUvU=
X-Received: by 2002:a1c:c911:: with SMTP id f17mr21525706wmb.45.1619465756708; 
 Mon, 26 Apr 2021 12:35:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCXFZJfuCsZD6GeozfGMj7nTkyuZ7WzQqPIkaCKCWCw6PWoyIT0Kn90gGXuY1yLPwpzSQBTQ==
X-Received: by 2002:a1c:c911:: with SMTP id f17mr21525698wmb.45.1619465756518; 
 Mon, 26 Apr 2021 12:35:56 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t63sm18527743wma.20.2021.04.26.12.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:35:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 Laszlo Ersek <lersek@redhat.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 7/7] hw/nvram: Do not build FW_CFG if not required
Date: Mon, 26 Apr 2021 21:35:20 +0200
Message-Id: <20210426193520.4115528-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210426193520.4115528-1-philmd@redhat.com>
References: <20210426193520.4115528-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Apr 2021 19:36:03 -0000

If the Kconfig 'FW_CFG' symbol is not selected, it is pointless
to build the fw_cfg device. Update the stubs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 stubs/fw_cfg.c       | 49 ++++++++++++++++++++++++++++++++++++++++++--
 hw/nvram/meson.build |  2 +-
 2 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/stubs/fw_cfg.c b/stubs/fw_cfg.c
index bb1e3c8aa95..ac1e539c93f 100644
--- a/stubs/fw_cfg.c
+++ b/stubs/fw_cfg.c
@@ -1,7 +1,7 @@
 /*
  * fw_cfg stubs
  *
- * Copyright (c) 2019 Red Hat, Inc.
+ * Copyright (c) 2019,2021 Red Hat, Inc.
  *
  * Author:
  *   Philippe Mathieu-Daudé <philmd@redhat.com>
@@ -13,9 +13,54 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/nvram/fw_cfg.h"
 
-const char *fw_cfg_arch_key_name(uint16_t key)
+FWCfgState *fw_cfg_find(void)
 {
     return NULL;
 }
+
+bool fw_cfg_add_from_generator(FWCfgState *s, const char *filename,
+                               const char *gen_id, Error **errp)
+{
+    error_setg(errp, "fw-cfg device not built in");
+
+    return true;
+}
+
+void fw_cfg_add_file(FWCfgState *s,  const char *filename,
+                     void *data, size_t len)
+{
+    g_assert_not_reached();
+}
+
+void fw_cfg_add_file_callback(FWCfgState *s,  const char *filename,
+                              FWCfgCallback select_cb,
+                              FWCfgWriteCallback write_cb,
+                              void *callback_opaque,
+                              void *data, size_t len, bool read_only)
+{
+    g_assert_not_reached();
+}
+
+void *fw_cfg_modify_file(FWCfgState *s, const char *filename,
+                        void *data, size_t len)
+{
+    g_assert_not_reached();
+}
+
+void fw_cfg_set_order_override(FWCfgState *s, int order)
+{
+    g_assert_not_reached();
+}
+
+void fw_cfg_reset_order_override(FWCfgState *s)
+{
+    g_assert_not_reached();
+}
+
+bool fw_cfg_dma_enabled(void *opaque)
+{
+    g_assert_not_reached();
+}
diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
index fd2951a860f..99e12224483 100644
--- a/hw/nvram/meson.build
+++ b/hw/nvram/meson.build
@@ -1,7 +1,7 @@
 # QOM interfaces must be available anytime QOM is used.
 qom_ss.add(files('fw_cfg-interface.c'))
 
-softmmu_ss.add(files('fw_cfg.c'))
+softmmu_ss.add(when: 'CONFIG_FW_CFG', if_true: files('fw_cfg.c'))
 softmmu_ss.add(when: 'CONFIG_CHRP_NVRAM', if_true: files('chrp_nvram.c'))
 softmmu_ss.add(when: 'CONFIG_DS1225Y', if_true: files('ds1225y.c'))
 softmmu_ss.add(when: 'CONFIG_NMC93XX_EEPROM', if_true: files('eeprom93xx.c'))
-- 
2.26.3


