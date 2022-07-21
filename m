Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEJn3-0006ke-NY
	for mharc-qemu-riscv@gnu.org; Wed, 20 Jul 2022 20:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEJn1-0006i5-J2; Wed, 20 Jul 2022 20:11:39 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEJmz-0000CP-OF; Wed, 20 Jul 2022 20:11:39 -0400
Received: by mail-pg1-x536.google.com with SMTP id f65so108767pgc.12;
 Wed, 20 Jul 2022 17:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n+qkLWUQHXIAddHuSQDjYvVd24HFUXkzy6VK1qwSBcA=;
 b=ND/OboeuWnYkYLGr19yAF/x80ZGcEVOCM6jKfvmoBW91K8GauHZ59phWjHq7TNWp4y
 x2KGf5VtmedS5rZnnxbPSDbovMmIkk0dx+JEFKOkAfJRg+W751rI97WD/NMfRsvYmqN2
 A7jRxxIdG+aYkh98KldWi3nQi0OJ6IrLadMf7UPnl4EB+kd5y10Qh2MByUu1ZqaY6zS+
 Yrx0duLdB7hcmpVV1+m5bsDyHDhyxbymNJfQRP7Ud4poXAawqMfmMHSfzlKg9eYjQlEV
 Kk63fXVfjMLLs3RjJeY0WYTWU51pVh4+3GlN1wxnzG+1VKvOWkAGH2zW1khSv0kRfPXj
 eV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n+qkLWUQHXIAddHuSQDjYvVd24HFUXkzy6VK1qwSBcA=;
 b=L93sGBXbrJW3VfKcO++PytgoEyDwA6soEdoVfuCdZPLiBM+1gR6qhGTWVRqANDwTHw
 qEWdcSU9Ri9Q6E8exK1tynvqvLNgYq70rqXvRjte2Moj+WnSJptXAiSfRIuf9ooxslGu
 BCStPdUckIPdcMry2lCBc85O8gZ+ghO3zkdrQ1QqzHXyUIny43W5eWWyfX/lsQf6tSYu
 FJeyM5XjYYtaZd19SmJEPmyNXXBmbbVsDNwP08yLfQvMQCeW8sAQh4HGF5b4kOp3b3eK
 nyR2G/MRalM3hZ2/u3IbuS8awD/vrkcmc09ArGqL2gvXIhDa6EaYAqtLJZGwoQH8usJM
 TmNw==
X-Gm-Message-State: AJIora+lZUO5PJwAIVZyMipFt4zmyqUeGcBUmQmnNYjae6sqZHQQ8E39
 J1iq60vBlCObvdzPEOiUVLYPku5F7INkCfy7LBM=
X-Google-Smtp-Source: AGRyM1u8a8MsvqdSHI3FAADGBNsTC2KeYU/njsR5GB8qYOyUaGEl4tdQDP7zQWJufUTBPUYelNda2nzuovzM19cVURY=
X-Received: by 2002:a63:1c4c:0:b0:412:6eef:f91a with SMTP id
 c12-20020a631c4c000000b004126eeff91amr35165743pgm.361.1658362295697; Wed, 20
 Jul 2022 17:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <165570784143.17634.35095816584573691-0@git.sr.ht>
 <165570784143.17634.35095816584573691-2@git.sr.ht>
In-Reply-To: <165570784143.17634.35095816584573691-2@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Jul 2022 10:11:09 +1000
Message-ID: <CAKmqyKObyZ+ZTXA56oozoqL3ZVYQUyAbavt2GQfcdRrFHBb9kg@mail.gmail.com>
Subject: Re: [PATCH qemu v6 02/10] target/riscv: rvv: Add mask agnostic for
 vector load / store instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 21 Jul 2022 00:11:40 -0000

On Mon, Jun 20, 2022 at 4:51 PM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc |  5 ++++
>  target/riscv/vector_helper.c            | 35 +++++++++++++++++--------
>  2 files changed, 29 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 5ec113f6fd..0627eda0c0 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -712,6 +712,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>      data = FIELD_DP32(data, VDATA, LMUL, emul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
>      data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>      return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
>  }
>
> @@ -777,6 +778,7 @@ static bool ld_us_mask_op(DisasContext *s, arg_vlm_v *a, uint8_t eew)
>      data = FIELD_DP32(data, VDATA, NF, 1);
>      /* Mask destination register are always tail-agnostic */
>      data = FIELD_DP32(data, VDATA, VTA, s->cfg_vta_all_1s);
> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>      return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
>  }
>
> @@ -866,6 +868,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>      data = FIELD_DP32(data, VDATA, LMUL, emul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
>      data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>      return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
>  }
>
> @@ -996,6 +999,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>      data = FIELD_DP32(data, VDATA, LMUL, emul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
>      data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>      return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
>  }
>
> @@ -1114,6 +1118,7 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>      data = FIELD_DP32(data, VDATA, LMUL, emul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
>      data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>      return ldff_trans(a->rd, a->rs1, data, fn, s);
>  }
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index de895050e0..e3810d2bc3 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -283,14 +283,18 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>      uint32_t esz = 1 << log2_esz;
>      uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>      uint32_t vta = vext_vta(desc);
> +    uint32_t vma = vext_vma(desc);
>
>      for (i = env->vstart; i < env->vl; i++, env->vstart++) {
> -        if (!vm && !vext_elem_mask(v0, i)) {
> -            continue;
> -        }
> -
>          k = 0;
>          while (k < nf) {
> +            if (!vm && !vext_elem_mask(v0, i)) {
> +                /* set masked-off elements to 1s */
> +                vext_set_elems_1s(vd, vma, (i + k * max_elems) * esz,
> +                                  (i + k * max_elems + 1) * esz);
> +                k++;
> +                continue;
> +            }
>              target_ulong addr = base + stride * i + (k << log2_esz);
>              ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
>              k++;
> @@ -482,15 +486,19 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>      uint32_t esz = 1 << log2_esz;
>      uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>      uint32_t vta = vext_vta(desc);
> +    uint32_t vma = vext_vma(desc);
>
>      /* load bytes from guest memory */
>      for (i = env->vstart; i < env->vl; i++, env->vstart++) {
> -        if (!vm && !vext_elem_mask(v0, i)) {
> -            continue;
> -        }
> -
>          k = 0;
>          while (k < nf) {
> +            if (!vm && !vext_elem_mask(v0, i)) {
> +                /* set masked-off elements to 1s */
> +                vext_set_elems_1s(vd, vma, (i + k * max_elems) * esz,
> +                                  (i + k * max_elems + 1) * esz);
> +                k++;
> +                continue;
> +            }
>              abi_ptr addr = get_index_addr(base, i, vs2) + (k << log2_esz);
>              ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
>              k++;
> @@ -579,6 +587,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>      uint32_t esz = 1 << log2_esz;
>      uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>      uint32_t vta = vext_vta(desc);
> +    uint32_t vma = vext_vma(desc);
>      target_ulong addr, offset, remain;
>
>      /* probe every access*/
> @@ -624,10 +633,14 @@ ProbeSuccess:
>      }
>      for (i = env->vstart; i < env->vl; i++) {
>          k = 0;
> -        if (!vm && !vext_elem_mask(v0, i)) {
> -            continue;
> -        }
>          while (k < nf) {
> +            if (!vm && !vext_elem_mask(v0, i)) {
> +                /* set masked-off elements to 1s */
> +                vext_set_elems_1s(vd, vma, (i + k * max_elems) * esz,
> +                                  (i + k * max_elems + 1) * esz);
> +                k++;
> +                continue;
> +            }
>              target_ulong addr = base + ((i * nf + k) << log2_esz);
>              ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
>              k++;
> --
> 2.34.2
>
>

