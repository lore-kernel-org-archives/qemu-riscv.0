Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mR79C-0003Rv-J3
	for mharc-qemu-riscv@gnu.org; Fri, 17 Sep 2021 02:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mR79B-0003RY-5Q
 for qemu-riscv@nongnu.org; Fri, 17 Sep 2021 02:14:53 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:42833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mR799-0006WB-0A
 for qemu-riscv@nongnu.org; Fri, 17 Sep 2021 02:14:52 -0400
Received: by mail-pf1-x42e.google.com with SMTP id q23so6129656pfs.9
 for <qemu-riscv@nongnu.org>; Thu, 16 Sep 2021 23:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ceq7xG2rKmgdAKPaWV1qoKr+d9zuGGdp+1TrLijyAjo=;
 b=k7XgeqQCmmIadrpJjgdMjmt6D0WMKQvbCXg9MsSZAnZl7xLMgRD0YD2j1gGbotyoMJ
 xlr2sZACFvaVMfkgYUKHUO24cBSP6aQBQDKGbnXp8r9JO27ctBLWqvPLFP8zucDRrTU/
 c3raEygAEj0c//eOrQaBjzs9845eRPOLnZdBcgZLyY/GGTVI0p/pf1qjVKA2C4xaFOF/
 KsAP3Ht4OhLlo1QtEmvuPx+FglJZIGnD5DX0TcWoU1EsUf8PcfpYEUEsgjWziqwPb+5f
 dhoqbzppdZvLCK/34GUz95R9LESEiIZHvIGIi+dnLJtZ2GsGjBjUspnREdBOJPlpMbTJ
 X1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ceq7xG2rKmgdAKPaWV1qoKr+d9zuGGdp+1TrLijyAjo=;
 b=61uYHNtq+vfTxbfPw5oEcTohqCE9HmLbhjJk0/O5c6kaL7cOU79OBVoZ8GUMlCzkl3
 HZTqyfhlW+x9KfsQBZ7EPpqKKmfY5yiBt+hHmONgKXTiETPh4XZh7j1L6R0dypucAJaw
 wJLoacsK8X1GoGfBFNP3RWfVD9qyC/YOERmU9yEsAGuv+EjWCAoVkJbCiWkvaKX4kp8r
 //L550O6RZp1QEhb03TFZX6hbYUhDu5jIjvnjBKfrVQ5A2NW21O8XlnduazbksUc06c/
 pC6PJv8wPTDnVzb8N3KbqaKhRCaX0lSwXI+9O+oDga6UmpGT1VilVLTLD3U/pz2X8rbu
 d2+g==
X-Gm-Message-State: AOAM531NEoOoKNLIipKHStJBDDWBlVkehrqEfJFcW3ewiycZijJQs9Sz
 TKKByCxTRmDUnnOeOhxwsRhwJg==
X-Google-Smtp-Source: ABdhPJwuGI57hbhqwKtNOeGRT/q/kKMGcZY4pE32XK0i2WQUApv9qCdJ8a+I0hWbqicGqZRuudfxDQ==
X-Received: by 2002:a65:64c3:: with SMTP id t3mr8470461pgv.244.1631859288224; 
 Thu, 16 Sep 2021 23:14:48 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id x13sm4834003pfp.133.2021.09.16.23.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 23:14:47 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2] target/riscv: Set mstatus_hs.[SD|FS] bits if Clean and V=1
 in mark_fs_dirty()
Date: Fri, 17 Sep 2021 14:14:39 +0800
Message-Id: <20210917061441.3757201-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 17 Sep 2021 06:14:53 -0000

From: Frank Chang <frank.chang@sifive.com>

When V=1, both vsstauts.FS and HS-level sstatus.FS are in effect.
Modifying the floating-point state when V=1 causes both fields to
be set to 3 (Dirty).

However, it's possible that HS-level sstatus.FS is Clean and VS-level
vsstatus.FS is Dirty at the time mark_fs_dirty() is called when V=1.
We can't early return for this case because we still need to set
sstatus.FS to Dirty according to spec.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
Tested-by: Vincent Chen <vincent.chen@sifive.com>
---
 target/riscv/cpu.h       |  3 +++
 target/riscv/translate.c | 24 +++++++++++++++---------
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e735e53e26c..c5cae45f955 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -394,6 +394,7 @@ FIELD(TB_FLAGS, SEW, 5, 3)
 FIELD(TB_FLAGS, VILL, 8, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 9, 1)
+FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
 
 bool riscv_cpu_is_32bit(CPURISCVState *env);
 
@@ -450,6 +451,8 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                 get_field(env->hstatus, HSTATUS_HU))) {
             flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
         }
+
+        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS, env->mstatus_hs);
     }
 #endif
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 74b33fa3c90..2b48db6fd02 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -58,6 +58,7 @@ typedef struct DisasContext {
     target_ulong misa;
     uint32_t opcode;
     uint32_t mstatus_fs;
+    uint32_t mstatus_hs_fs;
     uint32_t mem_idx;
     /* Remember the rounding mode encoded in the previous fp instruction,
        which we have already installed into env->fp_status.  Or -1 for
@@ -280,26 +281,30 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 static void mark_fs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
-    target_ulong sd;
+    target_ulong sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
+
+    if (ctx->virt_enabled && ctx->mstatus_hs_fs != MSTATUS_FS) {
+        /* Remember the stage change for the rest of the TB. */
+        ctx->mstatus_hs_fs = MSTATUS_FS;
+
+        tmp = tcg_temp_new();
+        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
+        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+        tcg_temp_free(tmp);
+    }
 
     if (ctx->mstatus_fs == MSTATUS_FS) {
         return;
     }
+
     /* Remember the state change for the rest of the TB.  */
     ctx->mstatus_fs = MSTATUS_FS;
 
     tmp = tcg_temp_new();
-    sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
-
     tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
     tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
     tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
-
-    if (ctx->virt_enabled) {
-        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
-        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
-        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
-    }
     tcg_temp_free(tmp);
 }
 #else
@@ -533,6 +538,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
     ctx->vlen = cpu->cfg.vlen;
+    ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
     ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
     ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
-- 
2.25.1


