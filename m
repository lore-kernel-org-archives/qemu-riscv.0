Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6C6C54798
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 15:52:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rezix-0001Ci-JR; Tue, 27 Feb 2024 10:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rezib-0000vo-I8
 for qemu-riscv@nongnu.org; Tue, 27 Feb 2024 10:50:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1reziY-0000Sm-B4
 for qemu-riscv@nongnu.org; Tue, 27 Feb 2024 10:50:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709049005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FvPkfBHFogsgEa8p6qZWZOjZZnGbxSy2ZKaH7rgPsG0=;
 b=Ke+YpV67kPSadVLrSg/hoqaS6/VmTNh41xtAP1bpxR+n+ZLVX1Tn0PMrAy0KNnrgHV+OpD
 22w6hJuj0ELYw6t7VPBmXnr3rgg53S/WNupwzK7w8aFN12aoyVP/kbBO1l4GRdKtYaS7SO
 wY4MY66XkPNtKvS/QcH47yIeyuDblZc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-g_gUXhagPIe9k96A9o_yWQ-1; Tue, 27 Feb 2024 10:50:04 -0500
X-MC-Unique: g_gUXhagPIe9k96A9o_yWQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-565317b6490so1998312a12.2
 for <qemu-riscv@nongnu.org>; Tue, 27 Feb 2024 07:50:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709049003; x=1709653803;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FvPkfBHFogsgEa8p6qZWZOjZZnGbxSy2ZKaH7rgPsG0=;
 b=S7CFXRVf4Vhs+A1wV9ABCx7VabDTUNaw0+VY319jw8YBMdXBdcBJQ6a2unB2ZC+LAO
 G55sTjhFnC6dUwpirLUEOUvN62ELNmIu23d8bFeouFPx7vxZ0hqEfWADagCizVyvUE7Y
 cOjLPoDpVygK9JWZ0LU+Fggip+trkP5ZmGbGwQdqkK+8KlM1G2kHXRjR8KOKaxNmIoLz
 V0tKY6RNw9yvW3+0yu5NkajdcT5vG9APQpqjwvjhOVxEnH6bCIUAZEUkM+67SMIkxw3j
 GDQQdEATWZNNdUpw5T8HZNnW2dBGsOfjbIVKRsuMnLz+7ztZ3JbK+MhMos4AsKBMGrYc
 OD7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUObY+eoOGq/Ew09xJuyDH7V/M5lcMVF6Cg4dKUozbJSZ2hnnzbaTG40Rj58O+pV7aU8hBBCGr2Q1+6NXL+j51Jqwvc/i8=
X-Gm-Message-State: AOJu0YyEhLNOCiwmmoGA26KMGTR/wQojmlgPetsIACiHsDxlLMA01dFR
 tx61NoLm6JiY3Vv+krSrtoWHOnIkQUSoorbUi0ZDOaCCvOGM1oj+rt51Vx6DPyiplmk1eIN2VOB
 PAcioikajw/QkPyXftIXArZ4MZzby1EAvzGuZwy7RQFGziMg/dlKh
X-Received: by 2002:aa7:c696:0:b0:566:ef8:93f6 with SMTP id
 n22-20020aa7c696000000b005660ef893f6mr3311047edq.0.1709049002888; 
 Tue, 27 Feb 2024 07:50:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHXhtMfXQ9kVoN2CKnZBlWsn7C/s1ugqo5Ytd6csWZxOIGD4KybnEadhnRCmvP6HgCBFFB6Q==
X-Received: by 2002:aa7:c696:0:b0:566:ef8:93f6 with SMTP id
 n22-20020aa7c696000000b005660ef893f6mr3311031edq.0.1709049002586; 
 Tue, 27 Feb 2024 07:50:02 -0800 (PST)
Received: from redhat.com ([2.52.10.44]) by smtp.gmail.com with ESMTPSA id
 z95-20020a509e68000000b00565671fd23asm915333ede.22.2024.02.27.07.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 07:50:01 -0800 (PST)
Date: Tue, 27 Feb 2024 10:49:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 anisinha@redhat.com, philmd@linaro.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Subject: Re: [PATCH 00/19] Workaround Windows failing to find 64bit SMBIOS
 entry point with SeaBIOS
Message-ID: <20240227104944-mutt-send-email-mst@kernel.org>
References: <20240227154749.1818189-1-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240227154749.1818189-1-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
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

On Tue, Feb 27, 2024 at 04:47:30PM +0100, Igor Mammedov wrote:
> Windows (10) bootloader when running on top of SeaBIOS, fails to find            
> SMBIOSv3 entry point. Tracing it shows that it looks for v2 anchor markers       
> only and not v3. Tricking it into believing that entry point is found            
> lets Windows successfully locate and parse SMBIOSv3 tables. Whether it           
> will be fixed on Windows side is not clear so here goes a workaround.            
>                                                                                  
> Idea is to try build v2 tables if QEMU configuration permits,                    
> and fallback to v3 tables otherwise. That will mask Windows issue                
> form majority of users.                                                          
> However if VM configuration can't be described (typically large VMs)             
> by v2 tables, QEMU will use SMBIOSv3 and Windows will hit the issue              
> again. In this case complain to Microsoft and/or use UEFI instead of             
> SeaBIOS (requires reinstall).                                                    

Sounds like the best we can do.

> Default compat setting of smbios-entry-point-type after series                   
> for pc/q35 machines:                                                             
>   * 9.0-newer: 'auto'                                                            
>   * 8.1-8.2: '64'                                                                
>   * 8.0-older: '32'                                                              
>                                                                                  
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/2008                        
> CC: peter.maydell@linaro.org                                                     
> CC: pbonzini@redhat.com                                                          
> CC: mst@redhat.com                                                               
> CC: gaosong@loongson.cn                                                          
> CC: alistair.francis@wdc.com                                                     
> CC: palmer@dabbelt.com                                                           
> CC: bin.meng@windriver.com                                                       
> CC: liwei1518@gmail.com                                                          
> CC: dbarboza@ventanamicro.com                                                    
> CC: zhiwei_liu@linux.alibaba.com                                                 
> CC: imammedo@redhat.com                                                          
> CC: anisinha@redhat.com                                                          
> CC: philmd@linaro.org                                                            
> CC: wangyanan55@huawei.com                                                       
> CC: eblake@redhat.com                                                            
> CC: armbru@redhat.com                                                            
> CC: qemu-arm@nongnu.org                                                          
> CC: qemu-riscv@nongnu.org                                                        
> CC: f.ebner@proxmox.com                                                          
>                           
> Igor Mammedov (19):
>   tests: smbios: make it possible to write SMBIOS only test
>   tests: smbios: add test for -smbios type=11 option
>   tests: smbios: add test for legacy mode CLI options
>   smbios: cleanup smbios_get_tables() from legacy handling
>   smbios: get rid of smbios_smp_sockets global
>   smbios: get rid of smbios_legacy global
>   smbios: avoid mangling user provided tables
>   smbios: don't check type4 structures in legacy mode
>   smbios: build legacy mode code only for 'pc' machine
>   smbios: handle errors consistently
>   smbios: clear smbios_tables pointer after freeing
>   get rid of global smbios_ep_type
>   smbios: extend smbios-entry-point-type with 'auto' value
>   smbios: in case of entry point is 'auto' try to build v2 tables 1st
>   smbios: error out when building type 4 table is not possible
>   smbios: clear smbios_type4_count before building tables
>   tests: acpi/smbios: whitelist expected blobs
>   pc/q35: set SMBIOS entry point type to 'auto' by default
>   tests: acpi: update expected SSDT.dimmpxm blob
> 
>  hw/i386/fw_cfg.h                     |   3 +-
>  include/hw/firmware/smbios.h         |  29 +-
>  hw/arm/virt.c                        |   6 +-
>  hw/i386/Kconfig                      |   1 +
>  hw/i386/fw_cfg.c                     |  14 +-
>  hw/i386/pc.c                         |   4 +-
>  hw/i386/pc_piix.c                    |   4 +
>  hw/i386/pc_q35.c                     |   3 +
>  hw/loongarch/virt.c                  |   7 +-
>  hw/riscv/virt.c                      |   6 +-
>  hw/smbios/Kconfig                    |   2 +
>  hw/smbios/meson.build                |   4 +
>  hw/smbios/smbios.c                   | 481 +++++++++++----------------
>  hw/smbios/smbios_legacy.c            | 185 +++++++++++
>  hw/smbios/smbios_legacy_stub.c       |  16 +
>  qapi/machine.json                    |   5 +-
>  tests/data/acpi/q35/SSDT.dimmpxm     | Bin 1815 -> 1815 bytes
>  tests/data/smbios/type11_blob        | Bin 0 -> 11 bytes
>  tests/data/smbios/type11_blob.legacy | Bin 0 -> 10 bytes
>  tests/qtest/bios-tables-test.c       |  81 ++++-
>  20 files changed, 535 insertions(+), 316 deletions(-)
>  create mode 100644 hw/smbios/smbios_legacy.c
>  create mode 100644 hw/smbios/smbios_legacy_stub.c
>  create mode 100644 tests/data/smbios/type11_blob
>  create mode 100644 tests/data/smbios/type11_blob.legacy
> 
> -- 
> 2.39.3


