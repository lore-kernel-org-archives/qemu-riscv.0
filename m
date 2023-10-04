Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61E9E8FDDB
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 09:13:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnxsV-0004hX-Ix; Wed, 04 Oct 2023 05:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnxrH-00035E-Uz
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 05:07:59 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnxr9-0007eY-Ly
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 05:07:55 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40684f53d11so3683955e9.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Oct 2023 02:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696410466; x=1697015266; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qiNXcx//OKxcNi+4uj00e9PISfa3ZvRXmQUUf+9xB68=;
 b=U8AJrgdIjMJch3fl6nnqWu7QPohryxayI4n4FWPXJpyHKgoVdSkjOJx8tMv9CtI1EW
 mLv67bPXYjT5/0cZKDSqEGuvfP1cDJZHpzgzpZGPE5FGhNccAMTAA1Igp3oByCPsZ7c9
 ZXt4fYqqLyqqO4EEFa6Z5lKXm4fkcWSP0GaILteiFeUsMNwltp0vn4+hthx+uBLuVGNa
 zq9vc8+jVk2kldbN1Z6e2Ag5Oqs1fmBvx4dN3cBUjG4B2pzB0rp7ogblj4t7GnvNRfEy
 6F8GTjzW5YLxaystFULkT1Im1/+yNZ+M6rqVr0B9uBY1p2Hn771bI0IchyCQ0esHK9TB
 XAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696410466; x=1697015266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qiNXcx//OKxcNi+4uj00e9PISfa3ZvRXmQUUf+9xB68=;
 b=peuigNBCRpE6jAO7X1L3LYXMJbMedjYHMYc8q/Y7f2g/UuB/K21s7CKUgclfIiSa/c
 4duAlBykzLNtUM7X/rEHs+Xzxm5ggmwDwsXBYOildkm/X59L0ey3kHXRCSupM9IJm3OJ
 oNrBmQ/vbzddFi21oZU43RjC9lTSZ4CPVe6EDFV/YHWOm0JyvIyEdxo4rW6jf7a/kb56
 2w/9AX6LHN/hIiQfjCwnpVHN37vST0KzwmPUwwUCyPmQCHhWLz/+VVUYcblUE5XndakZ
 an8QuhtgTCWaBIqSx81s/CQDvBMyrYkPjOn8rM9SkTiC3lJ+r6JJdSw0ISGEmzr1ANC6
 0Ltg==
X-Gm-Message-State: AOJu0YylfoqOnZyTo9k5cVF34k8zo8f24vT0mkQqQbDmGd9T3OBxe4ac
 CRKiotLvinSk0T/7ovezhvPYJQ==
X-Google-Smtp-Source: AGHT+IHCMQv0prc6HXoJ14evrqKani1ePZuyqNDIlG7jrPK3F7Y4cR3ZCidO/ipM/bMUclUFiWF1Qg==
X-Received: by 2002:a05:600c:2191:b0:405:36a0:108f with SMTP id
 e17-20020a05600c219100b0040536a0108fmr1718805wme.41.1696410466051; 
 Wed, 04 Oct 2023 02:07:46 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 k16-20020a5d4290000000b00325b29a6441sm3494803wrq.82.2023.10.04.02.07.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 02:07:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH 12/13] meson: Rename target_softmmu_arch -> target_system_arch
Date: Wed,  4 Oct 2023 11:06:27 +0200
Message-ID: <20231004090629.37473-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004090629.37473-1-philmd@linaro.org>
References: <20231004090629.37473-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Finish the convertion started with commit de6cd7599b
("meson: Replace softmmu_ss -> system_ss"). If the
$target_type is 'system', then use the target_system_arch[]
source set :)

Mechanical change doing:

  $ sed -i -e s/target_softmmu_arch/target_system_arch/g \
      $(git grep -l target_softmmu_arch)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/devel/build-system.rst   | 4 ++--
 meson.build                   | 4 ++--
 target/alpha/meson.build      | 2 +-
 target/arm/meson.build        | 2 +-
 target/avr/meson.build        | 2 +-
 target/cris/meson.build       | 2 +-
 target/hppa/meson.build       | 2 +-
 target/i386/meson.build       | 2 +-
 target/loongarch/meson.build  | 2 +-
 target/m68k/meson.build       | 2 +-
 target/microblaze/meson.build | 2 +-
 target/mips/meson.build       | 2 +-
 target/nios2/meson.build      | 2 +-
 target/openrisc/meson.build   | 2 +-
 target/ppc/meson.build        | 2 +-
 target/riscv/meson.build      | 2 +-
 target/rx/meson.build         | 2 +-
 target/s390x/meson.build      | 2 +-
 target/sh4/meson.build        | 2 +-
 target/sparc/meson.build      | 2 +-
 target/tricore/meson.build    | 2 +-
 target/xtensa/meson.build     | 2 +-
 22 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 0f990bb3e9..21f78da7d1 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -225,14 +225,14 @@ Target-dependent emulator sourcesets:
   The sourceset is only used for system emulators.
 
   Each subdirectory in ``target/`` instead should add one sourceset to each
-  of the ``target_arch`` and ``target_softmmu_arch``, which are used respectively
+  of the ``target_arch`` and ``target_system_arch``, which are used respectively
   for all emulators and for system emulators only.  For example::
 
     arm_ss = ss.source_set()
     arm_system_ss = ss.source_set()
     ...
     target_arch += {'arm': arm_ss}
-    target_softmmu_arch += {'arm': arm_system_ss}
+    target_system_arch += {'arm': arm_system_ss}
 
 Module sourcesets:
   There are two dictionaries for modules: ``modules`` is used for
diff --git a/meson.build b/meson.build
index 8890dc5748..497a85eb9f 100644
--- a/meson.build
+++ b/meson.build
@@ -3214,7 +3214,7 @@ modules = {}
 target_modules = {}
 hw_arch = {}
 target_arch = {}
-target_softmmu_arch = {}
+target_system_arch = {}
 target_user_arch = {}
 
 ###############
@@ -3734,7 +3734,7 @@ foreach target : target_dirs
   endif
   if target.endswith('-softmmu')
     target_type='system'
-    t = target_softmmu_arch[target_base_arch].apply(config_target, strict: false)
+    t = target_system_arch[target_base_arch].apply(config_target, strict: false)
     arch_srcs += t.sources()
     arch_deps += t.dependencies()
 
diff --git a/target/alpha/meson.build b/target/alpha/meson.build
index 3f5253c002..d3502dd823 100644
--- a/target/alpha/meson.build
+++ b/target/alpha/meson.build
@@ -15,4 +15,4 @@ alpha_system_ss = ss.source_set()
 alpha_system_ss.add(files('machine.c'))
 
 target_arch += {'alpha': alpha_ss}
-target_softmmu_arch += {'alpha': alpha_system_ss}
+target_system_arch += {'alpha': alpha_system_ss}
diff --git a/target/arm/meson.build b/target/arm/meson.build
index e645e456da..5d04a8e94f 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -35,4 +35,4 @@ else
 endif
 
 target_arch += {'arm': arm_ss}
-target_softmmu_arch += {'arm': arm_system_ss}
+target_system_arch += {'arm': arm_system_ss}
diff --git a/target/avr/meson.build b/target/avr/meson.build
index a24cf6d26d..3e172bde1c 100644
--- a/target/avr/meson.build
+++ b/target/avr/meson.build
@@ -17,4 +17,4 @@ avr_ss.add(files(
 avr_system_ss.add(files('machine.c'))
 
 target_arch += {'avr': avr_ss}
-target_softmmu_arch += {'avr': avr_system_ss}
+target_system_arch += {'avr': avr_system_ss}
diff --git a/target/cris/meson.build b/target/cris/meson.build
index 07dc3a5682..bbfcdf7f7a 100644
--- a/target/cris/meson.build
+++ b/target/cris/meson.build
@@ -14,4 +14,4 @@ cris_system_ss.add(files(
 ))
 
 target_arch += {'cris': cris_ss}
-target_softmmu_arch += {'cris': cris_system_ss}
+target_system_arch += {'cris': cris_system_ss}
diff --git a/target/hppa/meson.build b/target/hppa/meson.build
index 59b68e82e2..f47e54f5fa 100644
--- a/target/hppa/meson.build
+++ b/target/hppa/meson.build
@@ -20,4 +20,4 @@ hppa_system_ss.add(files(
 ))
 
 target_arch += {'hppa': hppa_ss}
-target_softmmu_arch += {'hppa': hppa_system_ss}
+target_system_arch += {'hppa': hppa_system_ss}
diff --git a/target/i386/meson.build b/target/i386/meson.build
index 6f1036d469..7c74bfa859 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -31,5 +31,5 @@ subdir('hvf')
 subdir('tcg')
 
 target_arch += {'i386': i386_ss}
-target_softmmu_arch += {'i386': i386_system_ss}
+target_system_arch += {'i386': i386_system_ss}
 target_user_arch += {'i386': i386_user_ss}
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index 7fbf045a5d..18e8191e2b 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -30,4 +30,4 @@ common_ss.add(when: 'CONFIG_LOONGARCH_DIS', if_true: [files('disas.c'), gen])
 loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
 
 target_arch += {'loongarch': loongarch_ss}
-target_softmmu_arch += {'loongarch': loongarch_system_ss}
+target_system_arch += {'loongarch': loongarch_system_ss}
diff --git a/target/m68k/meson.build b/target/m68k/meson.build
index 355db26c6f..8d3f9ce288 100644
--- a/target/m68k/meson.build
+++ b/target/m68k/meson.build
@@ -16,4 +16,4 @@ m68k_system_ss.add(files(
 ))
 
 target_arch += {'m68k': m68k_ss}
-target_softmmu_arch += {'m68k': m68k_system_ss}
+target_system_arch += {'m68k': m68k_system_ss}
diff --git a/target/microblaze/meson.build b/target/microblaze/meson.build
index 50fd9ff378..3ed4fbb67a 100644
--- a/target/microblaze/meson.build
+++ b/target/microblaze/meson.build
@@ -17,4 +17,4 @@ microblaze_system_ss.add(files(
 ))
 
 target_arch += {'microblaze': microblaze_ss}
-target_softmmu_arch += {'microblaze': microblaze_system_ss}
+target_system_arch += {'microblaze': microblaze_system_ss}
diff --git a/target/mips/meson.build b/target/mips/meson.build
index f35e8f0eca..e57ef24ecf 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -19,5 +19,5 @@ endif
 mips_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
 
 target_arch += {'mips': mips_ss}
-target_softmmu_arch += {'mips': mips_system_ss}
+target_system_arch += {'mips': mips_system_ss}
 target_user_arch += {'mips': mips_user_ss}
diff --git a/target/nios2/meson.build b/target/nios2/meson.build
index 8f0f9dc628..12d8abf0bd 100644
--- a/target/nios2/meson.build
+++ b/target/nios2/meson.build
@@ -14,4 +14,4 @@ nios2_system_ss.add(files(
 ))
 
 target_arch += {'nios2': nios2_ss}
-target_softmmu_arch += {'nios2': nios2_system_ss}
+target_system_arch += {'nios2': nios2_system_ss}
diff --git a/target/openrisc/meson.build b/target/openrisc/meson.build
index c1cd943f78..31608b6dc7 100644
--- a/target/openrisc/meson.build
+++ b/target/openrisc/meson.build
@@ -22,4 +22,4 @@ openrisc_system_ss.add(files(
 ))
 
 target_arch += {'openrisc': openrisc_ss}
-target_softmmu_arch += {'openrisc': openrisc_system_ss}
+target_system_arch += {'openrisc': openrisc_system_ss}
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index 4c2635039e..97ceb6e7c0 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -55,4 +55,4 @@ ppc_system_ss.add(when: 'TARGET_PPC64', if_true: files(
 ))
 
 target_arch += {'ppc': ppc_ss}
-target_softmmu_arch += {'ppc': ppc_system_ss}
+target_system_arch += {'ppc': ppc_system_ss}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 660078bda1..ff60b21d04 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -39,4 +39,4 @@ riscv_system_ss.add(files(
 ))
 
 target_arch += {'riscv': riscv_ss}
-target_softmmu_arch += {'riscv': riscv_system_ss}
+target_system_arch += {'riscv': riscv_system_ss}
diff --git a/target/rx/meson.build b/target/rx/meson.build
index 8de0ad49b9..d196737ce3 100644
--- a/target/rx/meson.build
+++ b/target/rx/meson.build
@@ -13,4 +13,4 @@ rx_ss.add(files(
   'disas.c'))
 
 target_arch += {'rx': rx_ss}
-target_softmmu_arch += {'rx': ss.source_set()}
+target_system_arch += {'rx': ss.source_set()}
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index 42ed38942a..02ca43d9f0 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -40,5 +40,5 @@ subdir('tcg')
 subdir('kvm')
 
 target_arch += {'s390x': s390x_ss}
-target_softmmu_arch += {'s390x': s390x_system_ss}
+target_system_arch += {'s390x': s390x_system_ss}
 target_user_arch += {'s390x': s390x_user_ss}
diff --git a/target/sh4/meson.build b/target/sh4/meson.build
index a78e9ec7e4..fe09f96684 100644
--- a/target/sh4/meson.build
+++ b/target/sh4/meson.build
@@ -11,4 +11,4 @@ sh4_system_ss = ss.source_set()
 sh4_system_ss.add(files('monitor.c'))
 
 target_arch += {'sh4': sh4_ss}
-target_softmmu_arch += {'sh4': sh4_system_ss}
+target_system_arch += {'sh4': sh4_system_ss}
diff --git a/target/sparc/meson.build b/target/sparc/meson.build
index d32e67b287..48025cce76 100644
--- a/target/sparc/meson.build
+++ b/target/sparc/meson.build
@@ -20,4 +20,4 @@ sparc_system_ss.add(files(
 ))
 
 target_arch += {'sparc': sparc_ss}
-target_softmmu_arch += {'sparc': sparc_system_ss}
+target_system_arch += {'sparc': sparc_system_ss}
diff --git a/target/tricore/meson.build b/target/tricore/meson.build
index 34825b6048..45f49f0128 100644
--- a/target/tricore/meson.build
+++ b/target/tricore/meson.build
@@ -12,4 +12,4 @@ tricore_ss.add(zlib)
 tricore_system_ss = ss.source_set()
 
 target_arch += {'tricore': tricore_ss}
-target_softmmu_arch += {'tricore': tricore_system_ss}
+target_system_arch += {'tricore': tricore_system_ss}
diff --git a/target/xtensa/meson.build b/target/xtensa/meson.build
index 95692bd75f..f8d60101e3 100644
--- a/target/xtensa/meson.build
+++ b/target/xtensa/meson.build
@@ -24,4 +24,4 @@ xtensa_system_ss.add(files(
 ))
 
 target_arch += {'xtensa': xtensa_ss}
-target_softmmu_arch += {'xtensa': xtensa_system_ss}
+target_system_arch += {'xtensa': xtensa_system_ss}
-- 
2.41.0


