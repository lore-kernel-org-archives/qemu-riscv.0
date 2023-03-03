Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zW-0008Nm-FA
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zQ-0008Gw-RZ
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:08 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zP-0007qD-1e
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:08 -0500
Received: by mail-pl1-x62e.google.com with SMTP id z2so1942758plf.12
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832926;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PBboFqD/kSBEIR1p31nwYTGVAdZxVLQHofC0o83aLNg=;
 b=OCVkaDkvXnlYArcuiotlg1w5PWUPyEz28rRS1lpa+XpvF3qoFBHoJPIDl+Y5b8rE1N
 xif97/82BwVgRufN/7AN9r2EEZk/X3OEovyVwsVtzT3ipzR+KZQCtMcoOCEk1NzZEJEy
 /xl4be8J/H+gJNqw3NeOUPb6/x9x0lczK/TQ7fNUce0Jg9wmdlHwrY2mZ/RSqgGufCtb
 9FhKzqAP1QPCQdo8YATOXL4TjUl1qShE7fmZ9uq7rVUPa6BULKFV31I1QNeaH3s5lFgg
 uFbzYwzDZYoTzhI4l4UObR7Zh/9aHe8TsCDSsV+Cfs4uoVg7eq5gKCs6Iz44OkEKLYPU
 IrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832926;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBboFqD/kSBEIR1p31nwYTGVAdZxVLQHofC0o83aLNg=;
 b=xJXvcHlxI0rByO2evjiTb9YivYPWkDCk2eif9m06NY2jWJAxpbym1JX8Vshp1eIhbG
 lHb2vFOAPCr79G4yzzd+lGRepplWrI7c7yW3bqeKErDIpxHiFFHKubofj5FpIJmThsVH
 61u0DImp+C+4Ljx/lCbIHzrY4wkbuOXRCJzL7GIVh/BHGugSxami3IzkWCNZCCzFMJj3
 5EL2BQ7OY28lFYjcwIj6c1zZU9zZcAPKeSMrLF8/jQ4/o39MLXS6/WadVzSG43VGLV58
 1RySFbtW5Svoya6a1nbkDHIHmq+pfXckLn87gaj9bQjpPcXVNSm7wIcxaJ0aXMq2zNY5
 nuUw==
X-Gm-Message-State: AO0yUKVkhz8dBFPES9Dgmb2y1nRliJoHqGJwhHJC33cWzLev0w7943Aq
 eOCHxqgeqvOjQBIeALdb6rlcsN/t5ELaUOlj
X-Google-Smtp-Source: AK7set9yXCtCADC3lfxxEYaKAIqkY9b2OqkFxn1Sfy8dtJDJwjsTrwJbnvSaKYOgR4pJHBjtNliuiw==
X-Received: by 2002:a17:903:187:b0:19e:6d83:8277 with SMTP id
 z7-20020a170903018700b0019e6d838277mr1516563plg.51.1677832925945; 
 Fri, 03 Mar 2023 00:42:05 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 a17-20020a170902b59100b001991f07f41dsm952602pls.297.2023.03.03.00.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:05 -0800 (PST)
Subject: [PULL 36/59] target/riscv: gdbstub: Drop the vector CSRs in
 riscv-vector.xml
Date: Fri,  3 Mar 2023 00:37:17 -0800
Message-Id: <20230303083740.12817-37-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:09 -0000

From: Bin Meng <bmeng@tinylab.org>

It's worth noting that the vector CSR predicate() has a similar
run-time check logic to the FPU CSR. With the previous patch our
gdbstub can correctly report these vector CSRs via the CSR xml.

Commit 719d3561b269 ("target/riscv: gdb: support vector registers for rv64 & rv32")
inserted these vector CSRs in an ad-hoc, non-standard way in the
riscv-vector.xml. Now we can treat these CSRs no different from
other CSRs.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230228104035.1879882-13-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/gdbstub.c | 75 ------------------------------------------
 1 file changed, 75 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index ef52f41460..6048541606 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -127,40 +127,6 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
     return 0;
 }
 
-/*
- * Convert register index number passed by GDB to the correspond
- * vector CSR number. Vector CSRs are defined after vector registers
- * in dynamic generated riscv-vector.xml, thus the starting register index
- * of vector CSRs is 32.
- * Return 0 if register index number is out of range.
- */
-static int riscv_gdb_vector_csrno(int num_regs)
-{
-    /*
-     * The order of vector CSRs in the switch case
-     * should match with the order defined in csr_ops[].
-     */
-    switch (num_regs) {
-    case 32:
-        return CSR_VSTART;
-    case 33:
-        return CSR_VXSAT;
-    case 34:
-        return CSR_VXRM;
-    case 35:
-        return CSR_VCSR;
-    case 36:
-        return CSR_VL;
-    case 37:
-        return CSR_VTYPE;
-    case 38:
-        return CSR_VLENB;
-    default:
-        /* Unknown register. */
-        return 0;
-    }
-}
-
 static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
 {
     uint16_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
@@ -174,19 +140,6 @@ static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
         return cnt;
     }
 
-    int csrno = riscv_gdb_vector_csrno(n);
-
-    if (!csrno) {
-        return 0;
-    }
-
-    target_ulong val = 0;
-    int result = riscv_csrrw_debug(env, csrno, &val, 0, 0);
-
-    if (result == RISCV_EXCP_NONE) {
-        return gdb_get_regl(buf, val);
-    }
-
     return 0;
 }
 
@@ -201,19 +154,6 @@ static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, int n)
         return vlenb;
     }
 
-    int csrno = riscv_gdb_vector_csrno(n);
-
-    if (!csrno) {
-        return 0;
-    }
-
-    target_ulong val = ldtul_p(mem_buf);
-    int result = riscv_csrrw_debug(env, csrno, NULL, val, -1);
-
-    if (result == RISCV_EXCP_NONE) {
-        return sizeof(target_ulong);
-    }
-
     return 0;
 }
 
@@ -361,21 +301,6 @@ static int ricsv_gen_dynamic_vector_xml(CPUState *cs, int base_reg)
         num_regs++;
     }
 
-    /* Define vector CSRs */
-    const char *vector_csrs[7] = {
-        "vstart", "vxsat", "vxrm", "vcsr",
-        "vl", "vtype", "vlenb"
-    };
-
-    for (i = 0; i < 7; i++) {
-        g_string_append_printf(s,
-                               "<reg name=\"%s\" bitsize=\"%d\""
-                               " regnum=\"%d\" group=\"vector\""
-                               " type=\"int\"/>",
-                               vector_csrs[i], TARGET_LONG_BITS, base_reg++);
-        num_regs++;
-    }
-
     g_string_append_printf(s, "</feature>");
 
     cpu->dyn_vreg_xml = g_string_free(s, false);
-- 
2.39.2


