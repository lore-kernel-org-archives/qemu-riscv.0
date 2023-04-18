Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pob2c-0008GK-AU
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 22:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pob2a-0008Ea-Gh; Mon, 17 Apr 2023 22:25:56 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pob2X-0006Vk-Uu; Mon, 17 Apr 2023 22:25:56 -0400
Received: by mail-ua1-x931.google.com with SMTP id a26so3590193uak.5;
 Mon, 17 Apr 2023 19:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681784752; x=1684376752;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xRz2vYMowRDgjT6RimOcd4wh2p5yRkq7Sh0siGa5SBw=;
 b=TsrHj3BdWTCQ7C+lkNBsHPg8hd+oAw00LeJHzNTJV4PDZRl6XSLT3Uifp6RQPKc388
 B5t3qZvqjUXgHiFLtc1//DxJ5U9108V9KF5x6sC04rEEKadO10WU89kYBep47wN9JoIk
 fM1T7+sRiWdCfrGn1dqgs/VYa/TBdzD3TXFE7mati39It7rdFS8pSG4AJlQqijohXeqk
 lJNm1MFi8NSCEdGk+YwLw7G1VQvivsctQw97IDD8hso8XGdf/2fZEkuy0QegiUYEfvXJ
 yX1gcuPN1GMKYVfgkUHr1QlYhQ6tmtgwWPUL7tx7XvDqdkCRy6Tl93jFl//FFICnjqao
 lVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681784752; x=1684376752;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xRz2vYMowRDgjT6RimOcd4wh2p5yRkq7Sh0siGa5SBw=;
 b=Ki68jgJzeCy6xGSpZ1CCS/+hZeReDsVz/w89fb/9ZbEhFipF06CSmMVncg22B41yZH
 WejI1oa82ucopJzX4C7AwJgU3dnNFyl0JwH/u2r2jvnq1Du5VXdBL4nBoG/M9XNdF0qS
 iMcbCEw89nDMFk3DBndC7KW4zC+ci+ISIiJAnLgCYHH0n1VxSDBJoTcVVRz9pCU/cFcT
 azfT+6yH8Ckbl8TR/96z8BdzL/cDg6FCE34QTsQSp/vYj8vheTz0JGM0CtbWdNTMn+qG
 t2nDF3iGrI2bwJqZf0Opse63qkcgATBORc8GjDNsxtpjliMMms4/xWNFXn57HBxhzenR
 k2zg==
X-Gm-Message-State: AAQBX9d1b+3G382YsyGjV12TZZGgZUkYEgRnCDCm5oLkeajUJTadYqyg
 TGjJuuVaxddL6Gl7TRGcUdCMvNdbDYCxuUul5ZQ=
X-Google-Smtp-Source: AKy350YhJ77w0AdtI7jhG1i02j6dfJC/k6EAlQMi+EyRM/vGouudL3KpymygWAdE1Cmog9TBSDD8T4f9HRj30EiXpBM=
X-Received: by 2002:a1f:4387:0:b0:440:50c4:3e13 with SMTP id
 q129-20020a1f4387000000b0044050c43e13mr4660205vka.5.1681784752133; Mon, 17
 Apr 2023 19:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230417135821.609964-1-lawrence.hunter@codethink.co.uk>
 <20230417135821.609964-3-lawrence.hunter@codethink.co.uk>
In-Reply-To: <20230417135821.609964-3-lawrence.hunter@codethink.co.uk>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Apr 2023 12:25:26 +1000
Message-ID: <CAKmqyKP1akoCLyp-O3wt=Y8sZaiROzxRY2Aq9ierK+nnnzsrYg@mail.gmail.com>
Subject: Re: [PATCH v2 02/17] target/riscv: Refactor vector-vector translation
 macro
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Cc: qemu-devel@nongnu.org, dickon.hood@codethink.co.uk, 
 nazar.kazakov@codethink.co.uk, kiran.ostrolenk@codethink.co.uk, 
 frank.chang@sifive.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, pbonzini@redhat.com, philipp.tomsich@vrull.eu, 
 kvm@vger.kernel.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
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
X-List-Received-Date: Tue, 18 Apr 2023 02:25:56 -0000

On Tue, Apr 18, 2023 at 12:01=E2=80=AFAM Lawrence Hunter
<lawrence.hunter@codethink.co.uk> wrote:
>
> From: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
>
> Factor the non SEW-specific stuff out of `GEN_OPIVV_TRANS` into
> function `opivv_trans` (similar to `opivi_trans`). `opivv_trans` will be
> used in proceeding vector-crypto commits.
>
> Signed-off-by: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 62 +++++++++++++------------
>  1 file changed, 32 insertions(+), 30 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
> index f2e3d385152..4106bd69949 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1643,38 +1643,40 @@ GEN_OPIWX_WIDEN_TRANS(vwadd_wx)
>  GEN_OPIWX_WIDEN_TRANS(vwsubu_wx)
>  GEN_OPIWX_WIDEN_TRANS(vwsub_wx)
>
> +static bool opivv_trans(uint32_t vd, uint32_t vs1, uint32_t vs2, uint32_=
t vm,
> +                        gen_helper_gvec_4_ptr *fn, DisasContext *s)
> +{
> +    uint32_t data =3D 0;
> +    TCGLabel *over =3D gen_new_label();
> +    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
> +
> +    data =3D FIELD_DP32(data, VDATA, VM, vm);
> +    data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
> +    data =3D FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);
> +    data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
> +    tcg_gen_gvec_4_ptr(vreg_ofs(s, vd), vreg_ofs(s, 0), vreg_ofs(s, vs1)=
,
> +                       vreg_ofs(s, vs2), cpu_env, s->cfg_ptr->vlen / 8,
> +                       s->cfg_ptr->vlen / 8, data, fn);
> +    mark_vs_dirty(s);
> +    gen_set_label(over);
> +    return true;
> +}
> +
>  /* Vector Integer Add-with-Carry / Subtract-with-Borrow Instructions */
>  /* OPIVV without GVEC IR */
> -#define GEN_OPIVV_TRANS(NAME, CHECK)                               \
> -static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
> -{                                                                  \
> -    if (CHECK(s, a)) {                                             \
> -        uint32_t data =3D 0;                                         \
> -        static gen_helper_gvec_4_ptr * const fns[4] =3D {            \
> -            gen_helper_##NAME##_b, gen_helper_##NAME##_h,          \
> -            gen_helper_##NAME##_w, gen_helper_##NAME##_d,          \
> -        };                                                         \
> -        TCGLabel *over =3D gen_new_label();                          \
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> -        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
> -                                                                   \
> -        data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
> -        data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> -        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
> -        data =3D                                                     \
> -            FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
> -        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
> -        tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
> -                           vreg_ofs(s, a->rs1),                    \
> -                           vreg_ofs(s, a->rs2), cpu_env,           \
> -                           s->cfg_ptr->vlen / 8,                   \
> -                           s->cfg_ptr->vlen / 8, data,             \
> -                           fns[s->sew]);                           \
> -        mark_vs_dirty(s);                                          \
> -        gen_set_label(over);                                       \
> -        return true;                                               \
> -    }                                                              \
> -    return false;                                                  \
> +#define GEN_OPIVV_TRANS(NAME, CHECK)                                    =
 \
> +static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                  =
 \
> +{                                                                       =
 \
> +    if (CHECK(s, a)) {                                                  =
 \
> +        static gen_helper_gvec_4_ptr * const fns[4] =3D {               =
   \
> +            gen_helper_##NAME##_b, gen_helper_##NAME##_h,               =
 \
> +            gen_helper_##NAME##_w, gen_helper_##NAME##_d,               =
 \
> +        };                                                              =
 \
> +        return opivv_trans(a->rd, a->rs1, a->rs2, a->vm, fns[s->sew], s)=
;\
> +    }                                                                   =
 \
> +    return false;                                                       =
 \
>  }
>
>  /*
> --
> 2.40.0
>
>

