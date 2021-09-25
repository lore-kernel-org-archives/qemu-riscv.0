Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mU93r-0002rq-Ia
	for mharc-qemu-riscv@gnu.org; Sat, 25 Sep 2021 10:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93p-0002ie-6L; Sat, 25 Sep 2021 10:53:53 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93n-0006rl-JC; Sat, 25 Sep 2021 10:53:52 -0400
Received: by mail-wr1-x436.google.com with SMTP id w17so36398676wrv.10;
 Sat, 25 Sep 2021 07:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KfwVihGSy9lOGZEBuM9IdCHEDMq8ZD4Rne15ZYj/c70=;
 b=q3KZqQlOBjDrcaSJm4Jwy/KKXubL22+x6kNrUoAW6U2VUx7YhIvaWaOxHNy8W5i6RM
 u6D+CVwGpINqvsrOpKYrenY9GbQsx7v3DAg9xy7yPRt1TjSZwCOugHiavJfSG8ehBPl8
 NNE3J1C/EHej7Mh9gFKeNfEUlDGAYtwMQ4O7zJ+3Wk4sdJkMBhLtluXvM3PrHj3w8dAf
 J7eLX4eRCDAEacU3B2ffgQJUVNbBnvszQMSX3Ds+fdW257t1kBttlSyXNJlKaaAFX+h9
 40GH+h2BmlmCRGuUr8M6QUYrmAl87R+c4U+QJ/p/GIuXE4XY+qSfXlnJX+W90m07OkPF
 H4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KfwVihGSy9lOGZEBuM9IdCHEDMq8ZD4Rne15ZYj/c70=;
 b=nCmsDwKqlJ+7dKHxwOc11o5nQ6XPfwsS9H64fHzMDW2q8sLbJwrKwPc+dj0uWRbs06
 rcEZwXCDpLl2jn8SdG8TJqBPELoSVTHuJqdOjehFHYJl9EXiPBgQ5DPkiGNoe2W/Vyiq
 GpwOW7lhUWjZIv/35/+tnkNfR9iZnueP16DbPrXBhPg8Om7OJvg7BpLyuiAUtbaoW1v5
 KNIesUGQmamuJr5HKwdI3Jz+zF5ppPgoyU9xjJFEzvt0Ob8YIPYgtFOM7NX1kQQwpduf
 PwBtUMBhCFBv/BkI+/LEw3zBkSoTl1nYjRbPJsLfX63bB1bk9R2s20PdK/zMs+Sfaz+W
 OaQA==
X-Gm-Message-State: AOAM5301TIz3yi1gW7nvXlIo6P/Ffpy+bI6PGfqf0SJdVrGxN+uUCwD3
 ygdUfdGfF4rUG9pMmj2oRDxCdYOpVdw=
X-Google-Smtp-Source: ABdhPJxqug8MHgewM08Hx5zuahM8mlKGvykQPPGxQ89lo5QLD8hB3WieG+KWNK3urSrVZReA6jD8yA==
X-Received: by 2002:a05:600c:a05:: with SMTP id
 z5mr7342567wmp.73.1632581627608; 
 Sat, 25 Sep 2021 07:53:47 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 m4sm15948511wml.28.2021.09.25.07.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:53:47 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v7 31/40] target/riscv: Restrict has_work() handler to sysemu
 and TCG
Date: Sat, 25 Sep 2021 16:51:09 +0200
Message-Id: <20210925145118.1361230-32-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
X-List-Received-Date: Sat, 25 Sep 2021 14:53:53 -0000

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


