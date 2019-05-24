Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUK4G-0005tS-8v
	for mharc-qemu-riscv@gnu.org; Fri, 24 May 2019 19:57:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUK4B-0005jV-N4
	for qemu-riscv@nongnu.org; Fri, 24 May 2019 19:57:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUJuV-00049a-A5
	for qemu-riscv@nongnu.org; Fri, 24 May 2019 19:47:40 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:51627)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUJuU-00046f-0J; Fri, 24 May 2019 19:47:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1558741659; x=1590277659;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=Afx3i4e+/e/6vVqAletdTzpjrs6vkjl1vDNfsdulAjY=;
	b=JQ6Ozg0pdlrtLcDrYdQAuH619iAtDRjuVKDrWnEIVnqChjgDZUBhhl1k
	TxNSRyiL2eWGie8RYQjYbAdFqk+5wny04Bf77ggTDRiiYg9lILoxQVAUj
	0q248wq+U7bOF8iqJJNWcpHPAM9K9sR4gvEKM6+XzZzhkH627GiWWICXQ
	FWGj/6n1XDAFidxZC+4rbuQrrjhh8qCj8WO5/l2FvXW+KarQZiPs4IEz+
	4u2PSqLLr1PX1Ww/JMOgHIhX23duFKlMXPWhjbT6+MC/PFFEx0J6GM2VV
	TTzgfuta0CBnSsiZljhm0jpCbgtclhFrGn9QenYFe7uM5R6Zg/rU4HPt7 w==;
X-IronPort-AV: E=Sophos;i="5.60,508,1549900800"; d="scan'208";a="110307754"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 25 May 2019 07:47:33 +0800
IronPort-SDR: FkAcRe98pwH2icirvF/sqLrqcGL3aUBrt2xK4L/Mg8Itw/EfsLZPnbq4UZdJH/D5jlH9Ha+Ob8
	Q7J3ix3tLTLNMgMvIRtGQyw85RVbES6yDGavDF4uX8IaopRDKu4cssj9mlNp3132dutXICawE8
	4HT0si9SAYkGb12nPMk7awv+H6gbsVk8lBrsBwg81KgKYYqYpun0rcHmmV78lTBUGHpKkKyNiI
	dwjfQ9DJpXylPBJV914cdv6T9pfmDZOPKVXu50prpk+bMBHcvZ8cmIweeNqURVF076rQhpGxsK
	Ys1+Lxqc/2Dyh8u8HNnB/h0+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP; 24 May 2019 16:22:51 -0700
IronPort-SDR: 5TTr37oCle647gG7iHm3tJP6HuZTxzsH0P3pNdgd7kiL4NzQ5I2gMsk5ZbaA7fi4u6rU33ijul
	jEjh5QAyChG0mMEfaTMk/S8BkqnQJluA9vihsgbxK6Kr2eecB2K5h3eoBM0myLDzHF0fDUL5lA
	1vj+deQ5VvSRDXZZK23bleIF9gzsdkVgANa8G0CdKmk4Qa0xOp4fr+bDN2Og21oPKSnZtU7ynB
	2h1fAmxC2e98c63b7LdoXU6u6lcqs17xjB7WhdqJMQdeInhpfwxOwBhui0eFx7QisJpVsg2JJK
	q5c=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip02.wdc.com with ESMTP; 24 May 2019 16:47:32 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Date: Fri, 24 May 2019 16:45:37 -0700
Message-Id: <5b489a8f97b84a7c1b428b9deb2ceef2f04a8de6.1558741334.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1558741334.git.alistair.francis@wdc.com>
References: <cover.1558741334.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [RFC v1 01/23] target/riscv: Don't set write
 permissions on dirty PTEs
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
X-List-Received-Date: Fri, 24 May 2019 23:57:40 -0000

Setting write permission on dirty PTEs results in userspace inside a
Hypervisor guest (VU) becoming corrupted. This appears to be becuase it
ends up with write permission in the second stage translation in cases
where we aren't doing a store.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b1bee3d45d..872835177a 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -326,10 +326,8 @@ restart:
             if ((pte & PTE_X)) {
                 *prot |= PAGE_EXEC;
             }
-            /* add write permission on stores or if the page is already dirty,
-               so that we TLB miss on later writes to update the dirty bit */
-            if ((pte & PTE_W) &&
-                    (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
+            /* add write permission on stores */
+            if ((pte & PTE_W) && (access_type == MMU_DATA_STORE)) {
                 *prot |= PAGE_WRITE;
             }
             return TRANSLATE_SUCCESS;
-- 
2.21.0


