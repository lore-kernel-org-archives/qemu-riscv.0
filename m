Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16693C001E0
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 12:32:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1quu68-0006xa-HA; Mon, 23 Oct 2023 08:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quu65-0006wt-TU
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 08:31:55 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quu61-00087D-Ou
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 08:31:52 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9c603e235d1so491492766b.3
 for <qemu-riscv@nongnu.org>; Mon, 23 Oct 2023 05:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698064307; x=1698669107; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KF7fL36npFJhBZTQEN1kO2xrKduT7F+8SzUe4B1Jc/M=;
 b=jZCFgcCFGbByAdXm4RE70OsgpC+BOG3kFwtHP6rAAtZrG3//iL3gnE0+azfRF0P+6R
 BSaCpfv6bdDwnlSXZt9KBeYU7P1BAFw8kXv0/mkCr3NNNg32NE+/S2bREWAKsBrFmoqY
 YbycmyYk8En123Rp7CqGCc+Ti/5AloOJyjnMSaIwo6wTfquh4i4KCii0+eTitVSnSnuG
 sX0AR5PiW0AN/yInG0MVUjdOZUudLqcy3xE5hBRjomLlLFJ8WCMQxJlkfEHYTHRMBW95
 w40CRm0x59SPlnE4exZJZpvzMscDFFZ9vwyDMp1nxdNGTjKAzQyZMsFAwTNSRBlNeTgE
 9oBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698064307; x=1698669107;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KF7fL36npFJhBZTQEN1kO2xrKduT7F+8SzUe4B1Jc/M=;
 b=rUGhvgojOSZ72PGPI+BtdGSn012gp5iF0b5BwD/+/JjDjbKxlCjRgE9zvhccG3AyyB
 leJBYd2QwoWMPKr6Tda2d7iu6zEzkWkLutSpFvn9cSnAThlJkmbMsr0WIkYl46ulEemf
 3kk/AGl/bZ493zMsx7ltvNxDPWDQjWFNT/rTaY1Yc9oMTi/2NH1mvEakPPpTuB49e64Q
 Udowql3eMOgPvvexbVswEgqxXfxMLMeaZXmyV0GNOh/+7zIbpsfU1IyFVx+Rd0X9W946
 D0cuesEyBM+wCTRCdrsj8TfV0sfO8LvVtIYIeihUYpKkeQmjt1S/hCwUjnsqRoCQFb1G
 c/tQ==
X-Gm-Message-State: AOJu0YzThZc9A24zp/ZxQYXlJcCUBlqUesVR8wzavC1pEayBgZxCtvrz
 mDEbExcj7r5pGvgHHA/m57wpjQ==
X-Google-Smtp-Source: AGHT+IGuYgskNikwO7VpjNvKVkHGx7Yu4RlWOWR9qopFtT0YI1Gg24xUOiYwhNz58z6L2WeG2QHGSA==
X-Received: by 2002:a17:906:6a22:b0:9be:d15e:8ca2 with SMTP id
 qw34-20020a1709066a2200b009bed15e8ca2mr5289295ejc.39.1698064307406; 
 Mon, 23 Oct 2023 05:31:47 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a50d515000000b0053dbb214d96sm6390502edi.13.2023.10.23.05.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 05:31:47 -0700 (PDT)
Date: Mon, 23 Oct 2023 14:31:46 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Anup Patel <apatel@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Haibo Xu <haibo1.xu@intel.com>
Subject: Re: [PATCH v3 03/12] hw/riscv: virt: Make few IMSIC macros and
 functions public
Message-ID: <20231023-676f1ddf57f2af985da7c382@orel>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-4-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019132648.23703-4-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, Oct 19, 2023 at 06:56:39PM +0530, Sunil V L wrote:
> Some macros and static function related to IMSIC are defined in virt.c.
> They are required in virt-acpi-build.c. So, make them public.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/virt.c         | 25 +------------------------
>  include/hw/riscv/virt.h | 25 +++++++++++++++++++++++++
>  2 files changed, 26 insertions(+), 24 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

