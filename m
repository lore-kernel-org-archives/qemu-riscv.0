Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61866C27C53
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 10:13:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sJsJJ-0002p6-KR; Wed, 19 Jun 2024 06:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJsJH-0002o2-Pe
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 06:13:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJsJF-0004mi-Sg
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 06:12:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718791977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yxcEACsROowAyIbQBJWZ0dhTLTQHNsHOEPITA/EhrVs=;
 b=V6gsh+Iix90Ocix94M1o1M5sA1wdrKbiuEuPpHws6GvZnFz0kXbBO7Mo90yl9UUemaV5qZ
 R7Al8yH+WmzXZqGeXzW80g/+UwbKTAmTO7LPWzMTMRFGHcugbJW9zMGK9vbCZ0JKcjETn5
 8SwOaXez9k0HOh8BkYNj4MCeagA4jI8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-aegFPTXeOLmPUzsSC2XEXQ-1; Wed, 19 Jun 2024 06:12:53 -0400
X-MC-Unique: aegFPTXeOLmPUzsSC2XEXQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42476eda16cso3960135e9.2
 for <qemu-riscv@nongnu.org>; Wed, 19 Jun 2024 03:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718791972; x=1719396772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yxcEACsROowAyIbQBJWZ0dhTLTQHNsHOEPITA/EhrVs=;
 b=r4xAZWs+/+qI6DnbsyksPLjKANjICv/r6Ok7oq+d0mQj7qE4CkUEH85/ELnymuXmvV
 TalF+TBtf1U0HKaoBO01JVPT+JQsmqijWsaateFFe7UywbsmPwEspuHF0/lPJ7Sm/E+T
 lNbYGIEr1U5cPbokSybGaLq8chWNtst+9+14Z/p7UHlBdSj8E/Tp9s8EEeSabYaASrws
 fQftMKY47gV9dYKB34YcVN4C56e02gNZQZAVdpSy6hJWP/TAdwaopfTbu1ypTDwPwjCf
 /yRkAtkUSr3HR2f75E3b1eHYXK47rxQLQvpVlpVjIN9DnVmaiMX3sheffxS199NBPVdW
 3wEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbxDKDcrUG3g3fI5eMPdW8wnpvOqynZMIImL411Dr+Dt6c6aFbPkdYflJCn4KnQHsyLjtKxNWnxoI/pdO2PeJ+DIo2/MQ=
X-Gm-Message-State: AOJu0YyMbMfDxyRf4cR7cZ3Hmhbpjt9q+RmNhneQaKhePayuJAewJ7Hq
 UzyHIUXxToonHXSodvQy48SwDEs2b2ip7MygONa+a70uQA9cLY9Nr2wujbRzREuZOxV/o2FzjEa
 Xr0yG6tw3ya7BMKbK6jqYPW64VCIHkxpYtIqSmDLMlClCiyQNgiZe
X-Received: by 2002:a05:600c:3587:b0:422:6e65:a4cb with SMTP id
 5b1f17b1804b1-4247507865fmr15130895e9.3.1718791972551; 
 Wed, 19 Jun 2024 03:12:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjBSjMJ2/B3FndbIHKgreaVhYjyIQLl2w9f1caZ/dsb5i8nbfceMaH27XuzHEYtOaWHByyWA==
X-Received: by 2002:a05:600c:3587:b0:422:6e65:a4cb with SMTP id
 5b1f17b1804b1-4247507865fmr15130675e9.3.1718791972222; 
 Wed, 19 Jun 2024 03:12:52 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42307d5b78fsm174578745e9.6.2024.06.19.03.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 03:12:51 -0700 (PDT)
Date: Wed, 19 Jun 2024 12:12:50 +0200
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
 Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v2 11/12] tests/qtest/bios-tables-test.c: Enable basic
 testing for RISC-V
Message-ID: <20240619121250.38040a20@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240524061411.341599-12-sunilvl@ventanamicro.com>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
 <20240524061411.341599-12-sunilvl@ventanamicro.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, 24 May 2024 11:44:10 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> Add basic ACPI table test case for RISC-V.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  tests/qtest/bios-tables-test.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index c73174ad00..880435a5fa 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1935,6 +1935,29 @@ static void test_acpi_microvm_acpi_erst(void)
>  }
>  #endif /* CONFIG_POSIX */
>  
> +static void test_acpi_riscv64_virt_tcg(void)
> +{
> +    ->cd data = {
> +        .machine = "virt",
> +        .arch = "riscv64",
> +        .tcg_only = true,
> +        .uefi_fl1 = "pc-bios/edk2-riscv-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-riscv-vars.fd",
> +        .ram_start = 0x80000000ULL,
> +        .scan_len = 128ULL * 1024 * 1024,
> +    };
> +
> +    /*
> +     * RHCT will have ISA string encoded. To reduce the effort
> +     * of updating expected AML file for any new default ISA extension,
> +     * use the profile rva22s64.
> +     */
> +    test_acpi_one("-cpu rva22s64 -device virtio-blk-device,drive=hd0 "
> +                  "-drive file=tests/data/uefi-boot-images/bios-tables-test.riscv64.iso.qcow2,id=hd0",

Can you reuse test_data->cd, instead of specifying disk here? 

> +                  &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_aarch64_virt_tcg(void)
>  {
>      test_data data = {
> @@ -2404,6 +2427,10 @@ int main(int argc, char *argv[])
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


