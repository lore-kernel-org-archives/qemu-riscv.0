Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9S5C-0001Hi-A6
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 08:30:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S59-00019k-4N
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:29:59 -0500
Received: from [2607:f8b0:4864:20::102e] (port=37435
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S4s-0000eE-Po
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:29:48 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 l21-20020a17090b079500b001b49df5c4dfso3563904pjz.2
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 05:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=60MzG/lacR7Hb+AFEQUePvP7QZfHssk6zKG7j6J5Jqk=;
 b=5H+KPnvphVughuzgvyA/fgrv09nreLkemGRc7hnz4RlJQLCQyhnAU9J1YU8Eg92KLd
 bxbIvBnIGylEbtgiEStBPFRkgk/kOrY8lFcDmkL2JXOZJ1hnd8Rfzk7HeqS/07p9qTzl
 vPkEn57OBuyRZfzEpIq6lhoMNToOKTCTzzrt6RFkG+AT3tAhtJoG5HF9OpAe5P4NizWZ
 pU6x0CxwKTz8W/E3kKUj1ENipnfN2VT93rMJuEWdPKunu5YNS8RZT46TQqZR4aUwJPh2
 w6MBHvlRLOxL6BlSOVhhFHEnMxfcJfWLUy0TkN8azKa6Q1QGz9E8WOVZ//robZp4VuDm
 NxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=60MzG/lacR7Hb+AFEQUePvP7QZfHssk6zKG7j6J5Jqk=;
 b=oiXTseViAyBRxmwFR3/dDb7Z60XZQxJTPBTeQq8+wCHKgr+tQWw9xezo9qQoLIIat0
 aKVfxCbyYD92XRYiWw6MSlIiuh95FRWM+/cnXnAc4B8bCpwTe2nHpXSqORNsr+tQVev9
 vcx+mpJ6u6Gs5FtQ8DcMVzCg9f+234Lvq2mCxmzSppfJqsPShTnTa9Sv7VkH+eh7DzMQ
 9SA801oMR96mKu+k4+wAahCPJ250q8mo/7rfQKX8A4KSvdJxfX/uibeLRl9FkCyR53b2
 OE33+oY4Dj6fmgB+ARjJJsMlgqrnLZnfgivrDBLbzTYrH+JrDTpuZbVUo7J4WE0rTtHw
 PKAg==
X-Gm-Message-State: AOAM531BSinLru30GyCJna3w/mCgq9TKvITzqLht9DGEFSsm0743IIMB
 mT+fdNAQo3VgHJXSpn1tj6JL8A==
X-Google-Smtp-Source: ABdhPJxqsUl4zr2GuzwDrtmsJi/11++T/PY43btqjHYHaGMGorFNhSnD16zV/ma9G182mtvnNMrzBw==
X-Received: by 2002:a17:902:9894:b0:149:8a72:98ae with SMTP id
 s20-20020a170902989400b001498a7298aemr22818085plp.132.1642426162372; 
 Mon, 17 Jan 2022 05:29:22 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:29:21 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v7 02/23] target/riscv: Implement SGEIP bit in hip and hie CSRs
Date: Mon, 17 Jan 2022 18:58:05 +0530
Message-Id: <20220117132826.426418-3-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=anup@brainfault.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 17 Jan 2022 13:29:59 -0000

From: Anup Patel <anup.patel@wdc.com>

A hypervisor can optionally take guest external interrupts using
SGEIP bit of hip and hie CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c      |  3 ++-
 target/riscv/cpu_bits.h |  3 +++
 target/riscv/csr.c      | 18 +++++++++++-------
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9bc25d3055..b26832219f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -394,6 +394,7 @@ static void riscv_cpu_reset(DeviceState *dev)
         env->mstatus = set_field(env->mstatus, MSTATUS64_UXL, env->misa_mxl);
     }
     env->mcause = 0;
+    env->miclaim = MIP_SGEIP;
     env->pc = env->resetvec;
     env->two_stage_lookup = false;
     /* mmte is supposed to have pm.current hardwired to 1 */
@@ -637,7 +638,7 @@ static void riscv_cpu_init(Object *obj)
     cpu_set_cpustate_pointers(cpu);
 
 #ifndef CONFIG_USER_ONLY
-    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, 12);
+    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_MAX);
 #endif /* CONFIG_USER_ONLY */
 }
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 5a6d49aa64..ee6d95ea91 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -537,6 +537,8 @@ typedef enum RISCVException {
 #define IRQ_S_EXT                          9
 #define IRQ_VS_EXT                         10
 #define IRQ_M_EXT                          11
+#define IRQ_S_GEXT                         12
+#define IRQ_LOCAL_MAX                      16
 
 /* mip masks */
 #define MIP_USIP                           (1 << IRQ_U_SOFT)
@@ -551,6 +553,7 @@ typedef enum RISCVException {
 #define MIP_SEIP                           (1 << IRQ_S_EXT)
 #define MIP_VSEIP                          (1 << IRQ_VS_EXT)
 #define MIP_MEIP                           (1 << IRQ_M_EXT)
+#define MIP_SGEIP                          (1 << IRQ_S_GEXT)
 
 /* sip masks */
 #define SIP_SSIP                           MIP_SSIP
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index bee42b6073..80b9b7e732 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -446,12 +446,13 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
 #define M_MODE_INTERRUPTS  (MIP_MSIP | MIP_MTIP | MIP_MEIP)
 #define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP)
 #define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
+#define HS_MODE_INTERRUPTS (MIP_SGEIP | VS_MODE_INTERRUPTS)
 
 static const target_ulong delegable_ints = S_MODE_INTERRUPTS |
                                            VS_MODE_INTERRUPTS;
 static const target_ulong vs_delegable_ints = VS_MODE_INTERRUPTS;
 static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
-                                     VS_MODE_INTERRUPTS;
+                                     HS_MODE_INTERRUPTS;
 #define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
                          (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) | \
                          (1ULL << (RISCV_EXCP_ILLEGAL_INST)) | \
@@ -729,7 +730,7 @@ static RISCVException write_mideleg(CPURISCVState *env, int csrno,
 {
     env->mideleg = (env->mideleg & ~delegable_ints) | (val & delegable_ints);
     if (riscv_has_ext(env, RVH)) {
-        env->mideleg |= VS_MODE_INTERRUPTS;
+        env->mideleg |= HS_MODE_INTERRUPTS;
     }
     return RISCV_EXCP_NONE;
 }
@@ -745,6 +746,9 @@ static RISCVException write_mie(CPURISCVState *env, int csrno,
                                 target_ulong val)
 {
     env->mie = (env->mie & ~all_ints) | (val & all_ints);
+    if (!riscv_has_ext(env, RVH)) {
+        env->mie &= ~MIP_SGEIP;
+    }
     return RISCV_EXCP_NONE;
 }
 
@@ -1080,7 +1084,7 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
     }
 
     if (ret_value) {
-        *ret_value &= env->mideleg;
+        *ret_value &= env->mideleg & S_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1198,7 +1202,7 @@ static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
                       write_mask & hvip_writable_mask);
 
     if (ret_value) {
-        *ret_value &= hvip_writable_mask;
+        *ret_value &= VS_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1211,7 +1215,7 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
                       write_mask & hip_writable_mask);
 
     if (ret_value) {
-        *ret_value &= hip_writable_mask;
+        *ret_value &= HS_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1219,14 +1223,14 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
 static RISCVException read_hie(CPURISCVState *env, int csrno,
                                target_ulong *val)
 {
-    *val = env->mie & VS_MODE_INTERRUPTS;
+    *val = env->mie & HS_MODE_INTERRUPTS;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException write_hie(CPURISCVState *env, int csrno,
                                 target_ulong val)
 {
-    target_ulong newval = (env->mie & ~VS_MODE_INTERRUPTS) | (val & VS_MODE_INTERRUPTS);
+    target_ulong newval = (env->mie & ~HS_MODE_INTERRUPTS) | (val & HS_MODE_INTERRUPTS);
     return write_mie(env, CSR_MIE, newval);
 }
 
-- 
2.25.1


