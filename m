Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEF5C7EE2C
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 13:12:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZWZK-0001qE-D8; Fri, 25 Aug 2023 09:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZWZJ-0001pl-Mr
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 09:09:41 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZWZH-000702-AC
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 09:09:41 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1ccc0d2e697so585495fac.0
 for <qemu-riscv@nongnu.org>; Fri, 25 Aug 2023 06:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692968978; x=1693573778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ki6rVhe0hiKOdGbi5+uJWO6Sez41ZvRAYyH2U6AHwYg=;
 b=LMYJAsZjGdQYPSlQJX/0W2U2//yWDiX42BlLqnb/m6VLXIh1JQmHJ147m9uD14/lik
 TTWvbx6gyJeBUuoIyD6bSOJEJ+IlS9Zoho8qlCQStmn7n1Y9GNA6wt58GxvL557Q5U3p
 kdphhMFir+HYKCWnfZX72pt7w0VgnZEaWfYUv2BGMp9FXKDeNFStL7Y3pYVGqwDj12Lu
 EtFicMK4NtDIEHagQ6GW4slU0giBaYTufFYi7jwvO6tGslAahjJqY+lPcSWEU8DPl1IJ
 LKWv+Mv9wnh7wJ90lNyW0gM73Ocso7j5Eoa58x+FlZgiyt+bGdqEmagFPHeSJzGmVs2l
 xL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692968978; x=1693573778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ki6rVhe0hiKOdGbi5+uJWO6Sez41ZvRAYyH2U6AHwYg=;
 b=KdDp8fFZrALyfm5k3D5Xi8Al6V7I7bjYQFGH63WdrIx/iDCUN+FrO5OPSCwhmO6JYU
 XZaeeQxB9EGOWLG2WsIdfJIrpzR++CfTq+WR5ptRbFnAKclov5elfA+GitwuQAyy4iMX
 /xF7x8kNmYiZUetFcJSotRCcxt/2s6aVa0pszlDBWzhYXn//8JAhXrC1ADG8erPbE+rt
 amcast2iv7+cIHKCgWyIisdEpg+A0mOuZ2Zgl8NMr3XApZndO3AEpb2+3gcSt6Bl+CvE
 Fn4ascLlzutVRiVF0RHtzzRAMy9QVRHAcf4Ksnffghi7W93F07V65NXCEIseX5R5jE6N
 VJfg==
X-Gm-Message-State: AOJu0YwdLmd4YzEotNGaRFFit6abdQW5EcLDRpZnpt8egemsBxOL0eIZ
 KxWtdGlXp2jCF+qOr3mjBzmUpYEr3YXp0gb/kGQ=
X-Google-Smtp-Source: AGHT+IFZaY7Q35q748Tra9wi9s+m45AEEHAdV3Ox59f1f4MTG+6FY/yNGSrA2vsOkDJjo8wz80D1Eg==
X-Received: by 2002:a05:6870:c10f:b0:1bc:f15:c9ef with SMTP id
 f15-20020a056870c10f00b001bc0f15c9efmr3244545oad.19.1692968977651; 
 Fri, 25 Aug 2023 06:09:37 -0700 (PDT)
Received: from grind.. ([179.93.21.19]) by smtp.gmail.com with ESMTPSA id
 ds23-20020a0568705b1700b001c50fb56845sm966189oab.16.2023.08.25.06.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 06:09:37 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 12/20] target/riscv: move KVM only files to kvm subdir
Date: Fri, 25 Aug 2023 10:08:45 -0300
Message-ID: <20230825130853.511782-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825130853.511782-1-dbarboza@ventanamicro.com>
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
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
---
 hw/riscv/virt.c                       | 2 +-
 target/riscv/cpu.c                    | 2 +-
 target/riscv/{kvm.c => kvm/kvm-cpu.c} | 0
 target/riscv/{ => kvm}/kvm-stub.c     | 0
 target/riscv/{ => kvm}/kvm_riscv.h    | 0
 target/riscv/kvm/meson.build          | 2 ++
 target/riscv/meson.build              | 2 +-
 7 files changed, 5 insertions(+), 3 deletions(-)
 rename target/riscv/{kvm.c => kvm/kvm-cpu.c} (100%)
 rename target/riscv/{ => kvm}/kvm-stub.c (100%)
 rename target/riscv/{ => kvm}/kvm_riscv.h (100%)
 create mode 100644 target/riscv/kvm/meson.build

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 388e52a294..77c384ddc3 100644
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
index 04c6bfaeef..bf6c8519b1 100644
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
diff --git a/target/riscv/kvm-stub.c b/target/riscv/kvm/kvm-stub.c
similarity index 100%
rename from target/riscv/kvm-stub.c
rename to target/riscv/kvm/kvm-stub.c
diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm/kvm_riscv.h
similarity index 100%
rename from target/riscv/kvm_riscv.h
rename to target/riscv/kvm/kvm_riscv.h
diff --git a/target/riscv/kvm/meson.build b/target/riscv/kvm/meson.build
new file mode 100644
index 0000000000..1cd6783894
--- /dev/null
+++ b/target/riscv/kvm/meson.build
@@ -0,0 +1,2 @@
+riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm-cpu.c'),
+                                 if_false: files('kvm-stub.c'))
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index f0486183fa..c53962215f 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -24,7 +24,6 @@ riscv_ss.add(files(
   'zce_helper.c',
   'vcrypto_helper.c'
 ))
-riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
 
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


