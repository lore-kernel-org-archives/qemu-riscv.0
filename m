Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C26AE77188
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 16:49:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tOgBM-0004im-6w; Fri, 20 Dec 2024 11:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roan.richmond@codethink.co.uk>)
 id 1tOfZK-0004i6-1i
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2024 11:09:38 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roan.richmond@codethink.co.uk>)
 id 1tOfZI-0004ZS-7J
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2024 11:09:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=36DrTKGXGTI9LMk54F9rS4wm0PUUtrUUDBFQ2dbTDnY=; b=fsYbokuwxW6Ozmn86vH+XpfatN
 qAyzYYkS+tGM+BGQgrvKOgYh6qBI9W8GKsn8qzv7OFbcbuaRgE/eTy5gaH9ZKLMr1TTZjwY2aniSm
 Et4PrsBoLWx1nsd00M3zeyDi30aMW4EQPzh5D92YKXvxpC3gwGEpXW5UKtLWoOBDFxjfm8ZKlQVhc
 vTY66Z0cyLrs8b/SqchI4FWB+yBkb0zM4jJ4vObjE4ReZAxTGeXcrCY4m/7CW5JvpGw+JKkM79ftd
 dxodYgZ6scZAdwA//pjHufo1Bvi5yYwWwgwofYG+wqtoagoFdeeE7X2lkhDQ41oxIL17wTUY3X+1T
 Y+nZHw3w==;
Received: from [167.98.27.226] (helo=codethink.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1tOfD0-00ACav-Gm; Fri, 20 Dec 2024 15:46:34 +0000
From: Roan Richmond <roan.richmond@codethink.co.uk>
To: qemu-riscv@nongnu.org
Cc: lawrence.hunter@codethink.co.uk, ben.dooks@codethink.co.uk,
 felix.chong@codethink.co.uk, sagark@eecs.berkeley.edu, palmer@dabbet.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com,
 Roan Richmond <roan.richmond@codethink.co.uk>
Subject: [RFC PATCH 1/7] target/riscv: Add riscv MSTATUS_xBE CSR support
Date: Fri, 20 Dec 2024 15:45:29 +0000
Message-ID: <20241220154616.283933-2-roan.richmond@codethink.co.uk>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220154616.283933-1-roan.richmond@codethink.co.uk>
References: <20241220154616.283933-1-roan.richmond@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=78.40.148.171;
 envelope-from=roan.richmond@codethink.co.uk; helo=imap5.colo.codethink.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 20 Dec 2024 11:48:54 -0500
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

Adds the MSTATUS MBE and SBE bits which signals whether data should be treated as
little or big endian as part of the privileged ISA.

Authored-by: Roan Richmond <roan.richmond@codethink.co.uk>
Co-authored-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Co-authored-by: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
---
 target/riscv/cpu_bits.h | 2 ++
 target/riscv/csr.c      | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 385a2c67c2..2cc12a06b6 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -557,6 +557,8 @@
 #define MSTATUS_TSR         0x00400000 /* since: priv-1.10 */
 #define MSTATUS_SPELP       0x00800000 /* zicfilp */
 #define MSTATUS_MPELP       0x020000000000 /* zicfilp */
+#define MSTATUS_SBE         0x1000000000ULL
+#define MSTATUS_MBE         0x2000000000ULL
 #define MSTATUS_GVA         0x4000000000ULL
 #define MSTATUS_MPV         0x8000000000ULL
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9846770820..0ee4614bf1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1613,7 +1613,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
     mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
         MSTATUS_SPP | MSTATUS_MPRV | MSTATUS_SUM |
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
-        MSTATUS_TW;
+        MSTATUS_TW | MSTATUS_MBE;
 
     if (riscv_has_ext(env, RVF)) {
         mask |= MSTATUS_FS;
@@ -1638,6 +1638,11 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
 
     mstatus = (mstatus & ~mask) | (val & mask);
 
+    /* Handle SBE and UBE being read-only copies of MBE */
+    if (!!(mask & MSTATUS_MBE)) {
+        mstatus |= (MSTATUS_SBE | MSTATUS_UBE);
+    }
+
     env->mstatus = mstatus;
 
     /*
-- 
2.43.0


