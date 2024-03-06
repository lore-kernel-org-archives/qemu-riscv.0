Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5E2C5475B
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 09:21:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rhnSD-0002of-2s; Wed, 06 Mar 2024 04:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhnSC-0002o5-1s
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 04:20:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhnS8-0002oc-Nx
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 04:20:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709716840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f+xbs4Zv81wC/d85gwB3wyHo7HUcDcCDHGPr2UeXdwE=;
 b=UfFpwJZFf38IbUAZZHvzPZgfSFXZRjlvjZb8VhWMuT1A5punqoSi7ISQB8sjmRuBk0J11M
 gjOA0dkJnXpyd1ilqd6bZtav2kVaQby/uRw8gXSDR8qtW/tM7HTOBfF6eQ8SW/t/p4dO2O
 Nqd3kQRBWqF+JozIIMIx+ft5CFqw2Yc=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-RBx8XJ4ZONOmPlmY9EH9Cw-1; Wed, 06 Mar 2024 04:20:39 -0500
X-MC-Unique: RBx8XJ4ZONOmPlmY9EH9Cw-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1dc435b3e87so57847005ad.1
 for <qemu-riscv@nongnu.org>; Wed, 06 Mar 2024 01:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709716838; x=1710321638;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zzWX08Pqnklos6/nMIEev6rgEQxG8m1Enm3rRtbZGlk=;
 b=O9maECxdijz0r6CTp974rPnbBn2Tt/wCVjLEGrPoeMz+ceSaVHFwkbfRnMTCPCMD+c
 RVAU9TXyulMNCpFQ2VKP8qOUe3CWa0W6rYwax1KOu1pIooBfN/nK86AGJjKCzsyi5VA1
 zmhbVfQU+BbgN8yTcs7q9lgfeDwZ74aTItDCp0pCGCNCU699z5zIPC2wKS6vY2oliCef
 wmH95xtjzhrcyS4IkZZj1KtOoZynIWE6XRckZzDBEoDrq74T1Jc6NAXDxhijExz5vqt8
 xv7MzCzcYswFbYjm5zMI1jvhhKUht0ZV0DB0d6O5M52L2F4B9VPcjsMb+h1EAPPrVJJG
 gwyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAKn29VNSrRmWVByiWjNHC3DB9AJAmqpwy/0EUro5BZzYKHdxW11Rp1Lg5yn0JYDCKuN7B7Tvb7UQD0i+idoNFs/CDRsg=
X-Gm-Message-State: AOJu0Ywq7l9+xp2JKUxQGOpuxr04PxiypjPyx2ELfxDEPhuXfui2g3Rv
 SwLtMtvsC0HBRAX0iJ1TLW6MQCqIgX6YRFD4d4emcVO2RQM9Hx9ertSeh27s93STOgYb2ZIBD3R
 GbfR37MaVpDkJ2jhhWzAB98UxLrJStjFQJjP1Nds8iJvAmz/H3MEB
X-Received: by 2002:a17:902:f544:b0:1dc:c17d:6edd with SMTP id
 h4-20020a170902f54400b001dcc17d6eddmr4676868plf.20.1709716838355; 
 Wed, 06 Mar 2024 01:20:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF48frTF7egD8Jc+BDzjjpexKu+NeXiXWVI4wc2wPirWW89Y6Lnv0Q5c+kj0ukkvINaFCanNw==
X-Received: by 2002:a17:902:f544:b0:1dc:c17d:6edd with SMTP id
 h4-20020a170902f54400b001dcc17d6eddmr4676833plf.20.1709716838010; 
 Wed, 06 Mar 2024 01:20:38 -0800 (PST)
Received: from smtpclient.apple ([115.96.30.47])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a170903229100b001db8a5ea0a3sm12089566plh.94.2024.03.06.01.20.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Mar 2024 01:20:37 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v2 20/20] tests: acpi: update expected SSDT.dimmpxm blob
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240305155724.2047069-21-imammedo@redhat.com>
Date: Wed, 6 Mar 2024 14:50:20 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, philmd@linaro.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Message-Id: <9E373F64-2290-4AF7-A23D-340FB6CE86F8@redhat.com>
References: <20240305155724.2047069-1-imammedo@redhat.com>
 <20240305155724.2047069-21-imammedo@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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



> On 05-Mar-2024, at 21:27, Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> address shift is caused by switch to 32-bit SMBIOS entry point
> which has slightly different size from 64-bit one and happens
> to trigger a bit different memory layout.

Why does it affect only q35 machines and not i440fx as well?

>=20
> Expected diff:
>=20
> -    Name (MEMA, 0x07FFE000)
> +    Name (MEMA, 0x07FFF000)
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Acked-by: Ani Sinha <anisinha@redhat.com>

> ---
> tests/qtest/bios-tables-test-allowed-diff.h |   1 -
> tests/data/acpi/q35/SSDT.dimmpxm            | Bin 1815 -> 1815 bytes
> 2 files changed, 1 deletion(-)
>=20
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bi=
os-tables-test-allowed-diff.h
> index 81148a604f..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,2 +1 @@
> /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/q35/SSDT.dimmpxm",
> diff --git a/tests/data/acpi/q35/SSDT.dimmpxm b/tests/data/acpi/q35/SSDT.=
dimmpxm
> index 70f133412f5e0aa128ab210245a8de7304eeb843..9ea4e0d0ceaa8a5cbd706afb6=
d49de853fafe654 100644
> GIT binary patch
> delta 23
> ecmbQvH=3DU0wIM^jboSlJzam_|9E_UV*|JeaVTLvQl
>=20
> delta 23
> ecmbQvH=3DU0wIM^jboSlJzanD9BE_UVz|JeaVy9Ofw
>=20
> --=20
> 2.39.3
>=20


