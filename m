Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C819C7EE23
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 06:26:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2QtZ-0005O2-J6; Fri, 26 May 2023 02:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1q2QtW-0005Lc-GN
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 02:25:46 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1q2QtU-0000tT-TI
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 02:25:46 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-64d2a87b9daso437854b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 25 May 2023 23:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1685082343; x=1687674343;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RzWGEt/lMc6MBub8LQXlswc2gyy4f7yoq+OyVDpQFfU=;
 b=eGBnCXOk5U6QCs+qBI45VzIfQ8w5cdlSb6cijW4bCZ1sDxEV2Xm34GjHuauDWCoGZk
 OYUpCvHbHt1I01/q9auGciLX1w27vTf1mmTeoCWw8e/0U9555JIkYWJZBdDOdxULEjVb
 /kY1UevUZSlwgn9Ktv+CCPj5GNJSvze9GT6d3b1/diLGx6cxxn6zpxfxzjO/qtHjX0cC
 DmR/Yoa8lleLmzc+Efhh+Xadf/oNEEiMPmfbCSvSf2RS4L6Nr8hqPueIdE79Y70iAa0L
 wonpoQQNn2NzF5fIdmWmLEZTapHq9RcOPYHRwDPWWueUCAORyAN6XLpkCtYZY5UTJaOb
 dX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685082343; x=1687674343;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RzWGEt/lMc6MBub8LQXlswc2gyy4f7yoq+OyVDpQFfU=;
 b=AMxHsgzAIGNg4srSVc8E0iRG0AWL1aXsWXNVQQIzQ87DZj18ZWKYDPwow2EF+fJ4Pb
 wGD0dcEshFJcHRCFZiVCTR2QYT5Cqv1Ybae+DDgOuGCTwwiPzf4NKHCAeNfi2LpoU+FE
 xM/z94Mv41Iduk6Zs5FeB1RkjKQRj88m+f6U84A2nzh8YAM1gJdKsirmm8vH2wji7Sk7
 hkuje5z7Qrb6soqSrgtOQUh2aaNoWITJm6j1F8+dlQlZB/Mp4b0utghc9HMyb9W1tKro
 o+3kt8E8bAnwwiVpnCFbDkmnWFJaM2FFDFyfY4zOjVP6n1dXUbuhRisNcPn1D1xu7RTl
 /LDw==
X-Gm-Message-State: AC+VfDwyUuzbt3ZUbioKd/20BU+Pi7KF/t1VVoJwIMG2BOi8rU6Jyun5
 Etbk02Z87TQC9Pcj3I7lh5qpxg==
X-Google-Smtp-Source: ACHHUZ5Z42YYN5SIODXAhffCVXxpAIvuOqkzvx2q/2Q6nOTBGsyOS3QKV5qlWO2Czqw7NpnjO+/Vjw==
X-Received: by 2002:a05:6a20:2591:b0:10e:2fd5:5106 with SMTP id
 k17-20020a056a20259100b0010e2fd55106mr1001803pzd.35.1685082343548; 
 Thu, 25 May 2023 23:25:43 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a170902bb9800b001a94a497b50sm2429150pls.20.2023.05.25.23.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 23:25:43 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rkanwal@rivosinc.com,
 anup@brainfault.org, dbarboza@ventanamicro.com, atishp@atishpatra.org,
 vincent.chen@sifive.com, greentime.hu@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com
Cc: Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v3 6/6] target/riscv: select KVM AIA in riscv virt machine
Date: Fri, 26 May 2023 06:25:06 +0000
Message-Id: <20230526062509.31682-7-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230526062509.31682-1-yongxuan.wang@sifive.com>
References: <20230526062509.31682-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Select KVM AIA when the host kernel has in-kernel AIA chip support.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 hw/riscv/virt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 18b94888ab..57a07fa6c5 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -35,6 +35,7 @@
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
 #include "hw/riscv/numa.h"
+#include "kvm_riscv.h"
 #include "hw/intc/riscv_aclint.h"
 #include "hw/intc/riscv_aplic.h"
 #include "hw/intc/riscv_imsic.h"
@@ -1217,6 +1218,15 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
             msimode, false, aplic_m);
     }
 
+    if (kvm_irqchip_in_kernel()) {
+        kvm_riscv_aia_create(
+            aplic_s, msimode, socket,
+            VIRT_IRQCHIP_NUM_SOURCES,
+            hart_count,
+            memmap[VIRT_APLIC_S].base + socket * memmap[VIRT_APLIC_S].size,
+            memmap[VIRT_IMSIC_S].base + socket * VIRT_IMSIC_GROUP_MAX_SIZE);
+    }
+
     return kvm_enabled() ? aplic_s : aplic_m;
 }
 
-- 
2.17.1


