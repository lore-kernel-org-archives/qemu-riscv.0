Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74069C83F12
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 14:58:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qadfI-0003YF-KC; Mon, 28 Aug 2023 10:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadfH-0003Xr-1a
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 10:56:27 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadfE-0000ks-RR
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 10:56:26 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31c6d17aec4so2807681f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693234583; x=1693839383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u0Lad22grnmmVAIA9RRmXOBjrMZHt2ARUrmeTwnSYEw=;
 b=sIhBp5xaGntcvfdc1Ktm6Wjl8YcnEbjFPWQM/QFFhOGmSw6IaFbyNz5GeB0Dzdnre+
 JGPcKOuZso4emL4nVdsMZwQ+nYMi7a5zlZobka8mh4HveupOwaur72TV5kANHiOBcm17
 4+5mG2yXLT7QJE+Lvn6hj7OVKIkQK0gnbize3sb9y+OZSpT3HQCRBCIWPs4WJu/P1cYW
 LjP6Y0bU+QzRrUKOQVMwsxnfIn6fT/lEvu5hKKuSICilioGhRy6VLW7gRDFKun/3Kn2d
 5RBVaZ5pE4tnEoflZhyK9IJhqNjP7w6J8JpSd98Brs/bffpBsLUMbOgnsOnlXYMAJ872
 mrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693234583; x=1693839383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u0Lad22grnmmVAIA9RRmXOBjrMZHt2ARUrmeTwnSYEw=;
 b=a1qple2TbMPFH0DoH8T/svQkoTGxUANKVspJTMrIYES93nybnBJ2oEE3rWkmKDRzSA
 sL6QSwwFZOW9ggzBhH/a0k1m7EYLTG2HGQprzSjMkLsd6dhz7mTWPqR50RTBqMvYM0eE
 ZXDMAc7Lu1ZJRcnucIpoujeMC3GXaDtTYFEHNfBZXy/PuC87cznWzrHnFM6og2ZRNwo1
 XoOuJxZkiHYBF4Mf1D8Bnm3EWjKs2wy9rtByw4WKSmIOOqkFzL8JpJZRUuD/XZTkq3HN
 gfIdgowZ0ScQ6re5C9LNo5hyDcd0wyaZxAI1wbRH8FxyS8MO9H1XTUF9m4L8Z+EIEsJ2
 hjjg==
X-Gm-Message-State: AOJu0Ywl2t9kSJtkbD98UUr30OUe2aTq6I31uoe+fYZ/E8w72gm5V2PE
 dW+1J3K0048jFgwylz198KvW2w==
X-Google-Smtp-Source: AGHT+IGbv+Uk8Vcgr4frmHZE/hAR3KwiyDlhIgAKewVuQuuVSlRgX4OSnz5EV/Hd5D7eHxfqLOObTw==
X-Received: by 2002:adf:f9c4:0:b0:317:690e:7b39 with SMTP id
 w4-20020adff9c4000000b00317690e7b39mr20300901wrr.12.1693234583469; 
 Mon, 28 Aug 2023 07:56:23 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a7bc4cc000000b003fed8e12d62sm11070920wmk.27.2023.08.28.07.56.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 07:56:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/8] target/helpers: Remove unnecessary 'exec/cpu_ldst.h'
 header
Date: Mon, 28 Aug 2023 16:55:43 +0200
Message-ID: <20230828145545.81165-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828145545.81165-1-philmd@linaro.org>
References: <20230828145545.81165-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

These files don't use the CPU ld/st API, remove the unnecessary
"exec/cpu_ldst.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/cris/op_helper.c              | 1 -
 target/mips/tcg/fpu_helper.c         | 1 -
 target/mips/tcg/sysemu/lcsr_helper.c | 1 -
 target/s390x/tcg/excp_helper.c       | 1 -
 target/s390x/tcg/fpu_helper.c        | 1 -
 5 files changed, 5 deletions(-)

diff --git a/target/cris/op_helper.c b/target/cris/op_helper.c
index 40cb74ce73..98a9aaf504 100644
--- a/target/cris/op_helper.c
+++ b/target/cris/op_helper.c
@@ -24,7 +24,6 @@
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 
 //#define CRIS_OP_HELPER_DEBUG
 
diff --git a/target/mips/tcg/fpu_helper.c b/target/mips/tcg/fpu_helper.c
index 8ce56ed7c8..45d593de48 100644
--- a/target/mips/tcg/fpu_helper.c
+++ b/target/mips/tcg/fpu_helper.c
@@ -25,7 +25,6 @@
 #include "internal.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 #include "fpu/softfloat.h"
 #include "fpu_helper.h"
 
diff --git a/target/mips/tcg/sysemu/lcsr_helper.c b/target/mips/tcg/sysemu/lcsr_helper.c
index 942143d209..8f97d04313 100644
--- a/target/mips/tcg/sysemu/lcsr_helper.c
+++ b/target/mips/tcg/sysemu/lcsr_helper.c
@@ -13,7 +13,6 @@
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 
 #define GET_MEMTXATTRS(cas) \
         ((MemTxAttrs){.requester_id = env_cpu(cas)->cpu_index})
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index b7116d0577..b875bf14e5 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -23,7 +23,6 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 #include "s390x-internal.h"
 #include "tcg_s390x.h"
 #ifndef CONFIG_USER_ONLY
diff --git a/target/s390x/tcg/fpu_helper.c b/target/s390x/tcg/fpu_helper.c
index c329b31261..d8bd5748fa 100644
--- a/target/s390x/tcg/fpu_helper.c
+++ b/target/s390x/tcg/fpu_helper.c
@@ -23,7 +23,6 @@
 #include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 
-- 
2.41.0


