Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFD9C5B549
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 May 2025 12:11:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uKyZk-00017d-OH; Fri, 30 May 2025 08:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1uKyZi-000178-Jo
 for qemu-riscv@nongnu.org; Fri, 30 May 2025 08:11:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1uKyZg-0005FB-JL
 for qemu-riscv@nongnu.org; Fri, 30 May 2025 08:11:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748607059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=56Obo1kAqckMoE+zmxTq8NB/uf8Zra/91iFs6e+CSNk=;
 b=egH9ZraKToyVyk/zkc6KeH9EfMlAQbyvWNSQWdl/ICD+0OsV2aaUpGYIYaN1jEgbrpzSZr
 WAYP/LlV48I8KlXiOG7ify4Wr47HjaMLSmIWdz/4HFr2H7oyyIqx1NoYuuNj3r2bQvd9+k
 V+p/IRZgola3IyXGWHmvaqekdN8/R9A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-lO-6TXIlOHaPaQnyhILBrg-1; Fri, 30 May 2025 08:10:58 -0400
X-MC-Unique: lO-6TXIlOHaPaQnyhILBrg-1
X-Mimecast-MFC-AGG-ID: lO-6TXIlOHaPaQnyhILBrg_1748607057
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-442f4a3851fso16704195e9.1
 for <qemu-riscv@nongnu.org>; Fri, 30 May 2025 05:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748607057; x=1749211857;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=56Obo1kAqckMoE+zmxTq8NB/uf8Zra/91iFs6e+CSNk=;
 b=P494/yAae2Wvg3BbOmukMI0Qtsn0w/nort75In52EJnuGJvm76UiXxk5nY3ORmcGDS
 ks3vYQlJPdDBSIp6GyNdxsiwVarSmWq4n0q4WuAZmVBGChfT7H6+4c11wIhWQM2ZXr9S
 SzMgO8F0JpgjP/+LR0GsNUswd4JeOFpPlyAD1HBGVFP3IzKlsUHDBztgk698cjiXOvtV
 T2G9pNL20B1K+OnDmYaVc3dhya/Dpv9pd7z7aiLKKwaFQ+IIH7sX6/p9QLUosZSGm5oX
 CU+bDZEHS3vttHbuyPacWZHEqr/FpaiaxnDrKtsIobygi0Jmmo2fyjl+vQI3l1LGI70d
 ocFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNAAV3sOyT95zhT4mBgBLbwoblDis0wx2FecyEVCyyn17220B8sGEfZMGUMHQc/n4SenC7sGNc0CUE@nongnu.org
X-Gm-Message-State: AOJu0YxZPKapUFjfocn3RT3kLnldmIHkRoFHNohlQ9Ng0Cw81UX6tS06
 iGJm/pMedVEVkqHdbuTuC3oYzF0ovyVezB2w12J2NQfyFwtncEY8vggmR0LInRiUwyK2G96Up3L
 tvuV782QOUmEYRxCaVFpkC+yuw8vwrDN7p47aZSVMHWP2a/8reoKmsrFz
X-Gm-Gg: ASbGncvE726LkZ4gc1mC5YX36a3f2xLMC/Z9o7Q35xQypMPu4tnXhdhO7qrKh4Yz4f5
 0VihIA2X/phxy7fHdkF19JlxiBDQ0lYQLEzO/gXFPgi+Y925G6Zp1XHJt5zcngzbTXkASM1Gyrt
 81oxvZ/wAKSudmc70iQBCM65OjzXbHhAjOXZgW8QSeJhL278QFqAx8f3Ug44nKLkc+1sdSzzyIv
 RImqzKpPVaAK9DsOcW71g2/uzTzbuf17jof/bX/mtR1plcy61qBFSwlp2UHIFijBTc3l0OCNUgV
 a7Bgee3uVfgBANvO
X-Received: by 2002:a05:600c:3147:b0:43d:b85:1831 with SMTP id
 5b1f17b1804b1-450d8757eb5mr22549805e9.0.1748607057050; 
 Fri, 30 May 2025 05:10:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUc0DMrk+8B1R0QjICerx0PDQ33QuxUpvmHpmbig9dnqjeFVNMVMuX8Gt6+t5/FD1ZuAJx8A==
X-Received: by 2002:a05:600c:3147:b0:43d:b85:1831 with SMTP id
 5b1f17b1804b1-450d8757eb5mr22549375e9.0.1748607056632; 
 Fri, 30 May 2025 05:10:56 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7fb00ccsm16526085e9.17.2025.05.30.05.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 05:10:55 -0700 (PDT)
Date: Fri, 30 May 2025 08:10:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Li Chen <me@linux.beauty>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Song Gao <gaosong@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-riscv <qemu-riscv@nongnu.org>,
 Li Chen <chenl311@chinatelecom.cn>
Subject: Re: [PATCH REPOST v4 0/4] acpi: Add machine option to disable SPCR
 table
Message-ID: <20250530081034-mutt-send-email-mst@kernel.org>
References: <20250528105404.457729-1-me@linux.beauty>
MIME-Version: 1.0
In-Reply-To: <20250528105404.457729-1-me@linux.beauty>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H88ejv0NnVgR8kP1-pQoCnCQoEf45Kasw2zIUSkUZJI_1748607057
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.907,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On Wed, May 28, 2025 at 06:53:34PM +0800, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
> 
> (REPOST because the previous post failed to send to qemu-devel/qemu-riscv/qemu-arm,
>  see https://lore.kernel.org/qemu-devel/1971648603b.dce1f5d22901195.6702025346547333607@linux.beauty/T/#u)
> 
> This series introduces a new machine option, spcr=on|off, allowing users
> to disable the ACPI SPCR (Serial Port Console Redirection) table.
> By default, SPCR is enabled. Disabling it can help ensure that the guest's
> console behavior is determined solely by kernel command-line parameters
> on arch like arm64, avoiding unintended serial console configurations imposed
> by firmware.
> 
> Also add tests on AArch64 and RISC-V virt machines using TCG and UEFI boot.
> 
> Changes since v3:
> - Add Reviewed-by from Sunil V L <sunilvl@ventanamicro.com> for patch 1, 3, and 4.
> - rename enable_spcr to acpi_spcr_enabled as suggested by Philippe Mathieu-Daudé.
> Changes since v2:
> - Omit UART device from DSDT and SPCR construction if no serial device is present,
> as suggested by Philippe Mathieu-Daudé.
> - Add Reviewed-by from Gavin Shan <gshan@redhat.com> for the first patch and fix style issue.
> 
> Changes since v1:
> - Add bios-tables-test for RISC-V and ARM as suggested by
> - Add Acked-by from Michael S. Tsirkin for the first patch
> - Add Reviewed-by from Bibo Mao for the first patch
> 
> Li Chen (4):
>   acpi: Add machine option to disable SPCR table
>   tests/qtest/bios-tables-test: Add test for disabling SPCR on AArch64
>   tests/qtest/bios-tables-test: Add test for disabling SPCR on RISC-V
>   acpi/virt: suppress UART device & SPCR when guest has no serial
>     hardware

Who's merging this?


>  hw/arm/virt-acpi-build.c       | 18 ++++++++-----
>  hw/core/machine.c              | 22 ++++++++++++++++
>  hw/loongarch/virt-acpi-build.c |  4 ++-
>  hw/riscv/virt-acpi-build.c     | 10 ++++++--
>  include/hw/boards.h            |  1 +
>  include/system/system.h        |  2 ++
>  qemu-options.hx                |  5 ++++
>  system/vl.c                    |  5 ++++
>  tests/qtest/bios-tables-test.c | 47 ++++++++++++++++++++++++++++++++--
>  9 files changed, 103 insertions(+), 11 deletions(-)
> 
> -- 
> 2.49.0


