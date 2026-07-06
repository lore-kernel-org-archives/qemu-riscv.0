Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F369C43458
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:04:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgYgV-0005KC-KK; Sun, 05 Jul 2026 22:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgYgM-0005J4-0A
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 22:03:38 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgYgK-0001T3-FV
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 22:03:37 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-699fbcd23ccso2927241a12.1
 for <qemu-riscv@nongnu.org>; Sun, 05 Jul 2026 19:03:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783303414; cv=none;
 d=google.com; s=arc-20260327;
 b=f366jzktFjQBh60OVjWIA1yOC6fF6kbixQ8dK7TqnONtaG0ep+o4CK+FyMtOlOhF2D
 AHcwhvCIa5UmUtEBFQOgylyPeSFUz97o8s1BT/EiEYgoyZQ8G48LxgL+6j7CNtczn7Ry
 +LBXPOxX18m11Wm4Y1Q38j9gCMkQjZOraDJKGWIBlnOyfYc4C3OVnvMOowpJmWaszQfW
 lkr8TvhTUB2PmfAiy5r2tS90wVddkPxfG2LJ+Ur2ZZ5qIGxYQp0tOyvw6Pt/chCvBz2R
 tdsRHmEpWS9v4pJdv1GX94iTduvrxbVNHEw+zFPupbeZr87GBL0wR5tSRBheNZ57DJUU
 5LUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=cox4sR+7xsstieoFliuFvYqO+sAAaOQnZ9XxVg9v7Ds=;
 fh=HWRzMpqBiNYWzbRDvUc9J2CzCLfxacsoq3pOe1MDVIQ=;
 b=YrKbUETjHOlyR3I3B2yhOl56eDQ9108MWWhRpm2J3HHqYVP32Hfh63JkCntSP33Xly
 sdsODODJm9asRafG+0bHNkdcGXplNA6hlMGmDj22zapQu3F3egSH6iH2SsF8fzPH5UQy
 AjwTT4GqJkJNL95rsHN/LJ5ZrLC1MCSdt9ct3Wl+wKez9ChRp+Kt59V/jRK91FY9ELaZ
 sI5zLXsqDv8o2O6XFS5MHYolmEWD764S3cUxe+eaVqWB2kc6uJCkIldEayHbRYU07U4p
 kKoQcNlbaKA3BmvbPapQhjTuIDQBYeS83wobTGA5y8M8kQcb3AUMa0vPeTTlpMTORO0U
 45dQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783303414; x=1783908214; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cox4sR+7xsstieoFliuFvYqO+sAAaOQnZ9XxVg9v7Ds=;
 b=LRIo9zKMD8mkItjaFP2TH3rO5mNBDaBnyCgz+k5MXvJ2Y/qwhLSwIfI5dw7btE64nu
 3CqvrAADt0nkPguW/yhJdAIJmq0BZJMaxjAqoE62LQ2Axt9NeHzQKGwfAKDX0W/bli+G
 +L4oSJw6VBK6yLRYrYa1D68Y5EuYr7pGEaK0mrGbbqknpt+x123qQ4/YpipDgC1uzgh9
 TA5dX5VR/0eJ4BIC6fU32kflmSbx75XnSN7UI7KibFGJ3IEkrm9LZvbjAUlNOpAq7+xv
 Q6+9+4d4EBR9oQLKILSiIH+/0xD4Bi61CLmuqyz/bw0TLLm2ae8xCpqeHDlFZ18NtyWL
 wX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783303414; x=1783908214;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cox4sR+7xsstieoFliuFvYqO+sAAaOQnZ9XxVg9v7Ds=;
 b=DmOJgUZt4rmDR77bxbgAc8pUo5XLlewDqK32mMeT/FoK5h2q/LV0mO6QXXkeCwr9Oq
 QHJaawZW9B0bXBNUEEP0cHJ4z3/+TiWjvTvBSZvtkNIR6ENH/l79r+/mtL7Qy3YJwt9R
 oPW+uYoB9uDibHMwgj0w6KjNQCwBnAS6pP9+L1QrjNdnf+2SiMvAcntE4R11qaGUdi2J
 jbWX+1Q6YPCN4gJ2rwH/c2l0ePfOgLkg7ToK6Yhr5AlqPDpxAipli+/nuMQ/Q0QXKNUy
 fDMAFAlW6NFrnqSF87YeQ5canO9U4wGKkqD9SoOQvqQzOBMYTyOg2hMfVrUFndaJDLJ5
 0+AQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrzX5vTWxaWu7ywIo4Mid/z/qLn5IDsEtD6TnHjOLk9NLl+jx6F58l6Hrk1VcQhWlRXsTslhG3DSLhf@nongnu.org
X-Gm-Message-State: AOJu0YyikpEcKcevIdkez2o7XCQ1f4x0ooJz6YgvazUlhHqG3Yal2gIj
 OxKyNVCfs8J3lb2p4D77nA9kkOtctCbqoTRDn/rzA08XoZ1uigNDU42BQzFFc5HcUOGNgEYGkI5
 LOEp3KyCf0daDlwqLLUxWcCQfu3so3s8=
X-Gm-Gg: AfdE7ckpn5ntjw7EjKdsGgnwoshQGT/xBlpZE54jmapJWrvmJ3p5LY700VvljCPlv0C
 YM9t3zw43L1BV8LNUFOnWy+RQSiiKo5FusHtYkc5+qvIpq4vCTS7lv6vkVnPwVIvKZ3p1SLZuwR
 brIlLRF8SR8ZX/Hmv5TgeClbtQ+Ofo1qNZ+aZi9YFNVoYiN7n/6iF35JRzs0eebxnlmy99Rhjdc
 4G9N0RKXLxqirt+h2SMawcJeYBp1qvYXzBfUyz2eqb6+SIpJYkpQhtk1KHrIJ9nLmFsnKQz6vBU
 xDtR8XWdUEbZ9JiflTbRoSNBWwg=
X-Received: by 2002:a05:6402:3227:b0:698:5f89:9a51 with SMTP id
 4fb4d7f45d1cf-69a1a24beacmr3037151a12.5.1783303414439; Sun, 05 Jul 2026
 19:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260702203616.1795588-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260702203616.1795588-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2026 12:03:07 +1000
X-Gm-Features: AVVi8CciTkPVGCrm1jYsQaLhcKQijELG9s_cJCEcUyhl0S4DWLNf_nswaJonQho
Message-ID: <CAKmqyKMVqG7=bcUKZDuJFWxjwFvFVr6_=iGx1Apm_9c9zwu5-Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] hw/riscv/riscv-iommu.c: check for misaligned
 IOHGATP_PPN
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 nutty.liu@hotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x534.google.com
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

On Fri, Jul 3, 2026 at 6:37=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Hi,
>
> This new version fixes a blunder I made in v1 pointed by Chao and
> Nutty - I was using the PPN value, instead of the page table base
> address, to check for the 16kb alignment.
>
> We no longer need to change qos-riscv-iommu.h because now we're doing
> the right thing.
>
> Changes from v1:
> - use PPN_PHYS(iohgatp_ppn), i.e. the page table base address, to
>   check for the 16kb alignment
> - v1 link: https://lore.kernel.org/qemu-devel/20260630203155.2103084-1-da=
niel.barboza@oss.qualcomm.com/

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>
> Daniel Henrique Barboza (1):
>   hw/riscv/riscv-iommu.c: check for misaligned IOHGATP_PPN
>
>  hw/riscv/riscv-iommu.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> --
> 2.43.0
>
>

