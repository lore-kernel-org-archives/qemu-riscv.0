Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lb71S-0000T4-GB
	for mharc-qemu-riscv@gnu.org; Mon, 26 Apr 2021 15:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71M-0000Mn-EG
 for qemu-riscv@nongnu.org; Mon, 26 Apr 2021 15:35:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71H-00007W-De
 for qemu-riscv@nongnu.org; Mon, 26 Apr 2021 15:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619465746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x+XKpQxMkw2M8DAIFtIrFWfOxS/FuauQxHxUVGxBmbM=;
 b=eWS7qBDebk245ZFHgX266rE+IqTuwp+Gxxsd2bvwNEfEtPvsBKvaTGD33RfyTL3XV4SrWh
 2rL2Lq818tx08L9rSfE3WW/WLRdnLm7klqe7jVcfBJDI/DGbKCzgMuskejBTdwdhr9+X0Y
 H4RU+3EiIBC+8MRP5i1YogXoFoJ8G/E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-VABrZRmOPkSJCvtolI9hzw-1; Mon, 26 Apr 2021 15:35:42 -0400
X-MC-Unique: VABrZRmOPkSJCvtolI9hzw-1
Received: by mail-wr1-f71.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so7933732wrm.13
 for <qemu-riscv@nongnu.org>; Mon, 26 Apr 2021 12:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+XKpQxMkw2M8DAIFtIrFWfOxS/FuauQxHxUVGxBmbM=;
 b=BLYZzg4LrYqQqRDGqQaKGumgq9wNq4LWj7mQqUGL7ncHfOmxQT9jTZXEcy4BqJYmKb
 icWTjoODHJ9NVbt6b/kez1sr8f+SzYS3u6T1kv8e7jOpDX5TFh/nEwNvu7YL/llo3btH
 ksdSbCjYkT+J8jdvWhLXTJ5Y4UwN8kW03J7vSr9PxUcbJsuz6gsrI8Zey7lzRMXbAosy
 ja6GMJtVtIgv6/+yNzdywaQAX2fMRHq7OXokX1ATGaKrG74+tGfHjPAEOr9OTHNl7WXG
 R3S712+gpsHu5xZIVlqqpRf6K97lTcW09wARn0eLYS3NWI3EURhK4IcxfehBYQr85QQp
 hk8g==
X-Gm-Message-State: AOAM532tcr1TgbJmbQVUljI1dvJlbfeNU3WaBydjvu15j1PxOCQ+Qt+y
 QnI0sNMxnbg8U5ngwM6mp5qplO+FccbEwZIvY1+SvdsdSlzu8Pkb2qsu6RMG86dVsEKr5Xaqrnv
 J5N+L8Za7WlJspDQ=
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr24807480wrj.328.1619465741716; 
 Mon, 26 Apr 2021 12:35:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5LsAsP1y6BrNfXip0IXbVkC+0/4kOVMzriBhRt6KKd4Uht/h+rhB5NVVIzRkyXBptEBv9Dw==
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr24807460wrj.328.1619465741557; 
 Mon, 26 Apr 2021 12:35:41 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t14sm1292776wrz.55.2021.04.26.12.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:35:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 Laszlo Ersek <lersek@redhat.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH 4/7] hw/acpi/vmgenid: Make ACPI_VMGENID depends on FW_CFG
 Kconfig
Date: Mon, 26 Apr 2021 21:35:17 +0200
Message-Id: <20210426193520.4115528-5-philmd@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 26 Apr 2021 19:35:56 -0000

The TYPE_VMGENID device depends on fw_cfg:

  $ git grep \ fw_cfg hw/acpi/vmgenid.c
  hw/acpi/vmgenid.c:128:    fw_cfg_add_file(s, VMGENID_GUID_FW_CFG_FILE, guid->data,
  hw/acpi/vmgenid.c:131:    fw_cfg_add_file_callback(s, VMGENID_ADDR_FW_CFG_FILE, NULL, NULL, NULL,

Add the proper Kconfig dependency.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/acpi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 1932f66af8d..b9dc932d2a7 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -40,5 +40,6 @@ config ACPI_VMGENID
     bool
     default y
     depends on PC
+    select FW_CFG
 
 config ACPI_HW_REDUCED
-- 
2.26.3


