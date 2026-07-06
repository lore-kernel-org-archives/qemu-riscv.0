Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10C8C43458
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:54:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgZSe-0004zv-6M; Sun, 05 Jul 2026 22:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgZSc-0004zM-UN
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 22:53:30 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgZSb-000236-8o
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 22:53:30 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-69a50b818c8so959198a12.2
 for <qemu-riscv@nongnu.org>; Sun, 05 Jul 2026 19:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783306408; cv=none;
 d=google.com; s=arc-20260327;
 b=Yi6hXLE+w+7G/I5VjIw9tvFAmuA12G8mwIltqKdhkhR5baCGIx8myu+xdJJwGyA47+
 c0GaGz2mMTOJEitD6wWT7JNmSg9SeZfRoAGqi5vPb8zyrEV7cY0+rMVmQEOcwmuux+3T
 id4gi4x5fM79MyLPsBdicCQLnhYpkgtUVy3V0wwVoZxZv9TGlOWlF2PjaPzgFtwVMjUC
 VHKPo76InCvQg3N1o1O/k8A7641nr3soTlXjw129dSh6USVcqt+n+TZI1qUulqO6z/Ps
 Ob7Ka4oF4glNYUKvyj+rLmyyoeu9dsDDifGgjEwb+6vI9p8P7RHxFklIJO9NqlCTYPdb
 BQng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Arc2Od2f3ANGbXM98pUy8eEy42FzSXo2KHCJm4qE/sY=;
 fh=xUFZ/bH/OmizHwtZj7LugMt1YZkEMTDdYdN0kewklPs=;
 b=cBmeP3+YhSSvOD+9kw+54Aal+VBHN9uXIFvZJ5NdVNnNSPP9FzBGB0T4TB3970gWGc
 QJX/QiI2K6CZ84P07l5iNv0l+4aQ0dsa4iAPQo4lMzAxs/25odyZKQkKyD6acO3yFEA2
 tda6HUmKRIzTDalwEn71rtbadPD2ThDk+ZzSnOuEZELy04Hg9TTT7fOETeJZ6gHPX6x+
 DWBUfKoL5z/6V+djYGdz26TOBvkXyJScw+JDJ6mKxHl9fU+kJ3qUYbZEMf6Z5Mnkou9m
 muoDb6U/n/TkUEqr1EN7+aLgoKGdRHDJ+c0JFJBF8tS/asm9GYFtTokXbSThMSJY06Ft
 D3pA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783306408; x=1783911208; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Arc2Od2f3ANGbXM98pUy8eEy42FzSXo2KHCJm4qE/sY=;
 b=YvMdmWu7nPlebuK693tXdZ1cXpZnvDBkeckuJ84Ogmomrr12bgE8tQaO8W/NQfNNVy
 ie3wGz/hkbL0L/6L8j+5XOF12Ea66zrWG04moJAR1TLRiuWXZEPKWIEDkJhuXL7YwrEM
 +Obm681QO89BiacLIulyucoImW6JTDn547/eMz8vnIFq99jKSXZOl8KS65r0nA9AvlB/
 63Bq5JierHySzi5/PtxO/BID00+OvbXUhDs297sQbbKRIupeNp+SpAohzOaMD2a6cJVS
 wvbXY36vdhKm2vWKRldDKo3n8rSFecuASkiwn+aGah9R51zAlIoiS004Ddtkh6Uu0VQC
 +6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783306408; x=1783911208;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Arc2Od2f3ANGbXM98pUy8eEy42FzSXo2KHCJm4qE/sY=;
 b=PLd5HrC7IYePYWL+n2zitYCquuiH5Rmto/ClsJDd7iL2nj3Bsm39iFZqQV05AnLXj+
 AtbhXdlhLwL0InxRb1rzNUE0DZ3M1AVwU9iF9o4uSLWFGJZFcmXEtsCaTw9yl+AfexzP
 fzGV9IsvLYgY8xeXoWVWDenU1MTEewiCORDje9aDult3RquqCBsBm4jDyE7rqAPqo8p+
 BD5jctujNTAVDTsfTWMvFaLVoNzloNDh8akm1tkv6NTh+F72eZhRMqGYEtkI+S/CUa3+
 Saf0iwpxAUQiOMlCEoiTAAmu9zjEUjmTgCLBCzXeubWUR1Jn0dFEFZClW3GDRUpw+Xz8
 0MXg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpicZGI18ioCbvfmOD0NO1D/MdkaahCg+ym3DlL/k3JCIm5DCqo8qP0o2StlIgxgx4Ohu79lebwGP1O@nongnu.org
X-Gm-Message-State: AOJu0YwOGo00Ok8gyYJsVMErTdkuxiM8u7FqIQhtbr+FhJuf8XrQ70/5
 fmRZJHECXBFQHOavkRrI/BzyxBzI0p+01VhgtPPVWM+EeZx/qFA9iGWKLy3STYjRlEhob3kmKsG
 vk2OqT8UhPEX+Y1FKeHl7+p+bG1r+58I=
X-Gm-Gg: AfdE7ckasbWk4FySs9vrbBaSrCjajdo9butz/VdSrXtx5555h8Fdv7V+k8sCs/Mb+Re
 GfK1xSG5bVyYE6khFRNhOXrcu0wqe2ZrhZ2fAhryvgaUGnfH5JFiJOJPsYkSx4Bvjsxx/h6Hsh6
 bMh1xBLT+XIm0/jZAq8h3IDjeGzJVia5vBhuANqidcr5btYr/6xktae0Ul9ppEo/pa1KiYlDAbj
 2xNFx3bNbR/m56+x9d6LuNuJ8/fodR2VwAOCHu+31rXmOlCthm+rgK1JISiVln21Kpi237bbIBv
 ZgsYR98Ur2TM3noHhJTnHLJVBWQ=
X-Received: by 2002:a05:6402:3908:b0:698:1504:bb1c with SMTP id
 4fb4d7f45d1cf-69a1a3b1f86mr2732790a12.29.1783306407435; Sun, 05 Jul 2026
 19:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260702171202.1322493-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260702171202.1322493-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2026 12:53:01 +1000
X-Gm-Features: AVVi8CeRXiFLLXIyhCJYRQbwnudRX945Y8IcVhMQ6zc6hLYIfRpbGjwlk_3md1E
Message-ID: <CAKmqyKMxLjAaG2YUbjC-HkYHg2iUyW1mBp2Yfm_WzTvk4bJhCA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/riscv-iommu.c: update ioval2 when faulting in
 spa_fetch()
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52f.google.com
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

On Fri, Jul 3, 2026 at 3:12=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> riscv_iommu_translate(), the only caller of riscv_iommu_spa_fetch(),
> will use riscv_iommu_report_fault() for all faults it detects.  And it
> will use iotlb->translated_addr as 'iotval2' every time.
>
> At this moment we're updating iotlb->translated_addr only after a
> translation step is completed, meaning any fault that occur before that
> will have a zeroed iotlb->translated_addr, and as a result iotval2 will
> also be zero later on.
>
> Keep iotlb->translated_addr updated with the latest translated addr we
> have.
>
> Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3559
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/riscv-iommu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 974042d017..6761b77f95 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -546,6 +546,14 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s,=
 RISCVIOMMUContext *ctx,
>          }
>      } while (1);
>
> +    /*
> +     * riscv_iommu_translate() will receive a fault and then call
> +     * riscv_iommu_report_fault() using iotlb->translated_addr
> +     * as iotval2.  Update translated_addr it with the latest
> +     * translated addr we have.
> +     */
> +    iotlb->translated_addr =3D addr;
> +
>      return (iotlb->perm & IOMMU_WO) ?
>                  (pass ? RISCV_IOMMU_FQ_CAUSE_WR_FAULT_VS :
>                          RISCV_IOMMU_FQ_CAUSE_WR_FAULT_S) :
> --
> 2.43.0
>
>

