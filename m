Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmYtg-00067g-B7
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 07:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt8-0004kq-Ai
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:47 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt5-0002N2-U4
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:45 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d9so10668327wrb.11
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 04:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299822; x=1683891822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nYIzXxaKlE7pVBf36j8eV1KDqBsqyyZsO57pOhE6S3s=;
 b=ONqpGGePtrPAOKWUp+MMlXKvAAooORMK36G0DfY8L2Lp+ZSrKpcsQ2pvjEmclVEubR
 IaIlilj7qIVZ9slBvCt+e8nwPhQ1RM15ChtOwtvsPEqjypRxJoSdjHV2E26sY/se4Jp1
 okiN+cCb7Be6FCD5MJlhnSNh6L5CUE4NsDSyL02NFqjsOsit8q/MPNwFE0+ieVuZri6l
 A/JkYWgMyOyTTJa0/NvxCOVCNyQli0blYlcYhoQ7WrqAdJ+umHlBIfr8w68HV5wagZpM
 Wh7knq6ENbQtJsuHrsUx/8gr8rhyz4/nO70sRIfeG1Uv4SIZkjZS3S+BzflAHi4V/N8u
 uyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299822; x=1683891822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nYIzXxaKlE7pVBf36j8eV1KDqBsqyyZsO57pOhE6S3s=;
 b=GUebEK5duWmzH0I7gHAggptM32VAA26tVpBvupNOnKmpUcXtQWL+gnOIVQg/9bl8Oz
 y9ZPzMC2HMUMAYMyY8lfW3CJRxRmSXa6iIKrGLdWWuD8VjJdmuAK6mXbM6PK5fhSpSTr
 Xhg1ZxU8Pj1oK7YPShCpKMgZuYzvS0Y1sqye72EnefDKVUYQBBaiyt7qnhOjYXlIXBMS
 BpMYXZr3xwiafuYmpuyu9Pic7QzCnbzLo2PLakAt94xptre/rtxLce8Zdh4P2a3z/7vu
 bibmbisRMRrGnfbk6K2RqktxAd70+O9bBIikGwlyrbZkCOYyQTvZC7b3Cgy5KwOmL5r5
 HelA==
X-Gm-Message-State: AAQBX9d4JCDNArIHo5ojDPXymqT+5r7+nTV/jx3/xb4kZy8CCuurl2HV
 BifCeAe8+ACHobeSLvC2wi6PJXyg5Siu3OXqRdZiFN9m
X-Google-Smtp-Source: AKy350ZKkbH7wXDu8y2Wni6JAVagqG7zb/Dzulmic22b8y+OJKUqI4vqXZUU9+TbOngZc6Sj5JMc1Q==
X-Received: by 2002:adf:fa02:0:b0:2f2:7adf:3c67 with SMTP id
 m2-20020adffa02000000b002f27adf3c67mr3858978wrr.61.1681299822045; 
 Wed, 12 Apr 2023 04:43:42 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 08/25] accel/tcg: Add cpu_ld*_code_mmu
Date: Wed, 12 Apr 2023 13:43:16 +0200
Message-Id: <20230412114333.118895-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
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

At least RISC-V has the need to be able to perform a read
using execute permissions, outside of translation.
Add helpers to facilitate this.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-9-richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h |  9 +++++++
 accel/tcg/cputlb.c      | 48 ++++++++++++++++++++++++++++++++++
 accel/tcg/user-exec.c   | 58 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 115 insertions(+)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 09b55cc0ee..c141f0394f 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -445,6 +445,15 @@ static inline CPUTLBEntry *tlb_entry(CPUArchState *env, uintptr_t mmu_idx,
 # define cpu_stq_mmu          cpu_stq_le_mmu
 #endif
 
+uint8_t cpu_ldb_code_mmu(CPUArchState *env, abi_ptr addr,
+                         MemOpIdx oi, uintptr_t ra);
+uint16_t cpu_ldw_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t ra);
+uint32_t cpu_ldl_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t ra);
+uint64_t cpu_ldq_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t ra);
+
 uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr addr);
 uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr addr);
 uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr addr);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e984a98dc4..e62c8f3c3f 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2768,3 +2768,51 @@ uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr addr)
     MemOpIdx oi = make_memop_idx(MO_TEUQ, cpu_mmu_index(env, true));
     return full_ldq_code(env, addr, oi, 0);
 }
+
+uint8_t cpu_ldb_code_mmu(CPUArchState *env, abi_ptr addr,
+                         MemOpIdx oi, uintptr_t retaddr)
+{
+    return full_ldub_code(env, addr, oi, retaddr);
+}
+
+uint16_t cpu_ldw_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t retaddr)
+{
+    MemOp mop = get_memop(oi);
+    int idx = get_mmuidx(oi);
+    uint16_t ret;
+
+    ret = full_lduw_code(env, addr, make_memop_idx(MO_TEUW, idx), retaddr);
+    if ((mop & MO_BSWAP) != MO_TE) {
+        ret = bswap16(ret);
+    }
+    return ret;
+}
+
+uint32_t cpu_ldl_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t retaddr)
+{
+    MemOp mop = get_memop(oi);
+    int idx = get_mmuidx(oi);
+    uint32_t ret;
+
+    ret = full_ldl_code(env, addr, make_memop_idx(MO_TEUL, idx), retaddr);
+    if ((mop & MO_BSWAP) != MO_TE) {
+        ret = bswap32(ret);
+    }
+    return ret;
+}
+
+uint64_t cpu_ldq_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t retaddr)
+{
+    MemOp mop = get_memop(oi);
+    int idx = get_mmuidx(oi);
+    uint64_t ret;
+
+    ret = full_ldq_code(env, addr, make_memop_idx(MO_TEUQ, idx), retaddr);
+    if ((mop & MO_BSWAP) != MO_TE) {
+        ret = bswap64(ret);
+    }
+    return ret;
+}
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index a7e0c3e2f4..fc597a010d 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -1219,6 +1219,64 @@ uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr ptr)
     return ret;
 }
 
+uint8_t cpu_ldb_code_mmu(CPUArchState *env, abi_ptr addr,
+                         MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
+    uint8_t ret;
+
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_INST_FETCH);
+    ret = ldub_p(haddr);
+    clear_helper_retaddr();
+    return ret;
+}
+
+uint16_t cpu_ldw_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
+    uint16_t ret;
+
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_INST_FETCH);
+    ret = lduw_p(haddr);
+    clear_helper_retaddr();
+    if (get_memop(oi) & MO_BSWAP) {
+        ret = bswap16(ret);
+    }
+    return ret;
+}
+
+uint32_t cpu_ldl_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
+    uint32_t ret;
+
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_INST_FETCH);
+    ret = ldl_p(haddr);
+    clear_helper_retaddr();
+    if (get_memop(oi) & MO_BSWAP) {
+        ret = bswap32(ret);
+    }
+    return ret;
+}
+
+uint64_t cpu_ldq_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
+    uint64_t ret;
+
+    validate_memop(oi, MO_BEUQ);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    ret = ldq_p(haddr);
+    clear_helper_retaddr();
+    if (get_memop(oi) & MO_BSWAP) {
+        ret = bswap64(ret);
+    }
+    return ret;
+}
+
 #include "ldst_common.c.inc"
 
 /*
-- 
2.34.1


