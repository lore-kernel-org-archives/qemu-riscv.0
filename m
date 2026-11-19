Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4284260A2627
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 16:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YWpfHbnx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xU5H0-0007Ap-Ib; Thu, 19 Nov 2026 11:46:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <suunj1331@gmail.com>)
 id 1xU5G9-0006vq-Uc
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2026 11:45:21 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <suunj1331@gmail.com>)
 id 1xU5G8-00025s-6Q
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2026 11:45:17 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2efd824d492so12673725ad.1
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2026 08:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795106714; x=1795711514; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jgpccN1w99HlO6vMNqB/j4EpMoZBvMpZ4Fxwcy0wrgs=;
 b=YWpfHbnxokyNsE18B+MND/MsPTmYkjLuxisZg05ueLrLv2NzePPNfgVrf3oDxQ6SBg
 Nzw7V+3i/2vi17h7bc4k2QJkWAUrDg9btq4GGYpe6mVtGYYaZm7KXBH2IkMGkPAeqfq/
 tSVlcdF1zXIdID5WAI6I6qA0vatzWgkBSDYL4bTvKUQO38OPCqrqvC9KZEuAOFCD7ccN
 LTSOTWmNJ0aLwoRD6cKIzhGBQramFolqtKjrpQEnGBCxs5fsHByMPEO1ZsZ5k+Z+aJih
 T7iDhis7p2JFqIe0G6QBoN4tR/f8tphoudOcWl/9XtmFHZ18OJXE4xOM+h7I+qDuOYzr
 7ROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795106714; x=1795711514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jgpccN1w99HlO6vMNqB/j4EpMoZBvMpZ4Fxwcy0wrgs=;
 b=ZUKciqPVofJ1rpc2GUh93qD5U3d68HWuuaO/yvKrYQa7Nn2et6H3yWvS0QzoErtm/K
 eu02Pvub0IO0lY0Y753uU41RK5rhyEBz5Jupsf7XMXOyNxPFPGmZ4rgxg68QT0J62MRY
 UMQa8LURlZYqP6uU+WNOYXEV8qb7k4Nhf7Qp+pcmtKNUVKH4SVFb9zlGKu64iHlzsmi9
 suuSbZ2TFJnKt7X7dm4SgnNLKX+iQnpllc10vRbYgnUbppcfNkeY9ZrVmQF2hCYHeYXD
 5Wjl1FqWXm3p1diUT3X9g66OspfAqSmttoOqyxd7AhVAY60BU9Wsdv06oAFkQGeFjift
 PDRA==
X-Gm-Message-State: APuU4Z+VQS4dPgWVQ1IrUR94g+fUcoBojrCrmQZI9B7m6UxnLT9mHuwl
 mV+0hdE7DCfrnobdcpnQp358D2K+5+ifImYReEv7WsZ+yefmRpd/4tw6
X-Gm-Gg: AZFdTZfsc6VMCc8fokQKCkgdbBWxW9mIFMU1SgGZO8zfbdw9XSgFaBXnxsLxgQk20rq
 /JzVY7m0zgXPEFK7bEDRsoh6W/Ch035VbsaA1zPOXVh37AmEz1ZhMkxCykUV013i+2CK2lIlwcZ
 LvJuioHJ3LsniTXM18DcE4Pv+KkKjy+/tJ4kRwjai6Vzz0Plhfqtw1RF6HfwTpQz//XezGwYRef
 pl7fJpHNUkTxdPfA9+rGGqfBdh2yvB7oxp2gU42Z/aiulIHf35wAMruzT+pIfJm1hEeyqQotVYg
 mIPjjuc8THJTSOD1iE9OYxtx8VGatl4OxB8ZzsbJdwDZF9gLCHWJVm/gx43dHyYQipJozEn5CNC
 /4C5cGl2bwv0JSeblHwnWa/Oi6kQ+N7CG3cOoU8UYW5JtwmQgKH/0d2qQJhZKrkR0JjJ49HJwFy
 bYqghoZuqwWIjisw2RDckYJ0uZK3BFucaKWSPutQ02OzDp46Wwbw5g+RnrrdQZAMVwr5+aGcFoK
 YRHlmlNHgHUZENj7vXVbdK70AjNaU3tKQ1vOj+eei4JW6ZvM1/ZxkAX2cGhDmF6bTWpXfOD99qs
 hBr1oi4JSTIwfVLfL6n7E/3oahm/kmS5RS+n7gnF5c8U38rqHBFGsA==
X-Received: by 2002:a17:903:4586:b0:2ef:e547:e0cd with SMTP id
 d9443c01a7336-2f03f1707d4mr4729285ad.31.1795106714293; 
 Thu, 19 Nov 2026 08:45:14 -0800 (PST)
Received: from fedora ([61.74.238.173]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2f03f10e67csm2381365ad.53.2026.11.19.08.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 08:45:13 -0800 (PST)
From: SeungJu Cheon <suunj1331@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH 2/3] target/riscv: Rebuild cached TB flags at state changes
Date: Fri, 20 Nov 2026 01:44:37 +0900
Message-ID: <20261119164438.193579-3-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261119164438.193579-1-suunj1331@gmail.com>
References: <20261119164438.193579-1-suunj1331@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=suunj1331@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add tb_flags_cached, ext_tb_flags_cached and vlmax_cached to
CPURISCVState and riscv_rebuild_tb_flags() to fill them. Call it
where the inputs of riscv_compute_tb_flags() change: CSR writes,
riscv_cpu_set_mode() (trap entry, xRET and debug mode exit), vsetvl
and vtype invalidation, itrigger updates, reset and migration
post-load.

riscv_get_tb_cpu_state() does not use the cached values yet.

Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 target/riscv/cpu.c               |  1 +
 target/riscv/cpu.h               | 19 +++++++++++++++++++
 target/riscv/machine.c           |  1 +
 target/riscv/tcg/cpu_helper.c    |  1 +
 target/riscv/tcg/csr.c           |  8 +++++++-
 target/riscv/tcg/debug.c         |  2 ++
 target/riscv/tcg/tcg-cpu.c       |  7 +++++++
 target/riscv/tcg/vector_helper.c |  2 ++
 8 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 15c27f4ce4..aff6f373d3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1122,6 +1122,7 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
         kvm_riscv_reset_vcpu(cpu);
     }
 #endif
+    riscv_rebuild_tb_flags(env);
 }
 
 static void riscv_cpu_disas_set_info(const CPUState *s, disassemble_info *info)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 49a1186bdb..517f6081d8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -262,6 +262,20 @@ struct CPUArchState {
     uint8_t vxsat;
     bool vill;
 
+    /*
+     * TB flags that depend only on state changed by CSR writes, traps,
+     * privilege changes and vsetvl; rebuilt by riscv_rebuild_tb_flags() at
+     * those points.  Bits that translated code changes directly between
+     * two lookups (FS/VS dirtying, elp, vstart, vl) are added on each
+     * lookup.  vlmax_cached is VLMAX for the current vtype when the
+     * VL_EQ_VLMAX fast path is allowed, else UINT32_MAX; vl is compared
+     * against it per lookup because fault-only-first loads shrink vl
+     * without a trap.
+     */
+    uint64_t ext_tb_flags_cached;
+    uint32_t tb_flags_cached;
+    uint32_t vlmax_cached;
+
     uint64_t pc;
     uint64_t load_res;
     uint64_t load_val;
@@ -967,6 +981,11 @@ static inline uint32_t vext_get_vlmax(uint32_t vlenb, uint32_t vsew,
 bool riscv_cpu_is_32bit(RISCVCPU *cpu);
 
 bool riscv_cpu_virt_mem_enabled(CPURISCVState *env, bool is_vm_ldst);
+#ifdef CONFIG_TCG
+void riscv_rebuild_tb_flags(CPURISCVState *env);
+#else
+static inline void riscv_rebuild_tb_flags(CPURISCVState *env) { }
+#endif
 RISCVPmPmm riscv_pm_get_pmm(CPURISCVState *env);
 RISCVPmPmm riscv_pm_get_vm_ldst_pmm(CPURISCVState *env);
 uint32_t riscv_pm_get_pmlen(RISCVPmPmm pmm);
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 0de06e9588..f0aad72706 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -388,6 +388,7 @@ static int riscv_cpu_post_load(void *opaque, int version_id)
     CPURISCVState *env = &cpu->env;
 
     env->xl = cpu_recompute_xl(env);
+    riscv_rebuild_tb_flags(env);
     return 0;
 }
 
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 58e98e975c..70c889aaa5 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -982,6 +982,7 @@ void riscv_cpu_set_mode(CPURISCVState *env, privilege_mode_t newpriv,
             riscv_cpu_interrupt(env);
         }
     }
+    riscv_rebuild_tb_flags(env);
 }
 
 /*
diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index af444e3e6f..3dbfe2dc80 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -5909,7 +5909,11 @@ static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
 
     /* execute combined read/write operation if it exists */
     if (csr_ops[csrno].op) {
-        return csr_ops[csrno].op(env, csrno, ret_value, new_value, write_mask);
+        ret = csr_ops[csrno].op(env, csrno, ret_value, new_value, write_mask);
+        if (ret == RISCV_EXCP_NONE && write_mask) {
+            riscv_rebuild_tb_flags(env);
+        }
+        return ret;
     }
 
     /*
@@ -5937,6 +5941,7 @@ static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
                 return ret;
             }
         }
+        riscv_rebuild_tb_flags(env);
     }
 
     /* return old value */
@@ -6015,6 +6020,7 @@ static RISCVException riscv_csrrw_do128(CPURISCVState *env, int csrno,
                 return ret;
             }
         }
+        riscv_rebuild_tb_flags(env);
     }
 
     /* return old value */
diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 988bc815d7..e834f80ce2 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -822,6 +822,7 @@ void HELPER(itrigger_match)(CPURISCVState *env)
             itrigger_set_pending(env, i, 1);
 
             env->itrigger_enabled = riscv_itrigger_enabled(env);
+            riscv_rebuild_tb_flags(env);
             do_trigger_action(env, i);
             itrigger_set_pending(env, i, 0);
         }
@@ -922,6 +923,7 @@ static void itrigger_reg_write(CPURISCVState *env, target_ulong index,
                           env->last_icount + itrigger_get_count(env, index));
             } else {
                 env->itrigger_enabled = riscv_itrigger_enabled(env);
+                riscv_rebuild_tb_flags(env);
             }
         }
         break;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 5c5d8fcb94..a8e744bc26 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -183,6 +183,13 @@ static void riscv_compute_tb_flags(CPURISCVState *env, uint32_t *pflags,
     *pvlmax = vlmax_cached;
 }
 
+void riscv_rebuild_tb_flags(CPURISCVState *env)
+{
+    riscv_compute_tb_flags(env, &env->tb_flags_cached,
+                           &env->ext_tb_flags_cached,
+                           &env->vlmax_cached);
+}
+
 static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
 {
     CPURISCVState *env = cpu_env(cs);
diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 917a48b510..f1898c52ff 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -56,6 +56,7 @@ static inline void reset_ill_vtype(CPURISCVState *env)
     env->vtype = 0;
     env->vl = 0;
     env->vstart = 0;
+    riscv_rebuild_tb_flags(env);
 }
 
 target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
@@ -125,6 +126,7 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
     env->vtype = s2;
     env->vstart = 0;
     env->vill = 0;
+    riscv_rebuild_tb_flags(env);
     return vl;
 }
 
-- 
2.52.0


