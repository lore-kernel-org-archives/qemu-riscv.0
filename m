Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUqAF-0001Ar-0t
	for mharc-qemu-riscv@gnu.org; Fri, 09 Apr 2021 08:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=726c96411=alistair.francis@wdc.com>)
 id 1lUqAC-00014Z-Rm; Fri, 09 Apr 2021 08:23:04 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:34671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=726c96411=alistair.francis@wdc.com>)
 id 1lUqAB-00019E-0n; Fri, 09 Apr 2021 08:23:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617970983; x=1649506983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KkDjpKvdbSqWZYz4gimKn3z3IypB+PZxsPks2j19z+M=;
 b=FLMKfYSEjgxNHkjChurFrlg0RoB6XfuToAH/4GFKAyEIHQgBmQ897iGF
 RNV0rxLzciRmNp9njUJUtArFXDqCGmBP3qhoEudJPV5D089F0IYG3dLRI
 vRUmTXBXiDlpQnave+Jq8jD4FGLuaVuu7rcQR3SdQOuL2+fdFvCn+lgjj
 Tp4427oR/Bb47XYvk7I9ZOVW3M2OdRsiqkXFnt2U+ObSDFdS2gv9YRYYN
 iWqKhOJHYI57LbcMsZ952nB2HlPvNBVaygK+EvhsZ1cY+ofqAX3XNBqVc
 H3uKRoSIUirUKs2sTOD3HK0ZXBBGIpl5Xn9D1hQCAP2eIoWGYR9oUzwOh Q==;
IronPort-SDR: ncPC17b466AKcz+ZGktNSVpXVsuxJ8GFgO8Sxj0VTB64z+RUM8DiWCjNP04j1LW6Tno5c+d79Z
 aI/XwVCC9S19MczlW0JMRNdvnzg+nn9s66kzAny2WrBBFVJnA8WVRiWvvvmqiYbSz8X9b2plCb
 aNETpC3Rlb+9B6mYG0tXcQk94aD5BUZ1na6fE6rRLoCrpWoJcGWhFMrxJ+Nz8PTVQ/7P6HJzyo
 R60QBBCfIm2GV3GmrmSGNjxeS0ptr0IRF3pen+3RQchZ9xFNJfsf0xqDLERTmj0F3mnCTocBh0
 F4s=
X-IronPort-AV: E=Sophos;i="5.82,209,1613404800"; d="scan'208";a="275175998"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Apr 2021 20:23:01 +0800
IronPort-SDR: pzePf3DuZ4MVLcfdGfrHSho59VzxcCzq/Z62xeBU/wVUI7HFHeL8L8a/TGFS0C3UmYoaC9ptPT
 TBHXblwBdtopbjDsx2gmX+d/6al8KPcsL48Q24Jb9LEvkO39oLSi80erjlJF2Qg8l4R+pEX+6O
 Ps6hhWOGxsn01XIefp/bDuwu5myjFDoB5kjRFNQwB3SLkG88NkdSPCgciKYf58gmLL1XPOKc6w
 4YHn8/IfPWcfCBBmzWApHllrj7RxKak0NwTrdX7YOciZrWkVNkJnO8hdos9hBBSaF+8vnWLrSU
 e5oQj2AuSkFSivEdzttCbyvA
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 05:02:36 -0700
IronPort-SDR: 557gYMeZ0DEp43yQ6v+cbOk3TQNl5y7VKhBFJQiPEkeWBmShyEG4/fK1ZNDon+h5Br7jPcH86T
 W90eaPuuQsNaR9CnXg1jp3YTm8WSYQkAW/cDmqWmp8av+kFqmP734nAnl2+8G5q8/a5RHODYdB
 7B/lNgem7zk2lqsy0JEs5wIYd7RLuvT/pL7ceHNA8F+9o4QDJOxOyVX3A9vq8dDfi3mvc+wCww
 wBENuj8PG3WfmA1Yn0dKck/MoUhANVlCbMygbz38bEavdGhyeuyngk7MvkXPWPdlXCfeMeIL/0
 M6Q=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.98])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Apr 2021 05:23:00 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 8/8] target/riscv: Add ePMP support for the Ibex CPU
Date: Fri,  9 Apr 2021 08:20:58 -0400
Message-Id: <9bb6c290fe33b23bb7ff5e650661c74fbb38d90e.1617970729.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617970729.git.alistair.francis@wdc.com>
References: <cover.1617970729.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=726c96411=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 09 Apr 2021 12:23:05 -0000

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
2.31.0


