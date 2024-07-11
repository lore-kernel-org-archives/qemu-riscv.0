Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34224C3DA41
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 13:53:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sRuEh-0004oC-Hm; Thu, 11 Jul 2024 09:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sRuEg-0004iu-6Z
 for qemu-riscv@nongnu.org; Thu, 11 Jul 2024 09:53:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sRuEU-0003U8-QM
 for qemu-riscv@nongnu.org; Thu, 11 Jul 2024 09:53:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720705994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lxk5YZf7FVMgsc3glhDTzLAvcLoX3al/3jsWvTicxYg=;
 b=YNhAYafrnfscrWYRb4vK3QQQgTjpa1HC954Cs2lF7uxP/mXwzmEk6lQdsziZgsb8Mdyrpk
 eGQc+0+uzoryTapv0EBGjkg7Mei8qN5fEgbSHcvTJHSpJmTFcqBX9eN6KBo2ip4PX+PStD
 wXNe2uBZfB1XeAWsBhedF9SF/QlsvEY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-PLFF6CBpPrmrPKxRxr6acg-1; Thu, 11 Jul 2024 09:53:10 -0400
X-MC-Unique: PLFF6CBpPrmrPKxRxr6acg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-367a3052cfaso633809f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 11 Jul 2024 06:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720705989; x=1721310789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lxk5YZf7FVMgsc3glhDTzLAvcLoX3al/3jsWvTicxYg=;
 b=rtM8x1tRsXVeMxaJ98fV8Ea/txJYylJxNYP25ZsO1F0ywhsa9DfWDNO5PaiAvPKpP3
 U9umBgBBgVd7lnzERSCe9m353Sv91gAhuaPSj53J8d+1TXN16j3IgKOMoBxGJcGBDFqf
 xyl2JZ51+LGqXhISLePKcUGKLMVdDiXzJhAouxctWJk2EnxMWhzgUN1IgsHscB4JSEVy
 57U4idtn1LDwqm86tzjZP/HELMFndDq6CfskHXbAkBSfUN3e+Al0+z14HOHAoKEUONy4
 YxxKFxTvWTn3EerxWUo6XC2kZbCBDRUWsawrGVG5c5ZnVFfxOQlAvPSDpfzovkqPCQif
 x9wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO40RuQwXobBDTfZIowF39giVKdrHn5XCMJ2jFNAOEaMcIIDxrw4MSIOqUrA6AYttzGFLCzJAHzmn5xLBh0RlrW6fPu9U=
X-Gm-Message-State: AOJu0Yxz5GqNKXEsy4q/4Mqsf2FXHTCLXOjEOhx8GgyQ15fnPiAnX0tz
 ati8LE84cWL/RJuNqzRis0OTtygIJIphzSfwWN+JLiH9GPXKUgXhL2A9885iQOMmJLvtoEdko+J
 EP8KTIywCBXjM2JTTilBsEkDX0Dzwq/YaS7pb2XOvAesoZzhsnLl6
X-Received: by 2002:a05:6000:884:b0:367:9049:da36 with SMTP id
 ffacd0b85a97d-367cead121dmr7746939f8f.44.1720705989643; 
 Thu, 11 Jul 2024 06:53:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEZtoYfdsctch1MmTh/P4kIFNu2VCKbrAzsmkeegIwLxi7k8IuVKqSB0x1hbqgOuwkOUCkgA==
X-Received: by 2002:a05:6000:884:b0:367:9049:da36 with SMTP id
 ffacd0b85a97d-367cead121dmr7746928f8f.44.1720705989318; 
 Thu, 11 Jul 2024 06:53:09 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7e32asm7823914f8f.10.2024.07.11.06.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 06:53:08 -0700 (PDT)
Date: Thu, 11 Jul 2024 15:53:08 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, Bin Meng
 <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, Daniel Henrique
 Barboza <dbarboza@ventanamicro.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, "Michael S . Tsirkin" <mst@redhat.com>, Ani
 Sinha <anisinha@redhat.com>
Subject: Re: [PATCH v2 3/9] tests/acpi: Allow DSDT acpi table changes for
 aarch64
Message-ID: <20240711155308.61adccfe@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240708114741.3499585-4-sunilvl@ventanamicro.com>
References: <20240708114741.3499585-1-sunilvl@ventanamicro.com>
 <20240708114741.3499585-4-sunilvl@ventanamicro.com>
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

On Mon,  8 Jul 2024 17:17:35 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> so that CI tests don't fail when those ACPI tables are updated in the
> next patch. This is as per the documentation in bios-tables-tests.c.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..9282ea0fb2 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,7 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/DSDT",
> +"tests/data/acpi/aarch64/virt/DSDT.memhp",
> +"tests/data/acpi/aarch64/virt/DSDT.topology",
> +"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
> +"tests/data/acpi/aarch64/virt/DSDT.pxb",
> +"tests/data/acpi/x86/microvm/DSDT.pcie",


