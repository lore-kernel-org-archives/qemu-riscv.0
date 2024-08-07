Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E12C49EA1
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 01:23:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sbVOU-0001zi-Ay; Tue, 06 Aug 2024 21:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sbVOR-0001wC-RK
 for qemu-riscv@nongnu.org; Tue, 06 Aug 2024 21:23:11 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sbVOQ-0002Zu-2m
 for qemu-riscv@nongnu.org; Tue, 06 Aug 2024 21:23:11 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1fd78c165eeso10250645ad.2
 for <qemu-riscv@nongnu.org>; Tue, 06 Aug 2024 18:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722993788; x=1723598588; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B/lBeFEOl9qH+KdjTskeCT3cNlx1qFQ4ypmHfUer1yA=;
 b=Js6Sr79dRBR8hotnI2t9b2JLSaJ6MifaYDwhN5w/qlKCfQdcXlMW5VOLmRR6wXIBiZ
 etvozZtnpKeQ4OV2wyQxe+OhMzMK2VLVjJ06ZWvLv246lDomoxX0v5A9rwiy3SGRmxCz
 GpKiB3XSNBHrAtpzy9/TDaZRiGNd2iiXhxt4qvK9h66/YoN4zfCdLrDhgw9Ao3RTZ9f3
 Hi/bZxcaMQgyK35hPnLt239dnsndGgr6KvjUo+czAShZifx4j7ydpmf/trA0HaeFDZfl
 vxOc7NRDy1CSWTyNTZ6HVY5AUBYlwNrKhdvONU1YVqEipWwvXRTUav8Mbt6M4tzV/+J6
 HD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722993788; x=1723598588;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B/lBeFEOl9qH+KdjTskeCT3cNlx1qFQ4ypmHfUer1yA=;
 b=EcJgni22SYosKbsOoGvB0sTpvvM5MvrtRwojjoMJk666P4y+gFqz4vUbXqQ+Sg/iFP
 ApBnu05vfMekgXZHscQ8t57A4olV0iq1lh0+MB7dM5tHplYYpfzJiY07kuN5Og9dK6LI
 sXpMUq2i2FYof7d8S7iOpeg5UEMyY174NkfYIpLsdeXgknQl48j23o4YopFhxVbKZufV
 U7Sa4qG5gph2RTlMVb3NGpzvghcoJMrIejyBYAIGDjn+g5BzVuQ2+jTKLNudHTzTy6r+
 kKTDdIwTzR978pmLD2MwQfwE4Yg+f2t+01M1yCzUIqgEx2+i3Yq5LO74HH/5PwOksYjG
 Lcug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrBfgIg/z0ZMjVqyhaCU7oGvi+bDAlxoPXFx8j8OU7bS4x2Q/EOsNYAjadRqyArsVdcQ5e+ZDL04V8MM4RGiOY7d/Yxkk=
X-Gm-Message-State: AOJu0YyDUK+cSCqtmkweKnhczbhrKhxr39uH35dytNhWQXzqyPvF6hJu
 NEZr14GzLGbkGZR0ea5b/S7sUReG8nRN4UbU6/UvE1/EHGcwCmPO8brdPgFKArY=
X-Google-Smtp-Source: AGHT+IGtmgYJsJmJb7Bb6F7haBt5pAEiI07Aub1LabyCRRydG6g73NRBJyvrNWboqAa8DZYNfc7pkA==
X-Received: by 2002:a17:903:2441:b0:1fd:a360:447b with SMTP id
 d9443c01a7336-1ff57457585mr233118005ad.52.1722993788091; 
 Tue, 06 Aug 2024 18:23:08 -0700 (PDT)
Received: from ?IPV6:2403:580a:f89b:0:e01b:92e5:d779:1bc0?
 (2403-580a-f89b-0-e01b-92e5-d779-1bc0.ip6.aussiebb.net.
 [2403:580a:f89b:0:e01b:92e5:d779:1bc0])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-200668fc398sm49663655ad.207.2024.08.06.18.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 18:23:07 -0700 (PDT)
Message-ID: <89e5857e-fc00-46c1-b797-1fadcf463a1e@linaro.org>
Date: Wed, 7 Aug 2024 11:23:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/20] target/riscv: tracking indirect branches (fcfi)
 for zicfilp
To: Deepak Gupta <debug@rivosinc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: pbonzini@redhat.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 laurent@vivier.eu, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Jim Shu <jim.shu@sifive.com>, Andy Chiu <andy.chiu@sifive.com>
References: <20240807000652.1417776-1-debug@rivosinc.com>
 <20240807000652.1417776-7-debug@rivosinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240807000652.1417776-7-debug@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 8/7/24 10:06, Deepak Gupta wrote:
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 364f3ee212..c7af430f38 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -134,6 +134,19 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
>           flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
>       }
>   
> +    if (cpu_get_fcfien(env)) {
> +        /*
> +         * For Forward CFI, only the expectation of a lpcll at
> +         * the start of the block is tracked (which can only happen
> +         * when FCFI is enabled for the current processor mode). A jump
> +         * or call at the end of the previous TB will have updated
> +         * env->elp to indicate the expectation.
> +         */
> +        flags = FIELD_DP32(flags, TB_FLAGS, FCFI_LP_EXPECTED,
> +                           env->elp != NO_LP_EXPECTED);

A good example why it's better to store this as bool in the first place.

>   static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
>   {
> +    DisasContext *ctx = container_of(db, DisasContext, base);
> +
> +    if (ctx->fcfi_lp_expected) {
> +        /*
> +         * Since we can't look ahead to confirm that the first
> +         * instruction is a legal landing pad instruction, emit
> +         * compare-and-branch sequence that will be fixed-up in
> +         * riscv_tr_tb_stop() to either statically hit or skip an
> +         * illegal instruction exception depending on whether the
> +         * flag was lowered by translation of a CJLP or JLP as
> +         * the first instruction in the block.
> +         */
> +        TCGv_i32 immediate;
> +        TCGLabel *l;
> +        l = gen_new_label();
> +        immediate = tcg_temp_new_i32();
> +        tcg_gen_movi_i32(immediate, 0);
> +        cfi_lp_check = tcg_last_op();
> +        tcg_gen_brcondi_i32(TCG_COND_EQ, immediate, 0, l);
> +        gen_helper_raise_sw_check_excep(tcg_env,
> +            tcg_constant_tl(RISCV_EXCP_SW_CHECK_FCFI_TVAL),
> +            tcg_constant_tl(MISSING_LPAD), tcg_constant_tl(0));
> +        gen_set_label(l);
> +        /*
> +         * Despite the use of gen_exception_illegal(), the rest of
> +         * the TB needs to be generated. The TCG optimizer will
> +         * clean things up depending on which path ends up being
> +         * active.
> +         */
> +        ctx->base.is_jmp = DISAS_NEXT;
> +    }
>   }

Again, don't do this here.
There is a reason why only DISAS_NEXT is legal: plugins.
You *must* do this in riscv_tr_translate_insn, like ARM.


r~

