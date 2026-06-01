Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5885CD5BD1
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 03:45:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTtaE-0004Qn-J0; Sun, 31 May 2026 23:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTtZw-0004PW-2h
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 23:44:45 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTtZs-0008TH-Hw
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 23:44:39 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-bec405a6ea5so113808166b.0
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 20:44:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780285473; cv=none;
 d=google.com; s=arc-20240605;
 b=CYOcTOxel9fXqVu7CJOXtByfNUhXxIRTBMXVaBDPDJCm9rzcv26cCMz89F7ccw9eie
 G6YLcIRTY/SygZUtWoXNg6hS3g0Ar5ageiwxPO4L0QGri/BziKrCU9YfX3nD9Anx2SYk
 k6eW+CWiVfQAPUDnFBSaCP8hIfMmg7xGXvPe/WKMFP9oMSFAbULcT57TOj9VxxhQEb5u
 HjUA3J5Mv6WS9nZVH0AwSft16Y5scYoQIgvWYTSPzv3j2j4SdLJnufPjoTbpKwH7zqu6
 YLKb1+Y2kVm7LQP8lR6X6TzO7couqxP+ZePf/3Vm/T9JJocKGywfOsaeja6Fg3h7P0ie
 vgOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=P5s54tft2eqJK7ytOfgzJ7A/CzBQ4G8PEKMn7O2CZJ4=;
 fh=EFvbRvtmkXfdDdwEk0gnkUq7zfaqP9DtPHhCFjkdfR4=;
 b=NmIFOyw4Kw2CLZM/VzhSbnRveshDSMa1Lye1lD4znbr/rbwfgAh0L+hFtfTRk6dvk2
 36p06jjS6OiMnOI4D+bItG+LIUPCbJrAi6EiFA0d+xl1JuFkuVn5gFzA2RJ7/sSDrCiN
 Y1d2TCky3h3lfX5mK4tDxyyIxoOg6Spun4Y0vBzm+vjGw4XamrFcHGJrAE4QVOwxn2+2
 2nj5I2PTRD2Oh5mbX8yU5chowDQn7ODjOKlO491m6Br+vl0LUP6d8mbzUsZ58S8nxvSx
 C2HW7gNSh6bPCf7UkBRRCa2JvlLU5a4WylhmoSa4kcohKPFXTmhH0o0xoOXyzV/+Wpnj
 kPMQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780285473; x=1780890273; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P5s54tft2eqJK7ytOfgzJ7A/CzBQ4G8PEKMn7O2CZJ4=;
 b=WAlF4v/rDwKBevSM1muQHP7+kIYBfQkbwJGULvRS1fI6Gw01T/Tiw5z05Yatyoa2cH
 a770NEV4Oc6lEfFWe8xlmPPJq0vQx7uDyCHlywJ9gcSqux54vzhLVW6vQMrNFr6AQjo4
 MfqH9Cw3YA09jFR3I3R9h+UWB71x9jF2Yy/ieOiE49Jh5r5QhpNSfygEab1pSQN16AfP
 oNK9zfWU+YZu+eXvfmcANwcWlChjIErlgTAJDmMVOcvk2hUC2yCrPnc6MveLPbwMLO1f
 JQ2I7ex1XVVnsCMpuezJdOBc1u6d9bTxqc5cbBYmHuRgHKOW6AIXKGlxXM4EvjGPbOEB
 nP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780285473; x=1780890273;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P5s54tft2eqJK7ytOfgzJ7A/CzBQ4G8PEKMn7O2CZJ4=;
 b=TLGOQcGVGzSOC0xi3oOYeZoD0L0kj4OKNmrLI1AdoCp4SWLCcPISDbzzwoxmHa26j2
 /89gSkJ/ZYefuDrJijLEti3UroG7+3pFPIg8e0q4OPqjoDTnaapra3E9fDVxWryjzCxR
 yyP8SRuF4RxIFKYck2pWbhCca4JW0LfRT/8YYn8lVM6XaZimtvBs6/4VE4Oxo4iXcXIc
 knF2spR9vFfkuE/cpE2q6y6UmmRrtF6wzk2Bdha3/SBcc8O3wXTM8v8jIPFLa/dFlwez
 /T6V+ORLRW+ImoswMZE++FcOQhvXULmdmFSElc15CcTJ+DeqzKFLQAlYaBugi44Q10dK
 Jtrg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9k+KNRwIxAdMtEBrhrlM6hFrculv8xCrBm8PsloiAFC2YpT6b9ltvAJXaaR9lrOYJgWRHhQERS9ncl@nongnu.org
X-Gm-Message-State: AOJu0YyLeu9DGxH3bSc9XMHVf+Hl0MlKX9rSjij1j2/ih4odk7yOA3ZS
 5TIQF8ODd/v42QrLMQPeFeQHZ9ip+g3CZgRdgGB5PDG1nsdeNY0kEjmKaJ0SQHjlk3UjygGBD6Z
 3+5RW53WSF834R1ZbXFTxv0n4lg3wzq4=
X-Gm-Gg: Acq92OFpDLLuNJ8KODtNbZejBMiXitrhLsNQT8bkG23enWgZuG78oFwhuA3eAcBfp53
 N8VnXJJuo/xAmIrAlRUIlr8rhauvEDsT1XFwtQfImGSkvxLjJGhYo/O4uwBJr2mfNHH5aCdEaZ5
 wIFnZZ3FAaJ7Qefj6bCKvYlZotITKlxNw+1KE5TjoP0/eLr02S97TZTPhA9FDbBrf73O77sOJUd
 9UuAY6bY5MafD2lcniTvaz868Z4iR0BV/QfkpJK/E+O31nIU7wQfG6+jKRk21aUYF8tMA7WCQhd
 6FNBXHs9HhDkRaeLWtQrmVxJ7u+hnGLf/V80bO4+QMBJ4NX/
X-Received: by 2002:a17:907:a315:b0:bed:8f7e:d85b with SMTP id
 a640c23a62f3a-bed8f7eda28mr95493266b.42.1780285472922; Sun, 31 May 2026
 20:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260527201348.29511-1-philmd@linaro.org>
 <20260527201348.29511-3-philmd@linaro.org>
In-Reply-To: <20260527201348.29511-3-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Jun 2026 13:44:05 +1000
X-Gm-Features: AVHnY4IxWXhHH592sEpanq66K7W7bZAZVPBpwN71UQeAIV3QIx_FQ-xG4bA6jyA
Message-ID: <CAKmqyKOQ3SaHaN0vAS9Pn5OQXD-sRJEpL59=uJDJVtYq1DHukw@mail.gmail.com>
Subject: Re: [PATCH v11 02/12] target/riscv: Implement runtime data endianness
 via MSTATUS bits
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org, 
 Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 Anton Johansson <anjo@rev.ng>, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, May 28, 2026 at 6:16=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> From: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>
>
> Make data accesses honour the MSTATUS MBE/SBE/UBE endianness bits
> instead of being hardcoded to little-endian. Update mo_endian_env()
> to pick the bit corresponding to the current privilege level (MBE
> for M, SBE for S, UBE for U). Remove the now unused mo_endian()
> helper.
>
> Note, TB_FLAGS has no free bits, so the data endianness is carried
> in the extended RISC-V TB flags stored in cs_base. It uses
> EXT_TB_FLAGS.BIG_ENDIAN at bit 33, leaving bit 32 for
> EXT_TB_FLAGS.ALTFMT. This keys TBs correctly on the current data
> endianness.
>
> Instruction fetches remain MO_LE unconditionally; RISC-V instructions
> are always little-endian per the ISA specification. Update the
> disassembler comment to clarify that BFD_ENDIAN_LITTLE is correct.
>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Co-developed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h         |  1 +
>  target/riscv/internals.h   | 29 +++++++++++++++++++++--------
>  target/riscv/cpu.c         |  7 ++-----
>  target/riscv/tcg/tcg-cpu.c |  2 ++
>  target/riscv/translate.c   | 15 ++-------------
>  5 files changed, 28 insertions(+), 26 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7d79c7a5a7e..1f3cbbf823f 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -706,6 +706,7 @@ FIELD(TB_FLAGS, PM_SIGNEXTEND, 31, 1)
>
>  FIELD(EXT_TB_FLAGS, MISA_EXT, 0, 32)
>  FIELD(EXT_TB_FLAGS, ALTFMT, 32, 1)
> +FIELD(EXT_TB_FLAGS, BIG_ENDIAN, 33, 1)
>
>  #ifdef TARGET_RISCV32
>  #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 8c24af0d855..2b3bdbbf30a 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -62,16 +62,29 @@ static inline bool mmuidx_2stage(int mmu_idx)
>      return mmu_idx & MMU_2STAGE_BIT;
>  }
>
> +/*
> + * Return the endianness for the current privilege
> + * level, based on the MSTATUS MBE/SBE/UBE bits.
> + */
>  static inline MemOp mo_endian_env(CPURISCVState *env)
>  {
> -    /*
> -     * A couple of bits in MSTATUS set the endianness:
> -     *  - MSTATUS_UBE (User-mode),
> -     *  - MSTATUS_SBE (Supervisor-mode),
> -     *  - MSTATUS_MBE (Machine-mode)
> -     * but we don't implement that yet.
> -     */
> -    return MO_LE;
> +    bool be =3D false;
> +#if !defined(CONFIG_USER_ONLY)
> +    switch (env->priv) {
> +    case PRV_M:
> +        be =3D env->mstatus & MSTATUS_MBE;
> +        break;
> +    case PRV_S:
> +        be =3D env->mstatus & MSTATUS_SBE;
> +        break;
> +    case PRV_U:
> +        be =3D env->mstatus & MSTATUS_UBE;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +#endif
> +    return be ? MO_BE : MO_LE;
>  }
>
>  /* share data between vector helpers and decode code */
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 862834b4809..52f143f1cd4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -830,11 +830,8 @@ static void riscv_cpu_disas_set_info(const CPUState =
*s, disassemble_info *info)
>      info->target_info =3D &cpu->cfg;
>
>      /*
> -     * A couple of bits in MSTATUS set the endianness:
> -     *  - MSTATUS_UBE (User-mode),
> -     *  - MSTATUS_SBE (Supervisor-mode),
> -     *  - MSTATUS_MBE (Machine-mode)
> -     * but we don't implement that yet.
> +     * RISC-V instructions are always little-endian, regardless of the
> +     * data endianness configured via MSTATUS UBE/SBE/MBE bits.
>       */
>      info->endian =3D BFD_ENDIAN_LITTLE;
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 3e22e7ed53d..45bbf658cad 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -193,6 +193,8 @@ static TCGTBCPUState riscv_get_tb_cpu_state(CPUState =
*cs)
>      flags =3D FIELD_DP32(flags, TB_FLAGS, PM_SIGNEXTEND, pm_signext);
>
>      ext_flags =3D FIELD_DP64(ext_flags, EXT_TB_FLAGS, MISA_EXT, env->mis=
a_ext);
> +    ext_flags =3D FIELD_DP64(ext_flags, EXT_TB_FLAGS, BIG_ENDIAN,
> +                           mo_endian_env(env) =3D=3D MO_BE);
>
>      return (TCGTBCPUState){
>          .pc =3D env->xl =3D=3D MXL_RV32 ? env->pc & UINT32_MAX : env->pc=
,
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 9367f159f90..35c6b37c0b6 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -129,18 +129,6 @@ static inline bool has_ext(DisasContext *ctx, uint32=
_t ext)
>      return ctx->misa_ext & ext;
>  }
>
> -static inline MemOp mo_endian(DisasContext *ctx)
> -{
> -    /*
> -     * A couple of bits in MSTATUS set the endianness:
> -     *  - MSTATUS_UBE (User-mode),
> -     *  - MSTATUS_SBE (Supervisor-mode),
> -     *  - MSTATUS_MBE (Machine-mode)
> -     * but we don't implement that yet.
> -     */
> -    return MO_LE;
> -}
> -
>  #ifdef TARGET_RISCV32
>  #define get_xl(ctx)    MXL_RV32
>  #elif defined(CONFIG_USER_ONLY)
> @@ -1362,7 +1350,8 @@ static void riscv_tr_init_disas_context(DisasContex=
tBase *dcbase, CPUState *cs)
>      ctx->zero =3D tcg_constant_tl(0);
>      ctx->virt_inst_excp =3D false;
>      ctx->decoders =3D cpu->decoders;
> -    ctx->mo_endianness =3D mo_endian(ctx);
> +    ctx->mo_endianness =3D FIELD_EX64(ext_tb_flags, EXT_TB_FLAGS, BIG_EN=
DIAN)
> +                         ? MO_BE : MO_LE;
>  }
>
>  static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
> --
> 2.53.0
>
>

