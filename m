Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0AEC43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 05:39:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wenfd-0008WH-Cm; Wed, 01 Jul 2026 01:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wenfX-0008Vn-TG
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 01:39:32 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wenfW-0004QU-6j
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 01:39:31 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c0868ca8738so41278866b.0
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 22:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782884367; cv=none;
 d=google.com; s=arc-20260327;
 b=oUgdifPDdf/U1v4GGSNYmeG6BeulC7hTvRoxOVnxfprvJs8tHOX2d4CvWX3XP4SKCJ
 72ZzrprkwE3Mz5QhCcTlqJALULYeqx2NQymZR0RbCeNuq87jrNTducLqROIpF7cir99i
 tSwb4opT6x/MRy9uKuOdAc/0dcBg0J5rKH6wjFtQVyGKa/tdFoc11lS36vd1utY75Yq/
 5Ia34v16e2XNC8k8DAgpKQNkJGCJ0U49Czecc/6n5P/usSwfVlZd900ByM5SB+gKiAOR
 bEGz+uWLRy4c9BzARr44d0zrEXxgEr3mbREkAC8Xasxu6KQuHlsU5WEIpKk635IVsOj0
 KcNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=KYp1JzS80HQSdAHxYVhqKVkD15bXuIjv4eeqFTsrsTw=;
 fh=JOXgEQzx9SxifGfL3vSlfn3NZHoMvbi/dVciiFdI+nE=;
 b=nClJLD6jd6+b1sTqejy6CI+3kFxFmuryfMbi79c0PtUc2XXrRFRy7XAQ7WIMn9J/+B
 dTaj1l4fkgjkM366BKO/cZHVzzTuDmCAFXjVLyTRJx3yMy5+DHESBvcHQWLQGJPcDQq2
 mIZGPBnb77sltrrpyv04k9bLHe8R5GSVbrLWg0gcOlHFIK853yh0QHV6zDslu4bTk+I5
 YhooXYFVw8YTZFCBBzzBZrm0pyDDB88wkHNyAQcURPdNRvpKEQaxfsSUUz9pWr1fe5LZ
 RUB+z/uK0u44QkdF3J8Yl6rqatJaF9829WwqHkxyPh8ClCJg4s5V9giCpWx4U0OayUwW
 YGYA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782884367; x=1783489167; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KYp1JzS80HQSdAHxYVhqKVkD15bXuIjv4eeqFTsrsTw=;
 b=Bcc2oMzY1KKdtkAvz5rNbBkIOGex0cZJT6yKP0fJjrHUNNq5OfMNRqLFadsGVUgfHf
 WK7WTBDd16rK8XTyLmaiaD2JLc1s9fzLdXEnrtjYvClJm0dKU0i78QuxZsQEMSgOoTTD
 MV7VUlRm8XrHUQ7Z32mKo4EjQ5ggCRYWf/9neYtmb1fLLp2Uhro02X0KYQHTHknQX8lA
 Rd7e9vMSRbx2u2S+XHv1imVG5KZ0GpBg5oW23IEBjB4aRLHM9Z3qc6E7IqHqp7Q2oHk2
 yk2aQwgHFwQVGwTQBifqaUjXQ1vHcO6O+FbQKw0tHh7DYdYsBi1cpYwVEKYwYV5g1qVx
 ivBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782884367; x=1783489167;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KYp1JzS80HQSdAHxYVhqKVkD15bXuIjv4eeqFTsrsTw=;
 b=Ea3soNYv6xhzpQmngKDhpVPgxjt9IUG4d23KjT054wLmZQdyC0Pl28w39XPYJNnbOd
 l0ukxouXlFDSs17FJU+XogwDIBrl6LWxOzYGog/JEeDdpgJcn3GMO81VY0CA6wJDJEcJ
 I2U/CghKZChF4Jts/rdr+fX6z4LbHn+WO+yTfPNrzQ/noJYlijd3ygyJJ4m+HhyDgi1P
 9a9nZMbxFRwia66M37txYl0v99SOC9e9+3GZDIzrQYg9B0HF8ehI/BZb0Cyxg51eqsDc
 kUcg/j8OjOyQV5wfWKrZiRbTr88r1Af8cvIWlncdERf6fydN/H06OCdt/IXYH30LsEMk
 s1pA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpSLzEnP/AVlNlBQlENYvHBF5rwfhALP4dfl5r8kJQNwGGYHk2ozuY9NXUJJYDPFx4frLG4B5G6s5j/@nongnu.org
X-Gm-Message-State: AOJu0YyNYFx8VfHVkHkqBSzxj3YAwNYOY9K625IpQ4aWtZdT25fX9kJB
 aMiets1p0yhW1EuT5lLumMCdYdlb/9MGMDXlRTVtnxw8Rx7VBWrljtGVfmbpbfPpI2sGeiipvy/
 OMlqjZGg+3zyjdwig8a+7QHuy5ktbixs=
X-Gm-Gg: AfdE7cnLfGiJmnR+DtTPCzGJHjB14ir+HEsSbzRq2x8pnuZVQjkpOpDxVXsoOkqJayE
 eDFOM2XNxuWL0JD2DLdACWAwH2jY/fb6FBq+wU45SUyESSi5mUYrfPvs/X5Hg9uTDE6H87GFSpI
 6rhVFDbyDZMFeqPe4Ohfc+e79ojls4sWOOwQRNoBZhMCHxaongGN/AXND52SJlMjYkCHcVqFSKv
 tqcQaadEP5wv1bizEJ+1+ClRuPfKYGb8ePvX71f4UxEiZYn4PQP0RYB9DQWf3T7Uv8tx1HGZoLc
 mIs8B4oz9OJ2jCmgZ1JQuk9Y+2zc667JSUKXjg==
X-Received: by 2002:a17:907:a80b:b0:c12:695b:8864 with SMTP id
 a640c23a62f3a-c12a9d715admr1863566b.18.1782884367254; Tue, 30 Jun 2026
 22:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260630211044.82894-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260630211044.82894-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 1 Jul 2026 15:39:00 +1000
X-Gm-Features: AVVi8CfN1qBHm1SW_wvwduVF3g_ASOT8GWiF7_bn2xE026xWHvPRRH73HufOYE4
Message-ID: <CAKmqyKOoOf0qX183TDVY5cJsBFrJk7sSvfsEudBx7ytuxzBa_w@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/riscv-iommu.c: always fault with SADE=0 and A=0
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62a.google.com
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

On Wed, Jul 1, 2026 at 7:11=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> riscv-iommu spec: "If SADE is 1, the IOMMU updates A and D bits in
> first-stage PTEs atomically. If SADE is 0, the IOMMU causes a
> page-fault corresponding to the original access type if the
> A bit is 0 or if the memory access is a store and the D bit is 0.".
>
> Note that SADE=3D0 and A=3D0 will always cause a fault regardless of the
> original access type.  Right now we're faulting in this case just for
> reads.
>
> Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3551
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/riscv-iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index c9687e01a8..70eede3f14 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -480,7 +480,7 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, =
RISCVIOMMUContext *ctx,
>              break;                /* Read access check failed */
>          } else if ((iotlb->perm & IOMMU_WO) && !(pte & PTE_W)) {
>              break;                /* Write access check failed */
> -        } else if ((iotlb->perm & IOMMU_RO) && !ade && !(pte & PTE_A)) {
> +        } else if (!ade && !(pte & PTE_A)) {
>              break;                /* Access bit not set */
>          } else if ((iotlb->perm & IOMMU_WO) && !ade && !(pte & PTE_D)) {
>              break;                /* Dirty bit not set */
> --
> 2.43.0
>
>

