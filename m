Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEJyE-0008C9-2X
	for mharc-qemu-riscv@gnu.org; Wed, 20 Jul 2022 20:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEJyB-00088X-Lu; Wed, 20 Jul 2022 20:23:11 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEJy9-0002B3-Uw; Wed, 20 Jul 2022 20:23:11 -0400
Received: by mail-pf1-x431.google.com with SMTP id y9so242209pff.12;
 Wed, 20 Jul 2022 17:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yF8dtNR3q6Hen64KKHm7E3lMKoK/W8yuiFMlsHybJhI=;
 b=KbrbSl7fvhcxVINsWcc90SzB0Nwk3Od1HPfQxncOFtYgGqo2cuOpG9WK0h32Cp3kS3
 CVjmAS1I5ZrGxY0h97dTWBhTr383Lao5S2S+Sv1BSDHErCn+544oKtbLMj9oFkM7UEWf
 3kQKhhpRGwXza14N0qhr/6ogoE+YitWSjzvQMZmgD6WD0A4Nn55uev+UunrDpQVV+s6u
 KrmdwKhDsZh+aCF+BeZOk1JDSR0eYZsMXBcHKvgw2hHynbgk2tvGbzstlQ0oiQwMdvTf
 oNB/QRSsIj19n0QvNY5Q93lFg0AsNRhNHcCGzl3crFmYQE9LrwouCMq4Hv83RT43YQci
 T4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yF8dtNR3q6Hen64KKHm7E3lMKoK/W8yuiFMlsHybJhI=;
 b=YvYZX+VGC4PgwXQRTnVhvsudrWrlhAOyyp/n19U5zr5qcQZaIn87F3fX5KwMWhnLuJ
 SGgHJHwtxSkf9T+dN0JliZ1B0rGIe6iY7WrceYB+BGpLBjVjRgJiXoSqPT6TRMalw/ub
 +21bT4ZQQnMDh12GSXgNeFBcOzd44TpUXNkjFQ/g4OThe/6k4iRbv6mLYNz0Y6Arcdtm
 WwgXvgkPG1bAt0QeEDGmbBBaF35GM7al9qNF53OHnX0JrNg9AoN/fv1hxJt50isbkZdX
 R7ebJgP95zR0XoevYtvD9UgyiXd3FyjR8oavPCpnUi9wfCclVWCNT0dt0XFChu1jHrOG
 xo9g==
X-Gm-Message-State: AJIora/bSaGNgxW4+FDImHezaiEBlZAlyu9iFFlJOmwwrLZqSPf09syC
 A4brKfrS7FMAqNQcEtjOqr5tcZvM03mrC4Aq7co=
X-Google-Smtp-Source: AGRyM1tKH/j/tn0XsdXTMRW7Ce1FCulcrsMknchjuqSqub8bTLh55ak6jQkZ4i4JjpCZJluN5Id/LBmI8QCp7i01SmE=
X-Received: by 2002:a05:6a02:313:b0:416:73c:507c with SMTP id
 bn19-20020a056a02031300b00416073c507cmr35545948pgb.366.1658362988144; Wed, 20
 Jul 2022 17:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <165570784143.17634.35095816584573691-0@git.sr.ht>
 <165570784143.17634.35095816584573691-8@git.sr.ht>
In-Reply-To: <165570784143.17634.35095816584573691-8@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Jul 2022 10:22:41 +1000
Message-ID: <CAKmqyKPqS57rEwL3suix-SRpzJrLvfYHc=FZodtzrPC6T29jqA@mail.gmail.com>
Subject: Re: [PATCH qemu v6 08/10] target/riscv: rvv: Add mask agnostic for
 vector mask instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x431.google.com
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
X-List-Received-Date: Thu, 21 Jul 2022 00:23:12 -0000

On Mon, Jun 20, 2022 at 5:05 PM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc |  3 +++
>  target/riscv/vector_helper.c            | 11 +++++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 8ce3d28603..c1bd29329e 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3275,6 +3275,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          data =                                                     \
>              FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
>                             vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
>                             cpu_env, s->cfg_ptr->vlen / 8,          \
> @@ -3313,6 +3314,7 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
>          data = FIELD_DP32(data, VDATA, VM, a->vm);
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>          data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);
>          static gen_helper_gvec_3_ptr * const fns[4] = {
>              gen_helper_viota_m_b, gen_helper_viota_m_h,
>              gen_helper_viota_m_w, gen_helper_viota_m_d,
> @@ -3343,6 +3345,7 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
>          data = FIELD_DP32(data, VDATA, VM, a->vm);
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>          data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);
>          static gen_helper_gvec_2_ptr * const fns[4] = {
>              gen_helper_vid_v_b, gen_helper_vid_v_h,
>              gen_helper_vid_v_w, gen_helper_vid_v_d,
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 315742c6b8..52518648bb 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4879,11 +4879,16 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
>      uint32_t vl = env->vl;
>      uint32_t total_elems = env_archcpu(env)->cfg.vlen;
>      uint32_t vta_all_1s = vext_vta_all_1s(desc);
> +    uint32_t vma = vext_vma(desc);
>      int i;
>      bool first_mask_bit = false;
>
>      for (i = env->vstart; i < vl; i++) {
>          if (!vm && !vext_elem_mask(v0, i)) {
> +            /* set masked-off elements to 1s */
> +            if (vma) {
> +                vext_set_elem_mask(vd, i, 1);
> +            }
>              continue;
>          }
>          /* write a zero to all following active elements */
> @@ -4944,11 +4949,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CPURISCVState *env,      \
>      uint32_t esz = sizeof(ETYPE);                                         \
>      uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
>      uint32_t vta = vext_vta(desc);                                        \
> +    uint32_t vma = vext_vma(desc);                                        \
>      uint32_t sum = 0;                                                     \
>      int i;                                                                \
>                                                                            \
>      for (i = env->vstart; i < vl; i++) {                                  \
>          if (!vm && !vext_elem_mask(v0, i)) {                              \
> +            /* set masked-off elements to 1s */                           \
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
>              continue;                                                     \
>          }                                                                 \
>          *((ETYPE *)vd + H(i)) = sum;                                      \
> @@ -4975,10 +4983,13 @@ void HELPER(NAME)(void *vd, void *v0, CPURISCVState *env, uint32_t desc)  \
>      uint32_t esz = sizeof(ETYPE);                                         \
>      uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
>      uint32_t vta = vext_vta(desc);                                        \
> +    uint32_t vma = vext_vma(desc);                                        \
>      int i;                                                                \
>                                                                            \
>      for (i = env->vstart; i < vl; i++) {                                  \
>          if (!vm && !vext_elem_mask(v0, i)) {                              \
> +            /* set masked-off elements to 1s */                           \
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
>              continue;                                                     \
>          }                                                                 \
>          *((ETYPE *)vd + H(i)) = i;                                        \
> --
> 2.34.2
>
>

