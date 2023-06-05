Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC4CC7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 22:27:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6IdZ-0000FK-2e; Mon, 05 Jun 2023 18:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6IdX-0000F0-UJ
 for qemu-riscv@nongnu.org; Mon, 05 Jun 2023 18:25:15 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6IdQ-0006WD-4e
 for qemu-riscv@nongnu.org; Mon, 05 Jun 2023 18:25:15 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30aef0499b6so4310836f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 05 Jun 2023 15:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686003907; x=1688595907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KL8d51kLgmMW80+qZlPB7IkDsANcwx2fe7bTwfWUaMA=;
 b=Uf6cpy/VvjMdpekXSEt+JNu3/3eC+AbufNByIOvbpjxknn7EEoskKUyaO/IxFnStAS
 imPsSQrCofhAjGILPI97Q6kvh+JaldZhu+a8z778mjVOsixHoM4WPCIGY7Sr43ECWDVi
 kIxRRquq1rTGoosRWLjFtiwlPj0IGyWkT8J5Sz+iZhH2BZfMnLl+484xASTvBct+J1Pr
 hjX6O919S/xUqw531xlZXK5+RWiDWGdLmC8juaoXDxI4ZMgPXXGq88tGHcDhS34Pnjdr
 umgsibE8gG2jk1n6EA5RxRbs9fIQWfPpvFkBO6S89XWUGgxFsVh7So+rpEl3BAETSMIk
 pLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686003907; x=1688595907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KL8d51kLgmMW80+qZlPB7IkDsANcwx2fe7bTwfWUaMA=;
 b=Yqex041YUBMP73Gf62CUAXIHHArMCtnslBpCD/Ra93ARDzIEGSTsOouvtN82eITmkL
 af0ov9PuNw1pDxwvpYQar7IP66ZOFz/JIKOJKFDq9jDvtaVo2PzE5IFRk97TOTYASHT/
 772hktDAXsczEwnugCi1BRt+40wfX/+v3cS9+19q/2Sd1/khKggHLO/LLY1BCG3kcOqd
 ZQQLfCOO05N2DnrT5tZQvebvs6L4Wa1ELacQXCprAk9F306eyQiplhksQp6zz70WKFyo
 LdEwJPTG3xjxRCXZI8I0aDObY5xIzIrOL01rl/rCD7BvZ2wH5XUkttGl2SvnPunzBQBH
 CwkQ==
X-Gm-Message-State: AC+VfDzqktUoC20RW4q48oWx/jbRK3nKVMi3c4kro2oNJFwUwNXcMM4C
 JGuz1OyXOXp1kRjhO0Pz3bnwgg==
X-Google-Smtp-Source: ACHHUZ7oXgBR8l4THbzS3ZZVAl7WnywdQPEHEOVb2zTraIJWTSy2WaJcYlIVtcK+NIjjhFF8v47hNw==
X-Received: by 2002:a05:6000:1287:b0:30d:e113:2dd6 with SMTP id
 f7-20020a056000128700b0030de1132dd6mr191212wrx.62.1686003906876; 
 Mon, 05 Jun 2023 15:25:06 -0700 (PDT)
Received: from localhost.localdomain ([176.187.217.157])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a056000010a00b002e5f6f8fc4fsm10773884wrx.100.2023.06.05.15.25.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 05 Jun 2023 15:25:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH v2 8/9] meson: Replace CONFIG_SOFTMMU -> CONFIG_SYSTEM_ONLY
Date: Tue,  6 Jun 2023 00:24:19 +0200
Message-Id: <20230605222420.14776-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230605222420.14776-1-philmd@linaro.org>
References: <20230605222420.14776-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Since we *might* have user emulation with softmmu,
use the clearer 'CONFIG_SYSTEM_ONLY' key to check
for system emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 meson.build                        | 4 ++--
 accel/qtest/meson.build            | 2 +-
 accel/stubs/meson.build            | 2 +-
 accel/tcg/meson.build              | 6 +++---
 dump/meson.build                   | 2 +-
 hw/i386/kvm/meson.build            | 2 +-
 migration/meson.build              | 2 +-
 monitor/meson.build                | 2 +-
 qapi/meson.build                   | 2 +-
 semihosting/meson.build            | 2 +-
 softmmu/meson.build                | 4 ++--
 target/i386/tcg/sysemu/meson.build | 2 +-
 ui/meson.build                     | 4 ++--
 13 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meson.build b/meson.build
index ce3fec7276..b1fa9ca5b9 100644
--- a/meson.build
+++ b/meson.build
@@ -3015,7 +3015,7 @@ config_all += config_host
 config_all += config_all_disas
 config_all += {
   'CONFIG_XEN': xen.found(),
-  'CONFIG_SOFTMMU': have_system,
+  'CONFIG_SYSTEM_ONLY': have_system,
   'CONFIG_USER_ONLY': have_user,
   'CONFIG_ALL': true,
 }
@@ -3702,7 +3702,7 @@ endif
 softmmu_ss.add(authz, blockdev, chardev, crypto, io, qmp)
 common_ss.add(qom, qemuutil)
 
-common_ss.add_all(when: 'CONFIG_SOFTMMU', if_true: [softmmu_ss])
+common_ss.add_all(when: 'CONFIG_SYSTEM_ONLY', if_true: [softmmu_ss])
 common_ss.add_all(when: 'CONFIG_USER_ONLY', if_true: user_ss)
 
 common_all = common_ss.apply(config_all, strict: false)
diff --git a/accel/qtest/meson.build b/accel/qtest/meson.build
index 176d990ae1..2018de8a05 100644
--- a/accel/qtest/meson.build
+++ b/accel/qtest/meson.build
@@ -1 +1 @@
-qtest_module_ss.add(when: ['CONFIG_SOFTMMU'], if_true: files('qtest.c'))
+qtest_module_ss.add(when: ['CONFIG_SYSTEM_ONLY'], if_true: files('qtest.c'))
diff --git a/accel/stubs/meson.build b/accel/stubs/meson.build
index 0249b9258f..f7a9486e06 100644
--- a/accel/stubs/meson.build
+++ b/accel/stubs/meson.build
@@ -4,4 +4,4 @@ sysemu_stubs_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
 sysemu_stubs_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
 sysemu_stubs_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
 
-specific_ss.add_all(when: ['CONFIG_SOFTMMU'], if_true: sysemu_stubs_ss)
+specific_ss.add_all(when: ['CONFIG_SYSTEM_ONLY'], if_true: sysemu_stubs_ss)
diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index aeb20a6ef0..166bef173b 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -10,18 +10,18 @@ tcg_ss.add(files(
   'translator.c',
 ))
 tcg_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-exec.c'))
-tcg_ss.add(when: 'CONFIG_SOFTMMU', if_false: files('user-exec-stub.c'))
+tcg_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_false: files('user-exec-stub.c'))
 tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plugin-gen.c')])
 tcg_ss.add(when: libdw, if_true: files('debuginfo.c'))
 tcg_ss.add(when: 'CONFIG_LINUX', if_true: files('perf.c'))
 specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
-specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
+specific_ss.add(when: ['CONFIG_SYSTEM_ONLY', 'CONFIG_TCG'], if_true: files(
   'cputlb.c',
   'monitor.c',
 ))
 
-tcg_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
+tcg_module_ss.add(when: ['CONFIG_SYSTEM_ONLY', 'CONFIG_TCG'], if_true: files(
   'tcg-accel-ops.c',
   'tcg-accel-ops-mttcg.c',
   'tcg-accel-ops-icount.c',
diff --git a/dump/meson.build b/dump/meson.build
index df52ee4268..3ef1f7ce00 100644
--- a/dump/meson.build
+++ b/dump/meson.build
@@ -1,2 +1,2 @@
 softmmu_ss.add([files('dump.c', 'dump-hmp-cmds.c'), snappy, lzo])
-specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('win_dump.c'))
+specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: files('win_dump.c'))
diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
index 6621ba5cd7..ab143d6474 100644
--- a/hw/i386/kvm/meson.build
+++ b/hw/i386/kvm/meson.build
@@ -19,4 +19,4 @@ xen_stubs_ss.add(when: 'CONFIG_XEN_EMU', if_false: files(
   'xen-stubs.c',
 ))
 
-specific_ss.add_all(when: 'CONFIG_SOFTMMU', if_true: xen_stubs_ss)
+specific_ss.add_all(when: 'CONFIG_SYSTEM_ONLY', if_true: xen_stubs_ss)
diff --git a/migration/meson.build b/migration/meson.build
index 8ba6e420fe..9975407cd0 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -40,6 +40,6 @@ if get_option('live_block_migration').allowed()
 endif
 softmmu_ss.add(when: zstd, if_true: files('multifd-zstd.c'))
 
-specific_ss.add(when: 'CONFIG_SOFTMMU',
+specific_ss.add(when: 'CONFIG_SYSTEM_ONLY',
                 if_true: files('ram.c',
                                'target.c'))
diff --git a/monitor/meson.build b/monitor/meson.build
index ccb4d1a8e6..4c0a33ae65 100644
--- a/monitor/meson.build
+++ b/monitor/meson.build
@@ -7,5 +7,5 @@ softmmu_ss.add(files(
 ))
 softmmu_ss.add([spice_headers, files('qmp-cmds.c')])
 
-specific_ss.add(when: 'CONFIG_SOFTMMU',
+specific_ss.add(when: 'CONFIG_SYSTEM_ONLY',
 		if_true: [files( 'hmp-cmds-target.c', 'hmp-target.c'), spice])
diff --git a/qapi/meson.build b/qapi/meson.build
index 9fd480c4d8..60a668b343 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -141,6 +141,6 @@ foreach output : qapi_specific_outputs + qapi_nonmodule_outputs
   if output.endswith('.trace-events')
     qapi_trace_events += qapi_files[i]
   endif
-  specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: qapi_files[i])
+  specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: qapi_files[i])
   i = i + 1
 endforeach
diff --git a/semihosting/meson.build b/semihosting/meson.build
index 8057db5494..b07cbd980f 100644
--- a/semihosting/meson.build
+++ b/semihosting/meson.build
@@ -3,7 +3,7 @@ specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
   'syscalls.c',
 ))
 
-specific_ss.add(when: ['CONFIG_SEMIHOSTING', 'CONFIG_SOFTMMU'], if_true: files(
+specific_ss.add(when: ['CONFIG_SEMIHOSTING', 'CONFIG_SYSTEM_ONLY'], if_true: files(
   'config.c',
   'console.c',
   'uaccess.c',
diff --git a/softmmu/meson.build b/softmmu/meson.build
index 974732b0f3..d75f45b7c3 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -1,4 +1,4 @@
-specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
+specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: [files(
   'arch_init.c',
   'ioport.c',
   'memory.c',
@@ -6,7 +6,7 @@ specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
   'watchpoint.c',
 )])
 
-specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: [files(
+specific_ss.add(when: ['CONFIG_SYSTEM_ONLY', 'CONFIG_TCG'], if_true: [files(
   'icount.c',
 )])
 
diff --git a/target/i386/tcg/sysemu/meson.build b/target/i386/tcg/sysemu/meson.build
index 2e444e766a..7179bd21fb 100644
--- a/target/i386/tcg/sysemu/meson.build
+++ b/target/i386/tcg/sysemu/meson.build
@@ -1,4 +1,4 @@
-i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
+i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SYSTEM_ONLY'], if_true: files(
   'tcg-cpu.c',
   'smm_helper.c',
   'excp_helper.c',
diff --git a/ui/meson.build b/ui/meson.build
index e09b616a66..125dd41cd6 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -1,6 +1,6 @@
 softmmu_ss.add(pixman)
-specific_ss.add(when: ['CONFIG_SOFTMMU'], if_true: pixman)   # for the include path
-specific_ss.add(when: ['CONFIG_SOFTMMU'], if_true: opengl)   # for the include path
+specific_ss.add(when: ['CONFIG_SYSTEM_ONLY'], if_true: pixman)   # for the include path
+specific_ss.add(when: ['CONFIG_SYSTEM_ONLY'], if_true: opengl)   # for the include path
 
 softmmu_ss.add(png)
 softmmu_ss.add(files(
-- 
2.38.1


