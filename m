Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC9AE7718E
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 16:49:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tOgBN-0004jb-Aj; Fri, 20 Dec 2024 11:48:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roan.richmond@codethink.co.uk>)
 id 1tOfZc-0004km-6e
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2024 11:09:56 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roan.richmond@codethink.co.uk>)
 id 1tOfZZ-0004bN-L9
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2024 11:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zvu+YwvZbw9uIeYUrWtglSZQQov/EL1DRBaiTUmtjDk=; b=aeN75+HZ21172i136EUi0jbUJO
 mO+VZsXjftkrvMDY3NxW0Qhw9YCs/Y+D50h4vn4BAkS0Wibsddy1l8gmhbHeB2zNMhVfuPP3HoCFP
 GmzXcGsQuHTdLU/Jh0dE8BQS9jnw+Kn/E5iag2z3ppS6+/klNyj8eOhx7+1cPmP4gz0zGdxrDnNuf
 HtHUQ72Kf3/Z2MIsvuzSl0LJpnKKLJs/12aVTd5o6e3n+X/NchVWNMdECal8XyQQzUSLYKuLPmAL1
 5yVDuCXy+NDXSzQOuBsIEI80nk/uQNj5nkej2dQne1v1L7YNpJlt8m3nufiuAeDWcKfziBam8yAY/
 GZIpk5Jw==;
Received: from [167.98.27.226] (helo=codethink.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1tOfD3-00ACav-Qe; Fri, 20 Dec 2024 15:46:37 +0000
From: Roan Richmond <roan.richmond@codethink.co.uk>
To: qemu-riscv@nongnu.org
Cc: lawrence.hunter@codethink.co.uk, ben.dooks@codethink.co.uk,
 felix.chong@codethink.co.uk, sagark@eecs.berkeley.edu, palmer@dabbet.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com,
 Roan Richmond <roan.richmond@codethink.co.uk>
Subject: [RFC PATCH 4/7] target/riscv: Add sfence.vma for endian change
Date: Fri, 20 Dec 2024 15:45:32 +0000
Message-ID: <20241220154616.283933-5-roan.richmond@codethink.co.uk>
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

Adds the required sfence.vma on endian switch.

Authored-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Co-authored-by: Ben Dooks <ben.dooks@codethink.co.uk>
Co-authored-by: Roan Richmond <roan.richmond@codethink.co.uk>
Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
---
 target/riscv/csr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5e7933dea0..f5612f9d3c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1643,6 +1643,12 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
         mstatus |= (MSTATUS_SBE | MSTATUS_UBE);
     }
 
+    /* Check for an endian change */
+    if ((env->mstatus & MSTATUS_MBE) != (mstatus & MSTATUS_MBE)) {
+        // Equivalent of sfence.vma
+        tlb_flush(env_cpu(env));
+    }
+
     env->mstatus = mstatus;
 
     /*
-- 
2.43.0


