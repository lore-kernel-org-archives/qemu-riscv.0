Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48019E7718E
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 22:19:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tPqk9-0002DA-SW; Mon, 23 Dec 2024 17:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tPqji-000215-UZ
 for qemu-riscv@nongnu.org; Mon, 23 Dec 2024 17:17:18 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tPqjd-0006xz-QB
 for qemu-riscv@nongnu.org; Mon, 23 Dec 2024 17:17:11 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso45699675e9.2
 for <qemu-riscv@nongnu.org>; Mon, 23 Dec 2024 14:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734992228; x=1735597028;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qw9Ap9MzAofQSmvBtZk/PM+/8Z9AYBMY7VkjFbhHfB4=;
 b=klt39jszSm61snLkuI0i5Uflsa5j49cPejytQM4s6qwdL1nUy9BmhXtO2OiKbM372h
 ZYxWKl/WxyqsNJI8J9XNGW0A6P0AM8yUGCgGf9w/8kbEbaTc1wmZ3hd/CYYoAB+7KAvf
 s1vvc4GNQUpPrMLQNB2Hce1TA5TWSFUZRTbPJJ6ZHJKgD9TiK8aCIqeW79nsM94sZv3x
 YKRHABnZNmYxeEKC45F16C77vh2d7y4XjimMaRJWX0g5T9/qfVoFbHtIBpDXb+59TOYR
 jeaqj3r4jsVmfRQwmJHO1M/vVmh7V07RwSJ0Ec944lmr3oFAtcUR/AiPOcfoRgwpAQ6K
 pdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734992228; x=1735597028;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qw9Ap9MzAofQSmvBtZk/PM+/8Z9AYBMY7VkjFbhHfB4=;
 b=w7ZACRUO0frpHtmMRY+xrxAjLX6hjkUEK2PlQTFLV+e5WD/eTgowFiFEYQoUnAVg3L
 4xov0K/+dKbv2satvJOHF3ZfZu+u5pdorS9KFvhRECBmDuoAoNPgH7zoKrCj+fKcgdfT
 CQlCpdOJRZhaalanJEfAGNzbyo8ZV4PeP0WsfrVVf4aRDlXCdmEPJy4pyXycK9Fw8wBT
 3WvmcSnTtuw/KnZN5rn165ytrsnnEctVZaoT9b5k0Z7M7znyzRtaZSvLXNhONTl/uDRt
 D08EPY9sPVrX32Rhgw/i9I92oH+BBC41LIDb1iO6CEyz5VB3hm2SfN0YwoeyioKxu2tK
 EAqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb2zg56GXDeqAI9nzzmOUp803k7NRuQvxrFyliuqBjHgY40LzMQ/YRSN0oPtXmuEmPJL85x/z6DQyM@nongnu.org
X-Gm-Message-State: AOJu0YwYPvrf4WWV3pPtgTuoLPso2RAgZOFVopJSSepD1R0JO5zOBfhn
 G16WQUSk/tdJvuoZ9J3XbKN0s8Iirq4h/1jTVsmNR/bD+0I68OQitikmAJ8WfQ==
X-Gm-Gg: ASbGncuerr26qAmPoMI7vHOeZ5YyY0bxZYUXZ5oA4Jvo/w9/XeFay/sHfrjRWxAH4DU
 lRi1aEMQwes1jPzLpOY+7s/TDTaxsHOktvhXlIyUDZIH3zP2IAKH7q2ReYR8uIlbaARc1cg47aA
 3Ms3v6S1n8WeWxOdeX26K3rskDwDk1ThbrtmmFVXefE4980c/t50D8XdHs+RpNUC9ZgCXZqDiB4
 vkWMVgD0q+ejjHwBW9uYXtLwnya2C3GxrXmLhqRRRIbDKQbH4TKi+/JH9fbnr1zJQWC3eEnDPLg
 V/1lbCDGnHqXVHzVuIucQ4PeQkckJ0xP
X-Google-Smtp-Source: AGHT+IGhL6L/m6Bulwe+bA/0BACNUfVEWFl95xfZUgL6cKFfpFibZEWCDOTSpjO34YpTzdLfib4gQA==
X-Received: by 2002:a05:600c:3b0c:b0:434:f5d1:f10f with SMTP id
 5b1f17b1804b1-43668645f1cmr130793155e9.17.1734992228218; 
 Mon, 23 Dec 2024 14:17:08 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611fc161sm147561075e9.10.2024.12.23.14.17.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 23 Dec 2024 14:17:07 -0800 (PST)
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
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, Alexander Graf <graf@amazon.com>
Subject: [PATCH v16 06/14] hw: Add vmapple subdir
Date: Mon, 23 Dec 2024 23:16:37 +0100
Message-Id: <20241223221645.29911-7-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241223221645.29911-1-phil@philjordan.eu>
References: <20241223221645.29911-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::32a;
 envelope-from=phil@philjordan.eu; helo=mail-wm1-x32a.google.com
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

From: Alexander Graf <graf@amazon.com>

We will introduce a number of devices that are specific to the vmapple
target machine. To keep them all tidily together, let's put them into
a single target directory.

Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 MAINTAINERS             | 7 +++++++
 hw/Kconfig              | 1 +
 hw/meson.build          | 1 +
 hw/vmapple/Kconfig      | 1 +
 hw/vmapple/meson.build  | 0
 hw/vmapple/trace-events | 2 ++
 hw/vmapple/trace.h      | 1 +
 meson.build             | 1 +
 8 files changed, 14 insertions(+)
 create mode 100644 hw/vmapple/Kconfig
 create mode 100644 hw/vmapple/meson.build
 create mode 100644 hw/vmapple/trace-events
 create mode 100644 hw/vmapple/trace.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2101b51217..e220744abf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2785,6 +2785,13 @@ F: hw/hyperv/hv-balloon*.h
 F: include/hw/hyperv/dynmem-proto.h
 F: include/hw/hyperv/hv-balloon.h
 
+VMapple
+M: Alexander Graf <agraf@csgraf.de>
+M: Phil Dennis-Jordan <phil@philjordan.eu>
+S: Maintained
+F: hw/vmapple/*
+F: include/hw/vmapple/*
+
 Subsystems
 ----------
 Overall Audio backends
diff --git a/hw/Kconfig b/hw/Kconfig
index 1b4e9bb07f..2871784cfd 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -41,6 +41,7 @@ source ufs/Kconfig
 source usb/Kconfig
 source virtio/Kconfig
 source vfio/Kconfig
+source vmapple/Kconfig
 source xen/Kconfig
 source watchdog/Kconfig
 
diff --git a/hw/meson.build b/hw/meson.build
index b827c82c5d..9c4f6d0d63 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -39,6 +39,7 @@ subdir('ufs')
 subdir('usb')
 subdir('vfio')
 subdir('virtio')
+subdir('vmapple')
 subdir('watchdog')
 subdir('xen')
 subdir('xenpv')
diff --git a/hw/vmapple/Kconfig b/hw/vmapple/Kconfig
new file mode 100644
index 0000000000..8b13789179
--- /dev/null
+++ b/hw/vmapple/Kconfig
@@ -0,0 +1 @@
+
diff --git a/hw/vmapple/meson.build b/hw/vmapple/meson.build
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/hw/vmapple/trace-events b/hw/vmapple/trace-events
new file mode 100644
index 0000000000..9ccc579048
--- /dev/null
+++ b/hw/vmapple/trace-events
@@ -0,0 +1,2 @@
+# See docs/devel/tracing.rst for syntax documentation.
+
diff --git a/hw/vmapple/trace.h b/hw/vmapple/trace.h
new file mode 100644
index 0000000000..572adbefe0
--- /dev/null
+++ b/hw/vmapple/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_vmapple.h"
diff --git a/meson.build b/meson.build
index e62251c7ca..1b77955d46 100644
--- a/meson.build
+++ b/meson.build
@@ -3587,6 +3587,7 @@ if have_system
     'hw/usb',
     'hw/vfio',
     'hw/virtio',
+    'hw/vmapple',
     'hw/watchdog',
     'hw/xen',
     'hw/gpio',
-- 
2.39.5 (Apple Git-154)


