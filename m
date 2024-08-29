Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3D3C71150
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 00:16:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sjSpV-0005r4-IV; Wed, 28 Aug 2024 20:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sjSpT-0005q5-W1
 for qemu-riscv@nongnu.org; Wed, 28 Aug 2024 20:16:00 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sjSpR-0005RO-I1
 for qemu-riscv@nongnu.org; Wed, 28 Aug 2024 20:15:59 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-714262f1bb4so90084b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 28 Aug 2024 17:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724890556; x=1725495356;
 darn=nongnu.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ebY4RiCh2BNu27DGkrhl9h8VtM4wN6R7DPz0cNmHk14=;
 b=X3/iQK5GtIMOANFpJ9WV9EPqMO/5agiohNzMXsMZYMwSDZEcWEHHLT2g0fp/CowiV6
 HelEJfACDNRCMI1LpVsO0+G2y9XQImttQD4f8HyCYZfrR+TPNLhE0L1pxLTjQ7DvC1uw
 RKdn7rYJdzZ17iEqAXMbuXnqGN07EjiT0E1LSlONZeVbwoQiO+bIYZACci6WIUxCHckC
 pTizEQqooOcU8eTgMu2zDzWvjsWtrICi+xRWyVqR72MsSPolUvS4bANDTELVB9UOO/9y
 jdXf+yZgOz/N3aLvDNLfB++5ScdmoMqOElqtN/00hDe5XwTai2ga3sr6pZL9YaUMIs6Z
 AnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724890556; x=1725495356;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ebY4RiCh2BNu27DGkrhl9h8VtM4wN6R7DPz0cNmHk14=;
 b=EQOKoc4X5TWBOtzuJvluOv9mX306wmRFeLvsP1yPuGCVHTaxOWCL+Z6BF2Jyvwo+Kl
 fR0stqGCAlF5Wa62nfrJD52c/FDjQrCgrC1ghXoR9K4X9xz04AYmiPKOH91SVoxNXgdz
 +jJlUZEo0KHKE+vpKssweSkWQ4o6VPZLtir8sCM6ZNpiG7lWFxjP/boJtscXhK2Rcthg
 CeBAPlTWSBGt178Le5DTMgVtfeXUelR9Tc5ZiJiW17Q6TsRz7xzP1Us/EcsoT8I1CII1
 Opo/rYNtaTBliSk2ks3XvMlh4gRgqflaDX9XWbfxAq7QPEDK3wWF3Kxy+KEEoowH82P4
 auHg==
X-Gm-Message-State: AOJu0YyiW4t8upxlwatjCrrL2DocNFmXGurB/ZmbVWN838zjtc1BRTDO
 +R02AjLNARw8QNRiokghjJO1d9enMOmEx9ivNvVeaqxUsWBDKidkgrwyKy/R26k=
X-Google-Smtp-Source: AGHT+IF5wWNXFzvIReFz1tPU5bi50czvHsH1MVF8ik8QV1wRUBF49YGdp0qFn0BZ2QAQbaA2+PQAlA==
X-Received: by 2002:a05:6a21:3513:b0:1cc:e069:e937 with SMTP id
 adf61e73a8af0-1cce100b4eamr1364761637.16.1724890555680; 
 Wed, 28 Aug 2024 17:15:55 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d85b39ced8sm63059a91.46.2024.08.28.17.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 17:15:55 -0700 (PDT)
Date: Wed, 28 Aug 2024 17:15:53 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, laurent@vivier.eu, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com,
 andy.chiu@sifive.com, kito.cheng@sifive.com
Subject: Re: [PATCH v11 16/20] target/riscv: implement zicfiss instructions
Message-ID: <Zs+9uSmWV7HY3PTQ@debug.ba.rivosinc.com>
References: <20240828174739.714313-1-debug@rivosinc.com>
 <20240828174739.714313-17-debug@rivosinc.com>
 <CAKmqyKOF0XGhSH5-vNKqFXhX=XB9p5STRAsm6kNaph=7i-7=3A@mail.gmail.com>
 <Zs+7cCW04Y7beKJw@debug.ba.rivosinc.com>
 <CAKmqyKPEeWry0yGurH+3o=0N55nG+41-bDeVChwQdKX++zt0Xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKPEeWry0yGurH+3o=0N55nG+41-bDeVChwQdKX++zt0Xw@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=debug@rivosinc.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Aug 29, 2024 at 10:07:15AM +1000, Alistair Francis wrote:
>On Thu, Aug 29, 2024 at 10:06 AM Deepak Gupta <debug@rivosinc.com> wrote:
>>
>> On Thu, Aug 29, 2024 at 10:01:30AM +1000, Alistair Francis wrote:
>> >On Thu, Aug 29, 2024 at 3:53 AM Deepak Gupta <debug@rivosinc.com> wrote:
>> >>
>> >> zicfiss has following instructions
>> >>  - sspopchk: pops a value from shadow stack and compares with x1/x5.
>> >>    If they dont match, reports a sw check exception with tval = 3.
>> >>  - sspush: pushes value in x1/x5 on shadow stack
>> >>  - ssrdp: reads current shadow stack
>> >>  - ssamoswap: swaps contents of shadow stack atomically
>> >>
>> >> sspopchk/sspush/ssrdp default to zimop if zimop implemented and SSE=0
>> >>
>> >> If SSE=0, ssamoswap is illegal instruction exception.
>> >>
>> >> This patch implements shadow stack operations for qemu-user and shadow
>> >> stack is not protected.
>> >>
>> >> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> >> Co-developed-by: Jim Shu <jim.shu@sifive.com>
>> >> Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
>> >> ---
>> >>  target/riscv/cpu_bits.h                       |  2 +
>> >>  target/riscv/insn32.decode                    | 21 +++++-
>> >>  target/riscv/insn_trans/trans_rva.c.inc       | 39 ++++++++++
>> >>  target/riscv/insn_trans/trans_rvzicfiss.c.inc | 75 +++++++++++++++++++
>> >>  target/riscv/translate.c                      |  5 ++
>> >>  5 files changed, 140 insertions(+), 2 deletions(-)
>> >>  create mode 100644 target/riscv/insn_trans/trans_rvzicfiss.c.inc
>> >>
>> >>  # *** Zabhb Standard Extension ***
>> >>  amoswap_b  00001 . . ..... ..... 000 ..... 0101111 @atom_st
>> >> diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
>> >> index 9cf3ae8019..a2119393a6 100644
>> >> --- a/target/riscv/insn_trans/trans_rva.c.inc
>> >> +++ b/target/riscv/insn_trans/trans_rva.c.inc
>> >> @@ -114,6 +114,25 @@ static bool trans_amoswap_w(DisasContext *ctx, arg_amoswap_w *a)
>> >>      return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, MO_TESL);
>> >>  }
>> >>
>> >> +static bool trans_ssamoswap_w(DisasContext *ctx, arg_amoswap_w *a)
>> >> +{
>> >> +    REQUIRE_A_OR_ZAAMO(ctx);
>> >> +    if (!ctx->bcfi_enabled) {
>> >> +        return false;
>> >> +    }
>> >> +
>> >> +    TCGv dest = dest_gpr(ctx, a->rd);
>> >> +    TCGv src1, src2 = get_gpr(ctx, a->rs2, EXT_NONE);
>> >> +
>> >> +    decode_save_opc(ctx, RISCV_UW2_ALWAYS_STORE_AMO);
>> >> +    src1 = get_address(ctx, a->rs1, 0);
>> >> +
>> >> +    tcg_gen_atomic_xchg_tl(dest, src1, src2, SS_MMU_INDEX(ctx),
>> >> +                           (MO_ALIGN | MO_TESL));
>> >> +    gen_set_gpr(ctx, a->rd, dest);
>> >> +    return true;
>> >> +}
>> >> +
>> >>  static bool trans_amoadd_w(DisasContext *ctx, arg_amoadd_w *a)
>> >>  {
>> >>      REQUIRE_A_OR_ZAAMO(ctx);
>> >> @@ -183,6 +202,26 @@ static bool trans_amoswap_d(DisasContext *ctx, arg_amoswap_d *a)
>> >>      return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, MO_TEUQ);
>> >>  }
>> >>
>> >> +static bool trans_ssamoswap_d(DisasContext *ctx, arg_amoswap_w *a)
>> >> +{
>> >> +    REQUIRE_64BIT(ctx);
>> >> +    REQUIRE_A_OR_ZAAMO(ctx);
>> >> +    if (!ctx->bcfi_enabled) {
>> >> +        return false;
>> >> +    }
>> >> +
>> >> +    TCGv dest = dest_gpr(ctx, a->rd);
>> >> +    TCGv src1, src2 = get_gpr(ctx, a->rs2, EXT_NONE);
>> >> +
>> >> +    decode_save_opc(ctx, RISCV_UW2_ALWAYS_STORE_AMO);
>> >> +    src1 = get_address(ctx, a->rs1, 0);
>> >> +
>> >> +    tcg_gen_atomic_xchg_tl(dest, src1, src2, SS_MMU_INDEX(ctx),
>> >> +                           (MO_ALIGN | MO_TESQ));
>> >> +    gen_set_gpr(ctx, a->rd, dest);
>> >> +    return true;
>> >> +}
>> >
>> >Why aren't these in the rvzicfiss file?
>>
>> `ssamoswap` encodings are coming from (reserved) AMO encodings (and not zimop)
>> That's why kept it in trans_rva
>
>But the instructions are defined in the rvzicfiss extension, so I feel
>it makes sense to include them there

Ok noted.
I'll wait for a day or two. If there are not objections from anyone else, I'll move
them to rvzicfiss.

>
>Alistair
>
>>
>> >
>> >Otherwise:
>> >
>> >Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> >
>> >Alistair
>> >
>> >> +
>> >>  static bool trans_amoadd_d(DisasContext *ctx, arg_amoadd_d *a)
>> >>  {

