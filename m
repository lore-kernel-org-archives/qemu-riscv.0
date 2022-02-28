Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOXEG-0006Pm-1F
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 23:01:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nOXEF-0006PW-8M; Sun, 27 Feb 2022 23:01:43 -0500
Received: from [2607:f8b0:4864:20::12b] (port=34811
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nOXEB-0001jJ-Vb; Sun, 27 Feb 2022 23:01:42 -0500
Received: by mail-il1-x12b.google.com with SMTP id f2so9087842ilq.1;
 Sun, 27 Feb 2022 20:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ylvlGYGvVsV5pQ7qUeSurEd9cBNaaHYsx2WTS/WVQWE=;
 b=BG2QCVueX9qi2eh9dx6uTVjGDXTspvVg6PlEEIYCM6uYAecj1XPg+jlosBGQpF8nyH
 U+P3wDjQyey1pMtqEwzaJZg0KHeOvyTETKucxyEZZ4m2Blx4jTPJH4W8W0YvOYx4/S7x
 6B81QyPRiheyVP7UjlxzXEIgmsOBl6DnaQBTru1s5PdjKSRtgIGggrwo2eT+tqyzn6et
 WLmwqfLvff8A1DZ7rraWGcdbxNfqVK1g3nXiLP6NTvrjPN3y+ygLazvkQsFxYzkUaQri
 WQboeHI/xmeFvlgLdG2rz0R0PQNfd0eOsc7vb0fVM1Fo9Ri3edcMCvcgeEcGxTxVul6v
 hEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ylvlGYGvVsV5pQ7qUeSurEd9cBNaaHYsx2WTS/WVQWE=;
 b=zD7HZfhvu5J41wQpLmOXNZ9CPTDiw+MX5RU6SqHbp4wbvQ4HvrNWE/u0YrA3m3HmnW
 1MXZPrRlqWH9gj381eRC0E2Q1pGhOweVHjA5QKNV52x15bGGgRcc/clf/Hnr7vjaP1g4
 1AzLZmzC4CldLaLuUH85j5JuKlGqM33+LNforvt15V0HpDTKibXhydZvYITH3+DNv6PQ
 4Dm2OCYJxuAvNpexS+gDQZwQxnnZ31cvdIeuglzj6VA7l4LBQSdxzVQvV3OaSQbgo34O
 D14PLItWf3m5Fy//uC9l7EurG/bEOdqxf0w2xydTyKtLO6tuQQoGWMoWTX1o0eCN3euY
 M6DA==
X-Gm-Message-State: AOAM532kKYa7lr/iZNZgp/dTVb7DxzmeQWIGnFzivNb3BXsnp15l8cnd
 x6u0jX6EJIaS+d3nz/2W+MUlizmWaz+lPJde0a0=
X-Google-Smtp-Source: ABdhPJyPwYg0sDKGnZ31KbEkQmF84/den6KYN1y+t5Loyqtv8HExMWg6Ccs79FLkVhtjSRemC6bp+Ufyn0HSlsbqwpA=
X-Received: by 2002:a92:c246:0:b0:2c2:740d:1c12 with SMTP id
 k6-20020a92c246000000b002c2740d1c12mr16219765ilo.55.1646020897863; Sun, 27
 Feb 2022 20:01:37 -0800 (PST)
MIME-Version: 1.0
References: <20220211043920.28981-1-liweiwei@iscas.ac.cn>
 <20220211043920.28981-5-liweiwei@iscas.ac.cn>
In-Reply-To: <20220211043920.28981-5-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Feb 2022 14:01:11 +1000
Message-ID: <CAKmqyKMi_f+PmafPmyKbenHYoxx_xgqsEOGfaKRuDvEyeWxYVw@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] target/riscv: add support for zdinx
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, ardxwe@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 28 Feb 2022 04:01:43 -0000

On Fri, Feb 11, 2022 at 2:45 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>   -- update extension check REQUIRE_ZDINX_OR_D
>   -- update double float point register read/write
>
> Co-authored-by: ardxwe <ardxwe@gmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvd.c.inc | 285 +++++++++++++++++-------
>  target/riscv/translate.c                |  52 +++++
>  2 files changed, 259 insertions(+), 78 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
> index 091ed3a8ad..1397c1ce1c 100644
> --- a/target/riscv/insn_trans/trans_rvd.c.inc
> +++ b/target/riscv/insn_trans/trans_rvd.c.inc
> @@ -18,6 +18,19 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>
> +#define REQUIRE_ZDINX_OR_D(ctx) do { \
> +    if (!ctx->cfg_ptr->ext_zdinx) { \
> +        REQUIRE_EXT(ctx, RVD); \
> +    } \
> +} while (0)
> +
> +#define REQUIRE_EVEN(ctx, reg) do { \
> +    if (ctx->cfg_ptr->ext_zdinx && (get_xl(ctx) == MXL_RV32) && \
> +        ((reg) & 0x1)) { \
> +        return false; \
> +    } \
> +} while (0)
> +
>  static bool trans_fld(DisasContext *ctx, arg_fld *a)
>  {
>      TCGv addr;
> @@ -47,10 +60,17 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
>  static bool trans_fmadd_d(DisasContext *ctx, arg_fmadd_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2 | a->rs3);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
> +    TCGv_i64 src3 = get_fpr_d(ctx, a->rs3);
> +
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fmadd_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
> -                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
> +    gen_helper_fmadd_d(dest, cpu_env, src1, src2, src3);
> +    gen_set_fpr_d(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -58,10 +78,17 @@ static bool trans_fmadd_d(DisasContext *ctx, arg_fmadd_d *a)
>  static bool trans_fmsub_d(DisasContext *ctx, arg_fmsub_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2 | a->rs3);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
> +    TCGv_i64 src3 = get_fpr_d(ctx, a->rs3);
> +
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fmsub_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
> -                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
> +    gen_helper_fmsub_d(dest, cpu_env, src1, src2, src3);
> +    gen_set_fpr_d(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -69,10 +96,17 @@ static bool trans_fmsub_d(DisasContext *ctx, arg_fmsub_d *a)
>  static bool trans_fnmsub_d(DisasContext *ctx, arg_fnmsub_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2 | a->rs3);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
> +    TCGv_i64 src3 = get_fpr_d(ctx, a->rs3);
> +
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fnmsub_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
> -                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
> +    gen_helper_fnmsub_d(dest, cpu_env, src1, src2, src3);
> +    gen_set_fpr_d(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -80,10 +114,17 @@ static bool trans_fnmsub_d(DisasContext *ctx, arg_fnmsub_d *a)
>  static bool trans_fnmadd_d(DisasContext *ctx, arg_fnmadd_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2 | a->rs3);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
> +    TCGv_i64 src3 = get_fpr_d(ctx, a->rs3);
> +
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fnmadd_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
> -                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
> +    gen_helper_fnmadd_d(dest, cpu_env, src1, src2, src3);
> +    gen_set_fpr_d(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -91,12 +132,16 @@ static bool trans_fnmadd_d(DisasContext *ctx, arg_fnmadd_d *a)
>  static bool trans_fadd_d(DisasContext *ctx, arg_fadd_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2);
>
> -    gen_set_rm(ctx, a->rm);
> -    gen_helper_fadd_d(cpu_fpr[a->rd], cpu_env,
> -                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
>
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fadd_d(dest, cpu_env, src1, src2);
> +    gen_set_fpr_d(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -104,12 +149,16 @@ static bool trans_fadd_d(DisasContext *ctx, arg_fadd_d *a)
>  static bool trans_fsub_d(DisasContext *ctx, arg_fsub_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2);
>
> -    gen_set_rm(ctx, a->rm);
> -    gen_helper_fsub_d(cpu_fpr[a->rd], cpu_env,
> -                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
>
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fsub_d(dest, cpu_env, src1, src2);
> +    gen_set_fpr_d(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -117,12 +166,16 @@ static bool trans_fsub_d(DisasContext *ctx, arg_fsub_d *a)
>  static bool trans_fmul_d(DisasContext *ctx, arg_fmul_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2);
>
> -    gen_set_rm(ctx, a->rm);
> -    gen_helper_fmul_d(cpu_fpr[a->rd], cpu_env,
> -                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
>
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fmul_d(dest, cpu_env, src1, src2);
> +    gen_set_fpr_d(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -130,12 +183,16 @@ static bool trans_fmul_d(DisasContext *ctx, arg_fmul_d *a)
>  static bool trans_fdiv_d(DisasContext *ctx, arg_fdiv_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2);
>
> -    gen_set_rm(ctx, a->rm);
> -    gen_helper_fdiv_d(cpu_fpr[a->rd], cpu_env,
> -                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
>
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fdiv_d(dest, cpu_env, src1, src2);
> +    gen_set_fpr_d(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -143,23 +200,34 @@ static bool trans_fdiv_d(DisasContext *ctx, arg_fdiv_d *a)
>  static bool trans_fsqrt_d(DisasContext *ctx, arg_fsqrt_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rd | a->rs1);
>
> -    gen_set_rm(ctx, a->rm);
> -    gen_helper_fsqrt_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
>
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fsqrt_d(dest, cpu_env, src1);
> +    gen_set_fpr_d(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
>
>  static bool trans_fsgnj_d(DisasContext *ctx, arg_fsgnj_d *a)
>  {
> +    REQUIRE_FPU;
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
>      if (a->rs1 == a->rs2) { /* FMOV */
> -        tcg_gen_mov_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
> +        dest = get_fpr_d(ctx, a->rs1);
>      } else {
> -        tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rs2],
> -                            cpu_fpr[a->rs1], 0, 63);
> +        TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +        TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
> +        tcg_gen_deposit_i64(dest, src2, src1, 0, 63);
>      }
> +    gen_set_fpr_d(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -167,15 +235,22 @@ static bool trans_fsgnj_d(DisasContext *ctx, arg_fsgnj_d *a)
>  static bool trans_fsgnjn_d(DisasContext *ctx, arg_fsgnjn_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +
>      if (a->rs1 == a->rs2) { /* FNEG */
> -        tcg_gen_xori_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], INT64_MIN);
> +        tcg_gen_xori_i64(dest, src1, INT64_MIN);
>      } else {
> +        TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
>          TCGv_i64 t0 = tcg_temp_new_i64();
> -        tcg_gen_not_i64(t0, cpu_fpr[a->rs2]);
> -        tcg_gen_deposit_i64(cpu_fpr[a->rd], t0, cpu_fpr[a->rs1], 0, 63);
> +        tcg_gen_not_i64(t0, src2);
> +        tcg_gen_deposit_i64(dest, t0, src1, 0, 63);
>          tcg_temp_free_i64(t0);
>      }
> +    gen_set_fpr_d(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -183,15 +258,22 @@ static bool trans_fsgnjn_d(DisasContext *ctx, arg_fsgnjn_d *a)
>  static bool trans_fsgnjx_d(DisasContext *ctx, arg_fsgnjx_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +
>      if (a->rs1 == a->rs2) { /* FABS */
> -        tcg_gen_andi_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], ~INT64_MIN);
> +        tcg_gen_andi_i64(dest, src1, ~INT64_MIN);
>      } else {
> +        TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
>          TCGv_i64 t0 = tcg_temp_new_i64();
> -        tcg_gen_andi_i64(t0, cpu_fpr[a->rs2], INT64_MIN);
> -        tcg_gen_xor_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], t0);
> +        tcg_gen_andi_i64(t0, src2, INT64_MIN);
> +        tcg_gen_xor_i64(dest, src1, t0);
>          tcg_temp_free_i64(t0);
>      }
> +    gen_set_fpr_d(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -199,11 +281,15 @@ static bool trans_fsgnjx_d(DisasContext *ctx, arg_fsgnjx_d *a)
>  static bool trans_fmin_d(DisasContext *ctx, arg_fmin_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2);
>
> -    gen_helper_fmin_d(cpu_fpr[a->rd], cpu_env,
> -                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
>
> +    gen_helper_fmin_d(dest, cpu_env, src1, src2);
> +    gen_set_fpr_d(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -211,11 +297,15 @@ static bool trans_fmin_d(DisasContext *ctx, arg_fmin_d *a)
>  static bool trans_fmax_d(DisasContext *ctx, arg_fmax_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2);
>
> -    gen_helper_fmax_d(cpu_fpr[a->rd], cpu_env,
> -                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
>
> +    gen_helper_fmax_d(dest, cpu_env, src1, src2);
> +    gen_set_fpr_d(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -223,11 +313,15 @@ static bool trans_fmax_d(DisasContext *ctx, arg_fmax_d *a)
>  static bool trans_fcvt_s_d(DisasContext *ctx, arg_fcvt_s_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rs1);
>
> -    gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_s_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
>
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fcvt_s_d(dest, cpu_env, src1);
> +    gen_set_fpr_hs(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -235,11 +329,15 @@ static bool trans_fcvt_s_d(DisasContext *ctx, arg_fcvt_s_d *a)
>  static bool trans_fcvt_d_s(DisasContext *ctx, arg_fcvt_d_s *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rd);
>
> -    gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_d_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
>
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fcvt_d_s(dest, cpu_env, src1);
> +    gen_set_fpr_d(ctx, a->rd, dest);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -247,11 +345,14 @@ static bool trans_fcvt_d_s(DisasContext *ctx, arg_fcvt_d_s *a)
>  static bool trans_feq_d(DisasContext *ctx, arg_feq_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rs1 | a->rs2);
>
>      TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
>
> -    gen_helper_feq_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    gen_helper_feq_d(dest, cpu_env, src1, src2);
>      gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
> @@ -259,11 +360,14 @@ static bool trans_feq_d(DisasContext *ctx, arg_feq_d *a)
>  static bool trans_flt_d(DisasContext *ctx, arg_flt_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rs1 | a->rs2);
>
>      TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
>
> -    gen_helper_flt_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    gen_helper_flt_d(dest, cpu_env, src1, src2);
>      gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
> @@ -271,11 +375,14 @@ static bool trans_flt_d(DisasContext *ctx, arg_flt_d *a)
>  static bool trans_fle_d(DisasContext *ctx, arg_fle_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rs1 | a->rs2);
>
>      TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
>
> -    gen_helper_fle_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    gen_helper_fle_d(dest, cpu_env, src1, src2);
>      gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
> @@ -283,11 +390,13 @@ static bool trans_fle_d(DisasContext *ctx, arg_fle_d *a)
>  static bool trans_fclass_d(DisasContext *ctx, arg_fclass_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rs1);
>
>      TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
>
> -    gen_helper_fclass_d(dest, cpu_fpr[a->rs1]);
> +    gen_helper_fclass_d(dest, src1);
>      gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
> @@ -295,12 +404,14 @@ static bool trans_fclass_d(DisasContext *ctx, arg_fclass_d *a)
>  static bool trans_fcvt_w_d(DisasContext *ctx, arg_fcvt_w_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rs1);
>
>      TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_w_d(dest, cpu_env, cpu_fpr[a->rs1]);
> +    gen_helper_fcvt_w_d(dest, cpu_env, src1);
>      gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
> @@ -308,12 +419,14 @@ static bool trans_fcvt_w_d(DisasContext *ctx, arg_fcvt_w_d *a)
>  static bool trans_fcvt_wu_d(DisasContext *ctx, arg_fcvt_wu_d *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rs1);
>
>      TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_wu_d(dest, cpu_env, cpu_fpr[a->rs1]);
> +    gen_helper_fcvt_wu_d(dest, cpu_env, src1);
>      gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
> @@ -321,12 +434,15 @@ static bool trans_fcvt_wu_d(DisasContext *ctx, arg_fcvt_wu_d *a)
>  static bool trans_fcvt_d_w(DisasContext *ctx, arg_fcvt_d_w *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rd);
>
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
>      TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, src);
> +    gen_helper_fcvt_d_w(dest, cpu_env, src);
> +    gen_set_fpr_d(ctx, a->rd, dest);
>
>      mark_fs_dirty(ctx);
>      return true;
> @@ -335,12 +451,15 @@ static bool trans_fcvt_d_w(DisasContext *ctx, arg_fcvt_d_w *a)
>  static bool trans_fcvt_d_wu(DisasContext *ctx, arg_fcvt_d_wu *a)
>  {
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rd);
>
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
>      TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, src);
> +    gen_helper_fcvt_d_wu(dest, cpu_env, src);
> +    gen_set_fpr_d(ctx, a->rd, dest);
>
>      mark_fs_dirty(ctx);
>      return true;
> @@ -350,12 +469,14 @@ static bool trans_fcvt_l_d(DisasContext *ctx, arg_fcvt_l_d *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rs1);
>
>      TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_l_d(dest, cpu_env, cpu_fpr[a->rs1]);
> +    gen_helper_fcvt_l_d(dest, cpu_env, src1);
>      gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
> @@ -364,12 +485,14 @@ static bool trans_fcvt_lu_d(DisasContext *ctx, arg_fcvt_lu_d *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rs1);
>
>      TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_lu_d(dest, cpu_env, cpu_fpr[a->rs1]);
> +    gen_helper_fcvt_lu_d(dest, cpu_env, src1);
>      gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
> @@ -392,12 +515,15 @@ static bool trans_fcvt_d_l(DisasContext *ctx, arg_fcvt_d_l *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rd);
>
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
>      TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, src);
> +    gen_helper_fcvt_d_l(dest, cpu_env, src);
> +    gen_set_fpr_d(ctx, a->rd, dest);
>
>      mark_fs_dirty(ctx);
>      return true;
> @@ -407,12 +533,15 @@ static bool trans_fcvt_d_lu(DisasContext *ctx, arg_fcvt_d_lu *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_ZDINX_OR_D(ctx);
> +    REQUIRE_EVEN(ctx, a->rd);
>
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
>      TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, src);
> +    gen_helper_fcvt_d_lu(dest, cpu_env, src);
> +    gen_set_fpr_d(ctx, a->rd, dest);
>
>      mark_fs_dirty(ctx);
>      return true;
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 10cf37be41..fac998a6b5 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -416,6 +416,31 @@ static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
>      }
>  }
>
> +static TCGv_i64 get_fpr_d(DisasContext *ctx, int reg_num)
> +{
> +    if (!ctx->cfg_ptr->ext_zfinx) {
> +        return cpu_fpr[reg_num];
> +    }
> +
> +    if (reg_num == 0) {
> +        return tcg_constant_i64(0);
> +    }
> +    switch (get_xl(ctx)) {
> +    case MXL_RV32:
> +    {
> +        TCGv_i64 t = ftemp_new(ctx);
> +        tcg_gen_concat_tl_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num + 1]);
> +        return t;
> +    }
> +#ifdef TARGET_RISCV64
> +    case MXL_RV64:
> +        return cpu_gpr[reg_num];
> +#endif
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
>  static TCGv_i64 dest_fpr(DisasContext *ctx, int reg_num)
>  {
>      if (!ctx->cfg_ptr->ext_zfinx) {
> @@ -463,6 +488,33 @@ static void gen_set_fpr_hs(DisasContext *ctx, int reg_num, TCGv_i64 t)
>      }
>  }
>
> +static void gen_set_fpr_d(DisasContext *ctx, int reg_num, TCGv_i64 t)
> +{
> +    if (!ctx->cfg_ptr->ext_zfinx) {
> +        tcg_gen_mov_i64(cpu_fpr[reg_num], t);
> +        return;
> +    }
> +
> +    if (reg_num != 0) {
> +        switch (get_xl(ctx)) {
> +        case MXL_RV32:
> +#ifdef TARGET_RISCV32
> +            tcg_gen_extr_i64_i32(cpu_gpr[reg_num], cpu_gpr[reg_num + 1], t);
> +            break;
> +#else
> +            tcg_gen_ext32s_i64(cpu_gpr[reg_num], t);
> +            tcg_gen_sari_i64(cpu_gpr[reg_num + 1], t, 32);
> +            break;
> +        case MXL_RV64:
> +            tcg_gen_mov_i64(cpu_gpr[reg_num], t);
> +            break;
> +#endif
> +        default:
> +            g_assert_not_reached();
> +        }
> +    }
> +}
> +
>  static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>  {
>      target_ulong next_pc;
> --
> 2.17.1
>
>

