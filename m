Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNlhg-0000JE-Nt
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 16:31:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gNlhd-0000Gd-7V
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 16:31:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gNlha-0001ex-0c
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 16:31:01 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:34709)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gNlhZ-0001ee-R0
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 16:30:57 -0500
Received: by mail-pl1-x636.google.com with SMTP id f12-v6so11738120plo.1
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 13:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=kKTGbZL7bN1GM/CR1Si/5nLh5T86DrU/+KfJ0CFSfOM=;
	b=NRHTo6eVE6EJYYoe6vqcgkRmYG46Tu4n2iwtRfpaykDHp1e9HbjALDVjsltbX8nVX6
	HNjBBESzeNxgMlJrf9KYNg3F5lCnr35/gbm9mAl2syuNRHHNRQQSoMRB2mDiOzCU14Zk
	zbWfLroieznE7Je9PZzQjylm9zR57gD2qQf4TyNbX9Bx+0D8gVs4MgVodsYv+0BdSPMU
	MK0JFpx9rS1yskfAsRLHmKrpS00LHQgGDe3b7K8wYNcfoLnwj5H/tdQi7/r9+SM0u5qt
	wMseaAlOMPJGj/62sf+3HQIKmFstGeLJ7cfnJRrwGvF0ZbyMQo4zHu6/8xQ92j05cxXv
	I5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=kKTGbZL7bN1GM/CR1Si/5nLh5T86DrU/+KfJ0CFSfOM=;
	b=R5haBKhQpKT6U0clHBTS0tk9Z+fxECTz6KSgg1KXzXSKcWXpkztr/YRy8fwGC4TUT2
	xQFUtv1gJUovvJSDZbx4jrAFb2EM/8QmFHmCnTqEwXACGL91L9jOE+c+vb0xcj+Z6zQc
	IgizrY4hLEzPOS3HugRezdkwaEx4UQ6J39ACWa/+uXt113A6fPz2jHYuDIuyy+LdQsok
	7zimFIeYdg3DeWa/BXNVkJW+Jkzr2+BqXp24jpEXUa+MYRjG4jzK7cFDIAJBnSvK8klp
	xHyv+M5kvJTCOQWVx+Yy1gYJUlRIs9CpWsxrKjshiVpREQhZAdFeymO2Q6UmUTLpYz2p
	g0Zw==
X-Gm-Message-State: AA+aEWYM4Jj3Nbv6nc7z0jTtsaYoYrdbmzGI9dHcuj9jPnZ8Ao7iqnJP
	tQslguvmLH2mrGCZT/cN2UkzKg==
X-Google-Smtp-Source: AFSGD/U3O8zofWxV1LRzF6zDSpHQNOjs7rz6rAniSVqSnya6Svhqd94XysJYee0tJpBfRGvn1QLwSQ==
X-Received: by 2002:a17:902:1681:: with SMTP id
	h1mr2188519plh.129.1542403856709; 
	Fri, 16 Nov 2018 13:30:56 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	w10-v6sm37168621pfg.1.2018.11.16.13.30.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 13:30:55 -0800 (PST)
Date: Fri, 16 Nov 2018 13:30:41 -0800
Message-Id: <20181116213045.19825-2-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181116213045.19825-1-palmer@sifive.com>
References: <20181116213045.19825-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::636
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
X-List-Received-Date: Fri, 16 Nov 2018 21:31:04 -0000

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


