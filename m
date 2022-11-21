Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ox14i-0004Ax-Jj
	for mharc-qemu-riscv@gnu.org; Mon, 21 Nov 2022 02:18:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ox14d-00048o-6M; Mon, 21 Nov 2022 02:18:35 -0500
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ox14b-00075y-Ij; Mon, 21 Nov 2022 02:18:34 -0500
Received: by mail-vk1-xa2f.google.com with SMTP id m18so5225491vka.10;
 Sun, 20 Nov 2022 23:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xVUaPtoXs5k+P5Uo1EX58C33TTTmVcwlTzX2bOofhRc=;
 b=Rw53jthS8QAhZPLYCA1xUz13bhdt60Ed3r3/zIjJLcR36SCPcCbpl3tK+lynbblr1N
 oRfqsI5CXIHlqa6o3ShHBvDpbgrMdKyP/0OQaN3JeBYetwKnq+6q/JyVmHjmPzokXJhx
 R9PrhUCEaTd3LdXoxlhXmyZdYRXkQeVnN8pzeKsQQWrlevsD0gLUumNRwqCOKfwYrDzN
 C7NaB2bhZlx6xGn+jvUZEXp0bCziehVtjJDuZBRMFtagYkpD0O1RPcfzBAbqoolVsYTR
 3CWXvJpotTjqSya4349FLKgtfbPDdoIl0c+UVPTg7MVVM8jYxlxLk0mLfoOp40WrtYXn
 nIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xVUaPtoXs5k+P5Uo1EX58C33TTTmVcwlTzX2bOofhRc=;
 b=sikD16gLq/51+S+5UfJxPGFbajwY+7MOK2sRAMlJscq7pO1dhFdD2CA6ybzMF5t4Vj
 byxNqHExhqgmMbz8Y5E+mf8AdbmdFbvXoCOQb7m+FfcH8sGrKk4wqj5+vhcHCc3CgosD
 snMDr0VPgi4pdQAiAsr62m2kqW8sTyTlYn8hT6fW5afm2i1YKxhtot1K1/NGOyZZ5QWy
 uZYbrzSJmtrjQSJT2rldFpeEVyvO4+OQs6BYcGFO+/SNWx9/cDrkP2z9AbF9JfEj9UYZ
 kZHpZpP//rYSkzaakBoac/4zrtGWjARJghtaxx+0BzGF6Fx0yusyPCE2SkzRjcGC8mEE
 PHYA==
X-Gm-Message-State: ANoB5pkzfvnZW9d3wHZXkUUu41Vc4R2H0ieU9cKqyaUYMT+m+BxP9jT1
 WRpiDQRav0gjrbfk3rl8xX2Nl5hljOCGQx0KJiU=
X-Google-Smtp-Source: AA0mqf7cd5Gwq5CTPyzHH0YUoRabqDAvKyJiBDHz9hYpbBZKN3NaZX8jlLRHUy59AkZ8ihNiCGC7QEKcz7qbwU8Grvo=
X-Received: by 2002:a1f:2314:0:b0:3bb:eb83:7ab7 with SMTP id
 j20-20020a1f2314000000b003bbeb837ab7mr8943166vkj.30.1669015112279; Sun, 20
 Nov 2022 23:18:32 -0800 (PST)
MIME-Version: 1.0
References: <20221118123728.49319-1-liweiwei@iscas.ac.cn>
 <20221118123728.49319-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20221118123728.49319-3-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Nov 2022 17:18:05 +1000
Message-ID: <CAKmqyKOfxfSd5brgOZohtQGEg4MNhhrb11+wmYbu5AwKrRKdpw@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] target/riscv: add support for Zca extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 21 Nov 2022 07:18:38 -0000

On Fri, Nov 18, 2022 at 10:44 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Modify the check for C extension to Zca (C implies Zca)
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
>  target/riscv/translate.c                | 8 ++++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index 5c69b88d1e..0d73b919ce 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>      tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
>
>      gen_set_pc(ctx, cpu_pc);
> -    if (!has_ext(ctx, RVC)) {
> +    if (!ctx->cfg_ptr->ext_zca) {
>          TCGv t0 = tcg_temp_new();
>
>          misaligned = gen_new_label();
> @@ -178,7 +178,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
>
>      gen_set_label(l); /* branch taken */
>
> -    if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
> +    if (!ctx->cfg_ptr->ext_zca && ((ctx->base.pc_next + a->imm) & 0x3)) {
>          /* misaligned */
>          gen_exception_inst_addr_mis(ctx);
>      } else {
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 2ab8772ebe..ee24b451e3 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -557,7 +557,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>
>      /* check misaligned: */
>      next_pc = ctx->base.pc_next + imm;
> -    if (!has_ext(ctx, RVC)) {
> +    if (!ctx->cfg_ptr->ext_zca) {
>          if ((next_pc & 0x3) != 0) {
>              gen_exception_inst_addr_mis(ctx);
>              return;
> @@ -1097,7 +1097,11 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>      ctx->virt_inst_excp = false;
>      /* Check for compressed insn */
>      if (insn_len(opcode) == 2) {
> -        if (!has_ext(ctx, RVC)) {
> +        /*
> +         * Zca support all of the existing C extension, excluding all
> +         * compressed floating point loads and stores
> +         */
> +        if (!ctx->cfg_ptr->ext_zca) {
>              gen_exception_illegal(ctx);
>          } else {
>              ctx->opcode = opcode;
> --
> 2.25.1
>
>

