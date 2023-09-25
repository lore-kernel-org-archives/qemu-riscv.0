Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1A7CE7A81
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 14:50:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkmtV-0000ym-M7; Mon, 25 Sep 2023 10:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkmtU-0000xI-0O
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:49:04 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkmtO-0008Ek-A0
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:49:03 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3231df68584so2763425f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 07:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653336; x=1696258136; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DX65lOE/uUVkmtjhIZOisxQvTzydcI84YNB1WXt/J5w=;
 b=DLSJJDlMAheC5yrdgJkt3cUwWZn5TfYvBAC8EPB8sNkKx3xWllzYEUJ53OIpT4yxHv
 9Tfp6ocNl3DrNQRyDuxp+JoeZSURn6o3L6XoUwTgF8CMIeAvZVRd9/MbbUNiPgeUQe0J
 1l9UxlTsDD/ku9rtZyg8R0b/LQjkPhC4Dpb9OULsbZDVtv9Vo+EMj6SAFR3eBnutvunc
 JjA5/wqDQazxlsa39AerE3CtolNze4IusVz9HQFpgNtIlifKvHxqIFAf2j+bfAuOhvtT
 QGkZmmErG12Hhro2fjXkdeV2Ais7+eZJkSHZMK5hv2q2f+6iWHA6DGBolY6rYEoK7Pjz
 YnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653336; x=1696258136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DX65lOE/uUVkmtjhIZOisxQvTzydcI84YNB1WXt/J5w=;
 b=HqWuTkBqOM9oE6cr545+Fwy403r5MO13SsTXD+o4b2iY/1S/s+rrjrq6V5jtVlNOXy
 FSkvra2ifP4yzDDhipNRjoDOyp3y7aBxo2VYW3uVUzfneHL5S9Xa+zxnNOhBMagv4aBu
 8FVoJrD3H+3BriVAxNPbmWZbVcGSRFuoe32QVqvh9IImty5GnenpsDoqRVf4c1JpyN3c
 a9dW8HmoRbSt7qIFiabccC0NZcjjPgU0qdDyddQL8sOJPzHr5IBci6Z2KcnWGQbadYEQ
 SpFnXMYObhBEPC0pHkz1WuScVCX7BV7vndo/9HY+bUJYuhPAg1L+/i8HDmx+3Xep2Bq5
 yagA==
X-Gm-Message-State: AOJu0YzppPzXKu859KX9fYl0zN54Xrwktf1XZEbfSIy4i40rorOGyzaQ
 UlmecpiwXW29IbC4c/JWdLaUzw==
X-Google-Smtp-Source: AGHT+IFzvqpyIuikxt70glWxYNdRhVVnfZu3ojWJqodYYDE8eSxdmKDc6xUQxGVHVfRmayVk112wTg==
X-Received: by 2002:a05:6000:819:b0:323:1689:6607 with SMTP id
 bt25-20020a056000081900b0032316896607mr8161726wrb.5.1695653336162; 
 Mon, 25 Sep 2023 07:48:56 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 ay18-20020a5d6f12000000b003143cb109d5sm2929399wrb.14.2023.09.25.07.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:48:55 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4EBD91FFBD;
 Mon, 25 Sep 2023 15:48:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Nicholas Piggin <npiggin@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 02/31] tests/lcitool: add swtpm to the package list
Date: Mon, 25 Sep 2023 15:48:25 +0100
Message-Id: <20230925144854.1872513-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

We need this to test some TPM stuff.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/cirrus/macos-12.vars                    | 2 +-
 tests/docker/dockerfiles/alpine.docker               | 1 +
 tests/docker/dockerfiles/centos8.docker              | 1 +
 tests/docker/dockerfiles/debian-amd64-cross.docker   | 1 +
 tests/docker/dockerfiles/debian-amd64.docker         | 1 +
 tests/docker/dockerfiles/debian-arm64-cross.docker   | 1 +
 tests/docker/dockerfiles/debian-armhf-cross.docker   | 1 +
 tests/docker/dockerfiles/debian-ppc64el-cross.docker | 1 +
 tests/docker/dockerfiles/debian-s390x-cross.docker   | 1 +
 tests/docker/dockerfiles/fedora-win32-cross.docker   | 1 +
 tests/docker/dockerfiles/fedora-win64-cross.docker   | 1 +
 tests/docker/dockerfiles/fedora.docker               | 1 +
 tests/docker/dockerfiles/opensuse-leap.docker        | 1 +
 tests/docker/dockerfiles/ubuntu2204.docker           | 1 +
 tests/lcitool/libvirt-ci                             | 2 +-
 tests/lcitool/projects/qemu.yml                      | 1 +
 16 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/macos-12.vars
index 80eadaab29..5f3fb346d1 100644
--- a/.gitlab-ci.d/cirrus/macos-12.vars
+++ b/.gitlab-ci.d/cirrus/macos-12.vars
@@ -11,6 +11,6 @@ MAKE='/opt/homebrew/bin/gmake'
 NINJA='/opt/homebrew/bin/ninja'
 PACKAGING_COMMAND='brew'
 PIP3='/opt/homebrew/bin/pip3'
-PKGS='bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson mtools ncurses nettle ninja pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy socat sparse spice-protocol tesseract usbredir vde vte3 xorriso zlib zstd'
+PKGS='bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson mtools ncurses nettle ninja pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy socat sparse spice-protocol swtpm tesseract usbredir vde vte3 xorriso zlib zstd'
 PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme tomli'
 PYTHON='/opt/homebrew/bin/python3'
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index d25649cb4f..42f6928627 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -100,6 +100,7 @@ RUN apk update && \
         sparse \
         spice-dev \
         spice-protocol \
+        swtpm \
         tar \
         tesseract-ocr \
         usbredir-dev \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 68bfe606f5..d97c30e96a 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -107,6 +107,7 @@ RUN dnf distro-sync -y && \
         socat \
         spice-protocol \
         spice-server-devel \
+        swtpm \
         systemd-devel \
         systemtap-sdt-devel \
         tar \
diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index 0991938595..00bdc06021 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
@@ -55,6 +55,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sed \
                       socat \
                       sparse \
+                      swtpm \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index 61dbc3ff24..9b50fb2f63 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -124,6 +124,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sed \
                       socat \
                       sparse \
+                      swtpm \
                       systemtap-sdt-dev \
                       tar \
                       tesseract-ocr \
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index 74eabb274e..2dae3777f7 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -55,6 +55,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sed \
                       socat \
                       sparse \
+                      swtpm \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index 1ebd6ebd00..180ed836e6 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -55,6 +55,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sed \
                       socat \
                       sparse \
+                      swtpm \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index 59091fed02..d6be2f0cc5 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -55,6 +55,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sed \
                       socat \
                       sparse \
+                      swtpm \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index 48b2f28310..ec0041d6aa 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -55,6 +55,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sed \
                       socat \
                       sparse \
+                      swtpm \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index afa988574f..08799219f9 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -55,6 +55,7 @@ exec "$@"\n' > /usr/bin/nosync && \
                socat \
                sparse \
                spice-protocol \
+               swtpm \
                tar \
                tesseract \
                tesseract-langpack-eng \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index cf93a0ca60..f8e4cb70d3 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -55,6 +55,7 @@ exec "$@"\n' > /usr/bin/nosync && \
                socat \
                sparse \
                spice-protocol \
+               swtpm \
                tar \
                tesseract \
                tesseract-langpack-eng \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index f00e9e267c..9e9c71fa94 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -118,6 +118,7 @@ exec "$@"\n' > /usr/bin/nosync && \
                sparse \
                spice-protocol \
                spice-server-devel \
+               swtpm \
                systemd-devel \
                systemtap-sdt-devel \
                tar \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index ed04b4d6da..dc0e36ce48 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -100,6 +100,7 @@ RUN zypper update -y && \
            socat \
            sparse \
            spice-protocol-devel \
+           swtpm \
            systemd-devel \
            systemtap-sdt-devel \
            tar \
diff --git a/tests/docker/dockerfiles/ubuntu2204.docker b/tests/docker/dockerfiles/ubuntu2204.docker
index 94c2c16118..2ca9cff79c 100644
--- a/tests/docker/dockerfiles/ubuntu2204.docker
+++ b/tests/docker/dockerfiles/ubuntu2204.docker
@@ -124,6 +124,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sed \
                       socat \
                       sparse \
+                      swtpm \
                       systemtap-sdt-dev \
                       tar \
                       tesseract-ocr \
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index e3ed1e5da1..36bc517161 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit e3ed1e5da101943e53d8d89424e17b22120743f5
+Subproject commit 36bc517161c45ead20224d47f2dc4fa428af6724
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index 6f0885170d..82092c9f17 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -110,6 +110,7 @@ packages:
  - spice-protocol
  - spice-server
  - ssh-client
+ - swtpm
  - systemd
  - tar
  - tesseract
-- 
2.39.2


