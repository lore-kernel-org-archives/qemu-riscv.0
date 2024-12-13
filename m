Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1627AE7717F
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 15:26:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tM7SH-000525-Jk; Fri, 13 Dec 2024 10:19:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7RW-0004Ph-Ht
 for qemu-riscv@nongnu.org; Fri, 13 Dec 2024 10:19:03 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7RK-00057O-DC
 for qemu-riscv@nongnu.org; Fri, 13 Dec 2024 10:18:59 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5d3d2a30afcso3172446a12.3
 for <qemu-riscv@nongnu.org>; Fri, 13 Dec 2024 07:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734103129; x=1734707929;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yFaB4PcpJ8M8FmLVWUEWYODg72B+6C+aetlV/ZwIxaU=;
 b=UunRVQg3Zo2inyoYra3kzuxw43PP82QAr9hItAlnc98CPBbGqjkwnyhb7mcGRX5D3/
 +afHDJLg5ZU4Xex8mnhUoDYHEtNUUUKn7JpVgv7AFDwccilMskMmXQbLm04d96iRCcQY
 FTk170Eyq6AIf+HxAt1OnIai4g37Ui/K4MisRGMGP+poVb8+sgbnf5rRzTVxN/+4p4UF
 bQ0sYiGgTTWd71KwQQnWcPnaqfACSQ3rEZ02Vw72w8zdxEQpvLWwdoq0Rzh6nYprwzSd
 EsQE21oXOrGZBs1KsN17RYMlxYUwKK14A5Oel75HJ7cVptJG2Rll0byrnqt1QKAtR9Ve
 akyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734103129; x=1734707929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yFaB4PcpJ8M8FmLVWUEWYODg72B+6C+aetlV/ZwIxaU=;
 b=e7LEHTveggzEmwBJhkFEfteOWcuEeDA4/zZUkuAmqTo6GjoOYuoO4SK5mammjjRNUz
 1qkTlCV4u7qGp58xghiQQDiXp6BcwEO4yDgMrgtZMpvKRN+VMiBD4Q06yeX57A6O8vrz
 +CaRq9U4sOFcG70C2CQnj8kixgQ3Ut4noWzraUSKtsmLiDk2rKRT5GsdiRrlsmE7XLUq
 1z07QBvSUDNQ0c4TaD7znV2AxJmy020eD+6ifoqrHXjfDS48r3ig7NNMdMbrSV7y5B2E
 TiGzEG7tYdAi9uIu1qcq7ILcVg+j66tg64017yBORQlndgNkvnBorOIdGRrTcqD3j9Nm
 xqzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL+vIniYO0tp2C5r3KqsO2SHZqj+B9+Xz7o+IB4FYcgGZCvwZ0riHMbZlTUaNFmILn/ckjQj8a5lU+@nongnu.org
X-Gm-Message-State: AOJu0Yz3irMZ5nBag3TtBggJoY+oCMe0N+eM2ZGr/iwX1utq7suzKwRo
 VLH12mXOUvqNADMmvWIAQAaN+fptOLlN1Z0y5AhUk6AZs7L0AzhBJd2JVW+l1Q==
X-Gm-Gg: ASbGnctaLyQlLi0gm1kdN4//kXVOFCyy/VLt9WWAwHsdRAxKGwaJmUCua3YTsoVeu8Z
 JbgGsgQ5ivW4n4Hn1cj8uMER+aWFugcn7Qyg7uo4fD9cQFaKFT7a8E3Gl9wL44wEJjoXZkDPfVq
 45OkY0Amlk0xk3R5w3PqCavwOGr7g6DRFbLxk+v3PIRRlZhflsoxIwLLTTvZYoGOYDnan9I3bUu
 IyFqI/Lt2zqZ/CGhJ4L4LMlaagBIoRZa7RoZPrmtt8qOqKi3MN4rMiNEDHg0PZ+4EDO0+gCR8Xb
 rYJe56mcgRcDrFfecSXjsv5DhE+q5aDg
X-Google-Smtp-Source: AGHT+IHtX383rqhbaJrINyKhm/0MiPO55YvqVor11Iihz0QxkBNJbA6Xzz8Kp0ukBOV2CFUyFqhheA==
X-Received: by 2002:a17:907:6d0d:b0:aa6:993a:259f with SMTP id
 a640c23a62f3a-aab77e8a866mr286048266b.40.1734103128511; 
 Fri, 13 Dec 2024 07:18:48 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab8dd35b19sm29284166b.33.2024.12.13.07.18.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 07:18:48 -0800 (PST)
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
Subject: [PATCH v13 06/15] hw: Add vmapple subdir
Date: Fri, 13 Dec 2024 16:17:56 +0100
Message-Id: <20241213151821.65748-7-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241213151821.65748-1-phil@philjordan.eu>
References: <20241213151821.65748-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::52d;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_NEUTRAL=0.779,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
index 09899f7407e..b6019220662 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2765,6 +2765,13 @@ F: hw/hyperv/hv-balloon*.h
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
index 1303664e167..bce1d21eec1 100644
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


