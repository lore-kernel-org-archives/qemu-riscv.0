Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gaNH0-0001HV-Eh
	for mharc-qemu-riscv@gnu.org; Fri, 21 Dec 2018 11:03:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNGy-0001Fp-B7
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:03:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNGx-0003zC-JS
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:03:36 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:40304)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gaNGx-0003yp-Eh
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:03:35 -0500
Received: by mail-qt1-x835.google.com with SMTP id k12so6182078qtf.7
	for <qemu-riscv@nongnu.org>; Fri, 21 Dec 2018 08:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=4TYxjnhCTB+5Qwi+14/0f8x5REAO9A6o+3y6lon1DYk=;
	b=hyI/xfwQXozU2u0A+Aw3RT3HE7veanQJmXPFiHJLS4nyY4nVcNOwIxUCW1jktHz6Y9
	aWHKx4RIUUiXJU2ZBAwDNGx3KmjkfiKhxcQRitEOm3X4TXlb5UZQqq0tlfgEOBOtlfHi
	G2mehWX4kDknZSP//HuQkXLoMOBJxavcFC01C3WaSE9SqGp5/zaa230fNNi5k+nOthUH
	ceg76sHAdnQ158f/Yy1AmEt0L3BD/3HATdFTevL3BDRG5KZnYbK2+2nA7WSattKiQU++
	Me/V70Er4SPLZUi/wJIeG4ucUFXSVwQikMuX+uH8eAFwJkp3MdJL2QZNqIK4Kt0daiVi
	StvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=4TYxjnhCTB+5Qwi+14/0f8x5REAO9A6o+3y6lon1DYk=;
	b=cEsrdWLVVoZsIpbgkS5k5nBSHnl/ju0m9m3tGY3YAF8W9lnsfMSWvfk0lFl8yotnuy
	a8QyuEGsLemoCTAr2XjiwJLcROrRJ+g7RD5N68VXsvr3aupnHEReKlqsaYmDSXeyvL/G
	sFJqSSgUnOgD7D9wmkB7QjxYFI/tEqgtWsYCz8lVXrqi78uwqwgQJhwLjeKbdxuwVvtk
	/sq8ihakmyDwgJvLrVOJUKqvvoseuUU4uZN4Uhi+SE0Zt/NWdzm1Wc/ko5QVQn8uoLj1
	yqmiFULjNZaVkrGzgz2TjF8EVzbvKoYuNUEVjvG5MaXavTMSWQoOjv1iW6i236rdg/zh
	tIng==
X-Gm-Message-State: AA+aEWaGBmG2rNsS65UOswjqJuefbGByylZ6Nbcz8QkmOG8lrxaDZRDF
	oCBXNf3xhvzEJ9RR8ewuP3XUo9u0Rv4=
X-Google-Smtp-Source: ALg8bN6XCNBy/aDFNVYsuEpawobRKRRAhjd16hEN6C2YwP9bctzpe/hn2Th7vrmTeU5lDmE+WejA0A==
X-Received: by 2002:aed:2d86:: with SMTP id i6mr3013576qtd.227.1545408214657; 
	Fri, 21 Dec 2018 08:03:34 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	x49sm8043873qta.89.2018.12.21.08.03.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Dec 2018 08:03:33 -0800 (PST)
Date: Fri, 21 Dec 2018 08:02:54 -0800
Message-Id: <20181221160307.14819-2-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::835
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
X-List-Received-Date: Fri, 21 Dec 2018 16:03:37 -0000

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


