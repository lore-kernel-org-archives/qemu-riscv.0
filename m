Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582F560A260A
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 09:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QyRHA9UM
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJouP-0001sP-Mk; Thu, 22 Oct 2026 05:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJouO-0001rv-VM
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 05:16:24 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJouM-00082a-Hq
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 05:16:24 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-8ab3d3c5761so14620487b3.1
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 02:16:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792660581; cv=none;
 d=google.com; s=arc-20260327;
 b=iNt2z0KL+g3BXW9Y0VuNwNnXd/6Ncm2rkhqx1DLEoB/rCNUDBRzSZJJv73+DuoRGXR
 Pj3GxzxhtaldyQiVWjZ+xZHqZ8M2lfSNoPQXGV4orwNCFL1bnVG3umDbAHtaxlSoQwWy
 ydufyZQ0aHmutKzGB0wCQMZ422lk8FscCwrgGb379IWtRUd+XsPtPjF5lSI9ODNfK2l5
 ajh/FnrGs+hhm9Sf5kbgouiJzhXDKZKxGEnFJc52qxpnhzfBxWC4oGexocfLHO/7eNJ8
 IwjietZr7lY2irv0HJ3le3SPMqnVLC0dVEwLEe2jyMDXSShlxTG+liDRQC32wRdH6/BK
 CEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=mkbYpg0DfpCAM2m6RewudVlfpB4h7QkVLCJ6/xXWLQ4=;
 fh=Xop42X+mwvn1QaW+ytJV+OVKJAO30e41eghT5dQz6qA=;
 b=BnhkOGs9oj/UQkoaLaS+VARKQML1dW7Rub8XJFmYp4mmPmu+6eoPHsUeoKjlR8PiCy
 eBlgVQbmD3n8DYg2ETdCW/vR0vvvWRBgiPv7o+MyKds2FGja8a1w7k9qxChHWCaE/tRA
 wYDFktUDUdMvoFuh6lvUC8oGeaYK6LQ2+VOAN9HsnB6onUa837GjfUX75uXI9GSsDP97
 n+F5zH0aJr1qchZuPoIZB7sRZhQUHtx1Vl6/WpMQRMQh+wGJZ1RvjQkneVPaCrFVHyti
 8xd5uyIKKF4+Bd2hXDy+yD+pPiWN7fxOxGTwG2A5Qz3TfyPPp+U8X0uWb+CXe7GXfHB1
 w2fQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792660580; x=1793265380; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=mkbYpg0DfpCAM2m6RewudVlfpB4h7QkVLCJ6/xXWLQ4=;
 b=QyRHA9UMgc2KtZrJP5AnUmmmOkd7QvoKCz2D24gHprhWgZNGeb9Ro6rPVK1d+iZkXf
 jYIJfx8mUmvWdNBAgfUkZ9XxsuIyUNGcEYldzEnPrg52nBRUR4paiNMYKfN+LUUYzi0W
 78YjKll0XCTFRlkXESvV0okAVpQf2EyvDSUFeKkoxWPevyQ7VZ/169M+e5CM0EI2em3b
 lMeMEDmdV0i+ybrwHSVmVtyWOiEh/Cum/xgsrD9CSfpRzy/C1G31lHuGhhmNpfVXVHsJ
 UCgUHmmBVtV4UshnlCiNkIGaibDYMP2pM5HdJoaJlHtIPg9XvZ4eJmGZ0he1y2kYl7wt
 LKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792660580; x=1793265380;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mkbYpg0DfpCAM2m6RewudVlfpB4h7QkVLCJ6/xXWLQ4=;
 b=Wche5PvtU11tsphRgEV9PCehlmTaDN5NoLwHG5q9K5Hz948DBuvUYohfvmGBYv7TzV
 TzFjEKeZg/nDl40izcSDnsVaKurr0NdUBgDeB5hnydsibKsR/ER7Y/fx5VHzcZTsYjVD
 ORIPvAepwVjBOx3EzUiBymagFRFBYb0QzcE0yr1KzRABeaZeUdA6GQgeQejrFCLndr7q
 rcQcxpXp/JZJUsQGSBZn9w1jDjqNAMztycVo/qEwK1KWg0E8MyN/pemOWuWw3KMqEC+C
 UChipZderXltJyZYHqtC8XDpr1TUT3OsWgfVTtpunTCsgwaJP/AV4OEg0rCzeaXjgpy8
 jCkA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwRKJe6/AwA1nxLyqlBHTT8jbDV0A+3WeVtdLcWk61bMnLgqC7VynapopDbb672ws2vwqjYrBmYsmDq@nongnu.org
X-Gm-Message-State: AFq9FYL94rjzUls4HwVYvUFOZ6Z+UkcEtSB4JgtCzvhGTJsO29yEiIL7
 UZVc9tciL20Pa/FN6oFFQkiQ+yoBJP+RqQWVHPlEKy32whw/cw3NYqv73KGVhBl0BoYaaJXaQKJ
 f4oYHhGfB63+UMX7/tDd1KtJAufSTZfEc/mGAthn/7w==
X-Gm-Gg: AYBFou08SNpNvTtIHuit56m+MHkswFFVsW3M32abcbZgCDhglH1E4akDjKaU6tpxbiD
 8fX81k4EtQrZqmuLQG0rTyoLjd02YQwlBff3oVBmyXD3Pmmi5bGcN9aeQXirk+SZFcAswbCox0v
 eyclu5WES+1oFFe/PI+8HFaXdxnvh4rkQwCFfCpOD5AbrUWeejo1i+KPZyD4Uer6ytRi15v/SDM
 ojYleM8KnumWIQAM1vuUvNpre3r+WlqoWuuSuYETMMHZas/BGxz1uR+QxzKjwg538b+k/9PEzKN
 ZVDa29znU/2hgdR+QqH1/0lbtPzzNzkyI+XQX1BFIRNuvTltHTKOK1GWD+168oYDDz/zfQcvSI2
 EhQ7AXQ1zc4EroaoNYrzWoiYFu9TUtof01ob3f50F3p6BbBLzdKzVpOmWmoTVMBEPTPf+CnG8Hf
 4olj6EYn51K8AMeApsCVdg
X-Received: by 2002:a05:690c:4990:b0:8b0:97f5:a854 with SMTP id
 00721157ae682-8b133d5dcbdmr29819977b3.33.1792660580573; Thu, 22 Oct 2026
 02:16:20 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022075219.312757-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20261022075219.312757-2-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20261022075219.312757-2-frederic.petrot@univ-grenoble-alpes.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Oct 2026 10:16:09 +0100
X-Gm-Features: AclHuK_cBSGxKCrC9HQCH78B6uxeCiAolhZDOV5oNPU6IeIS-f2uVL5YsL30SvM
Message-ID: <CAFEAcA-rw1_a5q7jB_Rx3KoH2_aPE48odM_99kx+Tz_J_LYw_Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: fix pmp sanitize error for x-rv128
To: frederic.petrot@univ-grenoble-alpes.fr
Cc: daniel.barboza@oss.qualcomm.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 22 Oct 2026 at 08:52, <frederic.petrot@univ-grenoble-alpes.fr> wrot=
e:
>
> From: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes=
.fr>
>
> UndefinedBehaviorSanitizer reports an undefined behavior due to shifts
> larger than type in the handling of the pmp configuration registers for t=
he
> x-rv128 cpu.
> Adding an "i128" version for the functions accessing the pmpcfg registers
> to properly handle the 128-bit case.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>

> +Int128 pmpcfg_csr_read_i128(CPURISCVState *env, uint32_t reg_index)
> +{
> +    int i;
> +    Int128 cfg_val =3D 0;

I think you need "=3D int128_zero();" here, to avoid a compile
failure when Int128 is the struct type rather than the compiler's
native int128 type.

thanks
-- PMM

