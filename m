Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrWyE-0000ts-Rx
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:04:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWyB-0000pL-Sd
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:04:44 -0500
Received: from [2607:f8b0:4864:20::535] (port=45729
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWxu-0008RC-MM
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:04:35 -0500
Received: by mail-pg1-x535.google.com with SMTP id c29so3504117pgl.12
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pW7IA4ZZdUVEg/kVbkaG3JEXuXZZHLq94h4l5Oev8Ss=;
 b=SbsgWypZSRyZQEolmpNur2tZUe+MKwUKn1+DMr9wFlDB1QT7EH8e1j0P8gx1ehz8iL
 jLBOTZ1NaJnm7Wod20EdLHkO4dpLlL9hiE66/kKrf8Mr1kcoGGNMtbcuAQXb6OPzoN3A
 uTMV9qFc0ld+2ww3tDTv4Eg0UW2MGS8BKqEsMKB39b7eAKfn1IIGHd7c770yFM0AXMjG
 C5tE3KjHbdIG2RTpMHwrVoWD2kR+qdyZ8YYd6jvzEHygpQivkqNbwkIbJBSfAaL0b7x5
 5+ZKnVn2/XswrSlRSvK+TtLLeVBkp9OVd2o2nL0GmL2gqvZdFTfqQJMWTz8uydqkkHYU
 BuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pW7IA4ZZdUVEg/kVbkaG3JEXuXZZHLq94h4l5Oev8Ss=;
 b=yi6s2rug+0O1K6MvfKkfYC5fW9l8SNpl71Mr077d2+AnrUU7hCBUoy70c5IXycQOLu
 BuRXod+JHUEuGmA2zZHg5Z+/DPwEjNwXPEhdOnR7MzoExrerB9tR3aQqaZHyVI/r+Nbq
 zTPkyySKjF1dVM8jUmZfDVj6RAAew774dhkcRE7JjEl8zOHrn8wamKJN/0dWikLpqg+r
 vaqu4MGE3x0gEHy6GL1guoxaC/OlHR422xMsHEXKV4cVFlW6qY+vYgbJ/QXS+gHB69zX
 RO5vLyyWJI5XwB5V1M2nYLSzJSfi/TnbIrTLZfqX8vZfTyTvUc833j2GsEKyUpniSkEZ
 OrRg==
X-Gm-Message-State: AOAM531oOkOsCzE1pnHuznOexIJE6o+33hS98OAzALKfEMsxnExQLTyH
 wGays+JnljWSB7gowACNbY+rXQ==
X-Google-Smtp-Source: ABdhPJwQmwVDI8QaXwxvu4n/268wVwX6lh1pW1GlKCE/EmGvODUxthWbTDOs0otoVBxZ+WBW2g0Ssg==
X-Received: by 2002:a63:78c:: with SMTP id 134mr13520120pgh.373.1638155065352; 
 Sun, 28 Nov 2021 19:04:25 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:04:25 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 09/77] target/riscv: rvv-1.0: add vcsr register
Date: Mon, 29 Nov 2021 11:02:29 +0800
Message-Id: <20211129030340.429689-10-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:04:44 -0000

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
index bb62da7549d..8dc6aa62c64 100644
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
index c522260986c..832ccdcf331 100644
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
2.25.1


