Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EEACD6E55
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 03:09:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTt1j-0007PG-IW; Sun, 31 May 2026 23:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTt1h-0007O9-Kf
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 23:09:17 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTt1f-0004Yq-VJ
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 23:09:17 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-68be16c61d1so4859129a12.2
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 20:09:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780283354; cv=none;
 d=google.com; s=arc-20240605;
 b=DRKL7ZAXJnupQSRWwvY4kb+MbgFygBXckVRpb5UXU4iX9SwvRzok5hAaSN2IzR6hX4
 XSytjFnV5RBoDbKOZO6KX3TzX8Qx6S22Q47wfsb8iuvW00ZYXJKIRg25E/zlsLi1mVuw
 UW+61Sb4wslRkFPPJ4OuLKvgnJtVYMubuNE6etjwzfsKIlwvxHsCX06sksoaJVszHb49
 v9OuPAl1fUb+fshSVfHW04QnbNN2FWkyINxAOQiTfUJF/Oe4VMNe4EU5+Armjmh89UvS
 mpUX1ODhbJ4VRa1Jjb8+JI1YYpcMCwYDIsTqqauQsBZmIGh2IPk+P34EUzAVNKheY9AN
 aPRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=n4sbSR2xC6UUdTGOGPF+IffDjA0MczriSf99ZJRi3X0=;
 fh=k6K/99/gbC35cg1rcjRVesdDJsd+ZkA6u+UeViyCR4I=;
 b=cfI+y9ne2/6Rw/Ya3k0GbdntaDuJUqKi3QfFyikEgDTF6YKtFKxw1TXKAV52eUS6lB
 TlbQe/ZH0QMZwFEsN1Vty2H8h3wKqKZ1bfQWRJOgjfcf5wQox8dAszHw+6Eq5k0tv89P
 a4vrj0UMicesx1GSfgok/iQRXIF6KJcBFxh8gXyBv+LYxJ+RVU605FUYbypjYIr2upGv
 6stuG2CNMvmgI9GxEX874IzLAYLLScRiBJuXsnJwa4EmeCHhdkhhMI8sCpZQ1urV//uS
 ulL3D32+1HrWe6IB9le2LxyaQhoB4ly5Z+yybkVcJpKZWcJh8RbffHIAQthaKcueSgoC
 DZBQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780283354; x=1780888154; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n4sbSR2xC6UUdTGOGPF+IffDjA0MczriSf99ZJRi3X0=;
 b=q84Pbz+Ojf0foHqrAvenV4i6FH3t5fXxZ/nETTc8Nvb18mm9Qm3msC3WUYtEDYBb3X
 KKubcOgVJ2vB939xX1p7BR/4T1QiaDsmzxG1vVVe9+CJl0/01D+CZUjBimlQkal8vpUi
 hCXhdAJ1+9gxqFS2LRxiwkH5kLnw3r1hj39t2q2obzV9pHJAG6yLJ6zqdvdCBPyLqP2H
 VMOsnNoUVV2zpTnMlPzw5WW3fezciGqYd+VMAFVE1iUBK4XmicCYZW6adfu5/T/yMad9
 XoYBMrNG6e2zed2S/lLljIjLggwPOJ2zKW8G2xqtWib1faqT3cnPC/SBN7jXqtglZEsB
 Ihtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780283354; x=1780888154;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=n4sbSR2xC6UUdTGOGPF+IffDjA0MczriSf99ZJRi3X0=;
 b=KCOWmsS29FkIgkUdxFqvB9JWukp7GtRc/1/lWwUED3WT57YgYIXsQBVODs9yln2pSO
 RW/8A/xkJ5QCIzvviCWK4z9VCCUBH/WuZkV1tjRRak2dqyy8LtAh3y+Q+Bk9ujfELj4j
 v8jLdd9C1jfjU3hameP3AqmCIRNPx1JukhKGILxwCx7OOPms1Jh9NghVuamytJCxiHML
 v2EHcH+McLVENSPlPiJhR+tpJMivzShRm4hBOerZD7T8fGZWk8gZmgTIFZVJC0PYVD7/
 Kx+OLVOtHkFPaHR6HbIUxU/tC6JAhLRe9WfXkTEjspFfYyI0WadbNBNTWicfEUTXsD26
 nEpQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+RyJ4kqkCOeCkazp33kkP77jA1K+ms4/YwOBxqVXtI9yv5y6PXNwg6nsGCqb1G/3YWHYlLHh4+H6gK@nongnu.org
X-Gm-Message-State: AOJu0YxkPaZ9jP5dkMlSD0fXldY+BSgVuCL3kfifVWNcGqItWXkLDwTW
 hpyxKlfigLXqcUumH15DimsfiIvJk9d/IDyh/h8iJbc400QW3AI8lqNftxK/REBl3Ih6UtsOFzN
 YVYTSKzL+l8QGNf5FMwCvL5ieVpDH0JQ=
X-Gm-Gg: Acq92OHFxcNSPnjlemzmPESeEya1EIUwL/w+iBkXLqbjFIwglNeCCKAhR2bjjh52c03
 GCvA5hpnONzoKsTUGp43xHtSm0ZhpUhgkQ2Ob3DQNEIRkiBD3M0hRbZkqlKY3bC4gKYKWy4zz4L
 HogveWlRV3PP/sYdJjN87xSzLwj8O9fLPW4/ZRaOfXkOhRlgHU2QLZdqFHTmSfg/ZRr8Gan/cTj
 ZLM4sR6G5z7W7NOTqFx21Dx/DH2dm9E6IFdwWuCIhTh7vOrfpVLZ/viyq06IvCRZk3/m9mN/sTY
 Zn6i3GPAK7U72fkYYCm9X4cVoPVbFW3YW1GoX7RrPjTVDj0c
X-Received: by 2002:a17:907:1dc7:b0:bec:929b:cee6 with SMTP id
 a640c23a62f3a-bec929bd40bmr141662666b.20.1780283353776; Sun, 31 May 2026
 20:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260527200355.2068879-1-daniel.barboza@oss.qualcomm.com>
 <20260527200355.2068879-2-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260527200355.2068879-2-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Jun 2026 13:08:46 +1000
X-Gm-Features: AVHnY4LGYH77SdW-Q81ino76eRCbfO5-aUZoEUlHxUGh2FWBaMDE6gnhCm2yQ68
Message-ID: <CAKmqyKPAVkCfjcN6kyLTu_EVkU35k3T85qM99MGaw7qVHoqzHw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] disas/riscv.c: fix inst_length()
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52d.google.com
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

On Thu, May 28, 2026 at 6:05=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> inst_length() can return 0 if 'inst' happens to not match any known
> encoding (like [1]).  Returning 0 is not desirable, even for unknown
> encodings, given that it will cause a loop in target_disas() later on.
>
> The most recent version of the RISC-V unpriv spec ditched the
> sophisticated instruction-length encoding.  We're now supporting only
> 16-bit and 32-bit length instructions, where:
>
> "All the 32-bit instructions in the base ISA have their lowest two bits
> set to 11.  The optional compressed 16-bit instruction-set extensions
> have their lowest two bits equal to 00, 01, or 10."
>
> So the code is now simpler, never returning 0, and in fact it's the same
> thing we're already doing in insn_len() from target/riscv/internals.h.
> Due to include shenarigans we can't use that function in disas/riscv.c,
> but I believe we can cut ourselves some slack this time and not lose
> sleep over a 1 line of duplicated logic.  We're documenting it though!
>
> [1] https://gitlab.com/qemu-project/qemu/-/work_items/3479
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3479
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.c | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index d416a4d6b3..fbdb24fcea 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -5057,26 +5057,10 @@ static bool check_constraints(rv_decode *dec, con=
st rvc_constraint *c)
>      return true;
>  }
>
> -/* instruction length */
> -
> +/* Same as insn_len() from target/riscv/internals.h */
>  static size_t inst_length(rv_inst inst)
>  {
> -    /* NOTE: supports maximum instruction size of 64-bits */
> -
> -    /*
> -     * instruction length coding
> -     *
> -     *      aa - 16 bit aa !=3D 11
> -     *   bbb11 - 32 bit bbb !=3D 111
> -     *  011111 - 48 bit
> -     * 0111111 - 64 bit
> -     */
> -
> -    return (inst &      0b11) !=3D 0b11      ? 2
> -         : (inst &   0b11100) !=3D 0b11100   ? 4
> -         : (inst &  0b111111) =3D=3D 0b011111  ? 6
> -         : (inst & 0b1111111) =3D=3D 0b0111111 ? 8
> -         : 0;
> +    return (inst & 3) =3D=3D 3 ? 4 : 2;
>  }
>
>  /* format instruction */
> --
> 2.43.0
>
>

