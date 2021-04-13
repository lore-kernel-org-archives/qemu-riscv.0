Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lW95c-0003AU-Rs
	for mharc-qemu-riscv@gnu.org; Mon, 12 Apr 2021 22:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lW95U-00037f-CE; Mon, 12 Apr 2021 22:47:38 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:21351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lW95N-0002cF-II; Mon, 12 Apr 2021 22:47:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618282049; x=1649818049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bAxzhW2heL1O/qeLTh6rWsqzlTWl7MNh1NZ6zHObLQU=;
 b=bYRhUdICmdr8DUyuq92OMR0P8EuJ4sM4mCaMWFwsBe6R/GuSi0wXPHP5
 HwO+3K0hmw2lbnJbseMN89fWauZDHr7vAR8c76foNIQI46dQnY1tRfs/6
 ZAUfqpBNWCiiUhbFr+eoG3FcisvXCYM+EGHd6iBSio+IYwt8cHI047OKr
 pfSQy4NX5IjlwkUqF8cU2svpBAi07g/t53NybxLBKX1Uzfd0CJxFpcFb8
 L7kyshqt/i2Qi9CA+5e3SihSbBc+m6Rol1bgIWU0YGa1J+p5D3Jc30Ngi
 x4RpvlM2IvYzhaiLvWvZR3FGA9FlHMhfJbphL1soU7BCAiZ5fVxVQRD3l Q==;
IronPort-SDR: AH4QSFH42CH/1Xysp5/jB/co/WoKxig+BotTClbVAm33I9HfGfssye1J7SwCl7VMN93PEvcgy+
 LkrP9gqhwppOXGsq40WSrVpPpkr3PqOHj14DST/WNfwENQ/nTJVJwQpQRApzeliKe9+Evl6K8P
 YzEBuW60k8hscT/74bOR6JZ9pCbTtMD6sC/YR0tOCDrHOV/bZdXayhTe4xrpPgKOnkZ8VbleHB
 JWM5IWqJL28Vk/s1qCuZe5SY4Z66XS2fS568p3Pv6hLWxdMMblRL1Wf+PxS/nGrOHzyyQzxo7e
 08g=
X-IronPort-AV: E=Sophos;i="5.82,216,1613404800"; d="scan'208";a="164557096"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 13 Apr 2021 10:43:21 +0800
IronPort-SDR: u28QQ3kcW/F0oCB+Wo9qsZS6GthcxvEqM8V5yl0dM537SrBfTlLYFOFwArFYd8EbFCiUjFfYqN
 R5qhrlTuPTC0emPz/ejA+bVRIV3DvbELYLnIwj6DCUfENPpUASlWnI/Pq36JqVaEhCFaiEOrJM
 X9sG/jDBkbO/YJADDU8wv4EwJtxiz9DNiBtRjcO9tT3sNSNpK6zgiUbXw5s5CTEmzhoW3Mf474
 PyMxEowgltEIi+xGAbJ4w7UFNIjvznAfnQEml6yZSKWyMIDr62B/F2Cqw8YiHIp7cMRTI2l5gR
 tKu3qZ8fVDCld0ooJT/xeUI+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 19:24:23 -0700
IronPort-SDR: fPQQwefFuXXUiewmv/K5LlmpihJJJ0Uqzw2s7P42TtAHG3cgWU1EO5KJDrWxvrkujs+F1lv1bB
 Vo9SD16gRIZpqqQS3no2M53sBmFau9H5ZOjtAuO5zNlikvV6JBaaYHUpELSoMaERZ9VUiAkACC
 oUIRj1VAgRjArl440suZ4bSAu3HxROxDeDPgrFa8iKwSByUvDUB0fO9Bx9IoPwksLAhrpv5lA+
 J6W3gB9jnzIUh1x/Q3XkXQyb8QoJp87haKJ/sWOnt2ihCbzzmRUfxvZLWyuWusG20SOSqG6pIb
 2ZQ=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.16])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Apr 2021 19:43:16 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 8/8] target/riscv: Add ePMP support for the Ibex CPU
Date: Tue, 13 Apr 2021 12:43:08 +1000
Message-Id: <01a14ca289ed6ceb87fdaae61e4689937244518f.1618281655.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618281655.git.alistair.francis@wdc.com>
References: <cover.1618281655.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=730c0c5bd=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 13 Apr 2021 02:47:42 -0000

The physical Ibex CPU has ePMP support and it's enabled for the
OpenTitan machine so let's enable ePMP support for the Ibex CPU in QEMU.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 66787d019c..4bf6a00636 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -202,6 +202,7 @@ static void rv32_ibex_cpu_init(Object *obj)
     set_misa(env, RV32 | RVI | RVM | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
+    qdev_prop_set_bit(DEVICE(obj), "x-epmp", true);
 }
 
 static void rv32_imafcu_nommu_cpu_init(Object *obj)
-- 
2.31.1


