Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A5CCE7AB1
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 18:00:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkpqH-0000mz-Mf; Mon, 25 Sep 2023 13:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkpqG-0000mB-B7
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 13:57:56 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkpqD-0002EJ-IC
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 13:57:56 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-27763c2c22eso1383338a91.3
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 10:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695664672; x=1696269472; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YhVdZG5ANHQJ4UjAGD7i9HzzdNRsmYRrsil2YQszby0=;
 b=lb4eKKmwZlSqqJoq6UzECgBiTM7D5G4NYTF4zwG4jP/IccYrcfdQx7dpCv7z3Yfr4U
 gt9kw4DtdQ6Kars18VDShbKHW1bpXXKVHeI75c84i1bYw9DHTOsjZ8HHTJCAtaVnk/VI
 tU7J7jjakRn6id1rVUFTun30WzY55JN78W7HUDifoq5fQmQMDL2TY6IAK1ocIYupgh9V
 MUACNYBLNI+KxdPl+SihAxSpZvAry5Efhcf5DGCLBn5IUDnu979QXqZWbDTCfEBho9yB
 eSVi8CmxxlZDx3pUz0+8EyzIsFA0ecrnqf12PswbA859MqBwmuTyfFHkr7qoyw+NaYWH
 aW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695664672; x=1696269472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YhVdZG5ANHQJ4UjAGD7i9HzzdNRsmYRrsil2YQszby0=;
 b=nWPPr5t3Rl/54GXVqAcxQ1PPBWb1BhicW6Ui6CeTQgA/sMxa3G/S+VsWUlRjfzDaNt
 g4gimFyvwe5c+QUelE7tP4c3CepSj+UWi3qtGznCE4pV01QU1IrIAh5OIsvVMULY/YuN
 sT04Z+rqh/LHT4NJMwM150U8mRA8DZkpsaM2VxBzIusF8Ex/1NY7gH/a6J58kIKJ7Auh
 aPyMgToyMjJkbvEVNuRTnguOqNiWPTiLyIZzDYdf176L/jpOecPmb7yELgIQtym5YJWk
 qwumlIMzc81rj/cknthYB+KoFNDtLXF6rcgRZ1iqoG91SfilnO0WBYRNvXLEn3ArurGw
 yWKQ==
X-Gm-Message-State: AOJu0YwVD0hvJb5Zx87dlsCr6RL1WdZVeqENuCJ+Ssrka2/SyAob4aBF
 Vja7fDarsr6tL5aqmaVK4WKF+A==
X-Google-Smtp-Source: AGHT+IGmqDVhp3G+ZuZzRoWh2IUc7JaZx2jdHe44KR+UjwfHhqnBUWGdEti6obgzJDrV13sln8R6Hg==
X-Received: by 2002:a17:90a:aa81:b0:274:77df:50cd with SMTP id
 l1-20020a17090aaa8100b0027477df50cdmr5067152pjq.9.1695664672279; 
 Mon, 25 Sep 2023 10:57:52 -0700 (PDT)
Received: from grind.. ([177.94.42.59]) by smtp.gmail.com with ESMTPSA id
 i3-20020a17090a65c300b00262ca945cecsm3312722pjs.54.2023.09.25.10.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 10:57:52 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 12/19] target/riscv: move KVM only files to kvm subdir
Date: Mon, 25 Sep 2023 14:57:02 -0300
Message-ID: <20230925175709.35696-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925175709.35696-1-dbarboza@ventanamicro.com>
References: <20230925175709.35696-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102e.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


