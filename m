Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA78FC04A6A
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 10:46:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUPeV-0001J1-Qb; Fri, 11 Aug 2023 06:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUPeO-0001Gt-23
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 06:45:50 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUPeH-0002bd-0f
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 06:45:47 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-523100882f2so2309008a12.2
 for <qemu-riscv@nongnu.org>; Fri, 11 Aug 2023 03:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691750732; x=1692355532;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N2FvBgkiIdUsjB/FxaUZBa1ZB141qaGSBWUTFySHBvs=;
 b=blBPD6HD8/SYnvzrcjkchCddZQJyt0JDrSYgcCnx9gotMlBW5gmYWVLDWqOWZOWYFY
 4hG73rLMNShtzjl3af52L6v9ZVYsYoJSrZ40w+t/UnkXWMnG7QgJQfivV1eIS5RS9SjH
 4ybPMGh86PXphuatyJYmYTstWQMq/AA3NJnZeVG44zaVD69N0uhcZLZEN+1M1kZ8WHb2
 CJojja2Y5hhcFzEt+3FKykoeFC5uyibJ/IY7m4KnrdwOjOed4gfSBblXNL7xOFJkoPpu
 7YPiVeNih+VhGg0W3zb/w3gIor9ZeBhwvEa5B/8jHB0ChQ8lGyI4X29hBaNSk/3Np6Mg
 TvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691750732; x=1692355532;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N2FvBgkiIdUsjB/FxaUZBa1ZB141qaGSBWUTFySHBvs=;
 b=mAWgBuBPnhPex052hp1MdZCJJ377t3lhuO7Lkc5dK8Nic9cBo8PSMpwc7INOL1xUXg
 O06mt5l1VmWZgYnJAO2q6Afs7fczRocqk/pMAdJSHCeFZpDGDNZq/PFhQ66CTz23Ug11
 npB1UF3SRpijM3otR1GbXO0t3XX9Jz0++1PtDYD3uMSJKPDghb1aVkIW5qwyu9lMpLzQ
 AWHJuduHIUjYDpO412AR2kOelgjYB2pvLZhsvX4hotiByGFhG8KYfpQGJxaeoNuSKwWP
 wsZbfk0OKA9TVpP47aebal/9ZpuZ6F2YkJSK8jWyhcOX1jkqiTWWgtAiRaXJzd8ALqW/
 oYTQ==
X-Gm-Message-State: AOJu0YyVnqmfkzT9n9EOoZDnSxd9jFr23nbq3svAtE470E2/YbrlDh8Q
 0+PVN/SKALuH00r64SD6f8x9ZgMIslWEwcnyQYfSJQ==
X-Google-Smtp-Source: AGHT+IEnOfuB8VVchtq/CHXO+vYHLurhSNwuuYF759reM8xl+ubcoUpMoAN7Fh8aS42Jj0xIqMqyGWuje23MXxH+uZE=
X-Received: by 2002:aa7:c557:0:b0:522:cef7:83c3 with SMTP id
 s23-20020aa7c557000000b00522cef783c3mr1291540edr.8.1691750732278; Fri, 11 Aug
 2023 03:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-21-richard.henderson@linaro.org>
 <CAFEAcA-N-QWQXcHgMNnXTr+Bmf7fhdSKYQwS-kkWGdR+UHvT-Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-N-QWQXcHgMNnXTr+Bmf7fhdSKYQwS-kkWGdR+UHvT-Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 11:45:21 +0100
Message-ID: <CAFEAcA9xsPHOeorJvjfO7mrpX_TfYHMNcMHi3dyt41+CktyXsg@mail.gmail.com>
Subject: Re: [PATCH 20/24] tcg/i386: Add cf parameter to tcg_out_cmp
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On Fri, 11 Aug 2023 at 11:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 8 Aug 2023 at 04:13, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Add the parameter to avoid TEST and pass along to tgen_arithi.
> > All current users pass false.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  tcg/i386/tcg-target.c.inc | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> > index b88fc14afd..56549ff2a0 100644
> > --- a/tcg/i386/tcg-target.c.inc
> > +++ b/tcg/i386/tcg-target.c.inc
> > @@ -1418,15 +1418,15 @@ static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, bool small)
> >      }
> >  }
> >
> > -static void tcg_out_cmp(TCGContext *s, TCGArg arg1, TCGArg arg2,
> > -                        int const_arg2, int rexw)
> > +static void tcg_out_cmp(TCGContext *s, int rexw, TCGArg arg1, TCGArg arg2,
> > +                        int const_arg2, bool cf)
> >  {
> >      if (const_arg2) {
> > -        if (arg2 == 0) {
> > +        if (arg2 == 0 && !cf) {
> >              /* test r, r */
> >              tcg_out_modrm(s, OPC_TESTL + rexw, arg1, arg1);
> >          } else {
> > -            tgen_arithi(s, ARITH_CMP + rexw, arg1, arg2, 0);
> > +            tgen_arithi(s, ARITH_CMP + rexw, arg1, arg2, cf);
> >          }
> >      } else {
> >          tgen_arithr(s, ARITH_CMP + rexw, arg1, arg2);
>
> I don't really understand the motivation here.
> Why are some uses of this function fine with using the TEST
> insn, but some must avoid it? What does 'cf' stand for?
> A comment would help here if there isn't a clearer argument
> name available...

Looking at the following patch suggests perhaps:

/**
 * tcg_out_cmp: Emit a compare, setting the X, Y, Z flags accordingly.
 * @need_cf : true if the comparison must also set CF
 */

(fill in which XYZ flags you can rely on even if need_cf is false)

?

-- PMM

