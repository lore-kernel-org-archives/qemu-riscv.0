Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1metAT-00043m-2u
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 02:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1metAR-00043G-51; Mon, 25 Oct 2021 02:09:07 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:46894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1metAO-0007JN-EX; Mon, 25 Oct 2021 02:09:06 -0400
Received: by mail-io1-xd35.google.com with SMTP id n10so4498949iod.13;
 Sun, 24 Oct 2021 23:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=79F38onDJljjmEGUk6Gp/meJlWHPgbv5tN3VMmI4eHA=;
 b=ZN9zfJ1zK8QYspmtonPzOSu0p6gAoSq83OiahapozoB4jfWntH7fjHY9h2yupyi7FQ
 lYEOKBycXS7hlVoRmC8aEyTgYWXpAfMo/60gDAdgE/QD0SxoZ1hQ/S/130jYvTNaAc8j
 9crznL+q02suBtjIT+lyyqaEh1x6oFzfcVu5I3YL1UXNO56HPSnXN5oauCaoEdGb6yfW
 B8h8Er2i1031HdZKHFT11sGa3JcBM38S1t0oWE8NdTQxoa8yc2UDyjn7urnE965MaHWT
 styfoWgpWkfTvJqTflh3vNwb3f/b1nmDKr0I6vH9Ny/nznUJzCFzKcPLX4MB9y6KAIW8
 5niQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=79F38onDJljjmEGUk6Gp/meJlWHPgbv5tN3VMmI4eHA=;
 b=nMBLURS2H/cy5TKUI086e7Ol5T/UaPqsRIX3JMkqht2c+rjzsXO4eByzSfbdw9JbFJ
 TNThHRwdEVZeZh9vk6datT+3G1gCZvdRB40m9FfWQSoV3fsorhEbXF4s1dGEhFFuBc8n
 Fz5ANApfaFrJ3FtWys0bZh/UZYvzyMTkBAUMzJpV0VUSHZmnVOvN6YWfIVMuAJhOOHe8
 SrBkS6tgmb386wXCwRtl4mnGwshhGAzr9PSVEhWtHdCLVm6rGkqYzx2iR9cJXbICHHXM
 l7xVs8uuLsvx/BPO2Z/3xL6ZlxzMMEg+WFu2mt+jXagGOJbJoe4SNWqSTrs+r5unjiWZ
 ufjQ==
X-Gm-Message-State: AOAM530fhdRY7NLmiZMZVdM05PVwWceZuznaMVJmdyeYDTyfLQ/nGa8/
 wm+NuWMAM5+2v9J+QtdFKg2b1vEOMjT9N/hIg7w=
X-Google-Smtp-Source: ABdhPJxSFevtYPMmqrGshc55LtzvuNOIvoFzmL7m4MWIQPmZf9kJFeUTnwgztfzc5iv7ijrdONhOquKZqBPD9DQo0Qs=
X-Received: by 2002:a05:6638:1489:: with SMTP id
 j9mr9435169jak.18.1635142142745; 
 Sun, 24 Oct 2021 23:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-51-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-51-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Oct 2021 16:08:36 +1000
Message-ID: <CAKmqyKMiyqH+W1_n_9x6=1Kuc+_48f_S2zSmdFejMjn8m=DLTQ@mail.gmail.com>
Subject: Re: [PATCH v8 43/78] target/riscv: rvv-1.0: integer
 add-with-carry/subtract-with-borrow
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Mon, 25 Oct 2021 06:09:07 -0000

On Fri, Oct 15, 2021 at 6:26 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> * Only do carry-in or borrow-in if is masked (vm=0).
> * Remove clear function from helper functions as the tail elements
>   are unchanged in RVV 1.0.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              | 20 ++++++++++----------
>  target/riscv/insn_trans/trans_rvv.c.inc |  2 +-
>  target/riscv/vector_helper.c            | 21 ++++++---------------
>  3 files changed, 17 insertions(+), 26 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index f83c8daf24e..9c4089d7a7b 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -378,16 +378,16 @@ vwsubu_wv       110110 . ..... ..... 010 ..... 1010111 @r_vm
>  vwsubu_wx       110110 . ..... ..... 110 ..... 1010111 @r_vm
>  vwsub_wv        110111 . ..... ..... 010 ..... 1010111 @r_vm
>  vwsub_wx        110111 . ..... ..... 110 ..... 1010111 @r_vm
> -vadc_vvm        010000 1 ..... ..... 000 ..... 1010111 @r_vm_1
> -vadc_vxm        010000 1 ..... ..... 100 ..... 1010111 @r_vm_1
> -vadc_vim        010000 1 ..... ..... 011 ..... 1010111 @r_vm_1
> -vmadc_vvm       010001 1 ..... ..... 000 ..... 1010111 @r_vm_1
> -vmadc_vxm       010001 1 ..... ..... 100 ..... 1010111 @r_vm_1
> -vmadc_vim       010001 1 ..... ..... 011 ..... 1010111 @r_vm_1
> -vsbc_vvm        010010 1 ..... ..... 000 ..... 1010111 @r_vm_1
> -vsbc_vxm        010010 1 ..... ..... 100 ..... 1010111 @r_vm_1
> -vmsbc_vvm       010011 1 ..... ..... 000 ..... 1010111 @r_vm_1
> -vmsbc_vxm       010011 1 ..... ..... 100 ..... 1010111 @r_vm_1
> +vadc_vvm        010000 0 ..... ..... 000 ..... 1010111 @r_vm_1
> +vadc_vxm        010000 0 ..... ..... 100 ..... 1010111 @r_vm_1
> +vadc_vim        010000 0 ..... ..... 011 ..... 1010111 @r_vm_1
> +vmadc_vvm       010001 . ..... ..... 000 ..... 1010111 @r_vm
> +vmadc_vxm       010001 . ..... ..... 100 ..... 1010111 @r_vm
> +vmadc_vim       010001 . ..... ..... 011 ..... 1010111 @r_vm
> +vsbc_vvm        010010 0 ..... ..... 000 ..... 1010111 @r_vm_1
> +vsbc_vxm        010010 0 ..... ..... 100 ..... 1010111 @r_vm_1
> +vmsbc_vvm       010011 . ..... ..... 000 ..... 1010111 @r_vm
> +vmsbc_vxm       010011 . ..... ..... 100 ..... 1010111 @r_vm
>  vand_vv         001001 . ..... ..... 000 ..... 1010111 @r_vm
>  vand_vx         001001 . ..... ..... 100 ..... 1010111 @r_vm
>  vand_vi         001001 . ..... ..... 011 ..... 1010111 @r_vm
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 1fcde9f4df4..f3003d023e5 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1547,7 +1547,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>
>  /*
>   * For vadc and vsbc, an illegal instruction exception is raised if the
> - * destination vector register is v0 and LMUL > 1. (Section 12.3)
> + * destination vector register is v0 and LMUL > 1. (Section 12.4)
>   */
>  static bool opivv_vadc_check(DisasContext *s, arg_rmrr *a)
>  {
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 6891f28116f..54405d898b9 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -944,7 +944,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>      for (i = 0; i < vl; i++) {                                \
>          ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
>          ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
> -        uint8_t carry = vext_elem_mask(v0, i);                \
> +        ETYPE carry = vext_elem_mask(v0, i);                  \
>                                                                \
>          *((ETYPE *)vd + H(i)) = DO_OP(s2, s1, carry);         \
>      }                                                         \
> @@ -969,7 +969,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,        \
>                                                                           \
>      for (i = 0; i < vl; i++) {                                           \
>          ETYPE s2 = *((ETYPE *)vs2 + H(i));                               \
> -        uint8_t carry = vext_elem_mask(v0, i);                           \
> +        ETYPE carry = vext_elem_mask(v0, i);                             \
>                                                                           \
>          *((ETYPE *)vd + H(i)) = DO_OP(s2, (ETYPE)(target_long)s1, carry);\
>      }                                                                    \
> @@ -994,20 +994,15 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>                    CPURISCVState *env, uint32_t desc)          \
>  {                                                             \
>      uint32_t vl = env->vl;                                    \
> -    uint32_t vlmax = vext_max_elems(desc,                     \
> -                                    ctzl(sizeof(ETYPE)));     \
> +    uint32_t vm = vext_vm(desc);                              \
>      uint32_t i;                                               \
>                                                                \
>      for (i = 0; i < vl; i++) {                                \
>          ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
>          ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
> -        uint8_t carry = vext_elem_mask(v0, i);                \
> -                                                              \
> +        ETYPE carry = !vm && vext_elem_mask(v0, i);           \
>          vext_set_elem_mask(vd, i, DO_OP(s2, s1, carry));      \
>      }                                                         \
> -    for (; i < vlmax; i++) {                                  \
> -        vext_set_elem_mask(vd, i, 0);                         \
> -    }                                                         \
>  }
>
>  GEN_VEXT_VMADC_VVM(vmadc_vvm_b, uint8_t,  H1, DO_MADC)
> @@ -1025,19 +1020,15 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
>                    void *vs2, CPURISCVState *env, uint32_t desc) \
>  {                                                               \
>      uint32_t vl = env->vl;                                      \
> -    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE))); \
> +    uint32_t vm = vext_vm(desc);                                \
>      uint32_t i;                                                 \
>                                                                  \
>      for (i = 0; i < vl; i++) {                                  \
>          ETYPE s2 = *((ETYPE *)vs2 + H(i));                      \
> -        uint8_t carry = vext_elem_mask(v0, i);                  \
> -                                                                \
> +        ETYPE carry = !vm && vext_elem_mask(v0, i);             \
>          vext_set_elem_mask(vd, i,                               \
>                  DO_OP(s2, (ETYPE)(target_long)s1, carry));      \
>      }                                                           \
> -    for (; i < vlmax; i++) {                                    \
> -        vext_set_elem_mask(vd, i, 0);                           \
> -    }                                                           \
>  }
>
>  GEN_VEXT_VMADC_VXM(vmadc_vxm_b, uint8_t,  H1, DO_MADC)
> --
> 2.25.1
>
>

