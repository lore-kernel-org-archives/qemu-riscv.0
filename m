Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6ESs-0006qT-Nd
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 09:07:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6ESr-0006q2-1G
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 09:07:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EGE-0004YN-Ui
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:31 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:37480)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6EGE-0004WV-Kc
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:30 -0400
Received: by mail-pg1-x544.google.com with SMTP id q206so13791116pgq.4
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=fWgGc8PQ+KSE2a4NhscIVZpeEB75XYFWyMRP6DxXz+g=;
	b=H31S0CgULOn4V1YBC5kvQckuXComzktscggg6mzpVL9UiC1mktjtQtQKwWhR1mLWwN
	Zs+5ghZ9/7hinx/MXRG2KYT0Hdu2x6riK8T66uiRYewVvQAOCTN00VR0pexbonCWAN67
	AqwAe2Ts2cceAI6q18XlxXKZVhgRLB5Off7tArZMx9dfRayVW5MimeZ9tsjX2qMZhODF
	tGQvBTlbnZTdY1b9zC95CPBFPRG13QpO5EAkhhXG0h/gA8JPSeN3CGFfk/HFPkKIdWtb
	ix57mj4+ZHz0QAaCTM1LbUL087FigizdkwCXP4QRc4vjCYDWijDj82GCjN7jHMnIqnQK
	lcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=fWgGc8PQ+KSE2a4NhscIVZpeEB75XYFWyMRP6DxXz+g=;
	b=AltyIGRUhQ8LM0nkOdRM8T20OHumfo/IaIBsIFi8/kuEzUT5TciySS3ZtGFjVbdQk6
	ED8bhlL8NHQOlrHE5UlKXqBBgYpCH/gN8Z4G3YR0NmhCDOy0qb/cisAIL5tBZ7jDoRLm
	o91eQEoOZe8Ra2mxqcqUZDY58LxGiH+DB7NJO9KBzIy4Ky412sThlznToXrd/UZP27/z
	CT7/BlS+i80+qVSo8hanjKR+ZmuOTuBn0FDWhGXWzPi8pOwlNUZUoiryp8tEmXP2a1St
	i/rLxeZJsqTYcyuNP4fjOfjz1KunLpYxoOUOttGb1FWpmLSK5fDBQHb3yaytFu8kVR5y
	aB8g==
X-Gm-Message-State: APjAAAVKxPlkr9p6jucybgoCnlAMV6wF2HivBhwYmnGdAPDQq3El1qcI
	tbPrBzROPuGm1KEZjOFRSDPQR8QNkjoDjFNq
X-Google-Smtp-Source: APXvYqzH4m9ZginoqoGeNbvfw7hQZ3H6dgIL8ZHdPCui9T/6P5JW/v1HRHhPToovw9RvjUKn0DCyZg==
X-Received: by 2002:a17:902:7242:: with SMTP id
	c2mr24916880pll.245.1553000069416; 
	Tue, 19 Mar 2019 05:54:29 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id v2sm957853pgj.62.2019.03.19.05.54.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 05:54:28 -0700 (PDT)
Date: Tue, 19 Mar 2019 05:47:50 -0700
Message-Id: <20190319124803.13826-7-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190319124803.13826-1-palmer@sifive.com>
References: <20190319124803.13826-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-riscv] [PULL 06/19] riscv: pmp: Log pmp access errors as
 guest errors
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2019 13:07:33 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/pmp.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 15a5366616bd..b11c4ae22fbc 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -113,10 +113,11 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
             env->pmp_state.pmp[pmp_index].cfg_reg = val;
             pmp_update_rule(env, pmp_index);
         } else {
-            PMP_DEBUG("ignoring write - locked");
+            qemu_log_mask(LOG_GUEST_ERROR, "ignoring pmpcfg write - locked\n");
         }
     } else {
-        PMP_DEBUG("ignoring write - out of bounds");
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ignoring pmpcfg write - out of bounds\n");
     }
 }
 
@@ -249,7 +250,8 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
 
         /* partially inside */
         if ((s + e) == 1) {
-            PMP_DEBUG("pmp violation - access is partially inside");
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "pmp violation - access is partially inside\n");
             ret = 0;
             break;
         }
@@ -306,7 +308,8 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
         env->mhartid, reg_index, val);
 
     if ((reg_index & 1) && (sizeof(target_ulong) == 8)) {
-        PMP_DEBUG("ignoring write - incorrect address");
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ignoring pmpcfg write - incorrect address\n");
         return;
     }
 
@@ -353,10 +356,12 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
             env->pmp_state.pmp[addr_index].addr_reg = val;
             pmp_update_rule(env, addr_index);
         } else {
-            PMP_DEBUG("ignoring write - locked");
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "ignoring pmpaddr write - locked\n");
         }
     } else {
-        PMP_DEBUG("ignoring write - out of bounds");
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ignoring pmpaddr write - out of bounds\n");
     }
 }
 
@@ -372,7 +377,8 @@ target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
     if (addr_index < MAX_RISCV_PMPS) {
         return env->pmp_state.pmp[addr_index].addr_reg;
     } else {
-        PMP_DEBUG("ignoring read - out of bounds");
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ignoring pmpaddr read - out of bounds\n");
         return 0;
     }
 }
-- 
2.19.2


