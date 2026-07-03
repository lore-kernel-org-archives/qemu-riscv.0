Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144C0C43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 03:49:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfUt5-0002mM-Pe; Thu, 02 Jul 2026 23:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wfUt2-0002kZ-Rq
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 23:48:21 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wfUt0-0006pe-O3
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 23:48:20 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-698a9f11776so192973a12.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 20:48:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783050497; cv=none;
 d=google.com; s=arc-20260327;
 b=VfPaelSXvWi+lze2wReDdOQshuUCyDOwz05s8glInIO3AWcDBjc/9fPoiiHSLuFtSo
 dTj8bfJ1jkkp6nDoK3s0uheESvRGFMze72FvH09N1PxCMN2j6+8cdWklD2PfaM+Benc3
 jgBuwYfNE1LNSNEteaKpr7YT+vruXvBH/NzCvhI6cFJvUcMpQ/rjhzIWeFXDelKkOISr
 VTO3ZgdNIAJeuRU2Au5LsOU8eSBaAu0qxzsnLHkQP75gHy1kNI1d0w6OcaVOJRfJ+1qm
 12PeN3p5XtjWDHXKEzH2g3ozGO2KRgKC2ukfyqwyxO/BvgO1zITjig6rhuia9rXPkSdL
 Ob9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=UI99xHHgi+w+Z+hIKQ0d4vDLJ7Dbhg073B36V10ZKRE=;
 fh=j3/H8pefi/AUBZYq4i7f21ra9uMKONAeZ18tB4hOudc=;
 b=Igh8j0psUqkC5p5rDdzy9+UT41PRFacJt3jhvzJ3C1w9CXiN770Cq2D1UrrlMFGac6
 KULNFRZTQ43GjGVW1n7ff5VSyujmn08HKJGP9jgWoL0A3e2kz4R9LC9PkoR4TLRKcw45
 626fQUJY1U//xt23IYmMYvaB4bJwCMhtuZGz2NqpyhsFWo0TDRMZNqTj+5WkSGSm/2GD
 0Uxzmc8EScst0aGFAwHbpR5SlGN1lJn2GKf7XxkMhMDxUqYjsP4wmK1bmtAWzZNRU297
 qWCg/NlbOld9Gy7VwUgwjQ20SXwvP2p9jND1SF5rHiHD6qy9fMXlBK5Z6v/3RjIPgyfB
 jCrQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783050497; x=1783655297; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=UI99xHHgi+w+Z+hIKQ0d4vDLJ7Dbhg073B36V10ZKRE=;
 b=ZeXH+Imbphp7rdX5yP6DbJxXQ4kZ+pL3zGDNnPPETozPAnhCaHoqlivGTzNIRMe7Yb
 Rr+iFDQVUfOHNvi8gxZdVW4s0lKslXHqtseQDp+DvbGSTQzSxPlPl0zSSXuNWt8UR015
 XQtb0l4FLRifOVtmBaeqnzmfQ4ZFwSWYcsSVwukAt92FSNL8V1dKeihcyMEd2Ce0W0d4
 ZGeGVfOnpKrlIlo3WufcloMLKcGVpcYWn0HXNQiUdMJWvFhu5OYXxd+RU/lCKHxJh75b
 4M0hSjPWADl7OOn8nyvyNUqxlmV2FUHYJNMUEHq+6h+rD1yfRLDM+WKq4zQZSQyV5TKi
 0nCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783050497; x=1783655297;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UI99xHHgi+w+Z+hIKQ0d4vDLJ7Dbhg073B36V10ZKRE=;
 b=Q892RyI9QI5gwxRirjU1SMQ8sjnjf+8MCPz1Z3Zd4S1ZeoiyKPCQBTFc7mqwVSSb/L
 QZNjpwppubx+X4F7AqV5nsApxzxaWROE1RtiTPUv5YcN8q0qz4PXaYkBtgPt9tpJ2E/R
 EKN8kCLerQPt8LrHL4QMCe6Y9iM2XwNHvnVRZ3b77f7eMHjNCACbBnRTK5uRIMgYkjBE
 hLckm/vnOPZT+Itypt87AyKYp5qwBrXrHpxX+ipQkZkiwZOdr46jbM0sksY0bGxUh8wM
 PgkpsTy+hsRqa0XvPYTEV8gvglMhFOoJksv+80D91SKIXuhrdiT4WmGZjO1tay3ayDFC
 SUnw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrVkZyHt1vRYku2iAFNhJZIICvBS9MFx40B86kE35ICta4mVNkeq1vkKt+0GQKLoiappsyd2HKxsTrV@nongnu.org
X-Gm-Message-State: AOJu0YwJR46WQhAtuJX62dkQnE6YvAawskSjgguW+X8gcGRF5GV/nByj
 ZWBNpRga6QXKGKG0ui0esWQ2WnCjsf5LnMlTaQWkDRkMB/cRhqrimoz/4hOcmCIj4+JcYlf3U5I
 xpN/cINhQJnwjwSPHNN4DbmKoZUbo2IA=
X-Gm-Gg: AfdE7cnRmlkMHag3uahm18wZKXcuJYzdUyxquifrbH+D4M9JE/Lbz0zZIiu1LYP007q
 4U43VPQhbnfJZkSf/Pnb/CYrqCOwfKl0sXmeUIOZMTE6uuiS6moIJEHlUVpxAEBtcNxegc9LCh/
 igZoSbzxG0qbuTqP2ufl2cN6ir3PJq3gf5PD8Wlcd7DyuwKquTomLIlG10Xl8E1t2BPoPwNjKde
 XzO9Js6xpxTZqXBXE+TofJzC8b8rUP6+bjLOWgr/7bTXEYo57rd+rmo+9zh6ssVveBC1zP0tnWV
 aQf0v7i2h0byUE2rfdZsf8sVnRE=
X-Received: by 2002:a05:6402:3595:b0:698:b23a:e54a with SMTP id
 4fb4d7f45d1cf-698b23ae605mr2224720a12.31.1783050496444; Thu, 02 Jul 2026
 20:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260701121111.537654-1-daniel.barboza@oss.qualcomm.com>
 <20260701121111.537654-4-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260701121111.537654-4-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 3 Jul 2026 13:47:50 +1000
X-Gm-Features: AVVi8Cflko2skZwxol2pEVZgVLb_QZfuaOuSzvYgV6yEbkE-jlBH4DGh0OS1rMw
Message-ID: <CAKmqyKNGb4pst-hmaSc6SXG1HV2T8ErZhNYn8JdzyeY40yM-Tg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hw/riscv/riscv-iommu.c: fault for non-user PTE in
 G_STAGE
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, nutty.liu@hotmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
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

On Wed, Jul 1, 2026 at 10:12=E2=80=AFPM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> riscv-iommu spec 1.0 says:
>
> "When checking the U bit in a second-stage PTE, the transaction
>  is treated as not requesting supervisor privilege."
>
> We need to *always* fault in case we're on G_STAGE and PTE_U is cleared
> since we can't be on supervisor mode at this point.
>
> Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3555
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/riscv-iommu.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 3b165348ca..29eec3133e 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -494,6 +494,16 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s,=
 RISCVIOMMUContext *ctx,
>              break;                /* Access bit not set */
>          } else if ((iotlb->perm & IOMMU_WO) && !ade && !(pte & PTE_D)) {
>              break;                /* Dirty bit not set */
> +        } else if (pass =3D=3D G_STAGE && !(pte & PTE_U)) {
> +            /*
> +             * riscv-iommu spec 1.0: "When checking the U bit in a
> +             * second-stage PTE, the transaction is treated as
> +             * not requesting supervisor privilege."
> +             *
> +             * I.e. we need to fault if this is a non-user PTE since
> +             * we are always in user mode at this point.
> +             */
> +            break;
>          } else {
>              /* Leaf PTE, translation completed. */
>              sc[pass].step =3D sc[pass].levels;
> --
> 2.43.0
>
>

