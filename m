Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lD2Z8-00036p-7p
	for mharc-qemu-riscv@gnu.org; Fri, 19 Feb 2021 04:59:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lD2Z6-00036e-Pw
 for qemu-riscv@nongnu.org; Fri, 19 Feb 2021 04:59:12 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:35398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lD2Z4-0005bq-ET
 for qemu-riscv@nongnu.org; Fri, 19 Feb 2021 04:59:12 -0500
Received: by mail-pg1-x529.google.com with SMTP id t25so3625047pga.2
 for <qemu-riscv@nongnu.org>; Fri, 19 Feb 2021 01:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=1qn/T4gGXzb6f/oBNB+E/djMv7xY9YArB3S4guVTFRQ=;
 b=nMx+OASce6UprHCsjGygsDirKCIinXSBU8EsL/fSdbu3Ti5Q1yEu9wOvZdsQHlQeE2
 tDTBF3SDlpnRFMtqL85TogimGXSmX3cfx00hU/lrKraQC9gwuVMfQSaAGHbl233Syt/9
 Vj1QLm2vpkppeQSZdrhw1M1H2JTW86plw6ppzl1QzmTgNcSGIp6dndhbm16mhWWAY2X8
 Nog+PTir/pNCK9kSzAjEDYltVzV/C68UWAntyIZlsrdhrXY1ObSaHqu1rTtzCcrPBJI0
 OMXVFvImlk0oU6khkEUFMTLg3ybSI7fIO2vUuTPegcfTtaBBgEpiNbA8t3vP7x9OIx4R
 nbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1qn/T4gGXzb6f/oBNB+E/djMv7xY9YArB3S4guVTFRQ=;
 b=I2DSfPdo+RI1O87Efqb8kC8c3xv2z06MH76ps0SMRx/EtXIZVWX/MRkBWvUapFZa41
 GgyeCLewqRJv6VHwwzxwdZBgcFF+OsxRpQhCgcDpB57HMsWyvV/zZxTqasjUW14GZvO5
 ShnjRqvMnqdzfBugr9+sZuzgz8poLzJ3ctwELLv/YMlXd7dJlKGyH4tErxUReAvCynKc
 OPnAvxEHWkABxz8vuXC6lUnz2FSS0hdV+cF0gFu8ayXZ/FqfWUnr2ryrtRDk3Cr2ON+t
 i1bsX4QObE1YckAGoXSLHSV6RZ1Hm51+d+9zxgHBrPP3nIreO3jE9f5Bf0/7H4lfRZ0q
 h9TQ==
X-Gm-Message-State: AOAM5330ELMR7HsprBNHvTonpMyqNaaMR6BjursHI5Lf9DwSezzVEjH3
 xOvCKoVde5WPbNj9yqPuy4+xaQ==
X-Google-Smtp-Source: ABdhPJxPoPiXdsbCL1PfEzQy/ZpxflD/FuRHoICW92n3MAxukh0u7Pj/PBL5OBKMSWp/ZmhgC9zifQ==
X-Received: by 2002:a62:7cd7:0:b029:1d5:727a:8fec with SMTP id
 x206-20020a627cd70000b02901d5727a8fecmr8506077pfc.15.1613728748338; 
 Fri, 19 Feb 2021 01:59:08 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f23sm1658873pfa.5.2021.02.19.01.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 01:59:07 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH] target/riscv: fix TB_FLAGS bits overlapping bug for rvv/rvh
Date: Fri, 19 Feb 2021 17:59:00 +0800
Message-Id: <20210219095902.3602-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Feb 2021 09:59:13 -0000

From: Frank Chang <frank.chang@sifive.com>

TB_FLAGS mem_idx bits was extended from 2 bits to 3 bits in
commit: c445593, but other TB_FLAGS bits for rvv and rvh were
not shift as well so these bits may overlap with each other when
rvv is enabled.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 02758ae0eb4..1b49eb9950b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -379,12 +379,13 @@ typedef CPURISCVState CPUArchState;
 typedef RISCVCPU ArchCPU;
 #include "exec/cpu-all.h"
 
-FIELD(TB_FLAGS, VL_EQ_VLMAX, 2, 1)
-FIELD(TB_FLAGS, LMUL, 3, 2)
-FIELD(TB_FLAGS, SEW, 5, 3)
-FIELD(TB_FLAGS, VILL, 8, 1)
+/* Skip mem_idx bits */
+FIELD(TB_FLAGS, VL_EQ_VLMAX, 3, 1)
+FIELD(TB_FLAGS, LMUL, 4, 2)
+FIELD(TB_FLAGS, SEW, 6, 3)
+FIELD(TB_FLAGS, VILL, 9, 1)
 /* Is a Hypervisor instruction load/store allowed? */
-FIELD(TB_FLAGS, HLSX, 9, 1)
+FIELD(TB_FLAGS, HLSX, 10, 1)
 
 bool riscv_cpu_is_32bit(CPURISCVState *env);
 
-- 
2.17.1


