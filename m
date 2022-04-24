Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1niUi2-0001Eu-4F
	for mharc-qemu-riscv@gnu.org; Sun, 24 Apr 2022 01:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1niUhx-0001CI-BS; Sun, 24 Apr 2022 01:22:54 -0400
Received: from mail-sender.a4lg.com ([153.120.152.154]:53433
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1niUhv-0003oT-Mt; Sun, 24 Apr 2022 01:22:53 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 53D7330008B;
 Sun, 24 Apr 2022 05:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1650777768;
 bh=dKbFrImL7VSqYkXRv8vbcKeRORfPMAodYyD+17ui7pI=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=tFWH3XiVrlF3qBRDBi4uTQP7QDpwKmYVshH6GJvyeehgTTpfqlHbcWU2rq3Vl3kdZ
 Ikya73J1FKy5XolJcXZAfPhNk41K4HUAM6WkOaE/f65iA/G69XecGqrIZTPxCsCbQb
 18DkuUNr0sd9Pc96oIK09PEwjJnqfiDeQ+sZTLV0=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 2/2] target/riscv: Add short-isa-string option
Date: Sun, 24 Apr 2022 14:22:36 +0900
Message-Id: <51c9f2ce37e6d1483317710ddd1e14be74a61e69.1650777360.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1650777360.git.research_trasio@irq.a4lg.com>
References: <cover.1650777360.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=153.120.152.154;
 envelope-from=research_trasio@irq.a4lg.com; helo=mail-sender-0.a4lg.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Sun, 24 Apr 2022 05:22:55 -0000

Because some operating systems don't correctly parse long ISA extension
string, this commit adds short-isa-string boolean option to disable
generating long ISA extension strings on Device Tree.

Operating Systems which short-isa-string might be helpful:

1.  Linux (5.17 or earlier)
2.  FreeBSD (at least 14.0-CURRENT)
3.  OpenBSD (at least current development version)

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 target/riscv/cpu.c | 5 ++++-
 target/riscv/cpu.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c765f7ff00..9718cd0e7e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -834,6 +834,8 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
 
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
+
+    DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -989,7 +991,8 @@ char *riscv_isa_string(RISCVCPU *cpu)
         }
     }
     *p = '\0';
-    riscv_isa_string_ext(cpu, &isa_str, maxlen);
+    if (!cpu->cfg.short_isa_string)
+        riscv_isa_string_ext(cpu, &isa_str, maxlen);
     return isa_str;
 }
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 34c22d5d3b..5b7fe32218 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -408,6 +408,8 @@ struct RISCVCPUConfig {
     bool aia;
     bool debug;
     uint64_t resetvec;
+
+    bool short_isa_string;
 };
 
 typedef struct RISCVCPUConfig RISCVCPUConfig;
-- 
2.32.0


