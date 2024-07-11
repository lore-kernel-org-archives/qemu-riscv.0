Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B49DC3DA4A
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 13:25:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sRtnr-0001ZC-5c; Thu, 11 Jul 2024 09:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sRtnZ-0008QG-6t
 for qemu-riscv@nongnu.org; Thu, 11 Jul 2024 09:25:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sRtnT-0000WC-6X
 for qemu-riscv@nongnu.org; Thu, 11 Jul 2024 09:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720704316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0mlNGZ4bfWgRjS9ILK0zXFJKte83IiOLCct3+UOnosw=;
 b=WhWGHz/WWbrHMjrLprSJFvup1y5KzJVaI1Fu0JH43bLUSYPbEohgr5MMypm+xbjCNChGG2
 QE4UfSdNgXoG7x88t5uN0exdPeQxupGu+5iqCj5iNcDB94blj709ZO2xck9l+d7wBCRwiq
 A5hlLWtdNnddy2gbX6VBWX2Jbqh0/G0=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-4bQ4pYktM1W49Y6mgsvL9w-1; Thu, 11 Jul 2024 09:25:15 -0400
X-MC-Unique: 4bQ4pYktM1W49Y6mgsvL9w-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2ee81ff717fso9768461fa.3
 for <qemu-riscv@nongnu.org>; Thu, 11 Jul 2024 06:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720704314; x=1721309114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0mlNGZ4bfWgRjS9ILK0zXFJKte83IiOLCct3+UOnosw=;
 b=uBbc9DH5PnFdc0wZXekilfWY9oDNmFPB0KGzxccfmDo3J2tyFPgcFdlQSx0A1XZCjY
 uL6ySOCA2P1gCxvathtvaTQJbGU2bNJtTT62NB6pNY6pkKBL1/evakOSUZPM6cPgaJFZ
 1cmYzo1x/+I6EIqOYjrw+UuiDkOFobahTR6E2FtkavPYqMde6vgVZqE3C4oQdK6njK5+
 JyKMXKXTzjd4IVcl3cEdBNLVhXDKOu/d9Y/ZjjA9uQpZYRmIXse3N0lHFO4SE5lhUEh/
 iUgqlEFKwrypPqUWEXEO8mgA3LWk3kw0cjc6LLF4AkG6KL3SlpDwA6uZd73XfvyywdD1
 wTqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEKxBTMdcas/9+tXYWhNDpO68xS33z/AygWX6U7L81HC4KSnCRu4c8KUnfFj+/PmuQ2lpc7cJOCT3J5NOAcJjiazQCKTg=
X-Gm-Message-State: AOJu0YwFdsysefgoJ05qse+Ba73sjOkTeTlz9RSCh/fzSGH5IG4X0N/g
 tNLAaFB3N/3liti+zGnFMmSc/nEGKCqRRt6GoXuwVyqLbS2NRMXCiGvcatiZRrVsvWrY2Fja6jA
 GLQzHw5tfYvfG3YGaV4ds99frQ/ChW/DKVSCk9dcLJlGxsGbL0NjY
X-Received: by 2002:a2e:9b57:0:b0:2ec:4de9:7334 with SMTP id
 38308e7fff4ca-2eeb30b9a2amr61918891fa.11.1720704313999; 
 Thu, 11 Jul 2024 06:25:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPatDhweWWk+d5kmgLL3/xo18zlu3AZi+X6KGXf7YsIGKCaHgbh0s7I9hRKQfskauRLqmxzw==
X-Received: by 2002:a2e:9b57:0:b0:2ec:4de9:7334 with SMTP id
 38308e7fff4ca-2eeb30b9a2amr61918681fa.11.1720704313623; 
 Thu, 11 Jul 2024 06:25:13 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfa07b9sm7721453f8f.74.2024.07.11.06.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 06:25:12 -0700 (PDT)
Date: Thu, 11 Jul 2024 15:25:12 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, Bin Meng
 <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, Daniel Henrique
 Barboza <dbarboza@ventanamicro.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, "Michael S . Tsirkin" <mst@redhat.com>, Ani
 Sinha <anisinha@redhat.com>
Subject: Re: [PATCH v2 2/9] hw/riscv/virt-acpi-build.c: Update the HID of
 RISC-V UART
Message-ID: <20240711152512.5e2fac36@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240708114741.3499585-3-sunilvl@ventanamicro.com>
References: <20240708114741.3499585-1-sunilvl@ventanamicro.com>
 <20240708114741.3499585-3-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
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

On Mon,  8 Jul 2024 17:17:34 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> The RISC-V BRS specification [1] requires NS16550 compatible UART to
> have the HID RSCV0003. So, update the HID for the UART.
> 
> [1] - https://github.com/riscv-non-isa/riscv-brs

it point's repo with a bunch of files,
please make it easier for reader to find
aka point to concrete document + title (for when link goes stale)
and chapter. (similar to what we do for when documenting ACPI code)

> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/virt-acpi-build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 87fe882af0..939f951e45 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -192,7 +192,7 @@ acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
>                      uint32_t uart_irq)
>  {
>      Aml *dev = aml_device("COM0");
> -    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0501")));
> +    aml_append(dev, aml_name_decl("_HID", aml_string("RSCV0003")));
>      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>  
>      Aml *crs = aml_resource_template();


