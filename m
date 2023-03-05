Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYy2R-0000vA-SR
	for mharc-qemu-riscv@gnu.org; Sun, 05 Mar 2023 18:45:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pYy2Q-0000uo-G4
 for qemu-riscv@nongnu.org; Sun, 05 Mar 2023 18:45:10 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pYy2O-0007Jl-Ei
 for qemu-riscv@nongnu.org; Sun, 05 Mar 2023 18:45:10 -0500
Received: by mail-pl1-x62d.google.com with SMTP id ky4so8445335plb.3
 for <qemu-riscv@nongnu.org>; Sun, 05 Mar 2023 15:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678059906;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=AChv+aZEEc9jg147GbiI56ZSDqX5vlK6xVOAdvqnWBA=;
 b=08pr26//uW0H/wa5qagW43EHmIWAIhTYGkwO6pMSTgiXkixBFMgGztVLsM31hutb0U
 CeR9+lxHb5xQsTmDNlnE/GUsbL4t1VcH9r7sMr0D4ZcpUGtJDcvRVIatVS1pjzE0MVel
 mShi2em8Gzh4DmUyEbdHa82C5v4ENxkoCdIxywUVNDTe8efer3Dw13rEovxKwa7jNfQo
 HIfBhBDPBdvJjK+FB4mGvL0sEoRGU+NVLJPgZnyF7wPWmMLv8C4IGw23Q9dz4+9WfqjQ
 1qLwOwx1D5D/M1KpuCK4Zl/MWzosPQSqO4td9YRp+6/NUqUS878a8MKNxJVzv3NH7ekt
 4Xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678059906;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AChv+aZEEc9jg147GbiI56ZSDqX5vlK6xVOAdvqnWBA=;
 b=xQuEYSFMANd7h/V2qnRIzZi5Hl5bF4Lq+NuVAcZHmMkqGWPl4+CCwzEC7R7rHpNcha
 jpde8wgZunVymc+B/u3jlpRmVjroCWM99JL+71yGFM5Vew58LeyZjF0glLsmjjsCEXf8
 X0pRBWHN1FgPP+V82KHecYRFuLOkhS9LfaYzsW5rGOyf+ZuQR9V4EPiiSjjRCZlN1aUn
 nEDyVkgxld/3Kb1FO5V32K3r8OPCE2Mlb5+3X4dUsj7oAGW6bd7E7uMGX6w1FKtfcME/
 Hq+E3esF+yc96Gk2594JKicNawVAD7uoh/44qcPUwbinYZb6jhHccUdi5aewMD6PAcGO
 vf5w==
X-Gm-Message-State: AO0yUKXYve/DNsUPWsThYc91t7inME4+lMghtuYUCKAw+XiZeznsD2hm
 bI1NWES3QNQapKPQUUAt7D4x3M6MaK57U3oCvuQ=
X-Google-Smtp-Source: AK7set/Ctv+RdSQ829mKTYZ30xKY+bAZ/vdhiRDZkrXD/DbnJFsD8KpbgZqk9Bm02PKrwuSAyezmTQ==
X-Received: by 2002:a05:6a20:7348:b0:cc:9010:9ed with SMTP id
 v8-20020a056a20734800b000cc901009edmr10427227pzc.31.1678059906138; 
 Sun, 05 Mar 2023 15:45:06 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 d25-20020aa78159000000b005cdf83e4513sm5155616pfn.145.2023.03.05.15.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 15:45:05 -0800 (PST)
Date: Sun, 05 Mar 2023 15:45:05 -0800 (PST)
X-Google-Original-Date: Sun, 05 Mar 2023 15:44:14 PST (-0800)
Subject: Re: [PATCH V5 0/8] Add basic ACPI support for risc-v virt
In-Reply-To: <20230302091212.999767-1-sunilvl@ventanamicro.com>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, ajones@ventanamicro.com, apatel@ventanamicro.com,
 Atish Patra <atishp@rivosinc.com>, sunilvl@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sunilvl@ventanamicro.com, imammedo@redhat.com
Message-ID: <mhng-7afa2599-95f6-43e9-a968-9e7e4f939faa@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 05 Mar 2023 23:45:10 -0000

On Thu, 02 Mar 2023 01:12:04 PST (-0800), sunilvl@ventanamicro.com wrote:
> This series adds the basic ACPI support for the RISC-V virt machine.
> Currently only RINTC interrupt controller specification is approved by the
> UEFI forum. External interrupt controller support in ACPI is in progress.
>
> This adds support for RINTC and RHCT tables as specified in below ECR links
> which are approved by UEFI forum.
> RINTC - https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
> RHCT - https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view
>
> These changes are also available @
> https://github.com/vlsunil/qemu/tree/acpi_b1_us_review_V5
>
> Changes since V4:
> 	1) Used possible_cpus to create cpu topology in DSDT, MADT and RHCT as
>            per Igor's feedback.

Thanks.  These all look good to me, but given that Igor had some 
feedback on the v4 and it's pretty much just been weekend since t hese 
went out I'm going to hold off until tomorrow before merging anything.  
They're all staged and passing the tests on my end, so everything's good 
as far as I'm concerned.

>         2) Moved MAINTAINER entries below ACPI/SMBIOS entry as per Drew's
>            feedback
> Changes since V3:
> 	1) Added back acpi_align_size() wrapper as per Drew's feedback
> 	2) Updated RB tags
>
> Changes since V2:
> 	1) Squashed commits and updated commit message as per feedback from Daniel.
> 	2) Addressed comments from Drew.
> 	3) Updated tags.
>
> Changes since V1:
> 	1) Addressed comments from Bin Meng.
> 	2) Made acpi switch default AUTO similar to other architectures.
> 	3) Re-based and added RB and ACKs.
>
> The series is tested using SBI HVC console and initrd.
>
> Test instructions:
> 1) Build Qemu with ACPI support (this series)
>
> 2) Build EDK2 as per instructions in
> https://github.com/vlsunil/riscv-uefi-edk2-docs/wiki/RISC-V-Qemu-Virt-support
>
> 3) Build Linux with ACPI support using below branch
> https://github.com/vlsunil/linux/commits/acpi_b1_us_review_ipi17_V2
> after enabling SBI HVC and SBI earlycon options.
>
> CONFIG_RISCV_SBI_V01=y
> CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
> CONFIG_HVC_RISCV_SBI=y
>
> 4) Build buildroot.
>
> Run with below command.
> qemu-system-riscv64   -nographic \
> -drive file=Build/RiscVVirtQemu/RELEASE_GCC5/FV/RISCV_VIRT.fd,if=pflash,format=raw,unit=1 \
> -machine virt -smp 16 -m 2G \
> -kernel arch/riscv/boot/Image \
> -initrd buildroot/output/images/rootfs.cpio \
> -append "root=/dev/ram ro console=hvc0 earlycon=sbi"
>
>
> Sunil V L (8):
>   hw/riscv/virt: Add OEM_ID and OEM_TABLE_ID fields
>   hw/riscv/virt: Add a switch to disable ACPI
>   hw/riscv/virt: Add memmap pointer to RiscVVirtState
>   hw/riscv/virt: Enable basic ACPI infrastructure
>   hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
>   hw/riscv/virt: virt-acpi-build.c: Add RHCT Table
>   hw/riscv/virt.c: Initialize the ACPI tables
>   MAINTAINERS: Add entry for RISC-V ACPI
>
>  MAINTAINERS                |  18 +-
>  hw/riscv/Kconfig           |   1 +
>  hw/riscv/meson.build       |   1 +
>  hw/riscv/virt-acpi-build.c | 416 +++++++++++++++++++++++++++++++++++++
>  hw/riscv/virt.c            |  40 ++++
>  include/hw/riscv/virt.h    |   6 +
>  6 files changed, 476 insertions(+), 6 deletions(-)
>  create mode 100644 hw/riscv/virt-acpi-build.c

