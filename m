Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC55C43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 00:44:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1we073-00085o-0L; Sun, 28 Jun 2026 20:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1we06p-00085B-NA
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 20:44:24 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1we06o-0002Gr-2y
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 20:44:23 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c126f9c9567so20260466b.1
 for <qemu-riscv@nongnu.org>; Sun, 28 Jun 2026 17:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782693858; cv=none;
 d=google.com; s=arc-20260327;
 b=SmI9mqM7NXJeXOsS0YObeZJtXUFFcGWQ7vxNiC/bceLadMweo157lMFpFebQNZ6nS0
 WnmqSc0eaH5VaKB9jJRxGiMu6Y4X4PCgxN+bL65VXuo+fmdMntif7N/o0Dhv6ibfyx+P
 K/nS78+t2R+E62qIDsgaodaImlDMA1P8Szp26LjcHAnV7Jhma5qgozMLszHD3lKPNXfw
 RZnsw9ale0Cw3UP/WKfy6GqY1xqLEei/PdXsOx/6N2uWRNfZv65UJXB1k3+Rixwa4W3L
 o8tY5P3MpPvFLfOXSwz+nWxnSEY7ezwxt6Tg8iYjTzM+z/gaE7AyNV/04bYCMEmy6I2I
 V7Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=6uDtZ0o+j0rDvg+zteeOITLj0DNIRtEZN3YEFYkP/fQ=;
 fh=ayRong1RHN2Nj5Pq2VRkH9ivorSPEjAHE8iapGIwrJ4=;
 b=Vczpb25hGv+YgwnDO7GuX6BCa87ECnatzzHkbHKEKkOq8XDiTlMgalunpEoio9v6xl
 PevWTaDxnztEKJg3K0yP3KhE+cPaljVmbB+DKGVEC4PcfeTteAoTo2OXMf5Nz8ue17zz
 /lpUMYnUWDHFJCijhkEwU03VXHsktCYP0zG947uxtY3meF7EfZNtrX8cOHj+cqh+qrw4
 32CVmn2ySMGxfG/TEmqopPccfP8s/kG1RRfwEWxBdZiY1rSC7wn8zcUb7XJibYm+lyrL
 2Rj7UYMQMwQtrmA2+jURM2w8yVHqmEeCV9u0hMBZ4wngBqKjj4i4V8IaA/pZltG2oyHM
 xdrg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782693858; x=1783298658; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6uDtZ0o+j0rDvg+zteeOITLj0DNIRtEZN3YEFYkP/fQ=;
 b=mRWOY46NsCvRiBjdBAxJlHuXqJtygBGH60uWV6UqI31CkAneqHjestIDuIIHucomQg
 BXVV/deVYFcH80LBKoovUB7wurBfU0dRhc/Quade4g3Bb5erou4FgL5x3T/YC81HRUj1
 ElLClm2g+bA9V2kQ+s8Kcb87DaEqpTltS3vOZPfKPOg1+nxpo0fVSIlzS7Rqw1+geMv+
 hUTWSCkMLPU8+n/udeOI5V1hIBn2bm48jM8jC0Mjy7leROO/rY1jVyg4uYQMMdCNNxwP
 o33yW/Ym7KLdwgvHoNgQ4YO1RkCSF8/HSp4JNtgdgtfRMO1otRXNwXCVqqdgkYFEnLVB
 5sOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782693858; x=1783298658;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6uDtZ0o+j0rDvg+zteeOITLj0DNIRtEZN3YEFYkP/fQ=;
 b=KKbN0S9c4QQ72ufb61F5SFYcbmvFXgyJCx4sIG1Pg2WpfRgXriRVjOjUxJeVagpVw4
 jFvk0E5LTHaa5JzM9Jx96RkLJle8beDfSu35L1vXtQFGzi6dJz4UKDwuFVGwh2xhKzp9
 rng3ue4D6767KJNqubLQyahA2kzYrNXe3SHlPsrsRoQI1FVb1OX+StFrhNL7iqH50TpQ
 woU3Uq0mPRUQSv7c8by10cIn0y/wWtYB2HxJKWSVcXFhZWI3NerDGzDNHj2xjpQy0tUS
 kgJSbGJjJ8g7mDlpvHQEWMzDSL/jd69O6XYRAsgk91xdh4z+11sm4yyvn/+OKiCUeFlQ
 1bIw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoBriBEXzRQmwgJEyoCzOPglUy5d3oWIeobU7BJw65xZolCqTY2viC8tgADyUsPslNzDhk9rtJcVzxB@nongnu.org
X-Gm-Message-State: AOJu0YzfhthSWPNbp5selmdbrBOCDuOz0T4nx6TTVXFyAgKf7D6dDYw+
 5b4F09swDA79tqegTS7dwKtDIgpSfq0kjN7UOSoPrdXnvLGU1qVwF260k9+cxmaJwBaE2lKpef2
 XiAXt7+KsZrBk+2dqpiYSVyO+RwGdK2M=
X-Gm-Gg: AfdE7cmRMED42D1hlsJ/w1jfa7En6rtvFD29O1GJqlY0d551H6IRdPY6LcGpO4zRzlm
 fIX9pmTlUv/OiI0KiRxGB4IMy0ucD3WS/2RmqP7Jeb+wm0OzXh3Vr4+zn3P9wCA5E0+niYJuxwS
 Fof0yVOhAtyBBUp1RfHJefW9/IxDT84yJU6+N1QC/zW69UpQR8+MDwBc7OFUc0MowAhQQU2LKBD
 oCcH751XrjNokRKwOXjJqpZO+ZCC+VmW5hHs6QnQ0rPsf1qq+uIaJyGqNOFVFjoYUX3mwrY2y5O
 kfAHvUSsQTIvZ0N5CBZAmRMM+oU=
X-Received: by 2002:a17:907:84e:b0:bee:6806:d69a with SMTP id
 a640c23a62f3a-c1205ec932bmr793140666b.38.1782693858281; Sun, 28 Jun 2026
 17:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260626173341.3661446-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260626173341.3661446-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Jun 2026 10:43:49 +1000
X-Gm-Features: AVVi8CdlrV7cImRpN6aj5OEwwzpJ2hmUv6aO7Hh-L60PTNQuWuSRW9qIs-cP2Mw
Message-ID: <CAKmqyKP_ynyLb=ELf9f_aOMv+F=zjoiNpqBV_WD_BkNoMiuMNw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/riscv-iommu.c: set RISCV_IOMMU_FQ_HDR_PV
 appropriately
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x633.google.com
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

On Sat, Jun 27, 2026 at 3:35=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> We're hardcoding 'true' to FQ_HDR_PV in riscv_iommu_report_fault().  Use
> the 'pv' bool the caller provides that indicates if the process_id is
> valid.
>
> Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3556
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/riscv-iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index d47abf9eb3..3ea9130860 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -580,7 +580,7 @@ static void riscv_iommu_report_fault(RISCVIOMMUState =
*s,
>      ev.hdr =3D set_field(ev.hdr, RISCV_IOMMU_FQ_HDR_CAUSE, cause);
>      ev.hdr =3D set_field(ev.hdr, RISCV_IOMMU_FQ_HDR_TTYPE, fault_type);
>      ev.hdr =3D set_field(ev.hdr, RISCV_IOMMU_FQ_HDR_DID, ctx->devid);
> -    ev.hdr =3D set_field(ev.hdr, RISCV_IOMMU_FQ_HDR_PV, true);
> +    ev.hdr =3D set_field(ev.hdr, RISCV_IOMMU_FQ_HDR_PV, pv);
>
>      if (pv) {
>          ev.hdr =3D set_field(ev.hdr, RISCV_IOMMU_FQ_HDR_PID, ctx->proces=
s_id);
> --
> 2.43.0
>
>

