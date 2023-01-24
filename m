Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK6kg-0001US-Dk
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 19:01:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK6kd-0001Je-Ri; Mon, 23 Jan 2023 19:01:23 -0500
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK6ka-0001zT-S3; Mon, 23 Jan 2023 19:01:23 -0500
Received: by mail-vs1-xe2b.google.com with SMTP id t10so14864071vsr.3;
 Mon, 23 Jan 2023 16:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TB0rFcpVUqF55lX6TOWsh0ljmpLe+RRZeSmlCLBHshc=;
 b=kDkBaDtZ1spYzejh9g2dGJXiu0AwD8KDTcAhILpnCPbHc4aJw4Jf2iFkZvRgg7+ReZ
 TX0wICnvy2OauyHk+f0TlaQg6guqmfQJi2cikZrC+d9qx1Ip6F+uzKEFl1QlXDKld4AZ
 59V+wghuAMTjajxUdQUOogsPBsdjF81hhr+mcuOW+oVc0hoaOEqz1fXioBw7Lj97gppd
 yRxdYmMc6ZPITlG/IP/68tmkAHTn76Ew2BsztnQyRd03dt2sIY+hmZT78OMQsN9pDrqM
 8ePqCjY64q2TtjeBPXS5elSPbKCFyBKYE5NODI2BvfS8ibkTMuWZvkafCcGkgOU68IYq
 0RtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TB0rFcpVUqF55lX6TOWsh0ljmpLe+RRZeSmlCLBHshc=;
 b=QswSaKoo0XA5VQy3FNRbRFoaTPML6RlpA+nEZ/KeWi4OOyd1/gK7SAFpJrlbJ4fQaa
 VSCuuCQSM2UnqO+vXjPF9yMatPZhmQVcppt1ean1Tls6B/8nTe27D4A9mZnCYNEmeHIT
 AI776cW2QYAC0H1m6GT/WeqoD46M/h5MDIOn121U/G/5EZPUrr1dlQTQkJlDEg2+wr22
 8UCTGnxFSzhfBM7P87/02u56zHODVksei6he4D4pJbvrR03XYcUKqGV8vpFy53mO4KYL
 0Yxb99d/sNlvnsG9I6fsBteLSuSG+82NatJI9rErgdqBfhSLX6Vx/MupqFh1FcFjY9WG
 8Kyg==
X-Gm-Message-State: AFqh2kpo66DWgKekOVLUkOv5wXOP/Tz/CPvcG4nXIqqkmTMOI10FqyIL
 fjUdotqAgUSfx7Vn8adihOhKvW7vrpzMeJTaPlA=
X-Google-Smtp-Source: AMrXdXvzUzVExgdyxAPjjxKCJIFb9u+T0Eg0Mr8n67JS9qDmusn3PppDmK0B4HbYy/6MdKEZTarMwX9BadeJmEORmUM=
X-Received: by 2002:a05:6102:cd4:b0:3d0:c2e9:cb77 with SMTP id
 g20-20020a0561020cd400b003d0c2e9cb77mr3386711vst.54.1674518479282; Mon, 23
 Jan 2023 16:01:19 -0800 (PST)
MIME-Version: 1.0
References: <20230120125950.2246378-1-apatel@ventanamicro.com>
 <20230120125950.2246378-5-apatel@ventanamicro.com>
In-Reply-To: <20230120125950.2246378-5-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 10:00:53 +1000
Message-ID: <CAKmqyKO-5SwgVv3rddh6X9KVUg4kFrGJAfnOSaV08fh3VHGd3g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] target/riscv: Ensure opcode is saved for all
 relevant instructions
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2b.google.com
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
X-List-Received-Date: Tue, 24 Jan 2023 00:01:24 -0000

On Fri, Jan 20, 2023 at 11:01 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We should call decode_save_opc() for all relevant instructions which
> can potentially generate a virtual instruction fault or a guest page
> fault because generating transformed instruction upon guest page fault
> expects opcode to be available. Without this, hypervisor will see
> transformed instruction as zero in htinst CSR for guest MMIO emulation
> which makes MMIO emulation in hypervisor slow and also breaks nested
> virtualization.
>
> Fixes: a9814e3e08d2 ("target/riscv: Minimize the calls to decode_save_opc")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rva.c.inc     | 10 +++++++---
>  target/riscv/insn_trans/trans_rvd.c.inc     |  2 ++
>  target/riscv/insn_trans/trans_rvf.c.inc     |  2 ++
>  target/riscv/insn_trans/trans_rvh.c.inc     |  3 +++
>  target/riscv/insn_trans/trans_rvi.c.inc     |  2 ++
>  target/riscv/insn_trans/trans_rvzfh.c.inc   |  2 ++
>  target/riscv/insn_trans/trans_svinval.c.inc |  3 +++
>  7 files changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
> index 45db82c9be..5f194a447b 100644
> --- a/target/riscv/insn_trans/trans_rva.c.inc
> +++ b/target/riscv/insn_trans/trans_rva.c.inc
> @@ -20,8 +20,10 @@
>
>  static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
>  {
> -    TCGv src1 = get_address(ctx, a->rs1, 0);
> +    TCGv src1;
>
> +    decode_save_opc(ctx);
> +    src1 = get_address(ctx, a->rs1, 0);
>      if (a->rl) {
>          tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
>      }
> @@ -43,6 +45,7 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
>      TCGLabel *l1 = gen_new_label();
>      TCGLabel *l2 = gen_new_label();
>
> +    decode_save_opc(ctx);
>      src1 = get_address(ctx, a->rs1, 0);
>      tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
>
> @@ -81,9 +84,10 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
>                      MemOp mop)
>  {
>      TCGv dest = dest_gpr(ctx, a->rd);
> -    TCGv src1 = get_address(ctx, a->rs1, 0);
> -    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
> +    TCGv src1, src2 = get_gpr(ctx, a->rs2, EXT_NONE);
>
> +    decode_save_opc(ctx);
> +    src1 = get_address(ctx, a->rs1, 0);
>      func(dest, src1, src2, ctx->mem_idx, mop);
>
>      gen_set_gpr(ctx, a->rd, dest);
> diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
> index 1397c1ce1c..6e3159b797 100644
> --- a/target/riscv/insn_trans/trans_rvd.c.inc
> +++ b/target/riscv/insn_trans/trans_rvd.c.inc
> @@ -38,6 +38,7 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> +    decode_save_opc(ctx);
>      addr = get_address(ctx, a->rs1, a->imm);
>      tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], addr, ctx->mem_idx, MO_TEUQ);
>
> @@ -52,6 +53,7 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> +    decode_save_opc(ctx);
>      addr = get_address(ctx, a->rs1, a->imm);
>      tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEUQ);
>      return true;
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
> index a1d3eb52ad..965e1f8d11 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -38,6 +38,7 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> +    decode_save_opc(ctx);
>      addr = get_address(ctx, a->rs1, a->imm);
>      dest = cpu_fpr[a->rd];
>      tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_TEUL);
> @@ -54,6 +55,7 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> +    decode_save_opc(ctx);
>      addr = get_address(ctx, a->rs1, a->imm);
>      tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEUL);
>      return true;
> diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
> index 4f8aecddc7..9248b48c36 100644
> --- a/target/riscv/insn_trans/trans_rvh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvh.c.inc
> @@ -36,6 +36,7 @@ static bool do_hlv(DisasContext *ctx, arg_r2 *a, MemOp mop)
>  #ifdef CONFIG_USER_ONLY
>      return false;
>  #else
> +    decode_save_opc(ctx);
>      if (check_access(ctx)) {
>          TCGv dest = dest_gpr(ctx, a->rd);
>          TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
> @@ -82,6 +83,7 @@ static bool do_hsv(DisasContext *ctx, arg_r2_s *a, MemOp mop)
>  #ifdef CONFIG_USER_ONLY
>      return false;
>  #else
> +    decode_save_opc(ctx);
>      if (check_access(ctx)) {
>          TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
>          TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
> @@ -135,6 +137,7 @@ static bool trans_hsv_d(DisasContext *ctx, arg_hsv_d *a)
>  static bool do_hlvx(DisasContext *ctx, arg_r2 *a,
>                      void (*func)(TCGv, TCGv_env, TCGv))
>  {
> +    decode_save_opc(ctx);
>      if (check_access(ctx)) {
>          TCGv dest = dest_gpr(ctx, a->rd);
>          TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index 5c69b88d1e..4496f21266 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -261,6 +261,7 @@ static bool gen_load_i128(DisasContext *ctx, arg_lb *a, MemOp memop)
>
>  static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
>  {
> +    decode_save_opc(ctx);
>      if (get_xl(ctx) == MXL_RV128) {
>          return gen_load_i128(ctx, a, memop);
>      } else {
> @@ -350,6 +351,7 @@ static bool gen_store_i128(DisasContext *ctx, arg_sb *a, MemOp memop)
>
>  static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
>  {
> +    decode_save_opc(ctx);
>      if (get_xl(ctx) == MXL_RV128) {
>          return gen_store_i128(ctx, a, memop);
>      } else {
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
> index 5d07150cd0..2ad5716312 100644
> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -49,6 +49,7 @@ static bool trans_flh(DisasContext *ctx, arg_flh *a)
>      REQUIRE_FPU;
>      REQUIRE_ZFH_OR_ZFHMIN(ctx);
>
> +    decode_save_opc(ctx);
>      t0 = get_gpr(ctx, a->rs1, EXT_NONE);
>      if (a->imm) {
>          TCGv temp = temp_new(ctx);
> @@ -71,6 +72,7 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
>      REQUIRE_FPU;
>      REQUIRE_ZFH_OR_ZFHMIN(ctx);
>
> +    decode_save_opc(ctx);
>      t0 = get_gpr(ctx, a->rs1, EXT_NONE);
>      if (a->imm) {
>          TCGv temp = tcg_temp_new();
> diff --git a/target/riscv/insn_trans/trans_svinval.c.inc b/target/riscv/insn_trans/trans_svinval.c.inc
> index 2682bd969f..f3cd7d5c0b 100644
> --- a/target/riscv/insn_trans/trans_svinval.c.inc
> +++ b/target/riscv/insn_trans/trans_svinval.c.inc
> @@ -28,6 +28,7 @@ static bool trans_sinval_vma(DisasContext *ctx, arg_sinval_vma *a)
>      /* Do the same as sfence.vma currently */
>      REQUIRE_EXT(ctx, RVS);
>  #ifndef CONFIG_USER_ONLY
> +    decode_save_opc(ctx);
>      gen_helper_tlb_flush(cpu_env);
>      return true;
>  #endif
> @@ -56,6 +57,7 @@ static bool trans_hinval_vvma(DisasContext *ctx, arg_hinval_vvma *a)
>      /* Do the same as hfence.vvma currently */
>      REQUIRE_EXT(ctx, RVH);
>  #ifndef CONFIG_USER_ONLY
> +    decode_save_opc(ctx);
>      gen_helper_hyp_tlb_flush(cpu_env);
>      return true;
>  #endif
> @@ -68,6 +70,7 @@ static bool trans_hinval_gvma(DisasContext *ctx, arg_hinval_gvma *a)
>      /* Do the same as hfence.gvma currently */
>      REQUIRE_EXT(ctx, RVH);
>  #ifndef CONFIG_USER_ONLY
> +    decode_save_opc(ctx);
>      gen_helper_hyp_gvma_tlb_flush(cpu_env);
>      return true;
>  #endif
> --
> 2.34.1
>
>

