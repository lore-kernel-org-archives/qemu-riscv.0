Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEJsE-0003Yw-Om
	for mharc-qemu-riscv@gnu.org; Wed, 20 Jul 2022 20:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEJsC-0003Xu-Us; Wed, 20 Jul 2022 20:17:00 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:43592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEJsB-00015K-9A; Wed, 20 Jul 2022 20:17:00 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so3778748pjf.2; 
 Wed, 20 Jul 2022 17:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1K6+ttFpGGG7RPEnh7CQy9IG1o+sBsWXznemD4+17H4=;
 b=CaZmAxzrJknogWSEyjJ9IjKnC0dGNVNdAHFcDoa7BZk3TPGfwADVX4fIsrD6/T+4FW
 0P90WPlH+8OHHhRmuYVSq5Zw9TTiMh5Jf+euQKm6HnOcQbBlbnx3E9KivUnuyeBp60YQ
 ZDd2Bx3z2RSFdp9nzhLckr0wo6HSQId91gbPyEjMIUsYBFZB80hRoBl/qvcdrRIqiG1X
 0j/xwJTK+uDaaqPyWMKbEtgCD+/tJYqtB+i5eMPYG+bWsVt/U58oEuBiDPCAe6GRbnKc
 DEo3o5CW2ej+GsjRmLJxpyY0oBAvTl6irTwep1N4YES7JgsTZrCH6tyN8kyCGzg3oNNf
 Rgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1K6+ttFpGGG7RPEnh7CQy9IG1o+sBsWXznemD4+17H4=;
 b=Xv+hEHP5/k4jcSYqxfxz07ctKdPhxL6zEMV4/q89r+s9OUjbZvBvnejQ3YqqR4/+Bp
 4THpAebhLxJAUXi48AnIMUdrszepLK9HOIjuwNzg+RFodIMUxGOJ0IIyl2EX5AryTWaL
 RRhcYk/tcsEBQWhsYQpFtp+yNGEy6xQg9vJu1lEtPR39yRNO5rS3YgVCGaku790DFRjr
 2LeiOzOBwEvr4hB1VsAFBnNTtpbnwq9ijemtFE8nEHaoXYeyXGnNcUbg/epUnzkVMQWm
 A8diNb2X8FLWYVdRH5edicu2bKEkUQBxGokTkcdTTvElg2NGMbhNJHoziVpwVe670wvk
 zH4A==
X-Gm-Message-State: AJIora+P0Xk7We0XTF/DNL/YTwQfaHQLwesmJwA1PxJDLN6eRG+BI/x2
 Lk28uZq2tM2kkqc/7rXDW1rEbbcFCNfEKh4lzco=
X-Google-Smtp-Source: AGRyM1svwXLlKCpdh4LVKymFMmK19qGI7FprPcXrgLF43QXFsmJhbOSJ1q6cL35OKRh1yxKG9vYicsjwHj1XDStFo20=
X-Received: by 2002:a17:903:2290:b0:16c:33f5:a978 with SMTP id
 b16-20020a170903229000b0016c33f5a978mr41672463plh.121.1658362617510; Wed, 20
 Jul 2022 17:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <165570784143.17634.35095816584573691-0@git.sr.ht>
 <165570784143.17634.35095816584573691-5@git.sr.ht>
In-Reply-To: <165570784143.17634.35095816584573691-5@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Jul 2022 10:16:31 +1000
Message-ID: <CAKmqyKPWpG481OvHeL1vUp4m007=reGit5UuJbqV3OfjiySDOA@mail.gmail.com>
Subject: Re: [PATCH qemu v6 05/10] target/riscv: rvv: Add mask agnostic for
 vector integer comparison instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Thu, 21 Jul 2022 00:17:01 -0000

On Mon, Jun 20, 2022 at 5:08 PM ~eopxd <eopxd@git.sr.ht> wrote:
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
>  target/riscv/vector_helper.c            | 10 ++++++++++
>  2 files changed, 11 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 83b85bb851..e6aa5295a1 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1718,6 +1718,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>          data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
>          data =                                                     \
>              FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index d1daa764b7..07ce671879 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -1404,12 +1404,17 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>      uint32_t vl = env->vl;                                    \
>      uint32_t total_elems = env_archcpu(env)->cfg.vlen;        \
>      uint32_t vta_all_1s = vext_vta_all_1s(desc);              \
> +    uint32_t vma = vext_vma(desc);                            \
>      uint32_t i;                                               \
>                                                                \
>      for (i = env->vstart; i < vl; i++) {                      \
>          ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
>          ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
>          if (!vm && !vext_elem_mask(v0, i)) {                  \
> +            /* set masked-off elements to 1s */               \
> +            if (vma) {                                        \
> +                vext_set_elem_mask(vd, i, 1);                 \
> +            }                                                 \
>              continue;                                         \
>          }                                                     \
>          vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
> @@ -1462,11 +1467,16 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
>      uint32_t vl = env->vl;                                          \
>      uint32_t total_elems = env_archcpu(env)->cfg.vlen;              \
>      uint32_t vta_all_1s = vext_vta_all_1s(desc);                    \
> +    uint32_t vma = vext_vma(desc);                                  \
>      uint32_t i;                                                     \
>                                                                      \
>      for (i = env->vstart; i < vl; i++) {                            \
>          ETYPE s2 = *((ETYPE *)vs2 + H(i));                          \
>          if (!vm && !vext_elem_mask(v0, i)) {                        \
> +            /* set masked-off elements to 1s */                     \
> +            if (vma) {                                              \
> +                vext_set_elem_mask(vd, i, 1);                       \
> +            }                                                       \
>              continue;                                               \
>          }                                                           \
>          vext_set_elem_mask(vd, i,                                   \
> --
> 2.34.2
>
>

