Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C778C5478C
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 13:55:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rh8m2-0001ye-2I; Mon, 04 Mar 2024 08:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rh8lw-0001xq-UU
 for qemu-riscv@nongnu.org; Mon, 04 Mar 2024 08:54:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rh8lu-0002V4-ML
 for qemu-riscv@nongnu.org; Mon, 04 Mar 2024 08:54:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709560465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3GIJGxh6vwIgUWC2cGg1VjYRjXLh++LvhAThWVmzffc=;
 b=X4mVwZzMcssO+SY9gxN2npbdjZ7PdsfecFL7KiGDVRS2i2/3elH77CTA+5LKLwAi1dZoM4
 hJ3mE53mm1SvrkviVZLyde7DyX5LGfXNecsB08EthaPqKBcISBcH88KCulRAFbsOVYX4ub
 5IiXGgYQ62Tckfhv1BSFNPSWefB76Pk=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-EqexS353PaeUq6xo9mEnoA-1; Mon, 04 Mar 2024 08:54:24 -0500
X-MC-Unique: EqexS353PaeUq6xo9mEnoA-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1dc7e0261aeso36792245ad.0
 for <qemu-riscv@nongnu.org>; Mon, 04 Mar 2024 05:54:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709560463; x=1710165263;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3GIJGxh6vwIgUWC2cGg1VjYRjXLh++LvhAThWVmzffc=;
 b=OH8IX+/crlYGhpR70Hrl1o6vL0J9R/navS5iess0LF5ORHO6jju8B7O1tnq2zX8C+f
 WWgDbESHzF7cOhdZO1rsTld/B7zhFqdQROgLAq6x495av8nt5s83f4Fwz/RjmxckAOSj
 1cvmV0vgi99/G7iwZRz1q1GBdzag1+16Dckyk89seJIkhNKC6S6LJbXUtOEhifLqeOU1
 TRCbt6MEbMppUHpkgMxcUY9rjZGzRkhU9aNlfbZMjMmbVWeXxglTmLobQEx/sqpH46hQ
 dihkPCg5hYelmqXup62LQ49bvZkqTg7xWz2QvOYY3Q3nDk19PAu3IxorAaeFT/CiGWon
 KIag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzdMX8begAjxTDAHhoFULubrrtGHw/owKq6mWxXj87SprAAKdL+2jFIrPN2S8R/iYTDRb/2/uKhVqLLN4EWkCf4C3lA7A=
X-Gm-Message-State: AOJu0Yzy4BpPEyp0Nj3SfZxZf6ThZgTw2zbZ7viEDXpOMGqg0Bfboruu
 7zkNp/UDVEIBAopduWIaOKzChWlyDM4Vt0XyIHonWLP4RhiGaVf0pQusmDaCvOw7LhAshEG5QH0
 pNYsPaN5dQ7pEtJf3XMsPcBb+udtjwT/NwrC0iHFojiiiLzyqlv1Y
X-Received: by 2002:a17:903:288:b0:1dc:df18:c5c1 with SMTP id
 j8-20020a170903028800b001dcdf18c5c1mr8599457plr.33.1709560463559; 
 Mon, 04 Mar 2024 05:54:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECniDIWgHsgl2DymkHjGs80A148+ZDxy9tk4J0JYoHtbTip3LNhotXNferFkd2l0Ax7LvKLA==
X-Received: by 2002:a17:903:288:b0:1dc:df18:c5c1 with SMTP id
 j8-20020a170903028800b001dcdf18c5c1mr8599429plr.33.1709560463258; 
 Mon, 04 Mar 2024 05:54:23 -0800 (PST)
Received: from smtpclient.apple ([115.96.159.226])
 by smtp.gmail.com with ESMTPSA id
 mn14-20020a1709030a4e00b001dcada71593sm8544922plb.273.2024.03.04.05.54.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Mar 2024 05:54:22 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH 11/19] smbios: clear smbios_tables pointer after freeing
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240227154749.1818189-12-imammedo@redhat.com>
Date: Mon, 4 Mar 2024 19:24:06 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, philmd@linaro.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Message-Id: <92FA6B88-CA59-498A-AEFA-9A82E3342230@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-12-imammedo@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.571,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> 
> that will avoid double free if smbios_get_tables() is called
> multiple times.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Maybe we can squash this with patch 10.

Other than that, 

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> hw/smbios/smbios.c | 2 ++
> 1 file changed, 2 insertions(+)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 7c28b5f748..d9ba2072b1 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -1052,6 +1052,8 @@ void smbios_get_tables(MachineState *ms,
>     return;
> err_exit:
>     g_free(smbios_tables);
> +    smbios_tables = NULL;
> +    return;
> }
> 
> static void save_opt(const char **dest, QemuOpts *opts, const char *name)
> -- 
> 2.39.3
> 


