Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iO91O-0005Ze-0D
	for mharc-qemu-riscv@gnu.org; Fri, 25 Oct 2019 19:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49994)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=194c68654=alistair.francis@wdc.com>)
 id 1iO91H-0005MW-Du
 for qemu-riscv@nongnu.org; Fri, 25 Oct 2019 19:29:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=194c68654=alistair.francis@wdc.com>)
 id 1iO91G-0004du-B6
 for qemu-riscv@nongnu.org; Fri, 25 Oct 2019 19:29:23 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:10429)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=194c68654=alistair.francis@wdc.com>)
 id 1iO91D-0004C1-Of; Fri, 25 Oct 2019 19:29:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1572046159; x=1603582159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ClMqzRFqbUEgbXBotJ4MhGZoKJdThGnwNy8LrVmIgFM=;
 b=djC2MYsBeh8hwbN2Md7KLWMhtAw6pULKyxbyb+92CW564ZQLzLnodJLc
 411tHpd/6oQChvf3fMgL04FEOe9Ue2S4VGGCD6m9wXq2plF31p8v18XSI
 2e4ABQ1YQaeTLaGywd0LuHdTrPkD0mdzbu8XQcWzmWzfbqIrYiAOQyDFH
 OACuQD9MOKcP3IcK8kQr9lHAykF/DuWp/s0Z6nRA2UJAE2VsOSpSwv8Vb
 Yj4D3AaeQo0Jw3Jv28qcgpNpD52XyREOPrLfrRGNYn5UDY6u7s8qQTGGO
 choONsoBg9ZLTmKJAaDsCRfTEye3f/T7iQwE+rQsIQQtoZ8PueFs6zjB3 w==;
IronPort-SDR: A3OFmhIDHlK8WXlM0MQGqRNWsRSacfwioOmUqSCrG5/M0WM+63flK2KrcDbDdMkYvwjGob2Q16
 +hMyalUD3L5PAV8kh7YOHTM1O2Y5PztAxjwHB6qPZ/+YIwQ53LPSjJJhiFKwwBGjFa0GynR+FX
 KG7OZjQza6BhQa5IzGk+g5aE83TXwDVG8Gef3di3Q5dGhnABYRM2fQMPFv5rzpFgvmlzlp/YW9
 Z6w97kiXWgURVWFfSl3LnXixwNtvDzxz4nwS/4NSBOriUby6kDiPykt5k/mvfIhWwHR7wsZ/ui
 U6M=
X-IronPort-AV: E=Sophos;i="5.68,230,1569254400"; d="scan'208";a="228520413"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2019 07:28:55 +0800
IronPort-SDR: QPH0GB2CXi+MJgMlE80/wF2c1zEu4jVoJ0CXtLjA4Ar0uZhxWkCbK4Wx8efKjkCLmFFxDoVcMG
 jofsVt+C1Yz2BC6W2swkX1JmXHPqUebUKAAPIF8jWDXcbSCCg499FysUyOnOp/3QKLRAwyBaV1
 OTbSgNQHuBxWqzFvof9qeyIgz6cru18NPSo4P4fZBJoUSSNgbFfKHmAoRWTn79FsOxS4eoJbT/
 SyFFbjdc3jbrV3eLjz8fRodDXImA+2ht/4BtbOFO2FGcHyHMhI1fulc2yQRsOxEHZe4pCVGCNj
 7GbD/xEMprxVblnNdxcfApNp
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 16:24:21 -0700
IronPort-SDR: /Fnk7ztwJRNOBEyfpiExJNMBiwy9K2Z4lL7Lx7FHyWTLV3LMP7l7X0eOu+SlwdHqrzOaLS0xLC
 KjkIZ8kf5blopR4QHaetNUm5ImZBZtH8JgVIZokhd4mFkodGdQc9MR70CdL9H+oDn1biVbrhkP
 vqa/Xq8kyFQ7RGcKgW2O8Dipk8OURiSAoCNY1l172cqpVoXAGBbw75T4aKS5F8Lwisnml0K2rb
 2VPdD8vuQFKO7ZxB3+IrV0IPQ/n+DD16yhmFL7Gsk8JSBt4+mUicqNb+/lj1HwxiRDlEWyv8Ih
 kEE=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.58])
 by uls-op-cesaip02.wdc.com with ESMTP; 25 Oct 2019 16:28:56 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v2 15/27] target/riscv: Generate illegal instruction on WFI
 when V=1
Date: Fri, 25 Oct 2019 16:24:00 -0700
Message-Id: <cb89f4a7a98329b93f7d56a4c0c35cbab6b5cbc6.1572045716.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1572045716.git.alistair.francis@wdc.com>
References: <cover.1572045716.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 68.232.141.245
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
X-List-Received-Date: Fri, 25 Oct 2019 23:29:26 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/op_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index d150551bc9..beb34e705b 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -130,9 +130,10 @@ void helper_wfi(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
 
-    if (env->priv == PRV_S &&
+    if ((env->priv == PRV_S &&
         env->priv_ver >= PRIV_VERSION_1_10_0 &&
-        get_field(*env->mstatus, MSTATUS_TW)) {
+        get_field(*env->mstatus, MSTATUS_TW)) ||
+        riscv_cpu_virt_enabled(env)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     } else {
         cs->halted = 1;
-- 
2.23.0


