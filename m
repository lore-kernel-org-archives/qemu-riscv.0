Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipueQ-0004S3-RX
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jan 2020 08:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52689)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shihpo.hung@sifive.com>) id 1ipqFQ-0004wW-TP
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2020 04:06:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shihpo.hung@sifive.com>) id 1ipqFP-0006RR-Gp
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2020 04:06:28 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:43060)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <shihpo.hung@sifive.com>)
 id 1ipqFP-0006Kt-8C
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2020 04:06:27 -0500
Received: by mail-pl1-x631.google.com with SMTP id p27so604210pli.10
 for <qemu-riscv@nongnu.org>; Fri, 10 Jan 2020 01:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=WNQK8xx9OatJlEQCfvIXjtQBv2x8XXmBGEeoU6AnPS8=;
 b=EFjv9OHyELGhF5BYK6P212Lz3lrwN8WTQyhklTCR/UOxDKIed3KT4Jvjg0XTtuSOPC
 vIWZj2KKeW37Ed62auDdYVmP9G14xg/NKbV4csjczVZRDLxd/rUlanAAViDVqo5dsUg6
 fYs+T7Yvl+at+qxeia8/HmN+Vo7XupVJPPqFDjFVBA7KEj5pqi29ycSYLZHQWuGFIBEO
 Gf/GQQWBqdhpZK85oP+r5f93t0c+qNJsVDx0tPojXs/QGqTbiz1OvV2JlS7nt6fJLbVh
 ReVtISALg7gnYuUEo8qSm/wKR/HWY7bO28IaHONE1JjVVjy6V30xCAhmY/02q9q8nTC7
 StfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WNQK8xx9OatJlEQCfvIXjtQBv2x8XXmBGEeoU6AnPS8=;
 b=AbLODPXQdTYWuQOLgJqIWyeeqMpWy6yqhkbeu2m0GS+kHIeyoqDjc8pR6KPvi69ERS
 Qd9BzjZOCjz/adfMAMDY1arZEOTFem+aOp6kAJX7n9azAHLbgxGcMfto01Ren7NgzB6w
 5JlPC5OtA9zOkQBYHlDcZbZeVONXq7BlWZwqcPhv7XuHmhbgkPSUehzKsjDHAGVAUwYD
 cITlNU3A2u2xTO+JhjRg9jFMR0kKSkDD/SOmNTaWSGOmEiiaQPUziXvOq6OciF9HNNVk
 FuA6Pxm8j3xVo2kJbwDsZEnS/h7Li6vB6/OocuqAV4eIZdP/B4uSixowqsxTwccVTg6E
 U33A==
X-Gm-Message-State: APjAAAWOvvu7OTgtMviPEilJkLZDvrC2QWYYQbhL2IpLd4liGxXuK/z6
 ZlWB5V/9R6D3/ocptFCO9QdmXA==
X-Google-Smtp-Source: APXvYqzDvfvy07yaQ1SP7kTpRz/RUZGOqz4fO5g1VM37G/Xg9lfewIi2rsya9s2pzVe6UycGl7EjGw==
X-Received: by 2002:a17:90a:ba07:: with SMTP id
 s7mr3399547pjr.75.1578647185671; 
 Fri, 10 Jan 2020 01:06:25 -0800 (PST)
Received: from gamma05.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id h126sm2123220pfe.19.2020.01.10.01.06.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 10 Jan 2020 01:06:25 -0800 (PST)
From: shihpo.hung@sifive.com
To: qemu-devel@nongnu.org
Cc: ShihPo Hung <shihpo.hung@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org
Subject: [PATCH] target/riscv: Set mstatus.DS & FS correctly
Date: Fri, 10 Jan 2020 01:05:34 -0800
Message-Id: <1578647134-13216-1-git-send-email-shihpo.hung@sifive.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::631
X-Mailman-Approved-At: Fri, 10 Jan 2020 08:48:33 -0500
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
X-List-Received-Date: Fri, 10 Jan 2020 09:06:30 -0000

It was found that running libquantum on riscv-linux qemu produced an
incorrect result. After investigation, FP registers are not saved
during context switch due to incorrect mstatus.FS.

Because ctx->mstatus_fs changes dynamically during runtime, we should
remove the mstatus_fs check at the translation stage.

Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: qemu-riscv@nongnu.org
---
 target/riscv/csr.c                      | 3 +--
 target/riscv/insn_trans/trans_rvd.inc.c | 1 -
 target/riscv/insn_trans/trans_rvf.inc.c | 1 -
 target/riscv/translate.c                | 6 +-----
 4 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index da02f9f..0e34c29 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -341,8 +341,7 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
 
     mstatus = (mstatus & ~mask) | (val & mask);
 
-    dirty = (riscv_cpu_fp_enabled(env) &&
-             ((mstatus & MSTATUS_FS) == MSTATUS_FS)) |
+    dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
             ((mstatus & MSTATUS_XS) == MSTATUS_XS);
     mstatus = set_field(mstatus, MSTATUS_SD, dirty);
     env->mstatus = mstatus;
diff --git a/target/riscv/insn_trans/trans_rvd.inc.c b/target/riscv/insn_trans/trans_rvd.inc.c
index 393fa02..ea1044f 100644
--- a/target/riscv/insn_trans/trans_rvd.inc.c
+++ b/target/riscv/insn_trans/trans_rvd.inc.c
@@ -43,7 +43,6 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
 
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEQ);
 
-    mark_fs_dirty(ctx);
     tcg_temp_free(t0);
     return true;
 }
diff --git a/target/riscv/insn_trans/trans_rvf.inc.c b/target/riscv/insn_trans/trans_rvf.inc.c
index 172dbfa..e23cd63 100644
--- a/target/riscv/insn_trans/trans_rvf.inc.c
+++ b/target/riscv/insn_trans/trans_rvf.inc.c
@@ -52,7 +52,6 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUL);
 
     tcg_temp_free(t0);
-    mark_fs_dirty(ctx);
     return true;
 }
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ab6a891..4ef7300 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -386,15 +386,11 @@ static void gen_store_c(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
 static void mark_fs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
-    if (ctx->mstatus_fs == MSTATUS_FS) {
-        return;
-    }
-    /* Remember the state change for the rest of the TB.  */
-    ctx->mstatus_fs = MSTATUS_FS;
 
     tmp = tcg_temp_new();
     tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
     tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
+    tcg_gen_ori_tl(tmp, tmp, MSTATUS_SD);
     tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
     tcg_temp_free(tmp);
 }
-- 
2.7.4


