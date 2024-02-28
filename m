Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A2AC47DD9
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 12:14:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rfIos-0000ra-UJ; Wed, 28 Feb 2024 07:13:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rfI6P-0006JG-Qm
 for qemu-riscv@nongnu.org; Wed, 28 Feb 2024 06:27:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rfI6O-0001Ga-D7
 for qemu-riscv@nongnu.org; Wed, 28 Feb 2024 06:27:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709119675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FaarZDULADUc86F/iVyac8VEEP1ANcIwMyS02vEbG6I=;
 b=Fw7QHb+oe7JszHufnjp5vWK3JWGcKCggg2rN0HcIx6OrTG8TH0XvLpvf9BMBp28KjjsD5x
 OjCEEqZeP9Dw7qaNx4zfGn8+bfYKuYKb4cQjGoa5EPnxOu4oGmtsDUBFzwhk8zLhbF14s9
 a7wq0e/ZyCBNV6pvf10bgarka/om3G4=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-UHRsOPuLPAew27xOpogk0g-1; Wed, 28 Feb 2024 06:27:54 -0500
X-MC-Unique: UHRsOPuLPAew27xOpogk0g-1
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-6e5382e18e8so2740881b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 28 Feb 2024 03:27:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709119673; x=1709724473;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+4R/WMwzgEaVb2wWead6cJP5bUNhcyCGedNVRcbbWic=;
 b=kMlk/BwQGzcWLzi3D9lqXtbCfHZCYIusFiWf1eikJJPZzhKDrpG6IXYvmNVZTY2K6e
 ALeHzRRuY2JY44Mc9697Pir+7r+a9hytKxdNYOZ2jTkw9Q/BRfyHfy9Y+wmw8+d9bHaO
 75cN37+agxLHJ/DToYTRHgBBJTNdeXfFFJzrlsDPPG82Uavcozce5z+CB731HXv1OyKk
 6xIiqqEn0LNcKMnfznRL7l3hpP19bNUjU+P6No/huOckt711gMAwZs5S6j2DG2qkNhvd
 ogvANDlzSGsCmctXl+TiGkRtp6oAOMsvjtJsNcuYnDwPZyFHrC1QPsZtmS1c9GuWqYiA
 yL1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjbo8cu2UF062DikAcLIFJSm2vEidCgHPRd6ncfMgtX3SunzrIwGQmyjKp65e913NRkV/QtKpTRX3mNlTOwESwEJfLywQ=
X-Gm-Message-State: AOJu0YxmIautNt6eK9hdk29l0MDXG15vBSomdZ7KoB48kG8JGlvYO5SY
 +RW+OCO5+EufaIHGZMSqfEtzlto/y08plbAu/UNPnZmbJZa4ci145/utOxrkeputEUIDb+AdhHZ
 pscVnMG20OLXaxR8oCJGX7NTim5p1PeyiQGNY9sRN3Q+aI0EMP7b4
X-Received: by 2002:a05:6a00:4403:b0:6e5:265:fd31 with SMTP id
 br3-20020a056a00440300b006e50265fd31mr15015559pfb.7.1709119673295; 
 Wed, 28 Feb 2024 03:27:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpVT51NaUTErIo0OqUsCBzaIH7guS+7sJYRcO4y/KvfCLTlQN9nUW2DWzC+LKNXi4VGorC5Q==
X-Received: by 2002:a05:6a00:4403:b0:6e5:265:fd31 with SMTP id
 br3-20020a056a00440300b006e50265fd31mr15015542pfb.7.1709119672994; 
 Wed, 28 Feb 2024 03:27:52 -0800 (PST)
Received: from smtpclient.apple ([115.96.143.215])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a056a00179000b006e57247f4e5sm372024pfg.8.2024.02.28.03.27.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Feb 2024 03:27:52 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH 04/19] smbios: cleanup smbios_get_tables() from legacy
 handling
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240227154749.1818189-5-imammedo@redhat.com>
Date: Wed, 28 Feb 2024 16:57:34 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Message-Id: <45D1D5DE-6D90-47E2-88CC-1810020B94D0@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-5-imammedo@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 28 Feb 2024 07:12:41 -0500
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



> On 27-Feb-2024, at 21:17, Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> smbios_get_tables() bails out right away if leagacy mode is enabled
> and won't generate any SMBIOS tables. At the same time x86 specific
> fw_cfg_build_smbios() will genarate legacy tables and then proceed
> to preparing temporary mem_array for useless call to
> smbios_get_tables() and then discard it.
>=20
> Drop legacy related check in smbios_get_tables() and return from
> fw_cfg_build_smbios() early if legacy tables where built without
> proceeding to non legacy part of the function.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> hw/i386/fw_cfg.c   | 1 +
> hw/smbios/smbios.c | 6 ------
> 2 files changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
> index 98a478c276..a635234e68 100644
> --- a/hw/i386/fw_cfg.c
> +++ b/hw/i386/fw_cfg.c
> @@ -74,6 +74,7 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgSta=
te *fw_cfg)
>     if (smbios_tables) {
>         fw_cfg_add_bytes(fw_cfg, FW_CFG_SMBIOS_ENTRIES,
>                          smbios_tables, smbios_tables_len);
> +        return;
>     }
>=20
>     /* build the array of physical mem area from e820 table */
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index a3c4e52ce9..8e86c62184 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -1106,12 +1106,6 @@ void smbios_get_tables(MachineState *ms,
> {
>     unsigned i, dimm_cnt, offset;
>=20
> -    if (smbios_legacy) {
> -        *tables =3D *anchor =3D NULL;
> -        *tables_len =3D *anchor_len =3D 0;
> -        return;
> -    }
> -
>     if (!smbios_immutable) {
>         smbios_build_type_0_table();
>         smbios_build_type_1_table();
> --=20
> 2.39.3
>=20


