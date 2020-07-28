Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k0KwS-0003pZ-1A
	for mharc-qemu-riscv@gnu.org; Tue, 28 Jul 2020 04:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1k0KwQ-0003m9-A9
 for qemu-riscv@nongnu.org; Tue, 28 Jul 2020 04:26:30 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:51742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1k0KwO-0000pR-MS
 for qemu-riscv@nongnu.org; Tue, 28 Jul 2020 04:26:29 -0400
Received: by mail-pj1-x1043.google.com with SMTP id c6so4525601pje.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Jul 2020 01:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Id9a5vUvad08zDtt5SVSxT+Ins5Rla6YBPDd7YbMPI=;
 b=dlXP83uxY7DEtkclZ1PCWYVObqy64Rt4JDiOI2yEN4I3yjsbNGkjJBuyKNspJ74DS3
 pIGD/oIcu5ltnX5zQZlVA0lnACL1qS7JOMlx3lfbdY42IgRclDDOfvBD4DlzVKfDcguo
 +5yTg8mEXhYtVi0JhEbytHXMAwVvI7t5N8oRDBGuPHy1N6FzXt5GR+CeJjILbwtDY4Cn
 SMGoXFSx4luxEJK01KEgcqFC1Q+X0ecd1fJCmoB6DwlJ+O7xwhTWUBpI5PmgFCXq2G2S
 noeTIVz4dcdZWwRp1HrUhcXff8ZVTNWft//3Da4w7CQEe2NRbuUJ7kKPKXo8JSmVWXzo
 4T1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Id9a5vUvad08zDtt5SVSxT+Ins5Rla6YBPDd7YbMPI=;
 b=RZlN338c8h1qCUoV1iVQ6xiOoEVSO3yrrY4AF+m8F9UGGpWPlUDLTBw2gugtKa+6nG
 O3jQ7FFx6EV+Y0s37PQjZcII9Ho6qohmofDsvIYXH1Qv8ZsMiQdZaC5CNmJ6EFrNA5Fe
 o56OswZG5uS8vnk7m98rUyKGEXMna41REphZJt7wrpWzpb6inlK1S5i/Jfd+L3Yw38Oq
 2/jqgyT4x8a37kEIWEBmTsU0fjHUMpHjoTUtWAY94j2VcaCHK0eqHDy/W1WzJQBsxTck
 tV/hd72hnneeMhTYwfHXuYxQdQnjuhC1TGEg7J5atpLWd/uo2VJ5ulBVkCN5GviSdW2Y
 5tIw==
X-Gm-Message-State: AOAM531KTan1oOBm/12ZtLVrlylo+BehECK2dBf8asnhGVAGicJtTcPV
 9rCtlROwYWvZiVw90/Qc18wjVA==
X-Google-Smtp-Source: ABdhPJzVKLyk540Lx9/iqpLpZCLhoVFn0qO/YE2NBK/VHbNutIx8Q7a3x7KUFbdIU7QZV3GOxBPhVQ==
X-Received: by 2002:a17:90b:8d7:: with SMTP id
 ds23mr3405209pjb.148.1595924787293; 
 Tue, 28 Jul 2020 01:26:27 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h2sm17599747pfk.93.2020.07.28.01.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 01:26:26 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Zong Li <zong.li@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 2/4] target/riscv/pmp.c: Fix the index offset on RV64
Date: Tue, 28 Jul 2020 16:26:15 +0800
Message-Id: <efbd1fd27a166cc89228932bf498897c4b4744ef.1595924470.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1595924470.git.zong.li@sifive.com>
References: <cover.1595924470.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=zong.li@sifive.com; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 28 Jul 2020 08:26:30 -0000

On RV64, the reg_index is 2 (pmpcfg2 CSR) after the seventh pmp
entry, it is not 1 (pmpcfg1 CSR) like RV32. In the original
implementation, the second parameter of pmp_write_cfg is
"reg_index * sizeof(target_ulong)", and we get the the result
which is started from 16 if reg_index is 2, but we expect that
it should be started from 8. Separate the implementation for
RV32 and RV64 respectively.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmp.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 2a2b9f5363..aeba796484 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -318,6 +318,10 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
         return;
     }
 
+#if defined(TARGET_RISCV64)
+    reg_index >>= 1;
+#endif
+
     for (i = 0; i < sizeof(target_ulong); i++) {
         cfg_val = (val >> 8 * i)  & 0xff;
         pmp_write_cfg(env, (reg_index * sizeof(target_ulong)) + i,
@@ -335,11 +339,16 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
     target_ulong cfg_val = 0;
     target_ulong val = 0;
 
+    trace_pmpcfg_csr_read(env->mhartid, reg_index, cfg_val);
+
+#if defined(TARGET_RISCV64)
+    reg_index >>= 1;
+#endif
+
     for (i = 0; i < sizeof(target_ulong); i++) {
         val = pmp_read_cfg(env, (reg_index * sizeof(target_ulong)) + i);
         cfg_val |= (val << (i * 8));
     }
-    trace_pmpcfg_csr_read(env->mhartid, reg_index, cfg_val);
 
     return cfg_val;
 }
-- 
2.27.0


