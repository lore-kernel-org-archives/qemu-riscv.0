Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF9DC3DA4A
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 18:55:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sgU0n-00057h-JL; Tue, 20 Aug 2024 14:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sgU0h-00056j-Uo
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2024 14:55:15 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sgU0c-0005Bu-0u
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2024 14:55:14 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-202146e93f6so44408485ad.3
 for <qemu-riscv@nongnu.org>; Tue, 20 Aug 2024 11:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724180108; x=1724784908;
 darn=nongnu.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=v3UL0/1VKL/SQRIm7NwGaxYLo6bV/O0OuQpiI+r2DsQ=;
 b=USggBB7KGlXUwkDLXIHCFF15AXjh2Wh75v+bwEPgr0bg3kZTnmHcyzTXSJnlQvZKk6
 +DkY9bNdbQaCNtU1utbdaZgcyHqlaFt4lsKr/sF9YenI30z+/VxAlU3ZLf/NyFn/V+fk
 bcU1zP85QVdunQ832CklEtaTp/QY75C+afmAxbGlsyNDb1irxNgeJuucBprHP1ZX4MC3
 J+ukA0210iY0qytBrsJ23+QmjLBpWMbZUQ3NeWB3AniVy94uudRb+lhIwEw2EPrQNnTh
 T1HYjrI7l6L/ypALhyclFs0he9Er0+fVmArgfOFWRKryRsGKfh5vAjuRxEr5vDMLDdng
 qoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724180108; x=1724784908;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v3UL0/1VKL/SQRIm7NwGaxYLo6bV/O0OuQpiI+r2DsQ=;
 b=ZqYelWmZGAqcOsnooQawesbpit1pU9EOp8rpJ5cEXkuGqBe6Zo4c8LckLnjGd6jD1m
 mvyiH5yvfi5kqLcJ1DZhKy3K9RHeBJVc5JmtL10M6E84DsBlhyYgUY5jyVaV8H8pqkY2
 oR5ql4t/NVfesSxjqwWrcqYQ/AETjHSIlf2LZRvRP0HjGpR+M08G0rCqOD+jbkjvNPGm
 B3qkXg8A6ZLOmmiKkBTKKXB22cVr1RlStXOnQvzCqMauhpcA+asFGs/D0WPUrjahTMdY
 zK/jQ2XzMMe54Ge3ctPpY1U41wyYEM4LLxf8j4GNWm2OSPk4dR65s0aFOVOhQRdzL9lB
 UTlg==
X-Gm-Message-State: AOJu0Yymxs0ytX259XSEG4S7qq52Q/jYkhE9N2rvp1pcMzGhcPCG5MUH
 udxZNaJxSi33eXwWL0YDsR8fLnEmi0nCs+p3gU6Mk28WvvbpvZ6ZWYQRMIxZzfCFtK8VLgzBJLL
 n
X-Google-Smtp-Source: AGHT+IGj5KwHXVm4kpTRpBd6wDr3dMidftFH5xLTPnx0ihatX9uAEU71UsvzszrvXXSwvWnaFRw3pw==
X-Received: by 2002:a17:902:ec89:b0:202:162c:1f29 with SMTP id
 d9443c01a7336-202162c2262mr171287735ad.47.1724180107858; 
 Tue, 20 Aug 2024 11:55:07 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f03a3607sm81259905ad.250.2024.08.20.11.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 11:55:07 -0700 (PDT)
Date: Tue, 20 Aug 2024 11:55:05 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jim.shu@sifive.com, andy.chiu@sifive.com, kito.cheng@sifive.com
Subject: Re: [PATCH v5 11/15] target/riscv: mmu changes for zicfiss shadow
 stack protection
Message-ID: <ZsTmibCvaZJpEAPO@debug.ba.rivosinc.com>
References: <20240820000129.3522346-1-debug@rivosinc.com>
 <20240820000129.3522346-12-debug@rivosinc.com>
 <ZsRHPDG/GkyhdrQi@debug.ba.rivosinc.com>
 <c0afdd87-71c1-4b02-a2fb-5c9349205d8f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0afdd87-71c1-4b02-a2fb-5c9349205d8f@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Aug 20, 2024 at 07:20:48PM +1000, Richard Henderson wrote:
>On 8/20/24 17:35, Deepak Gupta wrote:
>>>+    /* If shadow stack instruction initiated this access, treat it as store */
>>>+    if (mmu_idx & MMU_IDX_SS_WRITE) {
>>>+        access_type = MMU_DATA_STORE;
>>>+    }
>>>+
>>
>>I think I forgot to address this. Do you still want me to fix this up like you
>>had suggested?
>
>Yes, this still needs fixing.
>
>
>>IIRC, you mentioned to use TARGET_INSN_START_EXTRA_WORDS=2. Honestly I don't know
>>what it means and how its used. Based on git grep and some readup, 
>>are you expecting something
>>along the below lines?
>>
>>
>>"""
>>
>>diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>index fee31b8037..dfd2efa941 100644
>>--- a/target/riscv/cpu.h
>>+++ b/target/riscv/cpu.h
>>@@ -47,7 +47,7 @@ typedef struct CPUArchState CPURISCVState;
>>   * RISC-V-specific extra insn start words:
>>   * 1: Original instruction opcode
>>   */
>>-#define TARGET_INSN_START_EXTRA_WORDS 1
>>+#define TARGET_INSN_START_EXTRA_WORDS 2
>>
>>  #define RV(x) ((target_ulong)1 << (x - 'A'))
>>
>>diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>index f74a1216b1..b266177e46 100644
>>--- a/target/riscv/cpu_helper.c
>>+++ b/target/riscv/cpu_helper.c
>>@@ -1271,6 +1271,11 @@ static void raise_mmu_exception(CPURISCVState 
>>*env, target_ulong address,
>>  {
>>      CPUState *cs = env_cpu(env);
>>
>>+     if (!pmp_violation &&
>>+         tcg_ctx->gen_insn_data[TARGET_INSN_START_EXTRA_WORDS-1] & 1) {
>>+         tcg_ctx->gen_insn_data[TARGET_INSN_START_EXTRA_WORDS-1] &= ~1;
>>+         access_type = MMU_DATA_STORE;
>>+     }
>
>The first thing to understand is that the unwind data is stored by the 
>compiler and recovered by the unwinder.
>
>The unwind data is exposed to the target via one of two methods:
>
>(1) TCGCPUOps.restore_state_to_opc, i.e. riscv_restore_state_to_opc.
>    The data[] argument contains the extra words.
>
>    With this method, the extra words are restored to env and are
>    available in a later call to riscv_cpu_do_interrupt.
>    Compare env->bins from the first extra word, which is used exactly so.
>
>    This is probably the easiest and best option.
>    You'd promote LOAD* to STORE_AMO* while dispatching the interrupt.
>
>(2) cpu_unwind_state_data()
>
>    With this method, you have immediate access to the extra words,
>    and don't need to store them anywhere else.
>
>    This is supposed to be used when we are *not* going to raise
>    an exception, merely look something up and continue execution.
>    Otherwise, we'd be performing the unwind operation twice,
>    and it's not cheap.
>
>So, tcg_ctx->gen_insn_data[] is not something you'd ever touch,
>and this is the wrong spot to do anything.

Thanks for more information and guiding me through this.

Not going to say that I still understand everything. But I looked
at one arm example. Before I do something more with it. I wanted to run
it by you.

Something on the below lines? I've one question as well for you in comment.

""""
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fee31b8037..b4e04fe849 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -46,8 +46,14 @@ typedef struct CPUArchState CPURISCVState;
  /*
   * RISC-V-specific extra insn start words:
   * 1: Original instruction opcode
+ * 2: more information about instruction
   */
-#define TARGET_INSN_START_EXTRA_WORDS 1
+#define TARGET_INSN_START_EXTRA_WORDS 2
+
+/*
+ * b0: Whether a shadow stack operation/instruction or not.
+ */
+#define RISCV_INSN_START_WORD2_SS_OP 1
  
  #define RV(x) ((target_ulong)1 << (x - 'A'))
  
@@ -226,6 +232,7 @@ struct CPUArchState {
      bool      elp;
      /* shadow stack register for zicfiss extension */
      target_ulong ssp;
+    bool      ss_op;
      /* sw check code for sw check exception */
      target_ulong sw_check_code;
  #ifdef CONFIG_USER_ONLY
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f74a1216b1..c28b13d42c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1777,6 +1777,10 @@ void riscv_cpu_do_interrupt(CPUState *cs)
      target_ulong mtval2 = 0;
  
      if (!async) {
+        /* shadow stack op, promote load page fault to store page fault */
+        if (env->ss_op && cause == RISCV_EXCP_LOAD_PAGE_FAULT) {
+            cause = RISCV_EXCP_STORE_PAGE_FAULT;
+        }
          /* set tval to badaddr for traps with address information */
          switch (cause) {
          case RISCV_EXCP_SEMIHOST:
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 4da26cb926..c0f21fe3db 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -129,6 +129,7 @@ static void riscv_restore_state_to_opc(CPUState *cs,
          env->pc = pc;
      }
      env->bins = data[1];
+    env->ss_op = data[2] & RISCV_INSN_START_WORD2_SS_OP;
  }
  
  static const TCGCPUOps riscv_tcg_ops = {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 580aa23c5b..6f952db823 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1271,7 +1271,7 @@ static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
          pc_next &= ~TARGET_PAGE_MASK;
      }
  
-    tcg_gen_insn_start(pc_next, 0);
+    tcg_gen_insn_start(pc_next, 0, 0);
      ctx->insn_start_updated = false;
  }
  
@@ -1301,6 +1301,14 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          ctx->base.is_jmp = DISAS_NORETURN;
      }
  
+    /* shadow stack index means shadow stack instruction is translated */
+    if (ctx->mem_idx & MMU_IDX_SS_WRITE) {
+        /* Is this needed to set true? */
+        ctx->insn_start_updated = true;
+        tcg_set_insn_start_param(ctx->base.insn_start, 2,
+                                 RISCV_INSN_START_WORD2_SS_OP);
+    }
+
      /* Only the first insn within a TB is allowed to cross a page boundary. */
      if (ctx->base.is_jmp == DISAS_NEXT) {
          if (ctx->itrigger || !is_same_page(&ctx->base, ctx->base.pc_next)) {

"""
>
>
>r~

