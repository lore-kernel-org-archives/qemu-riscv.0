Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVGkn-0002EY-A2
	for mharc-qemu-riscv@gnu.org; Mon, 05 Sep 2022 14:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVGki-0002BB-II
 for qemu-riscv@nongnu.org; Mon, 05 Sep 2022 14:23:20 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:37487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVGkX-000265-FD
 for qemu-riscv@nongnu.org; Mon, 05 Sep 2022 14:23:20 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 o2-20020a17090a9f8200b0020025a22208so5592573pjp.2
 for <qemu-riscv@nongnu.org>; Mon, 05 Sep 2022 11:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=SeHNAeBlear1oln8Wk6+tsh0AHrkZiXRlUMMSCjo9+k=;
 b=QiSyAcRU1n2tLNWgh0eeirpvBKeYP3SavHb4/ZRhPPtruxZp0C918hibYCn1DfiKRM
 N+rqSnesGUIK5CLvfvQhKCHJy0ECwPpzMHoqWAyjOIAE6GSAAL7vD/RSZGqnZtNQgH01
 zN7pnfbJUI691iy6K1qNAPs+MP4lcQ5WCBmqjy9YIMgscwFLoLaQBoFE6ljpJ4tC2jEM
 nPmcbAL3Z94776YvrogY6vbtF/YNu1pTVtIpFdULJgUPwEzTW5fPzfUPClChgia3BQM0
 E9keHXxXnR8NeDV/YHk91BFx3FjEVX4Ea+/+ulcbWcBuu1GR8EL6Zl1KDzGzlaiuba42
 DGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=SeHNAeBlear1oln8Wk6+tsh0AHrkZiXRlUMMSCjo9+k=;
 b=UEP8ZQvScDeFiyWKWE2uACLDfG6LLUx/faXd8GyAjZmfN53b6H2BFbH7tRLjvf2ZgP
 faIUG5ZBZaFBgGgs0aTZ8Kfw32ampaznte4770kKRLoDkFeY45EkNRl238vsp5g86mPN
 Ugx5tMz6DET4rYakc3a/24bJ5GWMj+0oXVgUB919PA8zCwFfBXsng86Q813lS34nuFcV
 Waa3XLuXAr/nhfqL5ICCreN4EJLujniOgNAQDgpG/dLxPCG54A9kIjkk5tj77IMwFoiQ
 EhKZgWA+ZuADWTv5vYJUgj+L2qqZz9LccTXVevOtL4Czds9ESUCz+fQ3al+G0Hdu5UrI
 acTw==
X-Gm-Message-State: ACgBeo1f4vbxefy9vjJQUVwOSmaJ7ms7+2ZaGRcPIMXpC3ec7EMXP3xP
 pwAATZ1ytZRDUgQvoMPUqXZqFw==
X-Google-Smtp-Source: AA6agR4LTWXZ23y2Y0rsAXQYrcgwiDPMz2/F+8xt6W+WbLBXkhlghjLX+MTITLZIXVcs4jgKoyIsLg==
X-Received: by 2002:a17:903:244d:b0:175:3ead:4586 with SMTP id
 l13-20020a170903244d00b001753ead4586mr28513867pls.28.1662402187979; 
 Mon, 05 Sep 2022 11:23:07 -0700 (PDT)
Received: from localhost.localdomain ([49.206.11.92])
 by smtp.gmail.com with ESMTPSA id
 z7-20020aa79587000000b005321340753fsm8046724pfj.103.2022.09.05.11.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 11:23:07 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V2 0/3] hw/riscv: virt: Enable booting S-mode firmware from
 pflash
Date: Mon,  5 Sep 2022 23:52:35 +0530
Message-Id: <20220905182238.374545-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 05 Sep 2022 18:23:20 -0000

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
 hw/nvram/fw_cfg.c         | 49 +++++++++++++++++++++++++++++++++++++++
 hw/riscv/boot.c           | 28 ++++++++++++++++++++++
 hw/riscv/virt.c           | 31 ++++++++++++++++++-------
 include/hw/nvram/fw_cfg.h |  3 +++
 include/hw/riscv/boot.h   |  1 +
 7 files changed, 104 insertions(+), 90 deletions(-)

-- 
2.25.1


