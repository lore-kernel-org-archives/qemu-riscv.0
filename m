Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mThhy-0006Z4-Ri
	for mharc-qemu-riscv@gnu.org; Fri, 24 Sep 2021 05:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThhr-0006Ro-EO; Fri, 24 Sep 2021 05:41:26 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThho-0007vY-2q; Fri, 24 Sep 2021 05:41:23 -0400
Received: by mail-wr1-x42a.google.com with SMTP id i23so25601893wrb.2;
 Fri, 24 Sep 2021 02:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KfwVihGSy9lOGZEBuM9IdCHEDMq8ZD4Rne15ZYj/c70=;
 b=YqJ30iDwZEN/xhsXgxnYpc93mFkXRjF4UhDX3Vc+hz2vW1BAo7amyqQkjeIFvAjR+n
 1PsjfDm3VqDrYES0v0Atca54m2nY3jCt8dgosT5EOWmNg7BwT/AVpcUvb4RZ+mgQrTCs
 cePk37LXsnYYer+eEE40CfoKLtN6yaz2l5HsWko381LwMUG/XW72lLVLb87DXR3xjxx0
 yuzfUzHR06owl7RwVzkg/8XWnkxNOp/GZWr46tXevq/ngwN8bXdv0F6+aUBoAIt7aiAt
 v43E5rAcm4Jf/qkXUNSfM/XjFiwpGQIjnDOcjinNHBsTDp3ZVhwpD7ZQH7vRAA1Et0Zm
 pQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KfwVihGSy9lOGZEBuM9IdCHEDMq8ZD4Rne15ZYj/c70=;
 b=t1jd5AqQJrKRfGfDRt1mm5kfhSNbmkqwaP9Ps7bHbF/8yaSIWUQklEtzLrI2hRBE1e
 kRGLdBHcWi477ZEE7fVhimEVrom3EM9blt4nbJEzgV55QMV4dqKj+KWUz0K73UkzUkbe
 Yv9zjusUF0ko1Pc4cWR3QUhSvD3EXfhHos8Pb3ig1KgU2aK5o10OEsfdgU+nnkmCeKmr
 dxN70mhk1McULkeLa7RPRis9qA2fye5qf2o4Imrbc/Xac3ZmxX7AtAF3uW3l2RfXgCbz
 qZtvwi/8VP6A2u9rOuIQQSJi+jY+BhoEZrV4SmSHYjAcZsC4/53whirHVlhZirvxYod9
 I7og==
X-Gm-Message-State: AOAM531tWqWnct2n3pFrW1MLVLST36+Y5KFTISj+av5LqoZCjv7iStql
 8kPlHxET2RUQwA2i26wnyKQRSjjbFwU=
X-Google-Smtp-Source: ABdhPJxA6MYtETK8+xbt66HYrfahWpY3+jiZaFuwAPT25Ut26aEOy7LLe9ax+5EBscg5761cQV6YcA==
X-Received: by 2002:a5d:4522:: with SMTP id j2mr9959802wra.212.1632476476662; 
 Fri, 24 Sep 2021 02:41:16 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 c9sm5920723wmb.41.2021.09.24.02.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:41:16 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v6 31/40] target/riscv: Restrict has_work() handler to sysemu
 and TCG
Date: Fri, 24 Sep 2021 11:38:38 +0200
Message-Id: <20210924093847.1014331-32-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 24 Sep 2021 09:41:27 -0000

Restrict has_work() to TCG sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/riscv/cpu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7c626d89cd7..ca76bc34d9b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -335,9 +335,9 @@ static void riscv_cpu_synchronize_from_tb(CPUState *cs,
     env->pc = tb->pc;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool riscv_cpu_has_work(CPUState *cs)
 {
-#ifndef CONFIG_USER_ONLY
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     /*
@@ -345,10 +345,8 @@ static bool riscv_cpu_has_work(CPUState *cs)
      * mode and delegation registers, but respect individual enables
      */
     return (env->mip & env->mie) != 0;
-#else
-    return true;
-#endif
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
                           target_ulong *data)
@@ -678,6 +676,7 @@ static const struct TCGCPUOps riscv_tcg_ops = {
     .tlb_fill = riscv_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = riscv_cpu_has_work,
     .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .do_interrupt = riscv_cpu_do_interrupt,
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
@@ -697,7 +696,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, riscv_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = riscv_cpu_class_by_name;
-    cc->has_work = riscv_cpu_has_work;
     cc->dump_state = riscv_cpu_dump_state;
     cc->set_pc = riscv_cpu_set_pc;
     cc->gdb_read_register = riscv_cpu_gdb_read_register;
-- 
2.31.1


