Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gaNH6-0001Ku-94
	for mharc-qemu-riscv@gnu.org; Fri, 21 Dec 2018 11:03:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNH3-0001Ju-B4
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:03:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNH2-000448-JV
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:03:41 -0500
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:46358)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gaNH2-00043q-Dy
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:03:40 -0500
Received: by mail-qt1-x829.google.com with SMTP id y20so6153773qtm.13
	for <qemu-riscv@nongnu.org>; Fri, 21 Dec 2018 08:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=aoPFhjxbUzAVpTh1hLfCGhoB6tdZHAOMkudTaz85aXg=;
	b=btqNQf8pAxtRoVb0/AYmDzQTEp1953NAShlBsgtEVF1f16ssAuDNtJZPcBcioWUNOD
	Q3KTZR6M5YkeFi2IJ8zNjXgNr+UG540466LUKnlrlB64rOP1oYwHjUw5BhknpMZy5p5R
	yzB55cvVEidAN29g0GD8lZo7oSCBXiCMPx17VXUpZTqkxhP9s7TQPWudncD9LSSG5Jk1
	KdvsB4GJCZ+Oe4EdO6iXeR9x0S23V+tzOS5uWO61TyMANOQkquMaZfC//XJQIu9PT69R
	x2+hCCvJ9J8BCpknq5Lw5CB+whZIvmQfxO8IIxnEAAd+Xam0lkeFBM2jhYZ4GNhvti7D
	Y/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=aoPFhjxbUzAVpTh1hLfCGhoB6tdZHAOMkudTaz85aXg=;
	b=FXxThJZ9toJbkPeSGR9u+Bye+RPe49YE93WEFivuRXCcDyu+kJs2IZLSyezuwoZLv8
	BIhNhDd2AqUxZEkmVLwV/H+I7dMnnRYdiei2Wmbowh3r5ket64dZS1+FIKkLveBWBt0I
	qSovNU7zIakGSpeq6DtZCbn9rtYwTrR400g5BycEMUglJ0tUvne6gfArav24lb4pEtKn
	NmBW9jZbQ3F6TGqetm19g2st+wHe8qY+yDzVm9x88tafSMXmMO01P5Gw2wSjTJ0nbNzm
	B2PAIrNqZu1wRat+EuFReCiqg2X3mAr2O7IYPxPN46YmKDc7iD1+WJs03fxj4hxwA96K
	dCQw==
X-Gm-Message-State: AJcUukcNE8QOsKRDqYRFoEqy00nAqhbA0Ng+S876f/y+TcIW17lNCl/y
	iptbKDd/aeJPW+AcHoau69bCkftls6k=
X-Google-Smtp-Source: ALg8bN7DCwAyAuOeJ/zehciR1DWiClbUrmx+uWx53Bw31G97k2oHFivd1vAZpyMRoLNRjun9CRE8vA==
X-Received: by 2002:aed:25a6:: with SMTP id x35mr2939233qtc.228.1545408219922; 
	Fri, 21 Dec 2018 08:03:39 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	k189sm4685865qkf.64.2018.12.21.08.03.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Dec 2018 08:03:39 -0800 (PST)
Date: Fri, 21 Dec 2018 08:02:57 -0800
Message-Id: <20181221160307.14819-5-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181221160307.14819-1-palmer@sifive.com>
References: <20181221160307.14819-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::829
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
X-List-Received-Date: Fri, 21 Dec 2018 16:03:43 -0000

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


