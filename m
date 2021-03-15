Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lLupw-00045T-99
	for mharc-qemu-riscv@gnu.org; Mon, 15 Mar 2021 17:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lLupu-00044O-Ao; Mon, 15 Mar 2021 17:33:14 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:33707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lLupr-00007o-GZ; Mon, 15 Mar 2021 17:33:14 -0400
Received: by mail-io1-xd36.google.com with SMTP id n132so35026143iod.0;
 Mon, 15 Mar 2021 14:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m/g04en+hhyTnTyDfBOUj6r/J0kdyvoQNe8PMgCmqfE=;
 b=BNR0ya91s6wyNBf6LnvGu1CoWiXq+cFPBlcR3nR5932NLoDW3PytHvIAPB+PGSaV/b
 muBDvgtHz00niviBkay+36dHjttsBOFaNHlp9Jw5thDzQ/pSCsY0PMqc6f73uwe4+OPX
 5ZLy5kglJL6GRvLhayxiDLoJd/dR2RAxUVLid32e906NZWwitV01ChQ4M3TbjkV2v1LV
 cHg6SKYOFN+90sQtQravz+WffX9K9QMy7lKzYQg/ToLfT618voJgka1jJoZCMbzF5fZy
 kxNmwKDC0kJnw7Ki/HDVb/swgHdRYxzq7IWSl3G4RbafTjRt5lDpU81SLNEOtaUfdqXp
 iV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m/g04en+hhyTnTyDfBOUj6r/J0kdyvoQNe8PMgCmqfE=;
 b=udDNQtKKSbF2kPtQ4wHJogMClD41CnmP/rmmwvl8CVttHA0kk1XYvX3fl7MfttIunX
 GE18WSBFunPhDa6V+N7imoucOATkTlc4Sdoy0RzuUYc6nW1aKYOAKuSfQtfH/k9Yn9ld
 YZTlNfHHdSB4GwECoV8IR0N+OYYP5eLwOXjENjrH6eFvlgjEZ6G24Yon1Qz6yj4ubjTN
 1qRLmP6uI8VpFxR4esak0mQFasNTG/lzMkltp8MSgs6BXNJHoS9cxk9BtbCXjexhSMgQ
 X9xqmLrb0chzSXs2Ca+Ou7/aQ/J3jkRHBV9i2Yr65RbsPVFLyH4MjSRgjSw5eUxI//hE
 j6CQ==
X-Gm-Message-State: AOAM532utmjDwnfl95FJs67y8XzzZjLFV/IHzSkE6370TPu+sGryxLB1
 Zv/OvnCRY/pVAG3JikLcmxfdsz1UPKuLMTX1oThp+28oEMM=
X-Google-Smtp-Source: ABdhPJzUOqBiEaxiTtKyG5DjqLQOlDGi2xiaXOIfnDw0lQwTiRJtoDqHQ0Epl+M3pLfXP9Ysl7B9kAboDZZoW9w7lwA=
X-Received: by 2002:a02:94cb:: with SMTP id x69mr11684466jah.8.1615843990226; 
 Mon, 15 Mar 2021 14:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-10-zhiwei_liu@c-sky.com>
In-Reply-To: <20210212150256.885-10-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Mar 2021 17:31:34 -0400
Message-ID: <CAKmqyKP73df-3LBbmocPtK=irHmhQwyxAV1+4ZqEJCVPOq7zgw@mail.gmail.com>
Subject: Re: [PATCH 09/38] target/riscv: SIMD 8-bit Compare Instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Mon, 15 Mar 2021 21:33:14 -0000

On Fri, Feb 12, 2021 at 10:22 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |  6 ++++
>  target/riscv/insn32.decode              |  6 ++++
>  target/riscv/insn_trans/trans_rvp.c.inc |  7 ++++
>  target/riscv/packed_helper.c            | 46 +++++++++++++++++++++++++
>  4 files changed, 65 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index f41f9acccc..4d9c36609c 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1208,3 +1208,9 @@ DEF_HELPER_3(scmplt16, tl, env, tl, tl)
>  DEF_HELPER_3(scmple16, tl, env, tl, tl)
>  DEF_HELPER_3(ucmplt16, tl, env, tl, tl)
>  DEF_HELPER_3(ucmple16, tl, env, tl, tl)
> +
> +DEF_HELPER_3(cmpeq8, tl, env, tl, tl)
> +DEF_HELPER_3(scmplt8, tl, env, tl, tl)
> +DEF_HELPER_3(scmple8, tl, env, tl, tl)
> +DEF_HELPER_3(ucmplt8, tl, env, tl, tl)
> +DEF_HELPER_3(ucmple8, tl, env, tl, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index f3cd508396..7519df7e20 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -675,3 +675,9 @@ scmplt16   0000110  ..... ..... 000 ..... 1111111 @r
>  scmple16   0001110  ..... ..... 000 ..... 1111111 @r
>  ucmplt16   0010110  ..... ..... 000 ..... 1111111 @r
>  ucmple16   0011110  ..... ..... 000 ..... 1111111 @r
> +
> +cmpeq8     0100111  ..... ..... 000 ..... 1111111 @r
> +scmplt8    0000111  ..... ..... 000 ..... 1111111 @r
> +scmple8    0001111  ..... ..... 000 ..... 1111111 @r
> +ucmplt8    0010111  ..... ..... 000 ..... 1111111 @r
> +ucmple8    0011111  ..... ..... 000 ..... 1111111 @r
> diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
> index 6438dfb776..6eb9e83c6f 100644
> --- a/target/riscv/insn_trans/trans_rvp.c.inc
> +++ b/target/riscv/insn_trans/trans_rvp.c.inc
> @@ -376,3 +376,10 @@ GEN_RVP_R_OOL(scmplt16);
>  GEN_RVP_R_OOL(scmple16);
>  GEN_RVP_R_OOL(ucmplt16);
>  GEN_RVP_R_OOL(ucmple16);
> +
> +/* SIMD 8-bit Compare Instructions */
> +GEN_RVP_R_OOL(cmpeq8);
> +GEN_RVP_R_OOL(scmplt8);
> +GEN_RVP_R_OOL(scmple8);
> +GEN_RVP_R_OOL(ucmplt8);
> +GEN_RVP_R_OOL(ucmple8);
> diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
> index 30b916b5ad..ff86e015e4 100644
> --- a/target/riscv/packed_helper.c
> +++ b/target/riscv/packed_helper.c
> @@ -677,3 +677,49 @@ static inline void do_ucmple16(CPURISCVState *env, void *vd, void *va,
>  }
>
>  RVPR(ucmple16, 1, 2);
> +
> +/* SIMD 8-bit Compare Instructions */
> +static inline void do_cmpeq8(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    uint8_t *d = vd, *a = va, *b = vb;
> +    d[i] = (a[i] == b[i]) ? 0xff : 0x0;
> +}
> +
> +RVPR(cmpeq8, 1, 1);
> +
> +static inline void do_scmplt8(CPURISCVState *env, void *vd, void *va,
> +                               void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va, *b = vb;
> +    d[i] = (a[i] < b[i]) ? 0xff : 0x0;
> +}
> +
> +RVPR(scmplt8, 1, 1);
> +
> +static inline void do_scmple8(CPURISCVState *env, void *vd, void *va,
> +                               void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va, *b = vb;
> +    d[i] = (a[i] <= b[i]) ? 0xff : 0x0;
> +}
> +
> +RVPR(scmple8, 1, 1);
> +
> +static inline void do_ucmplt8(CPURISCVState *env, void *vd, void *va,
> +                               void *vb, uint8_t i)
> +{
> +    uint8_t *d = vd, *a = va, *b = vb;
> +    d[i] = (a[i] < b[i]) ? 0xff : 0x0;
> +}
> +
> +RVPR(ucmplt8, 1, 1);
> +
> +static inline void do_ucmple8(CPURISCVState *env, void *vd, void *va,
> +                               void *vb, uint8_t i)
> +{
> +    uint8_t *d = vd, *a = va, *b = vb;
> +    d[i] = (a[i] <= b[i]) ? 0xff : 0x0;
> +}
> +
> +RVPR(ucmple8, 1, 1);
> --
> 2.17.1
>

