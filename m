Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSJGJ-0002Z0-Cg
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 08:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJGF-0002Sg-Cr; Fri, 02 Apr 2021 08:50:51 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:17449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJGD-0005hK-JY; Fri, 02 Apr 2021 08:50:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617367849; x=1648903849;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RM8Mr4suL3sEGe4S9yx+Sev8HReBhHJuMKcUkt6KKxs=;
 b=Q+WiiRuPqoSzRAIvuXqQY2/SgBSNIsuG4h1C7PktsG3963eAAA/+3EgR
 M1UQraX+7dPvsFay7qpTaCkrstIO883gJjYGMgFS1KMlqxFnmy2zRjygY
 tEXHc8nimkh/KiD8RHWn1O0hKFA93kNUMGraacPImifXHNx8EAkubAthD
 uUf72MqSNhwtpTboNfaAMiesmKcGkS07m7HsZiEyMQohmq1TOZtSp1J5f
 qlNkD1Rs4gBE2RM4m5sxr9fpLqHwPbt/hC2B/tAf+b5UlHD78HNZus97c
 SfoOam1U6USvkzDJIfpahTdXkskAEWBdzXzutE7nxUqfYxQIrHmuFfjOo w==;
IronPort-SDR: 7xJI0CfrGyB8MnN7kXK4HsY2iyBNRV1SUWyPGTZ7PIik+Wt37yEJEbFyL+Xsow9cBffo9/39xO
 gmIBMq+k9Ix3eV8eh19kRwmiIHs/xHLP0OubymOO1gAfU6d63CQyEwtPovQUwByr+fa2a+E08M
 3ZcGDn1VwHZDwdW4uJjvMqEENP5IP3GFyWxLQn6yUGew1tDKws2LzYt8Pn+03YL9InxnboY5sp
 gisAgXxEERjQruiaVdjFSKsIou9MzX94rWVyQozTxsFHIlMCQU+CkIcwPKcWX01fAAdiMs6y8p
 gBk=
X-IronPort-AV: E=Sophos;i="5.81,299,1610380800"; d="scan'208";a="163523945"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Apr 2021 20:50:34 +0800
IronPort-SDR: LRF1kOaCW0NJ7NH4pruF5EBgj83eKTy9a+hI04QRqodNYNBiwBMCXtPmQ8W1JZzflZ10ERnADp
 hZo1611AU/0Kc9jn1A5Y25dSbxxG83lYU/Vswav5g5UBbcOqM2WnexA1oM4nSSqQ/pJIEzjBpM
 yzEmfrzSQF5wzAWuteBqY+FqGqm0tl3NHKtHUJnHXBQSdiwli2ud+I6i7Am5oK6nBO0WLIXVTN
 vKYwHwlKRzmK8OzMjSpHFePdHZoNWmmreODLMWvedHAio6KFHkUDNgUud28bYG8ccEd+2XNRtz
 a6Ing2ihKp8MjD1HgVeAFlnv
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 05:30:34 -0700
IronPort-SDR: k0sGHOl0Q2jfZGfSnheg+QV/Xb9hCWoLMm7kpXWElKlcZ/41GWPGr0iJnRSCFzzpgOXiECwfRZ
 L7nHy3NdHPzHL9yibxWDdlCNpEBR6EoMmYFEQNLdiUK0TN0rbVoD8qN+m0VCjbaekGiCD9wIhL
 JTSr9Vzhb1rhkQvULQ9KdeN0Ese47CrbE3bHLznDlYnBnnsytapkG9Z2D6d0qFF8d/Jppg54Yp
 R/Afp7xkUt03qZZbacvyyLzKMNNrW1Uf7XiLjXsnavVK2wHNY3GcOlA1TipGNEHaCZMlbtRKtX
 HbA=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.78])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Apr 2021 05:50:27 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, Ethan.Lee.QNL@gmail.com, weiying_hou@outlook.com,
 camiyoru@gmail.com
Subject: [PATCH v1 8/8] target/riscv: Add ePMP support for the Ibex CPU
Date: Fri,  2 Apr 2021 08:48:31 -0400
Message-Id: <169e1a3c65731c9ee5be4d0c394d53d0d8b2655d.1617367533.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617367533.git.alistair.francis@wdc.com>
References: <cover.1617367533.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=7197bd837=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 02 Apr 2021 12:50:51 -0000

The physical Ibex CPU has ePMP support and it's enabled for the
OpenTitan machine so let's enable ePMP support for the Ibex CPU in QEMU.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d665681f90..244066a6fc 100644
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


