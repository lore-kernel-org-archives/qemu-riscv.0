Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l9IVJ-0004qt-5u
	for mharc-qemu-riscv@gnu.org; Mon, 08 Feb 2021 21:11:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=667b40a3b=alistair.francis@wdc.com>)
 id 1l9IVF-0004q8-Rg; Mon, 08 Feb 2021 21:11:45 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=667b40a3b=alistair.francis@wdc.com>)
 id 1l9IVC-0004q8-M3; Mon, 08 Feb 2021 21:11:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612837580; x=1644373580;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=be+p1+1tPCPjFu5957n73qyTdlQbqYCeV9NRPv04YOg=;
 b=WTtOXBQaLzdpsny4XZAEI0nAOq0+7jRHetRdEkn6nfR13SEmmcg3CxmI
 YpvA23QPwNSruJ2S9hi5RDmpmBSOkKo4jf3+B9llhSmR5s+05rMMCnMJH
 qt27OjuJQUqurJIsX5CbFatVLV6eOzbKMZp4IW3Mzz5RANzPKtLwys0BV
 SZ31DiAs5Ipo8x+43/BsxvYuIj/SJNcNEytXA6ccO4fzbDx9/8jBee4Wy
 JiI5WJEMWRcgtM86uQ2LFHCLI16bh74U3zExDfh30ggPSjf/cc+QZFCkX
 1VUM1ZMNjH3YrSu5smrlF5UUdIYT3imykWZBPIK/grA4CWcR073I7/0lp Q==;
IronPort-SDR: C3MuEofHVaUNNSj5mDdwheYaQkhr/2yOdu+lUdDOHxo1GR7dVToIWUOMGQWrQju2sLTlguDnjc
 XP5NIydRQa7XUQBO1gfvYzw4OSYADV91zfuB76OCEA5VZS02Lui6vKcOKkdY7YkVnN0xtJuVJ2
 l63VQxsimpI5xPO4cXJSDb44GImTFnaIHZGgjf1LHgJdn2/s7ARcbUaIlNBs2nCE3hhJjTUbD3
 pHIj+UH5PGgncfqHJoqCp5pEA6GnhabapjMqm86LNPrR/oTvWUtjfM1X5wTimxltLxClhdMA3O
 fiU=
X-IronPort-AV: E=Sophos;i="5.81,163,1610380800"; d="scan'208";a="263605823"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2021 10:26:16 +0800
IronPort-SDR: hjB19rv9yJ3JNZ3y4Wl0MIuIHrwTmXjFcm9rRSVj1nkHR+wfAnM4mdqp3yWHDYQCLUD/4uFfwn
 LM7FiLW74i2PKRn1b9cGEn3en6NJe5gGyVMuuNWeyKxqrGfA2Ppr6b8EQUX4w/n3GqQBBZBLjT
 YqI4envtJKjo1o2FMtLuAecAVcfAerYV4kv59qx0a0l+mztoeG5mlKx/5hj3jM+3GaplpoNQMC
 KO7V0ovbFpbfoZ0ka1ieg2++vVlH3Rpz/LIF6B+B6BqZfRjliloQ/IRU/MGWZM8M+47U3nLAOt
 Xgo7RKrT4MASNqHD+nJ4Ub5q
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 17:55:27 -0800
IronPort-SDR: qM79qve4QzL6KrqsbEyzImNBo5OJJkyy+jlkOaaN9FxjA+URuEACSPM8FND0yH0MmpbWbbb0cj
 97lAevIPHOpgM8kR2/CUeKtAFDXxAuOVp09PP/fafgMDRW0FUpsDbzPE+M4b3142Hc4rPYq45i
 AupSy5K4n14QYN4qOWDYAzL6U/wzFo3d/8LWDbRTlGdFErX6079bKLHJSCBdAh+5cHBvPRn0Mi
 h/w8XHDwwVBjFr0hiGHl4ijlF4C6MXcjxdTowqdJ97+JJAY1YjG6h5QF9Emwql6gYi+qkzHft/
 yGk=
WDCIronportException: Internal
Received: from ilb000836.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.63.217])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Feb 2021 18:11:39 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/1] MAINTAINERS: Add a SiFIve machine section
Date: Mon,  8 Feb 2021 18:11:27 -0800
Message-Id: <6bc077e5ae4a9512c8adf81ae194718f2f17c402.1612836645.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=667b40a3b=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Tue, 09 Feb 2021 02:11:47 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Bin Meng <bin.meng@windriver.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d8b0bf966..c347d49bd2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1359,6 +1359,15 @@ F: include/hw/misc/mchp_pfsoc_dmc.h
 F: include/hw/misc/mchp_pfsoc_ioscb.h
 F: include/hw/misc/mchp_pfsoc_sysreg.h
 
+SiFive Machines
+M: Alistair Francis <Alistair.Francis@wdc.com>
+M: Bin Meng <bin.meng@windriver.com>
+M: Palmer Dabbelt <palmer@dabbelt.com>
+L: qemu-riscv@nongnu.org
+S: Supported
+F: hw/*/*sifive*.c
+F: include/hw/*/*sifive*.h
+
 RX Machines
 -----------
 rx-gdbsim
-- 
2.30.0


