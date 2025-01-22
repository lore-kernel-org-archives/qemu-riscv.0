Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D74C02181
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 17:44:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taelX-00055L-LQ; Wed, 22 Jan 2025 12:43:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1taelU-000554-Gk
 for qemu-riscv@nongnu.org; Wed, 22 Jan 2025 12:43:45 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1taelS-0000Gu-00
 for qemu-riscv@nongnu.org; Wed, 22 Jan 2025 12:43:44 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43626213fffso7918825e9.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Jan 2025 09:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737567820; x=1738172620; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wd51pzWtRV+EeMkSD57mO/frIIz9bSGQ/xloZzu58Xk=;
 b=z8r2FSwAfLu9mUD6xX7QJcsK4llTQyqBxxCOAqZT7uL4cwl6Nf2zpCDRl1NVXFWZdF
 Bc64kXUdzQ4Y/9ePb146hXqRrDRWvslWfVvgm39Dsww7gfiAM9k1SCqxmCBmgX9Am1eV
 jh28jUyooaI+4isGpMeGERxMNfVQZ8oYSozGkR6AbeM/6w/nu34YxBMp3Yfxf7h6Y5iz
 e9W0xZ9YLzEIwWzX43u3W+PUUrbCR7XI2eSedMvq6KP1Ltit9g9Zy8/2oeq5OUJTHLDE
 UVy49t89dhwqqj9k1irLMuWkmNHl6Sm5wAyM1SqJmQohk0UHGcwBk4Dvve1ZsYKh7YTH
 GXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737567820; x=1738172620;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wd51pzWtRV+EeMkSD57mO/frIIz9bSGQ/xloZzu58Xk=;
 b=AUb67K/KrHaVdhOhwgqvSgZcsNVaI28O9QShSviMd2hhMv5nBUYSu1M3/2nRw21uCz
 7jSIjnW0yF06KOy3R5UTqJdQTZBmcYlzz2eCQxyqPyLHFgvqcfBYIVCRrADy5EuppTMY
 Eqxx7xtF86rc8yGio6oao7gS3A21wEg3JJtYAq2yGWR81dJYkOXV38GFB2D+xAQHoSe0
 roEcxtxPJzt94K47G/QuYj+aA6Ar3qKNOnBiTW62pClj0pCDVK31tFcWtiDydmI9wNoq
 GllRIeoDRQF3iQC7KQmjeYgTlZU4Sso//CRC6ACys97CHgCgj8QVG11RaCGUSfg6xS5z
 iFMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwNK9CDz6dHUA6CTWGLeoOcXT+2HWCUuNC8J0xRulAFpatpbNIsd2x6E5AybtPPuEzx9O32hCx5uud@nongnu.org
X-Gm-Message-State: AOJu0YxOyUnWD3H6eknbntaMTCqUoTc5HPMe3L/H0nFAhLRYdgz2JDQ+
 BRdxw5U+yD8ImnOcszBAZwpb6dQ8hbrvHCLyLrn6ZZgU7ZyS/oHA79MNH9d3HvU=
X-Gm-Gg: ASbGncsRXn9hLj6sAORJ4RZTj6pE3L56HTEUfhhh+FgF7naV5S6YSusHqaCaYJbQNJ0
 QaxSnCIvDCQGhxBUbyA04ypNu7JQPZgZ6DXSE/qNgshzIpu3vIZOPeXlYQCL3q21HFcHpje5niP
 VgLEDJyTH0+xfad3KJPTERvRZWdgg2a1ZbrRD2DzWH5/nxrJ3hklPE/RJf/5gtRQzPYcwbcfLgd
 rVNGKA/gywRVF8ifkadSmtiU92XMLydlryHGyyJYBjgf64accQqgiA/WlahN1Fk5sKO
X-Google-Smtp-Source: AGHT+IGNgdJHPj5ABl2vfeLqdtBlIRRbCBd0V9TkR6yn3+D3OV0278HU27YgdjyBuctRIjVbWEf3ZQ==
X-Received: by 2002:a05:6000:2ce:b0:38a:4df5:a08 with SMTP id
 ffacd0b85a97d-38c2227f5bcmr170910f8f.22.1737567820470; 
 Wed, 22 Jan 2025 09:43:40 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b31c7c6asm31802305e9.35.2025.01.22.09.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 09:43:39 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 63FD55FA4B;
 Wed, 22 Jan 2025 17:43:38 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Savini <paolo.savini@embecosm.com>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  Richard Handerson
 <richard.henderson@linaro.org>,  Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,  Bin Meng
 <bmeng.cn@gmail.com>,  Weiwei Li <liwei1518@gmail.com>,  Daniel Henrique
 Barboza <dbarboza@ventanamicro.com>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Helene Chelin
 <helene.chelin@embecosm.com>,  Nathan Egge <negge@google.com>,  Max Chou
 <max.chou@sifive.com>,  Jeremy Bennett <jeremy.bennett@embecosm.com>,
 Craig Blackmore <craig.blackmore@embecosm.com>
Subject: Re: [RFC 1/1 v3] target/riscv: use tcg ops generation to emulate
 whole reg rvv loads/stores.
In-Reply-To: <20250122164905.13615-2-paolo.savini@embecosm.com> (Paolo
 Savini's message of "Wed, 22 Jan 2025 16:49:05 +0000")
References: <20250122164905.13615-1-paolo.savini@embecosm.com>
 <20250122164905.13615-2-paolo.savini@embecosm.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 22 Jan 2025 17:43:38 +0000
Message-ID: <878qr2n3qt.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Paolo Savini <paolo.savini@embecosm.com> writes:

> This patch replaces the use of a helper function with direct tcg ops gene=
ration
> in order to emulate whole register loads and stores. This is done in orde=
r to
> improve the performance of QEMU.

Generally having the frontend second guess what the backend will do is
not recommended.

> We still use the helper function when vstart is not 0 at the beginning of=
 the
> emulation of the whole register load or store or when we would end up gen=
erating
> partial loads or stores of vector elements (e.g. emulating 64 bits elemen=
t loads
> with pairs of 32 bits loads on hosts with 32 bits registers).
> The latter condition ensures that we are not surprised by a trap in mid-e=
lement
> and consecutively that we can update vstart correctly.

This is what probe functions are for, so you can verify you won't fault
and then fully unroll the loop.

> We also use the helper function when it performs better than tcg for spec=
ific
> combinations of vector length, number of fields and element size.
>
> Signed-off-by: Paolo Savini <paolo.savini@embecosm.com>
> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 164 +++++++++++++++++-------
>  1 file changed, 119 insertions(+), 45 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
> index b9883a5d32..85935276de 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1100,25 +1100,99 @@ GEN_VEXT_TRANS(vle64ff_v, MO_64, r2nfvm, ldff_op,=
 ld_us_check)
>  typedef void gen_helper_ldst_whole(TCGv_ptr, TCGv, TCGv_env, TCGv_i32);
>=20=20
>  static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
> -                             gen_helper_ldst_whole *fn,
> -                             DisasContext *s)
> +                             uint32_t log2_esz, gen_helper_ldst_whole *f=
n,
> +                             DisasContext *s, bool is_load)
>  {
> -    TCGv_ptr dest;
> -    TCGv base;
> -    TCGv_i32 desc;
> +    mark_vs_dirty(s);
>=20=20
> -    uint32_t data =3D FIELD_DP32(0, VDATA, NF, nf);
> -    data =3D FIELD_DP32(data, VDATA, VM, 1);
> -    dest =3D tcg_temp_new_ptr();
> -    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
> -                                      s->cfg_ptr->vlenb, data));
> +    uint32_t vlen =3D s->cfg_ptr->vlenb << 3;
>=20=20
> -    base =3D get_gpr(s, rs1, EXT_NONE);
> -    tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
> +    /*
> +     * Load/store multiple bytes per iteration.
> +     * When possible do this atomically.
> +     * Update vstart with the number of processed elements.
> +     * Use the helper function if either:
> +     * - vstart is not 0.
> +     * - the target has 32 bit registers and we are loading/storing 64 b=
it long
> +     *   elements. This is to ensure that we process every element with =
a single
> +     *   memory instruction.
> +     * - whether the helper function performs better:
> +     *   on x86 the helper function performs better with few combination=
s of NF,
> +     *   ESZ and VLEN.
> +     *   Other architectures may have other combinations or conditions a=
nd they
> +     *   can be added here if necessary.
> +     */
>=20=20
> -    mark_vs_dirty(s);
> +    bool use_helper_fn =3D !s->vstart_eq_zero || (TCG_TARGET_REG_BITS =
=3D=3D 32 && log2_esz =3D=3D 3);
> +
> +#if defined(HOST_X86_64)
> +    use_helper_fn |=3D ((nf =3D=3D 4) && (log2_esz =3D=3D 0) && (vlen =
=3D=3D 1024)) ||
> +                     ((nf =3D=3D 8) && (log2_esz =3D=3D 0) && (vlen =3D=
=3D 512))  ||
> +                     ((nf =3D=3D 8) && (log2_esz =3D=3D 0) && (vlen =3D=
=3D 1024)) ||
> +                     ((nf =3D=3D 8) && (log2_esz =3D=3D 3) && (vlen =3D=
=3D 1024));
> +#endif

Using host architecture ifdefs is generally discouraged except in a few pla=
ces.

>=20=20
> -    fn(dest, base, tcg_env, desc);
> +     if (!use_helper_fn) {
> +        TCGv addr =3D tcg_temp_new();
> +        uint32_t size =3D s->cfg_ptr->vlenb * nf;
> +        TCGv_i64 t8 =3D tcg_temp_new_i64();
> +        TCGv_i32 t4 =3D tcg_temp_new_i32();
> +        MemOp atomicity =3D MO_ATOM_NONE;
> +        if (log2_esz =3D=3D 0) {
> +            atomicity =3D MO_ATOM_NONE;
> +        } else {
> +            atomicity =3D MO_ATOM_IFALIGN_PAIR;
> +        }
> +        if (TCG_TARGET_REG_BITS =3D=3D 64) {
> +            for (int i =3D 0; i < size; i +=3D 8) {
> +                addr =3D get_address(s, rs1, i);
> +                if (is_load) {
> +                    tcg_gen_qemu_ld_i64(t8, addr, s->mem_idx,
> +                            MO_LE | MO_64 | atomicity);
> +                    tcg_gen_st_i64(t8, tcg_env, vreg_ofs(s, vd) + i);
> +                } else {
> +                    tcg_gen_ld_i64(t8, tcg_env, vreg_ofs(s, vd) + i);
> +                    tcg_gen_qemu_st_i64(t8, addr, s->mem_idx,
> +                            MO_LE | MO_64 | atomicity);
> +                }
> +                if (i =3D=3D size - 8) {
> +                    tcg_gen_movi_tl(cpu_vstart, 0);
> +                } else {
> +                    tcg_gen_addi_tl(cpu_vstart, cpu_vstart, 8 >> log2_es=
z);
> +                }
> +            }
> +        } else {
> +            for (int i =3D 0; i < size; i +=3D 4) {
> +                addr =3D get_address(s, rs1, i);
> +                if (is_load) {
> +                    tcg_gen_qemu_ld_i32(t4, addr, s->mem_idx,
> +                            MO_LE | MO_32 | atomicity);
> +                    tcg_gen_st_i32(t4, tcg_env, vreg_ofs(s, vd) + i);
> +                } else {
> +                    tcg_gen_ld_i32(t4, tcg_env, vreg_ofs(s, vd) + i);
> +                    tcg_gen_qemu_st_i32(t4, addr, s->mem_idx,
> +                            MO_LE | MO_32 | atomicity);
> +                }
> +                if (i =3D=3D size - 4) {
> +                    tcg_gen_movi_tl(cpu_vstart, 0);
> +                } else {
> +                    tcg_gen_addi_tl(cpu_vstart, cpu_vstart, 4 >> log2_es=
z);
> +                }
> +            }
> +        }
> +    } else {
> +        TCGv_ptr dest;
> +        TCGv base;
> +        TCGv_i32 desc;
> +        uint32_t data =3D FIELD_DP32(0, VDATA, NF, nf);
> +        data =3D FIELD_DP32(data, VDATA, VM, 1);
> +        dest =3D tcg_temp_new_ptr();
> +        desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
> +                        s->cfg_ptr->vlenb, data));
> +        base =3D get_gpr(s, rs1, EXT_NONE);
> +        tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
> +        fn(dest, base, tcg_env, desc);
> +    }
>=20=20
>      finalize_rvv_inst(s);
>      return true;
> @@ -1128,42 +1202,42 @@ static bool ldst_whole_trans(uint32_t vd, uint32_=
t rs1, uint32_t nf,
>   * load and store whole register instructions ignore vtype and vl settin=
g.
>   * Thus, we don't need to check vill bit. (Section 7.9)
>   */
> -#define GEN_LDST_WHOLE_TRANS(NAME, ARG_NF)                              =
  \
> -static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               =
  \
> -{                                                                       =
  \
> -    if (require_rvv(s) &&                                               =
  \
> -        QEMU_IS_ALIGNED(a->rd, ARG_NF)) {                               =
  \
> -        return ldst_whole_trans(a->rd, a->rs1, ARG_NF,                  =
  \
> -                                gen_helper_##NAME, s);                  =
  \
> -    }                                                                   =
  \
> -    return false;                                                       =
  \
> -}
> -
> -GEN_LDST_WHOLE_TRANS(vl1re8_v,  1)
> -GEN_LDST_WHOLE_TRANS(vl1re16_v, 1)
> -GEN_LDST_WHOLE_TRANS(vl1re32_v, 1)
> -GEN_LDST_WHOLE_TRANS(vl1re64_v, 1)
> -GEN_LDST_WHOLE_TRANS(vl2re8_v,  2)
> -GEN_LDST_WHOLE_TRANS(vl2re16_v, 2)
> -GEN_LDST_WHOLE_TRANS(vl2re32_v, 2)
> -GEN_LDST_WHOLE_TRANS(vl2re64_v, 2)
> -GEN_LDST_WHOLE_TRANS(vl4re8_v,  4)
> -GEN_LDST_WHOLE_TRANS(vl4re16_v, 4)
> -GEN_LDST_WHOLE_TRANS(vl4re32_v, 4)
> -GEN_LDST_WHOLE_TRANS(vl4re64_v, 4)
> -GEN_LDST_WHOLE_TRANS(vl8re8_v,  8)
> -GEN_LDST_WHOLE_TRANS(vl8re16_v, 8)
> -GEN_LDST_WHOLE_TRANS(vl8re32_v, 8)
> -GEN_LDST_WHOLE_TRANS(vl8re64_v, 8)
> +#define GEN_LDST_WHOLE_TRANS(NAME, ETYPE, ARG_NF, IS_LOAD)              =
    \
> +static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               =
    \
> +{                                                                       =
    \
> +    if (require_rvv(s) &&                                               =
    \
> +        QEMU_IS_ALIGNED(a->rd, ARG_NF)) {                               =
    \
> +        return ldst_whole_trans(a->rd, a->rs1, ARG_NF, ctzl(sizeof(ETYPE=
)), \
> +                                gen_helper_##NAME, s, IS_LOAD);         =
    \
> +    }                                                                   =
    \
> +    return false;                                                       =
    \
> +}
> +
> +GEN_LDST_WHOLE_TRANS(vl1re8_v,  int8_t,  1, true)
> +GEN_LDST_WHOLE_TRANS(vl1re16_v, int16_t, 1, true)
> +GEN_LDST_WHOLE_TRANS(vl1re32_v, int32_t, 1, true)
> +GEN_LDST_WHOLE_TRANS(vl1re64_v, int64_t, 1, true)
> +GEN_LDST_WHOLE_TRANS(vl2re8_v,  int8_t,  2, true)
> +GEN_LDST_WHOLE_TRANS(vl2re16_v, int16_t, 2, true)
> +GEN_LDST_WHOLE_TRANS(vl2re32_v, int32_t, 2, true)
> +GEN_LDST_WHOLE_TRANS(vl2re64_v, int64_t, 2, true)
> +GEN_LDST_WHOLE_TRANS(vl4re8_v,  int8_t,  4, true)
> +GEN_LDST_WHOLE_TRANS(vl4re16_v, int16_t, 4, true)
> +GEN_LDST_WHOLE_TRANS(vl4re32_v, int32_t, 4, true)
> +GEN_LDST_WHOLE_TRANS(vl4re64_v, int64_t, 4, true)
> +GEN_LDST_WHOLE_TRANS(vl8re8_v,  int8_t,  8, true)
> +GEN_LDST_WHOLE_TRANS(vl8re16_v, int16_t, 8, true)
> +GEN_LDST_WHOLE_TRANS(vl8re32_v, int32_t, 8, true)
> +GEN_LDST_WHOLE_TRANS(vl8re64_v, int64_t, 8, true)
>=20=20
>  /*
>   * The vector whole register store instructions are encoded similar to
>   * unmasked unit-stride store of elements with EEW=3D8.
>   */
> -GEN_LDST_WHOLE_TRANS(vs1r_v, 1)
> -GEN_LDST_WHOLE_TRANS(vs2r_v, 2)
> -GEN_LDST_WHOLE_TRANS(vs4r_v, 4)
> -GEN_LDST_WHOLE_TRANS(vs8r_v, 8)
> +GEN_LDST_WHOLE_TRANS(vs1r_v, int8_t, 1, false)
> +GEN_LDST_WHOLE_TRANS(vs2r_v, int8_t, 2, false)
> +GEN_LDST_WHOLE_TRANS(vs4r_v, int8_t, 4, false)
> +GEN_LDST_WHOLE_TRANS(vs8r_v, int8_t, 8, false)
>=20=20
>  /*
>   *** Vector Integer Arithmetic Instructions

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

