Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSQ20-0005aQ-CQ
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 16:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSQ1v-0005YK-R6; Fri, 02 Apr 2021 16:04:31 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:49476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSQ1t-0003OI-Uq; Fri, 02 Apr 2021 16:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617393869; x=1648929869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kLrMTEgcRfPaVkkRYDE5ayo5vm3gKUAnMaJCQNv4XDo=;
 b=iBbMkjaMI/Y5sFuswWeyVHTVPYtOgMa98Q0n8f3Pu37moysqM7wxAtTq
 nD5EptdBahKJ8I9OZlw6eGwmLUSgSJbtUtrLvfnWOrnka0eVVsDpnw9bB
 5oqexCRfTlh+C40iCZO2HqXew0gjbEZ+Mysgo2wVVRJqg1HTP+G5U9h2m
 AAmn0NMwLHQ2vyMjWYn9I3az7iXyw3n0Q8TVpMZpQZ4kX3pPlXDunoHlQ
 rUNHhDnw8n30r2f7Bj0r3q1zH5KHTL+jQJW8gatveSPpyly+OvFolE/Kh
 G3y2GfmTM4Bslq69nja66JP9FYOMzz5sbK9YaPeWm7eP7DjzEX9xngwpR g==;
IronPort-SDR: O0GhO9fsYkijN83blKkE3zgietYsRExKWyX04Ysa+tfFjgWtTTxlNJCBayoQGUdpWNkNuKC3SX
 B9cyBZn8bNoluxQMgb60241Rrl9wKm0Qt+7LWQ9dGYkwarkeWEWy/t60xpNnpND7UiMSmai/DW
 QG3yCRd3gWRu325LzDa7AYZ7mtYiDfauYTLlT2hnfNh2otXOftWe9KOij4bP4JVVMgUEMNM9ev
 uo8r94524BSGJUnVcN2WWcK/LjORLTj3NME9GfmHj6SoJHZfo1V0JdEtOSZU7snwbt8zbFs8OK
 L+g=
X-IronPort-AV: E=Sophos;i="5.81,300,1610380800"; d="scan'208";a="274524876"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Apr 2021 04:04:27 +0800
IronPort-SDR: njnxs7lnOwvAkwr++xeBry8XDvrHPy1DgG8S+Kiuf3XT3B+gL0n/aAHB5Yn7VkM/3vFE9KnhAp
 0y9Ytl8rVfFBZoq1P8xx3tS+Q2nQGzzowPc/k2xwSGWcDO6sp2hkdAGk+G0z0Qdudp3Jrqd01M
 iRI66V6DBumhSyNtEJORgD9j1dMyxT4w+Bh/v9KhQJeLaacxsyKUUUamiGjJb/zJg52+FIyyJU
 9OxWBElzvp4YTYgmdeEuTSnskNO+0ZbhldQE/gr7tLqQEFb4Q1EULusPvIcd1wywja1FuiNhFA
 Dl1yHyjUzPPjTDqNl5WUnaBQ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 12:46:08 -0700
IronPort-SDR: AqewZ1lxBTY2q0v+2gT34fml1KEPq4ZLAfA1VHmsa5m9VRMluMB7wcgMrxhBx5Lw24LwgJMexm
 mw4fiJhM8rAR/arINfh4CBI8jKig8dBFiz2B63OwwVf6aJFKMN1P7BS3EyuzyE4HjF2uEqYW6B
 No60qpxdqwSsUHp8tS9RzwylEH/GcW32IX5P8JzhcuCB6njKNYs+IpG2rZ3aIBar2YlAmNTTI0
 wbkjbuDAiw6yJVti9KrXbwDjF2DiIBJzcj2ciyF9eKlV0mCd/FuhXjZYjITXWjWjZ4F9vuXVK3
 Q1s=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.80])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Apr 2021 13:04:27 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 4/8] target/riscv: Remove the hardcoded MSTATUS_SD macro
Date: Fri,  2 Apr 2021 16:02:31 -0400
Message-Id: <7efb55362999a5b709ea8e7fa0ea188e740d9c67.1617393702.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617393702.git.alistair.francis@wdc.com>
References: <cover.1617393702.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=7197bd837=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 02 Apr 2021 20:04:32 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h  | 10 ----------
 target/riscv/csr.c       | 12 ++++++++++--
 target/riscv/translate.c | 19 +++++++++++++++++--
 3 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8caab23b62..dd643d0f63 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -387,16 +387,6 @@
 #define MXL_RV64            2
 #define MXL_RV128           3
 
-#if defined(TARGET_RISCV32)
-#define MSTATUS_SD MSTATUS32_SD
-#define MISA_MXL MISA32_MXL
-#define MXL_VAL MXL_RV32
-#elif defined(TARGET_RISCV64)
-#define MSTATUS_SD MSTATUS64_SD
-#define MISA_MXL MISA64_MXL
-#define MXL_VAL MXL_RV64
-#endif
-
 /* sstatus CSR bits */
 #define SSTATUS_UIE         0x00000001
 #define SSTATUS_SIE         0x00000002
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 832c3bf7fd..6052b2d6e9 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -492,7 +492,11 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
 
     dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
             ((mstatus & MSTATUS_XS) == MSTATUS_XS);
-    mstatus = set_field(mstatus, MSTATUS_SD, dirty);
+    if (riscv_cpu_is_32bit(env)) {
+        mstatus = set_field(mstatus, MSTATUS32_SD, dirty);
+    } else {
+        mstatus = set_field(mstatus, MSTATUS64_SD, dirty);
+    }
     env->mstatus = mstatus;
 
     return 0;
@@ -564,7 +568,11 @@ static int write_misa(CPURISCVState *env, int csrno, target_ulong val)
     }
 
     /* misa.MXL writes are not supported by QEMU */
-    val = (env->misa & MISA_MXL) | (val & ~MISA_MXL);
+    if (riscv_cpu_is_32bit(env)) {
+        val = (env->misa & MISA32_MXL) | (val & ~MISA32_MXL);
+    } else {
+        val = (env->misa & MISA64_MXL) | (val & ~MISA64_MXL);
+    }
 
     /* flush translation cache */
     if (val != env->misa) {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 2f9f5ccc62..9c6d998efa 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -369,6 +369,9 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 static void mark_fs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
+    CPUState *cpu = ctx->cs;
+    CPURISCVState *env = cpu->env_ptr;
+
     if (ctx->mstatus_fs == MSTATUS_FS) {
         return;
     }
@@ -377,12 +380,24 @@ static void mark_fs_dirty(DisasContext *ctx)
 
     tmp = tcg_temp_new();
     tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
-    tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS_SD);
+    if (riscv_cpu_is_32bit(env)) {
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS32_SD);
+    } else {
+#if defined(TARGET_RISCV64)
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS64_SD);
+#endif
+    }
     tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
 
     if (ctx->virt_enabled) {
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
-        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS_SD);
+        if (riscv_cpu_is_32bit(env)) {
+            tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS32_SD);
+        } else {
+#if defined(TARGET_RISCV64)
+            tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS64_SD);
+#endif
+        }
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
     }
     tcg_temp_free(tmp);
-- 
2.31.0


