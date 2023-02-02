Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNRap-0004j6-Fq
	for mharc-qemu-riscv@gnu.org; Wed, 01 Feb 2023 23:53:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRao-0004hg-5d
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 23:53:02 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRam-0001GA-C2
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 23:53:01 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 nm12-20020a17090b19cc00b0022c2155cc0bso693592pjb.4
 for <qemu-riscv@nongnu.org>; Wed, 01 Feb 2023 20:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wrl2m89lEAGIfGV2TcX0lvKgQ/GFCS1PkOc8cAsKOcc=;
 b=ENJfSqyiOs/xHzNdrpDyYW9VuaECJ7Uja1X/i4u3UmwN6392J4ofxvJGBK3Q2Bc1TQ
 xAVpMI0qFu6HeVbFNSSiGgJ/JuvbsQ16Q8+p9/h0E3AsgdQX2pk7RI++y6oYG5gi46XK
 OV2NVEJckBOl70YtsBLV9Qeyi20tYlHR43KXIT05rydsFe7s3XYBlCW5B7NV2PTNVIP8
 rnKXFQCsH6rRI6WWN5oa7hHrUfDuH+hm4ISz10KJDm9hnao5SZPzK97tEbraeewmi2eP
 xdAHhWi3mK7DO5WVxKHklu7jKfJS0pnv0IiNvdBT7QRQRIPYhaoF4bj2E7Xtyu8qcVri
 ElsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wrl2m89lEAGIfGV2TcX0lvKgQ/GFCS1PkOc8cAsKOcc=;
 b=C7zBK7Gp4rC4weEJQwkrBtyaNQ51mpYfikhQzv2S+q4sytYLN/2fCyIdmg69GD+S29
 INHs+Gw0FJBrZmRSzLxEldjaCKDYXZPpBLvzVenzL4ABEMzPiws/dJjq/I8GCJAceKSD
 A9GIy+Zvuae7LDCcsBHkSzAteJLLyFA7rDjMO7cuW6zRLAbyvAURsIKkMpfRsGfHknPv
 J2EBq7vGA7PiowJPmfgjEuohF2CVikmmQ1UyjadVaGHfD2nSyFLUkgI+O48NUP78vsqI
 1YcjhF2oKriMU+NSm+Mj3VdZNjioaHrPqaWq1FnOqNPRcv62iO7wzCGEJiT1OplbxmL6
 xUiw==
X-Gm-Message-State: AO0yUKUs67HIY82xkaWNTZQO/nPqKAZMJakd3dinX5QMLwWfXeLZQHKK
 EqgB825VcjQt7cepN27iPjuyyg==
X-Google-Smtp-Source: AK7set/SKWOrh0KM5OPBb1hZHg3TX3DeVNCwuDrZZWJzw5ilP0TO+0tBrPd0Wn0mmbumPwt4BkTUfw==
X-Received: by 2002:a17:902:e192:b0:196:4e0d:7eb5 with SMTP id
 y18-20020a170902e19200b001964e0d7eb5mr4038272pla.35.1675313578860; 
 Wed, 01 Feb 2023 20:52:58 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902d70a00b001965540395fsm11222265ply.105.2023.02.01.20.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 20:52:58 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 10/10] MAINTAINERS: Add entry for RISC-V ACPI
Date: Thu,  2 Feb 2023 10:22:23 +0530
Message-Id: <20230202045223.2594627-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 02 Feb 2023 04:53:02 -0000

RISC-V ACPI related functionality for virt machine is added in
virt-acpi-build.c. Add the maintainer entry.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c581c11a64..23fcaaf54a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -995,6 +995,12 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/virt-acpi-build.c
 
+RISC-V ACPI Subsystem
+M: Sunil V L <sunilvl@ventanamicro.com>
+L: qemu-riscv@nongnu.org
+S: Maintained
+F: hw/riscv/virt-acpi-build.c
+
 STM32F100
 M: Alexandre Iooss <erdnaxe@crans.org>
 L: qemu-arm@nongnu.org
-- 
2.38.0


