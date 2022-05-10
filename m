Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noM2G-0002Ir-CF
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 05:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noM2C-0002Bt-Eb; Tue, 10 May 2022 05:20:02 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:41849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noM2A-0007xM-9P; Tue, 10 May 2022 05:19:59 -0400
Received: by mail-io1-xd2d.google.com with SMTP id z26so17874715iot.8;
 Tue, 10 May 2022 02:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wd61Vh+ouvIOKgZ55DTFB5d+rMExXeqFwyKYjsj5bqQ=;
 b=GOzvNJMAmNze64NAkW1whODPALVHii4gZ9L28Fh9DiRARK4pFXbhu7Z1/86GAl+7b9
 ppGTu7QVWQ0WFQuu5WtNpRcXerq8GggsY1X2YQr7bWc8IH8LS+ej4B5KsV7UG1ThV3gf
 IqcVvk3aO7+HGFcvmHPi/j7fgFPOOtysNXzdgWnSARRVbKd5rLoamCQjpCBArpbO2CbS
 fjPR7Tgj8Jp2d1KvpIYpU+xcd2L0Q8mjaggnClGMDwS55e2GvXPwP+b3vYp2TBo0zqrS
 Q9J22zcx6cvf2zc4SaF0Im7+uFaQvy7FpyC2UJHoOao4iSAMA2fAqO/5p+qdMMv3l/tC
 e9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wd61Vh+ouvIOKgZ55DTFB5d+rMExXeqFwyKYjsj5bqQ=;
 b=7v6rO95Hq33bTTitonxDtxQn1BJ/AiMro985wpw27fmhJXt/NwaJLtjTAnDgRnz8/H
 5kovc3PIsGAz2pCndGQ+NB1Eg2rJvz6QKB0pCGBFSXTT4z7SBh2oivemHBrytyg3IVWf
 SUSuTylNbMHSAgz7xq/O5uTWt7nzbj9OXWV3mUDbVetY5exEH5ypUu59ek54YdytekVY
 GZDmG/YJlEdExT6o9LGa+yAPGbjM8nqtHYPyAjoF7hhcZbS/NUZv0bCx+N2WOws6uCWQ
 BSSGKFiouFUa9y+asb5deKj4OzTPXhiApfMYn/V2aZsFKNphK8XRmgLrliPJ40MSczhR
 wY7A==
X-Gm-Message-State: AOAM532YwXLSlz/8N5UP572CWVi/LAVmMLWsRc+hHIZ8wzbGiaQhC7yQ
 U7JYqC0yzk0IiKFBaHuczIOij6QkYFhG5V+I5QA=
X-Google-Smtp-Source: ABdhPJxjyB+G6rmiI4wwdoRRBLqrHqtf3iVTpTFCtOfHjfLY9YTFrKO+xDaTUOKV7XnQTXdaFIuGB4uc0LuNomTNN5E=
X-Received: by 2002:a6b:e406:0:b0:657:baed:ec0b with SMTP id
 u6-20020a6be406000000b00657baedec0bmr8608686iog.27.1652174396839; Tue, 10 May
 2022 02:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <165156202959.27941.9731161369415852149-0@git.sr.ht>
 <165156202959.27941.9731161369415852149-7@git.sr.ht>
In-Reply-To: <165156202959.27941.9731161369415852149-7@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 May 2022 11:19:30 +0200
Message-ID: <CAKmqyKPxqtsR_9MT+pZ9=TFO1GZH085x4iEjtsaDM9BBKAk-0A@mail.gmail.com>
Subject: Re: [PATCH qemu v14 07/15] target/riscv: rvv: Add tail agnostic for
 vector integer shift instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Tue, 10 May 2022 09:20:02 -0000

On Tue, May 3, 2022 at 9:40 AM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: eopXD <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 11 +++++++++++
>  target/riscv/vector_helper.c            | 11 +++++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index d15858fc6f..430847b0f9 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1858,6 +1858,16 @@ do_opivx_gvec_shift(DisasContext *s, arg_rmrr *a, GVecGen2sFn32 *gvec_fn,
>      }
>
>      if (a->vm && s->vl_eq_vlmax) {
> +        if (s->vta && s->lmul < 0) {
> +            /*
> +             * tail elements may pass vlmax when lmul < 0
> +             * set tail elements to 1s
> +             */
> +            uint32_t vlenb = s->cfg_ptr->vlen >> 3;
> +            tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
> +                             vreg_ofs(s, a->rd), -1,
> +                             vlenb, vlenb);
> +        }
>          TCGv_i32 src1 = tcg_temp_new_i32();
>
>          tcg_gen_trunc_tl_i32(src1, get_gpr(s, a->rs1, EXT_NONE));
> @@ -1916,6 +1926,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>                                                                     \
>          data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index e00f9353b9..c1ae2ea2f1 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -1273,6 +1273,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,                          \
>  {                                                                         \
>      uint32_t vm = vext_vm(desc);                                          \
>      uint32_t vl = env->vl;                                                \
> +    uint32_t esz = sizeof(TS1);                                           \
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
> +    uint32_t vta = vext_vta(desc);                                        \
>      uint32_t i;                                                           \
>                                                                            \
>      for (i = env->vstart; i < vl; i++) {                                  \
> @@ -1284,6 +1287,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,                          \
>          *((TS1 *)vd + HS1(i)) = OP(s2, s1 & MASK);                        \
>      }                                                                     \
>      env->vstart = 0;                                                      \
> +    /* set tail elements to 1s */                                         \
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
>  }
>
>  GEN_VEXT_SHIFT_VV(vsll_vv_b, uint8_t,  uint8_t, H1, H1, DO_SLL, 0x7)
> @@ -1308,6 +1313,10 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,      \
>  {                                                           \
>      uint32_t vm = vext_vm(desc);                            \
>      uint32_t vl = env->vl;                                  \
> +    uint32_t esz = sizeof(TD);                              \
> +    uint32_t total_elems =                                  \
> +        vext_get_total_elems(env, desc, esz);               \
> +    uint32_t vta = vext_vta(desc);                          \
>      uint32_t i;                                             \
>                                                              \
>      for (i = env->vstart; i < vl; i++) {                    \
> @@ -1318,6 +1327,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,      \
>          *((TD *)vd + HD(i)) = OP(s2, s1 & MASK);            \
>      }                                                       \
>      env->vstart = 0;                                        \
> +    /* set tail elements to 1s */                           \
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);\
>  }
>
>  GEN_VEXT_SHIFT_VX(vsll_vx_b, uint8_t, int8_t, H1, H1, DO_SLL, 0x7)
> --
> 2.34.2
>
>

