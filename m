Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816C7C30658
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 11:20:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sM4DX-00062o-LR; Tue, 25 Jun 2024 07:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM4DW-00062N-AK
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 07:20:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM4DU-0003RZ-IP
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 07:20:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719314403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TxfK50CM39AgyHMqWIsuemzgcz5lpe3wAS/FH8p5QME=;
 b=Xlo8dGkF2gnAdtBwQlJJbTXhsHRe0RDK6iY/U15obCcc5qicOBhiNZGtBCKkweAKaAcMuA
 nqWeBN7zYdBENQDGVSZti6owC16HVjtk+twL760QCuOrTY0IpLv6wq2Y06eqpBM7bBZwsL
 lrDpRb6brt/H+h5vL33NtwFjjZYmv00=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-hKmHuxraO3et0Nw7J7_S7A-1; Tue, 25 Jun 2024 07:20:02 -0400
X-MC-Unique: hKmHuxraO3et0Nw7J7_S7A-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3643d0e3831so3517487f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2024 04:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719314401; x=1719919201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TxfK50CM39AgyHMqWIsuemzgcz5lpe3wAS/FH8p5QME=;
 b=G1bZR4KQ9QxmRGhoUwxFGw2gnZJ//jc1tWApYLMfwGcqA278TiXlzgKUQYNJHSg2Yg
 IlclAiTCnavcOx1UiMwuWz5CAcVnmEKThGW5EgEcF8XIOMsFqijZab/ccbH2IICcxs35
 agquF44EufoNAYkmAlYYLUrFgbEbYoY2Ty3UhG1nJdYW7vlSzQjAqTCQtaJP/Ull1/No
 B+O6AM47X31SPajHMkcUoySfFB51+O3Yp4xhw53v7GrPOZBTDLruwu99dX7CXei2YkP2
 P48XnT6JMhHFWy+ka1av4ICnWvrK/xgysELJ5CtkoxU4cii0Q24AR9osoiMPe863XQ/9
 nnmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhEbHCNvJeMnIM7pDIgtlI4Snua0shKDDPrg+uFcW+dOfJNLgWOM9eYgrGjLv6qI+u/PjzdRE8W/+Fj9AbcGs64gooRUA=
X-Gm-Message-State: AOJu0Yx8ZKo+kt2Cibfp+ZjJUPu77/Ghl465eFMOGoZ1LTW/DUJigQWy
 f9qpqFaj5EByIdmWKaygEcFsSD51MPKpfWqsqKD+bJK3hmZq3clHWH0jLJf2vkTmZnMqKlebRx+
 yd8P6ORnpXf00x1BwRvldb40U7P2eAvaH4ag5BST4b06iFBKpOQQm
X-Received: by 2002:adf:e58b:0:b0:35f:1dce:8671 with SMTP id
 ffacd0b85a97d-366e948eb63mr4549696f8f.25.1719314401142; 
 Tue, 25 Jun 2024 04:20:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcLxacYR4nykxujNhQdXMes9ZuyxkAAaFrXTW1/Li9bQClY0Za9ENc9OchVqJwrOj5T++SoQ==
X-Received: by 2002:adf:e58b:0:b0:35f:1dce:8671 with SMTP id
 ffacd0b85a97d-366e948eb63mr4549679f8f.25.1719314400680; 
 Tue, 25 Jun 2024 04:20:00 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36638f858fbsm12641652f8f.65.2024.06.25.04.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 04:20:00 -0700 (PDT)
Date: Tue, 25 Jun 2024 13:19:59 +0200
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
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Alistair
 Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v3 14/15] tests/qtest/bios-tables-test.c: Enable basic
 testing for RISC-V
Message-ID: <20240625131959.67c2fc74@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240621115906.1049832-15-sunilvl@ventanamicro.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
 <20240621115906.1049832-15-sunilvl@ventanamicro.com>
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

On Fri, 21 Jun 2024 17:29:05 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> Add basic ACPI table test case for RISC-V.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index f4c4704bab..0f9c654e96 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1977,6 +1977,28 @@ static void test_acpi_microvm_acpi_erst(void)
>  }
>  #endif /* CONFIG_POSIX */
>  
> +static void test_acpi_riscv64_virt_tcg(void)
> +{
> +    test_data data = {
> +        .machine = "virt",
> +        .arch = "riscv64",
> +        .tcg_only = true,
> +        .uefi_fl1 = "pc-bios/edk2-riscv-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-riscv-vars.fd",
> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.riscv64.iso.qcow2",
> +        .ram_start = 0x80000000ULL,
> +        .scan_len = 128ULL * 1024 * 1024,
> +    };
> +
> +    /*
> +     * RHCT will have ISA string encoded. To reduce the effort
> +     * of updating expected AML file for any new default ISA extension,
> +     * use the profile rva22s64.
> +     */
> +    test_acpi_one("-cpu rva22s64 ", &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_aarch64_virt_tcg(void)
>  {
>      test_data data = {
> @@ -2455,6 +2477,10 @@ int main(int argc, char *argv[])
>                  qtest_add_func("acpi/virt/viot", test_acpi_aarch64_virt_viot);
>              }
>          }
> +    } else if (strcmp(arch, "riscv64") == 0) {
> +        if (has_tcg && qtest_has_device("virtio-blk-pci")) {
> +            qtest_add_func("acpi/virt", test_acpi_riscv64_virt_tcg);
> +        }
>      }
>      ret = g_test_run();
>      boot_sector_cleanup(disk);


