Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD93C54E41
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 07:48:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rhm0S-0002P6-TA; Wed, 06 Mar 2024 02:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhm0R-0002OU-2n
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 02:48:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhm0P-0004j6-MX
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 02:48:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709711280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oYVoKix9lNOBVbBp/U063qagX1x85e+PlwBIbz7ZLK4=;
 b=O7eLTPZ3C3/QH0oVh4MaLCfvtQU3Ac7j/EpQCwspDN5VcG/6UnRwJs1biVWRtefVXAISAR
 /j6Yi4vUy0S40M7vogC8Jz159l9+CABeV9NZhqUh4PtA8GlJYyJihbcHCcIU5Mz7s/XQlQ
 np156EWcUrjmYs4FbBNTixvUBptm5NU=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-H7xIxSVVPXWFihS1d5_pdg-1; Wed, 06 Mar 2024 02:47:58 -0500
X-MC-Unique: H7xIxSVVPXWFihS1d5_pdg-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1dc6b99b045so4570275ad.0
 for <qemu-riscv@nongnu.org>; Tue, 05 Mar 2024 23:47:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709711277; x=1710316077;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=szLotHqHrLAWgY/IdU0Id4a22ZuDv3jSIc1NZf1CiDk=;
 b=iv2ZMveXGIpWxPjXBJWX15OnlBIPpmH05ybsAMBGdA5b6QwpDK3wF7jt1S05dR08cx
 GpKc7H9dUoLMC/zN3r7V0e3+pAe8Xt9weQ7tLWS3BnOzwNSvQqz37b6Jawdx1vkVRcM+
 fGemmbwcdkP8mfppuaGX60YbjXcaAJF9sRc4A6pxdFlgEnAgjm76tHF1r3GWX3EQ0iYv
 wNkc31Uy9makgKf/4tismg72HSsnCbSlxDVrPjgSlXLPQySFlDpPrVWKnj/ToxQNfD+G
 5yYGFRtE0DwORnl/byEvBNXcH4FWgKAfBDuhEk9ZGaT9U/HZldaFtUk9mdIcp94rHNj6
 YfBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdQ6t0cW0kFYZY0Tu4zkIKOP7IGDKthJglnfW7/QY25jMOqOpki5VUfa6rPR03rKoQtAhlzUqPdn9dI9Hlh+xINChgzb8=
X-Gm-Message-State: AOJu0YyDIRduKxlpU71uTmrp8772O0JS+EtSebT8c7kXoDMIZ3fph3eI
 a3/SPIqKBVe46OzVFshCTd2zQInenO2ndTaMqdGZHPa3bWSpOTDHBunGssxKkfOukNGH+L8uNqc
 /Jc5U6ocR5WZ/yqYhwEDYZjjvJRfrKMO/MJrqnsqXsN7BxySDA3ZD
X-Received: by 2002:a17:902:e804:b0:1dc:fccb:e05c with SMTP id
 u4-20020a170902e80400b001dcfccbe05cmr6391390plg.20.1709711277608; 
 Tue, 05 Mar 2024 23:47:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtCYpqRjiblNXbOBNFPns/efleZA+zp+WkxR1UHwUIfC1PlZO9fUZZYCuqA5s80X1IP7nE6A==
X-Received: by 2002:a17:902:e804:b0:1dc:fccb:e05c with SMTP id
 u4-20020a170902e80400b001dcfccbe05cmr6391378plg.20.1709711277270; 
 Tue, 05 Mar 2024 23:47:57 -0800 (PST)
Received: from smtpclient.apple ([115.96.30.47])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170902e9cc00b001db9fa23407sm11867440plk.195.2024.03.05.23.47.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Mar 2024 23:47:56 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v2 17/20] smbios: clear smbios_type4_count before building
 tables
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240305155724.2047069-18-imammedo@redhat.com>
Date: Wed, 6 Mar 2024 13:17:39 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, philmd@linaro.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Message-Id: <6A030F09-22CE-4489-9F7A-D7343966DBAC@redhat.com>
References: <20240305155724.2047069-1-imammedo@redhat.com>
 <20240305155724.2047069-18-imammedo@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
> it will help to keep type 4 tables accounting correct in case
> SMBIOS tables are built multiple times.


I suggest you arrange this before patch 15 where you are actually calling s=
mbios_get_tables_ep() multiple times. That way there is no window where thi=
ngs can break between patches.

>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Tested-by: Fiona Ebner <f.ebner@proxmox.com>
> ---
> hw/smbios/smbios.c | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index bf5c7a8885..b64d3bc227 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -981,6 +981,7 @@ static bool smbios_get_tables_ep(MachineState *ms,
>            ep_type =3D=3D SMBIOS_ENTRY_POINT_TYPE_64);
>=20
>     g_free(smbios_tables);
> +    smbios_type4_count =3D 0;

Nit: Can you put this before g_free() because gfree(smbios_tables) and smbi=
os_tables =3D memdup2() etc are related. This is kind of coming in between.

>     smbios_tables =3D g_memdup2(usr_blobs, usr_blobs_len);
>     smbios_tables_len =3D usr_blobs_len;
>     smbios_table_max =3D usr_table_max;
> --=20
> 2.39.3
>=20


