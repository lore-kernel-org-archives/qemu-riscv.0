Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591D6CD8CA8
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 03:54:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXsxa-0001kA-Kt; Thu, 11 Jun 2026 23:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wXsxY-0001jl-Pl
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 23:53:32 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wXsxX-0001Dt-5G
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 23:53:32 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-687ed9aabb3so984577a12.1
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 20:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781236409; cv=none;
 d=google.com; s=arc-20240605;
 b=IyHs0E9fSU56VbkKevB+uSJFS0ii3s0E4h5oqUGBmdh7dy0LKgPy1lOc2GAEYbFLPE
 mkJjbLEESgBHDpH+cqY7LQrpb9PHkyxC3SoFqDZL/5KO9Hh+DR+k7E1FC5nExwoaVNnD
 +4Uj4FQ1ZEl9v8OX1dunywDieMoknM63HFbpui3Y6jTZuO+8+iesRYxqmHQoEch/FeN/
 G7IsRV7m1ARr5oX4UxYCMXAErsPQVTfE3nn8oTSeGrROfHTZv3U+PKz+LZu4b4r8Qnh7
 eha+75xrvmGjqI4CJWhvca6n1HP2Op2oWnmdINEhKOwZAhYhTwK4iOKnk7RRsILEvYDa
 81CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=NT0jiI1LL8LpL+XLatjRNUWIc5cedH8v9+dfJaedNU4=;
 fh=gr/Nq/1QlrHRArvT4rvqmtMtLfFTjiii0QWfuc+bJi0=;
 b=Y5G+U+N0FT6Wo1C5XAAHu5JEsrCVmDWpa7EWi1ZcTRzFAFpSnqphAsxY1DeyLxdfzX
 P8efRYo1FxhZ2N3h4iaGZJfvk0PIf2uGRP8QoOYTxxXTSW4vWSCfEUyjlIYOZlU3VW9P
 pGX/L4V75Cq5hXrdz9qyQCzQUuQZbOI3BKVUnM1TI3aGibcqTpkZfOxOVOaTvQkBLZsi
 sd/Jan2Q2sVJAXqFBCIebJ8DIU/CnHaoOVXlz/aVMACBmaHiJgMrI7WUwb712ccghiKB
 OpJoc0ygSXUdwN3xvyidmhE7wqpQ4BtCargp+IQ2UgFIWKZDKgzh96y6bnZ0AhOHGdwO
 oKlw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781236409; x=1781841209; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NT0jiI1LL8LpL+XLatjRNUWIc5cedH8v9+dfJaedNU4=;
 b=AlTdkQrvqI4VpNsqFnUKPzYI98jWhEtzAGSi0KiSePcY6rfQc0i8NnuE8nbBx+aXT/
 M79x4EIxo/pQp9ztwpS/g5wvGvYsUhPrctGff9/gvENVmBDrrdR1Je5kYuN4G5iOd2wa
 QaMtDPmqyU7jtJKGJnWb+8/f5UNXCEb+xWFxl12DBu7YrngKhH5ZZflL7karu3Yxtx7O
 MD8h4s0Zakdzs/xBKNMNwAlIa1m9MUoS+ix61YM+f9GBnXMyk/jE6bpz5oKh0AoCbyXJ
 AxvKc7X6ZtenU2+6DfKlAfGzalLrSR6Qs/NfFN02Zz+exxNf6iIFfB0sGqRlGiJPTjmM
 BW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781236409; x=1781841209;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NT0jiI1LL8LpL+XLatjRNUWIc5cedH8v9+dfJaedNU4=;
 b=T3G+W+IteAI+QDSzJA1TCb/iewJTFEJ1y+c53Cp+9u/wptDQU1uEDMnV6oL3zUidYG
 Bv1EbEs86uvdlPkrsu1tu42tLZBGMJjnqQD+HolCkxxv3wxeRd4uvhKdbbg/a3RE50aG
 HyzXivcYwIR+VfW7g85FauSLXUU+ECw372WLBJJTy4sK7dpx+7nRYGGeujTE+TTMkRcp
 +2TLm2aG8VQO957BwmPZ8xupc9l1EMLHWPIzutxZQKcw3G94pf1BFPlPx7Dvlqvrlz3b
 fW9zXhBdbWQ33ZvTepn7HLGTYeq/QUJ09EtkZPHAJxaiIFVJzks3RNQLWVw8H6//S05f
 FRHA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+CmtNifepxUk+AiriJKfFM3ojEH4CJw68Z2Zg2uQ9Ac3lrH006yWCsLKBNSlhIdn5uMpD0dv4t/i2/@nongnu.org
X-Gm-Message-State: AOJu0YyfOCXlAj75LLhQsh30ciWWyCJhcoHDr2waZdHqy/aUet9zvwFd
 OfQ6lMRfAbbQHiAcLgEmv7/tQ+uBvqi/RfaOJJVB40rTaMCx3Y9gxe7FfLMPo/3EdvR1pnmIN9x
 Pq8iCc+XSZgVtcabZAYVBS+j4QM+n5ag=
X-Gm-Gg: Acq92OEFSXGwgf4guSKO843FF0b+M86oMrtof2LK+PrnLArNJCXE7+kDL7vwZ6bYtf3
 kb3bf7Q295c9gNyabVolZgKC8JTgmnmW5wkX+fiFD7IO1Eo/aXRquTBx+Ns/MmJcShBcq0WoU4r
 R8qA8xX2OcgoKCNWX8FadiAX2lhKBonxwqeiAZAUGBaciuuOYp073MktNZye4RPDGFPoDI7ZuqV
 d6YgIvNuT8ECHyugHIhUBwEx8bKr6UsNRlgKUH+T2cVo6iX2A10DxBYY2ZIBZQuyUKajbshIrIx
 3y/ri+IL/uzYYnddzy2/NzpjyvSNSrvrwPhQdA==
X-Received: by 2002:a05:6402:2349:b0:68f:cc95:ba5b with SMTP id
 4fb4d7f45d1cf-69378a9515cmr357891a12.27.1781236408994; Thu, 11 Jun 2026
 20:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260608210642.464131-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260608210642.464131-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jun 2026 13:53:02 +1000
X-Gm-Features: AVVi8Cd3PdcYY4Lv5bkQDoI3Ozt8d_lSUNo6Kfo3lDflORknv8xJMjd4iF-jCPg
Message-ID: <CAKmqyKPCRKMnrUyWEZerHF30Gwvdo7nds1LvFUiK=JoW27CSew@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/virt.c: fix 'iommu-map' FDT entry
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x531.google.com
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

On Tue, Jun 9, 2026 at 7:08=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Based on the DT documentation of 'iommu-map':
>
> https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iomm=
u.txt
>
> - iommu-map: Maps a Requester ID to an IOMMU and associated IOMMU specifi=
er
>   data.
>
>   The property is an arbitrary number of tuples of
>   (rid-base,iommu,iommu-base,length).
>
> ----------
>
> We're adding a no-op entry (length =3D 0) in iommu-map:
>
>          qemu_fdt_setprop_cells(ms->fdt, name, "iommu-map",
>                                 0, iommu_sys_phandle, 0, 0, 0,
>                                 iommu_sys_phandle, 0, 0xffff);
>
> This is easily seen in the generated DT:
>
> iommu-map =3D <0x00 0x8000 0x00 0x00 0x00 0x8000 0x00 0xffff>;
>
> The tuple (0 0 0x8000 0) does nothing since it has length =3D 0.  The
> information we want to advertise is in the second tuple only.  Thus
> remove the empty tuple.
>
> While we're at it, seems like we've mistaken the API and we're using
> 0xffff as 'last address', but in fact it is length.  This means that
> we're telling the DT we're mapping 0x0 -> 0xfffe, which wasn't our
> intention.  Therefore change size to '0x10000' to reflect the address
> mapping we want (0x0 -> 0xffff).
>
> Found while reviewing the RISC-V Server Platform DT generation, which
> happens to copy a lot of code from the 'virt' board, and this nit is
> also present there.
>
> Fixes: 2c12de1460 ("hw/riscv/virt: Add IOMMU as platform device if the op=
tion is set")
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index ce64eaaef7..0c489bb412 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -900,8 +900,7 @@ static void create_fdt_pcie(RISCVVirtState *s,
>
>      if (virt_is_iommu_sys_enabled(s)) {
>          qemu_fdt_setprop_cells(ms->fdt, name, "iommu-map",
> -                               0, iommu_sys_phandle, 0, 0, 0,
> -                               iommu_sys_phandle, 0, 0xffff);
> +                               0, iommu_sys_phandle, 0, 0x10000);
>      }
>
>      create_pcie_irq_map(s, ms->fdt, name, irq_pcie_phandle);
> --
> 2.43.0
>
>

