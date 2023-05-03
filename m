Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6Vg-0000ti-Au
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UT-0006Z7-Kh
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:01:29 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UC-0003EM-Ni
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:01:29 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fd8so28962525e9.2
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097271; x=1685689271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WrmqAOuR2/yJANGPopXn5FwM+vXCIwdTliCaNgd+uz0=;
 b=rIe0c8cDjTdQXCVqJl0v2jHbBvxP94mqgoiBFUlb6wCjzTVMUZ2ay7iC16pASFX+Nr
 sZbyVmrS32XDDdghaZOEz7m677JEm8R4jAsUbFzT3IrusSUicR9IQ6mmZHDI2aJMnz2I
 Xcf+XzHScDty3o3pSX3Dc5dDatE2N3tLB5OYrby3ceF+oOWwha7hPilAR0HgO/wNuXDV
 4VNZmekGqTWf/uEPTVu5ZOLSuuzjkhGi8R6Lh6Dn6gNfVSEMXINZ/datHdeFD7HDsLBk
 4/Kyo+XlQGHYeI+ovIPxN8sjty1+f5iXR7zvexXrefUv9Nc+BSMA+tf/Hg8GW3Jaus8n
 hpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097271; x=1685689271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WrmqAOuR2/yJANGPopXn5FwM+vXCIwdTliCaNgd+uz0=;
 b=KY7pOOByPC/XGUlQjURvO8oGvGVdSQLzxH/hKUv41Ts3YVmcBPRTdzkcC8FKL+2Oan
 vvRoD2hR3lda5p4axDelB7mCuviBF0zl4FLFjf9DzJa0MAjWYvKUWfRpuZE93QgilZbR
 okGlb7eOnytnl/nCJHh5PoheR5u7gWSfaURSy6YN4bDoqXQuDl07W/txsp2XcVCLV4Ei
 UPCyG0gkZZ2FbUy3wiBPhbVJXnDX00HaGNsT60Itzs06fyCnQZQqd0k2VypmLRA/J84e
 hPZiAnvKWjlolD03isY/fRJBKDA8G8ZplFGThgcdqS7OApvXi75up9EFmdM1Cio/0qbK
 4pWw==
X-Gm-Message-State: AC+VfDyq6Z7M1ptVwcTPG1QMr06Tu39tc62XdeemNdUp14o9dpigvh9D
 WAmOFDGDTY0sdR5zxph69KFx5w==
X-Google-Smtp-Source: ACHHUZ60Q9mwf4pgj37Gp5hFwyXyRKDCWWat8PVfR7pb3NVpF33NQqWSTs106i0pFNdJgRhgEMKy2A==
X-Received: by 2002:a7b:c4cd:0:b0:3f0:9a90:a5e7 with SMTP id
 g13-20020a7bc4cd000000b003f09a90a5e7mr14076370wmk.28.1683097271174; 
 Wed, 03 May 2023 00:01:11 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1ced02000000b003f19b3d89e9sm905035wmh.33.2023.05.03.00.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:01:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 53/54] tcg/s390x: Use ALGFR in constructing softmmu host
 address
Date: Wed,  3 May 2023 07:57:28 +0100
Message-Id: <20230503065729.1745843-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 03 May 2023 07:01:30 -0000

Rather than zero-extend the guest address into a register,
use an add instruction which zero-extends the second input.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index dfcf4d9e34..dd13326670 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -149,6 +149,7 @@ typedef enum S390Opcode {
     RRE_ALGR    = 0xb90a,
     RRE_ALCR    = 0xb998,
     RRE_ALCGR   = 0xb988,
+    RRE_ALGFR   = 0xb91a,
     RRE_CGR     = 0xb920,
     RRE_CLGR    = 0xb921,
     RRE_DLGR    = 0xb987,
@@ -1853,10 +1854,11 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_insn(s, RXY, LG, h->index, TCG_REG_R2, TCG_REG_NONE,
                  offsetof(CPUTLBEntry, addend));
 
-    h->base = addr_reg;
     if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_R3, addr_reg);
-        h->base = TCG_REG_R3;
+        tcg_out_insn(s, RRE, ALGFR, h->index, addr_reg);
+        h->base = TCG_REG_NONE;
+    } else {
+        h->base = addr_reg;
     }
     h->disp = 0;
 #else
-- 
2.34.1


