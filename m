Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34981C43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 00:22:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wdzlc-0005ZL-HM; Sun, 28 Jun 2026 20:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wdzla-0005Yy-O9
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 20:22:26 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wdzlX-0001me-Dq
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 20:22:26 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c126eb4e228so22878266b.1
 for <qemu-riscv@nongnu.org>; Sun, 28 Jun 2026 17:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782692542; cv=none;
 d=google.com; s=arc-20260327;
 b=aUZiOpHjh4rq4l6mpjGPu3ZWZFLfKzokocYVO0VAZ30EVc0CCQK+7kOsJWWBFA/Hdp
 y37WCZCJvykerOvpA13jdcFCEoG/ouUVtgaRza0Tu6gYiNiIJkey0hgZ0Tomv6sT1BGa
 C82DbTX8cbrfi/VXFaW+6qwrT1flSFDqknZwGSNqe+9+mFBu6/XorccUJgS4S76jpdav
 PM1bAzi3/wZsV7OTJPPZu/8kY633FoWyDk0h9p97WQHvYyTEO6JDk/+VoKbuQvvzIHR1
 eKg1U1O0PFTEMmT5JPxN9Yg+BjiLca4B8+rBwQ4GaBpDxsYhdREqn6ntm69DbBRtNCgb
 WytQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=HUxbEwHA86EudrbV5rPTvkDOzPEic83il00tjKAesWo=;
 fh=LxkRY1aPgoIJM67ZEPIJtTii1ogOOIbTvLyGeLZoa9k=;
 b=epsdIPIGatgYoJvd2FEqen2G5esRnesfuX9h2YDuc0y6w5xN/gtj6+szqSMePWikS0
 ZKTGJIwh9/22UTEtgLNyhA9FDSt7H8HQ6Suqzx49Bf31Gm5ba5K0CauDxoQTD3rqfqqi
 zL7I228zMbekADTOAHzjepevujS2zQNvkTxNnOck6Qnx7vHQi+KAZnycO4KkNB9o3AoN
 /wRJcq2j0ETElbHOMv7E/NcSQ3p62LeWTQzoMzHdqd0hSB1CPPwvpxz3fboKCrGkjG2K
 ykXZeiytJQd5+zSHSzseQ/Nuy4CvXkIP/8OGBcn48dLv79R0ODzuCTp4Tca1qISp4YzN
 XkdQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782692542; x=1783297342; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HUxbEwHA86EudrbV5rPTvkDOzPEic83il00tjKAesWo=;
 b=qo5/4ElPUr5sc7HPJxFiqzipEiJz7k4st1TDf0ym7KTNoSV2TRBwuBaLcQPM9DpbqO
 7lZcWLVteyqhy3CEyF5Im2P1ZDYND8TRBGbixNv5UpDBI5gw2sMt6m9+lP3VpBQufM+H
 ufHleYzX+Lwh5rguvqTyWYhjZjVAExP0o70swNWxRjpeV/90SZW60NEVT7yw7jPN/HAl
 y2JlJqp7EfMFFiYJc6Y4ygqp4myk7+/D5Mp4gNjKbyDVpXAptyvA0Sa4Ga2UaFIB13OT
 IznU8jpaiTqk569MH3sLe2sXdr3aGyRDvxgPY/4QUbC9L1tM8lZ0yR84r8MO2ot4LhyM
 Q6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782692542; x=1783297342;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HUxbEwHA86EudrbV5rPTvkDOzPEic83il00tjKAesWo=;
 b=NZtupQrvqSjETB9sj9iZpYfHB9JyMqYBlCw5NecQol3dHIv8sb1/+HJeXEuQwJKhPS
 fM5wM9kYqy5rMpQ8rwanqrzDPTcoBwIZu9HnJT8Hul1Ct1pTjnfKLEZVStxmFYMYdX5D
 CDM2UO0yg0EW03fjdnuG6upLN+0yEURAjrY4WErKZqaJIrpEWGHboPyvjYCszCyMeOe2
 AhiR/z9sJZr7r4GClUOAvtA3fQ/qDB0vPZDX3k043osxwb+2KMN7CmJ4KONbQ6buoyRT
 /UAoW7anfPtLAw7BgGBQbVrPX7h1KcUOXdfS1AnPqyeMvwrPa6YmKn7/N3RTFPEB6eIm
 0NzQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpaC3EJlpKEYOmgNQdwF5Ndtl8EeZifRAX82rwinVR553uCiH85luEZ9venxlqRTkNOkgIpvExbVZxg@nongnu.org
X-Gm-Message-State: AOJu0YwvqgDEC2HkWPLJNzzLt0N7TgIPn/5ZgLNdu+SzTRotgwE1YyCR
 Y7+mKAuQ38iOvwyHYPFTVg4LuE7gR9pkbbAYOGM3hAgqlSpPyzwrPmtBxdcEcTphz3uZhvqF+Kz
 pXf+DtSCrAxISbcb1hbPsHgthYbcz/DU=
X-Gm-Gg: AfdE7ckE6WFRRN8stNhSSzEig/HliicHdAclXJsE5Mu7+TxgavxmSG7rC6vyiVQSjjj
 2tCwt/pM3jxchfL6zRnakCUwEtazI6f0S0GIQ8qKZdQHkwx0R1ywBaeDV4AOD/a/56wcQpCl+ru
 fNRTHAtW/GlMpaktuDKHByIN5H/RkxVMN+DbJvHJE7DVk/pVsW7gWxmfbUHu+185IzOwx43QPBS
 2CmKTOEFMb+02ckLaf+k6v+3fwoPokK7q0MNGwbyJzL0quFZ44Q5d4AFeMPc7Unw0JsY3isoY6r
 Q7BajMKQioEgS2nSjb31eh7M/1I=
X-Received: by 2002:a17:907:a909:b0:c0c:de65:d2bc with SMTP id
 a640c23a62f3a-c1205ef9607mr782866166b.43.1782692541594; Sun, 28 Jun 2026
 17:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260626173341.3661446-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260626173341.3661446-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Jun 2026 10:21:55 +1000
X-Gm-Features: AVVi8CfTmJGyLoQx7wmIdCy4VmelxWF_sm33jG4_vSKJi2LiS99ZnRQdD_YJ0iQ
Message-ID: <CAKmqyKOE6rv5DDbc-Z0+4G1gDkvXcx-ME9ajWCff0TRpj50LCQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/riscv-iommu.c: set RISCV_IOMMU_FQ_HDR_PV
 appropriately
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x630.google.com
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

Acked-by: Alistair Francis <alistair.francis@wdc.com>

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

