Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992F4EDE9AB
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 17:25:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1so4bw-0006oB-Ug; Tue, 10 Sep 2024 13:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1so4bv-0006hi-Bi
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2024 13:25:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1so4bs-00037V-D7
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2024 13:25:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725989099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NZCWltfZIXyROYrJtJZxPfSUQ22U/7y7wxjOsnrAVTY=;
 b=eGsxoWpEoXcIRSrr6umuwNziBTQMATgv8LwQbRLFR1rOc/8QdoQ6xD4LlQOWOQ2900MHXu
 jlL3yWf9R2RqAQeIwjmzcUWQ4GS6fO3b9w62Egzz9vJlRCETe6GQlDPFvKKsSaraq33jjj
 wAGEXSsVvPAsEkiM5xpId0EojvKeZlQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-hYyAQi5aMqu3rtbx42tWqw-1; Tue, 10 Sep 2024 13:24:56 -0400
X-MC-Unique: hYyAQi5aMqu3rtbx42tWqw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42cb9e14ab6so13538295e9.3
 for <qemu-riscv@nongnu.org>; Tue, 10 Sep 2024 10:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725989095; x=1726593895;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NZCWltfZIXyROYrJtJZxPfSUQ22U/7y7wxjOsnrAVTY=;
 b=w6cRq//SdEi5Esu21a/TQBRl+9Wjw0k26T9QBnmfFqVKxy37uHY+I6/dZN3Wi4vXG/
 iasRBTbmLo54MzTi6mNgalrF278EMZg32jIj+y/aGg7UHQYWpUQyr9Qd6iFnmu+r71ET
 0itZ4CKNp5XgEeIC2rzbfJ2nCjb4eyTe6NsTIqqgUm9T467STkv4cbTQmsBPJmuy6WyG
 vwqEVAwO5kV/T3+ZclDgrsPt/iY7+Riu58fs4WB25hjcn8/Xh5Ln6B5Ofa0wrfurkb7X
 MipCkyQVjRg9rysQ8DEfNm7m9F7DVxVvSc+lz00RgLqHh7VrgPXEjeQY1ypO+5TxZbAn
 Y+cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFeYMT+E9klQNqilyGb2k/s56uvm/dWK5Yc1tebfP6iz02PBmb7BZBCowCcnggoCdUetkXvur7z0cR@nongnu.org
X-Gm-Message-State: AOJu0YwuGjgL54OqTvCnfxvwJVYMlzN/Y1LFrzYqcHmk+4NbPlsJN3+G
 GkL/ICZSE/geWrwWt+r3AdcgMJcsxRvS0fvegeL4wNVIQ1jnrMxegEkDAwY9GCEQaRQFepYADQ6
 oL/UzWrjjMcTUcuS90iQN571Qx5ES5cBxoK3cwRw7KAxdwtO68lcX
X-Received: by 2002:a05:600c:1d15:b0:42c:b9a5:ebbc with SMTP id
 5b1f17b1804b1-42cb9a5ee47mr48207045e9.16.1725989095185; 
 Tue, 10 Sep 2024 10:24:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUB1AajfQUJnpqrnECuJOGtbuML3O+JUlQbwgNJnAfTbD4xuza0NH9Urs5xuGCFPqjvQzDNA==
X-Received: by 2002:a05:600c:1d15:b0:42c:b9a5:ebbc with SMTP id
 5b1f17b1804b1-42cb9a5ee47mr48206755e9.16.1725989094522; 
 Tue, 10 Sep 2024 10:24:54 -0700 (PDT)
Received: from redhat.com ([31.187.78.63]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d374fsm9497936f8f.86.2024.09.10.10.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 10:24:53 -0700 (PDT)
Date: Tue, 10 Sep 2024 13:24:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 imammedo@redhat.com, anisinha@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, sunilvl@ventanamicro.com,
 palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v5 0/3] Upgrade ACPI SPCR table to support SPCR table
 revision 4 format
Message-ID: <20240910132404-mutt-send-email-mst@kernel.org>
References: <20240829015920.95778-1-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240829015920.95778-1-jeeheng.sia@starfivetech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.145,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Aug 28, 2024 at 06:59:17PM -0700, Sia Jee Heng wrote:
> Update the SPCR table to accommodate the SPCR Table revision 4 [1].
> The SPCR table has been modified to adhere to the revision 4 format [2].
> 
> Meanwhile, the virt SPCR golden reference file for RISC-V have been updated to
> accommodate the SPCR Table revision 4.
> 
> [1]: https://learn.microsoft.com/en-us/windows-hardware/drivers/serports/serial-port-console-redirection-table
> [2]: https://github.com/acpica/acpica/pull/931

Seems most appropriate on riscv5 tree.
The code looks ok.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


> Changes in v5:
> - Reverted the SPCR table revision history for the ARM architecture.
> - Corrected the output of the SPCR Table diff.
> 
> Changes in v4:
> - Remove the SPCR table revision 4 update for the ARM architecture.
> 
> Changes in v3:
> - Rebased on the latest QEMU.
> - Added Acked-by: Alistair Francis <alistair.francis@wdc.com>
> 
> Changes in v2:
> - Utilizes a three-patch approach to modify the ACPI pre-built binary
>   files required by the Bios-Table-Test.
> - Rebases and incorporates changes to support both ARM and RISC-V ACPI
>   pre-built binary files.
> 
> Sia Jee Heng (3):
>   qtest: allow SPCR acpi table changes
>   hw/acpi: Upgrade ACPI SPCR table to support SPCR table revision 4
>     format
>   tests/qtest/bios-tables-test: Update virt SPCR golden reference for
>     RISC-V
> 
>  hw/acpi/aml-build.c               |  20 ++++++++++++++++----
>  hw/arm/virt-acpi-build.c          |   8 ++++++--
>  hw/riscv/virt-acpi-build.c        |  12 +++++++++---
>  include/hw/acpi/acpi-defs.h       |   7 +++++--
>  include/hw/acpi/aml-build.h       |   2 +-
>  tests/data/acpi/riscv64/virt/SPCR | Bin 80 -> 90 bytes
>  6 files changed, 37 insertions(+), 12 deletions(-)
> 
> 
> base-commit: cec99171931ea79215c79661d33423ac84e63b6e
> -- 
> 2.34.1


