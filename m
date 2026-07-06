Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C983C44500
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:48:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgZNL-0004Bu-DF; Sun, 05 Jul 2026 22:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgZNJ-0004Be-Vo
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 22:48:01 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgZNH-0000oy-Mt
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 22:48:01 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-698acd36d67so4634040a12.0
 for <qemu-riscv@nongnu.org>; Sun, 05 Jul 2026 19:47:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783306078; cv=none;
 d=google.com; s=arc-20260327;
 b=oS2XQ0FxdDXBO1leQarDdjphLNEFdjCVgDnQcymkqW3nemBD3k79q5QByyWzHO6WgX
 uISP4uiVtjfkk3PN4nq94AkbizA6VAK+GFkoXr0pQP0wwmxmfVhNh6lcMx9KFuQJh/Dp
 PoKUzt29kW4qdd6zutVgE5RuccCSYJuf/W1hJQw27nSDh7ekXP4toTlJBP5JZyZHkpAR
 PB+jB4U5URvudl7aYiAUMBSZsVYRINgfFMnxPtUFDZgvCzLuGdrOHF8LTf7C8e20uiWI
 n9OdWklswnn0r/8iuYaEFhUI3IEHqkJdDtQ0ugb+CNvngPm5rgy8DtvraAF12doQk9pN
 bFbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=w5/0NXa9HSugiv6hw4tHhtMykE/NIFThL0bmySBOzx4=;
 fh=mvqClan+oBPLk4eWUumUGvNOa8zoPtNNcUzfnTk2KO4=;
 b=j1HNiEBODhZnNd1YGbHaTrzI9qLcPrW5NXjeDzucFBGUVVR0FL3gro+rRCiaEfAAcQ
 uT/w9oGOMIXAamqwCt89RNT48BFZd8v8h8/f7If14wm6UG38wyTqO56cq9FmZOVHWVLC
 pCel/z5IfzSJ+YzYU7qCNRtmh0cJER6qTWIRtzJ5y62WcwmsW1CZViiYmzVMh5opjqIn
 xDqYBCLjBVdRdfUUSzVT4iAmoYHF+3VgE7c8amMIePO1RKGgbofn0/QdHcpc/0j1dZq/
 gkCR7GmntsQjslHzH884o7OtVicUH7LlbTOEbgHEZzNpHL1HPk9loBQWPrP00rYbzCnH
 649A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783306078; x=1783910878; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w5/0NXa9HSugiv6hw4tHhtMykE/NIFThL0bmySBOzx4=;
 b=L/5kxqQjSBGhkaVbQ50tES3Oeq9kbew2eJV/9boABiN0FzR02vd0JyETU1kTgs5KsV
 4MbTCDBKjL0NSZCtT3RmdnzeBVAsUr47lX08CeAgV2mGuqbUL65opp8B57I05WJJIzkK
 UXw4UpPVO8NmWxJFGAMJ5S0/BqQmic7R81O4PjHNfkZbDG/uFlMC1yMhrZXU2VWOPqgI
 Ew+0hiboXBID7zVVyEU06B2Rrz3cWSGzXZZbh1zrbbKILL1Dp6HXP38cJAdINrHKv3hM
 b4MhzLFcWKBdWMdP+i6nbDkPKRRtKw1HFrc7uV1kM4K1orKQRihSuf7G7PlrK2TM50qF
 td6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783306078; x=1783910878;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=w5/0NXa9HSugiv6hw4tHhtMykE/NIFThL0bmySBOzx4=;
 b=IVWfZ7b+L9AEPugYSA+lcoZTevvw9ofvKn8CMvD7603V2QHnnIyrTqHSfxNtUHdtkN
 2DoW8Nn28lRy1F7g/vtTRDpR9t/65iQ38Ix0ieOiAlq95QKjzoEmfPRB5mCkwSVSUd7N
 4uKvSYuoiS5BZ6tu3MSAitTeGmUR9VGL00xLOLW9rOt43a9itZus7Ldkl2+PzGXCRld3
 YqHyuui0Z2rFrYCxiLs3FPe/ZOb1P0ETal9+nTCggYfnvlnYcDZnbqUf+QcxZdDuexgu
 XAuUrdy+Rgjr7uNAkZWR0dGKdE3UwJNBJI2rmK2pMhm3MuuDS0IXXurxkGzR7WDuPAF0
 N6Fg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr84h9elE8RQUHK3EZCzDv5qMByOh4jf1MRcB70y0S7F+CY088U6AhXGUcO4dBQOK787z+Gcw001emj@nongnu.org
X-Gm-Message-State: AOJu0Ywgzyx1pMuAEgJRmoIjHkJ/w7hrR2caYGTt69hHGkBEJBIf1P29
 +Ph3nKJt1aKvpqVSLMVQQgPKeD+KZ0McWF4CZqfDyoBuyTAQUr2gC4LuoajkSHSQ+5WFYGBaYU9
 DK0lAmrWcAAt1Nf67jdgQ1wmewQNueqk=
X-Gm-Gg: AfdE7ckvV/reb6xQQ7/5JuQeUbJIX+IoqkRuKzIYi6H690X5FmHAs81uKi7Zd9iXY1I
 t1nk0dneLs1Kgrw7L2/+lRFPmVySel5m3CC9ao11ywKvMGcAR24Qp0VSMJv42L5rVvMoRy3/IvW
 u9QtBSfk5yEIxEZZyyxSm8t7QgKSoUrg1nlYzlKiPXaGNUR/gL20UrSDomtEHOL/N8I93CjzeA8
 KEsAOQWEoBj9kzBQqI6Rj6E7t2Xxx2MsI5U4SP5UBGjNDtv5RrAV5ugTZz30xs+SofvTByaE9RX
 p+fJqGZHtm3zVUhBrLKc5KSxpe/wZHiRRjQmNQ==
X-Received: by 2002:a05:6402:5418:b0:695:dcb2:7438 with SMTP id
 4fb4d7f45d1cf-69a1a3ad324mr2746611a12.28.1783306078115; Sun, 05 Jul 2026
 19:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260702171202.1322493-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260702171202.1322493-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2026 12:47:31 +1000
X-Gm-Features: AVVi8CeSQD-wtHPdO_Xaz7mlBZizzXcrD5iLwX8J7x7_xvAf5NhymDwj6IuEzqQ
Message-ID: <CAKmqyKNQ4k90C9viNJaArX7GgMhHXN_+PuZw1W6-6DJ+3jVWbA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/riscv-iommu.c: update ioval2 when faulting in
 spa_fetch()
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52e.google.com
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

Acked-by: Alistair Francis <alistair.francis@wdc.com>

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

