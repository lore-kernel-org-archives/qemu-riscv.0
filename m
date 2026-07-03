Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE09DC43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 00:08:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfRRp-00076w-2K; Thu, 02 Jul 2026 20:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wfRRl-00076F-J9
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 20:07:57 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wfRRi-0008Dw-It
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 20:07:57 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-693c51a8a19so40769a12.3
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 17:07:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783037271; cv=none;
 d=google.com; s=arc-20260327;
 b=c3L/0A5+GvEl7dNntpd26OlFmro/8FancVMXI5GGZl0QV99pWB5IJSBiA0BI+dYBZv
 JB3r93jyEErBl51kaPzLAi3jJ53djngjN18IB3g1MtNEmIdKWZMw15qT0uOiRPJPhA+/
 vURot4IF0hLn3T86E7e37qeQ4hD3sh6MUPNBDSoTmTjUvZ1jy4BblVGIJ4bZjJrW+1T7
 vK5exyTx9rkgVICib2pKz5SWZMghxppNfmX+oqaX8Lb8Ew7emd9WeTsIB0Ff0pW0IFL7
 4cWKsk9SXjAqNhqET5flHU+ICC1No+ZEug2I+d1X3Oms1tEVMQAJOhSMlOyi/RxLfgWp
 I0DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=LsIVRyBGuModU7s/j97tfSkR9yWnGQ92IQpv7UDlGpI=;
 fh=2u7oyELB8x6Bg7m281BI5d1VGDjWau49Dj9ij5i/mc4=;
 b=Uqh8elMsxjTjeQmJV043tLmGa+GeqbabZ2ZQ64KUOfqXGAbLxctnQ/9l/p/mjyc0N/
 pysWefC/sbsBPR19vBVXFRq0eu36XdcSNQi7b0OUmmqVlvuudHJsHr/MLGA160mX3uou
 BfvEAMDUKHjHWsQMTnuAF5G6i58Oh7WCzRn7vnjNahp5RXvA6smyAGBul/8FAU7jlK9m
 dIPiWgqbA7hI7C02K868glNM2ItPOXMnv92FR11tPr3hU7bz5hz/v1rTx6hxh+uDJDA0
 GwoSIHvc4hwXkdrerbxwJ2MrrfavvpGxdbymWsWZXRR3FQUFathq0YZzJWT4QC05rzAn
 p2UQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783037271; x=1783642071; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LsIVRyBGuModU7s/j97tfSkR9yWnGQ92IQpv7UDlGpI=;
 b=O6+kS37ZM+irrN4FTqBghlBu4AsRsRp+Awy8HvYLYlbTTlvZLoltfp5SLnVym3Ey0o
 gkirFmjw1F76djwRgvaiqnfJVRdmk2dB7tke7AJE+pI5UTu0P0BLMhKtmS+SU8y360NT
 sFmRz8h7jaah/NrQCjXxp5yLLmmurEFLUE6Rrt0OW5kYqUegluFp1FGyephbwee3pkat
 1KkoRWTgAJjgzEd2wMGkANjO/VOUI5onwXybHQfItSKjqcwjXhVJU6/0buu/1aoKFBWq
 aKSc/LrmwoPiHXaUzdhVUmHRbC0mM2pDuqErYH7btElTdZHj2dFpRFWvM0Ys6OiOzM2C
 e5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783037271; x=1783642071;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LsIVRyBGuModU7s/j97tfSkR9yWnGQ92IQpv7UDlGpI=;
 b=jNMPBJ++jKcvsuZj9zPs/0nE7fkaGmlFgINNwZP0wbAF3h/PZtOQLBXttl+PEHnQLf
 ZZNvV69BIXKWyiA4HMWJX6l6XAhgcdUKi3MG9jb16FlL4E/DRhIVaEGIhAii+Za9OAPb
 SjzJyuq+MeB0Wh6psNp7aGSFLECkeMSRnuaELsq5mZ90/ahgNmmy3wa5Cm8VCiGp5Q4w
 1p9Ls0fcm+ysJxqdTzHai+64ih2bsv7YaniG/LixxoJbcbm9JBi3KhxTdrdpTGHvozKS
 vNYXJDzhWh1rLFPrxTvlDOhkf9OMf4qGsvmz37aV4Gusu+/c0TqI5j+tyVz5QkD3zJ0r
 yrEQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqCNofeWL027k95qAaAPmb6Q3XcTEAeTlnXsupKkll57WfL1BIP216BTTDTNsoNGsv/TW1jsGwMatcM@nongnu.org
X-Gm-Message-State: AOJu0YwlFGoEhOWaS9vaPMUz/5B+Coy2JaKwZI1/0XDGRQgeBAGaZlSo
 eNQQxD02jdvt6Vv3fF7Y1dxrFWzEmJCrgTA5JsGaDKT3JNI6QVbXHC8PBegpgdgl6vCjrB9HQGG
 7644qwCNZfRICiTQ566DasrUEXkN5rek=
X-Gm-Gg: AfdE7ckr8faMBK8QN1yeKL0rfxVtPr7w9ylVteINZEF4eUZE4uV8PTIz2XVmIYhtHfT
 LSWRRDGeGUpMWisjcctJ51l9RkrG9gwe0LQhhjY+fE6js+bw8Z3xDGmeivX2G9kCZ8/IblLmyIU
 d3w6+dGwYIqhMScG4Jf0iCyoV0gGbMesRWg1r5pDmH/4AWJWFAXOz8oeC84sGbcHRB1rqheczDX
 Y5aeAjnOM72eGGs02QyKdm2mIZ88XKZ0cQIo7xrvggcj+ZKzDJpoQkUM525BOMJVq0Hqhyn4lbm
 e9IFYzF2ZlyRqsc802WHp1WhgJcM4QqsoCjdJQ==
X-Received: by 2002:a05:6402:11cb:b0:698:480b:2dd1 with SMTP id
 4fb4d7f45d1cf-6989f2f2915mr3730818a12.13.1783037271076; Thu, 02 Jul 2026
 17:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260701124034.552271-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260701124034.552271-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 3 Jul 2026 10:07:24 +1000
X-Gm-Features: AVVi8Cc5PadjDBb9dMRS-7BQketjGIFwWX8MV3dRu7ug6pA-cNtFcyQAP9PFAd8
Message-ID: <CAKmqyKP=9gTF4DdvXHLJCO7Lbor-=mC1K7+14yxUDxA1a=8meA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/riscv-iommu.c: fix fault type for spa_fetch()
 faults
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52a.google.com
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

Acked-by: Alistair Francis <alistair.francis@wdc.com>

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

