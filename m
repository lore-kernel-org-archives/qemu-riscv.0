Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B22C3DA4A
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 05:25:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sgHMI-0002XX-Q4; Tue, 20 Aug 2024 01:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sgHMH-0002U0-78
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2024 01:24:41 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sgHMF-0001ii-Hj
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2024 01:24:40 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2d3c08541cdso3726378a91.2
 for <qemu-riscv@nongnu.org>; Mon, 19 Aug 2024 22:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724131478; x=1724736278; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1mY9qTfLp9/wOp1KnlR/kB6EryzMXxmldfetb9IU/Tg=;
 b=yE0eNrBE+ta38YSQThpscn78H/VUyxBUV9I0ZMUighq+f0u8Dw71r+0REt4Kld48lv
 /byQ9sCOyaTXTI7MYI3Khta8HFRmS1dnqYBRl+L2IdlXnIRHq3MTRFLR0mwUCh6pEtSU
 0FYuOyGBTrwhoE1QGDbEvq8ldzvxDfjqx8BkRFwk4dQK8ec4GUVKCjQA9VC4WneCtPEq
 z2Cpz1THqZKFMuCyiAWpxELmuk2AhRQLkCtggsom43I3rwzIGDScnkBk4uIIIVx2NBE9
 //12XZDjKjnwhmEpY7+hvamdloK60oOzVnvlpJUYH010uDWGY/HonMBbdBMT1ff6v+LS
 dK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724131478; x=1724736278;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1mY9qTfLp9/wOp1KnlR/kB6EryzMXxmldfetb9IU/Tg=;
 b=CA4AX3EVejXgZ1nrt1fMQVoES4n1WUPyxQoB3NSfQpcdaJSHF96+LBfIzMqbkugFhf
 tvMhPlrP+fBCwHlpz/TqyewrWogGvSWkjFqz9WTe5+Hox3pnEC4kfqxlXXPhlkBg8Uzw
 w6B4yQa4o1kJWiOJfT0fCP3EOwlWNRnnOo0LIL96H2v2CUnORDB3H5hDZCywTOLQd9Ud
 OBBnYpqUxr7eGcpOJGjrA1j96yxTvIB2tlS3VckcJFUMJTwJAZC+sOXRxbnoTChh99zi
 5T+DfXTynntJ4Z38gunR+RcR0/HbGTyLRYoVrqD+Ib8tRd+8mmIkSl38n+8cJH8xMCxH
 YO4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXGqo8DaTqrWlJyoXQPN/tuxng1jK1tBSzFzRpGag4d5SQ2JS5P8tpER7qLOzINZXIKszQmpL/IfJ0E8jRC1MDLB05Yzk=
X-Gm-Message-State: AOJu0YxqdS4a2GWkpuWOffRJ8MereHXaTaGJ6yHMJLDiN4osj5V70LDi
 /PnAtI8RRqeGBnx1dM95tmea/+aE51r2MvdivCgWN9tt2TL0Q7PZlyB7wWEALfM=
X-Google-Smtp-Source: AGHT+IHVpiKQh/fsSi/DLTqWT+ct27mm8tLjCWslouxhbHk+rY3etHjmvCBwHlr+WGMBttYKEAzRGg==
X-Received: by 2002:a17:90b:1b06:b0:2c4:ee14:94a2 with SMTP id
 98e67ed59e1d1-2d5c0ea73c9mr1351740a91.27.1724131477655; 
 Mon, 19 Aug 2024 22:24:37 -0700 (PDT)
Received: from [192.168.1.113] ([203.30.3.188])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d3c3e5b9fdsm11043956a91.40.2024.08.19.22.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 22:24:37 -0700 (PDT)
Message-ID: <bb1f768e-fd10-4246-b60b-7912e33c7ee6@linaro.org>
Date: Tue, 20 Aug 2024 15:24:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/15] target/riscv: tracking indirect branches (fcfi)
 for zicfilp
To: Deepak Gupta <debug@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com
References: <20240820000129.3522346-1-debug@rivosinc.com>
 <20240820000129.3522346-6-debug@rivosinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240820000129.3522346-6-debug@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/20/24 10:01, Deepak Gupta wrote:
> zicfilp protects forward control flow (if enabled) by enforcing all
> indirect call and jmp must land on a landing pad instruction `lpad`. If
> target of an indirect call or jmp is not `lpad` then cpu/hart must raise
> a sw check exception with tval = 2.
> 
> This patch implements the mechanism using TCG. Target architecture branch
> instruction must define the end of a TB. Using this property, during
> translation of branch instruction, TB flag = FCFI_LP_EXPECTED can be set.
> Translation of target TB can check if FCFI_LP_EXPECTED flag is set and a
> flag (fcfi_lp_expected) can be set in DisasContext. If `lpad` gets
> translated, fcfi_lp_expected flag in DisasContext can be cleared. Else
> it'll fault.
> 
> Signed-off-by: Deepak Gupta<debug@rivosinc.com>
> Co-developed-by: Jim Shu<jim.shu@sifive.com>
> Co-developed-by: Andy Chiu<andy.chiu@sifive.com>
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   target/riscv/cpu.h        |  3 +++
>   target/riscv/cpu_bits.h   |  3 +++
>   target/riscv/cpu_helper.c | 12 ++++++++++++
>   target/riscv/translate.c  | 21 ++++++++++++++++++++-
>   4 files changed, 38 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -1265,11 +1270,25 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      DisasContext *ctx = container_of(dcbase, DisasContext, base);
>      CPURISCVState *env = cpu_env(cpu);
>      uint16_t opcode16 = translator_lduw(env, &ctx->base, ctx->base.pc_next);
> -
>      ctx->ol = ctx->xl;
>      decode_opc(env, ctx, opcode16);
>      ctx->base.pc_next += ctx->cur_insn_len;

Watch the unrelated whitespace changes.


r~

