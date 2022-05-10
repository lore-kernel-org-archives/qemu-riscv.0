Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noMgL-0005xt-Kw
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 06:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noMfv-0005rO-BK; Tue, 10 May 2022 06:01:06 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:42544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noMfs-0006Mc-Od; Tue, 10 May 2022 06:01:02 -0400
Received: by mail-il1-x131.google.com with SMTP id r17so10999936iln.9;
 Tue, 10 May 2022 03:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=43ifPbsI8SD2lhv4jAsz+sC0LFCIQL2Ivgu7m9u1TBs=;
 b=RdCeiyS3pnnshQCX4qQ6BQVBDVSwIg6+Jlz4rtLH2tezJk+LHEFk1w4SIP7V1XA4tQ
 tZ7T9xWNMiwyGyL+OzDGskyKnlsebMEm3mViTxrGARihI0uYVyJJ09gaNNAo0ZviotN5
 sIrwo7w2LabbwNIJJdgnSXwuPhIY4+stA0eay/iTX1nKfxXGGwF2uNGinIDRudJrZgDx
 bsJXK8h15I69Hn9QqrEIkyq/yIYMxe5iXiHQoGDc3sBQmjjQSbqzsB6CTC+oBu/8xzJj
 y0sD/z1s2vbAIKmVJjsqEmxoMcUFSj+hh4S5j9PQa6HwpNXRKiDy5xsRtrK4CcS2n/xm
 EaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=43ifPbsI8SD2lhv4jAsz+sC0LFCIQL2Ivgu7m9u1TBs=;
 b=ix3MtgCtTgjjF5W1Q+JDR+5FEjKElSJPNIbhWFGNC2Z6FPO+JyuZl6bpW/SJd7YOK8
 PMDruyf4NFG8CxfDVS5+1I8aGMs2oOx8Sm0RdxGC58d1+4Tnf6voH76yNT8RyLmws7+a
 zYmoyTgHZu+phBrZRHLmnPS/eUABBG7I4NTZVVhGn8UZWCUZNBjGJa3/4JyZvZu/mHsz
 AwKyUCdoepVEKeN9Uq8uNQ28zq4Uq4/S3+yNWaXO8nNgt9H+H8oaUWlBFL25Bp0tUHu4
 0QLkCobJ4rsQQTqF6E7VsreI14oLBXkR7WYoeNJhxH/riNvADah+BzJu01OO6nhfQ4/H
 ZSbw==
X-Gm-Message-State: AOAM530zvVVB1Xpd+npf3HFCMWPoNVkYzyKSF3snY3RIZRnoTUToqeaQ
 EbYXE42OA2sTHp5gde0nDZM6WJrodSzf5nJ7yYk=
X-Google-Smtp-Source: ABdhPJx3SULEOY+oXMuApK0ZmkInm88vaz0DD7Shlf66DRhBYSzNWklNw82Y60yNPEgab9TpUxVmLeY+XWn09kyQkes=
X-Received: by 2002:a05:6e02:10c1:b0:2cc:14ab:ceb7 with SMTP id
 s1-20020a056e0210c100b002cc14abceb7mr8574828ilj.55.1652176859282; Tue, 10 May
 2022 03:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <165156202959.27941.9731161369415852149-0@git.sr.ht>
 <165156202959.27941.9731161369415852149-13@git.sr.ht>
In-Reply-To: <165156202959.27941.9731161369415852149-13@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 May 2022 12:00:32 +0200
Message-ID: <CAKmqyKPhWnFtjdZVSncFch4=D4mK7vtxXTk2YjNCv3nYcj=w3Q@mail.gmail.com>
Subject: Re: [PATCH qemu v14 13/15] target/riscv: rvv: Add tail agnostic for
 vector mask instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Tue, 10 May 2022 10:01:26 -0000

On Tue, May 3, 2022 at 9:44 AM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: eopXD <eop.chen@sifive.com>
>
> The tail elements in the destination mask register are updated under
> a tail-agnostic policy.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc |  6 +++++
>  target/riscv/vector_helper.c            | 30 +++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 86374f22c0..a27433b324 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3211,6 +3211,8 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)                \
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> +        data =                                                     \
> +            FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
> @@ -3315,6 +3317,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>                                                                     \
>          data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> +        data =                                                     \
> +            FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
>                             vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
>                             cpu_env, s->cfg_ptr->vlen / 8,          \
> @@ -3352,6 +3356,7 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
>
>          data = FIELD_DP32(data, VDATA, VM, a->vm);
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);
>          static gen_helper_gvec_3_ptr * const fns[4] = {
>              gen_helper_viota_m_b, gen_helper_viota_m_h,
>              gen_helper_viota_m_w, gen_helper_viota_m_d,
> @@ -3381,6 +3386,7 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
>
>          data = FIELD_DP32(data, VDATA, VM, a->vm);
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);
>          static gen_helper_gvec_2_ptr * const fns[4] = {
>              gen_helper_vid_v_b, gen_helper_vid_v_h,
>              gen_helper_vid_v_w, gen_helper_vid_v_d,
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index a319cda969..dcb6d3538c 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4719,6 +4719,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>                    uint32_t desc)                          \
>  {                                                         \
>      uint32_t vl = env->vl;                                \
> +    uint32_t total_elems = env_archcpu(env)->cfg.vlen;    \
> +    uint32_t vta_all_1s = vext_vta_all_1s(desc);          \
>      uint32_t i;                                           \
>      int a, b;                                             \
>                                                            \
> @@ -4728,6 +4730,15 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>          vext_set_elem_mask(vd, i, OP(b, a));              \
>      }                                                     \
>      env->vstart = 0;                                      \
> +    /* mask destination register are always tail-         \
> +     * agnostic                                           \
> +     */                                                   \
> +    /* set tail elements to 1s */                         \
> +    if (vta_all_1s) {                                     \
> +        for (; i < total_elems; i++) {                    \
> +            vext_set_elem_mask(vd, i, 1);                 \
> +        }                                                 \
> +    }                                                     \
>  }
>
>  #define DO_NAND(N, M)  (!(N & M))
> @@ -4795,6 +4806,8 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
>  {
>      uint32_t vm = vext_vm(desc);
>      uint32_t vl = env->vl;
> +    uint32_t total_elems = env_archcpu(env)->cfg.vlen;
> +    uint32_t vta_all_1s = vext_vta_all_1s(desc);
>      int i;
>      bool first_mask_bit = false;
>
> @@ -4823,6 +4836,13 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
>          }
>      }
>      env->vstart = 0;
> +    /* mask destination register are always tail-agnostic */
> +    /* set tail elements to 1s */
> +    if (vta_all_1s) {
> +        for (; i < total_elems; i++) {
> +            vext_set_elem_mask(vd, i, 1);
> +        }
> +    }
>  }
>
>  void HELPER(vmsbf_m)(void *vd, void *v0, void *vs2, CPURISCVState *env,
> @@ -4850,6 +4870,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CPURISCVState *env,      \
>  {                                                                         \
>      uint32_t vm = vext_vm(desc);                                          \
>      uint32_t vl = env->vl;                                                \
> +    uint32_t esz = sizeof(ETYPE);                                         \
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
> +    uint32_t vta = vext_vta(desc);                                        \
>      uint32_t sum = 0;                                                     \
>      int i;                                                                \
>                                                                            \
> @@ -4863,6 +4886,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CPURISCVState *env,      \
>          }                                                                 \
>      }                                                                     \
>      env->vstart = 0;                                                      \
> +    /* set tail elements to 1s */                                         \
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
>  }
>
>  GEN_VEXT_VIOTA_M(viota_m_b, uint8_t,  H1)
> @@ -4876,6 +4901,9 @@ void HELPER(NAME)(void *vd, void *v0, CPURISCVState *env, uint32_t desc)  \
>  {                                                                         \
>      uint32_t vm = vext_vm(desc);                                          \
>      uint32_t vl = env->vl;                                                \
> +    uint32_t esz = sizeof(ETYPE);                                         \
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
> +    uint32_t vta = vext_vta(desc);                                        \
>      int i;                                                                \
>                                                                            \
>      for (i = env->vstart; i < vl; i++) {                                  \
> @@ -4885,6 +4913,8 @@ void HELPER(NAME)(void *vd, void *v0, CPURISCVState *env, uint32_t desc)  \
>          *((ETYPE *)vd + H(i)) = i;                                        \
>      }                                                                     \
>      env->vstart = 0;                                                      \
> +    /* set tail elements to 1s */                                         \
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
>  }
>
>  GEN_VEXT_VID_V(vid_v_b, uint8_t,  H1)
> --
> 2.34.2
>
>

