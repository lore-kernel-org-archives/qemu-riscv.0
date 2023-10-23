Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C1BC001E0
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 12:42:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1quuGC-0004l7-An; Mon, 23 Oct 2023 08:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quuGA-0004kQ-Ol
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 08:42:18 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quuG7-00029X-NN
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 08:42:18 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso483916666b.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Oct 2023 05:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698064934; x=1698669734; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sL86v2mc3VZ99aedO1TusOCiA+FWuj8pby0T4XoGr0Y=;
 b=jq9WC2gMgVzCQp/Zz9XOZpEN9B3KvMWJQ9SLKbeoHJB+hexk5vta47BzgdZsWDo03w
 EloCUslrtC+kTZxtVobLvtqb9Zi+jVQhGUhgONuK6pEu3e7MpOOveaOakYjvIpWUa29B
 muvhogCkV8LkyKh3yd24E2k7bdct3XBMV/xk1C2QytOW5BOVAocv5EdIr5xwfXEbJjKH
 C9KhItWjBvKSxdqsdL2R+nyxMqcmerF4IVY4emJhMN2TRsKsTmrxQ5H5U5G5FjQEw4Cq
 eU4dgSWTzAe+8Gf5V5t0uz5KWNpVXAEnzsXuinE+Ca6m8V6ZflH6w1+amNJRKVQzxRcB
 6xDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698064934; x=1698669734;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sL86v2mc3VZ99aedO1TusOCiA+FWuj8pby0T4XoGr0Y=;
 b=t3I4/PmxxzWFIJeRw9/pnF0D8Pl6dNV+Cww7/PtZjRm6vEmZi4j9+4sQZWJ7sdHcVu
 ysm9jDQ2aE+bd6j/k7c6wJqFkE44tSdzwJgbN8mngKEbHX+7we59dN3dmfhLhEm2JOR6
 m5d8VRz6PxDhZ5b3J0t4waLU4LsAS7zNowfheKczzT+LAfaYfYtJmyDhRqW9S7Is967U
 Di8CNl7RmSbgSBFggBETf4Rc8Q9GpySxIY84x+xP9Jv6NFBLuKtSm7o5VlxS1cnFpJXJ
 nD2+0tHNAsL5+y4x+nCEOYi1lHUjV9TWnEz8FcqfQdf54VBGNvno/7lHrS92qiU5VmSb
 Zzpw==
X-Gm-Message-State: AOJu0Yymo6zVSD/5NS1BnLJdST2gtOKdWZ44mxw0RWx7jHbPcttBd1vi
 ct+RqzFTKvaYxvCpoYdCQ/sBQQ==
X-Google-Smtp-Source: AGHT+IFCouKxI5UnBcIz6C2UUi2D95UZo0hYyRr9e9bxfA7YiyxxV+Kj3k/VxviIv7siKH7dgspGLw==
X-Received: by 2002:a17:907:720f:b0:9be:fc60:32d9 with SMTP id
 dr15-20020a170907720f00b009befc6032d9mr6260145ejc.47.1698064934248; 
 Mon, 23 Oct 2023 05:42:14 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a170906710d00b009ad87fd4e65sm6580095ejj.108.2023.10.23.05.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 05:42:13 -0700 (PDT)
Date: Mon, 23 Oct 2023 14:42:13 +0200
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
Subject: Re: [PATCH v3 05/12] hw/riscv/virt-acpi-build.c: Add IMSIC in the MADT
Message-ID: <20231023-3326c09cb09cc345378a4420@orel>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-6-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019132648.23703-6-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 19, 2023 at 06:56:41PM +0530, Sunil V L wrote:
> Add IMSIC structure in MADT when IMSIC is configured.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

