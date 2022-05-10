Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noO3W-0001kr-1K
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 07:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1noO3U-0001dY-24; Tue, 10 May 2022 07:29:28 -0400
Received: from mail-sender-0.a4lg.com
 ([2401:2500:203:30b:4000:6bfe:4757:0]:47836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1noO3S-0005Wf-Bk; Tue, 10 May 2022 07:29:27 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id EAC3C300089;
 Tue, 10 May 2022 11:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652182163;
 bh=6ieKT6SMeR6ROD/gvppds4+LUmTz5zlH/XobTZVD7BA=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=K3fgDvngT0t8Igu4WP+vNqnTqQSFaS8zShe6q3jg2MrWIDJEYlVbONjjiRlE6IouC
 3mz0xySKhVbqXCNg8oXG/zAsujjh2wvnZia0q8RKUk0xT3cfIhQLkcBJgUJbvcHFCI
 NVEJmuExyXwgUfENJJRqvB70krr6H55/ouFyAazo=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>, Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 2/2] target/riscv: Add short-isa-string option
Date: Tue, 10 May 2022 20:29:08 +0900
Message-Id: <7c1fe5f06b0a7646a47e9bcdddb1042bb60c69c8.1652181972.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1652181972.git.research_trasio@irq.a4lg.com>
References: <cover.1652181972.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:2500:203:30b:4000:6bfe:4757:0;
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
X-List-Received-Date: Tue, 10 May 2022 11:29:28 -0000

Because some operating systems don't correctly parse long ISA extension
string, this commit adds short-isa-string boolean option to disable
generating long ISA extension strings on Device Tree.

For instance, enabling Zfinx and Zdinx extensions and booting Linux (5.17 or
earlier) with FPU support caused a kernel panic.

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
index 9f38e56316..4db3dce25a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -879,6 +879,8 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
 
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
+
+    DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -1049,7 +1051,8 @@ char *riscv_isa_string(RISCVCPU *cpu)
         }
     }
     *p = '\0';
-    riscv_isa_string_ext(cpu, &isa_str, maxlen);
+    if (!cpu->cfg.short_isa_string)
+        riscv_isa_string_ext(cpu, &isa_str, maxlen);
     return isa_str;
 }
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fe6c9a2c92..f5ff7294c6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -425,6 +425,8 @@ struct RISCVCPUConfig {
     bool aia;
     bool debug;
     uint64_t resetvec;
+
+    bool short_isa_string;
 };
 
 typedef struct RISCVCPUConfig RISCVCPUConfig;
-- 
2.34.1


