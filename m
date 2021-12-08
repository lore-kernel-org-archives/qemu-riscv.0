Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1munsd-0003AQ-H6
	for mharc-qemu-riscv@gnu.org; Tue, 07 Dec 2021 22:44:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1munsb-000399-WC; Tue, 07 Dec 2021 22:44:30 -0500
Received: from [2607:f8b0:4864:20::134] (port=34769
 helo=mail-il1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1munsa-0002nR-DV; Tue, 07 Dec 2021 22:44:29 -0500
Received: by mail-il1-x134.google.com with SMTP id i9so1045250ilu.1;
 Tue, 07 Dec 2021 19:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TiHdPn+t0yc7/sf2dpD6lJzqJb8pHT8YAUgtF1AbsJw=;
 b=nQhWdP5hVNc5Vua/41KCigTruJK59H7PDC4NqE9eqVUjWUZJL1gypNyxZ5vxYbcPKx
 TVhyGXn0gnhlCU6kzmlTl+Y8xMLI1iL8YCO/Amm/cD3Wl69t7DE0SD86Ge/Z0frlihIe
 svqqgh6DKPCNiRvLHN/RPSeFabBloUkTrzQ139NaehXZfwUBKcwGLKbhCMt+MEivxbuL
 tSXvXfkaznVUqJ8mEc+NUuiANCaJkD5Hpu8d/cEQ+S4DT0xbkuYRk1p+hX1HYKFx0knr
 EDI0jvy9mjyX0lArjOQb1yxJoD5UkEwQwqNZRj90Pyu/3GoImYuJGZjs8yPd77SPqZLp
 v7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TiHdPn+t0yc7/sf2dpD6lJzqJb8pHT8YAUgtF1AbsJw=;
 b=5U7VWp+kIAfPOYRnYHkC9S6XyZ4xdQpS33y4jFwNALqJtF1PeEv1ZwCh6nchZdCA0v
 AhRsJWLZEqiapUEO7o0/rpWBqOrtwTbssIDNtYuCXebcSetbg+bWZcRk2uj/K3l1KMGH
 lh/vcUyRrptvVuIrGmy17VZWtD1xVhYu0kvXskSLkkFveIQkBRjX7pmilLl+mIJiUMwT
 +iGKPiblJBsv3ypW1B2u5N5HBjiyf8gg8u10YduBHOQDYP6FoexMxr4cVx55wTkuj78M
 WF+M208qUT1jgemix0cc8fc7TnugCxb6e6dvdBZ/fcYHBlz9ZYcxYnzVmOosvNtx0u44
 fBEw==
X-Gm-Message-State: AOAM530t1c7SDuoe/D95oZGqS4ArBLjdn5e8s7vFwGhjKRzmTrbbxMXC
 +tBR9PiKzWs6ezkmTEg7YTnwO0JP2H7PgaKez9s=
X-Google-Smtp-Source: ABdhPJyavGbMXBMOD+pxIztaLmHbceLTMgGSnrVbdxdmko6CCoPpunKxbdthyrWyyGvx86orjPxceH5BEyecA3btuW0=
X-Received: by 2002:a92:cd12:: with SMTP id z18mr3698705iln.290.1638935066900; 
 Tue, 07 Dec 2021 19:44:26 -0800 (PST)
MIME-Version: 1.0
References: <20211129030340.429689-1-frank.chang@sifive.com>
 <20211129030340.429689-78-frank.chang@sifive.com>
In-Reply-To: <20211129030340.429689-78-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 8 Dec 2021 13:44:00 +1000
Message-ID: <CAKmqyKP8Xw5iqHNcQNuZgojU9pkGD7_y+trLftck0ucSrdAYRA@mail.gmail.com>
Subject: Re: [PATCH v10 77/77] target/riscv: rvv-1.0: Add ELEN checks for
 widening and narrowing instructions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
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
X-List-Received-Date: Wed, 08 Dec 2021 03:44:30 -0000

On Mon, Nov 29, 2021 at 1:54 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> SEW has the limitation which cannot exceed ELEN.
>
> Widening instructions have a destination group with EEW = 2*SEW
> and narrowing instructions have a source operand with EEW = 2*SEW.
> Both of the instructions have the limitation of: 2*SEW <= ELEN.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 17 +++++++++++------
>  target/riscv/translate.c                |  2 ++
>  2 files changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 47eb3119cbe..5e3f7fdb77c 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -386,9 +386,10 @@ static bool vext_check_mss(DisasContext *s, int vd, int vs1, int vs2)
>   *      can not be greater than 8 vector registers (Section 5.2):
>   *      => LMUL < 8.
>   *      => SEW < 64.
> - *   2. Destination vector register number is multiples of 2 * LMUL.
> + *   2. Double-width SEW cannot greater than ELEN.
> + *   3. Destination vector register number is multiples of 2 * LMUL.
>   *      (Section 3.4.2)
> - *   3. Destination vector register group for a masked vector
> + *   4. Destination vector register group for a masked vector
>   *      instruction cannot overlap the source mask register (v0).
>   *      (Section 5.3)
>   */
> @@ -396,6 +397,7 @@ static bool vext_wide_check_common(DisasContext *s, int vd, int vm)
>  {
>      return (s->lmul <= 2) &&
>             (s->sew < MO_64) &&
> +           ((s->sew + 1) <= (s->elen >> 4)) &&
>             require_align(vd, s->lmul + 1) &&
>             require_vm(vm, vd);
>  }
> @@ -409,11 +411,12 @@ static bool vext_wide_check_common(DisasContext *s, int vd, int vm)
>   *      can not be greater than 8 vector registers (Section 5.2):
>   *      => LMUL < 8.
>   *      => SEW < 64.
> - *   2. Source vector register number is multiples of 2 * LMUL.
> + *   2. Double-width SEW cannot greater than ELEN.
> + *   3. Source vector register number is multiples of 2 * LMUL.
>   *      (Section 3.4.2)
> - *   3. Destination vector register number is multiples of LMUL.
> + *   4. Destination vector register number is multiples of LMUL.
>   *      (Section 3.4.2)
> - *   4. Destination vector register group for a masked vector
> + *   5. Destination vector register group for a masked vector
>   *      instruction cannot overlap the source mask register (v0).
>   *      (Section 5.3)
>   */
> @@ -422,6 +425,7 @@ static bool vext_narrow_check_common(DisasContext *s, int vd, int vs2,
>  {
>      return (s->lmul <= 2) &&
>             (s->sew < MO_64) &&
> +           ((s->sew + 1) <= (s->elen >> 4)) &&
>             require_align(vs2, s->lmul + 1) &&
>             require_align(vd, s->lmul) &&
>             require_vm(vm, vd);
> @@ -2806,7 +2810,8 @@ GEN_OPIVV_TRANS(vredxor_vs, reduction_check)
>  /* Vector Widening Integer Reduction Instructions */
>  static bool reduction_widen_check(DisasContext *s, arg_rmrr *a)
>  {
> -    return reduction_check(s, a) && (s->sew < MO_64);
> +    return reduction_check(s, a) && (s->sew < MO_64) &&
> +           ((s->sew + 1) <= (s->elen >> 4));
>  }
>
>  GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_widen_check)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 68edaaf6ac7..5df6c0d800b 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -96,6 +96,7 @@ typedef struct DisasContext {
>      int8_t lmul;
>      uint8_t sew;
>      uint16_t vlen;
> +    uint16_t elen;
>      target_ulong vstart;
>      bool vl_eq_vlmax;
>      uint8_t ntemp;
> @@ -705,6 +706,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->ext_zfh = cpu->cfg.ext_zfh;
>      ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
>      ctx->vlen = cpu->cfg.vlen;
> +    ctx->elen = cpu->cfg.elen;
>      ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
>      ctx->mstatus_hs_vs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_VS);
>      ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
> --
> 2.25.1
>
>

