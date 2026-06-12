Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2ACCD8CA8
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 04:07:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXtAb-00043N-2C; Fri, 12 Jun 2026 00:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wXtAZ-00042n-4K
 for qemu-riscv@nongnu.org; Fri, 12 Jun 2026 00:06:59 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wXtAW-0007QY-Ts
 for qemu-riscv@nongnu.org; Fri, 12 Jun 2026 00:06:58 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-beeba001887so73145166b.3
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 21:06:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781237215; cv=none;
 d=google.com; s=arc-20240605;
 b=CbQ5GrPFYKP1wEggswn1pSUF+PdVM7LiTcMPVHgG2kiYNRX4LAkTdWHIInspi38kWz
 /AkTlKsfgzxfWLBtHISxumGBq+uOk08ztgDYjPI+FObB4o5um7G+P4n8uV7YicAhIpZh
 Ik0G4SAm/Ui+u66zhQ/vgjSYlirQWmAiYT1gO8+18m7GUpiGeIEFJQ0raYL5unjQFWjG
 WeqQIUIXNoLz7oaMZuQnCT1zI8cFym9YFnU5+BQ4el4ChhNS2mU6H1BdxQmRL7WhyIDT
 9czG5BXENxzd+f7Itk8EtuZUqt5mkwskNS9EKvX7o/0pfHsTx/mJG8Hm3EiBPTE6blkF
 4vRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=miGF1yHVafpVx2qupDeuM3gVrtYBw2ce86jlAdHCQAI=;
 fh=4XzYX0GJRHOE2nAfTIHNCtBAfwfOz56rQTQ4/Rzzou4=;
 b=OEYB562YYSEiabQpNsHJ46Rt8o2D4G409g9Vr0hx/leB4QE842Bap99/i644fTO3OA
 e4r6bJf2xLU5RQaUrbtd4+OAZUecwu5+/kCF2maw4qDjzyhNRwDxS4EOJlXKNtNifPyV
 TUCOJ1iAB79Gme9bCZmp/80xSkXMs3WdU6ypUMQgufFIxf/rkfnw3lUeFqL89mY+77gR
 eX3yvCG2B5MJe6yoXQw9xBlx8Bkf4QUXFB1BjRwJ9q1BtBLwgyltBPMx72RnQi3CYWLo
 xm8HMBWXaH82Vxa6xCtz6gg9TbdpYq0lQSCEFDVfOtVtViUExJLwu+b3henQsa2uv0wn
 Jjow==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781237215; x=1781842015; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=miGF1yHVafpVx2qupDeuM3gVrtYBw2ce86jlAdHCQAI=;
 b=iV4lGdienJnsB9bA52n9773fZYMNvtsKh8FJltsKnKyA2kT4cQJP6bBDfMQzpfbwqK
 /TLFoajUqkbQh6DgKbawMY2tdrT27fl2G21BrS6HW/N+5GRaOo+/hxUPls53NYp/Tkl+
 buyRM3cbbwKSj5u6bGJMyMvb+zR5BEO0QPRJiztznNliFjDHwJRrRTX6J2DHGRmZTgp/
 ibvOw9WgnpxE1qFp0kQ2QdV0yjGmqZTe1qSnrTrcr9ytF5UY8B2YH/Ew3LLAHF1ml1yG
 Ih9thHQNxkAh4fE+VPTBg81axQjrk3NIJR7IMWrjcd0nCdm7/XbUn1kxTWll7q2Fj615
 2eTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781237215; x=1781842015;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=miGF1yHVafpVx2qupDeuM3gVrtYBw2ce86jlAdHCQAI=;
 b=bcjjNxaYQPaaFlWFkfxgakTPkurAOyy9ygM+bO7SLY+3aWTeQA8SaqoNNlKjXhohza
 ZauukgFSCIu3WF9IZejV1SveddKf7D62OwO9QMw2lDogY+xNhSkf0IFNBGLOYgcbmy/n
 ME+DtT10uE+cVD80temCjAjr3BfMSgCLddXwOeOeqkPeBgFaeLEiloD4p50KciIy8Ni3
 jbnGqY/TIzZ4Re9c4zUgy3OzpXmxgtQ3fB0VfI/UXrRiMpNCIdgSK4tOyVeyB5oTkIH1
 grhGQhspz524D1dfw8xnKczv7SvEGLUahSh4NQQYTdHiXqwjd5X6F5wCb96eMInKJFlm
 tgrw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8t4kfuTGeU55ec1eixWvK7JE9MnJ06KV8hjquUX1PdAcTphyASNAdh6Dv0s0vpGrSS4SLX/ehSZrfu@nongnu.org
X-Gm-Message-State: AOJu0YzfIgaOSQ9kSQl7pmSJKtOrFChp69NH3HaX5nDIVWEPX1BSdW/Y
 9Z21bYqzCHxQpmwxOFAhCgZ4FMLrPmQs+PqCamfT+2OqIv30IHLzdMs5WWXbJm69si/BH2g033E
 HJN3SAA+nMx426vMfOAcAgTanmyDn3aY=
X-Gm-Gg: Acq92OFqijMct8k+SCSnVxZO4C10a28pPdfZJ2UFqffRVGwDBSq6zs6GtByStRlqY/e
 y7px0sP5QR5mpCst70LExN44XJARQNs7x2cdwodyAscRTkHzZbQ4JVH2UY0KHp4fbmSzyvcgGH6
 rBQ4yETsL3InK7WQjaURpAEfbdsPcUl87JCDLyvsYKz5WJtZeUVDPhH0wJTBfZ84lEYyRlDXSRi
 HkgEORZJ6H58aRrw2aXFOySg1E603c+sJXGNHqATilpaqc8hOsPAhZFHKQWt7ecMgIXmBaJhTYe
 Ez00quZF3bhKytsuRGiV54vm3JrYF5IbZZRjcg==
X-Received: by 2002:a17:907:1c9f:b0:bee:bcf6:6a22 with SMTP id
 a640c23a62f3a-bfe2a115631mr38111966b.44.1781237214765; Thu, 11 Jun 2026
 21:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260608210642.464131-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260608210642.464131-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jun 2026 14:06:28 +1000
X-Gm-Features: AVVi8Cd9v6dNE8XnFn6MAya34l9CzA6tHQObG0ihfchmlQmM6lxFNIXEi3MggV8
Message-ID: <CAKmqyKOHR78hiHePh_q_c36k4QXcX-5RLRKH13Jx_RQp464MAA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/virt.c: fix 'iommu-map' FDT entry
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62d.google.com
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

Thanks!

Applied to riscv-to-apply.next

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

