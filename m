Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEJpS-000138-J6
	for mharc-qemu-riscv@gnu.org; Wed, 20 Jul 2022 20:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEJpQ-0000xk-5I; Wed, 20 Jul 2022 20:14:08 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEJpO-0000Qj-Ku; Wed, 20 Jul 2022 20:14:07 -0400
Received: by mail-pf1-x429.google.com with SMTP id 17so294565pfy.0;
 Wed, 20 Jul 2022 17:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UY/RxHG0zSgk5+pGO6CDPeK8/nYYGUTIsL3IVYCsJDs=;
 b=UnWEaKV3DEZ+gI3Bq4Ewr7d3uqf//uIqT5gCfmUyRTWqYoFDQ68lvXitrk8y6GRGzy
 OTWXnzLj60qlEsd2YLMqDxNwMDgteZMVjnAT8uqi4O6BeW/Wy7VAMyzflj0zGSWAQcKp
 nNLUowq7KM44nxLFDTc2iYbeW4cipYdWpq3ZvFSGcdtAwniRgY1zMTpezRcwdvWSYIRc
 aLjtnXj/+o116zck7DB4SlX8YrPOS6UoSdYYgBz8qjI8S3yxTSnQmQEmCegenCpYa9x8
 SaYYf8mCAOwlJrB04CzWNrYi8aJ8Y6m0APQ1mgxLTeruvBzyux8BdIM4+lEZArcxeBTj
 8oMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UY/RxHG0zSgk5+pGO6CDPeK8/nYYGUTIsL3IVYCsJDs=;
 b=iQhnKr7Z2q86kM2prfhHan0mFw8AwaGYrGtRvC4Da2E88IkZnZghUT87H7Y9EQlzdn
 FI6tpMuNRPcNEe6TJQTmb6kHQEH7bSOByI238xaeFgjK5zvuIEKNx+de+HRhgtIBycP2
 K3n3kYetw7g8Bw9QyoI4QYaoq3KbJBkhaLsg89MlXaXa436mN7vOzvDKlhIvFIt6aTKq
 8D4zsUezkyJb+Yz+2oWr6lrWoMj9hCHpSyl6qXHcqx/9yYFOh80zpHYs3jJZcn765qtO
 HLezvCU4P512N5bipIaHwiPmkL2aON3gTtuiI+cKbdgNiBmPtcoRzKZ+nRtUbrvgvast
 o//g==
X-Gm-Message-State: AJIora+dfsFCCLtrxT3we08X1KL4Dl7tQejrs5T5o4ubm7aXm/+Acr5n
 t6+jvyw2q0NHe9FNkVBnh9e6qTDJl1HfLm+WPDQ=
X-Google-Smtp-Source: AGRyM1twdbsVjl4wn1vzOKd8hUzI78CGRCrjYr8d05m008a5ZloBDBsOK/k2t76HbVnPQYXDsAbiTwaIJORD0NHz5J0=
X-Received: by 2002:a05:6a00:1309:b0:52b:323a:2c78 with SMTP id
 j9-20020a056a00130900b0052b323a2c78mr32723146pfu.4.1658362444947; Wed, 20 Jul
 2022 17:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <165570784143.17634.35095816584573691-0@git.sr.ht>
 <165570784143.17634.35095816584573691-4@git.sr.ht>
In-Reply-To: <165570784143.17634.35095816584573691-4@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Jul 2022 10:13:38 +1000
Message-ID: <CAKmqyKMCmRyQtqvbyLOxOYNhAh-6uWeSD4kRgccM_MJ7zy8a=g@mail.gmail.com>
Subject: Re: [PATCH qemu v6 04/10] target/riscv: rvv: Add mask agnostic for
 vector integer shift instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x429.google.com
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
X-List-Received-Date: Thu, 21 Jul 2022 00:14:08 -0000

On Mon, Jun 20, 2022 at 4:52 PM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 1 +
>  target/riscv/vector_helper.c            | 7 +++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 07d86551a9..83b85bb851 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1901,6 +1901,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>          data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 6be3c4e739..d1daa764b7 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -1298,10 +1298,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,                          \
>      uint32_t esz = sizeof(TS1);                                           \
>      uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
>      uint32_t vta = vext_vta(desc);                                        \
> +    uint32_t vma = vext_vma(desc);                                        \
>      uint32_t i;                                                           \
>                                                                            \
>      for (i = env->vstart; i < vl; i++) {                                  \
>          if (!vm && !vext_elem_mask(v0, i)) {                              \
> +            /* set masked-off elements to 1s */                           \
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
>              continue;                                                     \
>          }                                                                 \
>          TS1 s1 = *((TS1 *)vs1 + HS1(i));                                  \
> @@ -1339,10 +1342,14 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,      \
>      uint32_t total_elems =                                  \
>          vext_get_total_elems(env, desc, esz);               \
>      uint32_t vta = vext_vta(desc);                          \
> +    uint32_t vma = vext_vma(desc);                          \
>      uint32_t i;                                             \
>                                                              \
>      for (i = env->vstart; i < vl; i++) {                    \
>          if (!vm && !vext_elem_mask(v0, i)) {                \
> +            /* set masked-off elements to 1s */             \
> +            vext_set_elems_1s(vd, vma, i * esz,             \
> +                              (i + 1) * esz);               \
>              continue;                                       \
>          }                                                   \
>          TS2 s2 = *((TS2 *)vs2 + HS2(i));                    \
> --
> 2.34.2
>
>

