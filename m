Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lb71C-0008TW-HV
	for mharc-qemu-riscv@gnu.org; Mon, 26 Apr 2021 15:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71A-0008Nh-8d
 for qemu-riscv@nongnu.org; Mon, 26 Apr 2021 15:35:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb717-0008Sf-Ai
 for qemu-riscv@nongnu.org; Mon, 26 Apr 2021 15:35:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619465736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m3J2o1342PI/Nwq9CiNtPMcwkrmRbYFAeBct1A9GlkY=;
 b=ARCUG6HCTCM8kbuI7KMPQ6bPGBFFd2UshP7XIYU487in/wiLznWPEry3RDEwlrUMzvHks/
 fqgZItsdUdlxq1MRb8lse4IZx7+kDWxXPnCNXELRCtpMbvRxmFJyB8Rk/9KLr5yEb2E38J
 1IVqzrLsId15Cq3m8qfdumjMMHxzULE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-IUP7H748MlObYQBUBnVQQQ-1; Mon, 26 Apr 2021 15:35:33 -0400
X-MC-Unique: IUP7H748MlObYQBUBnVQQQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 d15-20020a5d538f0000b02901027c18c581so19343605wrv.3
 for <qemu-riscv@nongnu.org>; Mon, 26 Apr 2021 12:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m3J2o1342PI/Nwq9CiNtPMcwkrmRbYFAeBct1A9GlkY=;
 b=Lzz8H9tT2DmpRIbn9xLjRSaZYUtHqmQ5g0pETAvmBzn6p8Uom0oUYjMqitkmqc8+Vs
 mOcUxZIQojvr34mz5JrYIdvZ8zAPvOFMrYrlVeOU0LUyOlFalqiP4b9f5gINYEv4mDDQ
 MYQ5HX5Fiw2a2qqZSNM/vIH9gYf+oeQ1KC1KVMrg51e8lIl95G/eMjKhiC9AdZbOh+Pf
 iufTNV5P6ocP0qp6pb9DCern8x7nStAPx6ajFsjoiYXkg8XRgEtxIFZoPETfjXJMDwUP
 HKuKQSx6kDypJ5XRC+dxY7u/4eR9Y4V7V4q1jYQJTbt97+u/COCzuehWzhF7T55TK5IV
 679Q==
X-Gm-Message-State: AOAM533ZxozBY2/oa9p43HU/haMxEuNgPEtRt0k8hHqia5V2rW1Nytgf
 BFJwLSgra/aJi0TiZIzZKptHspYo86Ypzk7tjdTmgQ4Yo3gD/fq8+O62Z42QRTL1TFDo+/T0xp7
 13g6tKz04LFXGS2s=
X-Received: by 2002:a05:600c:2cd6:: with SMTP id
 l22mr14768506wmc.160.1619465732098; 
 Mon, 26 Apr 2021 12:35:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXqNoDYJSJBVuKEOCsjaj69O8GsYv1GJb+RSGtbi7V1NKSZMRw/Y6KTl0UTxKt42tLmXa42A==
X-Received: by 2002:a05:600c:2cd6:: with SMTP id
 l22mr14768489wmc.160.1619465731909; 
 Mon, 26 Apr 2021 12:35:31 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id i11sm1269242wrp.56.2021.04.26.12.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:35:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 Laszlo Ersek <lersek@redhat.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH 2/7] hw/nvram: Rename FW_CFG_MIPS as generic FW_CFG Kconfig
 symbol
Date: Mon, 26 Apr 2021 21:35:15 +0200
Message-Id: <20210426193520.4115528-3-philmd@redhat.com>
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
X-List-Received-Date: Mon, 26 Apr 2021 19:35:40 -0000

Targets using the fw_cfg device might have architecture specific
keys. If so, they define the fw_cfg_arch_key_name() function.

The use of FW_CFG_MIPS is not MIPS-specific, it is simply the
architectural implementation. Rename it using the generic 'FW_CFG'
and move the Kconfig declaration in hw/nvram/ where fw_cfg code
is maintained.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/mips/Kconfig     | 5 +----
 hw/mips/meson.build | 2 +-
 hw/nvram/Kconfig    | 3 +++
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index aadd436bf4e..bbc6b9c1d11 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -42,7 +42,7 @@ config LOONGSON3V
     select PCI_DEVICES
     select PCI_EXPRESS_GENERIC_BRIDGE
     select MSI_NONBROKEN
-    select FW_CFG_MIPS
+    select FW_CFG
 
 config MIPS_CPS
     bool
@@ -50,6 +50,3 @@ config MIPS_CPS
 
 config MIPS_BOSTON
     bool
-
-config FW_CFG_MIPS
-    bool
diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index 1195716dc73..893e56f7453 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -1,6 +1,6 @@
 mips_ss = ss.source_set()
 mips_ss.add(files('bootloader.c', 'mips_int.c'))
-mips_ss.add(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg.c'))
+mips_ss.add(when: 'CONFIG_FW_CFG', if_true: files('fw_cfg.c'))
 mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
 mips_ss.add(when: 'CONFIG_LOONGSON3V', if_true: files('loongson3_bootp.c', 'loongson3_virt.c'))
 mips_ss.add(when: 'CONFIG_JAZZ', if_true: files('jazz.c'))
diff --git a/hw/nvram/Kconfig b/hw/nvram/Kconfig
index e872fcb1941..cab1070375f 100644
--- a/hw/nvram/Kconfig
+++ b/hw/nvram/Kconfig
@@ -1,3 +1,6 @@
+config FW_CFG
+    bool
+
 config DS1225Y
     bool
 
-- 
2.26.3


