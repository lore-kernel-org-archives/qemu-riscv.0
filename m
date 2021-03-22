Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lOMOg-0007cA-2O
	for mharc-qemu-riscv@gnu.org; Mon, 22 Mar 2021 11:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOMOe-0007Xn-4T; Mon, 22 Mar 2021 11:23:12 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:45576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOMOc-0002LJ-4k; Mon, 22 Mar 2021 11:23:11 -0400
Received: by mail-io1-xd2a.google.com with SMTP id k8so14325544iop.12;
 Mon, 22 Mar 2021 08:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uXjpPUPYgXiPWg3+BZ1ldGr+2NazGfkgiv77NxmAhAU=;
 b=G1hxMd3naREB4fOHMc4g/C3aTyjPSYV9LxhXelejQZJ6u6T8Rq3CwkU7/VRwLHnrEM
 yv6fBKe3byzDeml9w1pW19CeTGtOZPD8/dL7xs1lDoSjf+ksR0D2nP8zudjQJbUW3L/B
 M4YLq9XuALWycPitTiS6pLM7Z2xzSzYt4zXGRmU1MFQa0w7WSD/SIFZ0+xpx1yZajDCC
 RQfEdER83Sqs41foo36+oHJHZAqDZhQQMEcB/faPQBbLMDHjR23n7sssVpFoz1Kxoh3E
 8cjfjfyDtvnokKf6DXnjv1MJB1SERP5wfzhkj3iC59cUv4q7gLxDUsgO5VFB5SxCGS62
 qUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uXjpPUPYgXiPWg3+BZ1ldGr+2NazGfkgiv77NxmAhAU=;
 b=LnELcr8SbfiD/uzG+0Za/+sr1cpSa8V1j/KuWXimpYT8ablVfwuZoSBaP5KlQBJicN
 Qa14uHK0H4abL4MPFWsEiD8I7LIi4QOOVaTC5EjeHRGbMlqHr0ERxvBElbhiw/Gf3liy
 E+fkPo7u3eMS3QnSnek/wubC7+YPz0RE42ryoo2S0nA4Jjfo0r43X+UXY8OoNBvJLhB1
 EVGyzUPkYbTEYDKMAtRes9dPKqflMw+FRJXS9Ac3GtMALveZoiVF29/ENbh5sfyimW6Y
 o9SYHfP+IPqu6NFUroCN/bxj+TWsfumA8HDoE5OwyqNkOzhbdF2ciTgz/gtwF3153SB6
 c70w==
X-Gm-Message-State: AOAM530zht30fPcn9/sD0tRBFU0duIcij+cra7qTCg65Vcj80D1A9duV
 eMLP/RBhhkLsu96RBoO8ThK7HfBD3iwPPdlQwt5yRrAtxy8=
X-Google-Smtp-Source: ABdhPJzW4mhTKSXYsZScVVCVY1gAg5ONWoYaWzALTE45sgb5zOEFbN4PkdYVneX0GdEW2bckRyLng7lc/ZJYM2OLjt4=
X-Received: by 2002:a6b:7808:: with SMTP id j8mr246527iom.118.1616426588745;
 Mon, 22 Mar 2021 08:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210322121609.3097928-1-georg.kotheimer@kernkonzept.com>
In-Reply-To: <20210322121609.3097928-1-georg.kotheimer@kernkonzept.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Mar 2021 11:21:12 -0400
Message-ID: <CAKmqyKPFVHLpx-XTjTVRSrGbs_NzvdEAYA=x1Cf__1o3ObAaVA@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Prevent lost illegal instruction
 exceptions
To: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
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
X-List-Received-Date: Mon, 22 Mar 2021 15:23:12 -0000

On Mon, Mar 22, 2021 at 8:27 AM Georg Kotheimer
<georg.kotheimer@kernkonzept.com> wrote:
>
> When decode_insn16() fails, we fall back to decode_RV32_64C() for
> further compressed instruction decoding. However, prior to this change,
> we did not raise an illegal instruction exception, if decode_RV32_64C()
> fails to decode the instruction. This means that we skipped illegal
> compressed instructions instead of raising an illegal instruction
> exception.
>
> Instead of patching decode_RV32_64C(), we can just remove it,
> as it is dead code since f330433b363 anyway.
>
> Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 179 +--------------------------------------
>  1 file changed, 1 insertion(+), 178 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 0f28b5f41e..2f9f5ccc62 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -67,20 +67,6 @@ typedef struct DisasContext {
>      CPUState *cs;
>  } DisasContext;
>
> -#ifdef TARGET_RISCV64
> -/* convert riscv funct3 to qemu memop for load/store */
> -static const int tcg_memop_lookup[8] = {
> -    [0 ... 7] = -1,
> -    [0] = MO_SB,
> -    [1] = MO_TESW,
> -    [2] = MO_TESL,
> -    [3] = MO_TEQ,
> -    [4] = MO_UB,
> -    [5] = MO_TEUW,
> -    [6] = MO_TEUL,
> -};
> -#endif
> -
>  #ifdef TARGET_RISCV64
>  #define CASE_OP_32_64(X) case X: case glue(X, W)
>  #else
> @@ -374,48 +360,6 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>      ctx->base.is_jmp = DISAS_NORETURN;
>  }
>
> -#ifdef TARGET_RISCV64
> -static void gen_load_c(DisasContext *ctx, uint32_t opc, int rd, int rs1,
> -        target_long imm)
> -{
> -    TCGv t0 = tcg_temp_new();
> -    TCGv t1 = tcg_temp_new();
> -    gen_get_gpr(t0, rs1);
> -    tcg_gen_addi_tl(t0, t0, imm);
> -    int memop = tcg_memop_lookup[(opc >> 12) & 0x7];
> -
> -    if (memop < 0) {
> -        gen_exception_illegal(ctx);
> -        return;
> -    }
> -
> -    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, memop);
> -    gen_set_gpr(rd, t1);
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -}
> -
> -static void gen_store_c(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
> -        target_long imm)
> -{
> -    TCGv t0 = tcg_temp_new();
> -    TCGv dat = tcg_temp_new();
> -    gen_get_gpr(t0, rs1);
> -    tcg_gen_addi_tl(t0, t0, imm);
> -    gen_get_gpr(dat, rs2);
> -    int memop = tcg_memop_lookup[(opc >> 12) & 0x7];
> -
> -    if (memop < 0) {
> -        gen_exception_illegal(ctx);
> -        return;
> -    }
> -
> -    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx, memop);
> -    tcg_temp_free(t0);
> -    tcg_temp_free(dat);
> -}
> -#endif
> -
>  #ifndef CONFIG_USER_ONLY
>  /* The states of mstatus_fs are:
>   * 0 = disabled, 1 = initial, 2 = clean, 3 = dirty
> @@ -447,83 +391,6 @@ static void mark_fs_dirty(DisasContext *ctx)
>  static inline void mark_fs_dirty(DisasContext *ctx) { }
>  #endif
>
> -#if !defined(TARGET_RISCV64)
> -static void gen_fp_load(DisasContext *ctx, uint32_t opc, int rd,
> -        int rs1, target_long imm)
> -{
> -    TCGv t0;
> -
> -    if (ctx->mstatus_fs == 0) {
> -        gen_exception_illegal(ctx);
> -        return;
> -    }
> -
> -    t0 = tcg_temp_new();
> -    gen_get_gpr(t0, rs1);
> -    tcg_gen_addi_tl(t0, t0, imm);
> -
> -    switch (opc) {
> -    case OPC_RISC_FLW:
> -        if (!has_ext(ctx, RVF)) {
> -            goto do_illegal;
> -        }
> -        tcg_gen_qemu_ld_i64(cpu_fpr[rd], t0, ctx->mem_idx, MO_TEUL);
> -        /* RISC-V requires NaN-boxing of narrower width floating point values */
> -        tcg_gen_ori_i64(cpu_fpr[rd], cpu_fpr[rd], 0xffffffff00000000ULL);
> -        break;
> -    case OPC_RISC_FLD:
> -        if (!has_ext(ctx, RVD)) {
> -            goto do_illegal;
> -        }
> -        tcg_gen_qemu_ld_i64(cpu_fpr[rd], t0, ctx->mem_idx, MO_TEQ);
> -        break;
> -    do_illegal:
> -    default:
> -        gen_exception_illegal(ctx);
> -        break;
> -    }
> -    tcg_temp_free(t0);
> -
> -    mark_fs_dirty(ctx);
> -}
> -
> -static void gen_fp_store(DisasContext *ctx, uint32_t opc, int rs1,
> -        int rs2, target_long imm)
> -{
> -    TCGv t0;
> -
> -    if (ctx->mstatus_fs == 0) {
> -        gen_exception_illegal(ctx);
> -        return;
> -    }
> -
> -    t0 = tcg_temp_new();
> -    gen_get_gpr(t0, rs1);
> -    tcg_gen_addi_tl(t0, t0, imm);
> -
> -    switch (opc) {
> -    case OPC_RISC_FSW:
> -        if (!has_ext(ctx, RVF)) {
> -            goto do_illegal;
> -        }
> -        tcg_gen_qemu_st_i64(cpu_fpr[rs2], t0, ctx->mem_idx, MO_TEUL);
> -        break;
> -    case OPC_RISC_FSD:
> -        if (!has_ext(ctx, RVD)) {
> -            goto do_illegal;
> -        }
> -        tcg_gen_qemu_st_i64(cpu_fpr[rs2], t0, ctx->mem_idx, MO_TEQ);
> -        break;
> -    do_illegal:
> -    default:
> -        gen_exception_illegal(ctx);
> -        break;
> -    }
> -
> -    tcg_temp_free(t0);
> -}
> -#endif
> -
>  static void gen_set_rm(DisasContext *ctx, int rm)
>  {
>      TCGv_i32 t0;
> @@ -537,49 +404,6 @@ static void gen_set_rm(DisasContext *ctx, int rm)
>      tcg_temp_free_i32(t0);
>  }
>
> -static void decode_RV32_64C0(DisasContext *ctx, uint16_t opcode)
> -{
> -    uint8_t funct3 = extract16(opcode, 13, 3);
> -    uint8_t rd_rs2 = GET_C_RS2S(opcode);
> -    uint8_t rs1s = GET_C_RS1S(opcode);
> -
> -    switch (funct3) {
> -    case 3:
> -#if defined(TARGET_RISCV64)
> -        /* C.LD(RV64/128) -> ld rd', offset[7:3](rs1')*/
> -        gen_load_c(ctx, OPC_RISC_LD, rd_rs2, rs1s,
> -                 GET_C_LD_IMM(opcode));
> -#else
> -        /* C.FLW (RV32) -> flw rd', offset[6:2](rs1')*/
> -        gen_fp_load(ctx, OPC_RISC_FLW, rd_rs2, rs1s,
> -                    GET_C_LW_IMM(opcode));
> -#endif
> -        break;
> -    case 7:
> -#if defined(TARGET_RISCV64)
> -        /* C.SD (RV64/128) -> sd rs2', offset[7:3](rs1')*/
> -        gen_store_c(ctx, OPC_RISC_SD, rs1s, rd_rs2,
> -                  GET_C_LD_IMM(opcode));
> -#else
> -        /* C.FSW (RV32) -> fsw rs2', offset[6:2](rs1')*/
> -        gen_fp_store(ctx, OPC_RISC_FSW, rs1s, rd_rs2,
> -                     GET_C_LW_IMM(opcode));
> -#endif
> -        break;
> -    }
> -}
> -
> -static void decode_RV32_64C(DisasContext *ctx, uint16_t opcode)
> -{
> -    uint8_t op = extract16(opcode, 0, 2);
> -
> -    switch (op) {
> -    case 0:
> -        decode_RV32_64C0(ctx, opcode);
> -        break;
> -    }
> -}
> -
>  static int ex_plus_1(DisasContext *ctx, int nf)
>  {
>      return nf + 1;
> @@ -779,8 +603,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>          } else {
>              ctx->pc_succ_insn = ctx->base.pc_next + 2;
>              if (!decode_insn16(ctx, opcode)) {
> -                /* fall back to old decoder */
> -                decode_RV32_64C(ctx, opcode);
> +                gen_exception_illegal(ctx);
>              }
>          }
>      } else {
> --
> 2.31.0
>
>

