Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80DFC001E0
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 15:00:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWHwi-0008K6-BS; Wed, 16 Aug 2023 10:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWHwb-00087S-Mo
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 10:56:21 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWHwX-0002aJ-5m
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 10:56:21 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6887bc25e6bso870558b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 07:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197776; x=1692802576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kNR+2DDMQySc8psqEDhnZbBav2KTV36MZCBGyLQQO2o=;
 b=evpaiYh/kzubkZR2LEvG4VlfEB/+ESUZhQuzvrqv2FzLZUi1ZlVlbKPTl5+Y3WJ5IF
 GwP+wG31rpKCLZfDT7PYLZUoPzqFpGsQ6Mr4WKwU3ev1ygDpQX9mj4ipp2W+R09w8pU+
 h7tEu96huRYEiWlqDrz0nVEH+nu+saeNniyUWEmG0e0DAytYRi6sLQeST+uCfLeyEBnw
 6OA9jAw53g2Z1IRiT//KYq7XieIJlCUj51C62gG80/A2axYkPKvtN10wvpaPN9AbiGqe
 smVL78kfe78kZPQz8VL5RPmGFycS9NeTizVcHE0hF+xdJ7Te0ApNheyoN6FbJ1Wij0TJ
 HAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692197776; x=1692802576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kNR+2DDMQySc8psqEDhnZbBav2KTV36MZCBGyLQQO2o=;
 b=DYwtaYnXBZ7bz2RwsRd2HxFkV14favn+l4Kz11WbThTPUTPj1QIR21V/pJUJFmaDTz
 ttcqxAlHl4DyYO7h9vyImftk9QvaOOPG1fL42czNCJ4+XnOX4aPM9b3opaBzIqSDEM+0
 gqSblwqCOfPRD2J2ZKCTXS+ugAZwxWmavzaN8q9ke0UlPFrg/yL+EOhRn60+gZTk1v8K
 jQx/znj2UoYdAUOs86aQvx6QVvEq0XcoSSRwwdLohMT4hIV9CS/PiUPwq8Oz5p8VfA0A
 FIVABK8S940qgE9NKtQSxb8DeBDrl4hLnPduYoqgMvWqbjFdZzv6dK2+B/ysszrExbAj
 rEpA==
X-Gm-Message-State: AOJu0Yz0+0prxrxG5hif3sYOl05jJfPsH4fXULfx+avVcmWwjDTY9JGH
 YmiKhmRbgoJwAlLiYPoe9jAjbg==
X-Google-Smtp-Source: AGHT+IHj4VBiL9fQbCA+nA6FwRS2UMbMOMWOEgPU/2w5xIqhCbB4vG5kAFwTaWFAHVek209udKZFAQ==
X-Received: by 2002:a05:6a21:998f:b0:140:d536:d435 with SMTP id
 ve15-20020a056a21998f00b00140d536d435mr3070477pzb.38.1692197775828; 
 Wed, 16 Aug 2023 07:56:15 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 07:56:15 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Anton Kochkov <anton.kochkov@proton.me>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 25/25] contrib/plugins: Add cc plugin
Date: Wed, 16 Aug 2023 23:51:46 +0900
Message-ID: <20230816145155.21049-26-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::430;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

This demonstrates how to write a plugin in C++.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 docs/devel/tcg-plugins.rst |  8 ++++++++
 configure                  | 15 ++++++++++++---
 contrib/plugins/Makefile   |  5 +++++
 contrib/plugins/cc.cc      | 17 +++++++++++++++++
 tests/tcg/Makefile.target  |  3 +++
 5 files changed, 45 insertions(+), 3 deletions(-)
 create mode 100644 contrib/plugins/cc.cc

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index c9f8b27590..0a11f8036c 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -584,6 +584,14 @@ The plugin has a number of arguments, all of them are optional:
   configuration arguments implies ``l2=on``.
   (default: N = 2097152 (2MB), B = 64, A = 16)
 
+- contrib/plugins/cc.cc
+
+cc plugin demonstrates how to write a plugin in C++. It simply outputs
+"hello, world" to the plugin log::
+
+  $ qemu-system-arm $(QEMU_ARGS) \
+    -plugin ./contrib/plugins/libcc.so -d plugin
+
 API
 ---
 
diff --git a/configure b/configure
index 26ec5e4f54..0065b0dfe0 100755
--- a/configure
+++ b/configure
@@ -293,10 +293,18 @@ else
   cc="${CC-${cross_prefix}gcc}"
 fi
 
-if test -z "${CXX}${cross_prefix}"; then
-  cxx="c++"
+if test -n "${CXX+x}"; then
+  cxx="$CXX"
 else
-  cxx="${CXX-${cross_prefix}g++}"
+  if test -n "${cross_prefix}"; then
+    cxx="${cross_prefix}g++"
+  else
+    cxx="c++"
+  fi
+
+  if ! has "$cxx"; then
+    cxx=
+  fi
 fi
 
 # Preferred ObjC compiler:
@@ -1702,6 +1710,7 @@ echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "PKG_CONFIG=${pkg_config}" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
+echo "CXX=$cxx" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 
 # use included Linux headers
diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index b2b9db9f51..93d86b3d07 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -21,6 +21,9 @@ NAMES += lockstep
 NAMES += hwprofile
 NAMES += cache
 NAMES += drcov
+ifneq ($(CXX),)
+NAMES += cc
+endif
 
 SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 
@@ -31,6 +34,8 @@ CFLAGS += -fPIC -Wall
 CFLAGS += $(if $(CONFIG_DEBUG_TCG), -ggdb -O0)
 CFLAGS += -I$(SRC_PATH)/include/qemu
 
+CXXFLAGS := $(CFLAGS)
+
 all: $(SONAMES)
 
 %.o: %.c
diff --git a/contrib/plugins/cc.cc b/contrib/plugins/cc.cc
new file mode 100644
index 0000000000..83a5528db0
--- /dev/null
+++ b/contrib/plugins/cc.cc
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <qemu-plugin.h>
+
+extern "C" {
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                                           const qemu_info_t *info, int argc,
+                                           char **argv)
+{
+    qemu_plugin_outs("hello, world\n");
+    return 0;
+}
+
+};
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 462289f47c..3d7837d3b8 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -149,6 +149,9 @@ PLUGIN_SRC=$(SRC_PATH)/tests/plugin
 PLUGIN_LIB=../../plugin
 VPATH+=$(PLUGIN_LIB)
 PLUGINS=$(patsubst %.c, lib%.so, $(notdir $(wildcard $(PLUGIN_SRC)/*.c)))
+ifneq ($(CXX),)
+PLUGINS+=$(patsubst %.cc, lib%.so, $(notdir $(wildcard $(PLUGIN_SRC)/*.cc)))
+endif
 
 # We need to ensure expand the run-plugin-TEST-with-PLUGIN
 # pre-requistes manually here as we can't use stems to handle it. We
-- 
2.41.0


