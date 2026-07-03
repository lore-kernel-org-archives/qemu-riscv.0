Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58940C43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 04:37:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfVej-00016U-C7; Fri, 03 Jul 2026 00:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wfVe3-00013y-HN
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 00:37:00 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wfVdy-0001Uy-R0
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 00:36:53 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-69531108f25so314320a12.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 21:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783053407; cv=none;
 d=google.com; s=arc-20260327;
 b=kBV5XqseWG44+raBRZgXhcHdmY1CVpWfh3utcWj2GAUlNwK5Dbu2+TLTThnVA5B4w7
 aIHAhT49iRHL9hr4TJQKKc+4hvDh3g7lsAKxyGCeIq7YrEG5PMek1529qQTgFHrjxRNA
 Qp5slyPYcFi/vsRp0PCkuEVZ4A6pAofLn3FoCrQKWB5uPyswFcuqhuMnhJun7Btt+A2l
 8peXmRT98CeXKgX4jJHr55hyMFV8/jHna8Nt7HbvlIN8eqPOi8IoXdI6hb1CI3WMvNCQ
 /U4zyVDiE6nCrpR6HS+l6+N9hsw53+MD9Sxp+E5KkRvRm4kIcDKPDsX9hCh5GnriPKkx
 tNAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=G+46/Dpi0EvwPiK3I+01DnAKPbD3h383JDUavSOz30o=;
 fh=EKbHZ9B1oG0o1KLFTPJpEfsn/SKOMt5I/75+YXc3NhI=;
 b=XU3gjq4MNix/4PJEV3y5HzCptCJX1lX1vHO12D8NkfQVrgSTykt2PiYzfq3r2bfvyk
 ug9KyhpAdS8bzFntcxLZhRLe5IU4tW69CvGdKoV8hmjgw2ruRPYRjN76Ee/NKPYfuZM+
 2Y/6al1sp7aSeHwwK1gLLmDHneKFT+Pc462aMz645Rbq8FdDk/CPHZA1prGwrfWtajOm
 gAFzCLHmnxdTciLoiXhmaG+5pj64ZEsO0IpDiUau4L1LShsyNKP0QaiPc6gecFwSq7Kl
 jELatJOmoy0Tqmt/3rx3A140VywmbnuakuNxc1fihCnRGFMGAsxd14E/H+79fHKt4Rwa
 /nrQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783053407; x=1783658207; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G+46/Dpi0EvwPiK3I+01DnAKPbD3h383JDUavSOz30o=;
 b=UE6bdo/4HNuH0hjk39L+GorkSNG7Xbqw7eyTdUvXTWuxd4GXn07JUbtlYQQCtcMpPX
 ++rdcla/FvBAzuljbvDATQshZSjnQlblBRXyp+jOQrqG9PTo+ESuPcWSZEhnwexTQ7Xb
 VCM9yjXvBAh1xp/WJGGvv7LOGYeo5mVHr+R+Ty4wmzXOAqv8lrLd/Qc1aRw/9SJOkKvj
 Q9IA6UUfSUa/8GimbdunMfHrxCojIZr7a2LnF55wGl+TNHExJdtLVoYZ1/HXLXbTC7u2
 sxmeSgzACBabA/zY5MZ9WAXy2Xg4RjmBtQMQlMQzYaL3ZsyFdpsVPm9PODa1z+xG8Juc
 jqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783053407; x=1783658207;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G+46/Dpi0EvwPiK3I+01DnAKPbD3h383JDUavSOz30o=;
 b=RHyEgcaCHFSCvSGdq954gQPrGH6HR2dIkwd3FjglWHkRKF28eL7NmgeZWAUWEaLOAs
 iIAgBPwu2FU7w5+mJN/suroHexm/r+gMxwYy4w98fb4RSZhy1rO9H+1qAGjXu/vYZB19
 9cVR38P6t8JprulJhsvhDS3xyARSBqFtqDEb6m90cE91Nzzr6wT1lEhFxHrMa1eonapT
 zBC8nha+VObhCH5QUTfOVWE6FhvOWKS5hqhmGy1nJuj8gDpKQA/HoUmuojypTQN5VS75
 3jDFnBPCJ7DVt4hwqWWHl4l9X8IbXU8emIH0jAj7HhZ8n7mjJJbkZcHiHlOAHoGOzgun
 zmEA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqXjrkSJZvuw32nC5qBVc33qURne5ThcKtyoWS1S9/Bh/rVEde5Xk1px9J6Tt9jEukgdoU3Wmr0hWdU@nongnu.org
X-Gm-Message-State: AOJu0YxzkSUWCHU/TiiEL7iZ+DwdFeJ/nJ31sFqmgJGl9B4ITTngFhJC
 LOfZlEXp2etzECa1Q7SX2/C4tk+44LtsUEXXVunHUMmeS5AsJ1QLf79eskRgHpxlZIbAPRoC9ln
 CI6qf0oW+EAvFDlJUsCqgyDrZP67JH28=
X-Gm-Gg: AfdE7cmKAtvQrJM9jcqKAUClhwzM8vtxEpthXU5jbibF0Um4K92c70ngdO0XTsVyYpI
 /KU2K+8sfO7Ii+Y//buJyxU9K+pA++vcrJeJW8f48VWd5N8FhQx23sgokjf/+unpwgV5oADurXP
 PWx0s6GxSA/JmBThhu7ODIpCz5czWa4wLXEHeax9Ey4zlsd4KaxIS1bnVo9bsECM+x8m9ETlUQA
 tTLopmYwtdEmnHc0dr5Wg/LPOmCvG3dXwJv/4Dhybam/WsKHuNGQz1zapk1413KmhmnHCCzYLKZ
 IqsB7RvdDOfQO4sR+QtlIa4S6bNDIF9qSB7zDA==
X-Received: by 2002:a17:907:c205:b0:c12:79aa:828c with SMTP id
 a640c23a62f3a-c12a9efd3bdmr363520166b.18.1783053407164; Thu, 02 Jul 2026
 21:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260629125719.679626-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260629125719.679626-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 3 Jul 2026 14:36:20 +1000
X-Gm-Features: AVVi8CeVezXY7p6RsGHwSmKl7IiwxtwIanaGHAGgHfjcu_ETbDCAoeU6BV4nvTc
Message-ID: <CAKmqyKM3ugvt_5jdXN5O07bXeX_rwgWMTh4GsdougiRO6JMAXA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/riscv-iommu.c: check reserved MSI PTE basic bits
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
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

On Mon, Jun 29, 2026 at 10:58=E2=80=AFPM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> We need to throw an MSI_MISCONFIGURED error when any of the reserved PTE
> bits (first doubleword only) are set.
>
> Fixes: Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3563
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/riscv-iommu.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index c9687e01a8..6828349fe3 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -648,6 +648,27 @@ static MemTxResult riscv_iommu_msi_write(RISCVIOMMUS=
tate *s,
>
>      switch (get_field(pte[0], RISCV_IOMMU_MSI_PTE_M)) {
>      case RISCV_IOMMU_MSI_PTE_M_BASIC:
> +        /*
> +         * riscv-iommu spec MSI PTE basic translate mode:
> +         * "When an MSI PTE has fields V =3D 1, C =3D 0, and M =3D 3
> +         *  (basic translate mode), the PTE's complete format is:
> +         *  First doubleword:  bit 63      C, =3D 0
> +         *                     bits 53:10  PPN
> +         *                     bits 2:1    M, =3D 3
> +         *                     bit 0       V, =3D 1
> +         *  All other bits of the first doubleword are reserved
> +         *  and must be set to zeros by software.  The second
> +         *  doubleword is ignored by an IOMMU so is free for
> +         *  software to use."
> +         *
> +         * In other words, bits 62:54 and 9:3 of pte[0] are reserved.
> +         */
> +        if (pte[0] & (GENMASK_ULL(62, 54) | GENMASK_ULL(9, 3))) {
> +            res =3D MEMTX_DECODE_ERROR;
> +            cause =3D RISCV_IOMMU_FQ_CAUSE_MSI_MISCONFIGURED;
> +            goto err;
> +        }
> +
>          /* MSI Pass-through mode */
>          addr =3D PPN_PHYS(get_field(pte[0], RISCV_IOMMU_MSI_PTE_PPN));
>
> --
> 2.43.0
>
>

