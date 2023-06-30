Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05A7EB64DA
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 09:56:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFArO-00081N-6e; Fri, 30 Jun 2023 05:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1qFArL-0007lG-9M
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 05:56:11 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1qFArH-0004L2-Bu
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 05:56:11 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-313f61890fbso1823311f8f.3
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 02:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1688118964; x=1690710964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tvV1xbzdJ1qrB8VSQ3beecMlFs7an2DDX2DOuueZ974=;
 b=sfZTLCJx7HQjm/MErluQfHVrznItAjiFvcll+3hkrEZJsexQgbkbnoYUUtjl1Q9RMy
 D1RY93cvuEI9G/h5+r6TfNs4siCVpGevbr2QNMI02IeLFcqisVFCb6pBclafYz1YSpaA
 mVQSRJAwP803T8r4Uv0LAO2xC3FW3lU8v/8JA9xoDFSm9gAyBuadBQwBgqYyq3kaWVus
 5bh8q1hVaBhOOPQTz7K8UtCFrgF0xqZAXXzLrTYw8KXG+tDmaS516b+LsWx0dJnfw25P
 rXqOC4LwY5bdSC3W4k0x7oOodpA27qZovfKhNzaXT1pQbyr+qD3Fx7FguBGnMZ3yXpiE
 7cjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688118964; x=1690710964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tvV1xbzdJ1qrB8VSQ3beecMlFs7an2DDX2DOuueZ974=;
 b=TxqzzmsAeZHeJSdK6dsDSmLX9WyrmE1kkYI8ypYklgephjQidFf9euwpb8qHGLDPZF
 eKHid0dpbOdboJANKuGsz1v5ytPW6PqOUBKmXzRh9zZYMhD+R/YWF7dgIL4s0ILtjR5Z
 2Oyd0UxP3BAjboB1/yBWekZn4tLWM0fiPny7+7IXf4zuIR6LSCgrn/FqWZkMHi/WYGkf
 0WuCmuZRqewEpaF3gurmi9513oruXUH7Ms8559gD2cbTnQtl+hJrGdZ924QsRhM8iYvI
 b1fVmq80ykdIWnN7cwCIbDjAn9sBFvRdnzb65J6mjYW3hajx2lzX9M6iNfSYfAoVsZH1
 ZWGg==
X-Gm-Message-State: ABy/qLYE2NAQsS2ofEarVgiJ+2wbin/pqwTaIqGbDM6TrwBUn1pcijYt
 LJhauepPLVAGug2iTtaXmdtSNOu1l9Wq/5fEL6Oqhw==
X-Google-Smtp-Source: APBJJlEYb+0M0xHbM0J0tFDrD0+cD5nFicDie80WQsIjg/IHH2h7sM2nAEIyPKtV3m+oYeRZfRuvtEGAEaugKf10zdU=
X-Received: by 2002:adf:fec3:0:b0:314:1318:18b7 with SMTP id
 q3-20020adffec3000000b00314131818b7mr1348020wrs.19.1688118964430; Fri, 30 Jun
 2023 02:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230630091303.1676486-1-christoph.muellner@vrull.eu>
 <20230630091303.1676486-3-christoph.muellner@vrull.eu>
 <599e9042-4e58-d468-940c-f8a8ee1edf5d@linaro.org>
In-Reply-To: <599e9042-4e58-d468-940c-f8a8ee1edf5d@linaro.org>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Fri, 30 Jun 2023 11:55:51 +0200
Message-ID: <CAEg0e7gYqFy5PjH9=HL6GTnyMTy4mzRHdeEU1AsvsR2a__XVcA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] target/riscv: Use float64_to_int64_modulo for
 fcvtmod.w.d
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jeff Law <jeffreyalaw@gmail.com>, Tsukasa OI <research_trasio@irq.a4lg.com>, 
 liweiwei@iscas.ac.cn, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Rob Bradford <rbradford@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Jun 30, 2023 at 11:22=E2=80=AFAM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/30/23 11:13, Christoph Muellner wrote:
> > From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> >
> > For the most part we can use the new generic routine,
> > though exceptions need some post-processing.
> >
> > Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> > ---
> >   target/riscv/fpu_helper.c | 78 ++++++++++++++------------------------=
-
> >   1 file changed, 27 insertions(+), 51 deletions(-)
> >
> > diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> > index 289b3bbea5..0f897cf072 100644
> > --- a/target/riscv/fpu_helper.c
> > +++ b/target/riscv/fpu_helper.c
> > @@ -482,70 +482,46 @@ target_ulong helper_fcvt_w_d(CPURISCVState *env, =
uint64_t frs1)
> >       return float64_to_int32(frs1, &env->fp_status);
> >   }
> >
> > +/* T floating (double) */
> > +static inline float64 t_to_float64(uint64_t a)
> > +{
> > +    /* Memory format is the same as float64 */
> > +    CPU_DoubleU r;
> > +    r.ll =3D a;
> > +    return r.d;
> > +}
>
> You don't need this.  Nor does Alpha anymore, come to that.
> float64 is uint64_t now, always.

Ok.

>
> > +    int64_t ret;
> > +    int32_t ret32;
> > +    uint32_t e_old, e_new;
> > +    float64 fvalue;
> > +
> > +    e_old =3D get_float_exception_flags(status);
> > +    set_float_exception_flags(0, status);
> > +    fvalue =3D t_to_float64(value);
> > +    ret =3D float64_to_int32_modulo(fvalue, float_round_to_zero, statu=
s);
> > +    e_new =3D get_float_exception_flags(status);
> > +
> > +    /* Map the flags to the specified ones. */
> > +    if (e_new & float_flag_inexact) {
> > +        e_new =3D float_flag_inexact;
> > +    } else if (e_new) {
> > +        e_new =3D float_flag_invalid;
> >       }
>
> Why?  Generic code will not set both inexact and invalid.
> So this is a nop.
>
> Removing that, all of your fp flags handling can go away.

I added that because float64_to_int32_modulo() might also set
float_flag_invalid_cvti. I just realized that it is not needed,
because riscv_cpu_get_fflags() takes care to not expose
flags that are not defined for RISC-V.

>
>
> >       /* Truncate to 32-bits. */
> > -    int32_t ret32 =3D (int32_t)ret;
> > +    ret32 =3D (int32_t)ret;
> >
> >       /* If the truncation drops bits then raise NV. */
> >       if ((uint64_t)ret32 !=3D ret)
>
> This will never fail, because you used float64_to_int32_modulo, which alr=
eady returns int32_t.
>
> But we have already raised invalid for overflow, so this can go away as w=
ell.

Understood.

>
> Finally, this patch must be merged with the previous, which introduced th=
is function.

Ok.

Thanks!

>
>
> r~

