Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gaNHO-0001fb-WA
	for mharc-qemu-riscv@gnu.org; Fri, 21 Dec 2018 11:04:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNHM-0001cY-Iv
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNHK-0004CH-JI
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:00 -0500
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:38312)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gaNHI-00046b-LU
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:03:58 -0500
Received: by mail-qt1-x841.google.com with SMTP id p17so6187660qtl.5
	for <qemu-riscv@nongnu.org>; Fri, 21 Dec 2018 08:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=s8TQWdfmNT9BwGooMFuCxfyNF1ywYtDH9Swp6HiUmKk=;
	b=HmnWOGrhMrl296xxyVHR+r175c/qLnVAdcPreioVdik2VoHJIT4bgodSzT5AQc+dIn
	FHr20ZFfc6xY1NM5pCHlVDfwGw5Lc9+tlC3jUV6GOa6mNtUZsQJYRKa54EMOFzo4po5R
	WyLcmqT4eeC7ycC0FkSeQmypiwJrjAC9NpSgCqf5Tt+ME9xSReBbJd0DTN+9XGNF9sl5
	TgRoqJsodZYkZKFn1CjmEgxQO7su2gatE9W2Q9+uK1iilvkkYoapajhtVUwRqMO8sbXa
	CpHF4XixvbwkJyHwh1o21gI+J1Ou2SkcAmk4Fhpa3cSR4TCcPjSq0gqHoca78/jy6fDA
	bM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=s8TQWdfmNT9BwGooMFuCxfyNF1ywYtDH9Swp6HiUmKk=;
	b=TtgZoOGtJj8SrKnBHaTuynVAmH72WyhVtY9T8YwEtPlh8y3cv4hGkNtb4MPUrRJUij
	+Z+rCkuhlmgErjbe2btwmbt1UNEcCYiTtja06qOKUbD7HX6AsCs8T+UKlnHp38WJg3/x
	mOttXInxVolfz34VKoEeJmvCH71bZnc/wqaLV2jPJg+Bhbdp6OjhfjgLuoILUg14NcB9
	6+fl16NENl8HOg/caOHJoLGK4H25qrpmdFXzTqdIxyWucyCyTSmKzlaA94D9B5QwPbXU
	ziOsBocsFXdXvutPRctnSKdJeXJFX38rdFPtjXmvABOjDv2SxNgdwUCxucaeypGF14Ka
	iEFA==
X-Gm-Message-State: AJcUukeUyaCZwGPRuj+UHHEqxsON9NXQVL2z0WXSjEZ/+UhusU2ppbGl
	oWXqV3kYTYFyoWThD4Nqw54HUycCfO8=
X-Google-Smtp-Source: ALg8bN6y1K1+8ngKd5jTVguehXr0Jqg/CjM30bnW8hLqwiIsKopWNTOgbH0Prpbah4/2+hRGWeUYTA==
X-Received: by 2002:a0c:f8cb:: with SMTP id h11mr3041515qvo.134.1545408223949; 
	Fri, 21 Dec 2018 08:03:43 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	o21sm6057974qto.18.2018.12.21.08.03.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Dec 2018 08:03:43 -0800 (PST)
Date: Fri, 21 Dec 2018 08:02:59 -0800
Message-Id: <20181221160307.14819-7-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181221160307.14819-1-palmer@sifive.com>
References: <20181221160307.14819-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Anup Patel <anup@brainfault.org>,
	Anup Patel <anup.patel@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::841
Subject: [Qemu-riscv] [PULL 06/14] sifive_u: Set 'clock-frequency' DT
 property for SiFive UART
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
X-List-Received-Date: Fri, 21 Dec 2018 16:04:01 -0000

From: Anup Patel <anup@brainfault.org>

The 'clock-frequency' DT property is required by U-Boot to compute
the divider value. This patch sets the 'clock-frequency' DT property
of the SiFive UART device tree node (similar to virt machine).

Signed-off-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 5c41ee5017e4..849fa2e6311a 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -241,6 +241,8 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[SIFIVE_U_UART0].base,
         0x0, memmap[SIFIVE_U_UART0].size);
+    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
+                          SIFIVE_U_CLOCK_FREQ / 2);
     qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
     qemu_fdt_setprop_cells(fdt, nodename, "interrupts", 1);
 
-- 
2.18.1


