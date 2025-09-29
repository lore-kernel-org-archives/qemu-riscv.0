Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299D8CAC5B0
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 20:59:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3Kxb-0007ta-80; Mon, 29 Sep 2025 16:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1v3KxW-0007tJ-Pj
 for qemu-riscv@nongnu.org; Mon, 29 Sep 2025 16:58:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1v3KxQ-0000vh-Uh
 for qemu-riscv@nongnu.org; Mon, 29 Sep 2025 16:58:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759179528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qGlYEFRv8xDNhpiiWlWf8YqSTaYSiFOP+ymflG4dl6g=;
 b=YtpjqGFK09goaTDTuT1z2mEcpt5i4E1O5W0/gKkmZ1mjSAYFmGk3ovZFzhok2cmwjJXkkX
 nEFphMdKWvj2piPJmgoOCBQX+pnNN0s60C0WEc6PRbnFtNib8OoVdz/tTIIJE0RJP3dMgc
 cnmyfM1ZnH17c/vn/y+ZeUFaGNi/nCQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-CCJYPmx4NwmgfaNDONrCIg-1; Mon, 29 Sep 2025 16:58:46 -0400
X-MC-Unique: CCJYPmx4NwmgfaNDONrCIg-1
X-Mimecast-MFC-AGG-ID: CCJYPmx4NwmgfaNDONrCIg_1759179526
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8635d47553dso565556285a.0
 for <qemu-riscv@nongnu.org>; Mon, 29 Sep 2025 13:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759179526; x=1759784326;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qGlYEFRv8xDNhpiiWlWf8YqSTaYSiFOP+ymflG4dl6g=;
 b=sjITPCTq+9ph5MjfB97iRvky7sQcw65nVzTtTWgRXJLXn9Ec0o+ejufONi148/+1/P
 OqWXCWLe6miwDn9yZwayFZMICTWAi/fMApcReZhgzlXVS8rQV4hfR3DwFjV60GgdpwTa
 I2+/I/FNd/3zKdgSFs3Nvg/fErsk+wFbAkYBXOXkpg+ioLc+sa0JrQSLsb6QlEN01qYm
 MBjDTG60xazxBBVGI8oepYK2cYQXL9bRez5+2mcQxd+zr4nNSu8ciaPjTp5IhHRFs1dv
 h580fumnQNzyuSaDCrmtWBigiPGfwWS6TIj33magYO51TmMCL7ozvs0mLJ1YAw3lNLbJ
 0tEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCViXJ/WXBNlti6c/k4Ui/zmbR3sVT8TWJbovz0iPzmbN8gGNs6yXxcFlbi3cnVR9r0baiz+yXgR3mC0@nongnu.org
X-Gm-Message-State: AOJu0YzAW6n5UML3ZEuD7nrKmwcqgiOYJOdUVR1stuj7oMmdEzaLqs8c
 AqF5qO1JEsSpPSdilrKeVcEnI5qODCjFiREriRhwOx3jMPvqgiLXlIHVQ62Au+I2RIutUH6vGNG
 alXfddpiBjLuyabp1H5eW3Ja/mC8fjmuCVzVHd8ABWPH/Sl/CJU+9RGz9
X-Gm-Gg: ASbGncuQCFgJZ5WW5JhLo7al+ZxQrm5+nHCpNqUOVHbT7mvej4/oLc/Oh4S+oOpa/4N
 ELULNewKIIEYf1MIMBLRkl3aezp8GeBPTqgVKXXKeTuDXRgvvPiflkNUxTw5CjI/Cp+VijUNAKU
 21Rnyz5OffFArxYomZircJ4lCBIY4Jf81PRlIo/QJKgBMZZCP6mN7/HpA/H9wrmQ8z1aD3g41e0
 YRFaWgxi7DISN+V7cZX9W0zhubvzM5zrQSgyGktxpD41rdzQ6lr2+G/2GdxK9aH19UIEgLAj7jP
 J3fVZcHeohS3fYlEFkgkFOT69XcIYvP8
X-Received: by 2002:a05:620a:a00d:b0:85c:3bcf:e843 with SMTP id
 af79cd13be357-85c3bcfeaa1mr2112609485a.43.1759179526135; 
 Mon, 29 Sep 2025 13:58:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDVAfO10gZpyYJ8dwCVcOEIU84P0ACyRABeDGvxvxzPh4CJm5bPu8NN+2BKbE3WeVcAszc+g==
X-Received: by 2002:a05:620a:a00d:b0:85c:3bcf:e843 with SMTP id
 af79cd13be357-85c3bcfeaa1mr2112601685a.43.1759179525509; 
 Mon, 29 Sep 2025 13:58:45 -0700 (PDT)
Received: from x1.local ([142.188.210.50]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-85c2a1913d5sm893653985a.31.2025.09.29.13.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 13:58:45 -0700 (PDT)
Date: Mon, 29 Sep 2025 16:58:41 -0400
From: Peter Xu <peterx@redhat.com>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Eric Auger <eric.auger@redhat.com>,
 Helge Deller <deller@gmx.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Ninad Palsule <ninad@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Yi Liu <yi.l.liu@intel.com>,
 =?utf-8?Q?Cl=C3=A9ment?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 Nicholas Piggin <npiggin@gmail.com>, Aditya Gupta <adityag@linux.ibm.com>,
 Gautam Menghani <gautam@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Fan Ni <fan.ni@samsung.com>, David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Laurent Vivier <laurent@vivier.eu>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, BALATON Zoltan <balaton@eik.bme.hu>,
 Bernhard Beschow <shentey@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Fam Zheng <fam@euphon.net>,
 Bin Meng <bmeng.cn@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-block@nongnu.org, kvm@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH 00/35] memory: QOM-ify AddressSpace
Message-ID: <aNrzASvJCP_axv22@x1.local>
References: <20250917-qom-v1-0-7262db7b0a84@rsg.ci.i.u-tokyo.ac.jp>
 <a06a989d-b685-4e62-be06-d96fb91ed6ea@redhat.com>
 <61e4c2bb-d8fa-446a-b4ec-027d4eae35b5@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
In-Reply-To: <61e4c2bb-d8fa-446a-b4ec-027d4eae35b5@rsg.ci.i.u-tokyo.ac.jp>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l6gwU7Jlqdw-iUoVeMGMnPx_Xvu07StyTuPgSYMIxps_1759179526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, Sep 18, 2025 at 09:47:07PM +0900, Akihiko Odaki wrote:
> On 2025/09/18 21:39, Cédric Le Goater wrote:
> > Hello Akihiko,
> > 
> > On 9/17/25 14:56, Akihiko Odaki wrote:
> > > Based-on: <20250917-subregion-v1-0-bef37d9b4f73@rsg.ci.i.u-tokyo.ac.jp>
> > > ("[PATCH 00/14] Fix memory region use-after-finalization")
> > > 
> > > Make AddressSpaces QOM objects to ensure that they are destroyed when
> > > their owners are finalized and also to get a unique path for debugging
> > > output.
> > > 
> > > Suggested by BALATON Zoltan:
> > > https://lore.kernel.org/qemu-devel/cd21698f-db77-eb75-6966-
> > > d559fdcab835@eik.bme.hu/
> > > 
> > > Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> > 
> > I wonder if this is going to fix an issue I was seeing a while ago
> > in the FSI models. I couldn't find a clean way to avoid corrupting
> > memory because of how the address_space was created and later on
> > destroyed. See below,
> 
> Partially, but this is insufficient.
> 
> The first problem is that AddressSpace suffers from circular references the
> following series solves:
> https://lore.kernel.org/qemu-devel/20250906-mr-v2-0-2820f5a3d282@rsg.ci.i.u-tokyo.ac.jp/
> "[PATCH v2 0/3] memory: Stop piggybacking on memory region owners"
> 
> Another problem is that RCU is not properly waited. This is left to future
> work.

Just to mention, Peter Maydell just posted a series for fixing AS
destructions here:

https://lore.kernel.org/qemu-devel/20250929144228.1994037-1-peter.maydell@linaro.org/

IIUC it should also work for FSI, if FSI can convert to use dynamically
allocated AddressSpaces (with/without QOMify; as Akihiko pointed out
correctly, these should be orthogonal), then provide a proper unrealize()
of the bus device to invoke address_space_destroy_free().

Thanks,

-- 
Peter Xu


