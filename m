Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pO0Vv-0008OR-Er
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 13:10:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Vj-0007vC-Mn
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:10:11 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Vg-0008J1-6x
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:10:06 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso4492276wmq.5
 for <qemu-riscv@nongnu.org>; Fri, 03 Feb 2023 10:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V3znBLdxa21Tu18faQjYPm9R9046mIKBOmimiGYT9hQ=;
 b=O9roaJhEXXpqBmpuEROKq4byJ3gg9i32m9326CRmwk5Z2eMo+raTyxMmOce8qMDguv
 8946eIACsPWOsgTQN22QNcIKWYdJtSiqjnoajHZS2CJ6+0NPbXQbyO/r5oviwbMXEMQd
 Ms/GBnz2HaMYwUzjGDvEoTs+dtB+eYaO/xCu3wVWWZBb7Uk+8xKFIyAPcwZoLaEGtvoF
 YbZTbqsBiyoyCdb4xsmL+8ERvhOz8msQsCWR5T1LMq++CJ6MtkR6u+RXcvVMHuZ95tEx
 TnPyFq4lyochTvrqdvSxRkyz7J/M6WKEbbmJ/bGKGAqkC0SrktWOp4431aMaSIe64wpz
 hKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V3znBLdxa21Tu18faQjYPm9R9046mIKBOmimiGYT9hQ=;
 b=vXK1+mBnXq/qN0WU5ZX1FtsOXicshH3fJwaVjMu4O3dOf4ewgnIXVPIXpFSrJ5uWJ/
 yYUD6h/yKgg/QyOFSO6OKFUxZJ+Q+yz9HFiWaMYxUTbx1gHZ/6HxFwoMz6szVjpseTSR
 hxyvOhchUQC0j3m4qyKZsI2+YbjliibsouzYkbV6gpex/8LkvVqGXjPLVU7NWKU/ewnm
 y4Xfip/ilMOqboAjUdy8ErMWrMgBvSTTiaHNI0hs55hbz9eUtanrymghihHnTrjYI3GE
 QsXMtSiqe96at6gVEKXO/b1SLUOjVKwYFDJsZkEFw11T7iGffye+KGqv/9ZoVzRW0oJS
 ijQg==
X-Gm-Message-State: AO0yUKXvyH7nie6QaXNEnHc1Us0g1/JSq/eSuCxXR5Ko4ObVQemAtQLJ
 RAsNCD2+u16tjBgNKyRjGxVxHg==
X-Google-Smtp-Source: AK7set9NL5a+FFgyX1a3I/l8mgjiOBdU7iem7k9+E0R/9i38oJbOq40wh97b2gHXU6yyseB4GvBEkw==
X-Received: by 2002:a05:600c:474f:b0:3df:e57d:f4d0 with SMTP id
 w15-20020a05600c474f00b003dfe57df4d0mr3636532wmo.26.1675447802797; 
 Fri, 03 Feb 2023 10:10:02 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c459100b003dee8c5d814sm8834578wmo.24.2023.02.03.10.10.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:10:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>
Subject: [PATCH 09/19] hw/virtio: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:04 +0100
Message-Id: <20230203180914.49112-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 03 Feb 2023 18:10:15 -0000

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/virtio-gpu-pci.c  | 4 ++--
 hw/display/virtio-vga.c      | 4 ++--
 hw/virtio/virtio-iommu-pci.c | 3 +--
 hw/virtio/virtio-rng.c       | 3 +--
 4 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
index 93f214ff58..a2de06962b 100644
--- a/hw/display/virtio-gpu-pci.c
+++ b/hw/display/virtio-gpu-pci.c
@@ -39,8 +39,8 @@ static void virtio_gpu_pci_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     }
 
     for (i = 0; i < g->conf.max_outputs; i++) {
-        object_property_set_link(OBJECT(g->scanout[i].con), "device",
-                                 OBJECT(vpci_dev), &error_abort);
+        qdev_prop_set_link(DEVICE(g->scanout[i].con), "device",
+                           OBJECT(vpci_dev));
     }
 }
 
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index e6fb0aa876..1652d74657 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -160,8 +160,8 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     graphic_console_set_hwops(vga->con, &virtio_vga_base_ops, vvga);
 
     for (i = 0; i < g->conf.max_outputs; i++) {
-        object_property_set_link(OBJECT(g->scanout[i].con), "device",
-                                 OBJECT(vpci_dev), &error_abort);
+        qdev_prop_set_link(DEVICE(g->scanout[i].con), "device",
+                           OBJECT(vpci_dev));
     }
 }
 
diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index 7ef2f9dcdb..f7edcb39db 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -67,8 +67,7 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
         return;
     }
 
-    object_property_set_link(OBJECT(dev), "primary-bus",
-                             OBJECT(pbus), &error_abort);
+    qdev_prop_set_link(DEVICE(dev), "primary-bus", OBJECT(pbus));
 
     virtio_pci_force_virtio_1(vpci_dev);
     qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
diff --git a/hw/virtio/virtio-rng.c b/hw/virtio/virtio-rng.c
index 7e12fc03bf..6733e5b017 100644
--- a/hw/virtio/virtio-rng.c
+++ b/hw/virtio/virtio-rng.c
@@ -205,8 +205,7 @@ static void virtio_rng_device_realize(DeviceState *dev, Error **errp)
         /* The child property took a reference, we can safely drop ours now */
         object_unref(default_backend);
 
-        object_property_set_link(OBJECT(dev), "rng", default_backend,
-                                 &error_abort);
+        qdev_prop_set_link(dev, "rng", default_backend);
     }
 
     vrng->rng = vrng->conf.rng;
-- 
2.38.1


