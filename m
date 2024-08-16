Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FDFC3DA4A
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 06:49:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1seqmG-0006TB-CU; Fri, 16 Aug 2024 02:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1seqmD-0006QG-S9
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2024 02:49:33 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1seqmC-0007jR-9q
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2024 02:49:33 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5d5cbe88f70so982019eaf.0
 for <qemu-riscv@nongnu.org>; Thu, 15 Aug 2024 23:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723790970; x=1724395770;
 darn=nongnu.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hmFfu+cUu/9dHh8EMC3F6fmgPUHpZhKIjwcloRRaRWM=;
 b=DOQWI4EHdACJMddpM6j2zd5WiXEEgTTE5or42sdkaqZmHZeThfaHbL3a05x1W487Bo
 z3457ahzS02FXFnEGU4Vg8+x9Ck9qdwcwYfaowLstjK1fry7m6zAUK26KVx3tXSkyHPv
 I5szUB8lSGtjfWmckGzOkK6j9QOoMJb91q5mbiQYSwdSUTS85Wfbp38h/9086HMZcuqp
 1T31l4zAZaH1wX9vu4tC7P6ty+X5+u0l3iVTDiCIxnSpIqkclTWUF0LL1sFEUBAzBgTg
 eztgBUItwuEI/BeWFli43vG5PHiEC2l+6GDdCyJ3BuuXfvFk2j8lZFu16cq8P4kk748E
 itxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723790970; x=1724395770;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hmFfu+cUu/9dHh8EMC3F6fmgPUHpZhKIjwcloRRaRWM=;
 b=I4HFgRUJb0T9o7Ti2fAeYcs/bQyGbMTtRw85Su57ZvnIy6umNAKdHZyAIjnqZzXHFF
 tjIhKfqqpzkytCSpWNFE9cvkFhS/iHR5agvA+aUycxQ41j8/y4FOneB1Jj/eYjv4fBnQ
 ZN7ZOI6sUeoaAYvfsZMIOqxMEcyvRj08UtYLEX803WIiRCdxw4J565wIQMF9EIsdDnku
 JU6O+J9QQioBcrTLLi/9Vuw4Kl8eUCZl/Fv++B7xkN0Wo8FFpKKZGkHTNqvjNa8QUJQ0
 m5nhI7ldiy+1zqST06zyrqa1zCNmajBRU+isuJ5vWeCQdfSN6zySZRNl99FFJmIgVquL
 9ufA==
X-Gm-Message-State: AOJu0Yz7sjHgJ0NPr5OK2ShoPvJd2qPldtSCG+NifEDnD70eEmCUFqvR
 rOZFoQt8hQqB7U10AajnT/pKFznp94SUKxGXaVFIJlAK08gDH+L2kbLZdLxqvPM=
X-Google-Smtp-Source: AGHT+IHQ1xAhgW8Xg4rnQNkd1T0y7iRegWWWoQMUC4iwv/pij67rDUczyuoz5N3TLa6lpTeJ6uyYOg==
X-Received: by 2002:a05:6358:7f13:b0:1ad:14ec:a002 with SMTP id
 e5c5f4694b2df-1b39331deb6mr262565755d.26.1723790969941; 
 Thu, 15 Aug 2024 23:49:29 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7c6b61dd9c9sm2293975a12.41.2024.08.15.23.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 23:49:29 -0700 (PDT)
Date: Thu, 15 Aug 2024 23:49:27 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 pbonzini@redhat.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com
Subject: Re: [PATCH v4 05/16] target/riscv: tracking indirect branches (fcfi)
 for zicfilp
Message-ID: <Zr72d+EYU6V/yvWQ@debug.ba.rivosinc.com>
References: <20240816010711.3055425-1-debug@rivosinc.com>
 <20240816010711.3055425-6-debug@rivosinc.com>
 <2c1039b4-a865-458a-831c-7e66b6287a98@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <2c1039b4-a865-458a-831c-7e66b6287a98@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=debug@rivosinc.com; helo=mail-oo1-xc33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, Aug 16, 2024 at 01:41:51PM +1000, Richard Henderson wrote:
>On 8/16/24 11:06, Deepak Gupta wrote:
>>@@ -1245,6 +1250,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>>  static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
>>  {
>>+
>>  }
>
>Watch the unrelated changes.
>
>>@@ -1266,6 +1272,28 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>>      CPURISCVState *env = cpu_env(cpu);
>>      uint16_t opcode16 = translator_lduw(env, &ctx->base, ctx->base.pc_next);
>>+    if (ctx->fcfi_lp_expected) {
>>+        /*
>>+         * Since we can't look ahead to confirm that the first
>>+         * instruction is a legal landing pad instruction, emit
>>+         * compare-and-branch sequence that will be fixed-up in
>>+         * riscv_tr_tb_stop() to either statically hit or skip an
>>+         * illegal instruction exception depending on whether the
>>+         * flag was lowered by translation of a CJLP or JLP as
>>+         * the first instruction in the block.
>>+         */
>>+        TCGv_i32 immediate;
>>+        TCGLabel *l;
>>+        l = gen_new_label();
>>+        immediate = tcg_temp_new_i32();
>>+        tcg_gen_movi_i32(immediate, 0);
>>+        tcg_ctx->cfi_lp_check = tcg_last_op();
>>+        tcg_gen_brcondi_i32(TCG_COND_EQ, immediate, 0, l);
>>+        gen_helper_raise_sw_check_excep(tcg_env,
>>+                tcg_constant_tl(RISCV_EXCP_SW_CHECK_FCFI_TVAL));
>>+        gen_set_label(l);
>>+    }
>>+
>
>I think this is over-complicated.
>
>>      ctx->ol = ctx->xl;
>>      decode_opc(env, ctx, opcode16);
>>      ctx->base.pc_next += ctx->cur_insn_len;
>
>If we delay the check until here, then
>
>(1) we've decoded the opcode, and processed lpad or not.
>(2) we can know that lpad will have cleared ctx->fcfi_lp_expected,
>    so that if it is still set here, then we didn't see an lpad.
>
>We can go back an insert the exception like so:
>
>    if (ctx->fcfi_lp_expected) {
>        /* Emit after insn_start, i.e. before the op following insn_start. */
>        tcg_ctx->emit_before_op = QTAILQ_NEXT(ctx->base.insn_start, link);
>
>        tcg_gen_st_tl(tcg_constant_tl(RISCV_EXCP_SW_CHECK_FCFI_TVAL),
>                      tcg_env, offsetof(CPURISCVState, sw_check_code));
>        gen_helper_raise_exception(tcg_env, tcg_constant_i32(RISCV_EXCP_SW_CHECK));
>
>        tcg_ctx->emit_before_op = NULL;
>        ctx->base.is_jmp = DISAS_NORETURN;
>    }
>

Hmm. Yes this reduces complication of check. Let me do that.

>Emit the store to sw_check_code directly; no need for an extra helper. 
>Using gen_helper_raise_exception instead of generate_exception means 
>we don't get a spurious pc update.

>
>r~

