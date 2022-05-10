Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noO3R-0001UZ-LC
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 07:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1noO3N-0001PO-Mp; Tue, 10 May 2022 07:29:22 -0400
Received: from mail-sender.a4lg.com ([153.120.152.154]:53432
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1noO3M-0005W4-6I; Tue, 10 May 2022 07:29:21 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 67378300089;
 Tue, 10 May 2022 11:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652182157;
 bh=k4cEuaC6bA4rdhfTVEofobxO31uBFWRb292qS9w0pLE=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=IPcM4zp8Wnmsz3o7xF8/IPmvYe3ke57EBOt/Flh2jlRk4NgXC/aV5SwRmDoUK6Xt3
 v3U64zxPI8k2bn6W/BPV/mMTTWIO6dVpYC/qXsGV5LjxUpK3ydkZIObYf+ZzaDz1mU
 yw7hqFxYx6efxqi5dN/sULZSWfplLygi/45erw7k=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>, Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 1/2] target/riscv: Move Zhinx* extensions on ISA string
Date: Tue, 10 May 2022 20:29:07 +0900
Message-Id: <7a988aedb249b6709f9ce5464ff359b60958ca54.1652181972.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1652181972.git.research_trasio@irq.a4lg.com>
References: <cover.1652181972.git.research_trasio@irq.a4lg.com>
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
X-List-Received-Date: Tue, 10 May 2022 11:29:24 -0000

This commit moves ISA string conversion for Zhinx and Zhinxmin extensions.
Because extension category ordering of "H" is going to be after "V",
their ordering is going to be valid (on canonical order).

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 target/riscv/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ccacdee215..9f38e56316 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -999,8 +999,6 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
         ISA_EDATA_ENTRY(zfh, ext_zfh),
         ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
         ISA_EDATA_ENTRY(zfinx, ext_zfinx),
-        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
-        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
         ISA_EDATA_ENTRY(zdinx, ext_zdinx),
         ISA_EDATA_ENTRY(zba, ext_zba),
         ISA_EDATA_ENTRY(zbb, ext_zbb),
@@ -1021,6 +1019,8 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
         ISA_EDATA_ENTRY(zkt, ext_zkt),
         ISA_EDATA_ENTRY(zve32f, ext_zve32f),
         ISA_EDATA_ENTRY(zve64f, ext_zve64f),
+        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
+        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
         ISA_EDATA_ENTRY(svinval, ext_svinval),
         ISA_EDATA_ENTRY(svnapot, ext_svnapot),
         ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
-- 
2.34.1


