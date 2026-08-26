Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3C0C5DF97
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 18:45:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzIc7-0004N5-Jy; Wed, 26 Aug 2026 14:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzIc6-0004Io-Ip
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 14:44:42 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzIc2-0002mm-Vc
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 14:44:42 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-84830c774a0so1677184b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 11:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787769877; x=1788374677; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SlgR5G4e0qMheZ9Whg473zPM26cmao6BYvDobt8PbCE=;
 b=f789p3dcP5eGN38Auwc/ut6b2IhYQ3N+Jog8exoFFsL3AfolTXtUZeiEZD/a82jcKi
 ZJCVLFImhrBMYVMyQEBXIel1FksT2Dcg5JS5mjxxCTGqHnkZec54Mcfg4zvJ5nv4fY2L
 tLPy36t8vQAb+RIpqYyak8lkxqF/oyHMLa08zfxHs87N1/WjgZXQU+zE13Zz6S9aoxuV
 HJJYmIElgjDuOZRPKSfDH7rPScNyhdDfbhZ0/p+Xr0WRU6qmaVP12UEMVnlO0n0bBW1R
 DPKGDenDwMbA/FTRh6t7LYDL9dyTN/mJwG6qLMvYCiLg0RlpcmD9geVbGRW8sNtZ1b0K
 THbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787769877; x=1788374677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SlgR5G4e0qMheZ9Whg473zPM26cmao6BYvDobt8PbCE=;
 b=Gph+4p/FRH65G1uQIXN/vltdcLXC6158A++8zwT43SyIYYqYNBl1CllwyDTM6Fw8PL
 WsmPnQfdNBPL8qRNgNQU7+VcnJyOpYdl2UvLzHUfa9iW1ufRVGqS/BuC//1XWLLg/mmm
 Cx3WDjpUwkr8DMgSp4T9L8cCtqfjcgzNslDBT7d55LzLU91DJ7LaCrrtDbXs10iZhezg
 yuvbtRZ1NLELk11N/yNn7DI54WwUZEs2+nKZKgH1zn3PwB7Hmv2/in6Di50vLqXtkbyf
 ohmo0wxOxw1Y0fWxqqbUbgbXXV45u95LfM0rOygSbcFaOSZ9ZcyTNiQp5ek96ubP8Zb3
 O4Gg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq+PJrCIhzYodmN8gtljCCM33fEpR+JVyR6VIVth8QHRyzhjIZHTkKHaohIqx869j+Z/hqTgElPcZiO@nongnu.org
X-Gm-Message-State: AFuF++mPYNHS4R0B6cNcFpEAZLBT2wnCn/RkzZkbBNPJ5aVcvHQ7gWXW
 6INkkgoFfDCaaGGPuvAfYunchoWnbB0QVyKEK9LjoI4w87oD59Ga4ejO
X-Gm-Gg: AR+sD11lsT6xuju5raHTNFf9Hw8Feh2UCXFXE3KQiNrXeqHAcSx/Mv4uxTULkGUD3E2
 oP81zopdNc7ucxW0KifUddjWE8HDx9lzVb22ZU7hqMBgDf1XDzHU33l3CtvH3BZ3kzgzo+75FmP
 Wiu7w+imKNZ8mSyFaSlVxHEBP+JUIskoB74IS+gasCvH+m7eEJPsDHAcOjSpj2g7U4nHzdbgST1
 AP66sPdA7UihcKppVM1ncu2dAwYxy1TmLjmWca11+IABF2r3OUSnF1Ly0l0TB8W6tdqHvWWUnXW
 GLbfLKlSvQAaLXBcY+I/MXgyWMjixWuBz+w1U04vR1H0n48vnQ5FqP1+wzDxbSP0c/bNM07oM78
 f1n4NzU83mt5GXtzonjTpCBOsrHD6Mn0sTyGwD3/bh7nHi3hKPALERXOoO4pDZoZYT2O0Euu4Pe
 M6PGiiZgDThiw/AN7fciu4sfBR/mlvudgr0WGIKJw4l5jUW9t/9Zb1vqu9N0SYQ/kCi8l53mHN0
 6/pN8r/D9kd9MmzGrh7Dw==
X-Received: by 2002:a05:6a21:390:b0:3cc:b26a:7686 with SMTP id
 adf61e73a8af0-3cf7628564bmr19886931637.6.1787769877472; 
 Wed, 26 Aug 2026 11:44:37 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-3283d60c291sm17681846eec.6.2026.08.26.11.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 11:44:36 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 Song Gao <17746591750@163.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org,
 Xianglai Li <lixianglai@loongson.cn>, David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bibo Mao <maobibo@loongson.cn>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alexander Bulekov <alxndr@bu.edu>, Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Ani Sinha <anisinha@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 13/13] meson: build single binary
Date: Thu, 27 Aug 2026 02:42:27 +0800
Message-ID: <20260826184229.1145-14-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260826184229.1145-1-luoyonggang@gmail.com>
References: <20260826184229.1145-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=luoyonggang@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

- Add -Dsingle_binary / --enable-single-binary (default true) and
  --disable-single-binary to gate the combined qemu-system binary.
- Map each base arch to a primary softmmu target (arm ->
  aarch64-softmmu, riscv -> riscv64-softmmu) that supplies arch_srcs.
  Sibling targets contribute target-info-def.c only.
- Apply common_ss and system_ss once against the union of those
  base-arch configs so constructors and Kconfig stubs are not
  duplicated.
- Build qemu-system only, including on Windows. Do not add
  qemu-systemw: a GUI twin would keep QEMU exporting data from the
  .exe into DLLs, and those data exports cannot be delay-loaded
  (qdev_prop_array and other qdev_prop_*). That would block enabling
  modules globally on Windows.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 meson.build                   | 69 +++++++++++++++++++++++++++++++++--
 meson_options.txt             |  2 +
 scripts/meson-buildoptions.sh |  3 ++
 3 files changed, 71 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 449d50f2983..eea54fd0ba3 100644
--- a/meson.build
+++ b/meson.build
@@ -4249,6 +4249,18 @@ if host_os == 'darwin'
 endif
 
 traceable = []
+single_binary_arch_objects = []
+single_binary_bases_config = {}
+single_binary_deps = []
+single_binary_crates = []
+# base arch -> softmmu target that supplies arch_srcs
+single_binary_primary = {
+  'arm': 'aarch64-softmmu',
+  'riscv': 'riscv64-softmmu',
+}
+if not get_option('single_binary')
+  single_binary_primary = {}
+endif
 emulators = {}
 foreach target : target_dirs
   config_target = config_target_mak[target]
@@ -4321,8 +4333,6 @@ foreach target : target_dirs
     endif
   endif
 
-  arch_srcs += files('target-info-def.c')
-
   if target_base_arch in target_arch
     t = target_arch[target_base_arch].apply(config_target, strict: false)
     arch_srcs += t.sources()
@@ -4391,8 +4401,9 @@ foreach target : target_dirs
     lib_deps += dep.partial_dependency(compile_args: true, includes: true)
   endforeach
 
+  target_info_src = files('target-info-def.c')
   lib = static_library('qemu-' + target,
-                 sources: arch_srcs + genh,
+                 sources: target_info_src + arch_srcs + genh,
                  dependencies: lib_deps,
                  objects: objects,
                  include_directories: target_inc,
@@ -4400,6 +4411,16 @@ foreach target : target_dirs
                  build_by_default: false)
 
   if target.endswith('-softmmu')
+    if target_base_arch in single_binary_primary
+      single_binary_bases_config += config_target
+      single_binary_arch_objects += lib.extract_objects(target_info_src)
+      if target == single_binary_primary[target_base_arch]
+        single_binary_arch_objects += lib.extract_objects(arch_srcs)
+        single_binary_deps += arch_deps
+        single_binary_deps += target_stubs
+        single_binary_crates += main_rs
+      endif
+    endif
     execs = [{
       'name': 'qemu-system-' + target_name,
       'win_subsystem': 'console',
@@ -4481,6 +4502,47 @@ foreach target : target_dirs
   endforeach
 endforeach
 
+if single_binary_arch_objects.length() != 0
+  single_binary_objects = []
+  foreach spec: [[common_ss, common_all], [system_ss, libsystem]]
+    src = spec[0].apply(single_binary_bases_config, strict: false)
+    single_binary_objects += spec[1].extract_objects(src.sources())
+    single_binary_deps += src.dependencies()
+  endforeach
+  foreach base, tgt: single_binary_primary
+    if base in target_common_arch_libs
+      src = target_common_arch[base].apply(single_binary_bases_config,
+                                           strict: false)
+      single_binary_objects += target_common_arch_libs[base].extract_objects(
+        src.sources())
+      single_binary_deps += src.dependencies()
+    endif
+    if base in target_common_system_arch_libs
+      src = target_common_system_arch[base].apply(single_binary_bases_config,
+                                                  strict: false)
+      single_binary_objects += target_common_system_arch_libs[base].extract_objects(
+        src.sources())
+      single_binary_deps += src.dependencies()
+    endif
+  endforeach
+  single_binary_objects += single_binary_arch_objects
+
+  single_binary_link_args = emulator_link_args
+  single_binary_link_args += enable_modules ? ['@block.syms', '@qemu.syms'] : []
+  emulator = executable('qemu-system',
+             sources: [single_binary_crates, files('system/main.c')],
+             dependencies: single_binary_deps + [sdl],
+             objects: single_binary_objects,
+             link_depends: [block_syms, qemu_syms],
+             link_args: single_binary_link_args,
+             install: true)
+  emulators += {'qemu-system': emulator}
+  traceable += [{
+    'exe': 'qemu-system',
+    'probe-prefix': 'qemu.system.multi',
+  }]
+endif
+
 # Other build targets
 
 if get_option('plugins')
@@ -4833,6 +4895,7 @@ if config_all_accel.has_key('CONFIG_TCG')
   endif
 endif
 summary_info += {'target list':       ' '.join(target_dirs)}
+summary_info += {'single binary':     get_option('single_binary')}
 if have_system
   summary_info += {'default devices':   get_option('default_devices')}
   summary_info += {'out of process emulation': multiprocess_allowed}
diff --git a/meson_options.txt b/meson_options.txt
index a07cb47d35e..9d86a46fba7 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -91,6 +91,8 @@ option('tcg', type: 'feature', value: 'enabled',
        description: 'TCG support')
 option('plugins', type: 'boolean', value: false,
        description: 'TCG plugins via shared library loading')
+option('single_binary', type: 'boolean', value: true,
+       description: 'combined qemu-system binary')
 option('debug_tcg', type: 'boolean', value: false,
        description: 'TCG debugging')
 option('debug_remap', type: 'boolean', value: false,
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index c003985047c..d8e49111ac7 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -19,6 +19,7 @@ meson_options_help() {
   printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
   printf "%s\n" '  --disable-qom-cast-debug cast debugging support'
   printf "%s\n" '  --disable-relocatable    toggle relocatable install'
+  printf "%s\n" '  --disable-single-binary  combined qemu-system binary'
   printf "%s\n" '  --docdir=VALUE           Base directory for documentation installation'
   printf "%s\n" '                           (can be empty) [share/doc]'
   printf "%s\n" '  --enable-asan            enable address sanitizer'
@@ -486,6 +487,8 @@ _meson_option_parse() {
     --disable-seccomp) printf "%s" -Dseccomp=disabled ;;
     --enable-selinux) printf "%s" -Dselinux=enabled ;;
     --disable-selinux) printf "%s" -Dselinux=disabled ;;
+    --enable-single-binary) printf "%s" -Dsingle_binary=true ;;
+    --disable-single-binary) printf "%s" -Dsingle_binary=false ;;
     --enable-slirp) printf "%s" -Dslirp=enabled ;;
     --disable-slirp) printf "%s" -Dslirp=disabled ;;
     --enable-slirp-smbd) printf "%s" -Dslirp_smbd=enabled ;;
-- 
2.52.0.windows.1


