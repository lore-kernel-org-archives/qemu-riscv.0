Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gcCrO-0004Fa-Ct
	for mharc-qemu-riscv@gnu.org; Wed, 26 Dec 2018 12:20:46 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrL-0004Bp-Ej
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrD-0007qh-QW
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:39 -0500
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:34798)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gcCrD-0007hP-IE
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:35 -0500
Received: by mail-qt1-x831.google.com with SMTP id r14so17897341qtp.1
	for <qemu-riscv@nongnu.org>; Wed, 26 Dec 2018 09:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=aoPFhjxbUzAVpTh1hLfCGhoB6tdZHAOMkudTaz85aXg=;
	b=a9fyvOqhxNRoR5gRRySx2jZCs7uB7JHR94WSLtcoSfx0pcHKubMRd6gNXkQGBKGtUT
	ytPrbfPHv7ZjJu0RHnR9iWiKX1AkYBXZgGCS/WeYdJSS16p5LQxUd5Eg+0r5oc0a9XI1
	ziSQl7j23iT/A6tnjoZh6QDhW+PxkDuoYaW++ZcYLFvfKEMtdwy7FT8mSUTz5IkGrf2e
	ioABCDuZaYiOv/76qGj6e8U9D4OJLcjglTp/pt4Pphc/cgsq6SBBeoG01LtRzi6jpc7c
	wSai5QqdbjxdfquASQB4Tm9z+kMZb9Jjakgx5VO0YObCes9kgfy7NGgEy0YGLQmQ7IIs
	w14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=aoPFhjxbUzAVpTh1hLfCGhoB6tdZHAOMkudTaz85aXg=;
	b=sHHwixVqM30fYm7KZi31VBmfid1beKzCOmBrSTkR2pAk2AzZbIkEoCjFkp+xd5rCto
	cpG5oIBZ3cvseiE185Z318h7KLS8/GIWjiDy84st85h9IYPizK4t+BZNBHuALsL1BhxD
	NFBAbPC21jkTw9Sf8GVW7BV3KbQltXTXHzCP3sxd/tnwW5pPACzOtO458PoaxpchRKHQ
	jDH7RA1RB9OKp+rYQUizm7eu18aizZFlQ4N7domzCWK8enkC96Ysbk+M6iGV6o/1HFM4
	0jaUXeMBig0ps8fXyGZvDv0wv2zczhb2u0uc+/fs5x4ZSI4nvHXTLirhUQY/6z/l5e3f
	6SUw==
X-Gm-Message-State: AJcUukcYvGoE/B6xScJF6cIOxxPj8Vb3ALdpnubNz8KiAXOIEp3TeFvZ
	wO+RKq9VxZi0Tykg5RFaL9B5gTe2WyU=
X-Google-Smtp-Source: ALg8bN6GNpfOsMBrId2R8ngijf2X7V6WB6b+cf34hhrN5qTtd3NkeOxDP+QqSfBiSYzYCTIbQ3FJng==
X-Received: by 2002:a0c:fb4c:: with SMTP id b12mr19182997qvq.177.1545844821403;
	Wed, 26 Dec 2018 09:20:21 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	q38sm12782813qtj.65.2018.12.26.09.20.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 09:20:20 -0800 (PST)
Date: Wed, 26 Dec 2018 09:19:55 -0800
Message-Id: <20181226172005.26990-5-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181226172005.26990-1-palmer@sifive.com>
References: <20181226172005.26990-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::831
Subject: [Qemu-riscv] [PULL 04/14] riscv: Enable VGA and PCIE_VGA
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Dec 2018 17:20:45 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

Enable compile support for VGA devices. This allows the user to conenct
a display by adding '-device bochs-display -display sdl' to their
command line argument.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Tested-by: Andrea Bolognani <abologna@redhat.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 default-configs/riscv32-softmmu.mak | 3 +++
 default-configs/riscv64-softmmu.mak | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/default-configs/riscv32-softmmu.mak b/default-configs/riscv32-softmmu.mak
index c5ea36cba597..dbc93982848a 100644
--- a/default-configs/riscv32-softmmu.mak
+++ b/default-configs/riscv32-softmmu.mak
@@ -8,3 +8,6 @@ CONFIG_VIRTIO_MMIO=y
 CONFIG_CADENCE=y
 
 CONFIG_PCI_GENERIC=y
+
+CONFIG_VGA=y
+CONFIG_VGA_PCI=y
diff --git a/default-configs/riscv64-softmmu.mak b/default-configs/riscv64-softmmu.mak
index c5ea36cba597..dbc93982848a 100644
--- a/default-configs/riscv64-softmmu.mak
+++ b/default-configs/riscv64-softmmu.mak
@@ -8,3 +8,6 @@ CONFIG_VIRTIO_MMIO=y
 CONFIG_CADENCE=y
 
 CONFIG_PCI_GENERIC=y
+
+CONFIG_VGA=y
+CONFIG_VGA_PCI=y
-- 
2.18.1


