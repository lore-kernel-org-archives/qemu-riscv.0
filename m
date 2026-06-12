Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB70CD98CC
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 02:36:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXrkU-0007yM-JG; Thu, 11 Jun 2026 22:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wXrkS-0007xt-TZ
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 22:35:56 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wXrkR-0000rC-I2
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 22:35:56 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6914a658115so624018a12.0
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 19:35:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781231753; cv=none;
 d=google.com; s=arc-20240605;
 b=aqSDPMSx/V9WcX01KpWz1ydDCxbtkkgfcKLSlj8GtZPkUTSbuAZNMbGIy4+1ZBHhZU
 SPrYQceKyoxvO3+menI/FMemkbd1Ncu5r42om6HehLg9WKSenvCwccnJHGZnIkaZIcys
 cOXAyTU5z0DHs9Vr0hxuP+xbAt8la9ks/KVj+d+ti5NZujPxxdx2VCNFQhfmAhTwG23W
 NsZ2PvI/4mGlZDLk6IB3tR6UYK04Pn/+Z2WXXngwFfErNovKwXQYgL7Kz+BXnZcfXzGL
 HtBd5abasEGdBN4WPX8VvJKSuVPSSTJTH0OBW3yHhORnupVSJzpzouBUMBiKTXFXSSY5
 wVKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=YLiT7oE05AMahAIojH+9OhT9gPhIkKYYd19DmN64vXw=;
 fh=ys5INU5luPVGUPRH3oLMbKM3ptHDShCVHAObpA/qLfU=;
 b=Ic9X/kXLK1VjtPmcOY2Jp7pXXA+ZLh+PeZDHoIiqV1QeR4l34TYgCsceEqRJkwr9cM
 QQ/Vqc3s4b/bIjJX5ULF970pftJaNvmjHIOI+lj1RjkMDPqU6/+sjhsTu+HCUkxZW3mE
 LgyiaOYVzSVBuhLQKGkwmhM4Cwbcr78+/GvSciyJKd8wUR86c5Is4DdY6D9nu4GkB74r
 Jb0hZT+wPHVSEH4vkAjwdT3g3c0BmKT38+hN7cpSKQZWgI7xKVRzpcCaZ5aT0gb6jG/5
 5EYx2IDQsANlU7g3xz3pn2Yd43sS/OCk97EX7LdChOs5xEpsx3xOfRx4s+WwL171sGZt
 PGDw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781231753; x=1781836553; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YLiT7oE05AMahAIojH+9OhT9gPhIkKYYd19DmN64vXw=;
 b=j/BmxjsqJ9fGZMVTe0L9Yk0L1nJSlB3EO5tZs5NpP3XOLk8ZqtjaBbm+LI0YG8+J7b
 VdEX3Yz2lJDpPVMi9krmqZIcW+qlGPm1c8I9KGpWu3zPp9wVk2AkunX22a3cokAHhjCm
 JGB+q5ZZlRvxxjmVfFi2Tf/cTrGM1ur41tDyjBDNMVERqU/RQ61ixpa+pAAlC9tUfbeJ
 ua/Y6VthRdJxJX+aogGj57GM0eYXs5fE8hKRbEV1ozI3mCWrZJ+eTeK0bG5HgtgX5fV4
 ZZJnMhf0EXnx5BYLnaecKVSFXjAOjkiOaOdqqeNi6zbzLEcHbLXBnnw89dOrhKhmHfZi
 /55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781231753; x=1781836553;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YLiT7oE05AMahAIojH+9OhT9gPhIkKYYd19DmN64vXw=;
 b=gpIIOK9lP+wOkAencNMDzgeqMWWqaQYH2YkVC7EmTwZyTsM1YSbk81MMxglZ8ElLyD
 L+NZvpTK/ppmm9/vhh8p2FBkAA2R2dVDY2bhh93pPptux4SjXBbVMdIBJBYKee2H2Wf/
 XWcNHQ7ept/BmX+f6drvC4aNHKKpCzV/q0PXUYRRbiFJXBYiVGIJRmHbcptK8WQIQidR
 KUsiLNajXMzRShZjfD78of/y0GXx2WbPRYfNk3tr8pV0h1cSHXyhImY/dDiq3502WrE3
 eKGD9RRaHUdPAVVhcl3t7Oi1s4EcvpZC/K1zC5oddVqCOUFHsy0qJGy5lwGvhFqfHoL4
 lIZQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/cQ5xB0EAd7xzzSxmvzUXwefmhoWHUiFnlmKs5/xx1jpamNLUTeTlsmPZnYeCEky6p8MN2u8JcAx0P@nongnu.org
X-Gm-Message-State: AOJu0YwA8mJYjv++MvxiIcTgdhWmtMQChkhOCfN6dd2r4xq9DKKHlf5N
 YXFfFxQ8WV1VM6uNPz+eioCS/HZI1UKTgonIRibfGTdCpePzwfR2zpwUmv2eOjZOfgFaK2LhXQO
 l2s2oMuqyR/wK+K9IRIf+Lt7wrBWsF8g=
X-Gm-Gg: Acq92OGfleRrU/BFPIcBcyD4Guy3+Cjk/mD28PlmnDcKOc5e6SoxGh1u7Ly/JCMvtCH
 EnF6gwm+aefoE0JT2TIuwIsEnTjkEqjcEHik12gFI+3sO/NWxvAWbDrZPhlKewGw0pqBbXoxc8Z
 gYJ1DcpmEv/xPAPYzZv1ORnnSekvAfH6rPW9GTL3Yn3XNb6P/kbrRlCechZn387wPMZbBrMLxu8
 9kHweplRq9lgyXs5eO3UoZjOr3Fm0QCBj+bqv2sO4HAdJsE3qwbkcBC+40PdanL+evL3lIcsehT
 imB3miTBXuOrerw97fm+cx451eO2P8KHaUCAVA==
X-Received: by 2002:a05:6402:434b:b0:68b:d10a:a490 with SMTP id
 4fb4d7f45d1cf-69378a103admr239871a12.13.1781231753184; Thu, 11 Jun 2026
 19:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260518072239.16293-1-jay.chang@sifive.com>
In-Reply-To: <20260518072239.16293-1-jay.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jun 2026 12:35:26 +1000
X-Gm-Features: AVVi8CfPvakwsWlI8DzOvl1cdQV2f8pzb9oAEbs6bfRX-89rZxT7EqrMrKJXkII
Message-ID: <CAKmqyKPGywH7wB-KVHEOnFrM-74=6BpqA=c6V28nz+imER=3sQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Don't insert DDT cache in Bare mode
To: Jay Chang <jay.chang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x534.google.com
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

On Mon, May 18, 2026 at 5:24=E2=80=AFPM Jay Chang <jay.chang@sifive.com> wr=
ote:
>
> When IOMMU is in Bare mode, DDT (Device Directory Table) lookup is not
> performed. This series fixes two issues:
>
> 1. Avoid inserting unnecessary DDT cache entries in Bare mode
> 2. Properly free Bare mode contexts to prevent memory leaks
>
> Change V2
>   Rebase riscv-to-apply.next
>
> Jay Chang (2):
>   hw/riscv: Don't insert DDT cache in Bare mode
>   hw/riscv: Refactor riscv_iommu_ctx_put() for Bare mode handling

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/riscv/riscv-iommu.c | 34 +++++++++++++++++++++++++---------
>  1 file changed, 25 insertions(+), 9 deletions(-)
>
> --
> 2.48.1
>
>

