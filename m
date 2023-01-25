Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKn4M-0005zO-Cc
	for mharc-qemu-riscv@gnu.org; Wed, 25 Jan 2023 16:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKn4K-0005x8-NK
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 16:12:32 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKn4G-0007tg-QH
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 16:12:32 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so2122996wmb.0
 for <qemu-riscv@nongnu.org>; Wed, 25 Jan 2023 13:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jZP05581uw4/3OAibbLYQX8/d/UgIw9IpV1CgbOFulw=;
 b=EVa/yD0Hfl6QzlgohnwpunmfzyDOmnX8omLmaSmnQwf7++8I60kZapFsXQFp07hatT
 f91AKJaBPmXfKo2PzQ5DFrL8/iUmV9zXmjhbi7uio5R+ZPKVRHTcg+zzS1QbMffcsbEu
 2bX4hPcg8EdcGpgQUvXqYIx0Z3kgDe3MOmOUfpdcirK/l/WZ4u0fvTT1OznxGKZ0+n7g
 myAXYCeQecKPJBsXKBhHHEfZapw8uDDmVN2gN0EyoIpNLfoZ/RXHsJZy3tttaMJyenmT
 DG5jC+54Rd4fKG2Xs9xbtaN1g/pbWt7d977bi89cxaqKtyCwULrSpqbzXX6DLJstaBDU
 Hmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jZP05581uw4/3OAibbLYQX8/d/UgIw9IpV1CgbOFulw=;
 b=4r39c0ati4Gaa8Hg5GVF/Lpbjwhf+mYgxdpq0Ar+zUSpFO38twsOP9Qr5N+mul7nkQ
 q49O4UBSBSZhBKzIqy1YWkkIZjToBZ7VCerOde3etT2BuXHy+fPBioaONHCbc0jH8aQR
 Hg0a01x5VxJ/RpoSkzJEQTs1RgJrzdLXUsfBVJJP22tR8s9ydy5rswqruL3JNirSmtYL
 LA+LVCWWoya0X0WZACBg37HuyPCQ8Gcdw/e2bVlDwFGZ+ZpWH7m+MbfmIcPyhiXZZQVo
 B9xhqbXXyRQRVP8gcq2sb/aUzA9v7KN4VrGx92/4eisBuFddgquyjzXBVucFv9iaEmIg
 JCIw==
X-Gm-Message-State: AFqh2krAKFW0/D2D5ajE8+c2sL5IV7Kd3yZPgqzFWNbPEedRbueVyJZu
 DCL7R+1WShi2FbKrIp7sru/rzA==
X-Google-Smtp-Source: AMrXdXtaiFu7Z0NZl5mrCbGWEYd2GLx5FUF/Og5Oxom4IU9MV1WWLieGU90hgiWD5vTlHsdmr3Ki6A==
X-Received: by 2002:a05:600c:5116:b0:3db:1a8:c041 with SMTP id
 o22-20020a05600c511600b003db01a8c041mr33278318wms.17.1674681147019; 
 Wed, 25 Jan 2023 13:12:27 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ip6-20020a05600ca68600b003d04e4ed873sm2820187wmb.22.2023.01.25.13.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 13:12:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0222A1FFB7;
 Wed, 25 Jan 2023 21:12:26 +0000 (GMT)
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-7-richard.henderson@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net, Daniel
 Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 06/36] tcg: Introduce tcg_target_call_oarg_reg
Date: Wed, 25 Jan 2023 21:09:23 +0000
In-reply-to: <20230108023719.2466341-7-richard.henderson@linaro.org>
Message-ID: <877cxaqpxi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 25 Jan 2023 21:12:32 -0000


Richard Henderson <richard.henderson@linaro.org> writes:

> Replace the flat array tcg_target_call_oarg_regs[] with
> a function call including the TCGCallReturnKind.
>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c                        |  9 ++++++---
>  tcg/aarch64/tcg-target.c.inc     | 10 +++++++---
>  tcg/arm/tcg-target.c.inc         | 10 +++++++---
>  tcg/i386/tcg-target.c.inc        | 16 ++++++++++------
>  tcg/loongarch64/tcg-target.c.inc | 10 ++++++----
>  tcg/mips/tcg-target.c.inc        | 10 ++++++----
>  tcg/ppc/tcg-target.c.inc         | 10 ++++++----
>  tcg/riscv/tcg-target.c.inc       | 10 ++++++----
>  tcg/s390x/tcg-target.c.inc       |  9 ++++++---
>  tcg/sparc64/tcg-target.c.inc     | 12 ++++++------
>  tcg/tci/tcg-target.c.inc         | 12 ++++++------
>  11 files changed, 72 insertions(+), 46 deletions(-)
>
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 93d1331f93..092cdaf422 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -148,6 +148,7 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, =
TCGArg val,
>                          TCGReg base, intptr_t ofs);
>  static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target,
>                           const TCGHelperInfo *info);
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot);
>  static bool tcg_target_const_match(int64_t val, TCGType type, int ct);
>  #ifdef TCG_TARGET_NEED_LDST_LABELS
>  static int tcg_out_ldst_finalize(TCGContext *s);
> @@ -719,14 +720,16 @@ static void init_call_layout(TCGHelperInfo *info)
>      case dh_typecode_s64:
>          info->nr_out =3D 64 / TCG_TARGET_REG_BITS;
>          info->out_kind =3D TCG_CALL_RET_NORMAL;
> -        assert(info->nr_out <=3D ARRAY_SIZE(tcg_target_call_oarg_regs));
> +        /* Query the last register now to trigger any assert early. */
> +        tcg_target_call_oarg_reg(info->out_kind, info->nr_out - 1);
>          break;
>      case dh_typecode_i128:
>          info->nr_out =3D 128 / TCG_TARGET_REG_BITS;
>          info->out_kind =3D TCG_CALL_RET_NORMAL; /* TODO */
>          switch (/* TODO */ TCG_CALL_RET_NORMAL) {
>          case TCG_CALL_RET_NORMAL:
> -            assert(info->nr_out <=3D ARRAY_SIZE(tcg_target_call_oarg_reg=
s));
> +            /* Query the last register now to trigger any assert early. =
*/
> +            tcg_target_call_oarg_reg(info->out_kind, info->nr_out - 1);
>              break;
>          case TCG_CALL_RET_BY_REF:
>              /*
> @@ -4563,7 +4566,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp=
 *op)
>      case TCG_CALL_RET_NORMAL:
>          for (i =3D 0; i < nb_oargs; i++) {
>              TCGTemp *ts =3D arg_temp(op->args[i]);
> -            TCGReg reg =3D tcg_target_call_oarg_regs[i];
> +            TCGReg reg =3D tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL,=
 i);
>=20=20
>              /* ENV should not be modified.  */
>              tcg_debug_assert(!temp_readonly(ts));
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index 2279a14c11..dfe569dd8c 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -63,9 +63,13 @@ static const int tcg_target_call_iarg_regs[8] =3D {
>      TCG_REG_X0, TCG_REG_X1, TCG_REG_X2, TCG_REG_X3,
>      TCG_REG_X4, TCG_REG_X5, TCG_REG_X6, TCG_REG_X7
>  };
> -static const int tcg_target_call_oarg_regs[1] =3D {
> -    TCG_REG_X0
> -};
> +
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
> +{
> +    tcg_debug_assert(kind =3D=3D TCG_CALL_RET_NORMAL);
> +    tcg_debug_assert(slot >=3D 0 && slot <=3D 1);
> +    return TCG_REG_X0 + slot;
> +}
>=20=20
>  #define TCG_REG_TMP TCG_REG_X30
>  #define TCG_VEC_TMP TCG_REG_V31
> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
> index 8b24481d8c..4e1d06dcd8 100644
> --- a/tcg/arm/tcg-target.c.inc
> +++ b/tcg/arm/tcg-target.c.inc
> @@ -79,9 +79,13 @@ static const int tcg_target_reg_alloc_order[] =3D {
>  static const int tcg_target_call_iarg_regs[4] =3D {
>      TCG_REG_R0, TCG_REG_R1, TCG_REG_R2, TCG_REG_R3
>  };
> -static const int tcg_target_call_oarg_regs[2] =3D {
> -    TCG_REG_R0, TCG_REG_R1
> -};
> +
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
> +{
> +    tcg_debug_assert(kind =3D=3D TCG_CALL_RET_NORMAL);
> +    tcg_debug_assert(slot >=3D 0 && slot <=3D 3);
> +    return TCG_REG_R0 + slot;
> +}

So this is now returning allocations of TCG_REG_R0 to TCG_REG_R3? Do we
have to take care to get things right if slot is ever bigger w.r.t.
tcg_target_reg_alloc_order?

>=20=20
>  #define TCG_REG_TMP  TCG_REG_R12
>  #define TCG_VEC_TMP  TCG_REG_Q15
> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index 6a021dda8b..ab6881a4f3 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -109,12 +109,16 @@ static const int tcg_target_call_iarg_regs[] =3D {
>  #endif
>  };
>=20=20
> -static const int tcg_target_call_oarg_regs[] =3D {
> -    TCG_REG_EAX,
> -#if TCG_TARGET_REG_BITS =3D=3D 32
> -    TCG_REG_EDX
> -#endif
> -};
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
> +{
> +    switch (kind) {
> +    case TCG_CALL_RET_NORMAL:
> +        tcg_debug_assert(slot >=3D 0 && slot <=3D 1);
> +        return slot ? TCG_REG_EDX : TCG_REG_EAX;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
>=20=20
>  /* Constants we accept.  */
>  #define TCG_CT_CONST_S32 0x100
> diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-targe=
t.c.inc
> index 54b1dcd911..f6b0ed00bb 100644
> --- a/tcg/loongarch64/tcg-target.c.inc
> +++ b/tcg/loongarch64/tcg-target.c.inc
> @@ -114,10 +114,12 @@ static const int tcg_target_call_iarg_regs[] =3D {
>      TCG_REG_A7,
>  };
>=20=20
> -static const int tcg_target_call_oarg_regs[] =3D {
> -    TCG_REG_A0,
> -    TCG_REG_A1,
> -};
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
> +{
> +    tcg_debug_assert(kind =3D=3D TCG_CALL_RET_NORMAL);
> +    tcg_debug_assert(slot >=3D 0 && slot <=3D 1);
> +    return TCG_REG_A0 + slot;
> +}
>=20=20
>  #ifndef CONFIG_SOFTMMU
>  #define USE_GUEST_BASE     (guest_base !=3D 0)
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index 22b5463f0f..92883176c6 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -136,10 +136,12 @@ static const TCGReg tcg_target_call_iarg_regs[] =3D=
 {
>  #endif
>  };
>=20=20
> -static const TCGReg tcg_target_call_oarg_regs[2] =3D {
> -    TCG_REG_V0,
> -    TCG_REG_V1
> -};
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
> +{
> +    tcg_debug_assert(kind =3D=3D TCG_CALL_RET_NORMAL);
> +    tcg_debug_assert(slot >=3D 0 && slot <=3D 1);
> +    return TCG_REG_V0 + slot;
> +}
>=20=20
>  static const tcg_insn_unit *tb_ret_addr;
>  static const tcg_insn_unit *bswap32_addr;
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index bf3812eb8d..d31e6c3de4 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -186,10 +186,12 @@ static const int tcg_target_call_iarg_regs[] =3D {
>      TCG_REG_R10
>  };
>=20=20
> -static const int tcg_target_call_oarg_regs[] =3D {
> -    TCG_REG_R3,
> -    TCG_REG_R4
> -};
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
> +{
> +    tcg_debug_assert(kind =3D=3D TCG_CALL_RET_NORMAL);
> +    tcg_debug_assert(slot >=3D 0 && slot <=3D 1);
> +    return TCG_REG_R3 + slot;
> +}
>=20=20
>  static const int tcg_target_callee_save_regs[] =3D {
>  #ifdef _CALL_DARWIN
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index b961972b9f..7cfd35e753 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -113,10 +113,12 @@ static const int tcg_target_call_iarg_regs[] =3D {
>      TCG_REG_A7,
>  };
>=20=20
> -static const int tcg_target_call_oarg_regs[] =3D {
> -    TCG_REG_A0,
> -    TCG_REG_A1,
> -};
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
> +{
> +    tcg_debug_assert(kind =3D=3D TCG_CALL_RET_NORMAL);
> +    tcg_debug_assert(slot >=3D 0 && slot <=3D 1);
> +    return TCG_REG_A0 + slot;
> +}
>=20=20
>  #define TCG_CT_CONST_ZERO  0x100
>  #define TCG_CT_CONST_S12   0x200
> diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
> index d65cd79899..cebf180777 100644
> --- a/tcg/s390x/tcg-target.c.inc
> +++ b/tcg/s390x/tcg-target.c.inc
> @@ -390,9 +390,12 @@ static const int tcg_target_call_iarg_regs[] =3D {
>      TCG_REG_R6,
>  };
>=20=20
> -static const int tcg_target_call_oarg_regs[] =3D {
> -    TCG_REG_R2,
> -};
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
> +{
> +    tcg_debug_assert(kind =3D=3D TCG_CALL_RET_NORMAL);
> +    tcg_debug_assert(slot =3D=3D 0);
> +    return TCG_REG_R2;
> +}
>=20=20
>  #define S390_CC_EQ      8
>  #define S390_CC_LT      4
> diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
> index f6a8a8e605..9b5afb8248 100644
> --- a/tcg/sparc64/tcg-target.c.inc
> +++ b/tcg/sparc64/tcg-target.c.inc
> @@ -133,12 +133,12 @@ static const int tcg_target_call_iarg_regs[6] =3D {
>      TCG_REG_O5,
>  };
>=20=20
> -static const int tcg_target_call_oarg_regs[] =3D {
> -    TCG_REG_O0,
> -    TCG_REG_O1,
> -    TCG_REG_O2,
> -    TCG_REG_O3,
> -};
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
> +{
> +    tcg_debug_assert(kind =3D=3D TCG_CALL_RET_NORMAL);
> +    tcg_debug_assert(slot >=3D 0 && slot <=3D 3);
> +    return TCG_REG_O0 + slot;
> +}
>=20=20
>  #define INSN_OP(x)  ((x) << 30)
>  #define INSN_OP2(x) ((x) << 22)
> diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
> index 633345d74b..cd53cb6b6b 100644
> --- a/tcg/tci/tcg-target.c.inc
> +++ b/tcg/tci/tcg-target.c.inc
> @@ -200,12 +200,12 @@ static const int tcg_target_reg_alloc_order[] =3D {
>  /* No call arguments via registers.  All will be stored on the "stack". =
*/
>  static const int tcg_target_call_iarg_regs[] =3D { };
>=20=20
> -static const int tcg_target_call_oarg_regs[] =3D {
> -    TCG_REG_R0,
> -#if TCG_TARGET_REG_BITS =3D=3D 32
> -    TCG_REG_R1
> -#endif
> -};
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
> +{
> +    tcg_debug_assert(kind =3D=3D TCG_CALL_RET_NORMAL);
> +    tcg_debug_assert(slot >=3D 0 && slot < 64 / TCG_TARGET_REG_BITS);
> +    return TCG_REG_R0 + slot;
> +}
>=20=20
>  #ifdef CONFIG_DEBUG_TCG
>  static const char *const tcg_target_reg_names[TCG_TARGET_NB_REGS] =3D {

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

