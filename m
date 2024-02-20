Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1135C48BC3
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 11:09:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rcNzz-0002mp-Ee; Tue, 20 Feb 2024 06:09:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1rcNzy-0002mW-1v
 for qemu-riscv@nongnu.org; Tue, 20 Feb 2024 06:09:18 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1rcNzw-0006qU-C5
 for qemu-riscv@nongnu.org; Tue, 20 Feb 2024 06:09:17 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6e34d12404eso2099622b3a.2
 for <qemu-riscv@nongnu.org>; Tue, 20 Feb 2024 03:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1708427354; x=1709032154; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Iui6nq54rQcDsgj6jB1Rh+Xvf6Zd3r0QRh6O0u+AHAk=;
 b=BLn5q2Be/HX0aVE7i65cy1qgKtFhnp+bm/hAlxBFetfPeRyYokwmwRtclANEtPvjvA
 GzifG2DYF4zVy28/8SR8eIWrnV0uUQc/PHDaKmZ+j4awKJ19LjrQJfzhImlJ71/3M90a
 htOo5AsNXDhGw7/jOwlY0bMm5vMK7aXxAFGlgc3EURWVJGA9+G7OVwMcMxUzPBKvMQPZ
 W3mOCJGBAFEVDZTa/PdZj3r5UNG1VUSWn0C9hqjnsijH6qwcG0Nm1C8F7LkG4XR2xlpX
 vb4ERlXigdzRCaVGAMO3zxCgexvIggY3nVTsZtqDdjIKpFgyfrbjaYlxAu//E+3jl8JD
 Kp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708427354; x=1709032154;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Iui6nq54rQcDsgj6jB1Rh+Xvf6Zd3r0QRh6O0u+AHAk=;
 b=cBtb5U98itfdI1JZNuAFBvo4RWTnufi/lEP9VwhH8YjK+Np/lgZNiE6OhdLxjXsL+J
 LjTLjwJPhTsl7ID+H9E9KQglPocc1H/yK5FiQ539u+U28wIh2OQh0+qPIKpkKvbGdp6A
 nPcusenmMeFU9wj/z1hRyC0ze3PYyLF4aAsrji1bdhEIVYJ6ZHAy8/yFiPa5ZYkZ0rTO
 Ak0PQn0pr/GeCTBKgIUVF8quL5G2bC8sZUhmctJiLEFBhp/zFYVaaEDN6BUFqB6YtC5d
 m74In4Dlms5Cb66RYk49KaaGjD7eOaHMz940W85eBCPXQKeFNvKAnpIq2SVOZ4nUG28X
 yRyw==
X-Gm-Message-State: AOJu0YyXDtXVo38DTMtD2NuK1vjcgZy8+0jHhpDrNu/GejiIp8UJg/f7
 /UR+bykbHhXGHi9DDrtuuiQPHW7L/BHBTPgCGkmxtYI1gjMJuz+StZzraJQDQ7w=
X-Google-Smtp-Source: AGHT+IEhDHyTtTyA7mKiib5e41UpkSt7CpTe0Lwlrk5mAl590hlxjG5lmBQ2eOSrshL/JFDZqLhO3g==
X-Received: by 2002:a05:6a00:10c3:b0:6dd:d1fa:ff17 with SMTP id
 d3-20020a056a0010c300b006ddd1faff17mr18134394pfu.32.1708427354496; 
 Tue, 20 Feb 2024 03:09:14 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a63d40c000000b005d34cf68664sm6347246pgh.25.2024.02.20.03.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 03:09:14 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH] target/riscv: Add missing include guard in pmu.h
Date: Tue, 20 Feb 2024 19:08:55 +0800
Message-ID: <20240220110907.10479-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x436.google.com
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

From: Frank Chang <frank.chang@sifive.com>

Add missing include guard in pmu.h to avoid the problem of double
inclusion.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/pmu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index 505fc850d3..7c0ad661e0 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -16,6 +16,9 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#ifndef RISCV_PMU_H
+#define RISCV_PMU_H
+
 #include "cpu.h"
 #include "qapi/error.h"
 
@@ -31,3 +34,5 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx);
 void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name);
 int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
                           uint32_t ctr_idx);
+
+#endif /* RISCV_PMU_H */
-- 
2.43.0


