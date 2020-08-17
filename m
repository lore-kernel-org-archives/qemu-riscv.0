Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7aqe-00064E-Oz
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7aqd-000604-6A
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:50:31 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:45475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7aqb-0004uM-CS
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:50:30 -0400
Received: by mail-pg1-x533.google.com with SMTP id x6so7780345pgx.12
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vtU6W/iPy1WqXusu53GCslBqK96uSeswo5m1tRYHk+c=;
 b=IOW8Iu2R4c84iDzvbdxT15pEj9jyZ3MxUAvMcKeNMJtpITHPM0wsqGaFQ9WNZp0gRU
 p5Cj6McqCQAOjVPngdiaFrkDKy4DCsQ1y97V8Wc5B8oxsUtjGTjKeBxQ/lwHeBCDOq6b
 Zm2gwomXD1iRkiNaywNR5yQL+CfKidsdf2E8CevibNw81kjp8g4ZQeFC1jO72M5iO6ZB
 h5A7kU0/UpmovWz4hQexpHe58BeDhiAz5KBb9u8Wb0J1/VFAB51/xefFv4Wz4P70XVTw
 EC/w2rMH9EjFJ59nphpi4vSYgpcqgIPOJCLRlD61mvMFbCl0lAEHLfgbDp+U1i2e566M
 b7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vtU6W/iPy1WqXusu53GCslBqK96uSeswo5m1tRYHk+c=;
 b=XymTT+xrw6l4+ZtXhz1h8bJPmbYxTgxKrkKmpNar8+lXxawCR4dRoYTD+r9dqh09Vr
 EywP9F7hhrXibIpvIn95bf5MmCJWwfN7mOvv6EnFJY7sT0QZsQoqT+0ZeJb99XWJzUzW
 PV4UK+AFKQOo08gBbwldiH/+rblau3CAPPCp0lMbyl82Ei5SF/w9vYGCn6bnERdS1AoN
 gNvE3CgkN5ZCCO8hPiXEJLJJ5Uep9O+4PflAI1ofgC7KQAs3b0wtusi7uMF5WsjmxKR4
 Vmajrs5oo0XDkIM+Fc7BULg8svAxHTZmjIpQ3T6JKoE2uknwIFYPTZhlPWNe67xu8h2e
 YVnQ==
X-Gm-Message-State: AOAM5318OwdOF33B1M4UNZSsuC+jq2BAJW/96iS2LausfGeEUGR1AUfs
 LEOSw+s/4ZKwGaR2LCgvT039Lg==
X-Google-Smtp-Source: ABdhPJysax/ps2jocNoT0CwlW3miKr1eqt2dhpaSnVBVdIjpx0cXTTvbtMHivLQIoP9BgYdJBZAD7g==
X-Received: by 2002:a65:47c4:: with SMTP id f4mr9095439pgs.234.1597654228068; 
 Mon, 17 Aug 2020 01:50:28 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:50:27 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 08/70] target/riscv: rvv-1.0: add vcsr register
Date: Mon, 17 Aug 2020 16:48:53 +0800
Message-Id: <20200817084955.28793-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x533.google.com
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
X-List-Received-Date: Mon, 17 Aug 2020 08:50:31 -0000

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_bits.h |  7 +++++++
 target/riscv/csr.c      | 21 +++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 5b0be0bb888..7afdd4814bb 100644
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
index 005839390a1..c87f2ddbf7d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -247,6 +247,26 @@ static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+static int read_vcsr(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = (env->vxrm << VCSR_VXRM_SHIFT) | (env->vxsat << VCSR_VXSAT_SHIFT);
+    return 0;
+}
+
+static int write_vcsr(CPURISCVState *env, int csrno, target_ulong val)
+{
+#if !defined(CONFIG_USER_ONLY)
+    if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+        return -1;
+    }
+    env->mstatus |= MSTATUS_VS;
+#endif
+
+    env->vxrm = (val & VCSR_VXRM) >> VCSR_VXRM_SHIFT;
+    env->vxsat = (val & VCSR_VXSAT) >> VCSR_VXSAT_SHIFT;
+    return 0;
+}
+
 /* User Timers and Counters */
 static int read_instret(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -1265,6 +1285,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VSTART] =              { vs,   read_vstart,      write_vstart      },
     [CSR_VXSAT] =               { vs,   read_vxsat,       write_vxsat       },
     [CSR_VXRM] =                { vs,   read_vxrm,        write_vxrm        },
+    [CSR_VCSR] =                { vs,   read_vcsr,        write_vcsr        },
     [CSR_VL] =                  { vs,   read_vl                             },
     [CSR_VTYPE] =               { vs,   read_vtype                          },
     /* User Timers and Counters */
-- 
2.17.1


