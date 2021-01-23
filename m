Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GNM-0003te-PT
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GMT-0003UX-6E; Sat, 23 Jan 2021 05:41:45 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:40781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GME-0003Hv-6V; Sat, 23 Jan 2021 05:41:43 -0500
Received: by mail-pf1-x429.google.com with SMTP id i63so5468691pfg.7;
 Sat, 23 Jan 2021 02:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UQOMtGdz0w0TywH10TJtkHuiebtl24nbFHb0UeqsueY=;
 b=SrFxQ9dTqZv0qxnrpOmx/VyXccUIpYyMZ5IdIhhoJJnatNlSDSr32a8znRuT/TxxH8
 ISuWbvKTWQzjKwJjGQXxfTjoydv1jXOsnIZ836Rmxuzq7nELQk6AF5zo8wN9i1wwqE2M
 34YIU+tySOizsSm3UlMOM1FG7I8a904IJ0r4/0MfAcjdhoocEmZ8fBiJMVqimQr5gC25
 k/0koWM3mrui5qCf83MjzJlKQ9biUuaNwW/Lg8JY/MbU+fV/nL6O6Q1qnotetwj6IYBs
 lxPneoXlNW6irQ4+o8Q1wqUJB0xZZsQC4F3CNGDJELNw+JqkbNfqNYgCBUDSUOOigFrL
 T2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UQOMtGdz0w0TywH10TJtkHuiebtl24nbFHb0UeqsueY=;
 b=PdRFjeeyx0vXScdZgN+7B3bFpIdYGvZGNq25s2r/G9TkMsVml8DMvWJkIhwAcnMqZx
 +QzT2NAV7ThsVacX5KjbBt/b+Ee4L16CgEkZsqgh/7FtR4UZZULBZtEifblbpzrkDCBC
 Gxbiy9DdRB2nH8T+Hmycxsp/bJKbiWXk6WCX5qZ1XCD2lOea8tikFr2x2KOLy7dQQZji
 ZRHeI5TWf+0zH/6ZkhZcnka0bwEsImKASByfQrxLtTpWGRAaEki0aC4ZwQy/wnL8kq6r
 LSVJ6BigZSoCrTLpv73qPCTW6+5IRMY7WS263qxcEVMGZlRxIVNmaupza7Dl9PI+BrPi
 Ffig==
X-Gm-Message-State: AOAM533s27qs16gJeMI6Y1NkU/3xz2th8IvYFwk2tz+3lRNlFpqv1THj
 YGqZiS9Sc5S6geNG9Jkf4xQ=
X-Google-Smtp-Source: ABdhPJweOxTuHixjpAcjy/UJR1o/OPBFsrB5R/wDESVSP58adBmk437l5rfR5h8zoQOhazxQ8fLlGQ==
X-Received: by 2002:a63:d814:: with SMTP id b20mr9054712pgh.202.1611398486596; 
 Sat, 23 Jan 2021 02:41:26 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:41:26 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 24/25] docs/system: Add RISC-V documentation
Date: Sat, 23 Jan 2021 18:40:15 +0800
Message-Id: <20210123104016.17485-25-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 23 Jan 2021 10:41:57 -0000
X-List-Received-Date: Sat, 23 Jan 2021 10:41:57 -0000

From: Bin Meng <bin.meng@windriver.com>

Add RISC-V system emulator documentation for generic information.
`Board-specific documentation` and `RISC-V CPU features` are only
a placeholder and will be added in the future.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 docs/system/target-riscv.rst | 62 ++++++++++++++++++++++++++++++++++++
 docs/system/targets.rst      |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 docs/system/target-riscv.rst

diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
new file mode 100644
index 0000000000..9f4b7586e5
--- /dev/null
+++ b/docs/system/target-riscv.rst
@@ -0,0 +1,62 @@
+.. _RISC-V-System-emulator:
+
+RISC-V System emulator
+======================
+
+QEMU can emulate both 32-bit and 64-bit RISC-V CPUs. Use the
+``qemu-system-riscv64`` executable to simulate a 64-bit RISC-V machine,
+``qemu-system-riscv32`` executable to simulate a 32-bit RISC-V machine.
+
+QEMU has generally good support for RISC-V guests. It has support for
+several different machines. The reason we support so many is that
+RISC-V hardware is much more widely varying than x86 hardware. RISC-V
+CPUs are generally built into "system-on-chip" (SoC) designs created by
+many different companies with different devices, and these SoCs are
+then built into machines which can vary still further even if they use
+the same SoC.
+
+For most boards the CPU type is fixed (matching what the hardware has),
+so typically you don't need to specify the CPU type by hand, except for
+special cases like the ``virt`` board.
+
+Choosing a board model
+----------------------
+
+For QEMU's RISC-V system emulation, you must specify which board
+model you want to use with the ``-M`` or ``--machine`` option;
+there is no default.
+
+Because RISC-V systems differ so much and in fundamental ways, typically
+operating system or firmware images intended to run on one machine
+will not run at all on any other. This is often surprising for new
+users who are used to the x86 world where every system looks like a
+standard PC. (Once the kernel has booted, most user space software
+cares much less about the detail of the hardware.)
+
+If you already have a system image or a kernel that works on hardware
+and you want to boot with QEMU, check whether QEMU lists that machine
+in its ``-machine help`` output. If it is listed, then you can probably
+use that board model. If it is not listed, then unfortunately your image
+will almost certainly not boot on QEMU. (You might be able to
+extract the file system and use that with a different kernel which
+boots on a system that QEMU does emulate.)
+
+If you don't care about reproducing the idiosyncrasies of a particular
+bit of hardware, such as small amount of RAM, no PCI or other hard
+disk, etc., and just want to run Linux, the best option is to use the
+``virt`` board. This is a platform which doesn't correspond to any
+real hardware and is designed for use in virtual machines. You'll
+need to compile Linux with a suitable configuration for running on
+the ``virt`` board. ``virt`` supports PCI, virtio, recent CPUs and
+large amounts of RAM. It also supports 64-bit CPUs.
+
+Board-specific documentation
+----------------------------
+
+Unfortunately many of the RISC-V boards QEMU supports are currently
+undocumented; you can get a complete list by running
+``qemu-system-riscv64 --machine help``, or
+``qemu-system-riscv32 --machine help``.
+
+RISC-V CPU features
+-------------------
diff --git a/docs/system/targets.rst b/docs/system/targets.rst
index 564cea9a9b..75ed1087fd 100644
--- a/docs/system/targets.rst
+++ b/docs/system/targets.rst
@@ -19,6 +19,7 @@ Contents:
    target-m68k
    target-mips
    target-ppc
+   target-riscv
    target-rx
    target-s390x
    target-sparc
-- 
2.25.1


