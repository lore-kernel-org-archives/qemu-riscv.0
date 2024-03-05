Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAC6C54E49
	for <qemu-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 12:22:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rhTnt-0007yk-17; Tue, 05 Mar 2024 07:21:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhTnp-0007jD-AG
 for qemu-riscv@nongnu.org; Tue, 05 Mar 2024 07:21:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhTnc-0004Pm-2n
 for qemu-riscv@nongnu.org; Tue, 05 Mar 2024 07:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709641295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RAjdxLQTy3Ft1cFCeEt0OWnunJxMkypAizmH685dhkk=;
 b=CyYph8Jdt5ywqxGQPnEMHPhNEj7wcrfaSM12flJKvytifi+UCMvBWS4prNDM9YljeKVC3z
 tPs4Hm0oY6dyKVhCBwpk8pjihQOA9i9RJp7JYPWkHgI8y1lSNvkdqNx/APilxgSyQfuGXp
 CJ/Z1maZ/t91kAP/yWQFh/C1275QxQA=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-M2G0frUYOmKpWS0rYejc_w-1; Tue, 05 Mar 2024 07:21:33 -0500
X-MC-Unique: M2G0frUYOmKpWS0rYejc_w-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1dc0cf01899so56375995ad.2
 for <qemu-riscv@nongnu.org>; Tue, 05 Mar 2024 04:21:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709641292; x=1710246092;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nuCTE5dR2LeiJCLJ3DPa9+R29o0fzWp8dhviYMi5D68=;
 b=lTLyD7yH0w+6y1yY7p1IF3/GVXsT6+m+YbCTz79dQCvNZkT4zYPItS0dDsKEYS83lx
 N0jmqXy58ayXgbSJdh5cdAK4dyFbOtZb+oaxyF5tu/QBxGLTopkhcFjmtp/ZhNdcCBa4
 OFwMIIhi+vWkVd7DxeQlTexxIaSSPT7ZYCEwqqpvl4i2vcKEjx5MR061A3k2nf0btVxe
 Y2uC9pY3MNIeSoZMpOViUqayILdjTDOprSWAFoyHd18Ywa9rXESjwGaWcqSTI/9GpRbX
 JX+0DqitRbKojC0pT/VmksqW4p2BCsU6l4tltpvbLnqQodIZQ+N3lvEGdgZY/a7aU0aj
 I4MA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9KkDJlRLgfUyGa1S2q5T1E0TMlZApXpfljH+xVEBn/VJp2RY8LFWFynzm0hXkW3BRRf4Nqv6cHd/BZLWZLfKDiwbYWxQ=
X-Gm-Message-State: AOJu0Yxg0OeTxvlcXNtYLgvxHPoFdVxFhs+3yU+Ma2XbpQyaujP0tyAZ
 KtvYauT++mtKp1TYXt4haXLsuiFkf8WrzxHWEulSRkxrXEx5RfmmoTXpzbg+8y4j/JxC//uoUcJ
 mx6djhUMu2amqUL2aWZ3ci1mlbtl6Nu3hfAWKIohFdtvCrfcWptdw
X-Received: by 2002:a17:902:ec88:b0:1dd:911:19b1 with SMTP id
 x8-20020a170902ec8800b001dd091119b1mr1886167plg.19.1709641292566; 
 Tue, 05 Mar 2024 04:21:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwPg+Fg0kv7QelL1AmYk/YA0f2QGxYXgrcM5i7ZlC0nAziu7oSs3YcNo+21RMyBCVuwYLTlw==
X-Received: by 2002:a17:902:ec88:b0:1dd:911:19b1 with SMTP id
 x8-20020a170902ec8800b001dd091119b1mr1886153plg.19.1709641292252; 
 Tue, 05 Mar 2024 04:21:32 -0800 (PST)
Received: from smtpclient.apple ([203.163.238.152])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a170902d48700b001db5079b705sm10400830plg.36.2024.03.05.04.21.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Mar 2024 04:21:31 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH 18/19] pc/q35: set SMBIOS entry point type to 'auto' by
 default
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240227154749.1818189-19-imammedo@redhat.com>
Date: Tue, 5 Mar 2024 17:51:14 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, philmd@linaro.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Message-Id: <B21B8627-97D5-4047-97BF-963F3CA57DCA@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-19-imammedo@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> Use smbios-entry-point-type=3D'auto' for newer machine types as a workaro=
und
> for Windows not detecting SMBIOS tables. Which makes QEMU pick SMBIOS tab=
les
> based on configuration (with 2.x preferred and fallback to 3.x if the for=
mer
> isn't compatible with configuration)
>=20
> Default compat setting of smbios-entry-point-type after series
> for pc/q35 machines:
>  * 9.0-newer: 'auto'
>  * 8.1-8.2: '64'
>  * 8.0-older: '32'
>=20
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2008
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> hw/i386/pc.c      | 2 +-
> hw/i386/pc_piix.c | 4 ++++
> hw/i386/pc_q35.c  | 3 +++
> 3 files changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 56562e7d9e..2f69dfd0a8 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1831,7 +1831,7 @@ static void pc_machine_class_init(ObjectClass *oc, =
void *data)
>     mc->nvdimm_supported =3D true;
>     mc->smp_props.dies_supported =3D true;
>     mc->default_ram_id =3D "pc.ram";
> -    pcmc->default_smbios_ep_type =3D SMBIOS_ENTRY_POINT_TYPE_64;
> +    pcmc->default_smbios_ep_type =3D SMBIOS_ENTRY_POINT_TYPE_AUTO;
>=20
>     object_class_property_add(oc, PC_MACHINE_MAX_RAM_BELOW_4G, "size",
>         pc_machine_get_max_ram_below_4g, pc_machine_set_max_ram_below_4g,
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index ec7c07b362..f9da942c55 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -535,12 +535,16 @@ DEFINE_I440FX_MACHINE(v9_0, "pc-i440fx-9.0", NULL,
>=20
> static void pc_i440fx_8_2_machine_options(MachineClass *m)
> {
> +    PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
> +
>     pc_i440fx_9_0_machine_options(m);
>     m->alias =3D NULL;
>     m->is_default =3D false;
>=20
>     compat_props_add(m->compat_props, hw_compat_8_2, hw_compat_8_2_len);
>     compat_props_add(m->compat_props, pc_compat_8_2, pc_compat_8_2_len);
> +    /* For pc-i44fx-8.2 and 8.1, use SMBIOS 3.X by default */
> +    pcmc->default_smbios_ep_type =3D SMBIOS_ENTRY_POINT_TYPE_64;
> }
>=20
> DEFINE_I440FX_MACHINE(v8_2, "pc-i440fx-8.2", NULL,
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 53fb3db26d..da3f92bea7 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -371,10 +371,13 @@ DEFINE_Q35_MACHINE(v9_0, "pc-q35-9.0", NULL,
>=20
> static void pc_q35_8_2_machine_options(MachineClass *m)
> {
> +    PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
>     pc_q35_9_0_machine_options(m);
>     m->alias =3D NULL;
>     compat_props_add(m->compat_props, hw_compat_8_2, hw_compat_8_2_len);
>     compat_props_add(m->compat_props, pc_compat_8_2, pc_compat_8_2_len);
> +    /* For pc-q35-8.2 and 8.1, use SMBIOS 3.X by default */
> +    pcmc->default_smbios_ep_type =3D SMBIOS_ENTRY_POINT_TYPE_64;
> }
>=20
> DEFINE_Q35_MACHINE(v8_2, "pc-q35-8.2", NULL,
> --=20
> 2.39.3
>=20


