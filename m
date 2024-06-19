Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46461C2BA15
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 09:18:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sJrS1-0005Gb-7G; Wed, 19 Jun 2024 05:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJrRw-0004vI-CZ
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 05:17:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJrRu-0003w8-IF
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 05:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718788668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5GC+hv8iinl3emo8lYof8BsSRuYtckLmPNXIswLbt2E=;
 b=Hd+ZotcYIg0iOBD0W5H015bo6bM8qRxG08UwrjihhYMZIUoG4uk0fiG5ckTr4cN8VdxSUQ
 w/JB9ZZnZgJEwso/cfywse1GyNK1djD18Zkz/i32x6rCI3ERai7srmd6L2bBQuycxHshEg
 gcpnz/htL4Zoi/WKs/fIpKapKbMhzRk=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-wkLskl66MJaAWCElmZsgYg-1; Wed, 19 Jun 2024 05:17:47 -0400
X-MC-Unique: wkLskl66MJaAWCElmZsgYg-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2ea892f8441so45339771fa.1
 for <qemu-riscv@nongnu.org>; Wed, 19 Jun 2024 02:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718788665; x=1719393465;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5GC+hv8iinl3emo8lYof8BsSRuYtckLmPNXIswLbt2E=;
 b=iHBAEiBsMqzO8NHIsF4iMl2hIZJbmCT55fZr4pIJ6pJVm0KRPO5aTv9TaNhHBmYekr
 kqJXFqHrZ7sjUNzHc1BmTbvTK3Sczp/dBYjPBAQt8TCOxUFy5jYADI+mt8jSenSjqSu/
 WdqpOwwMgJ00oy7OklZK0fROI1zgTimsKb2KV1+YC9McTxV7je2Xdtn4dgLu8tx8TCCh
 ECMKmPKQz0KEklV/OgpcMmznitaKWZ+SecZ0iyUox6PjNoh8zSNv13EtIu3KLaYu6XON
 klh+4KUub+WxLl5EFPSX8NRl8FRE7vVkV5djyhNNdRRIeLpyW5lYoMB6n9QI150QoFkG
 u4HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqdYIWdjsMlFFki15qzwjtJ9m8FLvHEFT6+Z/5nTgYXSnT8XxKsjcFs1HR+RFMctazKJc2I0Cuv5uMdOh/+QmmbxLvT4o=
X-Gm-Message-State: AOJu0YwZpVnWibYupFUB2A7bp49JoxnAKEk9Hr2srOLLsDh4yXbnvJId
 fG15PpNWK6mABBlcAiDRnLWqdiJhk9HGGEeRI6ZLMZHx2+2X4mbTTHX5jRw1I6KVzz4pX5P7jMa
 CnhFajM2nnW0CQMThEySx83yB6B2F2ybUbjqz2S1fVA/P2M5ZB6I4
X-Received: by 2002:a2e:be93:0:b0:2ec:4096:4bc6 with SMTP id
 38308e7fff4ca-2ec40965033mr7105351fa.7.1718788665563; 
 Wed, 19 Jun 2024 02:17:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0B5WaLWPRj9oPygysfhHieKtXBUf5T/kk8ziat0RwgGhq3MrYjMUXLan7Cd+S60+vXFl6Cw==
X-Received: by 2002:a2e:be93:0:b0:2ec:4096:4bc6 with SMTP id
 38308e7fff4ca-2ec40965033mr7105201fa.7.1718788665183; 
 Wed, 19 Jun 2024 02:17:45 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42471584311sm31892615e9.0.2024.06.19.02.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 02:17:44 -0700 (PDT)
Date: Wed, 19 Jun 2024 11:17:43 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Alistair Francis
 <alistair23@gmail.com>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, Haibo1
 Xu <haibo1.xu@intel.com>, Anup Patel <apatel@ventanamicro.com>, Andrew
 Jones <ajones@ventanamicro.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>, Weiwei
 Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 06/12] tests/data/acpi/virt: Move ACPI tables under
 aarch64
Message-ID: <20240619111743.58930119@imammedo.users.ipa.redhat.com>
In-Reply-To: <ZlSjzfSj8MwDcJk6@sunil-laptop>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
 <20240524061411.341599-7-sunilvl@ventanamicro.com>
 <27cef750-262a-402a-97fe-c4a55700a376@linaro.org>
 <ZlSjzfSj8MwDcJk6@sunil-laptop>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.148,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, 27 May 2024 20:46:29 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> On Mon, May 27, 2024 at 12:12:10PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Hi Sunil,
> >=20
> > On 24/5/24 08:14, Sunil V L wrote: =20
> > > Since virt is a common machine name across architectures like ARM64 a=
nd
> > > RISC-V, move existing ARM64 ACPI tables under aarch64 folder so that
> > > RISC-V tables can be added under riscv64 folder in future.
> > >=20
> > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >   tests/data/acpi/virt/{ =3D> aarch64}/APIC             | Bin =20
> >=20
> > The usual pattern is {target}/{machine}, so instead of:
> >=20
> >   microvm/
> >   pc/
> >   q35/
> >   virt/aarch64/
> >   virt/riscv64/
> >=20
> > (which is odd because q35 is the x86 'virt'), I'd rather see:
> >=20
> >   x86/microvm/
> >   x86/pc/
> >   x86/q35/
> >   aarch64/virt/
> >   riscv64/virt/
> >=20
> > Anyhow just my 2 cents, up to the ACPI maintainers :)
> >  =20
> Hi Phil,
>=20
> Your suggestion does make sense to me. Let me wait for feedback from
> ARM/ACPI maintainers.

I'd prefer  {target}/{machine} hierarchy like Philippe suggests

> Thanks,
> Sunil
>=20


