Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94854C2BBCA
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 10:50:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sM3k8-0006TX-AA; Tue, 25 Jun 2024 06:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM3k7-0006Pq-0b
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 06:49:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM3k3-0006D1-JV
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 06:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719312578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ClBPLObsjREV7Vn6vlOcFVrGHVT+p9j8iKNWAZlhSSU=;
 b=GKTu1Lq9uFPZBQw6u3UQgFZ6eErPg3LZ3CiRg6ElvPlKugj40AeQ2i5vAbAzhgvXLR+cVu
 ujxvPWq0iKnpMvJFSW4Bb7Koo35hs7BiDLdIfm0nKrXPotz58wI2WHU/jxPaxVRM67m5l3
 u/b+7wvBbaV1rYhHD7FXpzJWojY1QZo=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-NhMIB46wO_GzGk9EHaZ1UQ-1; Tue, 25 Jun 2024 06:49:37 -0400
X-MC-Unique: NhMIB46wO_GzGk9EHaZ1UQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2ebd982d244so39314011fa.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2024 03:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719312576; x=1719917376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ClBPLObsjREV7Vn6vlOcFVrGHVT+p9j8iKNWAZlhSSU=;
 b=l+07zdcuav3Vg6VhNHIeXOPI8b+AzpZLpKG1roumK1eU0D5VRo83bYlXTOv9mNnKr8
 OtbA1POZepkZJz8+y5Sf8xIs5tZ2OFTw6r/jmY5GvW89yfKec1+M7d+qhlkyEumVaFwZ
 qpqiSl32ByycwGmD0vU6LacZ9zyJ4CG2qcul1feLc46oEWJ1Mx7PYZdhHzs1esMbvXno
 bu3CrM58TTo4sleDw8mtZJduGxB4U3ijDKcFDQTNUKm1wHCJjPgk54U//zjqUCsoql5Y
 2Uhb5vQptYhoBIDElfwfChLlQtGE4/x/T4sjKRePcKApR4Xr/uyjxoAYKizTZeElZ5nJ
 VeaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZr1BjWNB02RLdPyoteti08XYu9cdQceV39WcyKCSGFW6ipM2cmm43TYL6NiJ9YPsyZoFoSYaK/6t1TwenJvkL/fUFalM=
X-Gm-Message-State: AOJu0YxSZhYlP0no3ibWX/zI40pzNlTL/gMFk/gP7DMp6dhOBzMfpe77
 Y134N3km+Q3ZZgaXejDYi+JtG9v1ylZWVPv+ymIU0UJ8PiXdj7YwMR94fTsQ6YVIZ+VbFLMFgbj
 xDTUBVQ39i5naBiQACa3l0Kos2o6T8Ft7PK26QZNoPqJq4teuDdPd
X-Received: by 2002:a2e:9495:0:b0:2ec:529e:6522 with SMTP id
 38308e7fff4ca-2ec5b2b208cmr36358151fa.31.1719312576080; 
 Tue, 25 Jun 2024 03:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbCzWgf3lkabBWkz8LJpcWPGWIg0DWZyziKgliIlaEDOGVHSLMQeDASJnb+BImt+xdZd7pQA==
X-Received: by 2002:a2e:9495:0:b0:2ec:529e:6522 with SMTP id
 38308e7fff4ca-2ec5b2b208cmr36357991fa.31.1719312575824; 
 Tue, 25 Jun 2024 03:49:35 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366387cf523sm12614911f8f.25.2024.06.25.03.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 03:49:35 -0700 (PDT)
Date: Tue, 25 Jun 2024 12:49:34 +0200
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
Subject: Re: [PATCH v3 09/15] tests/data/acpi/virt: Move ARM64 ACPI tables
 under aarch64/${machine} path
Message-ID: <20240625124934.23f86cb3@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240621115906.1049832-10-sunilvl@ventanamicro.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
 <20240621115906.1049832-10-sunilvl@ventanamicro.com>
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

On Fri, 21 Jun 2024 17:29:00 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> Same machine name can be used by different architectures. Hence, create
> aarch64 folder and move all aarch64 related AML files for virt machine
> inside.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/data/acpi/{ => aarch64}/virt/APIC             | Bin
>  .../data/acpi/{ => aarch64}/virt/APIC.acpihmatvirt  | Bin
>  tests/data/acpi/{ => aarch64}/virt/APIC.topology    | Bin
>  tests/data/acpi/{ => aarch64}/virt/DBG2             | Bin
>  tests/data/acpi/{ => aarch64}/virt/DSDT             | Bin
>  .../data/acpi/{ => aarch64}/virt/DSDT.acpihmatvirt  | Bin
>  tests/data/acpi/{ => aarch64}/virt/DSDT.memhp       | Bin
>  tests/data/acpi/{ => aarch64}/virt/DSDT.pxb         | Bin
>  tests/data/acpi/{ => aarch64}/virt/DSDT.topology    | Bin
>  tests/data/acpi/{ => aarch64}/virt/FACP             | Bin
>  tests/data/acpi/{ => aarch64}/virt/GTDT             | Bin
>  .../data/acpi/{ => aarch64}/virt/HMAT.acpihmatvirt  | Bin
>  tests/data/acpi/{ => aarch64}/virt/IORT             | Bin
>  tests/data/acpi/{ => aarch64}/virt/MCFG             | Bin
>  tests/data/acpi/{ => aarch64}/virt/NFIT.memhp       | Bin
>  tests/data/acpi/{ => aarch64}/virt/PPTT             | Bin
>  .../data/acpi/{ => aarch64}/virt/PPTT.acpihmatvirt  | Bin
>  tests/data/acpi/{ => aarch64}/virt/PPTT.topology    | Bin
>  tests/data/acpi/{ => aarch64}/virt/SLIT.memhp       | Bin
>  tests/data/acpi/{ => aarch64}/virt/SPCR             | Bin
>  .../data/acpi/{ => aarch64}/virt/SRAT.acpihmatvirt  | Bin
>  tests/data/acpi/{ => aarch64}/virt/SRAT.memhp       | Bin
>  tests/data/acpi/{ => aarch64}/virt/SRAT.numamem     | Bin
>  tests/data/acpi/{ => aarch64}/virt/SSDT.memhp       | Bin
>  tests/data/acpi/{ => aarch64}/virt/VIOT             | Bin
>  25 files changed, 0 insertions(+), 0 deletions(-)
>  rename tests/data/acpi/{ => aarch64}/virt/APIC (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/APIC.acpihmatvirt (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/APIC.topology (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/DBG2 (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/DSDT (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/DSDT.acpihmatvirt (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/DSDT.memhp (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/DSDT.pxb (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/DSDT.topology (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/FACP (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/GTDT (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/HMAT.acpihmatvirt (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/IORT (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/MCFG (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/NFIT.memhp (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/PPTT (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/PPTT.acpihmatvirt (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/PPTT.topology (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/SLIT.memhp (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/SPCR (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/SRAT.acpihmatvirt (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/SRAT.memhp (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/SRAT.numamem (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/SSDT.memhp (100%)
>  rename tests/data/acpi/{ => aarch64}/virt/VIOT (100%)
> 
> diff --git a/tests/data/acpi/virt/APIC b/tests/data/acpi/aarch64/virt/APIC
> similarity index 100%
> rename from tests/data/acpi/virt/APIC
> rename to tests/data/acpi/aarch64/virt/APIC
> diff --git a/tests/data/acpi/virt/APIC.acpihmatvirt b/tests/data/acpi/aarch64/virt/APIC.acpihmatvirt
> similarity index 100%
> rename from tests/data/acpi/virt/APIC.acpihmatvirt
> rename to tests/data/acpi/aarch64/virt/APIC.acpihmatvirt
> diff --git a/tests/data/acpi/virt/APIC.topology b/tests/data/acpi/aarch64/virt/APIC.topology
> similarity index 100%
> rename from tests/data/acpi/virt/APIC.topology
> rename to tests/data/acpi/aarch64/virt/APIC.topology
> diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/aarch64/virt/DBG2
> similarity index 100%
> rename from tests/data/acpi/virt/DBG2
> rename to tests/data/acpi/aarch64/virt/DBG2
> diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/aarch64/virt/DSDT
> similarity index 100%
> rename from tests/data/acpi/virt/DSDT
> rename to tests/data/acpi/aarch64/virt/DSDT
> diff --git a/tests/data/acpi/virt/DSDT.acpihmatvirt b/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt
> similarity index 100%
> rename from tests/data/acpi/virt/DSDT.acpihmatvirt
> rename to tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt
> diff --git a/tests/data/acpi/virt/DSDT.memhp b/tests/data/acpi/aarch64/virt/DSDT.memhp
> similarity index 100%
> rename from tests/data/acpi/virt/DSDT.memhp
> rename to tests/data/acpi/aarch64/virt/DSDT.memhp
> diff --git a/tests/data/acpi/virt/DSDT.pxb b/tests/data/acpi/aarch64/virt/DSDT.pxb
> similarity index 100%
> rename from tests/data/acpi/virt/DSDT.pxb
> rename to tests/data/acpi/aarch64/virt/DSDT.pxb
> diff --git a/tests/data/acpi/virt/DSDT.topology b/tests/data/acpi/aarch64/virt/DSDT.topology
> similarity index 100%
> rename from tests/data/acpi/virt/DSDT.topology
> rename to tests/data/acpi/aarch64/virt/DSDT.topology
> diff --git a/tests/data/acpi/virt/FACP b/tests/data/acpi/aarch64/virt/FACP
> similarity index 100%
> rename from tests/data/acpi/virt/FACP
> rename to tests/data/acpi/aarch64/virt/FACP
> diff --git a/tests/data/acpi/virt/GTDT b/tests/data/acpi/aarch64/virt/GTDT
> similarity index 100%
> rename from tests/data/acpi/virt/GTDT
> rename to tests/data/acpi/aarch64/virt/GTDT
> diff --git a/tests/data/acpi/virt/HMAT.acpihmatvirt b/tests/data/acpi/aarch64/virt/HMAT.acpihmatvirt
> similarity index 100%
> rename from tests/data/acpi/virt/HMAT.acpihmatvirt
> rename to tests/data/acpi/aarch64/virt/HMAT.acpihmatvirt
> diff --git a/tests/data/acpi/virt/IORT b/tests/data/acpi/aarch64/virt/IORT
> similarity index 100%
> rename from tests/data/acpi/virt/IORT
> rename to tests/data/acpi/aarch64/virt/IORT
> diff --git a/tests/data/acpi/virt/MCFG b/tests/data/acpi/aarch64/virt/MCFG
> similarity index 100%
> rename from tests/data/acpi/virt/MCFG
> rename to tests/data/acpi/aarch64/virt/MCFG
> diff --git a/tests/data/acpi/virt/NFIT.memhp b/tests/data/acpi/aarch64/virt/NFIT.memhp
> similarity index 100%
> rename from tests/data/acpi/virt/NFIT.memhp
> rename to tests/data/acpi/aarch64/virt/NFIT.memhp
> diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/aarch64/virt/PPTT
> similarity index 100%
> rename from tests/data/acpi/virt/PPTT
> rename to tests/data/acpi/aarch64/virt/PPTT
> diff --git a/tests/data/acpi/virt/PPTT.acpihmatvirt b/tests/data/acpi/aarch64/virt/PPTT.acpihmatvirt
> similarity index 100%
> rename from tests/data/acpi/virt/PPTT.acpihmatvirt
> rename to tests/data/acpi/aarch64/virt/PPTT.acpihmatvirt
> diff --git a/tests/data/acpi/virt/PPTT.topology b/tests/data/acpi/aarch64/virt/PPTT.topology
> similarity index 100%
> rename from tests/data/acpi/virt/PPTT.topology
> rename to tests/data/acpi/aarch64/virt/PPTT.topology
> diff --git a/tests/data/acpi/virt/SLIT.memhp b/tests/data/acpi/aarch64/virt/SLIT.memhp
> similarity index 100%
> rename from tests/data/acpi/virt/SLIT.memhp
> rename to tests/data/acpi/aarch64/virt/SLIT.memhp
> diff --git a/tests/data/acpi/virt/SPCR b/tests/data/acpi/aarch64/virt/SPCR
> similarity index 100%
> rename from tests/data/acpi/virt/SPCR
> rename to tests/data/acpi/aarch64/virt/SPCR
> diff --git a/tests/data/acpi/virt/SRAT.acpihmatvirt b/tests/data/acpi/aarch64/virt/SRAT.acpihmatvirt
> similarity index 100%
> rename from tests/data/acpi/virt/SRAT.acpihmatvirt
> rename to tests/data/acpi/aarch64/virt/SRAT.acpihmatvirt
> diff --git a/tests/data/acpi/virt/SRAT.memhp b/tests/data/acpi/aarch64/virt/SRAT.memhp
> similarity index 100%
> rename from tests/data/acpi/virt/SRAT.memhp
> rename to tests/data/acpi/aarch64/virt/SRAT.memhp
> diff --git a/tests/data/acpi/virt/SRAT.numamem b/tests/data/acpi/aarch64/virt/SRAT.numamem
> similarity index 100%
> rename from tests/data/acpi/virt/SRAT.numamem
> rename to tests/data/acpi/aarch64/virt/SRAT.numamem
> diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/aarch64/virt/SSDT.memhp
> similarity index 100%
> rename from tests/data/acpi/virt/SSDT.memhp
> rename to tests/data/acpi/aarch64/virt/SSDT.memhp
> diff --git a/tests/data/acpi/virt/VIOT b/tests/data/acpi/aarch64/virt/VIOT
> similarity index 100%
> rename from tests/data/acpi/virt/VIOT
> rename to tests/data/acpi/aarch64/virt/VIOT


