Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lym8E-00073a-Jb
	for mharc-qemu-riscv@gnu.org; Wed, 30 Jun 2021 22:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lym8C-000737-HW; Wed, 30 Jun 2021 22:08:44 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:38745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lym8A-0005YZ-H9; Wed, 30 Jun 2021 22:08:44 -0400
Received: by mail-il1-x133.google.com with SMTP id v5so4938109ilo.5;
 Wed, 30 Jun 2021 19:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C/cJJweAMB5d/ifv05sUnR4ICrjxK8eReZVrWUOFUSE=;
 b=OgWOT788MjA2OfwD9EiVBWIh1lTTQzw8wX6AfAbD3l1HrCGh1tzWOV3kAPNew2ZAVD
 QF9+LaG0+Ii1A11RUFy1MtRBshaHsApAaypEem05onVJOGHKVLWSqpKzwzBuRcP5wuR8
 uvoMwoBVnbXuegicxVFcrsA5F3PZlCsJEL5kWT8VPtdsb2ZKTGVCGPs/mx706zdHnP+3
 BNMx5hOXkhVe1bPHMpWhWKqlUbwZb0mtEPb1b01TBgaE8ohTTClNpDQ+SxnVOvZfSCFG
 ribR8vFcqsnVZzajlUld56amJWOKFbuKeYYnyz7O9pxpYod94EVMECaO/TSiWm0wkc53
 z8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C/cJJweAMB5d/ifv05sUnR4ICrjxK8eReZVrWUOFUSE=;
 b=LiekpTCaGugf0avuywT+RSkg+fXKsYPRPXrz1NUUk8GeTntcYLIxx7Fy8I3PGXRkdz
 aJbpe+MhQRvbAicM7T5b6biaav9wrXmgYLoHMtZYYBLK+KpncWDdTW6hqnwXzALTr8YN
 kKfYgqd5h4WUvsuTo701qLTBOyypwlo2EvcUbyBe/oMbUKl6yLOFPgnsy33rLL3yipbd
 N70LK1kdSwd2oXy/IU0gjoZmMgvzceLJLGHXhhaO7S33PV/eFStakyZg5vk0zUiDoDW6
 sFC1P+tuy1DRNxnYSvlcyxz3GYMPwabs9KJE0AYdFpJgi3HOEG3Z5GRz/eNnj5pyo650
 gq7Q==
X-Gm-Message-State: AOAM530QFfVuGLfE1PdH+1gpt/47uF1NpdNo2mjO88hU8FdanwP8FQT4
 gM9Yx6E2iUfFaKLGZeBIvfa+XhJg2XEhtSflGGk=
X-Google-Smtp-Source: ABdhPJxBbcU9v1l8AiLSQqaRTUg8nToJTCMCdVS1yVcGQ6eAgy8goD+8KzfOvRExiRnlY/OQ2ymyf+iVva6JaPNxZog=
X-Received: by 2002:a05:6e02:1ba9:: with SMTP id
 n9mr3982063ili.267.1625105320354; 
 Wed, 30 Jun 2021 19:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
 <20210624105521.3964-6-zhiwei_liu@c-sky.com>
In-Reply-To: <20210624105521.3964-6-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 1 Jul 2021 12:08:14 +1000
Message-ID: <CAKmqyKNkOTq-CGf51RWB0jeV94-5ih7k3kQNeo=fpoEwMExWAQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/37] target/riscv: SIMD 16-bit Shift Instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
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
X-List-Received-Date: Thu, 01 Jul 2021 02:08:45 -0000

On Thu, Jun 24, 2021 at 9:11 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Instructions include right arithmetic shift, right logic shift,
> and left shift.
>
> The shift can be an immediate or a register scalar. The
> right shift has rounding operation. And the left shift
> has saturation operation.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |   9 ++
>  target/riscv/insn32.decode              |  17 ++++
>  target/riscv/insn_trans/trans_rvp.c.inc |  59 ++++++++++++++
>  target/riscv/packed_helper.c            | 104 ++++++++++++++++++++++++
>  4 files changed, 189 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 629ff13402..de7b4fc17d 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1188,3 +1188,12 @@ DEF_HELPER_3(rsub8, tl, env, tl, tl)
>  DEF_HELPER_3(ursub8, tl, env, tl, tl)
>  DEF_HELPER_3(ksub8, tl, env, tl, tl)
>  DEF_HELPER_3(uksub8, tl, env, tl, tl)
> +
> +DEF_HELPER_3(sra16, tl, env, tl, tl)
> +DEF_HELPER_3(sra16_u, tl, env, tl, tl)
> +DEF_HELPER_3(srl16, tl, env, tl, tl)
> +DEF_HELPER_3(srl16_u, tl, env, tl, tl)
> +DEF_HELPER_3(sll16, tl, env, tl, tl)
> +DEF_HELPER_3(ksll16, tl, env, tl, tl)
> +DEF_HELPER_3(kslra16, tl, env, tl, tl)
> +DEF_HELPER_3(kslra16_u, tl, env, tl, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 13e1222296..44c497f28a 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -24,6 +24,7 @@
>  %sh5       20:5
>
>  %sh7    20:7
> +%sh4    20:4
>  %csr    20:12
>  %rm     12:3
>  %nf     29:3                     !function=ex_plus_1
> @@ -61,6 +62,7 @@
>  @j       ....................      ..... ....... &j      imm=%imm_j          %rd
>
>  @sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh7     %rs1 %rd
> +@sh4     ......  ...... .....  ... ..... ....... &shift  shamt=%sh4      %rs1 %rd
>  @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
>
>  @atom_ld ..... aq:1 rl:1 ..... ........ ..... ....... &atomic rs2=0     %rs1 %rd
> @@ -775,3 +777,18 @@ rsub8      0000101  ..... ..... 000 ..... 1110111 @r
>  ursub8     0010101  ..... ..... 000 ..... 1110111 @r
>  ksub8      0001101  ..... ..... 000 ..... 1110111 @r
>  uksub8     0011101  ..... ..... 000 ..... 1110111 @r
> +
> +sra16      0101000  ..... ..... 000 ..... 1110111 @r
> +sra16_u    0110000  ..... ..... 000 ..... 1110111 @r
> +srai16     0111000  0.... ..... 000 ..... 1110111 @sh4
> +srai16_u   0111000  1.... ..... 000 ..... 1110111 @sh4
> +srl16      0101001  ..... ..... 000 ..... 1110111 @r
> +srl16_u    0110001  ..... ..... 000 ..... 1110111 @r
> +srli16     0111001  0.... ..... 000 ..... 1110111 @sh4
> +srli16_u   0111001  1.... ..... 000 ..... 1110111 @sh4
> +sll16      0101010  ..... ..... 000 ..... 1110111 @r
> +slli16     0111010  0.... ..... 000 ..... 1110111 @sh4
> +ksll16     0110010  ..... ..... 000 ..... 1110111 @r
> +kslli16    0111010  1.... ..... 000 ..... 1110111 @sh4
> +kslra16    0101011  ..... ..... 000 ..... 1110111 @r
> +kslra16_u  0110011  ..... ..... 000 ..... 1110111 @r
> diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
> index 80bec35ac9..afafa49824 100644
> --- a/target/riscv/insn_trans/trans_rvp.c.inc
> +++ b/target/riscv/insn_trans/trans_rvp.c.inc
> @@ -128,3 +128,62 @@ GEN_RVP_R_OOL(rsub8);
>  GEN_RVP_R_OOL(ursub8);
>  GEN_RVP_R_OOL(ksub8);
>  GEN_RVP_R_OOL(uksub8);
> +
> +/* 16-bit Shift Instructions */
> +GEN_RVP_R_OOL(sra16);
> +GEN_RVP_R_OOL(srl16);
> +GEN_RVP_R_OOL(sll16);
> +GEN_RVP_R_OOL(sra16_u);
> +GEN_RVP_R_OOL(srl16_u);
> +GEN_RVP_R_OOL(ksll16);
> +GEN_RVP_R_OOL(kslra16);
> +GEN_RVP_R_OOL(kslra16_u);
> +
> +static bool
> +rvp_shifti_ool(DisasContext *ctx, arg_shift *a,
> +               void (* fn)(TCGv, TCGv_ptr, TCGv, TCGv))
> +{
> +    TCGv src1, dst, shift;
> +
> +    src1 = tcg_temp_new();
> +    dst = tcg_temp_new();
> +
> +    gen_get_gpr(src1, a->rs1);
> +    shift = tcg_const_tl(a->shamt);
> +    fn(dst, cpu_env, src1, shift);
> +    gen_set_gpr(a->rd, dst);
> +
> +    tcg_temp_free(src1);
> +    tcg_temp_free(dst);
> +    tcg_temp_free(shift);
> +    return true;
> +}
> +
> +static inline bool
> +rvp_shifti(DisasContext *ctx, arg_shift *a,
> +           void (* vecop)(TCGv, TCGv, target_long),
> +           void (* op)(TCGv, TCGv_ptr, TCGv, TCGv))
> +{
> +    if (!has_ext(ctx, RVP)) {
> +        return false;
> +    }
> +
> +    if (a->rd && a->rs1 && vecop) {
> +        vecop(cpu_gpr[a->rd], cpu_gpr[a->rs1], a->shamt);
> +        return true;
> +    }
> +    return rvp_shifti_ool(ctx, a, op);
> +}
> +
> +#define GEN_RVP_SHIFTI(NAME, VECOP, OP)                  \
> +static bool trans_##NAME(DisasContext *s, arg_shift *a)  \
> +{                                                        \
> +    return rvp_shifti(s, a, VECOP, OP);                  \
> +}
> +
> +GEN_RVP_SHIFTI(srai16, tcg_gen_vec_sar16i_tl, gen_helper_sra16);
> +GEN_RVP_SHIFTI(srli16, tcg_gen_vec_shr16i_tl, gen_helper_srl16);
> +GEN_RVP_SHIFTI(slli16, tcg_gen_vec_shl16i_tl, gen_helper_sll16);
> +GEN_RVP_SHIFTI(srai16_u, NULL, gen_helper_sra16_u);
> +GEN_RVP_SHIFTI(srli16_u, NULL, gen_helper_srl16_u);
> +GEN_RVP_SHIFTI(kslli16, NULL, gen_helper_ksll16);
> diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
> index 62db072204..7e31c2fe46 100644
> --- a/target/riscv/packed_helper.c
> +++ b/target/riscv/packed_helper.c
> @@ -425,3 +425,107 @@ static inline void do_uksub8(CPURISCVState *env, void *vd, void *va,
>  }
>
>  RVPR(uksub8, 1, 1);
> +
> +/* 16-bit Shift Instructions */
> +static inline void do_sra16(CPURISCVState *env, void *vd, void *va,
> +                            void *vb, uint8_t i)
> +{
> +    int16_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0xf;
> +    d[i] = a[i] >> shift;
> +}
> +
> +RVPR(sra16, 1, 2);
> +
> +static inline void do_srl16(CPURISCVState *env, void *vd, void *va,
> +                            void *vb, uint8_t i)
> +{
> +    uint16_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0xf;
> +    d[i] = a[i] >> shift;
> +}
> +
> +RVPR(srl16, 1, 2);
> +
> +static inline void do_sll16(CPURISCVState *env, void *vd, void *va,
> +                            void *vb, uint8_t i)
> +{
> +    uint16_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0xf;
> +    d[i] = a[i] << shift;
> +}
> +
> +RVPR(sll16, 1, 2);
> +
> +static inline void do_sra16_u(CPURISCVState *env, void *vd, void *va,
> +                              void *vb, uint8_t i)
> +{
> +    int16_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0xf;
> +
> +    d[i] = vssra16(env, 0, a[i], shift);
> +}
> +
> +RVPR(sra16_u, 1, 2);
> +
> +static inline void do_srl16_u(CPURISCVState *env, void *vd, void *va,
> +                              void *vb, uint8_t i)
> +{
> +    uint16_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0xf;
> +
> +    d[i] = vssrl16(env, 0, a[i], shift);
> +}
> +
> +RVPR(srl16_u, 1, 2);
> +
> +static inline void do_ksll16(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    int16_t *d = vd, *a = va, result;
> +    uint8_t shift = *(uint8_t *)vb & 0xf;
> +
> +    result = a[i] << shift;
> +    if (shift > (clrsb32(a[i]) - 16)) {
> +        env->vxsat = 0x1;
> +        d[i] = (a[i] & INT16_MIN) ? INT16_MIN : INT16_MAX;
> +    } else {
> +        d[i] = result;
> +    }
> +}
> +
> +RVPR(ksll16, 1, 2);
> +
> +static inline void do_kslra16(CPURISCVState *env, void *vd, void *va,
> +                              void *vb, uint8_t i)
> +{
> +    int16_t *d = vd, *a = va;
> +    int32_t shift = sextract32((*(target_ulong *)vb), 0, 5);
> +
> +    if (shift >= 0) {
> +        do_ksll16(env, vd, va, vb, i);
> +    } else {
> +        shift = -shift;
> +        shift = (shift == 16) ? 15 : shift;
> +        d[i] = a[i] >> shift;
> +    }
> +}
> +
> +RVPR(kslra16, 1, 2);
> +
> +static inline void do_kslra16_u(CPURISCVState *env, void *vd, void *va,
> +                                void *vb, uint8_t i)
> +{
> +    int16_t *d = vd, *a = va;
> +    int32_t shift = sextract32((*(uint32_t *)vb), 0, 5);
> +
> +    if (shift >= 0) {
> +        do_ksll16(env, vd, va, vb, i);
> +    } else {
> +        shift = -shift;
> +        shift = (shift == 16) ? 15 : shift;
> +        d[i] = vssra16(env, 0, a[i], shift);
> +    }
> +}
> +
> +RVPR(kslra16_u, 1, 2);
> --
> 2.17.1
>
>

