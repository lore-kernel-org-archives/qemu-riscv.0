Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1wY9-0004id-LG
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 14:20:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1wY5-0004h3-SN; Tue, 19 Jan 2021 14:20:18 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:35377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1wY0-0007Zz-1U; Tue, 19 Jan 2021 14:20:17 -0500
Received: by mail-io1-xd35.google.com with SMTP id y19so41906816iov.2;
 Tue, 19 Jan 2021 11:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2JQoIhc0KOX2a8RGsu9MXEObVIiAKy0d2dLFzQ7SXXk=;
 b=hCToVDr9Hsq55bq0NVUcgWJsyMaFrbyQ5MjtpzE2HZsr755MT0b5YkglqP7KsqY7j5
 Y+S8lLt20qvfpPaQTl+WMn1j4raugFit97nm/zlKvlxbl+0XdWwBu95eq34f3HgA4RNh
 BB+GrWnH0B5khLKFGGyFRVxNAl19V0EPTrpf8JVatfMim1fMTfvXbTnHJhG5F4xEzsZx
 6Uaw3A9FxQKF016cu8UUip3rV+GtJ1Zo2t4Yj2KRSkBDApDXSXaNHmsrraxmnWJC7exv
 KZe6fMG6NVtnkJoqpig5+s7u4uaVoONtj3S5jUlC4jFJZ9pbhguEYbcajq6EpJJS+fh4
 SZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2JQoIhc0KOX2a8RGsu9MXEObVIiAKy0d2dLFzQ7SXXk=;
 b=HVC1xxyc5Mgk7C53mCogfTITN8l7ZTck3mXLJIAy290laRFG2ZRiGh6jVNJvF9SClU
 9ZN/70cX9qUOihkavGM5M8I+rFE/ZFW+ZEvlT4NK3iGOPoC2ky9tMBi4iExRcL1ijtx+
 SVy+c1OtSnA4Vqe3z0ANFYtNvzk7DHk9zIXB6CNYJ6gsODXHkcwmxI8vZgcH1gFqAH9B
 Yrea2yNmqQbnKxTzkfGklenRzHvqiev4BaFLleMlG6D3a2Lr6mAmTHnjHGshdsMF8lZi
 2F5ClN+HJbnn5rAVlWc6q7Zo+aYd6j9lvjGoG3ok3Z8Er0sT3IXpqbPyDHs5WT7BnwAj
 Ve/A==
X-Gm-Message-State: AOAM532Lo2fAig2wBEAoA8VlzjrndcOUWd7xPbw9jYTA77AkneKSSFGC
 N5u0KJBoGY6IPx06Tw8T1ny1N6MHAGUNdl9A9L0=
X-Google-Smtp-Source: ABdhPJwo679QfCbav/RYQAMshAxljDaycaZbG8CjVdm+tTcxFtNbn7tNH+kROoQK1lbJIWu3PjkZY1rcWkiBXqGJzrc=
X-Received: by 2002:a05:6e02:20e5:: with SMTP id
 q5mr4635568ilv.131.1611084009387; 
 Tue, 19 Jan 2021 11:20:09 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-22-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-22-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 11:19:43 -0800
Message-ID: <CAKmqyKPBv641N-zfKTyni066B3t66m7mkdJhai5sc=2Ld7p23w@mail.gmail.com>
Subject: Re: [PATCH v6 21/72] target/riscv: rvv-1.0: fault-only-first unit
 stride load
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Tue, 19 Jan 2021 19:20:19 -0000

On Tue, Jan 12, 2021 at 1:56 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   | 27 +++---------
>  target/riscv/insn32.decode              | 14 +++----
>  target/riscv/insn_trans/trans_rvv.c.inc | 33 ++++-----------
>  target/riscv/vector_helper.c            | 56 +++++++++----------------
>  4 files changed, 39 insertions(+), 91 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 98c0c6e29b6..5eb2404a75a 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -135,28 +135,11 @@ DEF_HELPER_6(vsxei64_8_v, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vsxei64_16_v, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vsxei64_32_v, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vsxei64_64_v, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_5(vlbff_v_b, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlbff_v_h, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlbff_v_w, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlbff_v_d, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlhff_v_h, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlhff_v_w, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlhff_v_d, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlwff_v_w, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlwff_v_d, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vleff_v_b, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vleff_v_h, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vleff_v_w, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vleff_v_d, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlbuff_v_b, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlbuff_v_h, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlbuff_v_w, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlbuff_v_d, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlhuff_v_h, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlhuff_v_w, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlhuff_v_d, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlwuff_v_w, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlwuff_v_d, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vle8ff_v, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vle16ff_v, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vle32ff_v, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vle64ff_v, void, ptr, ptr, tl, env, i32)
> +
>  #ifdef TARGET_RISCV64
>  DEF_HELPER_6(vamoswapw_v_d, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vamoswapd_v_d, void, ptr, ptr, tl, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index c0058c6c756..9e4fe72560b 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -260,14 +260,6 @@ vsse16_v    ... 010 . ..... ..... 101 ..... 0100111 @r_nfvm
>  vsse32_v    ... 010 . ..... ..... 110 ..... 0100111 @r_nfvm
>  vsse64_v    ... 010 . ..... ..... 111 ..... 0100111 @r_nfvm
>
> -vlbff_v    ... 100 . 10000 ..... 000 ..... 0000111 @r2_nfvm
> -vlhff_v    ... 100 . 10000 ..... 101 ..... 0000111 @r2_nfvm
> -vlwff_v    ... 100 . 10000 ..... 110 ..... 0000111 @r2_nfvm
> -vleff_v    ... 000 . 10000 ..... 111 ..... 0000111 @r2_nfvm
> -vlbuff_v   ... 000 . 10000 ..... 000 ..... 0000111 @r2_nfvm
> -vlhuff_v   ... 000 . 10000 ..... 101 ..... 0000111 @r2_nfvm
> -vlwuff_v   ... 000 . 10000 ..... 110 ..... 0000111 @r2_nfvm
> -
>  # Vector ordered-indexed and unordered-indexed load insns.
>  vlxei8_v      ... 0-1 . ..... ..... 000 ..... 0000111 @r_nfvm
>  vlxei16_v     ... 0-1 . ..... ..... 101 ..... 0000111 @r_nfvm
> @@ -280,6 +272,12 @@ vsxei16_v     ... 0-1 . ..... ..... 101 ..... 0100111 @r_nfvm
>  vsxei32_v     ... 0-1 . ..... ..... 110 ..... 0100111 @r_nfvm
>  vsxei64_v     ... 0-1 . ..... ..... 111 ..... 0100111 @r_nfvm
>
> +# Vector unit-stride fault-only-first load insns.
> +vle8ff_v      ... 000 . 10000 ..... 000 ..... 0000111 @r2_nfvm
> +vle16ff_v     ... 000 . 10000 ..... 101 ..... 0000111 @r2_nfvm
> +vle32ff_v     ... 000 . 10000 ..... 110 ..... 0000111 @r2_nfvm
> +vle64ff_v     ... 000 . 10000 ..... 111 ..... 0000111 @r2_nfvm
> +
>  #*** Vector AMO operations are encoded under the standard AMO major opcode ***
>  vamoswapw_v     00001 . . ..... ..... 110 ..... 0101111 @r_wdvm
>  vamoaddw_v      00000 . . ..... ..... 110 ..... 0101111 @r_wdvm
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 320d710695f..20161b1ebe3 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -943,28 +943,16 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
>      return true;
>  }
>
> -static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
> +static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>  {
>      uint32_t data = 0;
>      gen_helper_ldst_us *fn;
> -    static gen_helper_ldst_us * const fns[7][4] = {
> -        { gen_helper_vlbff_v_b,  gen_helper_vlbff_v_h,
> -          gen_helper_vlbff_v_w,  gen_helper_vlbff_v_d },
> -        { NULL,                  gen_helper_vlhff_v_h,
> -          gen_helper_vlhff_v_w,  gen_helper_vlhff_v_d },
> -        { NULL,                  NULL,
> -          gen_helper_vlwff_v_w,  gen_helper_vlwff_v_d },
> -        { gen_helper_vleff_v_b,  gen_helper_vleff_v_h,
> -          gen_helper_vleff_v_w,  gen_helper_vleff_v_d },
> -        { gen_helper_vlbuff_v_b, gen_helper_vlbuff_v_h,
> -          gen_helper_vlbuff_v_w, gen_helper_vlbuff_v_d },
> -        { NULL,                  gen_helper_vlhuff_v_h,
> -          gen_helper_vlhuff_v_w, gen_helper_vlhuff_v_d },
> -        { NULL,                  NULL,
> -          gen_helper_vlwuff_v_w, gen_helper_vlwuff_v_d }
> +    static gen_helper_ldst_us * const fns[4] = {
> +        gen_helper_vle8ff_v, gen_helper_vle16ff_v,
> +        gen_helper_vle32ff_v, gen_helper_vle64ff_v
>      };
>
> -    fn =  fns[seq][s->sew];
> +    fn = fns[eew];
>      if (fn == NULL) {
>          return false;
>      }
> @@ -975,13 +963,10 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
>      return ldff_trans(a->rd, a->rs1, data, fn, s);
>  }
>
> -GEN_VEXT_TRANS(vlbff_v, 0, r2nfvm, ldff_op, ld_us_check)
> -GEN_VEXT_TRANS(vlhff_v, 1, r2nfvm, ldff_op, ld_us_check)
> -GEN_VEXT_TRANS(vlwff_v, 2, r2nfvm, ldff_op, ld_us_check)
> -GEN_VEXT_TRANS(vleff_v, 3, r2nfvm, ldff_op, ld_us_check)
> -GEN_VEXT_TRANS(vlbuff_v, 4, r2nfvm, ldff_op, ld_us_check)
> -GEN_VEXT_TRANS(vlhuff_v, 5, r2nfvm, ldff_op, ld_us_check)
> -GEN_VEXT_TRANS(vlwuff_v, 6, r2nfvm, ldff_op, ld_us_check)
> +GEN_VEXT_TRANS(vle8ff_v,  MO_8,  r2nfvm, ldff_op, ld_us_check)
> +GEN_VEXT_TRANS(vle16ff_v, MO_16, r2nfvm, ldff_op, ld_us_check)
> +GEN_VEXT_TRANS(vle32ff_v, MO_32, r2nfvm, ldff_op, ld_us_check)
> +GEN_VEXT_TRANS(vle64ff_v, MO_64, r2nfvm, ldff_op, ld_us_check)
>
>  /*
>   *** vector atomic operation
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 9349a36b41b..fd398af8550 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -458,7 +458,7 @@ static inline void
>  vext_ldff(void *vd, void *v0, target_ulong base,
>            CPURISCVState *env, uint32_t desc,
>            vext_ldst_elem_fn *ldst_elem,
> -          uint32_t esz, uint32_t msz, uintptr_t ra)
> +          uint32_t esz, uintptr_t ra)
>  {
>      void *host;
>      uint32_t i, k, vl = 0;
> @@ -472,24 +472,24 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>          if (!vm && !vext_elem_mask(v0, i)) {
>              continue;
>          }
> -        addr = base + nf * i * msz;
> +        addr = base + nf * i * esz;
>          if (i == 0) {
> -            probe_pages(env, addr, nf * msz, ra, MMU_DATA_LOAD);
> +            probe_pages(env, addr, nf * esz, ra, MMU_DATA_LOAD);
>          } else {
>              /* if it triggers an exception, no need to check watchpoint */
> -            remain = nf * msz;
> +            remain = nf * esz;
>              while (remain > 0) {
>                  offset = -(addr | TARGET_PAGE_MASK);
>                  host = tlb_vaddr_to_host(env, addr, MMU_DATA_LOAD,
>                                           cpu_mmu_index(env, false));
>                  if (host) {
>  #ifdef CONFIG_USER_ONLY
> -                    if (page_check_range(addr, nf * msz, PAGE_READ) < 0) {
> +                    if (page_check_range(addr, nf * esz, PAGE_READ) < 0) {
>                          vl = i;
>                          goto ProbeSuccess;
>                      }
>  #else
> -                    probe_pages(env, addr, nf * msz, ra, MMU_DATA_LOAD);
> +                    probe_pages(env, addr, nf * esz, ra, MMU_DATA_LOAD);
>  #endif
>                  } else {
>                      vl = i;
> @@ -514,43 +514,25 @@ ProbeSuccess:
>              continue;
>          }
>          while (k < nf) {
> -            target_ulong addr = base + (i * nf + k) * msz;
> +            target_ulong addr = base + (i * nf + k) * esz;
>              ldst_elem(env, addr, i + k * vlmax, vd, ra);
>              k++;
>          }
>      }
>  }
>
> -#define GEN_VEXT_LDFF(NAME, MTYPE, ETYPE, LOAD_FN)               \
> -void HELPER(NAME)(void *vd, void *v0, target_ulong base,         \
> -                  CPURISCVState *env, uint32_t desc)             \
> -{                                                                \
> -    vext_ldff(vd, v0, base, env, desc, LOAD_FN,                  \
> -              sizeof(ETYPE), sizeof(MTYPE), GETPC());            \
> -}
> -
> -GEN_VEXT_LDFF(vlbff_v_b,  int8_t,   int8_t,   ldb_b)
> -GEN_VEXT_LDFF(vlbff_v_h,  int8_t,   int16_t,  ldb_h)
> -GEN_VEXT_LDFF(vlbff_v_w,  int8_t,   int32_t,  ldb_w)
> -GEN_VEXT_LDFF(vlbff_v_d,  int8_t,   int64_t,  ldb_d)
> -GEN_VEXT_LDFF(vlhff_v_h,  int16_t,  int16_t,  ldh_h)
> -GEN_VEXT_LDFF(vlhff_v_w,  int16_t,  int32_t,  ldh_w)
> -GEN_VEXT_LDFF(vlhff_v_d,  int16_t,  int64_t,  ldh_d)
> -GEN_VEXT_LDFF(vlwff_v_w,  int32_t,  int32_t,  ldw_w)
> -GEN_VEXT_LDFF(vlwff_v_d,  int32_t,  int64_t,  ldw_d)
> -GEN_VEXT_LDFF(vleff_v_b,  int8_t,   int8_t,   lde_b)
> -GEN_VEXT_LDFF(vleff_v_h,  int16_t,  int16_t,  lde_h)
> -GEN_VEXT_LDFF(vleff_v_w,  int32_t,  int32_t,  lde_w)
> -GEN_VEXT_LDFF(vleff_v_d,  int64_t,  int64_t,  lde_d)
> -GEN_VEXT_LDFF(vlbuff_v_b, uint8_t,  uint8_t,  ldbu_b)
> -GEN_VEXT_LDFF(vlbuff_v_h, uint8_t,  uint16_t, ldbu_h)
> -GEN_VEXT_LDFF(vlbuff_v_w, uint8_t,  uint32_t, ldbu_w)
> -GEN_VEXT_LDFF(vlbuff_v_d, uint8_t,  uint64_t, ldbu_d)
> -GEN_VEXT_LDFF(vlhuff_v_h, uint16_t, uint16_t, ldhu_h)
> -GEN_VEXT_LDFF(vlhuff_v_w, uint16_t, uint32_t, ldhu_w)
> -GEN_VEXT_LDFF(vlhuff_v_d, uint16_t, uint64_t, ldhu_d)
> -GEN_VEXT_LDFF(vlwuff_v_w, uint32_t, uint32_t, ldwu_w)
> -GEN_VEXT_LDFF(vlwuff_v_d, uint32_t, uint64_t, ldwu_d)
> +#define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \
> +void HELPER(NAME)(void *vd, void *v0, target_ulong base,  \
> +                  CPURISCVState *env, uint32_t desc)      \
> +{                                                         \
> +    vext_ldff(vd, v0, base, env, desc, LOAD_FN,           \
> +              sizeof(ETYPE), GETPC());                    \
> +}
> +
> +GEN_VEXT_LDFF(vle8ff_v,  int8_t,  lde_b)
> +GEN_VEXT_LDFF(vle16ff_v, int16_t, lde_h)
> +GEN_VEXT_LDFF(vle32ff_v, int32_t, lde_w)
> +GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d)
>
>  /*
>   *** Vector AMO Operations (Zvamo)
> --
> 2.17.1
>
>

