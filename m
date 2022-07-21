Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEJzL-0001ep-7l
	for mharc-qemu-riscv@gnu.org; Wed, 20 Jul 2022 20:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEJzJ-0001ck-1a; Wed, 20 Jul 2022 20:24:21 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:44959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEJzG-0002FT-TC; Wed, 20 Jul 2022 20:24:20 -0400
Received: by mail-pl1-x629.google.com with SMTP id q5so292006plr.11;
 Wed, 20 Jul 2022 17:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uxZwFadWBrnxxzHMSXdCSvgx4vOgucrRFW9FfUU8eM8=;
 b=fF3nxT3XThAbuU3g8CQ2+PE9EiBkTX/YA6OOueJ3aRO2/HGZY5vvXtMK/3KiHVAXD9
 PE0vWnJ4f0mHgDTjQL3dZW/lvvfpOiWYjw5u+GOzvkss1CjpGE8fSccYTaH+WDHXSTkS
 Ux4aL/nrkIvyChtHJncvUhH/DGnJHpqMopzf5Uqz3kdfVyAQrvxyw+ALo/CfBvR+l95Z
 ao1MqIetJ96YC0NqlyXuVR4WJmf0zQPzJRpNNzeTdfyZgBygGDMQVBo+IqeZ0QFZ4epP
 STlc71482Y9F/McgwSBZY4OGUZGWHhtWvDXFAQm1ed6RbpWhVuu1mW9AlVHE4+llDIW9
 9rpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uxZwFadWBrnxxzHMSXdCSvgx4vOgucrRFW9FfUU8eM8=;
 b=Q/x0fDWcqPulLUfV39loorUZmkBt+7BRTcb8Qllw0a2WuzNIdRmJtyRzSyXDrkT/4/
 6Lni4fQnT7EnRuP67mfgwA4LUkDq6pHfYxaovarhEeCMfOUTt5Frf7E9G+WDLz4pA1KP
 CscEieZGXFNXSDBNA2US4knYNlATygRDii1t8bfjtbj1LRWV4a7z1NXdx1EtRpUNZ1p4
 xA+Idtb+0buJEtwYmQhQ5UhIFxsPiN33YxYYRjqgkUT0HpnlPU71zGI+KdllpCqa0Y/K
 maPSXb4etKjxT3jsKmuVC0RwEtNVVM/NcXsQoBwY7yqRIz9x9suOlEzzzfb8Ncz2K3vo
 Y7og==
X-Gm-Message-State: AJIora/+uaIpxP+GbXR85uawkJqKjqtk7kZsCjPrhYVW4+7lWO6umSH0
 uEIqnL8lILd4zbkWUpckrYGwrp0I3N/i/vZCArc=
X-Google-Smtp-Source: AGRyM1sMY7rhBad8eFSbjydds02WJ1vKiy/ava9R6CEhFebjG5PXV52LDLkImqi99zzUwjuXFTtaAkaaBgkEz28Sp+g=
X-Received: by 2002:a17:90b:3b4d:b0:1f0:4547:8a31 with SMTP id
 ot13-20020a17090b3b4d00b001f045478a31mr8426071pjb.129.1658363057111; Wed, 20
 Jul 2022 17:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <165570784143.17634.35095816584573691-0@git.sr.ht>
 <165570784143.17634.35095816584573691-9@git.sr.ht>
In-Reply-To: <165570784143.17634.35095816584573691-9@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Jul 2022 10:23:50 +1000
Message-ID: <CAKmqyKNoQf1fe_aMRHX67Sg=Me_cBOFVJothTSEuyufvLgxkew@mail.gmail.com>
Subject: Re: [PATCH qemu v6 09/10] target/riscv: rvv: Add mask agnostic for
 vector permutation instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Thu, 21 Jul 2022 00:24:22 -0000

On Mon, Jun 20, 2022 at 4:59 PM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc |  1 +
>  target/riscv/vector_helper.c            | 26 +++++++++++++++++++++++--
>  2 files changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index c1bd29329e..e58208f363 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3891,6 +3891,7 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a, uint8_t seq)
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>      data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>
>      tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                         vreg_ofs(s, a->rs2), cpu_env,
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 52518648bb..d224861c2c 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -5018,11 +5018,14 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>      uint32_t esz = sizeof(ETYPE);                                         \
>      uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
>      uint32_t vta = vext_vta(desc);                                        \
> +    uint32_t vma = vext_vma(desc);                                        \
>      target_ulong offset = s1, i_min, i;                                   \
>                                                                            \
>      i_min = MAX(env->vstart, offset);                                     \
>      for (i = i_min; i < vl; i++) {                                        \
>          if (!vm && !vext_elem_mask(v0, i)) {                              \
> +            /* set masked-off elements to 1s */                           \
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
>              continue;                                                     \
>          }                                                                 \
>          *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - offset));          \
> @@ -5047,13 +5050,17 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>      uint32_t esz = sizeof(ETYPE);                                         \
>      uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
>      uint32_t vta = vext_vta(desc);                                        \
> +    uint32_t vma = vext_vma(desc);                                        \
>      target_ulong i_max, i;                                                \
>                                                                            \
>      i_max = MAX(MIN(s1 < vlmax ? vlmax - s1 : 0, vl), env->vstart);       \
>      for (i = env->vstart; i < i_max; ++i) {                               \
> -        if (vm || vext_elem_mask(v0, i)) {                                \
> -            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + s1));          \
> +        if (!vm && !vext_elem_mask(v0, i)) {                              \
> +            /* set masked-off elements to 1s */                           \
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
> +            continue;                                                     \
>          }                                                                 \
> +        *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + s1));              \
>      }                                                                     \
>                                                                            \
>      for (i = i_max; i < vl; ++i) {                                        \
> @@ -5083,10 +5090,13 @@ static void vslide1up_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
>      uint32_t esz = sizeof(ETYPE);                                           \
>      uint32_t total_elems = vext_get_total_elems(env, desc, esz);            \
>      uint32_t vta = vext_vta(desc);                                          \
> +    uint32_t vma = vext_vma(desc);                                          \
>      uint32_t i;                                                             \
>                                                                              \
>      for (i = env->vstart; i < vl; i++) {                                    \
>          if (!vm && !vext_elem_mask(v0, i)) {                                \
> +            /* set masked-off elements to 1s */                             \
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);             \
>              continue;                                                       \
>          }                                                                   \
>          if (i == 0) {                                                       \
> @@ -5128,10 +5138,13 @@ static void vslide1down_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
>      uint32_t esz = sizeof(ETYPE);                                             \
>      uint32_t total_elems = vext_get_total_elems(env, desc, esz);              \
>      uint32_t vta = vext_vta(desc);                                            \
> +    uint32_t vma = vext_vma(desc);                                            \
>      uint32_t i;                                                               \
>                                                                                \
>      for (i = env->vstart; i < vl; i++) {                                      \
>          if (!vm && !vext_elem_mask(v0, i)) {                                  \
> +            /* set masked-off elements to 1s */                               \
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);               \
>              continue;                                                         \
>          }                                                                     \
>          if (i == vl - 1) {                                                    \
> @@ -5199,11 +5212,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
>      uint32_t esz = sizeof(TS2);                                           \
>      uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
>      uint32_t vta = vext_vta(desc);                                        \
> +    uint32_t vma = vext_vma(desc);                                        \
>      uint64_t index;                                                       \
>      uint32_t i;                                                           \
>                                                                            \
>      for (i = env->vstart; i < vl; i++) {                                  \
>          if (!vm && !vext_elem_mask(v0, i)) {                              \
> +            /* set masked-off elements to 1s */                           \
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
>              continue;                                                     \
>          }                                                                 \
>          index = *((TS1 *)vs1 + HS1(i));                                   \
> @@ -5239,11 +5255,14 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>      uint32_t esz = sizeof(ETYPE);                                         \
>      uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
>      uint32_t vta = vext_vta(desc);                                        \
> +    uint32_t vma = vext_vma(desc);                                        \
>      uint64_t index = s1;                                                  \
>      uint32_t i;                                                           \
>                                                                            \
>      for (i = env->vstart; i < vl; i++) {                                  \
>          if (!vm && !vext_elem_mask(v0, i)) {                              \
> +            /* set masked-off elements to 1s */                           \
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
>              continue;                                                     \
>          }                                                                 \
>          if (index >= vlmax) {                                             \
> @@ -5318,10 +5337,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,                 \
>      uint32_t esz = sizeof(ETYPE);                                \
>      uint32_t total_elems = vext_get_total_elems(env, desc, esz); \
>      uint32_t vta = vext_vta(desc);                               \
> +    uint32_t vma = vext_vma(desc);                               \
>      uint32_t i;                                                  \
>                                                                   \
>      for (i = env->vstart; i < vl; i++) {                         \
>          if (!vm && !vext_elem_mask(v0, i)) {                     \
> +            /* set masked-off elements to 1s */                  \
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);  \
>              continue;                                            \
>          }                                                        \
>          *((ETYPE *)vd + HD(i)) = *((DTYPE *)vs2 + HS1(i));       \
> --
> 2.34.2
>
>

