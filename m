Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DA2E7717F
	for <qemu-riscv@archiver.kernel.org>; Sun,  8 Dec 2024 20:26:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tKNny-0002I2-S0; Sun, 08 Dec 2024 15:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKNnu-0002Df-VC
 for qemu-riscv@nongnu.org; Sun, 08 Dec 2024 15:22:59 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKNns-00084N-MT
 for qemu-riscv@nongnu.org; Sun, 08 Dec 2024 15:22:58 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9f1d76dab1so341149366b.0
 for <qemu-riscv@nongnu.org>; Sun, 08 Dec 2024 12:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1733689375; x=1734294175;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yFaB4PcpJ8M8FmLVWUEWYODg72B+6C+aetlV/ZwIxaU=;
 b=2BhaxJPT8+nsUjQ4T4wil5DeNV7H7UZCjXKcZrKKfGW2fu2wEOAdjBvIKdsTKJggLv
 qQNn7UUvLmvTEcEfMqU0JDY1a7rQ68W8Pj2X0RN2u0Aruzs44gaWnfYe3OAeSXf13Wau
 Pa/V0Vk8FfzV7I7Igy6GAm5oeJgWWxDEewaDZYnQVKyuiOGcJK+Gztrw7Xb70Wv5YWOy
 nA6YlSVbUrzxUUvwe1bgyIv6BPx0FuNKGUh3inBDM8pcGu+YdEZn62BLS5qzVPjcjfOv
 d2Za6CgzqCnxELV9WQLaz3UccHPCMennHypjChoA3nsq90Z/SxqMQcMc6SQSRo2nFZJ2
 RMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733689375; x=1734294175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yFaB4PcpJ8M8FmLVWUEWYODg72B+6C+aetlV/ZwIxaU=;
 b=avluFyqgDgJ4v/+Z3+GzU83PZwQU84H3d9AfYN5kyhq1z9p7CupaAbFnqNBpF/qfBa
 tt+ZYzQ60Yatexy1R0frNQc8NcDTIAOhRT4OhqtNgI7nf7ORSDAN4sjjTb9yFSNgH2N9
 YRTg5U5OrzY9dO/PfhoYI2rznPsZih0mfoW7z/uI2Y/tDQMyLHtNTXO2LbhBH5i5Uc74
 /kyWSqSIj8eTI5z5zWdABNijyPdshXT3yihOUNJeuXyC1mmbmAd44+R3ZA7k5V4XjLCZ
 1+btkeRD25s6KlBDMwHDZr/mST2Dlv19nw4pdmQWSCgqnoMU+pzP9R7WSSYDfa+1Xcbp
 XtJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF8SprwHqWrMUXEgIlDnBZMKFVcqMXUmX76fQ/NIoncq9hojmO5fLbNXYffKJ0ZbynwyfONWUf1W2E@nongnu.org
X-Gm-Message-State: AOJu0YyXbdtiEC/lcxQ6GI9LNGJgKQcHqhq5M+ofjQMNL6CMFjheKgbr
 7fqct1kgoPFHjhZFACCR32EVoy+h7HgEwirAbixr7G4ekgQaEvGT0svBiyabMg==
X-Gm-Gg: ASbGncs6g+FKCA2rU27wfYVjiFzj1A4vo7flFTdQpFtC0BAFZL15pgJku+quohJEKrO
 C8mHIg/QNdsdDvNfrBw+p3xkPbn8bGLWhKXzufnq9TcodtzgCi1foDgXBhEfZvVJvKZ8m8BFlbm
 8c1jz4U8CUrwiMdGtWP+kLINnfr5MsXHGCODqG1QqfSuq8gDfv7Zyfd3OEOeNeYfwDalFGHioH+
 kAVTr4tz5m2gvvZ1Dp0cM5pfbhOxYLZ4jH4ASx639wwXOcxmQK/3TQy4r2l0V0Hw/iM8Ba2IFQM
 dHNECI+p0agicaMLQMToY1bzmA==
X-Google-Smtp-Source: AGHT+IGls4MEqFq6xqQpby551YBXNsiQcO6j24u3lPjSmIZmO9Durr/VgxkrvQV85hBAjPCd7Gq7qg==
X-Received: by 2002:a17:907:7848:b0:aa6:7adc:718a with SMTP id
 a640c23a62f3a-aa67adc72d5mr258852266b.8.1733689375322; 
 Sun, 08 Dec 2024 12:22:55 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa625e4eee4sm585759266b.26.2024.12.08.12.22.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 08 Dec 2024 12:22:55 -0800 (PST)
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
Date: Sun,  8 Dec 2024 21:22:29 +0100
Message-Id: <20241208202238.68873-7-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241208202238.68873-1-phil@philjordan.eu>
References: <20241208202238.68873-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::634;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x634.google.com
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


