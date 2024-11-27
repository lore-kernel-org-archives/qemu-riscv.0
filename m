Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085F2D6ACE3
	for <qemu-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 15:05:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tGJbe-00087a-GW; Wed, 27 Nov 2024 10:05:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tGJbG-0007dj-I9
 for qemu-riscv@nongnu.org; Wed, 27 Nov 2024 10:05:08 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tGJbE-0007kN-1E
 for qemu-riscv@nongnu.org; Wed, 27 Nov 2024 10:05:05 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-434a83c6b01so13867845e9.0
 for <qemu-riscv@nongnu.org>; Wed, 27 Nov 2024 07:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1732719902; x=1733324702;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T+1N1WNsO1ozJ1n5opD5J6tWjylgLKYonMfqmT6MS/c=;
 b=KmWTsEaAnFGY0S06YQxmgFtkXqT/XjR5MHjkWbwpz16LpTgcrC94DpS2jvhligLrgO
 DddQNzq1gmpBtcZUdfnynEs8nYqnk5lIl40QqCEFmWOQDxayREFzW5/uhVjskp9/D3AL
 dWBrDLf+rkQLFejBAwNjfVJoJjMQGYYr37P5GPLf6UOr8wi+/KRNtu3onXEczHk/gsat
 ucyZHakqeAx/OyitYWjeiryIAvPEm8PTMGk9mNR94RGCIwaGqyT4v1HpXIDZ2ZFuZpw6
 K5Vby989Dtz50a/4JL0gNxcRVZ4eCWAAiGRX3wI6s/EE29/l1scqPOZz56CbN0Tp+A9p
 MqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732719902; x=1733324702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T+1N1WNsO1ozJ1n5opD5J6tWjylgLKYonMfqmT6MS/c=;
 b=K4H9IMxDXYoRSix9P8GgaAE6UMkqnC5QFa5cYhqjCNIPmTnoK1mC86wX19MqMDkkGR
 44PhnMM2FuU5uVxLlMxdr+XRDqPDkqnTHvJd2BkezVJESzvopNr5QJN4JR7kVjJSs7ro
 wgDxl4Jf/swipgF8Abw3iecbLhnKwQ0gpTUWFakv8lm7pqbnXCP5Cl4tx8lJ2dKKWkxV
 TYf4VuqXY9Ysitxj8qu2NCW1Th9dM5oBZZchHRRsSodLvdGlUNvVt3il7OqGkurctP2t
 cZyZitv3nVYqp3BlufDrD/7h35Zhn9E//Ku4whTwuPLT9HaeTtCtVxRb1WZtboz0GL8V
 yE1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJzgZ3y8nzSIf6aXWLnsVvk6uq4Mr0sD/ehNCewNMo9AEBk6gH/l0H3LCTtUv0Ip1POsZWZP2L2ZLC@nongnu.org
X-Gm-Message-State: AOJu0YxPGafDQTm7Y9QUnLQ+486S2U2Oj9+0KPXweE+/ybcJXHI/elJI
 7FvrNPlLzlMODe4kWfNEAPmSV7xI/q1rax4qGdVa7Q4dQuEcUZn/Gsj7peNKrg==
X-Gm-Gg: ASbGncug2m9PTUqTtOLYD5i8CRGriZh20ejkMMm+IXY85GxBcTscfDXC2f8BHi4uoQY
 ujUkMMAcFV0dP8DXicgYc+W2QYHSqmlEGV3b55DZAg1TBh1sVLFFTpISAe+Y5OePyzFaBGGZ8Um
 QUtUOcoAIyWLWtaORK7Bckvc9Y8H5QT2G12zQS7J+lSXga491wbiWUTCCvjudnHhmBhzFtxMFud
 QRbv8iQWUVArPNAKDh5rY6yS/Ka7je8TtMTNY14vGy6hcxt8jVCPD3iw9eM2nTR1ZVEOkF112cU
 QQ3rA9bO6bm9/LRajCxL0mEfBw==
X-Google-Smtp-Source: AGHT+IFwaOLVnMJ9dv8zGMupojXDJRBUBxxLNdvCe2XsUmO5aHeZMLkJ41ARkks3jRlM8CPIQSsqbQ==
X-Received: by 2002:a05:600c:4587:b0:434:9e17:18e4 with SMTP id
 5b1f17b1804b1-434a9d4926dmr33202175e9.0.1732719887324; 
 Wed, 27 Nov 2024 07:04:47 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7e256esm23339155e9.32.2024.11.27.07.04.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 27 Nov 2024 07:04:46 -0800 (PST)
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
Subject: [PATCH v11 06/15] hw: Add vmapple subdir
Date: Wed, 27 Nov 2024 16:02:40 +0100
Message-Id: <20241127150249.50767-7-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241127150249.50767-1-phil@philjordan.eu>
References: <20241127150249.50767-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::334;
 envelope-from=phil@philjordan.eu; helo=mail-wm1-x334.google.com
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
index 08780eca5d1..9e7fc6c050a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2763,6 +2763,13 @@ F: hw/hyperv/hv-balloon*.h
 F: include/hw/hyperv/dynmem-proto.h
 F: include/hw/hyperv/hv-balloon.h
 
+VMapple
+M: Alexander Graf <agraf@csgraf.de>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
+S: Maintained
+F: hw/vmapple/*
+F: include/hw/vmapple/*
+
 Subsystems
 ----------
 Overall Audio backends
diff --git a/hw/Kconfig b/hw/Kconfig
index 1b4e9bb07f7..2871784cfdc 100644
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
index b827c82c5d7..9c4f6d0d636 100644
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
index 00000000000..8b137891791
--- /dev/null
+++ b/hw/vmapple/Kconfig
@@ -0,0 +1 @@
+
diff --git a/hw/vmapple/meson.build b/hw/vmapple/meson.build
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/hw/vmapple/trace-events b/hw/vmapple/trace-events
new file mode 100644
index 00000000000..9ccc5790487
--- /dev/null
+++ b/hw/vmapple/trace-events
@@ -0,0 +1,2 @@
+# See docs/devel/tracing.rst for syntax documentation.
+
diff --git a/hw/vmapple/trace.h b/hw/vmapple/trace.h
new file mode 100644
index 00000000000..572adbefe04
--- /dev/null
+++ b/hw/vmapple/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_vmapple.h"
diff --git a/meson.build b/meson.build
index 3c61238bc77..a5f76f27c12 100644
--- a/meson.build
+++ b/meson.build
@@ -3592,6 +3592,7 @@ if have_system
     'hw/usb',
     'hw/vfio',
     'hw/virtio',
+    'hw/vmapple',
     'hw/watchdog',
     'hw/xen',
     'hw/gpio',
-- 
2.39.5 (Apple Git-154)


