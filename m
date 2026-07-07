Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926BBC43458
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 04:13:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgxBE-0002oK-Eb; Tue, 07 Jul 2026 00:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgxBC-0002no-O4
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 00:13:06 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgxBB-0001Wh-9B
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 00:13:06 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-698aa8d4dafso3694852a12.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Jul 2026 21:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783397583; cv=none;
 d=google.com; s=arc-20260327;
 b=EA5uW9Korh2REwF5mueuzOByz8IlS2bohjhfXYyun4UWdt5rN0QgxzFsdZpze5oDgf
 c+NCx1eWV7wGjKuDrKhyUcsO+WzzdGfztEyS2Gs9Yt6eltPJjehDhEXF7v190aTkA/Ac
 dVTFGfTOQAqJSP0moUPlEbtVhu0JssVkmQ6deIauaiqjas+VJrIzu2gWAmb9MbpQpx11
 P+0gOivrE0gMxlRhbwGukj+xZkKOWNjKXsSs+NqVnUqXx3mSjwELfNDVp/og2PFiM1gc
 9IGMgb0YvokQm/JqVXGWC6hfrjC3qvDt4zdEtYMy+Znx3dW6LSZVpV5c6LDiSBS9MAoj
 Zudg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=qFyHEuJbiZnwi15luGVMLUH15sNsiwcdRKnHqR67fzE=;
 fh=mMbPNVJqN8tTZfoeiKI4kgO+tgCk8Pvx8O/sj104MlU=;
 b=XOVptA5pzOvxlI7u78pezln46JljyfPUrrwyl7W0K7sfEUlJ8u719iWT2oAWHSXz+K
 zzJRm7jsul+1317izUxDoDjiMsYACYzSPyf+k6ErBk2JgopaDWcre+tbaFvikP0z4qqK
 9k3mG8VmAs/JoI9l6sRreK0DJfrnVTGD6w69bOhhwtLU0iiJbmn9frxeBV2ExYTdlJ7b
 yWB5ZX9UFjilWUfMdwouyRTi3ylkm+ICmkRjUGBpqkJ1zQGBQT4cDmR/RXfPJN0qf0Jz
 Rzn/Slyosscu5nhNjLZP2W6/UeDxuzpGvhWn7hnX9/XGDYJ3QsfDZmj9d0vT+uhXgl6i
 W4jA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783397583; x=1784002383; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qFyHEuJbiZnwi15luGVMLUH15sNsiwcdRKnHqR67fzE=;
 b=WUljKFlxtYGNCSegMjqcSq/LXFBIhGDAViKPVAr1Ue3uVdruOIo8Kgtb90IByDNUXg
 6Tdlo0AbLQmhlRfdm6uj3lbQ7m6hUID1Bjjzdm1vx8rkM2LXyWGDpLcejs+TvhezgdpX
 tGtJ1O8C4NXTMns0P4vWTXqFQbH1ppfzhVNitG4LmbapyQAEkJiKFQuxHqMCPRtZa9sV
 e6hzVnthVq35afRBxkkUK1/mZeE2ewFa0GzSF5eEbJmUxR7o/SiUxRzV5q8l559pt2mR
 K9lp4KVtPpdBMAL0MmY2TcAx8qLMTGdSjkSWccI/lREFZv8w/Kvb9rXIs1ZP0a1BDRsv
 IMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783397583; x=1784002383;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qFyHEuJbiZnwi15luGVMLUH15sNsiwcdRKnHqR67fzE=;
 b=CrZHuvJtfYa63qmfyZvJEw0xlgspP4je+Ykj3Ljh1j1LckzxBqXJgpE7tDvgrQycGF
 5Y4CwaarCZ6ifYAUDN7uXlUcomY7vKX3O2B7+ymk6QrAJfRXZAsc5qoRW+yR9TAhxEG/
 KAlp91wu9FKXiPP5uHBU9Imn1pnHPl7xiY3G/ZAtcSuDeMuyJcaPbnD497MZUJqZ2zkK
 bn3veXtt+7X3EDu7QCQnMiIm6h4sHKlyl1byiOwSz8ZdSlDGiSDcJ5SHQg5NyIx34aQQ
 Nt487bXY0/fQatFtwx4gKnGJEj2FYFxXA/y1OvaQPE4EfjtAAK/AZsure4E5oFIdVgAK
 Lpcg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoEdB4go850aU7ASsQNtedYI9M4yxp5Vna7P56jVBGa7/sBBFiZwkRq/SwEtDauv9Up3S96oiqln/pJ@nongnu.org
X-Gm-Message-State: AOJu0YwfhcnlJVzJS5oSi0PXfq/V/DgLI5mzcLpp6Gf5vfqB13JPS2cv
 aInnqwt7TtLjRGLHp6/mBkmLtIpPJINX4uQU3GHtGnz6FEJi5CF7C/fv2P0efN4vV+ToFs7oo1j
 Nnribj37SyYijGzzdAD3OEmwOtcrXQks=
X-Gm-Gg: AfdE7cnuCVY43hl1eu94eB/e7m9F8i4v0LC62GkpR/geFTqRv8+dQXwqnvwJS/874XW
 8IA/iOa3HLmzX0IWGChWsNYqrkSL0d7mKq4tKIx/zmsN9n7VcD/f6qPPrTMurrXxW2jF1qegxUU
 4GdzEYg/wu4Bm5Q2xu/NK7XFBo2yoxcNryQbk7xfw6EEyg4mm0CDc71FngBLatZe5gIrYtPsUFO
 pkojl5ukU5fffGV3oyV6CFI7uc4uYKyc6UqV43tB32JdBnCpnOeFV02I0mmC60jZdqagLRR5HDx
 KvxIxVfq8SPd8jkmX/Xyo9bkm3M=
X-Received: by 2002:a05:6402:11ce:b0:69a:9355:d1c2 with SMTP id
 4fb4d7f45d1cf-69a9355d291mr264738a12.42.1783397583237; Mon, 06 Jul 2026
 21:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKMhqavLeDj7fy-JpY8WGKO0m_o+94UMPX2sBK5Ldsid4w@mail.gmail.com>
 <202607061406240161qB8UHkhWxKejNM4p23xn@zte.com.cn>
In-Reply-To: <202607061406240161qB8UHkhWxKejNM4p23xn@zte.com.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 7 Jul 2026 14:12:36 +1000
X-Gm-Features: AVVi8CdIZvwztsB195yDproBcHgCj89Lj2XvO0vTrsyLZQJdNZTRYUjiN4Ayd8w
Message-ID: <CAKmqyKOp_SQkQF4i7BYxdGSPELCTBGymJrHGz4S2pWpvt3JUOw@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv/kvm: add extensions after v7.1-rc4 update
To: wang.yechao255@zte.com.cn
Cc: alistair.francis@wdc.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 palmer@dabbelt.com, liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com, 
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x531.google.com
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

On Mon, Jul 6, 2026 at 4:06=E2=80=AFPM <wang.yechao255@zte.com.cn> wrote:
>
> > On Mon, Jun 22, 2026 at 4:59=E2=80=AFPM Wang Yechao <wang.yechao255@zte=
.com..cn> wrote:
> > >
> > > Expose zilsd, zclsd and zalasr.
> > >
> > > Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
> > > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> >
> > Thanks!
> >
> > Applied to riscv-to-apply.next
> >
> > Alistair
> >
>
> Hi Alistair, could you please confirm if this patch was applied to the
> riscv-to-apply.next branch? I can't seem to find it.

Oh sorry, it didn't get applied. It doesn't seem to apply to master or
my branch though, are you able to rebase it

Alistair

