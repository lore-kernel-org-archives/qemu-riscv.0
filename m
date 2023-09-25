Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB161CE7A81
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 14:54:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkmti-0001Gq-Kp; Mon, 25 Sep 2023 10:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkmte-00018O-8E
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:49:14 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkmtQ-0008Gf-Ht
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:49:13 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32172a50356so6204526f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 07:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653339; x=1696258139; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r13on7w2SbSnXhlFRAWqdY9M0P6WFpp9T5fLln0Y27E=;
 b=F4f2h3MQJTmQe8AoqU2a+I/zOiPXPbyL3Cty1t62Bmv5uUkwjjzVVTqUD6AoGIQx3V
 cefY9wbmB8uN/1aAB2AuLgHSdIOtBsv4JVbwN4YlE32eGeZQA0gXDRkOz2a5bvzIm+kG
 hS4tULvDkO09gdDkpjGVwEU7WIzQWLBZrsyyxXBodFULmBvNxLIG9CgIOEFYJtbsaxp6
 VbmXvHNWntaUZmHIoJiLk9N4fxwwvhH3qj+locgYE4Naw8/hkVmWpY4JZcxR/dImC2tG
 qfE6TVzP+bZuis/SIo5WoNehknm7jlI7TcKrMb/l+bfkvy1+H8jsoA9JElwxPSAIB8cW
 7wRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653339; x=1696258139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r13on7w2SbSnXhlFRAWqdY9M0P6WFpp9T5fLln0Y27E=;
 b=ELy4vsTYrwFglelLbCyddlmOgpx88mbJTyyy/pwhsumokpa8WwTek4MXyOOmDVbkGA
 hKzhmwKthHQgQuMIvkSVDn68kTAUojw+ghfkFUIa13ZRf6MC+o7fXSnN1GLov8HeEtcf
 iPirifinLZeouSA9QzwWh4W1s9sFE083ELU+ARSEz+X/TOBtUKwVUH7k3hsQm7tBcexh
 1PashgUq+al6dETXzCNFxvxDDsrPHRLzUXxVYYsLrGSJpB+lH/lWZrQ05foihOC06AhS
 o/wAB1Jry6P4Hlq9/c60Mb9baYGzCoY+FRc/RhxK3+M7Qb5aIM2kqRFsb/1D5hr8di4p
 QSyA==
X-Gm-Message-State: AOJu0YyJ9nv5Ix2/vWlMMOqCnQLzowblyYPjeFxCP7hgS5yEa6uL/jqr
 kYUcWrompzppC+b1wRHdo2LVfw==
X-Google-Smtp-Source: AGHT+IE3kyYs4YdsaciWtbu3ns+G9H7zM0tAc4x8OuL+AXjRejIOFYblrX6yxmTWrGqVvOb2xZxPUg==
X-Received: by 2002:a05:6000:185:b0:321:8d08:855e with SMTP id
 p5-20020a056000018500b003218d08855emr5684333wrx.24.1695653338893; 
 Mon, 25 Sep 2023 07:48:58 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a5d58f2000000b00317b0155502sm12047215wrd.8.2023.09.25.07.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:48:57 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A6FCC1FFC0;
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
Subject: [PATCH 05/31] tests/docker: make docker engine choice entirely
 configure driven
Date: Mon, 25 Sep 2023 15:48:28 +0100
Message-Id: <20230925144854.1872513-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Since 0b1a649047 (tests/docker: use direct RUNC call to build
containers) we ended up with the potential for the remaining docker.py
script calls to deviate from the direct RUNC calls. Fix this by
dropping the use of ENGINE in the makefile and rely entirely on what
we detect at configure time.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure                     | 1 -
 tests/docker/Makefile.include | 7 ++-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/configure b/configure
index e08127045d..707132a3ae 100755
--- a/configure
+++ b/configure
@@ -1694,7 +1694,6 @@ if test -n "$gdb_bin"; then
 fi
 
 if test "$container" != no; then
-    echo "ENGINE=$container" >> $config_host_mak
     echo "RUNC=$runc" >> $config_host_mak
 fi
 echo "SUBDIRS=$subdirs" >> $config_host_mak
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index dfabafab92..035d272be9 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -17,8 +17,7 @@ endif
 DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),$(DOCKER_DEFAULT_REGISTRY))
 
 RUNC ?= docker
-ENGINE ?= auto
-DOCKER_SCRIPT=$(SRC_PATH)/tests/docker/docker.py --engine $(ENGINE)
+DOCKER_SCRIPT=$(SRC_PATH)/tests/docker/docker.py --engine $(RUNC)
 
 CUR_TIME := $(shell date +%Y-%m-%d-%H.%M.%S.$$$$)
 DOCKER_SRC_COPY := $(BUILD_DIR)/docker-src.$(CUR_TIME)
@@ -158,7 +157,7 @@ $(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES),$(DOCKER_IMAGES)), \
 )
 
 docker:
-	@echo 'Build QEMU and run tests inside Docker or Podman containers'
+	@echo 'Build QEMU and run tests inside $(RUNC) containers'
 	@echo
 	@echo 'Available targets:'
 	@echo
@@ -198,8 +197,6 @@ docker:
 	@echo '    EXECUTABLE=<path>    Include executable in image.'
 	@echo '    EXTRA_FILES="<path> [... <path>]"'
 	@echo '                         Include extra files in image.'
-	@echo '    ENGINE=auto/docker/podman'
-	@echo '                         Specify which container engine to run.'
 	@echo '    REGISTRY=url         Cache builds from registry (default:$(DOCKER_REGISTRY))'
 
 docker-help: docker
-- 
2.39.2


