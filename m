Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AA7C25B74
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 May 2024 15:16:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sBc5f-0001oO-Di; Mon, 27 May 2024 11:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sBc5d-0001ne-Gf
 for qemu-riscv@nongnu.org; Mon, 27 May 2024 11:16:45 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sBc5a-0008TY-S7
 for qemu-riscv@nongnu.org; Mon, 27 May 2024 11:16:44 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6f8ecafd28cso2668963b3a.3
 for <qemu-riscv@nongnu.org>; Mon, 27 May 2024 08:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1716823001; x=1717427801; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YNZCKIEg/wB7FBJ60uujpf+diVNX2hoPtBar8fDBLso=;
 b=Ou3An3L9pqcy9wt2QNnRtpKQ1QROQ/xyy6Fi1DEh544yoaPPiPw7FAiKIMjsJ6FENg
 9AfyM5C/qfHaXRlqkinUnoa6jVm6KCF/dIFIkSsGZcg2b794YT45zpv2tl3yxVlg8HNs
 EDZyGH29y8D1f/o9sMnyTWgQDDB6hCRFHT59s1JVX9zuIEIFlLLCVTFw8rF0u4NxKhg/
 w6BJpgZVA9eu1Y2cQtaS28M4UkpAMeO7MQ9sdkKs8ufTtdR/0CEmKffTYnKiLXvfiYRW
 3WbferVNt3aRuXWwv8RUlXeCzJYFwqEmQ5aWB4vzhLilxFQyLKGDWIZIzp/6nV93QYtR
 fBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716823001; x=1717427801;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YNZCKIEg/wB7FBJ60uujpf+diVNX2hoPtBar8fDBLso=;
 b=tB8kgz9QZBqLwTDWxSW38wu/k22Otu1+l4MtUHdE8j5hekmWoW5JVnOiQ9wZyk0HVB
 toMmsyU9vXNZQ15aRGpC+1kwUv9WJEcqu5j2Cbj0thKYtc7pQDZLUiM/e89IByN2RJg0
 1dMe71PEvxvE1Bn+8A4RClDbVGDWFziqdDlYH4pBzrHwX0z23bcYDOW6JLVvrJx06LFt
 UXoevhKsVkwmEXvdlfn9JM4LyJnuP4bz+/vVZPKyY6haaAkZi16rSnh4O7j/EmMES0U+
 XfCPhhHZP56v9xN4uc2nvR6yd/by/QhouFkmbJUSWmti8Vru36KwZubQSZvnznIZ0Mm0
 V8lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2hxYpk/41RD5Un6O+lbFcdzFtTEfgt0GJXcivIogehYr09ZjyjywbC7aYx9BAG3QSnsqZaXewAsCVV14lU3zFPPa1QBA=
X-Gm-Message-State: AOJu0YxGqnMob83SSjWmk+xz1C3J79dAkVcTfrOSEluSTGVDHWRXf8cm
 7B1ZUFbtTd2QJmC45EnwnT8IWntH0FXndfr25iROXb7fdc/Qz2vtk2SiR6bqCHg=
X-Google-Smtp-Source: AGHT+IFiHIgKd/rnJEicqxIOXfdw3SGT+klsDYlCicD7ji3mZ5xjHknFLrAdPZ51WWQdybvlOg4hVw==
X-Received: by 2002:aa7:9a85:0:b0:6eb:6:6b72 with SMTP id
 d2e1a72fcca58-6f8f3b454a7mr7501875b3a.25.1716823000697; 
 Mon, 27 May 2024 08:16:40 -0700 (PDT)
Received: from sunil-laptop ([106.51.188.31]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbf2e3d5sm4986549b3a.9.2024.05.27.08.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 08:16:40 -0700 (PDT)
Date: Mon, 27 May 2024 20:46:29 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alistair Francis <alistair23@gmail.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Haibo1 Xu <haibo1.xu@intel.com>, Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 06/12] tests/data/acpi/virt: Move ACPI tables under
 aarch64
Message-ID: <ZlSjzfSj8MwDcJk6@sunil-laptop>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
 <20240524061411.341599-7-sunilvl@ventanamicro.com>
 <27cef750-262a-402a-97fe-c4a55700a376@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27cef750-262a-402a-97fe-c4a55700a376@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, May 27, 2024 at 12:12:10PM +0200, Philippe Mathieu-Daudé wrote:
> Hi Sunil,
> 
> On 24/5/24 08:14, Sunil V L wrote:
> > Since virt is a common machine name across architectures like ARM64 and
> > RISC-V, move existing ARM64 ACPI tables under aarch64 folder so that
> > RISC-V tables can be added under riscv64 folder in future.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >   tests/data/acpi/virt/{ => aarch64}/APIC             | Bin
> 
> The usual pattern is {target}/{machine}, so instead of:
> 
>   microvm/
>   pc/
>   q35/
>   virt/aarch64/
>   virt/riscv64/
> 
> (which is odd because q35 is the x86 'virt'), I'd rather see:
> 
>   x86/microvm/
>   x86/pc/
>   x86/q35/
>   aarch64/virt/
>   riscv64/virt/
> 
> Anyhow just my 2 cents, up to the ACPI maintainers :)
> 
Hi Phil,

Your suggestion does make sense to me. Let me wait for feedback from
ARM/ACPI maintainers.

Thanks,
Sunil

