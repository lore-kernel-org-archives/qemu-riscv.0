Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmYtf-00060b-JT
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 07:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt8-0004l2-DO
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:47 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt6-0002PT-9K
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:45 -0400
Received: by mail-wr1-x432.google.com with SMTP id j11so14219462wrd.2
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 04:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299823; x=1683891823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jf2N922f7MxhHGZfTcgNdzsCq9UU22b0tOdlcxX9fy8=;
 b=v/jWYxdJsgTuWFPt6wHpyVXn2fUj/zYPVBvMTgmj+8NBdxqnxOIr6zyx31dKLv5sb1
 Sfie28Z3vW3trfGGnL5kSPdiUVVO0joqiR7ai//b4jKF19uxA9okt4+bE2EHzQaCMn0x
 APUQMJmhYKtWRT+nyCENCV+Uu85AydKyV98g5lkYq/bC83I2iPAFsGkhFFEE3SP2Q6eV
 o1lkCwKEPPHNT0/j+jblNG6qAu53yve3LL6hpW/fs1KH8pQ1K9XoPeuUP7jku/Vt7lEL
 WkRnCVFnDgwIQBaEyaNazdcfYly/h8jTN64LsmhvAV4QJ4+rWdTxMUjEAZEWUstQmoJa
 vU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299823; x=1683891823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jf2N922f7MxhHGZfTcgNdzsCq9UU22b0tOdlcxX9fy8=;
 b=AQOY1buNIrHZxCzqd3xTXmmXNlVlIsLJKBqPNznqu+NfKd+tloPyoukQz0+fS87Een
 6rUZqursoVAuvdhs3DL7+32mZjFbeYNCIDWEiKb372nAizJKIXnZOW6MHvgZPotja4t9
 6oipCb32nqSgJhgWJDCMT2Zledi+pWWB1cb46NIIJyFiDcFSkflwSFTYJWdUsbRX1UXh
 bUh1j4Rkz6Z3V4KINo4yzsvbLkF2jRSFw+xSs8DtNuhIfks/n/RJo7I5F2vlHG7v91E5
 Bf/uoOguPHkLmIB+JQHrrdD7gZmeDpx6zjvmiH2X9OxCA+IjI55NrZSWO/dAWttkGmM9
 wnsQ==
X-Gm-Message-State: AAQBX9dx28WQ7hwQg8HTX9v4bmI3q+TPTbCp5foPBmtM2aru+iZNNwww
 F0urACr6iTkMK//sAFFIsHjhHA==
X-Google-Smtp-Source: AKy350Z9I8VNHI/2rTFt8qdAoLS5u/dXJyYo6UGRa8rszrfmxZje4BBdckRBqMN1zRQki3cusGc59Q==
X-Received: by 2002:a5d:4e8b:0:b0:2f5:20b:e944 with SMTP id
 e11-20020a5d4e8b000000b002f5020be944mr586206wru.29.1681299823058; 
 Wed, 12 Apr 2023 04:43:43 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 09/25] target/riscv: Use cpu_ld*_code_mmu for HLVX
Date: Wed, 12 Apr 2023 13:43:17 +0200
Message-Id: <20230412114333.118895-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 12 Apr 2023 11:43:48 -0000

Use the new functions to properly check execute permission
for the read rather than read permission.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-10-richard.henderson@linaro.org>
---
 target/riscv/op_helper.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 00bdf77f32..4a0bb5b11a 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -427,18 +427,27 @@ void helper_hyp_gvma_tlb_flush(CPURISCVState *env)
     helper_hyp_tlb_flush(env);
 }
 
+/*
+ * TODO: These implementations are not quite correct.  They perform the
+ * access using execute permission just fine, but the final PMP check
+ * is supposed to have read permission as well.  Without replicating
+ * a fair fraction of cputlb.c, fixing this requires adding new mmu_idx
+ * which would imply that exact check in tlb_fill.
+ */
 target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong address)
 {
     int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
+    MemOpIdx oi = make_memop_idx(MO_TEUW, mmu_idx);
 
-    return cpu_lduw_mmuidx_ra(env, address, mmu_idx, GETPC());
+    return cpu_ldw_code_mmu(env, address, oi, GETPC());
 }
 
 target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, target_ulong address)
 {
     int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
+    MemOpIdx oi = make_memop_idx(MO_TEUL, mmu_idx);
 
-    return cpu_ldl_mmuidx_ra(env, address, mmu_idx, GETPC());
+    return cpu_ldl_code_mmu(env, address, oi, GETPC());
 }
 
 #endif /* !CONFIG_USER_ONLY */
-- 
2.34.1


