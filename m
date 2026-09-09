Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F36CC79FB6
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 20:49:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4PEg-00047v-Et; Wed, 09 Sep 2026 16:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1x4PEf-00047e-7Z
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 16:49:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1x4PEc-00053A-ML
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 16:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788986973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iHiSepGinwiII0mvyeXa4Lpu4fO4fTRZi4IFC+jBTrQ=;
 b=OiyWhGyVylt6p0UsyZwwWu+s1ev6w2BQ5Zpw5gCxa9W+opDw+L5Q8GkPDkd0KijES6sNq1
 GGeZ7ddPWr5EkrD+2aCDyHTUxrch1I3COaHJDUiDkziUh1WBu1JkzdfBc1Erp0zF9ZHHUP
 H909SChdaLkTAy8OnhfgVN2Ex2MzpJQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-f2zzlmyUN_GOofhthzRDmA-1; Wed, 09 Sep 2026 16:49:31 -0400
X-MC-Unique: f2zzlmyUN_GOofhthzRDmA-1
X-Mimecast-MFC-AGG-ID: f2zzlmyUN_GOofhthzRDmA_1788986971
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-49991beee7aso58211165e9.2
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 13:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788986971; x=1789591771;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=iHiSepGinwiII0mvyeXa4Lpu4fO4fTRZi4IFC+jBTrQ=;
 b=ono3AD3oUJcf5+rmkOHTH1cGLZ3z5ADtEv5rDCNs26hZkFnAcd6nKEtP65SNJKsGrD
 3BliBLDQ+6wCj7zYwmxjH9QH6Ye28ppaO9+6MrxZzoPN54GZQbGsFhlUb5LkWnAq0X+f
 y7UKUKIHrk/xHeY+1oXTSbUiJ9HpFp/RFxSEzqGU1VH34kAaRrmzo9LVWgdyd6aT38gq
 vl9GahESlzNhpNmkFg/WxADwK5WwPX9u8iBqDqasUjuXpeqdwDj+HQC7JoYRGW75oFA6
 THJw7lLRdpGmeV0F2QRvNHBPTYmlAkeiGS8w+VpOOQ/yxMEEV5NJxCFvRipjwEQ43YVF
 iNOQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxPFE+ek0OuE5jmtxNwtHgM/Z5lWaVisNxtI3oer7Kwljk/uKBr7qpwWgA3TGFEBSWxh45ahcF2kMgV@nongnu.org
X-Gm-Message-State: AFuF++mpEaIP1inO0sf2C+OSpjxbB1WPQiyYXf8z2HsISxKia00bkknA
 Zk/rjal8h8YeakrMFO+oxgf7Yz0zJo2uJlIe2ZV3Bf6h215TqQAW+2l6pjcUH119CjFzYej0Onq
 UgnYgSKDxPaeb1Kvs9SBileH/lyVsRo0fl/WyjYS8kZfzbQCoayPJ8hog
X-Gm-Gg: AYBFou0wNL8Ujkg85wn+e60B7n34kFJUSX0E7UW5Y3PxBNePf2pKfqVAMpeFnvEwGTz
 y4lNOg6K9eBhd0p56Udx6V8q0vFniqLhIGWEl2e1N3nCVOYthPWnOaeqJWfX3x7lkqvCSs2MG7J
 4BkfKqz+ZBpg5REVKhjRRMMIJzyFq2lUDF85etLvH7sMYkPa/NqR4J07a8woaFna70NPTMWhwmn
 u4xY98dJpcpW6aD74nO+abVywV8RJiCVH6vjqi7b1uSkj380sw0TaWZ9TsBUvh37JsuSNAutOgv
 wSVBwmmtYpKSEij4ImVVsTKfMiP+RNNN3N8nsflyvtAQ2wx8FXqDExMVwasbLFGBzL+Zyphzhgc
 qAiCC+EbufoHWGTtBZgacayE=
X-Received: by 2002:a05:600c:630a:b0:49c:f89b:f82 with SMTP id
 5b1f17b1804b1-49d2592c540mr64631795e9.12.1788986970639; 
 Wed, 09 Sep 2026 13:49:30 -0700 (PDT)
X-Received: by 2002:a05:600c:630a:b0:49c:f89b:f82 with SMTP id
 5b1f17b1804b1-49d2592c540mr64631285e9.12.1788986970075; 
 Wed, 09 Sep 2026 13:49:30 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26c1bc5fsm16859975e9.3.2026.09.09.13.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 13:49:29 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:49:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, imammedo@redhat.com,
 sunilvl@ventanamicro.com, jic23@kernel.org, pbonzini@redhat.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 anisinha@redhat.com, dave.jiang@intel.com,
 alison.schofield@intel.com, junjie.cao@intel.com, guoren@kernel.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v6 0/6] hw/riscv/virt: Add CXL support to the RISC-V virt
 machine
Message-ID: <20260909164855-mutt-send-email-mst@kernel.org>
References: <20260907093735.2753-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20260907093735.2753-1-cp0613@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HBGiFtcZWaG9D3143hYlETIa8SosDUAsPQT8JU7scfU_1788986971
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Sep 07, 2026 at 05:37:27PM +0800, Chen Pei wrote:
> This series adds CXL support to the RISC-V virt machine, following the
> approach used by the ARM virt machine: CXL host bridges (pxb-cxl) are
> described as ACPI0016 devices, an ACPI0017 (CXLM) device is added to the
> DSDT with a _DEP on the CXL host bridges, and a CEDT table is built. A
> bios-tables test is added to pin down the generated ACPI tables.

ACPI things:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

pls merge in riscv tree.

> Changes since v5
> ----------------
>   - Rebased onto current master, over the gpex_pcie_init() move to
>     device-common.c: s->pci_bus is now assigned at the
>     riscv_gpex_pcie_init() call site in virt_machine_init().
>   - tests/qtest: switched to the renamed in-tree firmware blobs
>     pc-bios/edk2-riscv64-{code,vars}.fd (Junjie).  The goldens are
>     unchanged and still match with the updated edk2-stable202608 blob;
>     all riscv64 ACPI cases pass.
>   - hw/riscv/virt-acpi-build: the _DEP commit message now cites the
>     companion kernel commit bf5418a5fe63 ("ACPI: scan: Honor _DEP for
>     ACPI0016 PCI/CXL host bridge") alongside 3a59c3b772e5, both in
>     v7.2 (Junjie).
>   - Collected review tags: Junjie Cao's Reviewed-by/Tested-by on
>     patches 1, 2 and 6.  Michael S. Tsirkin acked the ACPI parts on
>     the v5 cover letter thread.
> 
> Changes since v4
> ----------------
>   - tests/qtest: DSDT.cxl regenerated against the in-tree
>     edk2-riscv-code.fd blob that the test boots (Junjie): the v4 golden
>     carried the window allocation of my local edk2-stable202602 build.
>     The 64-bit window is now 0x400100000..0x40010FFFF with the matching
>     PCI0 range shift; the AML fragment in the commit message is updated
>     accordingly.  CEDT.cxl is unchanged.
>   - hw/riscv/virt: pci_bus_add_fw_cfg_extra_pci_roots() moved out of
>     the cxl block (Junjie), so plain pxb-pcie expander bridges are also
>     advertised to firmware with cxl=off, in line with arm/virt, pc and
>     hppa.
>   - Collected review tags.
> 
> Changes since v3
> ----------------
>   - The CXL host bridge resource handling is reworked, following Junjie
>     Cao's suggestion (and Igor Mammedov's earlier "fix UEFI" direction):
>     instead of reserving a fixed 256 MiB carve-out and simulating the
>     firmware PCI initialization in QEMU, the machine now advertises the
>     pxb-cxl expander root buses to firmware via the etc/extra-pci-roots
>     fw_cfg file (pci_bus_add_fw_cfg_extra_pci_roots(), as arm/virt and
>     x86 do).  EDK2's PciBusDxe then enumerates behind the CXL host
>     bridge and assigns the root-port window and bus numbers, and
>     build_crs() emits a correct _CRS for the ACPI0016 host bridge.
>     This keeps the machine code minimal (a single call, no carve-out),
>     scales to multiple pxb-cxl host bridges, and lets firmware size the
>     window to what is actually behind the bridge.
>   - The bios-tables test is split into the staged flow documented in
>     bios-tables-test.c, and ordered the same way the riscv64 goldens were
>     originally added upstream (Sunil V L's commit cc3ba2422554 et al.):
>     the feature code comes first, then three consecutive commits -- empty
>     golden files + allowed-diff.h, the test code, and the populated golden
>     master binaries with an emptied allowed-diff.h.
> 
> Changes since v2
> ----------------
>   - hw/riscv/virt: The MMIO-window patch no longer touches the common
>     gpex code (Igor).  The gpex_cfg.cxl_mmio32 field and the is_cxl
>     static _CRS branch are dropped; the ACPI0016 _CRS now comes from the
>     generic build_crs() path.  Since EDK2 does not enumerate the pxb-cxl
>     expander bridge, riscv simulates the firmware PCI initialization
>     (reserved window + depth-first bridge bus numbers) and re-applies it
>     via a reset handler.
>   - hw/riscv/virt: Drops the machine-global window/bus-range synthesis
>     that did not scale past one pxb-cxl (Junjie).  The series targets a
>     single CXL host bridge for now, documented in the commit message and
>     a TODO.
>   - hw/riscv/virt: CXL host register region and FMW setup folded into a
>     single cxl_host_state_init() helper; redundant braces removed in
>     create_fdt_pcie() (Daniel).
>   - hw/riscv/virt-acpi-build: the _DEP commit message documents the
>     kernel-compatibility behaviour (Alistair).
>   - Carried review tags: Sunil V L's Reviewed-by on the _DEP patch and
>     Alistair Francis's Acked-by on the test.
> 
> Changes since v1
> ----------------
>   - hw/riscv/virt: PCIBus *bus renamed to PCIBus *pci_bus (Jonathan).
>   - hw/riscv/virt: Dropped outer if (s->pci_bus) guard around
>     cxl_hook_up_pxb_registers(); the function already handles a NULL
>     bus internally (Jonathan).
>   - hw/riscv/virt-acpi-build: All s->bus references updated to
>     s->pci_bus; iasl -d decompiled DSDT fragment added to commit
>     message.
>   - hw/riscv/virt,gpex: Commit message expanded with PCI-to-PCI Bridge
>     Spec §3.2.5.8/9/10 citations (Jonathan).
>   - Original patch 4 ("Map committed HDM decoder ranges as RAM for
>     direct DMA") dropped; superseded by Alireza Sanaee's v8 series [1],
>     which is now merged upstream and thus no longer a prerequisite.
>   - New patch 4: RISC-V ACPI bios-tables test for CXL, with golden AML
>     files generated and included.
> 
> [1] https://lore.kernel.org/qemu-devel/20260318171918.146-1-alireza.sanaee@huawei.com/
> 
> Test
> ----
> Built riscv64-softmmu and ran the new bios-tables test together with the
> existing riscv64 ACPI tests; all pass.
> 
> Also booted an RVA22 guest with EDK2 firmware, using pxb-cxl + cxl-rp +
> cxl-type3 + a CFMW: EDK2's PciBusDxe enumerates behind the CXL host
> bridge (advertised via etc/extra-pci-roots), the root port and Type3
> device show up (0000:0c:00.0 / 0000:0d:00.0), and 'cxl list' reports
> the memdev (4 GiB) and the CFMWS root decoder.
> 
> QEMU invocation (CXL-relevant options shown):
> 
>     qemu-system-riscv64 \
>         -M virt,aia=aplic-imsic,acpi=on,cxl=on \
>         -cpu rva22s64 -smp 2 -m 4G \
>         -object memory-backend-ram,id=vmem0,share=on,size=4G \
>         -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1 \
>         -device cxl-rp,port=0,bus=cxl.1,id=rp0,chassis=0,slot=2 \
>         -device cxl-type3,bus=rp0,volatile-memdev=vmem0 \
>         -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G \
>         ...
> 
> Verification (total system memory grows by 4 GiB after onlining):
> 
>     # cxl list
>     # cxl enable-memdev mem0
>     # cxl create-region -m -t ram -d decoder0.0 -w 1 mem0 -s 4G
>     # daxctl online-memory dax0.0
>     # free -h
> 
> Chen Pei (6):
>   hw/riscv/virt: Add CXL support to the RISC-V virt machine
>   hw/riscv/virt-acpi-build: Add _DEP to ACPI0017 for CXL host bridge
>     dependency
>   hw/riscv/virt: Advertise the CXL host bridge to firmware via
>     extra-pci-roots
>   tests/qtest: Prepare golden files for the RISC-V CXL ACPI test
>   tests/qtest: Add RISC-V ACPI bios tables test for CXL
>   tests/qtest: Update RISC-V CXL ACPI golden master binaries
> 
>  hw/riscv/Kconfig                      |   2 +
>  hw/riscv/virt-acpi-build.c            |  52 +++++++++++++++++++++++++
>  hw/riscv/virt.c                       |  56 +++++++++++++++++++++++++++++++---
>  include/hw/riscv/virt.h               |   3 ++
>  tests/data/acpi/riscv64/virt/CEDT.cxl | Bin 0 -> 108 bytes
>  tests/data/acpi/riscv64/virt/DSDT.cxl | Bin 0 -> 6331 bytes
>  tests/qtest/bios-tables-test.c        |  54 ++++++++++++++++++++++++++
>  7 files changed, 163 insertions(+), 4 deletions(-)
>  create mode 100644 tests/data/acpi/riscv64/virt/CEDT.cxl
>  create mode 100644 tests/data/acpi/riscv64/virt/DSDT.cxl
> 
> -- 
> 2.50.1
> 


