Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4919C25B10
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 May 2024 06:32:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s6PE9-0006og-Ln; Mon, 13 May 2024 02:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1s6PE8-0006is-EK
 for qemu-riscv@nongnu.org; Mon, 13 May 2024 02:32:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1s6PE2-0003tH-Mo
 for qemu-riscv@nongnu.org; Mon, 13 May 2024 02:31:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715581914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jvbzGvPlv8G9dFmGbcvmUmCem2OFs6nu+A474Eosqec=;
 b=G7T2C2K1PO3khX8V2CtrlcBvOszK5Wwfhukmrkpb5bHnfp/lN9+GxswQDBTbQ1n00AnvVF
 af7lq8BKc6gbsw/0sUg2zMw/4QgaChMK4A+Ret8TF+95j697dTZpcpy8arDxvHvqXvIno1
 FibDiGlfxvqwECl8TowKrPoYjCcV+mw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-qKoRHy8TMei_Ty-szG1cMg-1; Mon, 13 May 2024 02:31:50 -0400
X-MC-Unique: qKoRHy8TMei_Ty-szG1cMg-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-57345ef9172so519863a12.1
 for <qemu-riscv@nongnu.org>; Sun, 12 May 2024 23:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715581909; x=1716186709;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jvbzGvPlv8G9dFmGbcvmUmCem2OFs6nu+A474Eosqec=;
 b=iepx1bFkePT+wFhmQbWOsFVAjz1YyMtf0lRvjwHEr+tMbwaDj7O6tbcppLn5QczDXi
 0XqC5LvGQ1S0nklBAYU9pvzvg9czZaui1P+kpScQ6L1S6PAkKnDhsfsOIvxSdVHzzKYN
 CXITcJtXyCU0R1iC1y5Z/zJtHcJzSwmLwkiaqYfJuKt9jxAwHByZklRpF0It+xnDFyic
 5En7O/nRZkLsDj/ARqpCoyJmhvC8Chh6YjLiuCa6MifPaus7ITITkkiCsePg3PeEi3zq
 d43VsU+hbyPt52B586hlO+hLzWd2+PmFAzeEbhVEbhUayQQvI946M/nT7anWrX8VoX5j
 gAaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD3h9SKjbRrVwi8R3/BL/2ZdmXdAj+tJRoIrFxhR4FEWRTDu1v5zY3CkzpnGlFqMQqeFE39Zj03x7aox468tbxPJu1G1c=
X-Gm-Message-State: AOJu0YwHihKHCWGAp/6vV3tyq22LRq+zkIHbqVLB+QQW1EWawfgPv6R6
 jNNSOzJzdjXpNrNaZfdKKPkN+H+uOyYasvnn1kaePfR2L6Ctl1OqWy7/l60J+Ovkona4QLz17yk
 orpwaRutaFVWFr3f56QhoYsWdO5tN/TEyckdEEz1A6gVmGQ4PVGR3
X-Received: by 2002:a50:d482:0:b0:56e:2b80:d87e with SMTP id
 4fb4d7f45d1cf-5734d597b89mr8748069a12.2.1715581909126; 
 Sun, 12 May 2024 23:31:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5Fr9xvTd7bFqbxH7cfszxEr5/57Yp4oNXvOxV9Hjjs2KeAXpNieKI5zZgcUTHZi2fsZQb3g==
X-Received: by 2002:a50:d482:0:b0:56e:2b80:d87e with SMTP id
 4fb4d7f45d1cf-5734d597b89mr8748029a12.2.1715581908511; 
 Sun, 12 May 2024 23:31:48 -0700 (PDT)
Received: from redhat.com ([31.187.78.170]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bea6557sm5732886a12.13.2024.05.12.23.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 23:31:47 -0700 (PDT)
Date: Mon, 13 May 2024 02:31:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, imammedo@redhat.com,
 anisinha@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, sunilvl@ventanamicro.com,
 palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v2 1/3] qtest: allow SPCR acpi table changes
Message-ID: <20240513023110-mutt-send-email-mst@kernel.org>
References: <20240507052212.291137-1-jeeheng.sia@starfivetech.com>
 <20240507052212.291137-2-jeeheng.sia@starfivetech.com>
 <CAKmqyKOmt1UAbSnVbQ2fLVwoPP3u=6r5hX+gVO2xhLKidQ-8-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOmt1UAbSnVbQ2fLVwoPP3u=6r5hX+gVO2xhLKidQ-8-A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On Mon, May 13, 2024 at 01:55:50PM +1000, Alistair Francis wrote:
> On Tue, May 7, 2024 at 3:24 PM Sia Jee Heng
> <jeeheng.sia@starfivetech.com> wrote:
> 
> Can you describe why you are doing this and that it will be reverted
> in the commit message?
> 
> Alistair

What motivation are you asking? This follows the normal acpi test update
procedure.

> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > ---
> >  tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > index dfb8523c8b..3f12ca546b 100644
> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > @@ -1 +1,3 @@
> >  /* List of comma-separated changed AML files to ignore */
> > +"tests/data/acpi/virt/riscv64/SPCR",
> > +"tests/data/acpi/virt/aarch64/SPCR",
> > --
> > 2.34.1
> >
> >


