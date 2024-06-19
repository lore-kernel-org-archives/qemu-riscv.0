Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0E5C27C53
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 09:21:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sJrV1-0000Mz-7z; Wed, 19 Jun 2024 05:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJrUx-0000MW-8E
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 05:20:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJrUv-0004YS-7v
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 05:20:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718788856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=15PO/GiZHNGhjiCnLI3XggftAI1ybcKgTqaDPZn+pQQ=;
 b=NOvQL5gAfRnfLqpNHEEfOe11lGKstuzZ/GybUGCUAWI6oGxvhIEW8L8VFj82g5BFF7f3aU
 /vRoF+ZlhhI65AbYWUAbiOMXS4aJC3Ucg447fV65Z16wSWtEVS6M+SDs5lpGR/w87chcrW
 g7pNcS9FZ4kGPxXndIYb5YsF89Azgkk=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-s_cAVhiXOEOp6BUFF5byNA-1; Wed, 19 Jun 2024 05:20:54 -0400
X-MC-Unique: s_cAVhiXOEOp6BUFF5byNA-1
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-48dc69ade51so3889955137.2
 for <qemu-riscv@nongnu.org>; Wed, 19 Jun 2024 02:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718788854; x=1719393654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=15PO/GiZHNGhjiCnLI3XggftAI1ybcKgTqaDPZn+pQQ=;
 b=NySBhxLrRbsSqC3E9ePKKcQ9APCaF0ToiVLayOr587u2wTtmhhkx8X9gKAybW033yI
 q452yXKCzsEQDBnvnDdTonuyrI9XRcD3pfCVMSMwPXRW70fmfht+HUBE/duAN/Kdcnl/
 Z0jP5Xg7f9RWtxapcOHh/VbsuTwxLnPtSe+BtpoFZ650a905qZR51NGs1CL6IlKTQwID
 6UzWtTB6rUwYaJwAR0ABZBisRZA2U3VoLfJsKYLzFX2dUXTIGVAdd1GhWzfU8to22sGc
 yVJKq/b0uEWSJXsfM/KDxY5MN5VBRuN0LLBJEIFQiwbFZJBvUKjKXX8pgc0dvm0R3ulv
 Y7XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVASOdTS6sqJfhqF5GCcMufMgW53Vx6W+JSjjx9JeWbebUTMWzaxGpmZW4ONE2oyvxDtxx7s5kXeWtJQ3Ony4hyVVWXwLI=
X-Gm-Message-State: AOJu0YzvIl5qaTSTx0BW9waod5VNsBeNxK6SqJZMhGM4VJiCAn7LroSQ
 diwKm8TYmwvOz76cZSt3cn6aDtSL6P4AKpevVkZHD8nOG5epPwZXae0UmpyANR4N5QoE6WhnFMM
 1vWDinbhL+r+pCh4ka3oNUxRb6ZtCLtNbyygOVu6NkWA57MP/VKV4
X-Received: by 2002:a05:6102:26d1:b0:48d:8fd7:a952 with SMTP id
 ada2fe7eead31-48f130d077fmr2500732137.32.1718788854039; 
 Wed, 19 Jun 2024 02:20:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJB6e1UOieMkZFXEtyquUdtB6QFFQD5JH+x/UX7c/jOuhKHPKZj1rgPKyD9RB77lsma0JoSA==
X-Received: by 2002:a05:6102:26d1:b0:48d:8fd7:a952 with SMTP id
 ada2fe7eead31-48f130d077fmr2500652137.32.1718788852243; 
 Wed, 19 Jun 2024 02:20:52 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798abe279cbsm589989085a.112.2024.06.19.02.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 02:20:51 -0700 (PDT)
Date: Wed, 19 Jun 2024 11:20:47 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Alistair Francis
 <alistair23@gmail.com>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, Haibo1
 Xu <haibo1.xu@intel.com>, Anup Patel <apatel@ventanamicro.com>, Andrew
 Jones <ajones@ventanamicro.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>, Weiwei
 Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 05/12] tests/qtest/bios-tables-test.c: Add support
 for arch in path
Message-ID: <20240619112047.6b0e674c@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240524061411.341599-6-sunilvl@ventanamicro.com>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
 <20240524061411.341599-6-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.148,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 24 May 2024 11:44:04 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> Since virt machine is common for multiple architectures, add "arch" in
> the path to search expected AML files. Since the AML files are still
> under old path, support both by searching with and without arch in the
> path.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

other than need to swap machine/arch order mentioned in
the next patch look good to me

> ---
>  tests/qtest/bios-tables-test.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index c4a4d1c7bf..c73174ad00 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -78,6 +78,7 @@
>  typedef struct {
>      bool tcg_only;
>      const char *machine;
> +    const char *arch;
>      const char *machine_param;
>      const char *variant;
>      const char *uefi_fl1;
> @@ -262,8 +263,19 @@ static void dump_aml_files(test_data *data, bool rebuild)
>          g_assert(exp_sdt->aml);
>  
>          if (rebuild) {
> -            aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
> +            aml_file = g_strdup_printf("%s/%s/%s/%.4s%s", data_dir,
> +                                       data->machine, data->arch,
>                                         sdt->aml, ext);
> +
> +            /*
> +             * To keep test cases not failing when the DATA files are moved to
> +             * ARCH under virt folder, add this check as well.
> +             */
> +            if (!g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
> +                aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir,
> +                                           data->machine, sdt->aml, ext);
> +            }
> +
>              if (!g_file_test(aml_file, G_FILE_TEST_EXISTS) &&
>                  sdt->aml_len == exp_sdt->aml_len &&
>                  !memcmp(sdt->aml, exp_sdt->aml, sdt->aml_len)) {
> @@ -398,8 +410,13 @@ static GArray *load_expected_aml(test_data *data)
>          memset(&exp_sdt, 0, sizeof(exp_sdt));
>  
>  try_again:
> -        aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
> -                                   sdt->aml, ext);
> +        aml_file = g_strdup_printf("%s/%s/%s/%.4s%s", data_dir, data->machine,
> +                                   data->arch, sdt->aml, ext);
> +        if (!g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
> +            aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
> +                                       sdt->aml, ext);
> +        }
> +
>          if (verbosity_level >= 2) {
>              fprintf(stderr, "Looking for expected file '%s'\n", aml_file);
>          }
> @@ -1574,6 +1591,7 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -1667,6 +1685,7 @@ static void test_acpi_aarch64_virt_tcg_numamem(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -1689,6 +1708,7 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -1762,6 +1782,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -1918,6 +1939,7 @@ static void test_acpi_aarch64_virt_tcg(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -1937,6 +1959,7 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .variant = ".topology",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> @@ -2020,6 +2043,7 @@ static void test_acpi_aarch64_virt_viot(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -2196,6 +2220,7 @@ static void test_acpi_aarch64_virt_oem_fields(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",


