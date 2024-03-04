Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECF0C54E4A
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 14:25:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rh9Fm-0006Px-8v; Mon, 04 Mar 2024 09:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rh9Fk-0006PK-5v
 for qemu-riscv@nongnu.org; Mon, 04 Mar 2024 09:25:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rh9Fi-00024w-OU
 for qemu-riscv@nongnu.org; Mon, 04 Mar 2024 09:25:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709562314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USHB4AjSbn6NuZKXD7x5nU8B4nXaTrzejgD3EPdJTEs=;
 b=RkSVMPHkbKCuAQvQ1S9AdB09Vt6A3BkKBrHxMtcFUrfvTWLw7ININA+GU/2yscasZph+pL
 jbhYA7+uON32hMR4A8U5WjMdubINx6oUmw6vvnzHMv1g/A9V6vxP74+G1/q/hJPticoT+I
 banFUOEtG8UnI73sWlEnLa5IZT4Fyj4=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-_Z6vZbJIMCKePi-f657Fxw-1; Mon, 04 Mar 2024 09:25:10 -0500
X-MC-Unique: _Z6vZbJIMCKePi-f657Fxw-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5131d042b1aso3361850e87.0
 for <qemu-riscv@nongnu.org>; Mon, 04 Mar 2024 06:25:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709562307; x=1710167107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=USHB4AjSbn6NuZKXD7x5nU8B4nXaTrzejgD3EPdJTEs=;
 b=OTjqre7ezj61KdWd4SYpib3hB/EUMM3Z9cUrUE2La38wuPZJBSVAj8rB2RKX3IfpD1
 NOBz5oMkng9YB7fqoBfruBhjYwRfTiKLWG4vyZBAGX6PeWm2ZJ7nJ1fITgSmsLMZpHk/
 BZeSdfr1nbTqSgy+wcJE25UeP3n58/EmDVZisTK5JrfE1wZejGuIlZM3UQpVBLXIE8kE
 M7zJpvdOEsmSgiJDMP/P0FtClsc9uj1JU2wTw6URPFjsMb3nn/u3umal92Fv04EdONo8
 CVAsNH7vGJ0olq7/363HV1lRhkuWmHhJ6nBKb8xJ8A9gYsI0KGTa38Yfs4M6kGRaRyf3
 FZzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRVJd6oEZZvtQHLRwf1MRAJxs1imGBMUm9QxLUhu/hEf1He6RkINtOh+Wor4r6EGIt7B+7dGwuIXqL5cTaZcR4nchu3Gs=
X-Gm-Message-State: AOJu0YzBADC6H9/g1E6a370v6aPjgKF0RNLKWwCnWykFJLSPEx1x/Lfx
 L5VHKaQYEZHavXO/VmnMiX80f4WGsmAAJvKg5aVJkktLtS7aLPRp1qP1mJSDgsXIe4ZoHuzAgqa
 7RwLECTZx1b7s8pZzBcdd8X0S4S+BYoKUnVizsB2E81Al9oan0rfu
X-Received: by 2002:a05:6512:48d4:b0:513:19c6:794a with SMTP id
 er20-20020a05651248d400b0051319c6794amr5434413lfb.68.1709562307337; 
 Mon, 04 Mar 2024 06:25:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhihKtTQIZ4BPr154ZKSwdc3A4s+WXgVvp4+bU1V/tLSas/aK5sjPHv1yC7Hz2F47B0FbPJA==
X-Received: by 2002:a05:6512:48d4:b0:513:19c6:794a with SMTP id
 er20-20020a05651248d400b0051319c6794amr5434373lfb.68.1709562306979; 
 Mon, 04 Mar 2024 06:25:06 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c314700b00412b431eb0csm14746868wmo.14.2024.03.04.06.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 06:25:06 -0800 (PST)
Date: Mon, 4 Mar 2024 15:25:05 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <anisinha@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Song Gao <gaosong@loongson.cn>, Alistair
 Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, philmd@linaro.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Subject: Re: [PATCH 11/19] smbios: clear smbios_tables pointer after freeing
Message-ID: <20240304152505.21ed65d7@imammedo.users.ipa.redhat.com>
In-Reply-To: <92FA6B88-CA59-498A-AEFA-9A82E3342230@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-12-imammedo@redhat.com>
 <92FA6B88-CA59-498A-AEFA-9A82E3342230@redhat.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Mon, 4 Mar 2024 19:24:06 +0530
Ani Sinha <anisinha@redhat.com> wrote:

> > On 27-Feb-2024, at 21:17, Igor Mammedov <imammedo@redhat.com> wrote:
> > 
> > that will avoid double free if smbios_get_tables() is called
> > multiple times.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> 
> Maybe we can squash this with patch 10.
Ok, I'll squash it into 10/19


> Other than that, 
> 
> Reviewed-by: Ani Sinha <anisinha@redhat.com>
> 
> > ---
> > hw/smbios/smbios.c | 2 ++
> > 1 file changed, 2 insertions(+)
> > 
> > diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> > index 7c28b5f748..d9ba2072b1 100644
> > --- a/hw/smbios/smbios.c
> > +++ b/hw/smbios/smbios.c
> > @@ -1052,6 +1052,8 @@ void smbios_get_tables(MachineState *ms,
> >     return;
> > err_exit:
> >     g_free(smbios_tables);
> > +    smbios_tables = NULL;
> > +    return;
> > }
> > 
> > static void save_opt(const char **dest, QemuOpts *opts, const char *name)
> > -- 
> > 2.39.3
> >   
> 


