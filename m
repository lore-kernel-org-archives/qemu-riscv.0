Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72644C27C53
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 14:49:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sErw7-0004gH-JQ; Wed, 05 Jun 2024 10:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sErw6-0004fn-GT
 for qemu-riscv@nongnu.org; Wed, 05 Jun 2024 10:48:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sErw4-0005rt-QA
 for qemu-riscv@nongnu.org; Wed, 05 Jun 2024 10:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717598899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EI/JUIPCCxx5G8XWN0i6kHG3bYfoclX/Xkp8mHTiDhY=;
 b=Z8kfJzo1Zw10giYPq7hNhS/2G6jNpyOMIzlAH9ZJg9cC8klGuBO2+e7Z1Y4dLmZu/RtHg/
 u0afMLqbNesgy4k9Ie56KnQs5jidpDLE6f/cRPpYBisDLDsN+VOZ2vB64DeUdAZFJUqPUE
 jRhFwmlnD6Ayx2+oY3wr1PyX1mlCQ8g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-0nRT0wouPW6H1Zq8Bx5_Lg-1; Wed, 05 Jun 2024 10:48:18 -0400
X-MC-Unique: 0nRT0wouPW6H1Zq8Bx5_Lg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42120e033e2so36379305e9.0
 for <qemu-riscv@nongnu.org>; Wed, 05 Jun 2024 07:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717598896; x=1718203696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EI/JUIPCCxx5G8XWN0i6kHG3bYfoclX/Xkp8mHTiDhY=;
 b=t5gfZYQU606KzbKppP4YLB52kbEAqoYEgBSzIcl+S72VjiZWVzQFBJNS8mPp0sxCqZ
 aMJT/fHza1wpatGvMwuRA2nJ8wAImk964pYHWHag7ybw57RMBSCm3EMqOoNhV3XQwUDs
 /VGkqfFZqjVDMlbdFfDXNobNf+kOvV3a4fNT8BK0F/GU2qCoWJBi4FwsDHbOwEYnFwUs
 5xVVU4jnF2qiR4hgvDtSRFoQQfg2kvoukUmVC1Pz0etGuUwfjle7JNvREsrcbMl6HCBj
 9mmRWWWjBROsmZQ81v3hRbPvN/Ne2GIMusO7dEG2w35MiK7ws7xu7GXw0SEJ/+fOlnfK
 SJ7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdL+V6uUOT5dJjkCe0f0koOx1NO0BuTHJRT3PIBRvNilQ/9nJg8qs9ukJriEqFFN8F23sZjTdbFNCcK/TDF8xfBUqFnDs=
X-Gm-Message-State: AOJu0Yw+3yNvairqenx0mEjRSCWCE+kLu14kQ3+EBB+vOfns9iLPtBt+
 SDUpbhEwa/qrqT1rhEjBYo9lsA8PFdVGDMs8H8rMB0nN7SVtdpr6Wbma9tL/oc5GNuELTdn5mTS
 2ie2d9FXcA/ShND77TbtQqp5bmqYt4EoePpaS1KQQgduUo1xsPlYlXHPBOEwQstI=
X-Received: by 2002:a05:600c:4fd1:b0:421:5597:ea27 with SMTP id
 5b1f17b1804b1-421562ed0damr26914185e9.22.1717598896485; 
 Wed, 05 Jun 2024 07:48:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+cF7jfJiRYSJi9MRSB7eLiBxhQOWV6MuluiyfS1526cazmFDC+ZwSX3XOi4gkcw/5ajg34A==
X-Received: by 2002:a05:600c:4fd1:b0:421:5597:ea27 with SMTP id
 5b1f17b1804b1-421562ed0damr26913965e9.22.1717598896099; 
 Wed, 05 Jun 2024 07:48:16 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158102aabsm25073515e9.13.2024.06.05.07.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 07:48:15 -0700 (PDT)
Date: Wed, 5 Jun 2024 16:48:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, Bin Meng
 <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, Daniel Henrique
 Barboza <dbarboza@ventanamicro.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH 3/3] hw/riscv/virt-acpi-build.c: Update the HID of
 RISC-V UART
Message-ID: <20240605164814.0d79ef99@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240528073103.1075812-4-sunilvl@ventanamicro.com>
References: <20240528073103.1075812-1-sunilvl@ventanamicro.com>
 <20240528073103.1075812-4-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Tue, 28 May 2024 13:01:03 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> RISC-V is going to use new HID RSCV0003 for generi UART. So, update the
> HID.

where does it come from?

> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/virt-acpi-build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 47ec78e432..7f80368415 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -192,7 +192,7 @@ acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
>                      uint32_t uart_irq)
>  {
>      Aml *dev = aml_device("COM0");
> -    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0501")));
> +    aml_append(dev, aml_name_decl("_HID", aml_string("RSCV0003")));

the only place I've found (that could serve as justification)
  https://github.com/riscv-non-isa/riscv-brs/blame/main/acpi.adoc

which mentions _CID and not _HID as it is in this patch

>      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>  
>      Aml *crs = aml_resource_template();


