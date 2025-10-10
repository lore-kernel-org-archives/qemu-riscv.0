Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06223CCD185
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 16:19:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7Fpf-0003cZ-LB; Fri, 10 Oct 2025 12:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1v7Fpd-0003c9-CS
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 12:19:01 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1v7FpU-0003Ug-IN
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 12:19:01 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 327F73F84A
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 16:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1760113123;
 bh=M9eAGMyxZtd3bDcmjCb7hMbgQ+sQnLPU7iFbntpN8ls=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=W0ZmzwJRe8D4AF0l5soxhF+MHei/xoOuOsYMWAYUAUFHp1JbOlrtif5+jMq+ctWEa
 YVR23vsWx9A0xJVPfBNHBFAoxvi21WYvFlslr0vf0cqqhpgZSHj7qse/00EhKRVQmU
 H6a401XVrbdFPngGeieFVYFXCNRw2MwQOje12Qa0QswM+qWYzWjVEoZnpbUoveTPIZ
 i/FAW7zQGof7DzhcGdX/JTInw3av6dgysKjbzihIf/Jtqjn+i54aZD3hlYXd5k7Jqi
 HBp4Dw1sMnWaMREtZGQOBf7sGT3WAnLRCu12ky5SypetKU2g+V/8JEAeGl+B7uitZY
 vbt+SUqPh4d2ma2XsovdaeleINfBaRPrV95BCbc5cgbpc7IY83G3V+9RFADKj4JsXr
 lx7lODEa0o+R1tCRwBT+uTbFowN74kygb8/ugtT6YeUIClhFQdun2ajUyP6BJ76qDV
 iVNyDgKteRwLOupDgCEvkmYyRT9sg7ne6dkmX2f2jW8IgOaC84+Oqkax4m7KxnIY2Q
 mofX5SFF7xJ4Vc93tvFQuJtlvWDGeVjuZ/aB80mQ4yXSJpoXg8ehL1A8QjAcCX8r9B
 DMRsEMiNVIZJ18UeAIZEGQMXbRXNEXnbDZS35aNAOQ62s4L7SgKTMJebCNLlnJ8tS9
 0evnoCpUthOZeHVwrEO5AbIg=
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3f924ae2a89so2815909f8f.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 09:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760113119; x=1760717919;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M9eAGMyxZtd3bDcmjCb7hMbgQ+sQnLPU7iFbntpN8ls=;
 b=YEO/MN4GwGzPDwtk87r/EaE3lv86LszOj4zCvPFibZh8y1Zt8MHzFYKq14AEuhuFza
 1OzSytncByosKstQEsXJQNa7v90ZpcBF7avZ5/ahlRlPo41eOsOKgWxixACw/K5zLaFG
 wMvSy68GEIWwiGbGaQwAiRhadMyXaNnY5OGP/wzJ6HhiQsSiPCXFD1TmDVScVRK17hyj
 7dp/RjJ3yikDarUXZTVEZM4vYYdT3rnTIiJXrqxD66a4QwVFkWpIPlAd+f67siWf/u/u
 GlWzcIO+1In0/V26rr1Y9PsddzkhskWMzo2+DbQozd/ajidlOfCENG54BwKF6LyYXbIj
 P31g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBDwSdxkk9LaFf5Zetha+yo2DEWR95ubanwYotClyLAOOBi4bwQXDMUxDxtmTm63NoUmRFpVAUqlNi@nongnu.org
X-Gm-Message-State: AOJu0Yx0VIW809uaI5MqqOP91BBAD2++j15eCePQdOxvJyNzr81WfRKZ
 tb6NIN6oXFrJ8ePUKHEnr3i/HbXUs30+jT9J/2HVIOf/9uXjRUZjNvY2iTKmTW4yARAMp42zTyq
 DRcZSWUZBXv72Bg+z38aX9MP2xaTNe6PbStic5HFhuaOqyNXkBx56a5aRIfe1IkNApF9MnwOf
X-Gm-Gg: ASbGncvGJjoPLc3xyTeeUGhIn+qxkmaNWTZzgaHxIqnaEJnAHqBHuNrqP4Cr9vLmE3f
 IIpiGK0eG2A98YMD4d5AWk1jfg1DsfN0vnuEjATZ+DempFNdlwqpkX/A97OgyYfvBRfZgeDr8Yv
 57ERdstxKUsNyXPS9NfsG1BniWqKWLtiZw/O+/l747jhn7BtoXSaKnIgNoYHeAiOhrJZzsLoz0N
 5ME+3MyOyo8ILPILt7ZugwgRu5KofJFRZveXGiOOn0zMMaZ0KT85TgyYD7jKo0wS0+opcv+byZx
 DjDZC0bO3+lQ+6VPwHtk331pR8/QlZnDoZwWYMD84qfCLiHSP6REiRfSJ0LFqXgljCEKJu/sbIS
 OI/RoMeqerrXYLXpOe/PaYwhztPNGauioKsuWyw==
X-Received: by 2002:a05:6000:608:b0:3ee:1125:fb6d with SMTP id
 ffacd0b85a97d-4266e7ced08mr6264086f8f.9.1760113119446; 
 Fri, 10 Oct 2025 09:18:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiq1PHVsq29Kr6oTspw/6nxKgh+kxV/lJz+UwOmsXoMr2UgcIlUOajX8hZPRLrY2ShqzXsGw==
X-Received: by 2002:a05:6000:608:b0:3ee:1125:fb6d with SMTP id
 ffacd0b85a97d-4266e7ced08mr6264062f8f.9.1760113118976; 
 Fri, 10 Oct 2025 09:18:38 -0700 (PDT)
Received: from [192.168.103.116]
 (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe69sm5027559f8f.32.2025.10.10.09.18.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 09:18:38 -0700 (PDT)
Message-ID: <b455449b-8ac4-4547-90db-e5b93b820772@canonical.com>
Date: Fri, 10 Oct 2025 18:18:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] target/riscv: Factor MemOp variable out when MO_TE
 is set
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20251010155045.78220-1-philmd@linaro.org>
 <20251010155045.78220-12-philmd@linaro.org>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20251010155045.78220-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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

On 10/10/25 17:50, Philippe Mathieu-Daudé wrote:
> In preparation of automatically replacing the MO_TE flag
> in the next commit, use an local @memop variable.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/riscv/insn_trans/trans_rvd.c.inc       |  6 ++++--
>   target/riscv/insn_trans/trans_rvf.c.inc       |  6 ++++--
>   target/riscv/insn_trans/trans_rvzacas.c.inc   |  5 +++--
>   target/riscv/insn_trans/trans_rvzce.c.inc     |  6 ++++--
>   target/riscv/insn_trans/trans_rvzfh.c.inc     |  8 ++++++--
>   target/riscv/insn_trans/trans_rvzicfiss.c.inc | 10 ++++++----
>   6 files changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
> index 33858206788..62b75358158 100644
> --- a/target/riscv/insn_trans/trans_rvd.c.inc
> +++ b/target/riscv/insn_trans/trans_rvd.c.inc
> @@ -42,7 +42,7 @@
>   static bool trans_fld(DisasContext *ctx, arg_fld *a)
>   {
>       TCGv addr;
> -    MemOp memop = MO_TE | MO_UQ;
> +    MemOp memop = MO_UQ;

Thank you for the series which makes the introduction of big-endian 
support easier. I really like how you have split it up into logical steps.

The change in trans_fld() looks correct but is not fully covered by the 
commit description message: This function already uses a local memop 
variable.

Here you are factoring out setting the endian bit which makes 
'mechanically' replacing the setting of the bit easier.

Consider updating the commit message.

Otherwise the patch looks good to me.

Best regards

Heinrich

>   
>       REQUIRE_FPU;
>       REQUIRE_EXT(ctx, RVD);
> @@ -60,6 +60,7 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
>       } else {
>           memop |= MO_ATOM_IFALIGN;
>       }
> +    memop |= MO_TE;
>   
>       decode_save_opc(ctx, 0);
>       addr = get_address(ctx, a->rs1, a->imm);
> @@ -72,7 +73,7 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
>   static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
>   {
>       TCGv addr;
> -    MemOp memop = MO_TE | MO_UQ;
> +    MemOp memop = MO_UQ;
>   
>       REQUIRE_FPU;
>       REQUIRE_EXT(ctx, RVD);
> @@ -84,6 +85,7 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
>       } else {
>           memop |= MO_ATOM_IFALIGN;
>       }
> +    memop |= MO_TE;
>   
>       decode_save_opc(ctx, 0);
>       addr = get_address(ctx, a->rs1, a->imm);
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
> index 150e2b9a7d4..878417eae92 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -43,11 +43,12 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
>   {
>       TCGv_i64 dest;
>       TCGv addr;
> -    MemOp memop = MO_TE | MO_UL;
> +    MemOp memop = MO_UL;
>   
>       REQUIRE_FPU;
>       REQUIRE_EXT(ctx, RVF);
>   
> +    memop |= MO_TE;
>       if (ctx->cfg_ptr->ext_zama16b) {
>           memop |= MO_ATOM_WITHIN16;
>       }
> @@ -65,11 +66,12 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
>   static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
>   {
>       TCGv addr;
> -    MemOp memop = MO_TE | MO_UL;
> +    MemOp memop = MO_UL;
>   
>       REQUIRE_FPU;
>       REQUIRE_EXT(ctx, RVF);
>   
> +    memop |= MO_TE;
>       if (ctx->cfg_ptr->ext_zama16b) {
>           memop |= MO_ATOM_WITHIN16;
>       }
> diff --git a/target/riscv/insn_trans/trans_rvzacas.c.inc b/target/riscv/insn_trans/trans_rvzacas.c.inc
> index d850b142642..6458ac4f241 100644
> --- a/target/riscv/insn_trans/trans_rvzacas.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzacas.c.inc
> @@ -119,12 +119,13 @@ static bool trans_amocas_q(DisasContext *ctx, arg_amocas_q *a)
>       TCGv_i64 src2h = get_gpr(ctx, a->rs2 == 0 ? 0 : a->rs2 + 1, EXT_NONE);
>       TCGv_i64 destl = get_gpr(ctx, a->rd, EXT_NONE);
>       TCGv_i64 desth = get_gpr(ctx, a->rd == 0 ? 0 : a->rd + 1, EXT_NONE);
> +    MemOp memop = MO_ALIGN | MO_UO;
>   
> +    memop |= MO_TE;
>       tcg_gen_concat_i64_i128(src2, src2l, src2h);
>       tcg_gen_concat_i64_i128(dest, destl, desth);
>       decode_save_opc(ctx, RISCV_UW2_ALWAYS_STORE_AMO);
> -    tcg_gen_atomic_cmpxchg_i128(dest, src1, dest, src2, ctx->mem_idx,
> -                                (MO_ALIGN | MO_TE | MO_UO));
> +    tcg_gen_atomic_cmpxchg_i128(dest, src1, dest, src2, ctx->mem_idx, memop);
>   
>       tcg_gen_extr_i128_i64(destl, desth, dest);
>   
> diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
> index c8dc102c8e3..172c2c19c17 100644
> --- a/target/riscv/insn_trans/trans_rvzce.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzce.c.inc
> @@ -175,7 +175,7 @@ static bool gen_pop(DisasContext *ctx, arg_cmpp *a, bool ret, bool ret_val)
>           return false;
>       }
>   
> -    MemOp memop = get_ol(ctx) == MXL_RV32 ? MO_TE | MO_UL : MO_TE | MO_UQ;
> +    MemOp memop = get_ol(ctx) == MXL_RV32 ? MO_UL : MO_UQ;
>       int reg_size = memop_size(memop);
>       target_ulong stack_adj = ROUND_UP(ctpop32(reg_bitmap) * reg_size, 16) +
>                                a->spimm;
> @@ -185,6 +185,7 @@ static bool gen_pop(DisasContext *ctx, arg_cmpp *a, bool ret, bool ret_val)
>   
>       tcg_gen_addi_tl(addr, sp, stack_adj - reg_size);
>   
> +    memop |= MO_TE;
>       for (i = X_Sn + 11; i >= 0; i--) {
>           if (reg_bitmap & (1 << i)) {
>               TCGv dest = dest_gpr(ctx, i);
> @@ -228,7 +229,7 @@ static bool trans_cm_push(DisasContext *ctx, arg_cm_push *a)
>           return false;
>       }
>   
> -    MemOp memop = get_ol(ctx) == MXL_RV32 ? MO_TE | MO_UL : MO_TE | MO_UQ;
> +    MemOp memop = get_ol(ctx) == MXL_RV32 ? MO_UL : MO_UQ;
>       int reg_size = memop_size(memop);
>       target_ulong stack_adj = ROUND_UP(ctpop32(reg_bitmap) * reg_size, 16) +
>                                a->spimm;
> @@ -238,6 +239,7 @@ static bool trans_cm_push(DisasContext *ctx, arg_cm_push *a)
>   
>       tcg_gen_subi_tl(addr, sp, reg_size);
>   
> +    memop |= MO_TE;
>       for (i = X_Sn + 11; i >= 0; i--) {
>           if (reg_bitmap & (1 << i)) {
>               TCGv val = get_gpr(ctx, i, EXT_NONE);
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
> index eec478afcb0..5355cd46c3d 100644
> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -42,12 +42,14 @@
>   
>   static bool trans_flh(DisasContext *ctx, arg_flh *a)
>   {
> +    MemOp memop = MO_UW;
>       TCGv_i64 dest;
>       TCGv t0;
>   
>       REQUIRE_FPU;
>       REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
>   
> +    memop |= MO_TE;
>       decode_save_opc(ctx, 0);
>       t0 = get_gpr(ctx, a->rs1, EXT_NONE);
>       if (a->imm) {
> @@ -57,7 +59,7 @@ static bool trans_flh(DisasContext *ctx, arg_flh *a)
>       }
>   
>       dest = cpu_fpr[a->rd];
> -    tcg_gen_qemu_ld_i64(dest, t0, ctx->mem_idx, MO_TE | MO_UW);
> +    tcg_gen_qemu_ld_i64(dest, t0, ctx->mem_idx, memop);
>       gen_nanbox_h(dest, dest);
>   
>       mark_fs_dirty(ctx);
> @@ -66,11 +68,13 @@ static bool trans_flh(DisasContext *ctx, arg_flh *a)
>   
>   static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
>   {
> +    MemOp memop = MO_UW;
>       TCGv t0;
>   
>       REQUIRE_FPU;
>       REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
>   
> +    memop |= MO_TE;
>       decode_save_opc(ctx, 0);
>       t0 = get_gpr(ctx, a->rs1, EXT_NONE);
>       if (a->imm) {
> @@ -79,7 +83,7 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
>           t0 = temp;
>       }
>   
> -    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TE | MO_UW);
> +    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, memop);
>   
>       return true;
>   }
> diff --git a/target/riscv/insn_trans/trans_rvzicfiss.c.inc b/target/riscv/insn_trans/trans_rvzicfiss.c.inc
> index c5555966175..89eed007587 100644
> --- a/target/riscv/insn_trans/trans_rvzicfiss.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzicfiss.c.inc
> @@ -100,12 +100,13 @@ static bool trans_ssamoswap_w(DisasContext *ctx, arg_amoswap_w *a)
>   
>       TCGv dest = dest_gpr(ctx, a->rd);
>       TCGv src1, src2 = get_gpr(ctx, a->rs2, EXT_NONE);
> +    MemOp memop = MO_ALIGN | MO_SL;
>   
>       decode_save_opc(ctx, RISCV_UW2_ALWAYS_STORE_AMO);
>       src1 = get_address(ctx, a->rs1, 0);
>   
> -    tcg_gen_atomic_xchg_tl(dest, src1, src2, SS_MMU_INDEX(ctx),
> -                           (MO_ALIGN | MO_TE | MO_SL));
> +    memop |= MO_TE;
> +    tcg_gen_atomic_xchg_tl(dest, src1, src2, SS_MMU_INDEX(ctx), memop);
>       gen_set_gpr(ctx, a->rd, dest);
>       return true;
>   }
> @@ -129,12 +130,13 @@ static bool trans_ssamoswap_d(DisasContext *ctx, arg_amoswap_w *a)
>   
>       TCGv dest = dest_gpr(ctx, a->rd);
>       TCGv src1, src2 = get_gpr(ctx, a->rs2, EXT_NONE);
> +    MemOp memop = MO_ALIGN | MO_SQ;
>   
>       decode_save_opc(ctx, RISCV_UW2_ALWAYS_STORE_AMO);
>       src1 = get_address(ctx, a->rs1, 0);
>   
> -    tcg_gen_atomic_xchg_tl(dest, src1, src2, SS_MMU_INDEX(ctx),
> -                           (MO_ALIGN | MO_TE | MO_SQ));
> +    memop |= MO_TE;
> +    tcg_gen_atomic_xchg_tl(dest, src1, src2, SS_MMU_INDEX(ctx), memop);
>       gen_set_gpr(ctx, a->rd, dest);
>       return true;
>   }



