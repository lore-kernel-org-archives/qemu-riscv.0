Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gcCrD-00043v-Lf
	for mharc-qemu-riscv@gnu.org; Wed, 26 Dec 2018 12:20:35 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrB-00040T-6m
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCr5-0007lc-Ji
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:31 -0500
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:36326)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gcCr0-0007dv-5k
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:23 -0500
Received: by mail-qt1-x829.google.com with SMTP id t13so17843703qtn.3
	for <qemu-riscv@nongnu.org>; Wed, 26 Dec 2018 09:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=4TYxjnhCTB+5Qwi+14/0f8x5REAO9A6o+3y6lon1DYk=;
	b=So9WPYCc2zTljU0PrR95/cW9Gy0sh1cerObXIv486wxr5OpSVNbMpY1xn4ADKx7wvi
	M3swfI0JxVLMahZiQ7KTXR1jp0RWYLFeev/PcWcy901kFfDhkC/Z86xN+TzLx0Wvrb0K
	KW5ClNleJI584/mrDORWnRWiinap1tQ+JYQC/0FajpLko7BbE+3aWm6TRF1feRD62vDJ
	x8iocbGhN+yyYfgYHDsA0NTfz+/Ne+Ovim+WgEsuN+wIQ1Y0XFVEM9scAX1felXekwoJ
	OEgUtvIUz3dVZ5Fb1Ui2dqHYoJ9NfK+cgNW+7roa7787RTZVklkuGsbx2wvwJdJKV6EC
	DYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=4TYxjnhCTB+5Qwi+14/0f8x5REAO9A6o+3y6lon1DYk=;
	b=KvJdOutRveLvZui7fXvWfiy97u8eEz6vq72bKlPic2aBcSVtoCr9WOSJK8tspFzUvm
	YfNb7DJgNYrQfbbMqB8JHJ62nI515gt2qQBLwqjY79qDIPhFVJZ0FzbqtUx5/DHT5fut
	GusvcNPCTUcEp5UcF8E/gus3dFgevaEfSYhoTjlrUBNhBPbyGS/Q/+QQPjA6+3q6kLZp
	zSPckILFKn1gQRuV/JjMcHn/qHuxkfEHpG75BtBm2lHcL4tLzMBVPU4LEtZ4klaTbf9z
	yOPdvmxgKUGLSpRXs70C5ne1bZRLLSVzDMGd3Tjm5KwDx82WM3+eWSabwpYGbnG07U46
	TBMQ==
X-Gm-Message-State: AA+aEWZSgiFBvAtiuss+MKMlb7SKSZUCub5G7Q2eCpmQivP/y/KK8XZN
	VAELbuG3/s3Y2cRHHo0GPB/ckIAQV1o=
X-Google-Smtp-Source: AFSGD/VKarqaREPrTmMixwxEn3EWqghsDScWazu0Y+kG8tonJHBgofFpw4u3byAIomEZGg15MN61kQ==
X-Received: by 2002:ac8:5053:: with SMTP id h19mr18824810qtm.280.1545844815547;
	Wed, 26 Dec 2018 09:20:15 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	t33sm12895585qtj.76.2018.12.26.09.20.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 09:20:14 -0800 (PST)
Date: Wed, 26 Dec 2018 09:19:52 -0800
Message-Id: <20181226172005.26990-2-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::829
Subject: [Qemu-riscv] [PULL 01/14] hw/riscv/virt: Increase the number of
 interrupts
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
X-List-Received-Date: Wed, 26 Dec 2018 17:20:34 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

Increase the number of interrupts to match the HiFive Unleashed board.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Andrea Bolognani <abologna@redhat.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 include/hw/riscv/virt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 91163d6cbfe8..2b2e6dd4ea6b 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -45,7 +45,7 @@ enum {
     UART0_IRQ = 10,
     VIRTIO_IRQ = 1, /* 1 to 8 */
     VIRTIO_COUNT = 8,
-    VIRTIO_NDEV = 10
+    VIRTIO_NDEV = 0x35 /* Arbitrary maximum number of interrupts */
 };
 
 enum {
-- 
2.18.1


