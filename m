Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB0DCA5FDD
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 15:12:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xD1OI-0006wL-SV; Sat, 03 Oct 2026 11:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xD1OD-0006vZ-HC
 for qemu-riscv@nongnu.org; Sat, 03 Oct 2026 11:11:06 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xD1OB-0002Rk-N2
 for qemu-riscv@nongnu.org; Sat, 03 Oct 2026 11:11:04 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-8a08bb1eda2so3622287b3.2
 for <qemu-riscv@nongnu.org>; Sat, 03 Oct 2026 08:11:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791040262; cv=none;
 d=google.com; s=arc-20260327;
 b=PPvb2/KGs+P7zGGwpkE8r3hsY5B+oUrhK+Ll6H0y3Ip/KMlQaSwDhur38jj+b5rDZ2
 I7Uv7lDc2zrDTnkeqQ9Q6JAHsgU/XvDqYnnzaLPCN8+/eKrtQwVEueHEDdqirgsgYbxP
 pOJeQLgfa1wEZhSdsqqTk6kjDBHnCNsy1kUGpDiKchGgbLEz9evSSTQyIgIhJkRQHvsV
 bl5qBLaoA0F4g2WfDOks/Ix15LtvziGyQ75Gsane6hnO3qOWVyNx/xZBa8yDoV85ZCUc
 iTaHWDBUiHg0qq11XZfzIfMTBZFmYV+OKLrNTKky0W1ghHolrZ6OzHhh1XEHmad34kAE
 Buhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=IXMLEeSvrR2sm51qEcoQbJwXKKauC9cXF71YJk1dZxU=;
 fh=WQ+rsz4dfxETIgp8BYnMvE6Og8Msr8VMk9z9CCFVc1Y=;
 b=hrPLm9XVYVLFztW9cxpyrvjoL5/w9t3FZK/h4Kcsxylgm49FHYdnAAWXw2PJ4fpD14
 YbjmkT8HSfKN2iTerRwH9jd9LdsVkkgygBLXZCJgjKYkXy1O8QrgLfBHE9QO/657FG1H
 S2rMvmJj3a4T1/EFVge7b0Zgi3V+PYEFh74CB67WH9fyegLiShNjXAbTPEAcvlZfs+U9
 9Q7hlo8MDg6LyACpydJfWowDTif7saX5iVD2Qklxq341D1UBV5iKIf0bMT8bMNGJmrh5
 IRWvGgg35+TpFgfjMRYwcydvKsUXFEbjGtREkyASJU9zVzpZAN6SZnL86tRcLfRjLhV8
 +OEw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791040262; x=1791645062; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=IXMLEeSvrR2sm51qEcoQbJwXKKauC9cXF71YJk1dZxU=;
 b=jen2syKAqDoxS774CExEd5P3MfrPn0tIeKZoxyFLqORreq5j0FE7D6+zDSOjqSjbm5
 s8rCuNkehMQR6r5Y9n/qABpLqunrFXO36CoCVbpP8mTa31NwRAsKaYrlt0S9WOnvSOVC
 QTxRV+rM3s2hE45S/sI84bopbbB5Me11+nBpAQO6srKx+JZyneaZIc+JUfauzWs00MOp
 2vczeCKjT8wof3B2I+tpbkWzKYNBKdxpSbLcWWuJL8UD7JHX8L4v+Q0QQ1JqWfTB0gd/
 Rs7bSvfbp6LkYhYdqyJ1PU/n/pERpB2B50sWM+ghjdPRI62YcnnjfXJTB+ZzgMbyvFe3
 FgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791040262; x=1791645062;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=IXMLEeSvrR2sm51qEcoQbJwXKKauC9cXF71YJk1dZxU=;
 b=wMqesDnLftYltFlbZS6LFDxff7YzkiWpkbDNzKnBiLXRraFfWd7oxqG4cLco9L7Oec
 M8qypzYMclcC6kcZjO4uulYUSUbIgjyXtaO3a+/b4pLDVzmI28cJIsiB/jZU3Z7iqeXU
 dRdF6W4+U2V8l2/9h6QQdlit3G5xaRQOV2aj/hsLlQGriMYOXcFUqfyny7lIYINsFEhE
 Fcnm1Kl1tMwZh7sH8+pbVZAt5ASD1NvUg7yNQgYrKAw7GiCaSBVFX9n10zBn58MELv8c
 g6b80afCNgJl1LUjmzY4BiRh6/FSyOs72n8hsfzk4g5RXLl5kPVYnY8tAt4PCNDy50Di
 2ZHw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxKopxC88ZEdw/TIZHduP2KMF0BEYbZz7TPJGtR4Bh25//QCkatEAoxfazajn1lBOWq2A7RxOY5kz/T@nongnu.org
X-Gm-Message-State: AFq9FYLx/gLbb6JWs8dS7rA2MJ2V6s2dENO2xEBstsKwmLeYH2NYfLBj
 te/7bO/SkllYRtTi/cPTbHOvbmcG/A0Hvfhlhyi+WKEv718bJLc4vJE3KFa3JQzmAtBIWo8jnKd
 hezI58DonmTVP6+M2dzZoeQ/QpY2PcVPbp6jb
X-Gm-Gg: AYBFou2F3Dq2g+SLGlXkGWsLZ6/V5Zjf2mL+Bm3nLIJzrQNe/+vPC5IFMWb1XbimipK
 URypHAYn6spKMqFmUAHqkoCS8b0A2JUE4n2L5Gw/i4k7ZBOGaNMvAq4AWCr1xOJN4XLeX/IGDRb
 LLwHlHFuwecTvOzGChj46lqKpuf6d2uiUxxk5pJRU7pRI2L0WW4ovEjJvCFbsLE77N2uS9k1dCc
 nyB0aNSoZFn1DfSJLYm4KVHeuvhLBmQWIZ/nK7TklhwHgC/ZAyNbZDNb5FOQ2GPKu39NBQR6/kb
 sSO4Ar6COivy7Dyi02Zij5CGQonFxe3kk9e9CLPPkKO5kQ0wa6i526pOXLZCrcIA44ysBgSbttS
 f/qlyEoRphBOIWkA=
X-Received: by 2002:a05:690c:e1c9:10b0:872:1e2e:b4c5 with SMTP id
 00721157ae682-8ae951f63c3mr6389107b3.18.1791040262344; Sat, 03 Oct 2026
 08:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260904155758.3833179-1-bin.meng@processmission.com>
 <20260904155758.3833179-18-bin.meng@processmission.com>
 <20260930-bulgur-dab-28a151f39dc3@wendy>
In-Reply-To: <20260930-bulgur-dab-28a151f39dc3@wendy>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 3 Oct 2026 23:10:50 +0800
X-Gm-Features: AclHuK9Suxe_RtofqfVpOKWmMH1eiLRatpfqk2q86BAr3GxraXi81gUg1hrJuXA
Message-ID: <CAEUhbmUofH0+3ymRfoR2Var9X_L_zTr--CLYgWtn1L2p1MuwjA@mail.gmail.com>
Subject: Re: [PATCH v2 17/24] hw/riscv: pfsoc: Correct PolarFire SoC DDR
 aliases
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Conor Dooley <conor@kernel.org>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sebastian Huber <sebastian.huber@embedded-brains.de>, 
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Wed, Sep 30, 2026 at 5:31=E2=80=AFPM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
>
> On Fri, Sep 04, 2026 at 11:57:36PM +0800, Bin Meng wrote:
> > The 64-bit cached and non-cached windows alias the complete physical
> > DDR from offset zero. Treating them as only the portion above 1 GiB
>
> This is not strictly true, how these regions overlap depends on how the
> FPGA itself is configured. In the past, the regions were set up
> sequentially and someone may choose to set their device up that way if
> they want to, provided they change their devicetree to match.
>
> I think the change is worth making, but the commit doing so should cite
> reality and explain that this aliasing is the case in the reference
> designs provided by microchip, not present it as the whole truth.
>
> Ditto for the comment.

Will update the commit message and comment in v3.

>
> > leaves valid Icicle Kit memory nodes unbacked with the board's 2 GiB.
> >
> > Map both high windows over the full machine RAM.
> >
> > Signed-off-by: Bin Meng <bin.meng@processmission.com>
> > Reviewed-by: Chao Liu <chao.liu@processmission.com>
> > ---
> >
> > (no changes since v1)
> >
> >  hw/riscv/microchip_pfsoc.c | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> >

Regards,
Bin

