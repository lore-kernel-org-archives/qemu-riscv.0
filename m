Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05A2CD6E57
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 01:08:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wUa5k-0007jj-Td; Tue, 02 Jun 2026 21:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wUa5e-0007jQ-6a
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 21:08:15 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wUa5c-0001OO-Ny
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 21:08:13 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-beeba001887so285768766b.3
 for <qemu-riscv@nongnu.org>; Tue, 02 Jun 2026 18:08:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780448891; cv=none;
 d=google.com; s=arc-20240605;
 b=hBejjY+vDnWnfN10TelBqsCZ5eQYYYd+hj92gc5zvn9kMRzDMnUGUO25SAPWT9QTXD
 ZupQXSyALWFo0G5VyAwukApMbWILZfHaQHR35z2TQlD6ogwYVN0PxXK9MUpqd+afdoFf
 nBz/ny5kZsjPWHRpTgB/yqFBpi3ctKQgqvqzuP03aBGCD3oJkNfzl0DEDsqPUyTkZh0k
 hQb6WQ1mrsMct6G4GEjRGtMtyNa3X1fqKX8lNLu88eiWhvCxQ6g9Iprr1DFcSccr8GcP
 h14FOUwHad1w+rEYRZ3mgibSWTqpDbSPimqnkO4F09vZkMp5JD7FNz+e+ttNCdeihYtw
 +0Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=/A0gDiDTrxy+ELN91nEDe4UfA59Q+zNnrMTKM/ccYRE=;
 fh=hV0xO0LxL7fDyJxlCRSSl8TiVyw+/gOmbmC9sXOua5Y=;
 b=BZR4eJRxFoVJaA/AQ5cXyJESdWJLQ6+0wrYZVS+Kds+g+RLPUxAQM8ZCynk8w8j4B+
 WYkvlr53esfaVu46RY5hXuvmFaO6zTUUcB0p+TzQ1RDnl7O2dXW0xzIQgyewmUqDM5+Y
 km8FgnWvvpkDP3SLKdLAJkYJGaxx85Qk3psrrPrIZ+j773Cc2ddggDhKC11yRf/JL+i/
 ltFlgLG3bF6NMwOsWbgzartP79Xka+yNSTst5FWMrv5pnMm7B/95yOI83771xB48SAhG
 O3ngAD+zf+M9GAiHXGqM4ODI0u8xmCMvn2YaIWc0A9HioVtSxodJBsdgYe1OZCRPmMp2
 fnRg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780448891; x=1781053691; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/A0gDiDTrxy+ELN91nEDe4UfA59Q+zNnrMTKM/ccYRE=;
 b=eLqIU8Rm/hIpK9ebW//4LbI0BfJmmpETmh9k0x3HFAnAOG7r7zpOLxoCwEWHybeJ8D
 uarnM7uE+LuNDcT93iYEOM0TgO/TswcAso+rWB7SPutJWqeaySjWja8Z+BLpuDyZY9Cx
 09RqEZdbHmkHA6vwOTFBXNnkKa61P2DhjFll6GKzSHgyGVoVs72ExhvnBpcg2eLxxjnd
 Atwt1sLLNyMKTsovDnekvxIKpu/dHoJhGw3Cgn8A6RnBU43gnVI/ktzPZCVoxl79nktA
 FjmpxVcdlKIopF6EOIlHfYcL3ZoRkirIfePc8bpL+n+DiXyBOnbprvW89JasodLdrYIA
 do4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780448891; x=1781053691;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/A0gDiDTrxy+ELN91nEDe4UfA59Q+zNnrMTKM/ccYRE=;
 b=PlxLN8g0XHLeXJZN8IWAsJpqBi6cvaEM3qAUSgi+eJ1nQTrCOjmpn2Rc1sEdPselcs
 7zlxi+FzxOHnQqbbRPcZq13HPu85I+b2Sp1s/0lh7Reolxfj4fPDy4ildivAb0yUv+i+
 bf4JRRnVBpJUzAjTnoPgerFpwl+M9BeINKlTD9z/HAN6Ez0a6OVvTai8Ye7ddmY/CHok
 EZuRF+mXl7n85ZdjHIQpeGrU0ErZ5/hERo41CzRBBJe9CM4qcItTG3h4DoP7gZz/hLy0
 M6t7BWT1CGEtscdqf3Tux0xNc6deDwjF9newfvoGbZ1ffC6L8lRojb9x/pOyKSUZJmWE
 wQvA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8eRMYbh52PSs02QdhVxI7n8D10/d3bIrFHFW+zCIBObiYJcr+ZY6wqBnCpAfE5edbWYjzrNTNEO0ND@nongnu.org
X-Gm-Message-State: AOJu0YzHpcn0E4swRjP6N67/KugWIs0QtroNz3HT2DjnLabbPUk0hiCC
 H759UbKLzefr84o/UoWwlR+NU473FxleQIHuOjZ4cfAHrW+WgfugSwmM73XXI5u/tvkSYydsXDG
 crs/Yu+p1I1xsEB3XNMsxbETMH16otVA=
X-Gm-Gg: Acq92OF9lN/2YuUB3TuTVIU+y3ORGvZMHIfU+Wi3UkERpU2g2HU8MtrVM3hCEUhDLBU
 ueWx72x+VojRihKSr9DkvschSWtD7J2SI0PE3ZIFkIO64zqBJ+w3gX4iXT7LiEcq4Drsgoqh0pa
 PzSlMD4vNyFPLwgtMzZttFH9FaxCl9UfWCKE9kebp9CiUxKdRb/yZcwDSFBtPimPaZXKuML+eNy
 7z515IMV7l7U7/xyWzmeMyRcIewJ9fa7QK1ccrIQ+9Vauk+vE5aE84RwvMkNLN2/zLwjs/YubJx
 lIl/nkH83tgCFAPH0uhWDyYS06mwbOnspVup4H8IeKR2WE2B1Kdqcy9F0jw=
X-Received: by 2002:a17:907:c817:b0:bdd:45d9:8e15 with SMTP id
 a640c23a62f3a-bf0b11db134mr39472166b.15.1780448891164; Tue, 02 Jun 2026
 18:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260528060007.717307-1-frank.chang@sifive.com>
In-Reply-To: <20260528060007.717307-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Jun 2026 11:07:44 +1000
X-Gm-Features: AVHnY4Id9ajuVJ-Y1HF3dLhkuxHo0F6t0WT71060Br0CTNOIVDd8frotZI-PIHo
Message-ID: <CAKmqyKMuG69C_nT2euOc4rWp85pbgzyxjwEh+c1DRmYBgSvgJQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Reorder Smrnmi CPU fields above CPU reset
 line
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x630.google.com
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

On Thu, May 28, 2026 at 4:01=E2=80=AFPM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Smrnmi CPU fields introduced by commit: #5db557f should be reset when
> the CPU resets, so move these fields above the CPU reset line.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Fixes: 5db557f82bff ("target/riscv: Add Smrnmi CSRs")

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.h | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d9c1e000cb2..682c6e752cc 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -491,6 +491,15 @@ struct CPUArchState {
>      uint64_t hstateen[SMSTATEEN_MAX_COUNT];
>      uint64_t sstateen[SMSTATEEN_MAX_COUNT];
>      uint64_t henvcfg;
> +
> +    /* RNMI */
> +    uint64_t mnscratch;
> +    uint64_t mnepc;
> +    uint64_t mncause; /* mncause without bit XLEN-1 set to 1 */
> +    uint64_t mnstatus;
> +    uint64_t rnmip;
> +    uint64_t rnmi_irqvec;
> +    uint64_t rnmi_excpvec;
>  #endif
>
>      /* Fields from here on are preserved across CPU reset. */
> @@ -509,15 +518,6 @@ struct CPUArchState {
>      uint64_t kvm_timer_state;
>      uint64_t kvm_timer_frequency;
>  #endif /* CONFIG_KVM */
> -
> -    /* RNMI */
> -    uint64_t mnscratch;
> -    uint64_t mnepc;
> -    uint64_t mncause; /* mncause without bit XLEN-1 set to 1 */
> -    uint64_t mnstatus;
> -    uint64_t rnmip;
> -    uint64_t rnmi_irqvec;
> -    uint64_t rnmi_excpvec;
>  };
>
>  /*
> --
> 2.43.0
>
>

