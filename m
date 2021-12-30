Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2ufM-0002EE-GX
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 07:36:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ufL-0002Af-Bo
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:36:19 -0500
Received: from [2607:f8b0:4864:20::102c] (port=42702
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ufJ-0003Hx-NV
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:36:19 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso23021115pjb.1
 for <qemu-riscv@nongnu.org>; Thu, 30 Dec 2021 04:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9wox++wnUe0QyJgeLddEPWL14unUOXBGfZ5DMziXOjY=;
 b=vybBSKEJKdVBPp/RDRISyPABLuMvNp7ri8E2sIo9/kkJbLmIsbEDu9vWdQ9LRgRkgd
 F+HF2ZZQe3GaRTLZTdOH5OWoHHJkrmBKhfGua7n/ByxUlboRWn48meP/ZioZW651+GUM
 l/sxGORSyRsNdrTHSDeuEDepSmoYLZcbBn6cP9Yc55zLH3JBBUgZ13vJAvTT5QfucEAM
 g6gwnI+6ta0L7wMPl0jOo7LDvit1C3uyKn5/d2yjfEH6LE+sBFgtRDrOeqVDvsCqxhiN
 f4aE8l50txfgn9TVgS069Iz+RscQ161GqRsy8oyqjbuPPdgwdgytg99ydfGC490wKmHS
 av3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9wox++wnUe0QyJgeLddEPWL14unUOXBGfZ5DMziXOjY=;
 b=ybsLwvaAmP2m885ktqQ/Jdyk67a5rPPyOGFPKxnQPC5ebshbXUz0dqvlE2eAgFgzlS
 yKyoEmyUcCx1D+oyCE+9yvLx9JnrRdcqtEA/XZD44NkIRfZtAiZNp3Mgt7ijeb7fKyQS
 5QiU1y75Wen0LTxyDDdXQbv7PrSwbjGvZhYWsSkzO5DBycCcgVvXyEEluGhkhOFiTt9F
 TfiZkmjTzS8+QQ/64ZtzjNJXKyoVqGzeTESnwrAe6mQgeopWkE72M7vta1TUaEq08WO+
 boSpOGYDmGeRvPpPsy9e07Y/udEoQBpDp6GlT2F1kE34BxZ0dE1mbFFf62MNcxcEK+JC
 VRRw==
X-Gm-Message-State: AOAM530QzPj+YGqWZrlNnhIiYTK6IYijd5OgA4q1evC9ig9l++Nwn+3r
 liEUraq+UU4TuOcaHdsycx5ebA==
X-Google-Smtp-Source: ABdhPJyFCDv4mqSmbUfC3YGU2jtcQ1cHZa+Sialld+JUNKr0tIB1pYwzRjQP1xAe5vg0/hk9hIz6fw==
X-Received: by 2002:a17:90a:d3c2:: with SMTP id
 d2mr17747290pjw.219.1640867776018; 
 Thu, 30 Dec 2021 04:36:16 -0800 (PST)
Received: from localhost.localdomain ([171.61.71.9])
 by smtp.gmail.com with ESMTPSA id a3sm28588348pfv.47.2021.12.30.04.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 04:36:15 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 08/23] target/riscv: Allow AIA device emulation to set ireg
 rmw callback
Date: Thu, 30 Dec 2021 18:05:24 +0530
Message-Id: <20211230123539.52786-9-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211230123539.52786-1-anup@brainfault.org>
References: <20211230123539.52786-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=anup@brainfault.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 30 Dec 2021 12:36:19 -0000

From: Anup Patel <anup.patel@wdc.com>

The AIA device emulation (such as AIA IMSIC) should be able to set
(or provide) AIA ireg read-modify-write callback for each privilege
level of a RISC-V HART.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        | 23 +++++++++++++++++++++++
 target/riscv/cpu_helper.c | 14 ++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d0c1725eaf..02f3ef2c3c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -242,6 +242,22 @@ struct CPURISCVState {
     uint64_t (*rdtime_fn)(uint32_t);
     uint32_t rdtime_fn_arg;
 
+    /* machine specific AIA ireg read-modify-write callback */
+#define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein, __xlen) \
+    ((((__xlen) & 0xff) << 24) | \
+     (((__vgein) & 0x3f) << 20) | \
+     (((__virt) & 0x1) << 18) | \
+     (((__priv) & 0x3) << 16) | \
+     (__isel & 0xffff))
+#define AIA_IREG_ISEL(__ireg)                  ((__ireg) & 0xffff)
+#define AIA_IREG_PRIV(__ireg)                  (((__ireg) >> 16) & 0x3)
+#define AIA_IREG_VIRT(__ireg)                  (((__ireg) >> 18) & 0x1)
+#define AIA_IREG_VGEIN(__ireg)                 (((__ireg) >> 20) & 0x3f)
+#define AIA_IREG_XLEN(__ireg)                  (((__ireg) >> 24) & 0xff)
+    int (*aia_ireg_rmw_fn[4])(void *arg, target_ulong reg,
+        target_ulong *val, target_ulong new_val, target_ulong write_mask);
+    void *aia_ireg_rmw_fn_arg[4];
+
     /* True if in debugger mode.  */
     bool debugger;
 
@@ -397,6 +413,13 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
 void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
                              uint32_t arg);
+void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
+                                   int (*rmw_fn)(void *arg,
+                                                 target_ulong reg,
+                                                 target_ulong *val,
+                                                 target_ulong new_val,
+                                                 target_ulong write_mask),
+                                   void *rmw_fn_arg);
 #endif
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 43d6311e49..f94a36fa89 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -395,6 +395,20 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
     env->rdtime_fn_arg = arg;
 }
 
+void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
+                                   int (*rmw_fn)(void *arg,
+                                                 target_ulong reg,
+                                                 target_ulong *val,
+                                                 target_ulong new_val,
+                                                 target_ulong write_mask),
+                                   void *rmw_fn_arg)
+{
+    if (priv <= PRV_M) {
+        env->aia_ireg_rmw_fn[priv] = rmw_fn;
+        env->aia_ireg_rmw_fn_arg[priv] = rmw_fn_arg;
+    }
+}
+
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
 {
     if (newpriv > PRV_M) {
-- 
2.25.1


