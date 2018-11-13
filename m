Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gMiT1-0003Ww-7e
	for mharc-qemu-riscv@gnu.org; Tue, 13 Nov 2018 18:51:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gMiSv-0003T0-25
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 18:51:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gMiSq-0006aC-Qk
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 18:51:25 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:39711)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gMiSn-0006X7-8k
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 18:51:23 -0500
Received: by mail-pf1-x42c.google.com with SMTP id c72so2207279pfc.6
	for <qemu-riscv@nongnu.org>; Tue, 13 Nov 2018 15:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=kKTGbZL7bN1GM/CR1Si/5nLh5T86DrU/+KfJ0CFSfOM=;
	b=HlwJOR5uMf5hw4ZyhgM3liloIvu1g+Uncz+igpbRUYWKlBEbPdOeZeDhYjq5pQVFih
	eN+gBXxn6Dczz8j0Y8s24TsIA1LPVwLEBlpn0CG07U1sGe3qduOOv+e5i74QFgJ1tDiU
	n8sS2kHnRSuUGVkeecapSj5GenBu+CnGL+0rD+mx7HUcHzP57aZtQJsYCOlG93ROS3b6
	BcPqleR/zcwfV/ORPF5szvqEWO1QOdlPn24Ft0SFBjM23IR8lHvWrxLntl20Hxd8YtG6
	MgU0rEpT4jGzRvnWQ0Oj+OaxEzzDoKKNyMv1A+VJuxIQDQ4+4AE4OmEfVBwVDsG0Dqgj
	plNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=kKTGbZL7bN1GM/CR1Si/5nLh5T86DrU/+KfJ0CFSfOM=;
	b=giGHFi9ONUqcvp8jz2Qo7/WzQaS8bsky+/fnV0JUontcLeg1ae+S4OrMWBjusk0uZf
	SBhBcy2e8UtGoXrWSkX3NVeyhKYyac2KR9bihMP8OA25wZhvIQY1tKFDQc6/lS3Wi8Qv
	hsTIOBSS+aljDmWL1cD0jUSNltE3ZjSyDM2KlMMdz6XC9sLlx4oEXiLK3avNCx/UXT5r
	etVLpNAmCccUUDgoWI777MXaJ7T6sGffwdLZloHPZKPcYjOeKeMl13ISwfcqEAVuR1F0
	+nwcGJXPSsd7GZ9ywLN9RLJ8W1PzHhzB48xEvdTlDoWiXUJygZLHBkflwbCXTRYI1giu
	q+oA==
X-Gm-Message-State: AGRZ1gIK40xmScdgQgTPDcfs0N3k6zz7S87ej0qmVOQP1zYil2K2ImmP
	RX2ZzMnsVJuIYWPR+bM8+n2lMw==
X-Google-Smtp-Source: AJdET5c4hBzB78aEtyVon7fZ3Iw+bePY0YCmb1T+lwtl7UIWa2a4RguviLa2bcOZpbxqf67FNln9vA==
X-Received: by 2002:a62:401:: with SMTP id 1-v6mr7088968pfe.156.1542153078569; 
	Tue, 13 Nov 2018 15:51:18 -0800 (PST)
Received: from localhost ([64.114.255.114]) by smtp.gmail.com with ESMTPSA id
	c14-v6sm24420708pfc.92.2018.11.13.15.51.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Nov 2018 15:51:17 -0800 (PST)
Date: Tue, 13 Nov 2018 15:50:42 -0800
Message-Id: <20181113235045.14155-2-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181113235045.14155-1-palmer@sifive.com>
References: <20181113235045.14155-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42c
Subject: [Qemu-riscv] [PULL 1/4] hw/riscv/virt: Free the test device tree
 node name
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
X-List-Received-Date: Tue, 13 Nov 2018 23:51:33 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4a137a503c8a..2b38f890702c 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -240,6 +240,7 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[VIRT_TEST].base,
         0x0, memmap[VIRT_TEST].size);
+    g_free(nodename);
 
     nodename = g_strdup_printf("/uart@%lx",
         (long)memmap[VIRT_UART0].base);
-- 
2.18.1


