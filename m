Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E697C36000
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 17:43:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuxRM-0006dx-1J; Wed, 19 Mar 2025 13:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tuxRJ-0006Za-0v
 for qemu-riscv@nongnu.org; Wed, 19 Mar 2025 13:42:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tuxRH-0007tu-BN
 for qemu-riscv@nongnu.org; Wed, 19 Mar 2025 13:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742406165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xdHr+wV4v5xUcIHu4GW0sf3yXF4EP+1qdf38St8V2tE=;
 b=KahzDsYOsjZjS6tw5IFaL7vyyKVuCF80U7Qdhk9aQxvNMeCoLyUiF8T2u9/SiQUIWw8Kd1
 tT5Me1DHmo34eNtgdebtXkxeyKDOdvFaPu4Y5v4Ooqa1mJg1fir3Wdfnx+nnNSFCCfkmJ+
 T7LLvuSynlP02N2e6gfov1pmgZfMKC0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-24VIJip_ND2UhGOnLU4ivg-1; Wed, 19 Mar 2025 13:42:44 -0400
X-MC-Unique: 24VIJip_ND2UhGOnLU4ivg-1
X-Mimecast-MFC-AGG-ID: 24VIJip_ND2UhGOnLU4ivg_1742406163
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43cf172ffe1so40338285e9.3
 for <qemu-riscv@nongnu.org>; Wed, 19 Mar 2025 10:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742406163; x=1743010963;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xdHr+wV4v5xUcIHu4GW0sf3yXF4EP+1qdf38St8V2tE=;
 b=qKhPqv1pcgoeOfHYgAfpnQ2qd6KTmxXZ32eVlUk1C6QfSzTwmaKIhkXz3oKyQxvfac
 gE2lfAn7Lm+BzSMSdzmLUOV1hDZI7Gz470ZwpovfEFuK260dS3eVIxyUiGkObC6MV04Q
 v+DXDN18NxWjLkT7yUekcl+nnEJooSr3L7SymUZ6QL3jJmfSiwvudhM5mkDLEqZJhdoU
 goiRHTPliCEvnPswrskgq4MN7ueJ0FlcdOFHhdk7s/4e8I0RZFFAPUxw9Au2F4mz4zlS
 p84c4NqHYj9i64ZPLT2j0QhC6DzRw0o6dBTdK31aBkvoi2F7GupxDNgbwGcrRWiSCF0N
 cCvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpQV5ShhI2c39sHD+uNd7le+Gn7amYdNIAwQbfFzYMTgvCxqyiOOIlXjnDJTUMOYhm4lhcDGiSQPEI@nongnu.org
X-Gm-Message-State: AOJu0Yy4tyuJkYqgY9fOkfA8QWMGWKELMxBwPCacRoIQ2O2HS6DbGMZ6
 UUFJYUvKNR8ktljte26TEFGWenBdo5mRLkCCyKF3w8mxMLfTAifTbEAev9PKqym5t4bSum8Ofab
 7ZpDm0S/lPgo/3Hinr82uav51+nlRiZwMWrm9j2EYwWSjxh7C8Rwz
X-Gm-Gg: ASbGncuNsxCspucTAe93IkIvBZwIjGJ+fynO/oVraoq0RidXxI8v9fOB+tHhltl7jy3
 mfhglWkp4REqohbI+D7nvYAHXhgHzdYlwjJzcv9LmdT8B02fjDCSQGZw+ajfqufH/63fx3XuaNi
 lDLRD39p3E2SjpqUoTseuY7mmNgn3DzgxHjQTlj4eSTKenKk984ld5ZNy0ZWng41H6+cjKCJZ9h
 aVH/1SflxE/R5sTYDR3PL5kTdxL3iztyEdhj6VnA6+LArqpz0cUNRj2VVDFA3lA2Xy4NqwrCsvL
 wxSXCXKQmw==
X-Received: by 2002:a05:600c:4503:b0:43c:fffc:7855 with SMTP id
 5b1f17b1804b1-43d437c3327mr41385155e9.15.1742406162862; 
 Wed, 19 Mar 2025 10:42:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNgvrH1XDPoaHVA3FhRRm+G50JCWH+9YtrEJR93aSB8OGvD8mjBEYiOqSs6Yh+YGE/qwsLLw==
X-Received: by 2002:a05:600c:4503:b0:43c:fffc:7855 with SMTP id
 5b1f17b1804b1-43d437c3327mr41384875e9.15.1742406162407; 
 Wed, 19 Mar 2025 10:42:42 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f476a7sm24700675e9.9.2025.03.19.10.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 10:42:41 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:42:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Chien <jason.chien@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:MCIMX7D SABRE / i..." <qemu-arm@nongnu.org>
Subject: Re: [PATCH 0/4] Integrate IOMMUs with PCI hosts that have ATUs
Message-ID: <20250319134141-mutt-send-email-mst@kernel.org>
References: <20250307203952.13871-1-jason.chien@sifive.com>
 <CADr__8rgTBJW-KKAr55Y1wHLS7jRDyvQjx=vJCGAj4T1YZhUNA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADr__8rgTBJW-KKAr55Y1wHLS7jRDyvQjx=vJCGAj4T1YZhUNA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pRWT4_1Okr0iROUXKkv_tPEGmT-UQoTWnvtub1q_zqw_1742406163
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.337,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Mar 20, 2025 at 01:19:18AM +0800, Jason Chien wrote:
> Ping
> 
> Jason Chien <jason.chien@sifive.com> 於 2025年3月8日週六上午4:40寫道：
> 
>     The struct PCIIOMMUOps is designed for use by an IOMMU, but many PCI hosts
>     also utilize it to implement their ATUs, preventing coexistence with
>     IOMMUs.
>     Overwriting a PCI host’s PCIIOMMUOps disrupts its translation rules.
> 
>     This patch series introduces a mechanism to route inbound transactions from
>     PCI hosts to the IOMMU, enabling proper integration.
> 
>     The final patch depends on another patch series:
>     https://lists.nongnu.org/archive/html/qemu-riscv/2025-03/msg00003.html
> 
>     Jason Chien (4):
>       include/hw/pci: Introduce a callback to set the downstream mr of PCI
>         hosts
>       hw/pci: Introduce an API to set PCI host downstream mr for IOMMU
>         integration
>       hw/pci-host/designware: Implement PCIIOMMUOps.set_downstream_mr()
>       hw/riscv/riscv-iommu: Connect the IOMMU with PCI hosts that have ATUs
> 
>      hw/pci-host/designware.c         | 18 +++++++++++++++---
>      hw/pci/pci.c                     |  8 ++++++++
>      hw/riscv/riscv-iommu.c           | 15 ++++++++++-----
>      include/hw/pci-host/designware.h |  2 ++
>      include/hw/pci/pci.h             | 21 +++++++++++++++++++++
>      5 files changed, 56 insertions(+), 8 deletions(-)


Hello!
I tagged this for 10.1, as qemu entered code freeze.

>     --
>     2.43.2
> 
> 


