Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pO0VZ-0007jv-IY
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 13:09:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0VY-0007gd-1V
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:09:56 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0VW-0008GK-EF
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:09:55 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so6573716wmb.4
 for <qemu-riscv@nongnu.org>; Fri, 03 Feb 2023 10:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HN76CBKBfX1G0l+y+g6vAhVD6/TboUIvvYwPXW3Iexo=;
 b=m1WjmgwMPOsNtLA5YA0t19cIA3HGnEQVECoOhLU6AGpzzoZQbcGqpC0JvenMkr52s3
 +nXpucNnq828lAZTK+n3yA3GMjt4hoBXVPrlEm8NOds3KrxM6x63NJxhDptUlqTEof2H
 5Pv9svm6Qdyjxjr7FFrxZ1nUGGg6V2EOysUSqxPFc+SlY3JDuIsbW9K0ftIHSjOWo2Aj
 rAQv87SvACTrrEY82Ch7p3q9Dij2pnj6OQfJAUI0Wyo4cV9hc/bCA3j25ofvY9GVqEDV
 m375OaiEzlgiKCsxl/n5c5MDU5+Tc9HIYlEZ9iH8QtFK3YcukSCoVH5tWdwmnCyVnyar
 nezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HN76CBKBfX1G0l+y+g6vAhVD6/TboUIvvYwPXW3Iexo=;
 b=U4G7q0kO0JXW+IN+4hGA7GjXDfgJo7o2ktJF0nS3H5h6NwnX7mSyHLRVrE3nFeN7kq
 VkvO7mgtbLS9tzklbKTjzVyXrPU1uOVS7sqWZqC4vDh9MlfBpx7IuBgAhZgnVWWxrGiv
 3XMqVaS/a7mmpP68Dne8sJTLFipxIdlYYpez078Hvwt5if/1thXBHcqC+2XOYwQelXzb
 /7FiBygBnHfNcBINEiOZOETMDlmwS/Wm4ta/SK9yKc7nMCvc6uGU/UpzB7kXDfQv9D6R
 YwPHMTnQBXteoTPGt9M7KDHbmEIHvw/NOmC9XSWsFUCqEeG7O9whmSLS/YHst70aWkQU
 9vig==
X-Gm-Message-State: AO0yUKUXMU58MbhJRPAQuv1ztkRNGAncJPFUYJCB2VLxD8ln3VS/tE9j
 PDY/XAd0fhf9wln3Kyih90NcGw==
X-Google-Smtp-Source: AK7set9ZxRRFo1CGOLjJgso2lFux2GQWoL4HdyvxVNVLGANu3XJ/bTjpWeRz06io18MYKc5dhIxKLg==
X-Received: by 2002:a1c:f307:0:b0:3dc:50be:9206 with SMTP id
 q7-20020a1cf307000000b003dc50be9206mr11541740wmq.4.1675447792935; 
 Fri, 03 Feb 2023 10:09:52 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a5d4449000000b002c3cf230b60sm2184162wrr.73.2023.02.03.10.09.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:09:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [RFC PATCH 07/19] hw/scsi: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:02 +0100
Message-Id: <20230203180914.49112-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Fri, 03 Feb 2023 18:09:56 -0000

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/scsi/scsi-bus.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index ceceafb2cd..a8003126c4 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -347,11 +347,7 @@ SCSIDevice *scsi_bus_legacy_add_drive(SCSIBus *bus, BlockBackend *blk,
         object_unparent(OBJECT(dev));
         return NULL;
     }
-    if (!object_property_set_bool(OBJECT(dev), "share-rw", share_rw, errp)) {
-        object_unparent(OBJECT(dev));
-        return NULL;
-    }
-
+    qdev_prop_set_bit(dev, "share-rw", share_rw);
     qdev_prop_set_enum(dev, "rerror", rerror);
     qdev_prop_set_enum(dev, "werror", werror);
 
-- 
2.38.1


