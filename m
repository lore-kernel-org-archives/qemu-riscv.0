Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lb71E-00008D-W7
	for mharc-qemu-riscv@gnu.org; Mon, 26 Apr 2021 15:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71C-0008Uw-WC
 for qemu-riscv@nongnu.org; Mon, 26 Apr 2021 15:35:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71A-0008Uq-CY
 for qemu-riscv@nongnu.org; Mon, 26 Apr 2021 15:35:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619465739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eMSZjv63DbKN4jYT+FhVyP0Dhkg/kXBNBsFuwQnf2tE=;
 b=Ri1FPl/Z+NZ6urhbFkRe/krdWGo+JEaw+o6LKCo3mZDI3M4V71JAZkkaCOIv9anbXQmbXe
 E9FVpJpldHg54M2B0UxwyoOZcHFN2gKJk+VsMdhusuDjuWI36w4/xvHjmIbiPA/592k6kH
 adVM2HY2tfKwTgitvquEgX0vkADVBJk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-Zi4IyumJNXO_MwKnpo0noQ-1; Mon, 26 Apr 2021 15:35:37 -0400
X-MC-Unique: Zi4IyumJNXO_MwKnpo0noQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 o14-20020a5d474e0000b029010298882dadso19481176wrs.2
 for <qemu-riscv@nongnu.org>; Mon, 26 Apr 2021 12:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eMSZjv63DbKN4jYT+FhVyP0Dhkg/kXBNBsFuwQnf2tE=;
 b=TjfU42IkmXTD0bbnkBQnorRUQi5SJEsmLIhLw1bn5FcCX4eJ4iVyPff0BPGj7veaVL
 Lnnkmwv2CXZfPYXX1PLUs1bhOVj0Wc8yns32QU/4GQmCqdpqcu2antqEiVR1GX2O6RGU
 HEoTTgo8GkTHtWbnWsd9uhXq0Ra5KmtoZynVL/GaGAykhVln3ycf2gHske6NWar9S5sZ
 9T7AANxUOIulsZn3uZYYeJtVfbW0rNgiWW4R7YDUCr61yufwH2zzh+DAvU8uZuNah0E8
 buP8JC0RjK8K+X7+SxeO1LvBdpG0D1pmIKVKAaRIPy9KVIsxUfJUYowPfP/5uKpHuLTA
 aRTQ==
X-Gm-Message-State: AOAM530yJAVhYQMPWJ4Vk/hYdsYnqzxeddMIS/l+08eH2wN0GQGwCqYx
 /QJGqty6AH0aSkjUgCwyWon0yeqQwck+EFuUupNZGTCnNcX7na/+MVE6GA6qDLYfAQ02tahMzgr
 Z2rzoYH9sJpj1iQ4=
X-Received: by 2002:adf:e60e:: with SMTP id p14mr24413107wrm.427.1619465736735; 
 Mon, 26 Apr 2021 12:35:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCarOUwZMLYiZkUvUXG/efo8ACPEIazzLFmUDWCbopLkFW0zGGmVl7g4PbDhOalnBj4dY8Ew==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr24413088wrm.427.1619465736601; 
 Mon, 26 Apr 2021 12:35:36 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g6sm1548706wrr.63.2021.04.26.12.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:35:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 Laszlo Ersek <lersek@redhat.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 3/7] hw/nvram: Declare FW_CFG_DMA Kconfig symbol in hw/nvram/
Date: Mon, 26 Apr 2021 21:35:16 +0200
Message-Id: <20210426193520.4115528-4-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
X-List-Received-Date: Mon, 26 Apr 2021 19:35:43 -0000

fw_cfg related files are maintained in hw/nvram/, so it makes
sense to declare the FW_CFG_DMA Kconfig symbol there, along
with the FW_CFG one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/Kconfig | 3 ---
 hw/nvram/Kconfig   | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index ca46b5830e7..0e4bb596c43 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -6,9 +6,6 @@ config DDC
 config EDID
     bool
 
-config FW_CFG_DMA
-    bool
-
 config VGA_CIRRUS
     bool
     default y if PCI_DEVICES
diff --git a/hw/nvram/Kconfig b/hw/nvram/Kconfig
index cab1070375f..59fac45c315 100644
--- a/hw/nvram/Kconfig
+++ b/hw/nvram/Kconfig
@@ -1,6 +1,10 @@
 config FW_CFG
     bool
 
+config FW_CFG_DMA
+    bool
+    select FW_CFG
+
 config DS1225Y
     bool
 
-- 
2.26.3


