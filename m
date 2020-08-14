Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6cmW-0000mw-7W
	for mharc-qemu-riscv@gnu.org; Fri, 14 Aug 2020 12:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1k6cmU-0000ib-Fd; Fri, 14 Aug 2020 12:42:14 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:36508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1k6cmS-0002kz-NK; Fri, 14 Aug 2020 12:42:14 -0400
Received: by mail-pl1-x642.google.com with SMTP id y6so4426733plt.3;
 Fri, 14 Aug 2020 09:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oAXhBscEjBxoVrn8A4ECG0YzNXRBy4UTeqzsNHK0BBA=;
 b=TQMnCi1xj6ZpoMBiJKg820sA4hVaiNB/+DjxuyBAA+JeD1rCkFgxH88yQXl0avczYu
 RL/tCejW2kG7p+ufUJ824OylpE0GxVaOV5Bhcf9tbej1+4rneB3DGkqZ52p54eBLsVGl
 +jYx20dmmUxS3jTPjGqbLrTZeJczX3ujY9qPZUY4Qd3UU7ZYnDhhqMgIes0R2fwkGAZO
 YDe+jTTHN+a4KeE2QQodqdAah6B7Ogv1CL4ea1aeX1wjiwSrWzpvQ9FbwI4xirrGhhMj
 2dMBf91Rik3+IbCUgH44mjjsYBLI0bPrDMLGx5Os+VyFmkBIPE7r/c1xSXviNQvBZMry
 DeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=oAXhBscEjBxoVrn8A4ECG0YzNXRBy4UTeqzsNHK0BBA=;
 b=Rmeq/C9zIKyvfT/kvZqMXFVl45fpuwO47ctjzStTTr7d3tPBTz0mGr9gxyZrMYGcIi
 cHK+OGNAdzFSWVzvawfNUcds/m0SRcngtpJ1QAV7zS0eZUsZTYI1RzJy+fX7/mIly7/b
 b41RDac/wcHWFLvA+/Mqw+T0K2OY2LLK/Ay9JiKDOUXmbN7fXmgS6ZEaBcSp/fwTq6KZ
 L3Dv9lE3VRUqqo0VkWiTgt11RBJ8XzmjWTh0jok3mqMjPwEDR9mXvcdoXyLyXA/dwfis
 ncBhWIo768Ls08UhR4aPgwcTu318+l+vUDTPmFTrReB13jngW6xkpqpSsm6lgRG3MRQL
 kYkA==
X-Gm-Message-State: AOAM531gVMzGSPYD2ld87UpRrQsawkR1Av2EB+9/PFhX51VJhJGpayEA
 OZAglUk8QKJnYQ+7+AfWThI=
X-Google-Smtp-Source: ABdhPJxhVUGzR01RAsxsmyVaB4WwRX9+8to1XGZ7QMEAk5t3Nc6lTk1Qtgc1pMDn4pbeKz86fIaU1A==
X-Received: by 2002:a17:90a:1fca:: with SMTP id
 z10mr2907301pjz.209.1597423330966; 
 Fri, 14 Aug 2020 09:42:10 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-146-144.windriver.com.
 [147.11.146.144])
 by smtp.gmail.com with ESMTPSA id 16sm9836332pfi.161.2020.08.14.09.42.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Aug 2020 09:42:10 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 18/18] hw/riscv: microchip_pfsoc: Document the software used
 for testing
Date: Sat, 15 Aug 2020 00:40:56 +0800
Message-Id: <1597423256-14847-19-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597423256-14847-1-git-send-email-bmeng.cn@gmail.com>
References: <1597423256-14847-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Aug 2020 16:42:15 -0000

From: Bin Meng <bin.meng@windriver.com>

Add some useful comments to document the software used for testing.
including how to patch HSS to bypass the DDR memory initialization,
HSS and Yocto BSP build instructions, etc.

To launch this machine for testing:
$ qemu-system-riscv64 -M microchip-icicle-kit -smp 5 \
    -bios path/to/hss.bin -sd path/to/sdcard.img \
    -nic user,model=cadence_gem \
    -nic tap,ifname=tap,model=cadence_gem \
    -display none -serial stdio \
    -chardev socket,id=serial1,path=serial1.sock,server,wait \
    -serial chardev:serial1

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

 hw/riscv/microchip_pfsoc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index e8b7f86..1575fef 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -56,6 +56,27 @@
 /*
  * The BIOS image used by this machine is called Hart Software Services (HSS).
  * See https://github.com/polarfire-soc/hart-software-services
+ *
+ * As of now the DDR memory controller in the Microchip PolarFire SoC has not
+ * been modeled. Simply creating unimplemented devices does not make HSS happy.
+ * Emulating the DDR memory controller is tedious, so a patched HSS should be
+ * used as the BIOS for this machine.
+ *
+ * To patch HSS, open boards/icicle-kit-es/hss_board_init.c in the HSS source
+ * tree, find the boardInitFunctions[] array that contains the initialization
+ * routines for this board, and remove the line that contains 'HSS_DDRInit'.
+ *
+ * QEMU does not support eMMC hence the SD configuration shall be used in the
+ * HSS and Yocto BSP build. The eMMC configuration is not supported.
+ *
+ * Instructions to build HSS:
+ *   $ cp boards/icicle-kit-es/def_config.sdcard .config
+ *   $ make BOARD=icicle-kit-es
+ *
+ * For Yocto build, "MACHINE=icicle-kit-es-sd" should be specified, otherwise
+ * when booting Linux kernel the rootfs cannot be mounted. The generated image
+ * is something like: mpfs-dev-cli-icicle-kit-es-sd.rootfs.wic. Resize the file
+ * with 'qemu-image' to a power of 2 before passing to QEMU '-sd' command line.
  */
 #define BIOS_FILENAME   "hss.bin"
 #define RESET_VECTOR    0x20220000
-- 
2.7.4


