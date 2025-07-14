Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B707C83F1A
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 15:07:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ubKm3-0005CT-JX; Mon, 14 Jul 2025 11:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ubJL8-0003PZ-1b
 for qemu-riscv@nongnu.org; Mon, 14 Jul 2025 09:35:30 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ubJL1-0001yc-FU
 for qemu-riscv@nongnu.org; Mon, 14 Jul 2025 09:35:29 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-747c2cc3419so3494954b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 14 Jul 2025 06:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1752500121; x=1753104921; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+sKk50Mo4QGxo3A1JEraQgJ7dZKu6iCqoahIO2s8CZw=;
 b=TLVzrpbz2cierE1ts0dW0in7fw9CTqaMJwW3iQiyuxXvxsKE5N1iWSxr4uV4n6emLD
 68CBPOMHx6Jg7KDdQ2qb4UHhrujMYq3G3Rf8KETqOuQNRnYlzbZ9O458TaHQ1CGzJp98
 yOah6vjRDTYpGTTTYDYvIxWS2bICrjhToYXhfiZ1zazZBF3KzZIPBKJJBNqGFEezx3uo
 YRA5bKHJZOgMt0GRSS3rWWoVq5c78PXRcHceKsFdTltfzRKCAvoC/i3EkuJnQULKfRIN
 0k0JvJ6A/KP0NU1MJDyYeGcSczO3iSaNj2VPJLpE1VTnsQ7MRxSRLHcXUaiLfFpKP2/D
 9R3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752500121; x=1753104921;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+sKk50Mo4QGxo3A1JEraQgJ7dZKu6iCqoahIO2s8CZw=;
 b=LUMUQBBI89uGsxKPAlgLl9w8dMMxl9bs6TasNhOi8pdYyRfLVekZ1i5Yx0iAAPTl5Q
 nz+jTOE11PhXZk9VpcTiUCKMsymvX4U0M9iU+K7jtXAdfqWyDh4F1WCMsd3GIu1sNLWq
 JjQO61u6ypH3E/d1TuCqMbvWDFZatVaPzQaFR19Bmt59cEdKlntMre5QRgBbv3qgWH9Q
 DS+HcV+xrSSMAkbxe49JM9aG+nOLQqN5VH09H/PsBfmMg2hukOXYe5JUl8M2tXhrG4oW
 SrrNMFjKnNHdJSPAm4ETWn7MkBAYKcIZq7+E3enxooJHb5Xl5mzlPamQGL0ebMMtJ4g2
 RhbQ==
X-Gm-Message-State: AOJu0Ywwaraiv/jZjUKjjC9GrlSAsGdlM0nQzuh4Ptmd2nu9sKHOwwFN
 9x7a0DSLrLEDaS6F5FLJp4tfLZ2x9trDXNROyGaXoaUe4jpMdWDsUUs6s5nOT+u+U3k=
X-Gm-Gg: ASbGncvG+Re17eCFim0SpNh2Mjt/JHoe1zTGgYy5kQ5F0NEaxY+J8o/OjqK1xtsSmvM
 zM2oIJA8P9Zlhy1KQpPMKBzGeeY0gGzfEzSPO+/Vv4pqTjGbnay/N7sPu06hz7Jy6XpwFSKfzRx
 3oM1zqPePh0Ia5yd/VCLTS4QiGDXIiXzX1Rkbf3KmisaDQDCwIrG21Xm5T0bdZTLvZemqcEXUfD
 Jyh1t2PU14x7Sp1avbBudgP5ZTZo75w4O3EZ7Xpm7RguSRj1ep43TF079ZEPOWZs8EpHQxkkRIB
 ioVUvdy05tsTomoRnbTmciS1i8fEr9IGyQlypkky4Dwp1JSn204ILXLilev2s8lh+mCcvP3TYMQ
 KDF/xfDFmXg+zngXyWV8ovO6lOIN/lGodThMHaA==
X-Google-Smtp-Source: AGHT+IGS/4lFxPF9rwRlRd16lyhSm3s12ssZ3HK6jYY2yEo16zTSS4YfcrefEmt8DbJKDjAxnh5nAg==
X-Received: by 2002:a05:6a00:2d12:b0:748:e4f6:ff31 with SMTP id
 d2e1a72fcca58-74ee129846cmr22352316b3a.8.1752500121018; 
 Mon, 14 Jul 2025 06:35:21 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.118.252])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f5c7f7sm11005711b3a.142.2025.07.14.06.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 06:35:20 -0700 (PDT)
Message-ID: <24b7c6e7-4594-4978-8e00-e40d72bccb14@ventanamicro.com>
Date: Mon, 14 Jul 2025 10:35:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: set mtval = 0 for illegal_inst if no opcode
 avail
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 richard.henderson@linaro.org
References: <20250714120822.1243870-1-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250714120822.1243870-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Hi,


Please disregard this patch. Richard taught me how to fix the unwinding instead.


Thanks,

Daniel

On 7/14/25 9:08 AM, Daniel Henrique Barboza wrote:
> There is no guarantee that we'll able to get a proper opcode to put into
> mtval for illegal inst exceptions, as demonstrated in [1].
> 
> The 'proper opcode' would be retrieved via unwinding the CPU state (via
> cpu_restore_state(), down to riscv_restore_state_to_opc()) after
> riscv_raise_exception(). There are cases where that doesn't happen:
> we'll see a failure in cpu_restore_state(), where in_code_gen_buffer()
> will return 'false' even for a 'host_pc' that is retrieved via GETPC()
> and not in an instruction fetch context.
> 
> Hopefully we don't have to always provide mtval in these cases. The
> RISC-V priv ISA says that mtval for illegal_inst exceptions are
> optional, and the faulting instruction address will be reported in
> env->mepc.
> 
> The ISA also says that we can set mtval to ILEN/MXLEN bits of the
> faulting insn address, and we could do that when we're not able to fetch
> the opcode. But that would add inconsistency in how we behave since
> mtval would have either the opcode or the insn addr, and no easy way of
> knowing which one we have, and software would need to check it with mepc
> regardless. Zeroing mtval when we don't have the opcode is clearer.
> 
> And yes, zeroing mtval due to an unwind failure isn't ideal either, but
> it's less worse than reporting a wrong mtval. Until we figure out a way
> to fix the unwinding in this case, let's clear mtval and let software
> know that it must find the faulting opcode via other means.
> 
> [1] https://gitlab.com/qemu-project/qemu/-/issues/3020
> 
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/3020
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu_helper.c |  5 +++++
>   target/riscv/op_helper.c  | 21 +++++++++++++++++++++
>   2 files changed, 26 insertions(+)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 3479a62cc7..1cd1849a1d 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -2243,6 +2243,11 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>               break;
>           case RISCV_EXCP_ILLEGAL_INST:
>           case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
> +            /*
> +             * Note: we'll set tval = 0 for illegal_inst cases
> +             * where we failed to unwind and to get the proper
> +             * opcode. See riscv_raise_exception() for more info.
> +             */
>               tval = env->bins;
>               break;
>           case RISCV_EXCP_BREAKPOINT:
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 15460bf84b..930981a076 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -40,6 +40,27 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
>                             env->pc);
>   
>       cs->exception_index = exception;
> +
> +    /*
> +     * There is no guarantee that we'll be able to unwind
> +     * and set env->bins (the opcode for the current PC)
> +     * properly via the cpu_restore_state() path. The RISC-V
> +     * priv ISA says that:
> +     *
> +     * "The mtval register can optionally also be used to return
> +     * the faulting instruction bits on an illegal-instruction
> +     * exception (mepc points to the faulting instruction in
> +     * memory)."
> +     *
> +     * It's not ideal to set mtval != 0 in some cases and zero
> +     * in others due to unwind failures, but it's way better
> +     * than to set mtval to a bogus env->bins opcode from
> +     * the last successful unwinding.
> +     */
> +    if (cs->exception_index == RISCV_EXCP_ILLEGAL_INST) {
> +        env->bins = 0;
> +    }
> +
>       cpu_loop_exit_restore(cs, pc);
>   }
>   


