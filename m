Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366A1CD610B
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 16:41:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qptKM-0006Aa-9M; Mon, 09 Oct 2023 12:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptJs-0005Ce-Np
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:41:32 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptJe-0001UO-0G
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:41:23 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32003aae100so3534514f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 09:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696869668; x=1697474468; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a52wocQYp8F3YgwPFsZoycBHm5iiCFaISrIdWEZjgl0=;
 b=PJFplBfXMh1OFG9xJg1xLUpyf9jR0JWT5dY25dlIUuCCqGrm20V4SBCKJiV+G6zZxS
 8llEwM1MMi0HTU6tTeUlqoXDwZ8u6P+pXBHFtFWzlb19LuPJHmVAFz6i+RExnow5EoL3
 g5EEF69K2C2fK+QJ/mcM0HeBTH9N6uJApVmA+H3UGPN+J0Kg+CHgh5ci78Vf+trYJYx2
 bmGhUPiX4dRYSj4HbAIB+rYrh3c8VKNQFlDrbNf9e7eJkfVPu2+3fBjrD/gQI9Qt0g7N
 UVAp4y6zLJMMDv9sdrTEpAoCTjJIFsgy43ds8d06ee3oP1FahiFAonM9/GFWrB7Lzy8P
 EE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696869668; x=1697474468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a52wocQYp8F3YgwPFsZoycBHm5iiCFaISrIdWEZjgl0=;
 b=wK0Enr7xXHLlr12qaYUCeOgmiswvPBNqID6OISP5f6tm1Q5qKksSsNnNj8CQYgt0n6
 mgRf9ZqYlWeUsCKsEtZVaBNboaFbnNH3bLjqufRNkaMRlI8yIAEv/thZ1szinSzc0/WA
 oU0oba6Z+N0Q6eaMudi9/yMnVWVy6TrrhoLUEYqWl+KdwgA06ajBaH0TRG/VvEoM9HOl
 aO6HvnEG8iEu5BifJwpxpZiQlPqG0m71mplgDsirpaRsL6zZfLRPVN7+hZr/vq7BUfMc
 y0fTdwZuFnPyWMa+0zdA1afsRE+3Bq1oYquxd72weLacXv8bn+kI6VzFvrrCERlvqeA8
 sZ0A==
X-Gm-Message-State: AOJu0YwPk1m+E+TzWOIEkgnB8pc0qwhFt/6IzD5Sc1vgB0Ay+ZyCOpJ2
 xptEpoaDNj8UTAwiabxHASPb8Q==
X-Google-Smtp-Source: AGHT+IFPOfPRxnx2cUUcZmv8TW/gt/S5tNKXvRyQKbl2j/5SKIaoyIq5dvsTBrYNDSHTqMFdgwi4mQ==
X-Received: by 2002:a05:6000:1a45:b0:31f:f8a7:a26c with SMTP id
 t5-20020a0560001a4500b0031ff8a7a26cmr11611057wry.25.1696869668067; 
 Mon, 09 Oct 2023 09:41:08 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a056000118700b003143c9beeaesm10076058wrx.44.2023.10.09.09.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 09:41:06 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A33B61FFBF;
 Mon,  9 Oct 2023 17:41:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, Radoslaw Biernacki <rad@semihalf.com>,
 David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Nicholas Piggin <npiggin@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/25] gitlab: shuffle some targets and reduce avocado noise
Date: Mon,  9 Oct 2023 17:40:43 +0100
Message-Id: <20231009164104.369749-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009164104.369749-1-alex.bennee@linaro.org>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

We move a couple of targets out of the avocado runs because there are
no tests to run. Tricore already has some coverage.  The cris target
only really has check-tcg tests but its getting harder to find
anything that packages the compiler.

To reduce the noise of CANCEL messages we also set AVOCADO_TAGS
appropriately so we filter down the number of tests we attempt.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

---
v2
  - minor commit reword, no longer attempt to keep cris going
---
 .gitlab-ci.d/buildtest.yml | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index aee9101507..25af1bc41e 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -30,6 +30,7 @@ avocado-system-alpine:
   variables:
     IMAGE: alpine
     MAKE_CHECK_ARGS: check-avocado
+    AVOCADO_TAGS: arch:avr arch:loongarch64 arch:mips64 arch:mipsel
 
 build-system-ubuntu:
   extends:
@@ -40,8 +41,7 @@ build-system-ubuntu:
   variables:
     IMAGE: ubuntu2204
     CONFIGURE_ARGS: --enable-docs
-    TARGETS: alpha-softmmu cris-softmmu hppa-softmmu
-      microblazeel-softmmu mips64el-softmmu
+    TARGETS: alpha-softmmu microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
 
 check-system-ubuntu:
@@ -61,6 +61,7 @@ avocado-system-ubuntu:
   variables:
     IMAGE: ubuntu2204
     MAKE_CHECK_ARGS: check-avocado
+    AVOCADO_TAGS: arch:alpha arch:microblaze arch:mips64el
 
 build-system-debian:
   extends:
@@ -72,7 +73,7 @@ build-system-debian:
     IMAGE: debian-amd64
     CONFIGURE_ARGS: --with-coroutine=sigaltstack
     TARGETS: arm-softmmu i386-softmmu riscv64-softmmu sh4eb-softmmu
-      sparc-softmmu xtensaeb-softmmu
+      sparc-softmmu xtensa-softmmu
     MAKE_CHECK_ARGS: check-build
 
 check-system-debian:
@@ -92,6 +93,7 @@ avocado-system-debian:
   variables:
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check-avocado
+    AVOCADO_TAGS: arch:arm arch:i386 arch:riscv64 arch:sh4 arch:sparc arch:xtensa
 
 crash-test-debian:
   extends: .native_test_job_template
@@ -114,7 +116,7 @@ build-system-fedora:
   variables:
     IMAGE: fedora
     CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
-    TARGETS: tricore-softmmu microblaze-softmmu mips-softmmu
+    TARGETS: microblaze-softmmu mips-softmmu
       xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-softmmu sparc64-softmmu
     MAKE_CHECK_ARGS: check-build
 
@@ -135,6 +137,8 @@ avocado-system-fedora:
   variables:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-avocado
+    AVOCADO_TAGS: arch:microblaze arch:mips arch:xtensa arch:m68k
+      arch:riscv32 arch:ppc arch:sparc64
 
 crash-test-fedora:
   extends: .native_test_job_template
@@ -180,6 +184,8 @@ avocado-system-centos:
   variables:
     IMAGE: centos8
     MAKE_CHECK_ARGS: check-avocado
+    AVOCADO_TAGS: arch:ppc64 arch:or1k arch:390x arch:x86_64 arch:rx
+      arch:sh4 arch:nios2
 
 build-system-opensuse:
   extends:
@@ -209,6 +215,7 @@ avocado-system-opensuse:
   variables:
     IMAGE: opensuse-leap
     MAKE_CHECK_ARGS: check-avocado
+    AVOCADO_TAGS: arch:s390x arch:x86_64 arch:aarch64
 
 
 # This jobs explicitly disable TCG (--disable-tcg), KVM is detected by
-- 
2.39.2


