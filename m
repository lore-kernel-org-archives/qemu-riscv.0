Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF0CC001E0
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 12:46:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1quuKB-0000cX-Rl; Mon, 23 Oct 2023 08:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quuK3-0000Hu-Jz
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 08:46:24 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quuK0-0003Jn-AO
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 08:46:19 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-991c786369cso480478366b.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Oct 2023 05:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698065173; x=1698669973; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4Y8gRXqzBvG7en2Q5FTVRQQitTaWlXEyuhthyILtZpg=;
 b=WcibctH1PFxSjc6uhY3aR2OuMb8QdU0fR2dx13dPuIzAT9YkBXg1sBuGEL+VzUqUVI
 ydr8bYcHhyjzpA0GuIQIT8zk1jM5ZITJHbcoXQ43PvYC32N1wp33rfrRqrsxKPudK838
 KNRgZxZtWY9sa2U6Y4kF4Oza+G2ntQR5welAJ3AUp9vgDQTUWnmhZ0UF0ycJoWiTkO7v
 m9aW8CLVb+GNfVTO2Y/C2Gt4cG6nFv9lF719VMxuI3sDCV9bYXq6IHmRxrTHGUO+GjI7
 /wohdTenibgEwvGwffT1bs7++MDG5c3PjS8XhjPTdDJoQmP7YnV8DSvvKFtbQQXuCMw1
 13EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698065173; x=1698669973;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Y8gRXqzBvG7en2Q5FTVRQQitTaWlXEyuhthyILtZpg=;
 b=d09cOL/OdljrbhavbxGzoVBf2PDejsdK99GFn0j0nRccTDNTWCIVOXAAEfiNfaeBg9
 6jKlITX74WaREYUIx7KXjFwKfYIwJYuxQejjdhcfx+IRUJOgCBhPjQRrCrfA9dGFRoj2
 iDPgAMFP3I0rJ59ZD8Xysq8xv7dP+Grnc90jx2q7brlN0IJhtK+fbONjEI1JEk9YDCWI
 YPQeJ8NYRat3gMEm6zJaAy3XS3sCoCb0epEkGkykSNi/VbWXq2XolhQiy2IYEeyFObgt
 9mp9VLFsNHI6flxxCiXnqcZBnsdGKXIgm/gEWH2k+4w4ejy7TjwaC87TtiLHUg/XXT6v
 g4Mw==
X-Gm-Message-State: AOJu0Yypl5UtyJEA2T/xrihr2I5t48iIqkeKZjkUnA1cxWqLwvZskjic
 i+r/N9aXguqnjsDl4wEGY9C+qQ==
X-Google-Smtp-Source: AGHT+IEnOAp+rzOT+eu7KaqbMGT/LLa6bPXhj/agcWNE9osbrar6NJo5deaGTIwkbAQnRf65nIBnxA==
X-Received: by 2002:a17:907:7ea3:b0:9c7:59d1:b2c4 with SMTP id
 qb35-20020a1709077ea300b009c759d1b2c4mr7134103ejc.64.1698065173443; 
 Mon, 23 Oct 2023 05:46:13 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 lt13-20020a170906fa8d00b009c4cb1553edsm6615814ejb.95.2023.10.23.05.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 05:46:12 -0700 (PDT)
Date: Mon, 23 Oct 2023 14:46:12 +0200
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
Subject: Re: [PATCH v3 06/12] hw/riscv/virt-acpi-build.c: Add APLIC in the MADT
Message-ID: <20231023-438ea22b474fbb561a1cf492@orel>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-7-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019132648.23703-7-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62c.google.com
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

On Thu, Oct 19, 2023 at 06:56:42PM +0530, Sunil V L wrote:
> Add APLIC structures for each socket in the MADT when system is configured
> with APLIC as the external wired interrupt controller.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/virt-acpi-build.c | 36 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

