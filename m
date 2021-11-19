Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mo3Cg-00031R-Ks
	for mharc-qemu-riscv@gnu.org; Fri, 19 Nov 2021 07:41:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3Cd-0002tl-Jj; Fri, 19 Nov 2021 07:41:15 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=36799
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3Cb-0003Yd-Ca; Fri, 19 Nov 2021 07:41:15 -0500
Received: by mail-io1-xd2c.google.com with SMTP id e144so12558740iof.3;
 Fri, 19 Nov 2021 04:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tC3FBFn0Wy0GqtZ0yinl046XjJqq23c2WFT+X7Z3XqY=;
 b=QiDaMNTPvnMRxtf8eIiY5J3oidg/+eDPTpR0U46E6u4NpD1U2kbuTxmFdJjctOqQ/L
 Zbo0/li8rBYc5duRbBUeEykA1SgvqPW+4deNPCx0nK8tcLobkAYvFQBPXRGFjpmHFec9
 Rh4XSxMQUX79GiksST++zEjJqqpP8VF2lC6F2iUUYSj5ys2ddvGk3Oo8mZecG12+5gUp
 0ReonsQyftMyAt8MKWTIThyCsznNtC7g0VPEPLmqOTt03/UH6P2SkpxRd8HUMQi7iJhB
 snNixkWvJfZ9QUFTFiufx1I9SkDgZlPtT6ye6riRAz997zq9rwqqeFI4/Az+n6Lbc5dm
 Lw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tC3FBFn0Wy0GqtZ0yinl046XjJqq23c2WFT+X7Z3XqY=;
 b=Ssnu9RiXi0060f9QzY0+9knplw4nmW91nwU1Tk88EbZ8K5P0V/vaKYIeWo6jZBQWJH
 t/xG2f/KbzCpVdxCo9ZrMgne4oInBeHp/hPLd3urot93tGEGDD/0U3/Uq3/f8FwYAz56
 GPpRbf2ZLcEVFl2wPvTiVq83gnBFeoQ0Nlh3+isSwEW0uF2KlkMP2lTsrv76cw10A28a
 PKgIHzIohDDImcMOwHjooIfssqOoDBsRRn7n+UxpxKYO4w5waCFSCO9xjb5vlag/I/iF
 2NQSSeV6EpxjAJPAi9lOCQTy/G096/HT1Lzsc3Qr+JJyzzV/GDNsmD5dbFfoAVRTypgH
 ZthQ==
X-Gm-Message-State: AOAM531T7w1DVsshfDSgw51D5NNYSgQ3cf3r3lcAI5Wnxvs9iAS2Tvge
 UIvJKIbpGiAA3hIVQFyDdlMGvG+N/l4V+o3S1Bw=
X-Google-Smtp-Source: ABdhPJzjGWA9Fj1EV/5yGxpWA+KJHD2nxhbqR6CNERLc5anXswI/VssChwe7uaFOKx4q5GsZwtrPIoDYg4POrx3jYh0=
X-Received: by 2002:a05:6602:204e:: with SMTP id
 z14mr5176824iod.90.1637325671740; 
 Fri, 19 Nov 2021 04:41:11 -0800 (PST)
MIME-Version: 1.0
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <20211111155149.58172-15-zhiwei_liu@c-sky.com>
In-Reply-To: <20211111155149.58172-15-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Nov 2021 22:40:44 +1000
Message-ID: <CAKmqyKMK7Zb3hiXect67Mo32UP_dAd_CRoGu8hpmng-ZWcyasA@mail.gmail.com>
Subject: Re: [PATCH v4 14/20] target/riscv: Adjust vsetvl according to XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 19 Nov 2021 12:41:16 -0000

On Fri, Nov 12, 2021 at 2:14 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   | 2 +-
>  target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
>  target/riscv/vector_helper.c            | 8 +++++---
>  3 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index c5098380dd..f2910f5f30 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -82,7 +82,7 @@ DEF_HELPER_2(hyp_hlvx_wu, tl, env, tl)
>  #endif
>
>  /* Vector functions */
> -DEF_HELPER_3(vsetvl, tl, env, tl, tl)
> +DEF_HELPER_4(vsetvl, tl, env, tl, tl, i32)
>  DEF_HELPER_5(vlb_v_b, void, ptr, ptr, tl, env, i32)
>  DEF_HELPER_5(vlb_v_b_mask, void, ptr, ptr, tl, env, i32)
>  DEF_HELPER_5(vlb_v_h, void, ptr, ptr, tl, env, i32)
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 17ee3babef..6fa673f4b2 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -37,7 +37,7 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
>      } else {
>          s1 = get_gpr(ctx, a->rs1, EXT_ZERO);
>      }
> -    gen_helper_vsetvl(dst, cpu_env, s1, s2);
> +    gen_helper_vsetvl(dst, cpu_env, s1, s2, tcg_constant_i32(get_xlen(ctx)));
>      gen_set_gpr(ctx, a->rd, dst);
>
>      tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
> @@ -64,7 +64,7 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
>      } else {
>          s1 = get_gpr(ctx, a->rs1, EXT_ZERO);
>      }
> -    gen_helper_vsetvl(dst, cpu_env, s1, s2);
> +    gen_helper_vsetvl(dst, cpu_env, s1, s2, tcg_constant_i32(get_xlen(ctx)));
>      gen_set_gpr(ctx, a->rd, dst);
>
>      gen_goto_tb(ctx, 0, ctx->pc_succ_insn);
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index b02ccefa4d..e49b431610 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -27,14 +27,16 @@
>  #include <math.h>
>
>  target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
> -                            target_ulong s2)
> +                            target_ulong s2, uint32_t xlen)
>  {
>      int vlmax, vl;
>      RISCVCPU *cpu = env_archcpu(env);
>      uint16_t sew = 8 << FIELD_EX64(s2, VTYPE, VSEW);
>      uint8_t ediv = FIELD_EX64(s2, VTYPE, VEDIV);
> -    bool vill = FIELD_EX64(s2, VTYPE, VILL);
> -    target_ulong reserved = FIELD_EX64(s2, VTYPE, RESERVED);
> +    bool vill = (s2 >> (xlen - 1)) & 0x1;
> +    target_ulong reserved = s2 &
> +                            MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
> +                                            xlen - 1 - R_VTYPE_RESERVED_SHIFT);
>
>      if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0)) {
>          /* only set vill bit. */
> --
> 2.25.1
>
>

