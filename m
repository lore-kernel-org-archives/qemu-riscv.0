Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB327C83F1A
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 07:46:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ueqeb-0007Lh-E5; Thu, 24 Jul 2025 03:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ueqeR-0007J5-Qt
 for qemu-riscv@nongnu.org; Thu, 24 Jul 2025 03:46:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ueqeJ-0006wD-8t
 for qemu-riscv@nongnu.org; Thu, 24 Jul 2025 03:46:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753343154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wX6HZ+UeM9JnvUfbodj8PdWMexklfZdlXskcrxQ81do=;
 b=NRsyAk/opBNJEAIUNK3d8m3qQXq9mroisXl8o456IvPcT18Q/MF7q7Qh00+So6AbugYK1j
 SB0O7mFZ2Mtd063t2yZqimluCjCtzUdH5iL3zEG2LPw3Yqf8mR++YXGmYoogt2E2O18hUm
 Qq8qMMCpFQrpjkamsywsP+j97bc8NBc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-IT2txYLOMDKKOmwiPVJfiw-1; Thu, 24 Jul 2025 03:45:52 -0400
X-MC-Unique: IT2txYLOMDKKOmwiPVJfiw-1
X-Mimecast-MFC-AGG-ID: IT2txYLOMDKKOmwiPVJfiw_1753343151
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45359bfe631so3518855e9.0
 for <qemu-riscv@nongnu.org>; Thu, 24 Jul 2025 00:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753343151; x=1753947951;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wX6HZ+UeM9JnvUfbodj8PdWMexklfZdlXskcrxQ81do=;
 b=dICtz8+zlEOU2MrFHNCL4w5YdckkNJyrNBHwx2EO/TQz7M1JPLPFFC2bEtKjlEASZ8
 vK0lo4+7AGV/QXlhAYgOHEaXoceRMm2jQ42iXjf1oGoFniml1NiHYIt9zH1vLcXAm8ui
 pyBKd7n6TBOnQi62bAoyGKPSRbdCX2qnOYf8JlBmaoXzaBX22CdLVDyPa7jMCCiu/H4x
 GEgONxIlRw8lmnqR29oAp/UJh1o6QvB16zQlmycWd698/BRlgGX2K0UKTrPjC3bfNoy5
 7nEVg73lJzF/JIxi+iActJdt4ypZMBqbD2OvPhWp+BmaEG0MfVT6xSlvK0nvrs1wXURV
 MV0w==
X-Gm-Message-State: AOJu0Yzfj607j958eknzAXi6063mDGFD0//9j4ilpsOBbhUShdUPGDnt
 IRFnk0VmREeg1Je+qktwIBBqhC/Ialt7PdtHw3y+2OzMlhL4Jm8mZO9sztnwkLuTBa8Ifm7eK6A
 pGcvVGMo6LGCGMsPsif3bhwnM3Q6ExfMiQKnhelQamHBZPo52l0xwmZa+
X-Gm-Gg: ASbGncuf3duFgDuilfRsPhRWCiSF3H7i7aGBJobirjAcdwYi6YhKmPaji+USsK4k1V+
 ohClylTa+LfA4yLernGC8/bBR5kE4qckv9pGCWIAnklY77WluCblYxG8j1TmLE8yDQV1uGPt9nl
 tc2VKj3JtjkXvXoiwr7OpjN5qoxEx57+NYplErczad+OIGWU3BCKhuTWtfCmTmKbn5bp/M6qgj8
 nOwAbnycfWxkpZzuzsLyu/HsZACq4KUKWCnUC2lbDROb4+kyT9jwQXPq8pPhDiaWW5fqOafPMx6
 Ak0fluaP6aQB6K3MySTnIqodKXklX+CoI8Y=
X-Received: by 2002:a05:600c:1d8c:b0:456:161c:3d6f with SMTP id
 5b1f17b1804b1-45868c8da9amr46915475e9.11.1753343151475; 
 Thu, 24 Jul 2025 00:45:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEliXnBkWxaouRo5J9gQJ4X2acNO2T4Ecwo6Yv/gA9h1Szojig/Xxuo4eOF755uQznkEojn1A==
X-Received: by 2002:a05:600c:1d8c:b0:456:161c:3d6f with SMTP id
 5b1f17b1804b1-45868c8da9amr46915275e9.11.1753343151072; 
 Thu, 24 Jul 2025 00:45:51 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:153d:b500:b346:7481:16b2:6b23])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587054c819sm9267675e9.13.2025.07.24.00.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 00:45:50 -0700 (PDT)
Date: Thu, 24 Jul 2025 03:45:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 0/3] RISC-V: ACPI: Update FADT and MADT versions
Message-ID: <20250724034501-mutt-send-email-mst@kernel.org>
References: <20250716144140.3954431-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20250716144140.3954431-1-sunilvl@ventanamicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: auQ_W2aPqg4VUDMsCaAveVvv57cIRX_Un_19v7uvxUk_1753343151
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Jul 16, 2025 at 08:11:37PM +0530, Sunil V L wrote:
> Since RISC-V support is added only in ACPI 6.6, it should adhere to the
> expected FADT and MADT versions. Update them.


Seems legit

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Risc maintainers, any feedback?

> Sunil V L (3):
>   bios-tables-test-allowed-diff.h: Allow RISC-V FADT and MADT changes
>   hw/riscv/virt-acpi-build.c: Update FADT and MADT versions
>   tests/data/acpi/riscv64: Update expected FADT and MADT
> 
>  hw/riscv/virt-acpi-build.c        |   4 ++--
>  tests/data/acpi/riscv64/virt/APIC | Bin 116 -> 116 bytes
>  tests/data/acpi/riscv64/virt/FACP | Bin 276 -> 276 bytes
>  3 files changed, 2 insertions(+), 2 deletions(-)
> 
> -- 
> 2.43.0


