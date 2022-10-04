Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ofe9p-00044B-Ad
	for mharc-qemu-riscv@gnu.org; Tue, 04 Oct 2022 05:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ofe9m-00042X-Jd
 for qemu-riscv@nongnu.org; Tue, 04 Oct 2022 05:24:06 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:42534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ofe9i-0004Ls-Fm
 for qemu-riscv@nongnu.org; Tue, 04 Oct 2022 05:24:04 -0400
Received: by mail-pg1-x536.google.com with SMTP id e129so12215672pgc.9
 for <qemu-riscv@nongnu.org>; Tue, 04 Oct 2022 02:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=vMgIC3BFTqFjiZBLLZIOIfcn007DVCDGcbA2Ug7rHrY=;
 b=MQPE3evOsO4bN12RuMuvtoAl4qadSc2gFo1iVmqmkUygMmqT0PEh14WsPEd8j9JrQG
 EzT3QKMWPjaHXIXriKbK+MIkpXOwTcVIG04vPgdVSuEaMnwtSqAOksG0GPVwqR+PD9g+
 WtE6U0djYsqdpgXlXDNgEENMpS1mYx7ABiUnNrbkfxQx7UNvcGdfjE+uf26bd5X566w+
 OrnKsTUctfsyyYMUrCJg5BrXwywJ8dXIt8FbrT0T2HWqxkzmTl1mT4/zbzps7NKtrGyA
 r5g7DGY3iL8GT6pmD8/WSF10j2ZUGS9YU4LVjhck8BJwAlC7Xqp9hjAvWfPerJTcW15R
 qkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=vMgIC3BFTqFjiZBLLZIOIfcn007DVCDGcbA2Ug7rHrY=;
 b=bYky4NvdM3kdB5QCYxaFvgwJXgybED6/i5uTkH0SY7OmqcfIg65gPVahGA8v8AIq1k
 gO67SHkFCkZOtwWTv2bt9b+OSdzxSYl6NVc/eaATSdt9dKtLJY6EMZkavdEHvJpjYJFu
 J4/keUTCDhLGMhPjweLz4bC4X0owHcTb4AgBsX+Oosv8GBDwriE/CBw4i7ECZxHrnt3G
 HzXVTIpIAttFjP4Wv1xEqkhF576ZD5zy6XKFjvpTH+HSqOQeSTG/koWI5NgHW3rAgbSP
 MpJExtfaHym/YzgfMRI2mYvtuf6WoDTsu70+VPOk8hgTBOytwIg6+zFNDfrvHAgHEhsl
 4qCg==
X-Gm-Message-State: ACrzQf2IspCjP8YzngF8Clx7KPBa6OvhAqj28f/f8C19ycggWFwTsKaw
 Jyfec6CRwDfUvFdrVynpL03Jsw==
X-Google-Smtp-Source: AMsMyM4YVWJvBYEE8i0ivHoNBxUS0zUL63jBkyPUx8TQ8r5lhhjDUTun3IfPAgQpI6LIxBmjMaqBLg==
X-Received: by 2002:aa7:9e52:0:b0:53e:49b2:1c6e with SMTP id
 z18-20020aa79e52000000b0053e49b21c6emr26749203pfq.70.1664875439561; 
 Tue, 04 Oct 2022 02:23:59 -0700 (PDT)
Received: from localhost.localdomain ([49.206.9.142])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a17090b070200b001fba4716f11sm2934551pjz.22.2022.10.04.02.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 02:23:58 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V5 0/3] hw/riscv: virt: Enable booting S-mode firmware from
 pflash
Date: Tue,  4 Oct 2022 14:53:48 +0530
Message-Id: <20221004092351.18209-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 04 Oct 2022 09:24:08 -0000

This series adds the support to boot S-mode FW like EDK2 from the flash. The
S-mode firmware should be kept in pflash unit 1.

When -kernel (and -initrd) option is also provided along with the flash,
the kernel (and initrd) will be loaded into fw_cfg table and opensbi will
branch to the flash address which will be the entry point of the S-mode
firmware. The S-mode FW then loads and launches the kernel.

When only -pflash option is provided in the command line, the kernel
will be located and loaded in the usual way by the S-mode firmware.

These patches are available in below branch.
https://github.com/vlsunil/qemu/tree/pflash_v2

The first two patches in this series are refactor patches.

These changes are tested with a WIP EDK2 port for virt machine. Below
are the instructions to build and test this feature.

1) Get EDK2 sources from below branches.
https://github.com/vlsunil/edk2/tree/virt_refactor_smode_v1
https://github.com/vlsunil/edk2-platforms/tree/virt_refactor_smode_v1

2) Build EDK2 for RISC-V
	export WORKSPACE=`pwd`
        export GCC5_RISCV64_PREFIX=riscv64-linux-gnu-
        export PACKAGES_PATH=$WORKSPACE/edk2:$WORKSPACE/edk2-platforms
        export EDK_TOOLS_PATH=$WORKSPACE/edk2/BaseTools
        source edk2/edksetup.sh
        make -C edk2/BaseTools clean
        make -C edk2/BaseTools
        make -C edk2/BaseTools/Source/C
        source edk2/edksetup.sh BaseTools
        build -a RISCV64  -p Platform/Qemu/RiscVVirt/RiscVVirt.dsc -t GCC5

3)Make the EDK2 image size to match with what qemu flash expects
truncate -s 32M Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd

4) Run
a) Boot to EFI shell (no -kernel / -initrd option)
qemu-system-riscv64  -nographic   -drive file=Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd,if=pflash,format=raw,unit=1  -machine virt -M 2G

b) With -kernel, -initrd and -pflash
qemu-system-riscv64  -nographic   -drive file=Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd,if=pflash,format=raw,unit=1  -machine virt -M 2G -kernel arch/riscv/boot/Image.gz -initrd rootfs.cpio 


Changes since V4:
	1) Rebased on riscv-to-apply.next branch
	2) Added RB tags
	3) Gerd's feedback on removing the truncate requirement will be addressed as separate
	   patch in future.

Changes since V3:
	1) White space and comment edits
	2) Added RB tag

Changes since V2:
	1) Moved the doc comment to .h file

Changes since V1:
	1) Modified code to support the use case when both -kernel and -pflash are configured.
	2) Refactor patches added to help (1) above.
	3) Cover letter added with test instructions.

Sunil V L (3):
  hw/arm,loongarch: Move load_image_to_fw_cfg() to common location
  hw/riscv: virt: Move create_fw_cfg() prior to loading kernel
  hw/riscv: virt: Enable booting S-mode firmware from pflash

 hw/arm/boot.c             | 49 ---------------------------------------
 hw/loongarch/virt.c       | 33 --------------------------
 hw/nvram/fw_cfg.c         | 32 +++++++++++++++++++++++++
 hw/riscv/boot.c           | 29 +++++++++++++++++++++++
 hw/riscv/virt.c           | 32 ++++++++++++++++++-------
 include/hw/nvram/fw_cfg.h | 21 +++++++++++++++++
 include/hw/riscv/boot.h   |  1 +
 7 files changed, 107 insertions(+), 90 deletions(-)

-- 
2.25.1


