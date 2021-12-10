Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvams-0003rJ-QK
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:57:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvams-0003oT-3N
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:57:50 -0500
Received: from [2607:f8b0:4864:20::62f] (port=43690
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamq-0006GS-KQ
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:57:49 -0500
Received: by mail-pl1-x62f.google.com with SMTP id m24so5730843pls.10
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hiC8uQWLcLsOb/zIKPQiIAoORJkRv9dekqUP4F9M2+c=;
 b=dWYdB4hEq1q4V/tcv0P51iR0Do82+AmjwTUt8lphoB7Kyv8FRO2FsuC24VFGV4GgxQ
 pyQupxSM1qmIh8WIUUlF2+NpkFHzVZuDu6fyMYvmJZ2tlPph0s9DiPi5BA8+0VYI5Z7h
 dNgEgkg+Zpgbh78e+XmNYKlfkYMyDoSZzXmtdau5PLvlP3YPaP2n8LlZ/g7SFbsJApnh
 OGsFsIvVdTwWPs1W0kQd8nPGTm7sXUHnCJIV3zKlcLfAni5lnyvC2P2zi5LPOXaInHMO
 KbTM5TJQ+L1KSsG47LkXUY0KYrVYFpRLfcrrNmFdkfuhJSUAHM83USNkWmiL1OtZ9mPn
 J7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hiC8uQWLcLsOb/zIKPQiIAoORJkRv9dekqUP4F9M2+c=;
 b=A0CU3Oa8lniPiGlPwIvJqgDAl0/SWxq0NZ42m540tapCIuw5QGIubcbUvPtdbaT5Gu
 I2K0WUTh3O3Os+WlUIUUMa/I+gOAbuJJn2HJxdctLxU1zHXQH0V2nw+gfnToWntwTq6+
 gAY5aHUJkaX8dWVdA1yjNp/IrB83+cWNip76VEVGshpKobGX3YmwIgvxgC5NDMJOxzKS
 Smhc9t5Ge51vlPHYSacbX0q70TpHv6z3lCcLevTzL7bcXsFrlSmabDZrK+hdmkpdTgyO
 auhJj2ni7ffsowysjsah6EmcjvnPVMBaFjz/wbto8v03pDOLlnHssdMQLHRm6mX4eFeh
 Ib2Q==
X-Gm-Message-State: AOAM532OQLpn1fyKPGU2JHHtwAm0+kYQTrbhZ2mdMjxJ727rlwCTY5kG
 u9lp3IGrs+hoRHphBAV1dEXc6w==
X-Google-Smtp-Source: ABdhPJwNFNFkv6midGrFUt9WGVxCpPzHZlDgE4uQTHwRxnCgoyeTi2yE26rVEtV78kK7C83yOuI4mw==
X-Received: by 2002:a17:90b:1806:: with SMTP id
 lw6mr21995801pjb.59.1639123067487; 
 Thu, 09 Dec 2021 23:57:47 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:57:47 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v11 09/77] target/riscv: rvv-1.0: add vcsr register
Date: Fri, 10 Dec 2021 15:55:55 +0800
Message-Id: <20211210075704.23951-10-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 07:57:50 -0000

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h |  7 +++++++
 target/riscv/csr.c      | 17 +++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index bb62da7549..8dc6aa62c6 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -60,9 +60,16 @@
 #define CSR_VSTART          0x008
 #define CSR_VXSAT           0x009
 #define CSR_VXRM            0x00a
+#define CSR_VCSR            0x00f
 #define CSR_VL              0xc20
 #define CSR_VTYPE           0xc21
 
+/* VCSR fields */
+#define VCSR_VXSAT_SHIFT    0
+#define VCSR_VXSAT          (0x1 << VCSR_VXSAT_SHIFT)
+#define VCSR_VXRM_SHIFT     1
+#define VCSR_VXRM           (0x3 << VCSR_VXRM_SHIFT)
+
 /* User Timers and Counters */
 #define CSR_CYCLE           0xc00
 #define CSR_TIME            0xc01
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c522260986..832ccdcf33 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -336,6 +336,22 @@ static RISCVException write_vstart(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static int read_vcsr(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = (env->vxrm << VCSR_VXRM_SHIFT) | (env->vxsat << VCSR_VXSAT_SHIFT);
+    return RISCV_EXCP_NONE;
+}
+
+static int write_vcsr(CPURISCVState *env, int csrno, target_ulong val)
+{
+#if !defined(CONFIG_USER_ONLY)
+    env->mstatus |= MSTATUS_VS;
+#endif
+    env->vxrm = (val & VCSR_VXRM) >> VCSR_VXRM_SHIFT;
+    env->vxsat = (val & VCSR_VXSAT) >> VCSR_VXSAT_SHIFT;
+    return RISCV_EXCP_NONE;
+}
+
 /* User Timers and Counters */
 static RISCVException read_instret(CPURISCVState *env, int csrno,
                                    target_ulong *val)
@@ -1816,6 +1832,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart },
     [CSR_VXSAT]    = { "vxsat",    vs,     read_vxsat,   write_vxsat  },
     [CSR_VXRM]     = { "vxrm",     vs,     read_vxrm,    write_vxrm   },
+    [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr   },
     [CSR_VL]       = { "vl",       vs,     read_vl                    },
     [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
     /* User Timers and Counters */
-- 
2.31.1


