Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334B5C5DF88
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 05:33:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxHse-0004Ay-VP; Fri, 21 Aug 2026 01:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wxHsc-0004AY-Hs
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 01:33:26 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wxHsb-0001fZ-2C
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 01:33:26 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-66c7a743cf8so782860d50.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 22:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787290404; cv=none;
 d=google.com; s=arc-20260327;
 b=fwAhgdMKHLybkvGaP/IlDy6XVmcwryni/0rb6D9LO6KUXa4GjCSw56MwZXpqWqKnk5
 /elXgjZmjdcGxS6RIflub9RpIVxPzQ75hcXp5OKJYvsne6wpva7/YXsGnkJ2mTQBKTAm
 KWX5aOr44t3Nyg9NYQ8y7UqkwtNMoZAYIDL/Ls2lp7ylIYdIfTRusPc4P5GO7nNeoatJ
 Gq/oJzb1fzXgwretckhPg2aWp3cAOVfWPYm7rIVIm57ZeC0RoM6q6SRP1XcmyPEtHDLJ
 ErUGBWytD/h0CoHqWX/+fJqIvwIEFXf7pYjl1OdY3L3WkwW5Zpzx3zgwC/0e0jBsxdK9
 c7lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Hbn6DbDQGksNHikGVpR+3UUDGmghf0y1+rLu5GxTDKA=;
 fh=fwVxhi3cIRBbCqWIyPNr47h47oYN3TwYw0ogoH3RwIw=;
 b=jgZJ5EYHLAfTiEmwhTgZZ2m2dPZQrJmcKLXck5PFwo1m7bjE1GvSsAUTzHC8+A3Az+
 imVd/yHbVthtxzhxWHFn0d9H/KwiecPbQ+MC1zRAluejUYCf+eiA/GZREvdRwx3kskB4
 9WjHjZ7YXa3+7p409bMWi0YN5JOEd2IVVYjOSXRN0YdwGM1+RgK+BBv2gA2ZilV0bADr
 W8TvH5xvR1IYmdPVB4Cd0/uKTXqdPg9EcBGQ6WsuNiMvfwywffvcj5Qi5sdL5xx506Fi
 JcvrOkZ28kdYaSnfuM3dgf1rnpGSj0YGm50G+AInmbdYVpPoDLj2E8r2msdyh7V9q9ns
 Ve6A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787290404; x=1787895204; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Hbn6DbDQGksNHikGVpR+3UUDGmghf0y1+rLu5GxTDKA=;
 b=Hethdn2jMEcMa0uB2KiOgZZX1ufx+2meW0dI4y6KS2FmlVO8nFbNsapLVjBYRoZKfT
 rRhQS1yoLsh/obj7h5jptLmUDjuYxmhNMKDZh7GE0Yg7qUkO8egj8teYn8akGGEc/mK9
 6BvQ0kHlch2x6ZtsWwjXq9mjrhUc0+Km0Hv2TIqPEtriOcJrFrKYJwuXJkPcom76fm3j
 1yviI0doB4Pt+Hvxb1LTNcQx8CJWaltJzWpSonRmZpRjSeoXMoOsneZHpsf9JSlco5t8
 j/BxhSs0YgiEaJQJ/vJAqWDqJQpZd0Tn4XzFxTJPpuhhhMlmAsIGAILTyhWA542230sV
 DkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787290404; x=1787895204;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Hbn6DbDQGksNHikGVpR+3UUDGmghf0y1+rLu5GxTDKA=;
 b=rUpZC8/TMZXtFnlzXDufxkVYLreRuS9gpkjhs6+qOCGI4p+Bd1cj/D6rODHDA1mo2L
 EPi/CvWbpjDoKrKpYKhdEND8BYgXWxC3mz6GLKc2wLe4HROn7f151j2jCpshF6veKVQi
 TdmfFXx+0OeTA5d0+IBbscTBdH3DHJgcwGtF91UbKdNaNuvDn6nd6/TXty2UUMWyoYEC
 cQ5LWdJNwTjWy7I5KFCgorXPom7/POL/LWGBd9TDi1rozk8RuJU7rl1jpGN6uW8ZmToN
 dMX3+SqjEMP/MlsDJvA9lqC2OV+zu+bsyC7pPIJanb34gussRG1f5aJ9cGQZOp9qFvZp
 ctjA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoQ3MIyzGYB1TxIEaPN+RfqDZpYI/jSJ73+wEBoIYc24+++b2e0NjP2H5SuLYGOiXUINSUrP8nXfiYI@nongnu.org
X-Gm-Message-State: AFuF++lfbuQLU1eHUeNrdZKSXB/G/DgbfQis6q8QFhGMeenlxg289Dad
 rjQWnELd1qkNyOVCd1g1BRThYWsbHHmz9uho0HaRrYHGEIimcrzMjGaDVa3fwJ76m20OLeUipEv
 StjjbUj+JA/CZUFeHOH4ha0XIqS6n6wk=
X-Gm-Gg: AR+sD10sS1yqr9dWmE+Q/ofnltDRUuijzI9E3hJBt6LXjQ5LY8fj+0x/aStswwOfJ0J
 eeZ66SnMKWF/DCmPyEkSnDbtCSNjNMAameSj+RbTqSa2SMv+ytp+Rz5PVE95MXm1X4KN53Xspk1
 GNwBsCHr2/r4vCt982EL98ZgR6nR2tVpCaV1fj55ugLbAyl2n/S8smDMiSySNKAW6dPQ8xDB+kJ
 0M8AHJNrY3XwqlRF8iWNnc3S1FPChnj8EyWcFz6+/PeQ6gOcZYQAAyEemhWGFYGxbCF4kjX2k4g
 zYuosOnUJuQzxLvaLnZvcldeV/gBXQH1zpuUFqUGVaYvYhTZCaeGBCT5748OnWF7+W0Z7vp6BSu
 zv7w=
X-Received: by 2002:a53:bd41:0:b0:668:894e:4bf with SMTP id
 956f58d0204a3-66cd69a2a2bmr3183044d50.13.1787290403849; Thu, 20 Aug 2026
 22:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260808182956.290561-1-flamboyant.h.01@gmail.com>
 <20260808182956.290561-2-flamboyant.h.01@gmail.com>
 <3ed04624-9d4c-4c11-9d7b-4bb6568b2590@oss.tenstorrent.com>
 <CAAW0U4Z4hSpbC62xE78PJjJPQKNh+7XxF3-Q14QzymELedxhSg@mail.gmail.com>
 <7f691e05-7512-4982-a4e9-a1ba5f5bf823@oss.tenstorrent.com>
In-Reply-To: <7f691e05-7512-4982-a4e9-a1ba5f5bf823@oss.tenstorrent.com>
From: Kangjie Huang <flamboyant.h.01@gmail.com>
Date: Fri, 21 Aug 2026 13:33:11 +0800
X-Gm-Features: AcwNN1WEoi5Ej1uZ6hPdurQqz3aOtAqNmg5ZjQcp_LX5XTFpBP7uIUXd7vCqEsA
Message-ID: <CAAW0U4YzxrDA7ukyaSzPFuAW+Bv3NPNA8hD7ApjC=mr=7S8PLA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] hw/ssi: Add Synopsys DWC SSI standard PIO
 controller
To: Portia Stephens <portias@oss.tenstorrent.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Bin Meng <bmeng.cn@gmail.com>, Chao Liu <chao.liu@processmission.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=flamboyant.h.01@gmail.com; helo=mail-yx1-xb131.google.com
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

Portia Stephens <portias@oss.tenstorrent.com> =E4=BA=8E2026=E5=B9=B48=E6=9C=
=8821=E6=97=A5=E5=91=A8=E4=BA=94 12:53=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 21/8/2026 1:56 PM, Kangjie Huang wrote:
> > Portia Stephens <portias@oss.tenstorrent.com> =E4=BA=8E2026=E5=B9=B48=
=E6=9C=8821=E6=97=A5=E5=91=A8=E4=BA=94 09:11=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> I don't think this will work for frame !=3D  8-bit with the m25p80 fla=
sh
> >> model used by k230. ssi_transfer() takes a 32-bit value but it then
> >> calls m25p80_transfer8() which will just transfer the bottom 8-bits an=
d
> >> drop the rest.
> >>
> >> I don't know if this is an issue with your code or with the ssi_transf=
er
> >> function though. It seems like ssi_transfer intends to accept 32-bit
> >> values.
> >>
> > Hi Portia,
> >
> > Thanks for the review.
> >
> > On SPI_FRF: you are right, the explicit clearing in dw_ssi_write() is
> > redundant because dw_ssi_write_masked() already drops the bits that are
> > not in the writable mask. I will remove it and add a LOG_UNIMP warning
> > when a non-zero SPI_FRF value is written.
> >
> > On the frame width: ssi_transfer() takes a uint32_t word. The issue is
> > that the DWC model uses CTRLR0.DFS (4..32 bits) to define each
> > transmitted frame, while SPI NOR is an 8-bit consumer, so the two are
> > aligned only when DFS is 8. The K230 SDK SPI-NOR paths use 8-bit
> > frames, so this case is not exposed by the current K230 use case.
> > Maybe either add a DFS !=3D 8 restriction with a LOG_UNIMP warning, or
> > have the DWC model split byte-aligned 16/24/32-bit frames into
> > multiple 8-bit ssi_transfer() calls=EF=BC=9F
>
>
> I think either option is fine. If there isn't anything testing the
> variable frame width it might make sense to just restrict the width to
> what is tested.
> >
> > Thanks,
> > Kangjie
HI Portia
     ok ,thanks a lot
Thanks,
Kangjie

