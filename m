Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vmP-0005Vc-1D
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45377)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkx-0002ib-T3
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkt-0004VL-Qt
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:54 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:36435)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vks-0004Te-Tj
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:51 -0500
Received: by mail-pg1-x541.google.com with SMTP id d9so675875pgu.3
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=ti9yXoRVYSbU3lnCHfDJy3KSsIWSbEVNqPE18S19cuA=;
 b=bO27781trIx6Jb8P4cLS9o4ZLvW2fBdDuDDqaN7KAgLIgoe+WgnJasaqZH8+43Dqwg
 aQt1SjyXG1PW0kJYhQbcETU2l4jkCi+gPtDPWnPa1OdnOqa6/fMutSHyIwKlHY2aMHkz
 5c/8nykpstQaytMhtNIVCcEUX477pHGOrvNlx6wm4neE+4qn8THrvQzZiX6DADEVoHzN
 gLUSDUwqFEBkwSFlBgpFCbAkIU8zcLeJd+HKyy2qsHLoSZvA4OXlFqsKCIGy0KJc792e
 LYgkVHzo3+JYfE1L+6qC1tVvRiScRM3m7hwRMpe72qz8V3yjCukH01tJjDBWvcCD4bnN
 ILYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=ti9yXoRVYSbU3lnCHfDJy3KSsIWSbEVNqPE18S19cuA=;
 b=s6KsxCI9wbBETFGBA1gKfkRjVFSmKw+GDgfzlpPQyLHopTw/5LJNXuGCEZPXrbx6ik
 DKnLSxAgcYhp6hE4Quaolu2eo9IeCQtYXjhgFjgXsS1E/EJpaqBZ/xUR15HMFBp9xxgM
 b/6nIIwiyUShDmK/i3RD6yBKadfeP6FHjW8Ce4Qw+EXR9L9KnhcpfRlgXmrYIETck+to
 twvoPHgX/08w4/Wp16TrazNifh9m5dKA5WA14RsqObBc/b9SP0DiwWpYOKRa3cBkyxeA
 4qV/rumWyhn/fc6cqb3whQqofzfMnZ1h5zLhhtAUZfpmV59mdZCmB9b9rq9CwyyJ07Ai
 Jw3g==
X-Gm-Message-State: ANhLgQ0pddXZjBilg7w2+f7TnN1eLlwzXiPQDY0R5xs6dQGhVqAc3rVu
 JJf4Au94GJlk30vt1rmS5hHrraUST8QcAw==
X-Google-Smtp-Source: ADFU+vsD7mexY3fuWO9RDMDsARNlpQPWv0gp7Nc1oiYnutmm1wMFoxjhEtag0y3u9dsrgjXXnHhhZw==
X-Received: by 2002:a05:6a00:2b7:: with SMTP id
 q23mr1555234pfs.43.1583196585979; 
 Mon, 02 Mar 2020 16:49:45 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id m16sm21984682pfh.60.2020.03.02.16.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:45 -0800 (PST)
Subject: [PULL 27/38] target/riscv: Mark both sstatus and msstatus_hs as dirty
Date: Mon,  2 Mar 2020 16:48:37 -0800
Message-Id: <20200303004848.136788-28-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:57 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Mark both sstatus and vsstatus as dirty (3).

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/translate.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index eff064dc44..3ce86adb89 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -44,6 +44,8 @@ typedef struct DisasContext {
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
     target_ulong priv_ver;
+    bool virt_enabled;
+    uint32_t opcode;
     uint32_t mstatus_fs;
     uint32_t misa;
     uint32_t mem_idx;
@@ -395,6 +397,12 @@ static void mark_fs_dirty(DisasContext *ctx)
     tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
     tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS_SD);
     tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
+
+    if (ctx->virt_enabled) {
+        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS_SD);
+        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+    }
     tcg_temp_free(tmp);
 }
 #else
@@ -742,6 +750,11 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->mem_idx = ctx->base.tb->flags & TB_FLAGS_MMU_MASK;
     ctx->mstatus_fs = ctx->base.tb->flags & TB_FLAGS_MSTATUS_FS;
     ctx->priv_ver = env->priv_ver;
+#if !defined(CONFIG_USER_ONLY)
+    ctx->virt_enabled = riscv_cpu_virt_enabled(env);
+#else
+    ctx->virt_enabled = false;
+#endif
     ctx->misa = env->misa;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
-- 
2.25.0.265.gbab2e86ba0-goog


