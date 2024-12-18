Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52A3E7718A
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 16:24:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNwoJ-0008Ee-TF; Wed, 18 Dec 2024 11:22:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tNwnx-0007vl-OM
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:21:45 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tNwnY-0006sQ-CX
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:21:45 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fc01so3519666a12.2
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 08:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734538878; x=1735143678; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6UOxR9mHFC4u/8ZQKvQLQtYEWlgMJY9tIWZpiZZUDDA=;
 b=FT7nZTJrmuqalQrzecENrHZ4kPXSnnQFOK/F+T9r1DMpAmt3/INsUJSaMiiTYfNpHQ
 RK2Qy8wcH7Ymj3q4/jhwrOu/IhnE9wqUKjEXF0331Bi/afzuAmMuHogF3YTcjD3Tdq2E
 EhWpdSxWiuQwF+h1uZM8EPA457lXK63oyljIcUNYPLn17RTJjT9e4dfihuLoAAZ0RqiV
 analnDz0TIXL5CyWLRN+aSSbHHla1LowloyY8z/Vbha9ZAT9GyQ9HJm198SG5IRynkAS
 FwohZfuusXZk+4ruvFb+wlwHeaBzmwFhneOX/HYcVLjSpBvoAAZpykxjIGf8opuwdhb4
 qGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734538878; x=1735143678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6UOxR9mHFC4u/8ZQKvQLQtYEWlgMJY9tIWZpiZZUDDA=;
 b=Pz5P66FCJmkyOa1ar8HPomeTB1eSScJQHqshgKS79xeY6UUvf2S5ZwMTMGSlkf2uWV
 Q+Wxk7ur6f86JCQ9ruGUyPU3g3K8t8ZNcEZGNUhQeu9+MxSh7nNDrgrsH11bRw1pTP9A
 iclKolAPqhCSFq5dUDZVGWzgiIZcTUJ1nOroXxGN5xSoCFumkJm9dtsfCzNJknEEj7Jf
 ZJamez4EzY55H8xyzI5QQFHnnrz2XUtT11WQ98S3V41398rQo6u76l0OW32O1rsZmymy
 fQ33EfxwCCCp/MzgDCf1SIusTtpR9TSnA1xQZKGR2UE6jJfWpKsjGw/ffGunUSt2pEB3
 Q0Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEbHCnnYMklkb3REuncrHEJibY9tWhrG7bM5zJjRqOpeeFZI0lV7jYAvbdAwhWpqtBetoxkjEfEAMo@nongnu.org
X-Gm-Message-State: AOJu0Yw7YDyxGDw2dVP0KyFotfEP/me5xwZ8+bBxCL/lJbOMu9lfddWc
 FrWXDy9ACtrTgGVMQ4oTX4UlpaBkxyCOYuNsac7X2voc59BS4B/EV3VTsJ6nU1Y=
X-Gm-Gg: ASbGncsx014q6t2yea9CFs5TpAFKFKBmw+Ze6QVwYWlTd9ztTHaVaVYInh+50/qvCEl
 wATNZkzlSWpzb628O7MmK7csp03QnvG1oLUkq2gp6/82cPPZLAY/4c9Hzphb8OSZxz9qHvbZcR7
 0UcimAq5hP72uK2tSZZu/EYrU6DcF6aIk1agDvUU2UgnShRMit/1FoJ7TXTtxLVrOYdwV1YEt54
 jSf+I3rirz5ThEUw6sTJo4RIcfk4ekORAhDVpWGpE+Z/GzH4+tgWeQ=
X-Google-Smtp-Source: AGHT+IFUsU+f13bfPJMrD3lOWdIN7256Es7OHOr1fpoMcMexTS6rtVzttc2avyLYRgG5gEOHJlJSdA==
X-Received: by 2002:a17:906:310d:b0:aa6:2704:4840 with SMTP id
 a640c23a62f3a-aabf48fd3b2mr273562266b.51.1734538878515; 
 Wed, 18 Dec 2024 08:21:18 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab96068a8bsm575047766b.76.2024.12.18.08.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 08:21:15 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5F3A65FB2E;
 Wed, 18 Dec 2024 16:21:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Fabiano Rosas <farosas@suse.de>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Weiwei Li <liwei1518@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-arm@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 23/27] tests/lcitool: remove temp workaround for debian
 mips64el
Date: Wed, 18 Dec 2024 16:20:59 +0000
Message-Id: <20241218162104.3493551-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218162104.3493551-1-alex.bennee@linaro.org>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Daniel P. Berrangé <berrange@redhat.com>

The workaround applied in

  commit c60473d29254b79d9437eface8b342e84663ba66
  Author: Alex Bennée <alex.bennee@linaro.org>
  Date:   Wed Oct 2 10:03:33 2024 +0200

    testing: bump mips64el cross to bookworm and fix package list

Is no longer required since the affected builds are now fixed.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20241217133525.3836570-1-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .../dockerfiles/debian-mips64el-cross.docker  |  9 ++++++
 tests/lcitool/mappings.yml                    | 29 -------------------
 2 files changed, 9 insertions(+), 29 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index c09a8da890..9f6c4763c5 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -93,13 +93,18 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       libcmocka-dev:mips64el \
                       libcurl4-gnutls-dev:mips64el \
                       libdaxctl-dev:mips64el \
+                      libdrm-dev:mips64el \
+                      libepoxy-dev:mips64el \
                       libfdt-dev:mips64el \
                       libffi-dev:mips64el \
                       libfuse3-dev:mips64el \
+                      libgbm-dev:mips64el \
                       libgcrypt20-dev:mips64el \
                       libglib2.0-dev:mips64el \
                       libglusterfs-dev:mips64el \
                       libgnutls28-dev:mips64el \
+                      libgtk-3-dev:mips64el \
+                      libgtk-vnc-2.0-dev:mips64el \
                       libibverbs-dev:mips64el \
                       libiscsi-dev:mips64el \
                       libjemalloc-dev:mips64el \
@@ -119,6 +124,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       librbd-dev:mips64el \
                       librdmacm-dev:mips64el \
                       libsasl2-dev:mips64el \
+                      libsdl2-dev:mips64el \
+                      libsdl2-image-dev:mips64el \
                       libseccomp-dev:mips64el \
                       libselinux1-dev:mips64el \
                       libslirp-dev:mips64el \
@@ -134,6 +141,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       libusb-1.0-0-dev:mips64el \
                       libusbredirhost-dev:mips64el \
                       libvdeplug-dev:mips64el \
+                      libvirglrenderer-dev:mips64el \
+                      libvte-2.91-dev:mips64el \
                       libxdp-dev:mips64el \
                       libzstd-dev:mips64el \
                       nettle-dev:mips64el \
diff --git a/tests/lcitool/mappings.yml b/tests/lcitool/mappings.yml
index f8186b0e69..74eb13d62b 100644
--- a/tests/lcitool/mappings.yml
+++ b/tests/lcitool/mappings.yml
@@ -6,23 +6,6 @@ mappings:
   flake8:
     OpenSUSELeap15:
 
-  # Due to https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1081535 we
-  # have to disable all packages that depend on libgl1-mesa-dri:mips64el
-  gtk3:
-    mips64el-deb:
-
-  libdrm:
-    mips64el-deb:
-
-  libepoxy:
-    mips64el-deb:
-
-  gtk-vnc:
-    mips64el-deb:
-
-  mesa-libgbm:
-    mips64el-deb:
-
   meson:
     OpenSUSELeap15:
 
@@ -81,18 +64,6 @@ mappings:
   python3-wheel:
     OpenSUSELeap15: python311-pip
 
-  sdl2:
-    mips64el-deb:
-
-  sdl2-image:
-    mips64el-deb:
-
-  virglrenderer:
-    mips64el-deb:
-
-  vte:
-    mips64el-deb:
-
 pypi_mappings:
   # Request more recent version
   meson:
-- 
2.39.5


