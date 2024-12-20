Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79300E77188
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 16:49:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tOgBM-0004in-6r; Fri, 20 Dec 2024 11:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roan.richmond@codethink.co.uk>)
 id 1tOfZQ-0004ik-MU
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2024 11:09:44 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roan.richmond@codethink.co.uk>)
 id 1tOfZO-0004Zn-TG
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2024 11:09:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b1+zPpQ5Mcvtblw0ZMcm1pjDUz/Kbw26RpnAK7KzTdw=; b=Cw7yqqU+hnRXiooNVsmjSJH4G2
 hJLo30T881gVBgmUKw7f9dHoz8u6aRC1LYH/2kYUooeNHS0SFktARSKZl6gkI5mg/T3jGJC3A+ycB
 7/OAZzQt43RkaZ61gDGho35ThIUFwm5jP+LfkHeI5pc9y81tLXUnAu8bXweb+7+Ki1p+VLLDYnMtz
 NqJxk1Tmkug2lFN4mayV9OBTslpiWKNUuxvS52wmEuMeRWiq1MwCpGLlml61KNIIo+1GdaJunQ3Qc
 PDbU8Ij5+Pk6xyuXewFYOrV/0cM6LK3fx/zFECZUr66aIawvS1eXj85Qw6Sbx4IIrRSGFThDD9tx1
 ccJJHCHg==;
Received: from [167.98.27.226] (helo=codethink.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1tOfD1-00ACav-JH; Fri, 20 Dec 2024 15:46:35 +0000
From: Roan Richmond <roan.richmond@codethink.co.uk>
To: qemu-riscv@nongnu.org
Cc: lawrence.hunter@codethink.co.uk, ben.dooks@codethink.co.uk,
 felix.chong@codethink.co.uk, sagark@eecs.berkeley.edu, palmer@dabbet.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com,
 Roan Richmond <roan.richmond@codethink.co.uk>
Subject: [RFC PATCH 2/7] target/riscv: Add SSTATUS_UBE
Date: Fri, 20 Dec 2024 15:45:30 +0000
Message-ID: <20241220154616.283933-3-roan.richmond@codethink.co.uk>
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

From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>

Adds the UBE flag for SSTATUS this a read-only mirror of
MSTATUS UBE.

Authored-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Co-authored-by: Ben Dooks <ben.dooks@codethink.co.uk>
Co-authored-by: Roan Richmond <roan.richmond@codethink.co.uk>
Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 2cc12a06b6..6d8e4eaf32 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -583,6 +583,7 @@ typedef enum {
 #define SSTATUS_SIE         0x00000002
 #define SSTATUS_UPIE        0x00000010
 #define SSTATUS_SPIE        0x00000020
+#define SSTATUS_UBE         0x00000040
 #define SSTATUS_SPP         0x00000100
 #define SSTATUS_VS          0x00000600
 #define SSTATUS_FS          0x00006000
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0ee4614bf1..5e7933dea0 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2980,7 +2980,8 @@ static RISCVException read_sstatus_i128(CPURISCVState *env, int csrno,
 static RISCVException read_sstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
-    target_ulong mask = (sstatus_v1_10_mask);
+    // Allow reading from SSTATUS_UBE
+    target_ulong mask = sstatus_v1_10_mask | SSTATUS_UBE;
     if (env->xl != MXL_RV32 || env->debugger) {
         mask |= SSTATUS64_UXL;
     }
@@ -2997,7 +2998,8 @@ static RISCVException read_sstatus(CPURISCVState *env, int csrno,
 static RISCVException write_sstatus(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
-    target_ulong mask = (sstatus_v1_10_mask);
+    // Disallow writing to SSTATUS_UBE as read-only
+    target_ulong mask = (sstatus_v1_10_mask) & (~SSTATUS_UBE);
 
     if (env->xl != MXL_RV32 || env->debugger) {
         if ((val & SSTATUS64_UXL) != 0) {
-- 
2.43.0


