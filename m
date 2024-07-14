Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3C2C3DA49
	for <qemu-riscv@archiver.kernel.org>; Sun, 14 Jul 2024 07:47:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sStwb-0008Jr-2t; Sun, 14 Jul 2024 03:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sStwZ-0008Fy-Cj
 for qemu-riscv@nongnu.org; Sun, 14 Jul 2024 03:46:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sStwX-0005mc-4j
 for qemu-riscv@nongnu.org; Sun, 14 Jul 2024 03:46:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720943207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/WHD3oTajkUFk9t4DLQ9JCWDvoQfv3i/z/ncx3CwhAk=;
 b=Wes56DD58v/Z5nBmE0rtAxvwMONyQc6EYdbMPFk28pcvPUQZRZN8xCX1Hidc2XVeFHwabp
 Zj5adImwj1Uzvtk/XQ9KARw1HnumvW3p4rUHJGfPnS1h+/R2n64NVzypoabkszYoRAc0vy
 aGJE5UJWp7y91k2NmS1k2JrfW82EggY=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-2TmmubTJOKW5hSC18eEQZw-1; Sun, 14 Jul 2024 03:46:45 -0400
X-MC-Unique: 2TmmubTJOKW5hSC18eEQZw-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-52e9b943e6dso3170919e87.2
 for <qemu-riscv@nongnu.org>; Sun, 14 Jul 2024 00:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720943204; x=1721548004;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/WHD3oTajkUFk9t4DLQ9JCWDvoQfv3i/z/ncx3CwhAk=;
 b=PBKNM513SWIbKvoWroNaoCnWVrjDQUc6fBzvNoAKg7Oj7zPL4yAZQDRAcQs3QImTxN
 zYHsFG+Gc+nFEqwSzw8ekZJELxKywA8T9uI/XMMZhu18k+iHxf/+rIxWYzZ/ot4PndOi
 tAFtMDe4MBPbksRo/nvxIqDKS4zMyqT++UVQRfMsjN1xg1lPyV0/M0iZCuBAyAbs3hIg
 PUDtKheNF3T8m3E6yJY24M2qVCAOJJzsqEMR1GzEXisO9bK1whhFgvw6AgOHl4Bg+BX1
 j9zpwvUjWJl5z/l+G8XIrce1Id8k4+P4vn64l3JIgUDODIN3Zt9o4KaWO+9R3q1U9U41
 TmDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj/P2Tl5iJD2AOlp9pP3i1JXoN1f+k8Tw8HkYq95Amp5rry3534HMEyw2IPL120TG74r+bbMkGa+/ksrQuGtF67fdVm1k=
X-Gm-Message-State: AOJu0Yx7uCo3jDS5mtRzRwxWSVUwLZBN+GY/c8GMsrluJ4rSMADknmo9
 CU/kx5G3KgoA1jY5XUw1/yfMJ1VozL6nATdre0Rh0fabB3gKetMs1EbeSDk6+V1tegbhGUXB35e
 kYfdxmcsuDFGVZ7srr4OsQSBg8F/0/4uG5deQDKePGmIHm6YdX3cm
X-Received: by 2002:a05:6512:3ca4:b0:52c:859c:91dd with SMTP id
 2adb3069b0e04-52eb998e6aemr12911365e87.5.1720943204240; 
 Sun, 14 Jul 2024 00:46:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF9Zjyqo7KkW28tMLk2o5m/EjC3XgCNWJhOzoE1SXdZTSA0ib155F8cHkIO3U/hyZIJbPmiQ==
X-Received: by 2002:a05:6512:3ca4:b0:52c:859c:91dd with SMTP id
 2adb3069b0e04-52eb998e6aemr12911308e87.5.1720943202492; 
 Sun, 14 Jul 2024 00:46:42 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:240:5146:27c:20a3:47d4:904])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f276c52sm78255915e9.22.2024.07.14.00.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jul 2024 00:46:41 -0700 (PDT)
Date: Sun, 14 Jul 2024 03:46:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Ani Sinha <anisinha@redhat.com>
Subject: Re: [PATCH v2 0/9] RISC-V: ACPI: Namespace updates
Message-ID: <20240714034105-mutt-send-email-mst@kernel.org>
References: <20240708114741.3499585-1-sunilvl@ventanamicro.com>
 <20240712144319.233c19a7@imammedo.users.ipa.redhat.com>
 <ZpEmuB6xyh2K77Ic@redhat.com>
 <20240712155010.3756bb82@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240712155010.3756bb82@imammedo.users.ipa.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, Jul 12, 2024 at 03:50:10PM +0200, Igor Mammedov wrote:
> On Fri, 12 Jul 2024 13:51:04 +0100
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Fri, Jul 12, 2024 at 02:43:19PM +0200, Igor Mammedov wrote:
> > > On Mon,  8 Jul 2024 17:17:32 +0530
> > > Sunil V L <sunilvl@ventanamicro.com> wrote:
> > >   
> > > > This series adds few updates to RISC-V ACPI namespace for virt platform.
> > > > Additionally, it has patches to enable ACPI table testing for RISC-V.
> > > > 
> > > > 1) PCI Link devices need to be created outside the scope of the PCI root
> > > > complex to ensure correct probe ordering by the OS. This matches the
> > > > example given in ACPI spec as well.
> > > > 
> > > > 2) Add PLIC and APLIC as platform devices as well to ensure probing
> > > > order as per BRS spec [1] requirement.
> > > > 
> > > > 3) BRS spec requires RISC-V to use new ACPI ID for the generic UART. So,
> > > > update the HID of the UART.
> > > > 
> > > > 4) Enabled ACPI tables tests for RISC-V which were originally part of
> > > > [2] but couldn't get merged due to updates required in the expected AML
> > > > files. I think combining those patches with this series makes it easier
> > > > to merge since expected AML files are updated.
> > > > 
> > > > [1] - https://github.com/riscv-non-isa/riscv-brs
> > > > [2] - https://lists.gnu.org/archive/html/qemu-devel/2024-06/msg04734.html  
> > > 
> > > btw: CI is not happy about series, see:
> > >  https://gitlab.com/imammedo/qemu/-/pipelines/1371119552
> > > also 'cross-i686-tci' job routinely timeouts on bios-tables-test
> > > but we still keep adding more tests to it.
> > > We should either bump timeout to account for slowness or
> > > disable bios-tables-test for that job.  
> > 
> > Asumming the test is functionally correct, and not hanging, then bumping
> > the timeout is the right answer. You can do this in the meson.build
> > file
> 
> I think test is fine, since once in a while it passes (I guess it depends on runner host/load)
> 
> Overal job timeout is 1h, but that's not what fails.
> What I see is, the test aborts after 10min timeout.
> it's likely we hit boot_sector_test()/acpi_find_rsdp_address_uefi() timeout.
> That's what we should try to bump.
> 
> PS:
> I've just started the job with 5min bump, lets see if it is enough.

Because we should wait for 5min CPU time, not wall time.
Why don't we do that?
Something like getrusage should work I think.



> > We should never disable tests only in CI, because non-CI users
> > are just as likely to hit timeouts.
> > 
> > 
> > With regards,
> > Daniel


