Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4079C43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 02:16:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfTS5-0001TS-6v; Thu, 02 Jul 2026 22:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wfTRy-0001SW-Cg
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 22:16:18 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wfTRv-0008Gr-5v
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 22:16:17 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-698e5859a3cso172592a12.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 19:16:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783044973; cv=none;
 d=google.com; s=arc-20260327;
 b=kQslAPlXE/L/2UxdOEC1NExgEnXtAPDD5z0DAdhjPWB9Nrelli/rZ7/rHnGp3ZcBRR
 2qk9c/e2nC8Tf6cuTa3YnhB48nPRgG0B4mqcDf5hgMxknesaritAEm/EUatJ0XIP8a+r
 TwrIZL9UNqn+Mi+8oW6pML1+ZleEIWfkPxF/OPAyzRhNpnJA0R4x1aB4k3gAsa8mAW5J
 ydx2THrGhrJwAr1JCHVSVCHCT4VDBkcnSPh4gjHSBOOjb7/zWzpgAF6ne3WaxRs8PmP9
 di4bq4OaHYuUounWV35mNQUtfy7icl1RkxAuxZYu/d4LLf6+yv0d/0AXU2BNashkGf12
 IZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Hi3BG2S4Oq2JxEk9R6XNSK8TycyPNIWjCMmsfwGzv9U=;
 fh=GqJSyCt0NIQEcRSXcM4ZQuDVdVGgY3lYRVXKoS5u59Q=;
 b=Vx0MiBV7jD2/H0dDJpR19Vb21WtY4OGwQmj1xIIxLk59lbQLHevPLNPpv7mHhYid0x
 FK+Al9i2A9noTJFoHt1DEw5juuOGQOWZENdVGaT+itCUQdGTFkeEc0ezAliJqtnzbFrN
 D0X0uXPrw/7EBudb9BQHtLtYB2Jd25u4fMYsPk43JQmB1+dxnbkFAOjEybbrXy1/Uymm
 gjIfepwtocUonIZL/sGaite3wFqYqVSMxGMpkB4N3WASQyBebnEAFcYDNNoVOBbijcm+
 2L1AnDnxRjAJMlPSr7lJS5xWDxfECUnpmQGGh1IZjk/R/lPdWh7aAWhWriUsjUZdc/I7
 CJ+A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783044973; x=1783649773; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hi3BG2S4Oq2JxEk9R6XNSK8TycyPNIWjCMmsfwGzv9U=;
 b=RE18Eh+NJSQjdRosjdurdNruQ08k0iUZSlDPkDc+QffVD0/vBeD34S4cyEc3xgLfBD
 WHOq9GwfEjadDq1bEHddWt1aIm5u/yr/ZJ32iihtARhJ8vQTdhUjpakQHsWdWgrd9jxi
 erBvEhwT99mURuuHlI/JxfZuWhFUtq3/3K/Vwc0tR2h8573GpY9CmVAP8VjohZFVXotZ
 dE5KUsUqfVeakEL6Vihw1wkqhhb3l5dTK0vuxjvBPoCTj0+Os0BnlrkwdA5Zn84ZPuz/
 gHjzbyQpoArw/dHagDL+LFgaMebh5EyrQzI1uJ77Uqr4wu8y9jY0/YZVeoG7YT8DHcN3
 hqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783044973; x=1783649773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Hi3BG2S4Oq2JxEk9R6XNSK8TycyPNIWjCMmsfwGzv9U=;
 b=d3SlTKLqb9qiIOZ7gxbrzkEKGMZQmzvoptWhPtsVBPNddVoqoUK9zZ4OvzE/mxzJTk
 qyLsSlPvMVZ6+hPECuVfRrHqMj8tWopR7ras/5MNAFjsGApOHW/v7a3S7Ui7AM65QWKX
 J4qObsguXuTz7J2MO9UnF9+5Gkx8kIxvEVbMshNzXCUfUCrTphb5ylGJbajR1jtVN+g1
 8oOS44Es0FoqrFzb9u7NNLqsPdybOGC4s6UYuMxJH9wUxpEynyhiwNNKjq8rvVrMQ0R3
 /An6w1EMxeLWNg1Bo6QYMRt+8f+LEyZhLB6XVShb7jfJcPv399KkFTTyxHlMNIZG/LLg
 w6UQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RolT94YGl16eZKjL1BAZMeO0AcsFhjNnLVQOjVuZxX7NzTHx8zuVFx+gJsoce3UdhYGbhqCr5Zzuxzb@nongnu.org
X-Gm-Message-State: AOJu0YzFYtNJvRH+6Ef5IwQo4xgY/kMza//eeQGV7d1Q2BE1StGmE8Fl
 26pVqo/yeMUK35CMI34f9pJET+otJRLbz7nNnFs4YIvYgVt3ipmxaYknbr3p0iB2AcyRPeJJc/Q
 NSpaFVSO9aCtVPjDGr0qodS6xDequmlQ=
X-Gm-Gg: AfdE7clTlftqf9NmBf3G61LyjZerHjrl8G+o20DVWaocnsVfgCYkFdsbP30NAL/yYGf
 tzQOF3b4EAx/dGvT8bSTZj1Fe05+mQSh0VzO9mTzivdBbMQtivrVTkbCCLpjzSpoYkaCbw6Rxou
 GxluaMTznGU7aJtrLoa82NsYtfAHtx6ZwfY9j0xOh2tt7ib6QJYyYezUdODs78Z43gKd5n2hX+v
 mpwkyE7jFL/qT+pAh+TLSiPD28Gd9kQ1+1hzrukDUvRxV52K4EsNMxgQFbNynbkXP7ohFaBSot/
 FGnzm7dVqg0r/E730w9H4LVV2kU=
X-Received: by 2002:aa7:cd75:0:b0:698:aeaf:2d9 with SMTP id
 4fb4d7f45d1cf-698c1039a8amr611045a12.2.1783044972587; Thu, 02 Jul 2026
 19:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260701124034.552271-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260701124034.552271-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 3 Jul 2026 12:15:44 +1000
X-Gm-Features: AVVi8CdRN8JpEpdu-8OGjC9yOJHwoMtShyYL0ewZLKP3dioqEOfRzznMAYzFzP4
Message-ID: <CAKmqyKPTWMmO4p0Rc1rfinDc0vP-JQkrR5X3UPkEuwvmv1dXjQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/riscv-iommu.c: fix fault type for spa_fetch()
 faults
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Wed, Jul 1, 2026 at 10:41=E2=80=AFPM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Under certain circunstances, like the one described in [1] and [2],
> a read operation that faults will be logged as a write fault instead,
> and vice-versa, if they happen after the translation phase in
> riscv_iommu_spa_fetch().
>
> The first problem is that we're overwriting iotlb->perm with PTE flags,
> so an IOMMU_RO access flag can be overwritten by whatever flags
> the PTE has.  This will cause the wrong fault type to be thrown at
> the end of the function in case a fault happens.
>
> To solve the iotlb->perm overwrite we'll bit_and the original
> iotlb->perm access flags with the PTE access flags, preserving the
> original access type.  So a IOMMU_RO access in a R+W PTE will result in
> a IOMMU_RO perm.
>
> Second, the resulting fault is received by riscv_iommu_translate(), which
> will then report the fault.  To do that we require a transaction type
> (ttype).  We're prioritizing checking "perm & IOMMU_RW" to set a
> UADDR_WR ttype, and then checking "perm & IOMMU_RO" to set UADDR_RD
> ttype.  The issue with that is IOMMU_RO=3D1 and IOMMU_RW=3D3, thus checki=
ng
> "perm & IOMMU_RW" for a write then "perm & IOMMU_RO" for a read will
> cause the read fault to always be diagnosed as write.
>
> Make the iotlb->perm matches more strict: "perm & IOMMU_RW" must be
> exactly IOMMU_RW, ensuring that 'perm' has both flags.  Then we can
> check perm & IOMMU_WO and perm & IOMMU_RO without worrying about
> overlapping with the RW flag.
>
> [1] https://gitlab.com/qemu-project/qemu/-/work_items/3557
> [2] https://gitlab.com/qemu-project/qemu/-/work_items/3577
>
> Fixes: 69a9ae4836 ("hw/riscv/riscv-iommu: add ATS support")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3557
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3577
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/riscv-iommu.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 974042d017..7f94ce152e 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -282,6 +282,7 @@ static hwaddr riscv_iommu_napot_page_mask(hwaddr ppn,=
 hwaddr addr, hwaddr *out)
>  static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *=
ctx,
>      IOMMUTLBEntry *iotlb)
>  {
> +    IOMMUAccessFlags pte_perm;
>      dma_addr_t addr, base;
>      uint64_t satp, gatp, pte;
>      bool en_s, en_g;
> @@ -509,8 +510,16 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s,=
 RISCVIOMMUContext *ctx,
>              }
>              /* Translation phase completed (GPA or SPA) */
>              iotlb->translated_addr =3D base;
> -            iotlb->perm =3D (pte & PTE_W) ? ((pte & PTE_R) ? IOMMU_RW : =
IOMMU_WO)
> -                                                         : IOMMU_RO;
> +
> +            /*
> +             * Do a bit_and between the PTE bits and the original
> +             * request flags to determine the exact permission we
> +             * need, i.e. if the original request is RO and the
> +             * PTE has RW flags the actual perm is RO.
> +             */
> +            pte_perm =3D (pte & PTE_W) ? ((pte & PTE_R) ? IOMMU_RW : IOM=
MU_WO)
> +                                     : IOMMU_RO;
> +            iotlb->perm &=3D pte_perm;
>
>              /* Check MSI GPA address match */
>              if (pass =3D=3D S_STAGE && (iotlb->perm & IOMMU_WO) &&
> @@ -1727,7 +1736,8 @@ done:
>      if (fault) {
>          unsigned ttype =3D RISCV_IOMMU_FQ_TTYPE_PCIE_ATS_REQ;
>
> -        if (iotlb->perm & IOMMU_RW) {
> +        if ((iotlb->perm & IOMMU_RW) =3D=3D IOMMU_RW
> +            || iotlb->perm & IOMMU_WO) {
>              ttype =3D RISCV_IOMMU_FQ_TTYPE_UADDR_WR;
>          } else if (iotlb->perm & IOMMU_RO) {
>              ttype =3D RISCV_IOMMU_FQ_TTYPE_UADDR_RD;
> --
> 2.43.0
>
>

