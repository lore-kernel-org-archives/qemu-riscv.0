Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07472C54E41
	for <qemu-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 10:09:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rhRid-00045p-D4; Tue, 05 Mar 2024 05:08:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rhRic-00045R-Fs
 for qemu-riscv@nongnu.org; Tue, 05 Mar 2024 05:08:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rhRia-0007pQ-Nv
 for qemu-riscv@nongnu.org; Tue, 05 Mar 2024 05:08:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709633295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vBFJjak2kPJbPumj6Klm0aRcNBGL6fk+t48daLXgxc4=;
 b=Sx3lcQ49oGEzOxV+qdKf6RqCaL4HiVpMU+b7Ar7FdAj9LyE/jH2oK1OUJ+R/cbI0MUaMBU
 kEQb/V9FmpYngqHHFv/Ilmwe8NJE2NO1vUPysuEfBiJIKyZUEzauD3Esa+KcNeyan5w8nb
 PcxWxRe6PBDkzugjY8yUnDLO9jdjLCg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-gVAEXrsDPjy8xqbhvuBjXg-1; Tue, 05 Mar 2024 05:08:12 -0500
X-MC-Unique: gVAEXrsDPjy8xqbhvuBjXg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40e53200380so35930425e9.3
 for <qemu-riscv@nongnu.org>; Tue, 05 Mar 2024 02:08:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709633291; x=1710238091;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vBFJjak2kPJbPumj6Klm0aRcNBGL6fk+t48daLXgxc4=;
 b=riPfrnyo/8e2rLNFn6++N527BqgzWk5ZRd+hvSXRXl/ko0MchiG52GpheN3Sz6cu1p
 3UpyidDkBlyxWTYvWK/7m2XR0uNKCTSKh9ZqwzrYVsrnHludE1zonFf+1ZZbnamZKyo+
 B9fcmDHJNp4vID/8v0M9fAwCCGrV7u+mdTHKI2fpDlKAS757uSH4k2fZn+K5WjGjE1Dj
 KEH8lM8lKSnnFA4buHYwISL1+9qZfK8M2V0E0k/FdrbHYdkShLR8z9Grlu0/ntNFrVYP
 ZKLa2Rwo+WkD/H0paLhzOA6jxaY4OMh8ldAxoFvS6EjZXOwHgLcEFQX+HmOZ1Phc9lXs
 7t8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXek4S6J/08uTNGiM/Ltd+99ZRPSYDVA0/h29HDRg6PQs3U4kazTL48RWkRKR7DmI/zVNGb7ki9Ez0WM0v+UAuwhGVnSjA=
X-Gm-Message-State: AOJu0YzEPPIuygZE3ytv3Uhds1kvPFzyuHl8xIljda8KGPh1t3pN1ALu
 YYvJYJ4c6IY8SZvnF4CW8AauI2ojrDA6ZjyIjbSyVneUFhdA6sQmNoZq2T2TMsMUEn9nYfyunQz
 038Yw/QoTAOUFltM2r7ykPlaBGd55uoaCw3RbyhKi88jSt1Gjkexu
X-Received: by 2002:a05:600c:444c:b0:412:efe5:7fcb with SMTP id
 v12-20020a05600c444c00b00412efe57fcbmr156625wmn.39.1709633290945; 
 Tue, 05 Mar 2024 02:08:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYzCL4mG5M7+KIVv8xdqugBIWcbXjCA47hgErz6+RHKIS9fS4b+lQ0QidUoxxlDSjPV7BJgQ==
X-Received: by 2002:a05:600c:444c:b0:412:efe5:7fcb with SMTP id
 v12-20020a05600c444c00b00412efe57fcbmr156596wmn.39.1709633290565; 
 Tue, 05 Mar 2024 02:08:10 -0800 (PST)
Received: from redhat.com ([2.52.130.198]) by smtp.gmail.com with ESMTPSA id
 be10-20020a05600c1e8a00b00412ea14ff91sm2578048wmb.21.2024.03.05.02.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 02:08:10 -0800 (PST)
Date: Tue, 5 Mar 2024 05:08:05 -0500
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
Message-ID: <20240305050735-mutt-send-email-mst@kernel.org>
References: <20240227154749.1818189-1-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240227154749.1818189-1-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.571,
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

Igor so you want to repost a version with a couple of patches squashed?


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


