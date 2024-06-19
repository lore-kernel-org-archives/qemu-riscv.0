Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFD9C27C53
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 09:44:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sJrrN-0005Y7-T9; Wed, 19 Jun 2024 05:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJrrM-0005Xs-Sc
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 05:44:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJrrL-0008I8-Am
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 05:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718790246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M6vw6i1zs4S6dXIulGSdWCYSlKQMxZo7phN6ifKBiWw=;
 b=GQU6yrghaxGtgVwrA6AK23insLL61J/glQY8c0qGANXyYgIq89A94eUtycabwuL1T5BDD/
 xsU2GAokZWTNFmfs04WiyJ3F7eRHK10ElFqfaumYwLuSgJJw4i7EnO12oTNILhI6zAi7Dy
 zDbon7x7hYe4zEauH25oJNfKE6PQY2M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-zYv0s8S2ORiSUJvsuzifqA-1; Wed, 19 Jun 2024 05:44:04 -0400
X-MC-Unique: zYv0s8S2ORiSUJvsuzifqA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4217b3d2044so49774775e9.0
 for <qemu-riscv@nongnu.org>; Wed, 19 Jun 2024 02:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718790243; x=1719395043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M6vw6i1zs4S6dXIulGSdWCYSlKQMxZo7phN6ifKBiWw=;
 b=MbFiQQ9+zzfDLjnTetJjUfLyaqa8x8VNiNMiJC4l1oXQB/+LM9J2Xkiby7amJkm1TT
 F33ksbR5/8GWFWg1PxuFAj7ohAXhQ7TAbcF468cxx6wcz2KWmvoaIxnXOcefI+jdDYGE
 gyLYm0rNICUUV+8tlP1FV8jCdFWRrii0v7BWIDOdyVLtapJs78ko1EtHW9i0q6Dr2Qxf
 GhVQ8CSnyoV0Vsd1lnEFH8gj78ylgtrv5Bf8hYMxEukjTI6KF4MpcOpIu2gNOPogZe5E
 nd1bbs9BQmqOB/CnEVmtma0yW+lU0a24XbbedbNtdumC2PHRhFxN0CDOVR0TWUTppHS1
 lX7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfEDez3C1x+YVXxiRi3e0lI3yXDanoZf4ny/tZ+c0VgbN6Jr9U7Zgc+VZTdylADMyAJz/WESRDy9VS7u6PdWhNJG+Y/ZE=
X-Gm-Message-State: AOJu0Yy446JxhTzaocZOUBhBtxfPICI6rfI63kLaMA2Mc/2lbn9ixwvi
 Qz8+7LP7i/03MQWXZYJLQLuWXOt+XDxKulBjB9kEOTNGiE5ws1/kMknv/lnOYCnRX5F284LKlmR
 MWeYlKMN3y2pAH/JeH+wHJ9glRmfR7YTY/AB4ZuLOjdFnxdUTzv/k
X-Received: by 2002:a5d:4535:0:b0:362:ea80:db0d with SMTP id
 ffacd0b85a97d-363170ec9f8mr1527492f8f.11.1718790243686; 
 Wed, 19 Jun 2024 02:44:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/izN7Sr9uGGlbFZ+Cw/K+pa4dgmvtXVmSGac/iEvOg63vwHAqza/pczestxedpH1qxhrLsg==
X-Received: by 2002:a5d:4535:0:b0:362:ea80:db0d with SMTP id
 ffacd0b85a97d-363170ec9f8mr1527463f8f.11.1718790243248; 
 Wed, 19 Jun 2024 02:44:03 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36075104a26sm16684241f8f.97.2024.06.19.02.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 02:44:02 -0700 (PDT)
Date: Wed, 19 Jun 2024 11:44:01 +0200
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
Subject: Re: [PATCH v2 10/12] tests/qtest/bios-tables-test: Add empty ACPI
 data files for RISC-V
Message-ID: <20240619114401.534292f1@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240524061411.341599-11-sunilvl@ventanamicro.com>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
 <20240524061411.341599-11-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Fri, 24 May 2024 11:44:09 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> As per process documented (steps 1-3) in bios-tables-test.c, add empty
> AML data files for RISC-V ACPI tables and add the entries in
> bios-tables-test-allowed-diff.h.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/data/acpi/virt/riscv64/APIC           | 0
>  tests/data/acpi/virt/riscv64/DSDT           | 0
>  tests/data/acpi/virt/riscv64/FACP           | 0
>  tests/data/acpi/virt/riscv64/MCFG           | 0
>  tests/data/acpi/virt/riscv64/RHCT           | 0
>  tests/data/acpi/virt/riscv64/SPCR           | 0
>  tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
>  7 files changed, 6 insertions(+)
>  create mode 100644 tests/data/acpi/virt/riscv64/APIC
>  create mode 100644 tests/data/acpi/virt/riscv64/DSDT
>  create mode 100644 tests/data/acpi/virt/riscv64/FACP
>  create mode 100644 tests/data/acpi/virt/riscv64/MCFG
>  create mode 100644 tests/data/acpi/virt/riscv64/RHCT
>  create mode 100644 tests/data/acpi/virt/riscv64/SPCR
> 
> diff --git a/tests/data/acpi/virt/riscv64/APIC b/tests/data/acpi/virt/riscv64/APIC
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/riscv64/DSDT b/tests/data/acpi/virt/riscv64/DSDT
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/riscv64/FACP b/tests/data/acpi/virt/riscv64/FACP
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/riscv64/MCFG b/tests/data/acpi/virt/riscv64/MCFG
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/riscv64/RHCT b/tests/data/acpi/virt/riscv64/RHCT
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/riscv64/SPCR b/tests/data/acpi/virt/riscv64/SPCR
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..d8610c8d72 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,7 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/riscv64/APIC",
> +"tests/data/acpi/virt/riscv64/DSDT",
> +"tests/data/acpi/virt/riscv64/FACP",
> +"tests/data/acpi/virt/riscv64/MCFG",
> +"tests/data/acpi/virt/riscv64/RHCT",
> +"tests/data/acpi/virt/riscv64/SPCR",


