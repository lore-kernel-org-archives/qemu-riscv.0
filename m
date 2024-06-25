Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704CFC3065A
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 10:49:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sM3jI-0004mx-Mt; Tue, 25 Jun 2024 06:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM3jH-0004jK-6t
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 06:48:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM3jF-00061F-GZ
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 06:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719312528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dDJ1rFuPBohvm8zo550ZMj/KcvQ/XnmLnyAbPdrOw8g=;
 b=DMmhCN44GtuRati42zDuxAq13O1gJMUjFr3LXsbh6DLw2mRl2235s6stuuLkZ3gWXjpApU
 8gZdcAuHiHyoEzZ6lonFFzgF2Gnhv0JXMnjh2qln06ShtiG0quE6yRzWL+JznLx14v6Luf
 mZsevIagHd2EIrbt6Yw02W8q8mLSjmI=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-SWX_9mjzOsGMa73efUO0fA-1; Tue, 25 Jun 2024 06:48:46 -0400
X-MC-Unique: SWX_9mjzOsGMa73efUO0fA-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-52ce04ea31cso1952482e87.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2024 03:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719312524; x=1719917324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dDJ1rFuPBohvm8zo550ZMj/KcvQ/XnmLnyAbPdrOw8g=;
 b=BsRVrzf4sCQZJcJhvtx1wsI8YFu0B1/amW+47EN92PKwkb1sbRsQ3d23mHmuZcD5W/
 YxLkaoFclv/xRQg43plhqOpTg/kh6hSOnyha9cKwGHoHn0gU9bVmbLImpxrlL1dD80f9
 1zHP1yPs8sBmFlL5VIl7eBUAI34BTaiiCUXcWM/Tsh58utM39sfzYMEADiQ2f0liE/Po
 5eGOPMu+srhb7578lSIlAa/SaUgaNkw9tD0cw7GNj8kSUvchybxNcVSiO7HT4Ytklql5
 ngBMzNvQhbhJQ3TllXfHoiMcVIhKIzJu0APB1zNsZaUQ+UuBCJkuodslhOcnL+Ih++Ha
 l04A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9YryYCGzUzwvwnl7p40YcBecI4Ub8yixKYE6JDZnwG25DxuvVHFGbJZn8q3H5BkIqrOz7Cg4wQO80G5B87REk9FVIoNA=
X-Gm-Message-State: AOJu0YxgjrubTI6Fc4fVPw+hnB0n/k+g7E8uRqmkNuM0V6oW0PluQ5S1
 7GutdVpnc6iKpTxaZTAl9uZYOzrTe4sZiiIrToOC3EQcsTjNGVN6kZDqxrFTQXOk0+asov9yKvW
 LHb1MBa9r408PVBFSNf4tLKvYUCJs8R9Y8Hlp7qd8eD5O4Wg2uMg6
X-Received: by 2002:ac2:4c91:0:b0:52c:ce28:82b0 with SMTP id
 2adb3069b0e04-52cdf7e6706mr4284779e87.14.1719312524464; 
 Tue, 25 Jun 2024 03:48:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGowgV9MxyKqh168ejgm4GaFM9C12R2ioSkD3J9W7UCTCDYWlZLYE1dC/Q5ggFAY79IhZwLHw==
X-Received: by 2002:ac2:4c91:0:b0:52c:ce28:82b0 with SMTP id
 2adb3069b0e04-52cdf7e6706mr4284754e87.14.1719312524093; 
 Tue, 25 Jun 2024 03:48:44 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42481922774sm172814475e9.47.2024.06.25.03.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 03:48:43 -0700 (PDT)
Date: Tue, 25 Jun 2024 12:48:42 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Sia Jee Heng
 <jeeheng.sia@starfivetech.com>, Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v3 06/15] tests/qtest/bios-tables-test.c: Set "arch" for
 aarch64 tests
Message-ID: <20240625124842.709ecc97@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240621115906.1049832-7-sunilvl@ventanamicro.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
 <20240621115906.1049832-7-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.151,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 21 Jun 2024 17:28:57 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> To search for expected AML files under ${arch}/${machine} path, set this
> field for AARCH64 related test cases.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 29c52952f4..007c281c9a 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1591,6 +1591,7 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -1684,6 +1685,7 @@ static void test_acpi_aarch64_virt_tcg_numamem(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -1706,6 +1708,7 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -1779,6 +1782,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -1935,6 +1939,7 @@ static void test_acpi_aarch64_virt_tcg(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -1954,6 +1959,7 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .variant = ".topology",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> @@ -2037,6 +2043,7 @@ static void test_acpi_aarch64_virt_viot(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -2213,6 +2220,7 @@ static void test_acpi_aarch64_virt_oem_fields(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",


