Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pO0Vu-0008Ib-OX
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 13:10:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Ve-0007nq-H8
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:10:09 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Va-0008Gt-U1
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:10:00 -0500
Received: by mail-wr1-x434.google.com with SMTP id y1so5408825wru.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Feb 2023 10:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8vovJOcxBVU6DoLhiHtjRCI4bXKmNwzDO1xetqBbwJw=;
 b=UOROVGJf2LhPr752Dw/+I93w8jyObbZA3IhAvPk00odJTomcoFC44+VlywzefzTQBI
 87UOdzz6xjb3/z/Ugj3dHNwazZt3412OTsoijUEPdpUp3MBFD7cH/6bhCR93Oimgr3gn
 hIhsa1QlaaC8RTcuQafvT4FTWWrinb1RaHh9Spr8Jw5wKNAitKVz2wLDnQ+e555kKLLv
 AqcGsxNra2OcpD6xxVviE4L0YwJ1GnLN2VGeyW0ylWgc7UCY607BbK7njSwVVNduiAoG
 42IQvlighScOqCP5CeI0+K/sIHTT28zzDnBRXMZbFRHtSH9igpqtd/kIbuR+6dUT86Pd
 PAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8vovJOcxBVU6DoLhiHtjRCI4bXKmNwzDO1xetqBbwJw=;
 b=4cugPWHhXn+dp319VULPynhD/Ou0zpI/7QElWcDyiziFYucdQckG+LRT/4wAdYyF0s
 VicM/OAHYs1wKpvPSKG6X2QNve33ZHVrWnWnslsN+HGoWR74nT50wskv9tnnl83HMSwN
 cfN/5AjR5xDtw3+LOQHHi0owLqt9MqDr3SlrKZWyHIoTwcRg37HkI0ensVHAz/cInHsp
 nw+GhLZeO1Mu9rzEl2lp/gZ5vnvNjnUs+fM+Q4369bP/jtkZl9TnCUpR4U7KtU3g3Rfi
 2JEyEEPImaOelDF10gbYw4c7tS7xwAXpnLj0qhVnMity56LybfLwfVsfQgLN7I8AfEHW
 tH2g==
X-Gm-Message-State: AO0yUKWYMZtYjrtEbru/oxqnmTK/53zAVP5hDBBzSq6ILYvfATQDFgTk
 KsKP3q/e7zMe+7aqjYBMNWNrlQ==
X-Google-Smtp-Source: AK7set/hD9U6wHMO4gsaTyNxz1UIQHivzSkcKTC59mR9ACtZMldDtSDx+5HfrHQZaG9PK1iG6a9nFA==
X-Received: by 2002:a5d:456e:0:b0:2c3:db61:20ec with SMTP id
 a14-20020a5d456e000000b002c3db6120ecmr719672wrc.23.1675447797782; 
 Fri, 03 Feb 2023 10:09:57 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4d10000000b002bbed1388a5sm2528636wrt.15.2023.02.03.10.09.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:09:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 08/19] hw/usb: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:03 +0100
Message-Id: <20230203180914.49112-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
X-List-Received-Date: Fri, 03 Feb 2023 18:10:14 -0000

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-xhci-pci.c    | 2 +-
 hw/usb/hcd-xhci-sysbus.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
index 643d4643e4..7511af4ce2 100644
--- a/hw/usb/hcd-xhci-pci.c
+++ b/hw/usb/hcd-xhci-pci.c
@@ -115,7 +115,7 @@ static void usb_xhci_pci_realize(struct PCIDevice *dev, Error **errp)
     dev->config[PCI_CACHE_LINE_SIZE] = 0x10;
     dev->config[0x60] = 0x30; /* release number */
 
-    object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), NULL);
+    qdev_prop_set_link(DEVICE(&s->xhci), "host", OBJECT(s));
     s->xhci.intr_update = xhci_pci_intr_update;
     s->xhci.intr_raise = xhci_pci_intr_raise;
     if (!qdev_realize(DEVICE(&s->xhci), NULL, errp)) {
diff --git a/hw/usb/hcd-xhci-sysbus.c b/hw/usb/hcd-xhci-sysbus.c
index faf57b4797..d73c71015b 100644
--- a/hw/usb/hcd-xhci-sysbus.c
+++ b/hw/usb/hcd-xhci-sysbus.c
@@ -36,7 +36,7 @@ static void xhci_sysbus_realize(DeviceState *dev, Error **errp)
 {
     XHCISysbusState *s = XHCI_SYSBUS(dev);
 
-    object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), NULL);
+    qdev_prop_set_link(DEVICE(&s->xhci), "host", OBJECT(s));
     if (!qdev_realize(DEVICE(&s->xhci), NULL, errp)) {
         return;
     }
-- 
2.38.1


