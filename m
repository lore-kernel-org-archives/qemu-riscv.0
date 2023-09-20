Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DFCCE79CE
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 11:23:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qivGY-0005jw-85; Wed, 20 Sep 2023 07:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qivGW-0005jS-QQ
 for qemu-riscv@nongnu.org; Wed, 20 Sep 2023 07:21:08 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qivGV-0002EW-5K
 for qemu-riscv@nongnu.org; Wed, 20 Sep 2023 07:21:08 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1d5dabec19cso3580233fac.1
 for <qemu-riscv@nongnu.org>; Wed, 20 Sep 2023 04:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695208866; x=1695813666; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KyXIVQ6oXB882FE4SAxwRzZIe3agCcsRwcqsPA0bJps=;
 b=QO+I+b6NHOW5Xr0AvWKGX0Ovi2rFkFjpqUnZxlDJvSnviZr2UWk8TxZkL3elOZ2ly0
 oX37hJKwK7Pub1LVEnC9kiVyQ0Wg6uIc75Uqe1ScghLehFpiAKFtSJjol2nNgj4OwFlS
 2b6tI0sFKO3u4Jbc9Ug8VQF8h5yyV+FYxzNSr4gqqG34NYr4il1RMuyN6HsD7JejM+JN
 y7n4NECAGLuDUGc6m+gFw5kbjZOY0dxL8/vywRBiVsx+7wwPt4UgJcEVJsJnYVLdkSHE
 9XbnolbAATr1OAOjMcYfl3mJV8XGISG3RuSeanO3WVeB17lPLczZVjsq5i+2sHTvJw0Y
 2Y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695208866; x=1695813666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KyXIVQ6oXB882FE4SAxwRzZIe3agCcsRwcqsPA0bJps=;
 b=IphdDIMq3SGD5v4fIsAEIkPMZgAEsRXRx1C7W+/yMZMn5Xh0Pksg97b3PQd61SAZIA
 g7HeGfJQJXrF7w3/RKoh76X+hRQksHDeo09FqCfgEh/WM+FGBZUkupNSIdVduhdxv3IX
 nrQaf/AhR0bsT26ctPMJofuwlXBwHfdIdzycqdOMwpHqFqQukiylUFYE44kHBKvUkYRZ
 u3p49lN3uqx9CGXRSz81rYVxyWquinpzaLfFdviTbc89yBwSeMC8CcSI3qjmA7otsCAA
 BoxIKX2xKRWZ+WLUHs7S534wuPoKHHtDUmnz9HHn/DqcOu/vhIMHaYiWQqTwMVHbnVNu
 i2BA==
X-Gm-Message-State: AOJu0YysYEDhycC3ytE2SJo+I25gW65LxAyiWYuuMoqLrLEmnohnN7df
 aQuc+0ZkIitMOIvgsMwdXni6jw==
X-Google-Smtp-Source: AGHT+IFtcjxZp6AVUCBuVeXKOZGKP7nlSFfkPnzSwlZ9DANzdiearRf7pBM1VX83L8NsZp6qyaBX7Q==
X-Received: by 2002:a05:6870:4411:b0:1d5:a955:8bb3 with SMTP id
 u17-20020a056870441100b001d5a9558bb3mr2180527oah.43.1695208865984; 
 Wed, 20 Sep 2023 04:21:05 -0700 (PDT)
Received: from grind.. ([2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a9d7c84000000b006b45be2fdc2sm5863955otn.65.2023.09.20.04.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 04:21:05 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 philmd@linaro.org, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 12/19] target/riscv: move KVM only files to kvm subdir
Date: Wed, 20 Sep 2023 08:20:13 -0300
Message-ID: <20230920112020.651006-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920112020.651006-1-dbarboza@ventanamicro.com>
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
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

Move the files to a 'kvm' dir to promote more code separation between
accelerators and making our lives easier supporting build options such
as --disable-tcg.

Rename kvm.c to kvm-cpu.c to keep it in line with its TCG counterpart.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 hw/intc/riscv_aplic.c                 | 2 +-
 hw/riscv/virt.c                       | 2 +-
 target/riscv/cpu.c                    | 2 +-
 target/riscv/{kvm.c => kvm/kvm-cpu.c} | 0
 target/riscv/{ => kvm}/kvm_riscv.h    | 0
 target/riscv/kvm/meson.build          | 1 +
 target/riscv/meson.build              | 2 +-
 7 files changed, 5 insertions(+), 4 deletions(-)
 rename target/riscv/{kvm.c => kvm/kvm-cpu.c} (100%)
 rename target/riscv/{ => kvm}/kvm_riscv.h (100%)
 create mode 100644 target/riscv/kvm/meson.build

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index 99aae8ccbe..c677b5cfbb 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -32,7 +32,7 @@
 #include "target/riscv/cpu.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
-#include "kvm_riscv.h"
+#include "kvm/kvm_riscv.h"
 #include "migration/vmstate.h"
 
 #define APLIC_MAX_IDC                  (1UL << 14)
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 5edc1d98d2..9de578c756 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -35,7 +35,7 @@
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
 #include "hw/riscv/numa.h"
-#include "kvm_riscv.h"
+#include "kvm/kvm_riscv.h"
 #include "hw/intc/riscv_aclint.h"
 #include "hw/intc/riscv_aplic.h"
 #include "hw/intc/riscv_imsic.h"
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c8a19be1af..51567c2f12 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -33,7 +33,7 @@
 #include "fpu/softfloat-helpers.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
-#include "kvm_riscv.h"
+#include "kvm/kvm_riscv.h"
 #include "tcg/tcg.h"
 
 /* RISC-V CPU definitions */
diff --git a/target/riscv/kvm.c b/target/riscv/kvm/kvm-cpu.c
similarity index 100%
rename from target/riscv/kvm.c
rename to target/riscv/kvm/kvm-cpu.c
diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm/kvm_riscv.h
similarity index 100%
rename from target/riscv/kvm_riscv.h
rename to target/riscv/kvm/kvm_riscv.h
diff --git a/target/riscv/kvm/meson.build b/target/riscv/kvm/meson.build
new file mode 100644
index 0000000000..7e92415091
--- /dev/null
+++ b/target/riscv/kvm/meson.build
@@ -0,0 +1 @@
+riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm-cpu.c'))
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 3323b78b84..c53962215f 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -24,7 +24,6 @@ riscv_ss.add(files(
   'zce_helper.c',
   'vcrypto_helper.c'
 ))
-riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
 
 riscv_system_ss = ss.source_set()
 riscv_system_ss.add(files(
@@ -39,6 +38,7 @@ riscv_system_ss.add(files(
 ))
 
 subdir('tcg')
+subdir('kvm')
 
 target_arch += {'riscv': riscv_ss}
 target_softmmu_arch += {'riscv': riscv_system_ss}
-- 
2.41.0


