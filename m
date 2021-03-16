Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMAtr-0000IS-Cu
	for mharc-qemu-riscv@gnu.org; Tue, 16 Mar 2021 10:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMAtk-0000D7-Qj; Tue, 16 Mar 2021 10:42:18 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:45257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMAtf-0004Qx-Cv; Tue, 16 Mar 2021 10:42:16 -0400
Received: by mail-io1-xd33.google.com with SMTP id a7so37375410iok.12;
 Tue, 16 Mar 2021 07:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ZI9hqrDGaCF2qFOuIrb0nvLLIXA959B0Uc2UNZBfR8=;
 b=ZeL2Hqe+XcK1qWxEVTDVETU75BL7HHHSrjd0bozda6kxDMhVocDZyVwtqGyaHd+/CZ
 6+cEladOKjWZ/jWoy8SY5Spex422s8AW0zpYOX9Rc7aVvCC+L9qO+XF3cNxEi609VG2c
 tU1/vrHpO/OqKl4/c+YkbURPH5NSAzvPlNya2o+8kOICZn0JZDPhJAz42ar3spf0e2iO
 OwfSbLVrHWGEPv20d3V/wE+h19d1NBff+lU/318pFcognXaO9Miy4arnS1fYTEquWj4M
 1kiPjCaI7RT4CiP1qaI4wyxZ6+IDhWkUeUuuDD6ZD9ZxNIV8RW7aQzXYmoIULu1YCLTW
 Xmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ZI9hqrDGaCF2qFOuIrb0nvLLIXA959B0Uc2UNZBfR8=;
 b=k/tHyxMU3vqUn6cP6j5aODNeC7eNxda/nMlabMxLeSNnMJgf5yBOV1oaFFZxa33uMn
 Nlguf66jqsu9VlmRBp05Zb/icCLL+bcNnKCJT9iaTABrzx+U4Rd6haf3D/T7BwBgMEsC
 7F7IvvjGOfBWbFTXThK6scuS7OHQWXI1mRqnw+ko70RueqAZ2vMqrqi3V9cj1XuTYbjL
 ePbP4jJINCEITcHXWn0Yj+ewC2j8+Q9E0+wO/b8hRL5nhrudhECCCFHb2cXmjVUX49V8
 PkNbimTikbXFnDp5hI2n500J+eMhUfrce8JeOiWfuQ/GVuy8xgqW/T/tvPjrT5URiPIm
 5ZDQ==
X-Gm-Message-State: AOAM532nIdha7b3Ph6/hDXRZlIwKbk5zuBn0wsEza8vYGIKP45kgEtoF
 +WPAmamo2X6+YYYWehf5IdsnC2jGGyBWGHS8VltfEqC/YVM=
X-Google-Smtp-Source: ABdhPJwu2A/waJXBotPgTcUBc4xvIWrws3ZLr9Tbm7DmxTO40ujyQxnzlwK53y3fWhJ3/7GsAcKynWgOSOPrVGAVexY=
X-Received: by 2002:a02:cc1b:: with SMTP id n27mr14328017jap.106.1615905729642; 
 Tue, 16 Mar 2021 07:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-15-zhiwei_liu@c-sky.com>
In-Reply-To: <20210212150256.885-15-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Mar 2021 10:40:33 -0400
Message-ID: <CAKmqyKP4H0SLPWw9d0qSOiErni-JQAXp-DNCuALUzCGy89AGFg@mail.gmail.com>
Subject: Re: [PATCH 14/38] target/riscv: 8-bit Unpacking Instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Tue, 16 Mar 2021 14:42:18 -0000

On Fri, Feb 12, 2021 at 10:32 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |  11 +++
>  target/riscv/insn32.decode              |  11 +++
>  target/riscv/insn_trans/trans_rvp.c.inc |  12 +++
>  target/riscv/packed_helper.c            | 121 ++++++++++++++++++++++++
>  4 files changed, 155 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 83778b532a..585905a689 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1252,3 +1252,14 @@ DEF_HELPER_2(clrs8, tl, env, tl)
>  DEF_HELPER_2(clz8, tl, env, tl)
>  DEF_HELPER_2(clo8, tl, env, tl)
>  DEF_HELPER_2(swap8, tl, env, tl)
> +
> +DEF_HELPER_2(sunpkd810, tl, env, tl)
> +DEF_HELPER_2(sunpkd820, tl, env, tl)
> +DEF_HELPER_2(sunpkd830, tl, env, tl)
> +DEF_HELPER_2(sunpkd831, tl, env, tl)
> +DEF_HELPER_2(sunpkd832, tl, env, tl)
> +DEF_HELPER_2(zunpkd810, tl, env, tl)
> +DEF_HELPER_2(zunpkd820, tl, env, tl)
> +DEF_HELPER_2(zunpkd830, tl, env, tl)
> +DEF_HELPER_2(zunpkd831, tl, env, tl)
> +DEF_HELPER_2(zunpkd832, tl, env, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index e158066353..fa4a02c9db 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -720,3 +720,14 @@ clrs8      1010111  00000 ..... 000 ..... 1111111 @r2
>  clz8       1010111  00001 ..... 000 ..... 1111111 @r2
>  clo8       1010111  00011 ..... 000 ..... 1111111 @r2
>  swap8      1010110  11000 ..... 000 ..... 1111111 @r2
> +
> +sunpkd810  1010110  01000 ..... 000 ..... 1111111 @r2
> +sunpkd820  1010110  01001 ..... 000 ..... 1111111 @r2
> +sunpkd830  1010110  01010 ..... 000 ..... 1111111 @r2
> +sunpkd831  1010110  01011 ..... 000 ..... 1111111 @r2
> +sunpkd832  1010110  10011 ..... 000 ..... 1111111 @r2
> +zunpkd810  1010110  01100 ..... 000 ..... 1111111 @r2
> +zunpkd820  1010110  01101 ..... 000 ..... 1111111 @r2
> +zunpkd830  1010110  01110 ..... 000 ..... 1111111 @r2
> +zunpkd831  1010110  01111 ..... 000 ..... 1111111 @r2
> +zunpkd832  1010110  10111 ..... 000 ..... 1111111 @r2
> diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
> index 5ad057d7ac..b69e964cb4 100644
> --- a/target/riscv/insn_trans/trans_rvp.c.inc
> +++ b/target/riscv/insn_trans/trans_rvp.c.inc
> @@ -499,3 +499,15 @@ GEN_RVP_R2_OOL(clrs8);
>  GEN_RVP_R2_OOL(clz8);
>  GEN_RVP_R2_OOL(clo8);
>  GEN_RVP_R2_OOL(swap8);
> +
> +/* 8-bit Unpacking Instructions */
> +GEN_RVP_R2_OOL(sunpkd810);
> +GEN_RVP_R2_OOL(sunpkd820);
> +GEN_RVP_R2_OOL(sunpkd830);
> +GEN_RVP_R2_OOL(sunpkd831);
> +GEN_RVP_R2_OOL(sunpkd832);
> +GEN_RVP_R2_OOL(zunpkd810);
> +GEN_RVP_R2_OOL(zunpkd820);
> +GEN_RVP_R2_OOL(zunpkd830);
> +GEN_RVP_R2_OOL(zunpkd831);
> +GEN_RVP_R2_OOL(zunpkd832);
> diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
> index be91d308e5..d0dcb692f5 100644
> --- a/target/riscv/packed_helper.c
> +++ b/target/riscv/packed_helper.c
> @@ -1202,3 +1202,124 @@ static inline void do_swap8(CPURISCVState *env, void *vd, void *va, uint8_t i)
>  }
>
>  RVPR2(swap8, 2, 1);
> +
> +/* 8-bit Unpacking Instructions */
> +static inline void
> +do_sunpkd810(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    int8_t *a = va;
> +    int16_t *d = vd;
> +
> +    d[H2(i / 2)] = a[H1(i)];
> +    d[H2(i / 2 + 1)] = a[H1(i + 1)];
> +}
> +
> +RVPR2(sunpkd810, 4, 1);
> +
> +static inline void
> +do_sunpkd820(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    int8_t *a = va;
> +    int16_t *d = vd;
> +
> +    d[H2(i / 2)] = a[H1(i)];
> +    d[H2(i / 2 + 1)] = a[H1(i + 2)];
> +}
> +
> +RVPR2(sunpkd820, 4, 1);
> +
> +static inline void
> +do_sunpkd830(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    int8_t *a = va;
> +    int16_t *d = vd;
> +
> +    d[H2(i / 2)] = a[H1(i)];
> +    d[H2(i / 2 + 1)] = a[H1(i + 3)];
> +}
> +
> +RVPR2(sunpkd830, 4, 1);
> +
> +static inline void
> +do_sunpkd831(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    int8_t *a = va;
> +    int16_t *d = vd;
> +
> +    d[H2(i / 2)] = a[H1(i) + 1];
> +    d[H2(i / 2 + 1)] = a[H1(i + 3)];
> +}
> +
> +RVPR2(sunpkd831, 4, 1);
> +
> +static inline void
> +do_sunpkd832(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    int8_t *a = va;
> +    int16_t *d = vd;
> +
> +    d[H2(i / 2)] = a[H1(i) + 2];
> +    d[H2(i / 2 + 1)] = a[H1(i + 3)];
> +}
> +
> +RVPR2(sunpkd832, 4, 1);
> +
> +static inline void
> +do_zunpkd810(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    uint8_t *a = va;
> +    uint16_t *d = vd;
> +
> +    d[H2(i / 2)] = a[H1(i)];
> +    d[H2(i / 2 + 1)] = a[H1(i + 1)];
> +}
> +
> +RVPR2(zunpkd810, 4, 1);
> +
> +static inline void
> +do_zunpkd820(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    uint8_t *a = va;
> +    uint16_t *d = vd;
> +
> +    d[H2(i / 2)] = a[H1(i)];
> +    d[H2(i / 2 + 1)] = a[H1(i + 2)];
> +}
> +
> +RVPR2(zunpkd820, 4, 1);
> +
> +static inline void
> +do_zunpkd830(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    uint8_t *a = va;
> +    uint16_t *d = vd;
> +
> +    d[H2(i / 2)] = a[H1(i)];
> +    d[H2(i / 2 + 1)] = a[H1(i + 3)];
> +}
> +
> +RVPR2(zunpkd830, 4, 1);
> +
> +static inline void
> +do_zunpkd831(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    uint8_t *a = va;
> +    uint16_t *d = vd;
> +
> +    d[H2(i / 2)] = a[H1(i) + 1];
> +    d[H2(i / 2 + 1)] = a[H1(i + 3)];
> +}
> +
> +RVPR2(zunpkd831, 4, 1);
> +
> +static inline void
> +do_zunpkd832(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    uint8_t *a = va;
> +    uint16_t *d = vd;
> +
> +    d[H2(i / 2)] = a[H1(i) + 2];
> +    d[H2(i / 2 + 1)] = a[H1(i + 3)];
> +}
> +
> +RVPR2(zunpkd832, 4, 1);
> --
> 2.17.1
>

