Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F30C5478C
	for <qemu-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 06:01:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rhNrG-000575-KN; Tue, 05 Mar 2024 01:00:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhNrF-00056L-L4
 for qemu-riscv@nongnu.org; Tue, 05 Mar 2024 01:00:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhNrD-0005hX-UQ
 for qemu-riscv@nongnu.org; Tue, 05 Mar 2024 01:00:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709618454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AwqpMbOk65B+iZwPaEhz1H6LgHjd1GdC7cUo+HYjoNI=;
 b=HmhdRR5/pdoB9YDZJILvmL+5vfXitWToDloPzgKdhMZXjasFFI0vgBqc/ZFCsZL1Xw+Cte
 VKAtmk4/Xle0KO7WH1OLpxpRBvmbwpAssEq9+uUeVMesffe2LRYSYb0pNaCE5dRlEMnTjZ
 BnYtntR8xha286NU0/NJqCT0/Qqne8E=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-ozJwKlrpMhmczH8fqaiXLg-1; Tue, 05 Mar 2024 01:00:52 -0500
X-MC-Unique: ozJwKlrpMhmczH8fqaiXLg-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1dc7278d020so45992835ad.0
 for <qemu-riscv@nongnu.org>; Mon, 04 Mar 2024 22:00:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709618452; x=1710223252;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WG/8tjaYkx8u3OdWeMNWhdFumkizH8kgmlVXE9b7Voc=;
 b=QAvUnNeetUq3afdeR9cXKMTDzb+N2vCreSYCYh1SBu9Eyck8qNBuqs2R6qfneKhO6o
 m+oEQwn+uDA9LZBp58jr02f7ADLV/p6mjLHCjEdkadsLyiB8F/JNOX7iUxKJzvRhv6I2
 XQ1aSMBTH2S9O/o8/2pAfIjPq2kkpwpvMR76jZxb2ZzB1q2WwwpEc6vgoO2P4NWERn9M
 Mv1fZ2DN1lO5xrvxNCrM234L9MLfKV1KViwQ8tnCSdkKzKBfz+LCskNLjwBqrNGNDe+j
 uXCMNdfOe1iv7LVLTjTsFwsDCno9SqigOKCqENi+TCHcC6CGqZ2fkshPhp2U07A3+Oxm
 FBvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZuhVDj8Ic33D6DCU/9MkcpnZXtWBRjPLdQYa6P/YtQPiQ/tx8KsNnIhujg/A0tHxZn0VeQ5o7Dfgnb4/RsjF7HAMTte0=
X-Gm-Message-State: AOJu0YxdKHFgigjCFbg+PCRkYsV2mivBnqu+JRE0fUYXMnzQalW+jpha
 WVhU9r5NlZ1wX03+/6AS/A3z71H1RIbFHXJT51ZtYFzIJB3WHW+Bp2dcJPBhQAKi5wtqCHPFyt4
 s9fl387aBRLOF6nd90cbK7a/AoNL6amC5aMGqx6+I39wxg/1u49Uf
X-Received: by 2002:a17:902:cece:b0:1dc:6373:3cc with SMTP id
 d14-20020a170902cece00b001dc637303ccmr1126285plg.50.1709618451569; 
 Mon, 04 Mar 2024 22:00:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEu6t+V2j0FglZmJ4c5A4vULyC4SF/KsjFudUQnUvAI5X3mu+7/EdJUXAlw84NaFAWpaxBV9A==
X-Received: by 2002:a17:902:cece:b0:1dc:6373:3cc with SMTP id
 d14-20020a170902cece00b001dc637303ccmr1126246plg.50.1709618451011; 
 Mon, 04 Mar 2024 22:00:51 -0800 (PST)
Received: from smtpclient.apple ([203.163.238.152])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a170902e19200b001dc95e7e191sm9559181pla.298.2024.03.04.22.00.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Mar 2024 22:00:50 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH 14/19] smbios: in case of entry point is 'auto' try to
 build v2 tables 1st
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240227154749.1818189-15-imammedo@redhat.com>
Date: Tue, 5 Mar 2024 11:30:29 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, philmd@linaro.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Message-Id: <5705CEF6-9217-41A1-8DF9-8DD74FB5E5B7@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-15-imammedo@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.571,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



> On 27-Feb-2024, at 21:17, Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> QEMU for some time now uses SMBIOS 3.0 for PC/Q35 machines by
> default, however Windows has a bug in locating SMBIOS 3.0
> entrypoint and fails to find tables when booted on SeaBIOS
> (on UEFI SMBIOS 3.0 tables work fine since firmware hands
> over tables in another way)
>=20
> Missing SMBIOS tables may lead to some issues for guest
> though (worst are: possible reactiveation, inability to
> get virtio drivers from 'Windows Update')
>=20
> It's unclear  at this point if MS will fix the issue on their
> side. So instead of it (or rather in addition) this patch
> will try to workaround the issue.
>=20
> aka, use smbios-entry-point-type=3Dauto to make QEMU try
> generating conservative SMBIOS 2.0 tables and if that
> fails (due to limits/requested configuration) fallback
> to SMBIOS 3.0 tables.
>=20
> With this in place majority of users will use SMBIOS 2.0
> tables which work fine with (Windows + legacy BIOS).
> The configurations that is not to possible to describe
> with SMBIOS 2.0 will switch automatically to SMBIOS 3.0
> (which will trigger Windows bug but there is nothing
> QEMU can do here, so go and aks Microsoft to real fix).
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> hw/smbios/smbios.c | 52 +++++++++++++++++++++++++++++++++++++++++++---
> 1 file changed, 49 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 5a791fd9eb..e54a9f21e6 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -959,7 +959,7 @@ static void smbios_entry_point_setup(SmbiosEntryPoint=
Type ep_type)
>     }
> }
>=20
> -void smbios_get_tables(MachineState *ms,
> +static bool smbios_get_tables_ep(MachineState *ms,
>                        SmbiosEntryPointType ep_type,
>                        const struct smbios_phys_mem_area *mem_array,
>                        const unsigned int mem_array_size,
> @@ -968,6 +968,7 @@ void smbios_get_tables(MachineState *ms,
>                        Error **errp)
> {
>     unsigned i, dimm_cnt, offset;
> +    ERRP_GUARD();
>=20
>     assert(ep_type =3D=3D SMBIOS_ENTRY_POINT_TYPE_32 ||
>            ep_type =3D=3D SMBIOS_ENTRY_POINT_TYPE_64);
> @@ -1052,11 +1053,56 @@ void smbios_get_tables(MachineState *ms,
>         abort();
>     }
>=20
> -    return;
> +    return true;
> err_exit:
>     g_free(smbios_tables);
>     smbios_tables =3D NULL;
> -    return;
> +    return false;
> +}
> +
> +void smbios_get_tables(MachineState *ms,
> +                       SmbiosEntryPointType ep_type,
> +                       const struct smbios_phys_mem_area *mem_array,
> +                       const unsigned int mem_array_size,
> +                       uint8_t **tables, size_t *tables_len,
> +                       uint8_t **anchor, size_t *anchor_len,
> +                       Error **errp)
> +{
> +    Error *local_err =3D NULL;
> +    bool is_valid;
> +    ERRP_GUARD();
> +
> +    switch (ep_type) {
> +    case SMBIOS_ENTRY_POINT_TYPE_AUTO:
> +    case SMBIOS_ENTRY_POINT_TYPE_32:
> +        is_valid =3D smbios_get_tables_ep(ms, SMBIOS_ENTRY_POINT_TYPE_32=
,
> +                                        mem_array, mem_array_size,
> +                                        tables, tables_len,
> +                                        anchor, anchor_len,
> +                                        &local_err);
> +        if (is_valid || ep_type !=3D SMBIOS_ENTRY_POINT_TYPE_AUTO) {
> +            break;
> +        }
> +        /*
> +         * fall through in case AUTO endpoint is selected and
> +         * SMBIOS 2.x tables can't be generated, to try if SMBIOS 3.x
> +         * tables would work
> +         */
> +    case SMBIOS_ENTRY_POINT_TYPE_64:
> +        error_free(local_err);
> +        local_err =3D NULL;
> +        is_valid =3D smbios_get_tables_ep(ms, SMBIOS_ENTRY_POINT_TYPE_64=
,
> +                                        mem_array, mem_array_size,
> +                                        tables, tables_len,
> +                                        anchor, anchor_len,
> +                                        &local_err);
> +        break;
> +    default:
> +        abort();
> +    }
> +    if (!is_valid) {
> +        error_propagate(errp, local_err);
> +    }
> }
>=20
> static void save_opt(const char **dest, QemuOpts *opts, const char *name)
> --=20
> 2.39.3
>=20


