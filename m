Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F868C54798
	for <qemu-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 11:37:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rhT6j-0000SR-LR; Tue, 05 Mar 2024 06:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhT6i-0000S0-Ft
 for qemu-riscv@nongnu.org; Tue, 05 Mar 2024 06:37:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhT6e-0002Z8-Pp
 for qemu-riscv@nongnu.org; Tue, 05 Mar 2024 06:37:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709638627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X+XyziquYx1qV8PnNTEvXP00ge/08XPje0E6BdPBN5s=;
 b=K9n/H5aMPqTREuHFzQubRhB3us8Nd1fLeCPKVbrTo3GuuqBthrkUCGfcKfZPnn+QWWau43
 rvwPGh+X2hsko7CQeGcOepK8HskGuhOaRLAdTO4tHHPmHYbxsafz8Ebq8jf+xzTDfIocNn
 3Ujk1snRmCejJ10FcweDzh6n2PfD2VE=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-eTkXsE6vPEidLp3iLIyzSQ-1; Tue, 05 Mar 2024 06:37:06 -0500
X-MC-Unique: eTkXsE6vPEidLp3iLIyzSQ-1
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-5d1bffa322eso6327006a12.1
 for <qemu-riscv@nongnu.org>; Tue, 05 Mar 2024 03:37:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709638625; x=1710243425;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lr9ZwAIZH9USXJUZ1I9mjZLUVZFZB1fODebftbuXqoI=;
 b=AHAm39ZXBnGtFI1dA2AbT9ycyicIpDOr4+nNu1/mV/YLVJSILRnt1h+JnbFedM/1J7
 5y2JSAPDNcd96ETtzfiNb/TgPzKRMEkLTU6BxPBAqOGak6EHF7sMEWvoXOt2sW4IeKxa
 WDvL1J18hwc5MmBM9n3AQ6bIN1Retf/yFlke+y7x55zq01ydPbZiDUykplduLk5dyHSQ
 HNFGxz6s+TU+tBqryvs4DXrrF/l1mzejGgEvEtdRw3k/4j9BebXtCwn1weLNmQ1/agky
 ITRrg/lOEKqK+F5Fp8a8yylV1TDs6uIi0iUU9Hj829Ed0DltrpOPfpskJkBqNoZK3sOB
 grsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa4qBw6bw4UZGFID23KcnBcCmYIgfrZDw4UCbXeLUDtmPe+C3fFI3CeTYKI/iw4uxbTim7sWcNXuobcTK00oroVPeVgzM=
X-Gm-Message-State: AOJu0Yy2pCkoRalJRZmNi4mPdrq0OzPJt6Khp3CF7rFrO6/A94FO66xx
 gN3Ao90m+HO0cZO+p+dk9WeOrCTS9jIfwyYoDpoTR/1nq87gmpVdsrd956k4hKoFyvjQOQedd+q
 nic8nhMvf28UwE4IgmMUi5pVleWoDVQ8qfQYeKQF255JgX/5MlXDe
X-Received: by 2002:a05:6a20:7289:b0:1a1:20b6:bf11 with SMTP id
 o9-20020a056a20728900b001a120b6bf11mr1597656pzk.50.1709638625360; 
 Tue, 05 Mar 2024 03:37:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLrDzEd7tyhw5iEBmY9Sh5Xobt+xuca6ATpIu5iGB9a+UuNGVvLfY2YAxmx1dF/TYs4Gw+3Q==
X-Received: by 2002:a05:6a20:7289:b0:1a1:20b6:bf11 with SMTP id
 o9-20020a056a20728900b001a120b6bf11mr1597629pzk.50.1709638625027; 
 Tue, 05 Mar 2024 03:37:05 -0800 (PST)
Received: from smtpclient.apple ([203.163.238.152])
 by smtp.gmail.com with ESMTPSA id
 le8-20020a170902fb0800b001dc8db3150asm10357683plb.199.2024.03.05.03.36.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Mar 2024 03:37:04 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH 15/19] smbios: error out when building type 4 table is not
 possible
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240227154749.1818189-16-imammedo@redhat.com>
Date: Tue, 5 Mar 2024 17:06:46 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, philmd@linaro.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Message-Id: <CC89DC43-048D-4C23-BF18-470BECA3140E@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-16-imammedo@redhat.com>
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
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.571,
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



> On 27-Feb-2024, at 21:17, Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> If SMBIOS v2 version is requested but number of cores/threads
> are more than it's possible to describe with v2, error out
> instead of silently ignoring the fact and filling core/thread
> count with bogus values.
>=20
> This will help caller to decide if it should fallback to
> SMBIOSv3 when smbios-entry-point-type=3D'auto'
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> hw/smbios/smbios.c | 14 ++++++++++++--
> 1 file changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index e54a9f21e6..bf5c7a8885 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -605,7 +605,8 @@ static void smbios_build_type_3_table(void)
> }
>=20
> static void smbios_build_type_4_table(MachineState *ms, unsigned instance=
,
> -                                      SmbiosEntryPointType ep_type)
> +                                      SmbiosEntryPointType ep_type,
> +                                      Error **errp)
> {
>     char sock_str[128];
>     size_t tbl_len =3D SMBIOS_TYPE_4_LEN_V28;
> @@ -659,6 +660,12 @@ static void smbios_build_type_4_table(MachineState *=
ms, unsigned instance,
>     if (tbl_len =3D=3D SMBIOS_TYPE_4_LEN_V30) {
>         t->core_count2 =3D t->core_enabled2 =3D cpu_to_le16(cores_per_soc=
ket);
>         t->thread_count2 =3D cpu_to_le16(threads_per_socket);
> +    } else if (t->core_count =3D=3D 0xFF || t->thread_count =3D=3D 0xFF)=
 {
> +        error_setg(errp, "SMBIOS 2.0 doesn't support number of processor=
 "
> +                         "cores/threads more than 255, use "
> +                         "-machine smbios-entry-point-type=3D64 option t=
o enable "
> +                         "SMBIOS 3.0 support");
> +        return;
>     }
>=20
>     SMBIOS_BUILD_TABLE_POST;
> @@ -987,7 +994,10 @@ static bool smbios_get_tables_ep(MachineState *ms,
>     assert(ms->smp.sockets >=3D 1);
>=20
>     for (i =3D 0; i < ms->smp.sockets; i++) {
> -        smbios_build_type_4_table(ms, i, ep_type);
> +        smbios_build_type_4_table(ms, i, ep_type, errp);
> +        if (*errp) {
> +            goto err_exit;
> +        }
>     }
>=20
>     smbios_build_type_8_table();
> --=20
> 2.39.3
>=20


