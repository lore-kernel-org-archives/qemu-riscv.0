Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1la91J-00063l-Ii
	for mharc-qemu-riscv@gnu.org; Fri, 23 Apr 2021 23:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la91H-00062M-L7; Fri, 23 Apr 2021 23:31:47 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:7218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la91F-0002D8-En; Fri, 23 Apr 2021 23:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1619235105; x=1650771105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d2vyhak+ZI8u5OwIFhEy1tLDEU1teHlg0/kZ5Vj4J2E=;
 b=Cb3ZA7bUiV6I+qKLgG4+8CW831/kT55cRDZb+L2ACa8PgUNgxSUoiY6S
 d4EovJ7B6O2/PtoPmSR1mzTJygQcfwWvxlvXPGu47dm1r5po6bMbLKAow
 vaNursdTenhsBerKLwMDI+RI2CwmrLdfbRrs0vy2TcSmBOo7p6GyD2Tqb
 +HTIXo3MxmP/+1k24uclAbbf68V3+HxoI3vRcheaZ9Dy3tXYiB0RGbCea
 8HDpSUAOyZM15c3HyXJTPwwJ+NN3hbKUko6rOL3HcHGqoCZrrlzLhQ8d6
 ZRPpgf5jyw4tr53UcaUN7Rk92D4nOfdm+/3+cDRobzZ3swcbNimfaaQDP g==;
IronPort-SDR: 6e/06d+STkY3x2nuI6c/QiH1qk/gHSw9rvckN4YpwLvCRZ1CaMXxAazIIXsxgV2/ViNgcv32E4
 bFSqyrTw6W3LIxGDDyPeFDTXLeu4P6R+6rE2Hgu2qh+QfMAcrazI/ehM17J2sPQeWE0oCnx/qk
 hXTjCvRl7SFoEM202W4ywgn+l4jkKiIsd+OLcvxmrbivPeJxFtyi/wJS1AgAN+HgmYVMpcbzEm
 mrHOwnA7D8rK37cCS9TGqv/KwmX62TW+IiZb17MQTa2LGtFF2+oUSVqtmCUjhbsotUoeFmCI0J
 q7g=
X-IronPort-AV: E=Sophos;i="5.82,247,1613404800"; d="scan'208";a="166115745"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Apr 2021 11:31:42 +0800
IronPort-SDR: sX+1QbYVO1ag2FRaHtcaUpyAJolR85zs7e5jLARnpZTdZkS2wh/mH6LLcT0hqVjWiaHno1F/uo
 dJbO3Co7IY2IOLbJkyD0vl9ymH3KXfTYLrT0vV73KaytES9c8sITxkIL8YH/p3rTa43FmK1sZB
 8g6hvTDBiW6fVR33G6aEohSDzWt5dtSsH662QRx7ushUkRrxniEKuMM8qexZ1N1kcJqQgl8JLO
 re6NOAmu/vNImiMUJCHSkI1JTqJgIZ7Jk5a87d2XpC+qYbXacxt62g9wnuFkm49Y5JKjDA5dq7
 k3KTH2nqaGU/t2pa9XUNmnJJ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 20:10:45 -0700
IronPort-SDR: NJlgn4fFiq4sF1BmmGw1IFl+g8yyx1D/+Q+CQB4s+r3C1GkTNm4b4Oe+VOUfRH1XhGAJf94cau
 L9N71+XvSo0AYDHGHQNozhB+2VR4/GOF/UyhuvMQLC0B/jkuBAPU80vh7pg4/Kt2TlTShvBqPQ
 DeoTrmukg4xTbOnds9hjK9mk7Ac4l1gWO6N7WMy5IRF5gFZBVOuynZfHvXKw+po022bEgGQJwL
 8vjpJZFqSzIi9M+qCel4T1ov68rTJs8B1QcjInYlUCOCROGrnU9dGOlgyp2E7UdMzetNbeGyfk
 HYg=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.34])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Apr 2021 20:30:07 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 02/10] target/riscv: Remove the hardcoded SSTATUS_SD macro
Date: Sat, 24 Apr 2021 13:29:50 +1000
Message-Id: <9ea842309f0fd7adff172790f5b5fc058b40f2f1.1619234854.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1619234854.git.alistair.francis@wdc.com>
References: <cover.1619234854.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7413b051c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Sat, 24 Apr 2021 03:31:48 -0000

This also ensures that the SD bit is not writable.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu_bits.h | 6 ------
 target/riscv/csr.c      | 9 ++++++++-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 24d89939a0..3a0e79e545 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -403,12 +403,6 @@
 #define SSTATUS32_SD        0x80000000
 #define SSTATUS64_SD        0x8000000000000000ULL
 
-#if defined(TARGET_RISCV32)
-#define SSTATUS_SD SSTATUS32_SD
-#elif defined(TARGET_RISCV64)
-#define SSTATUS_SD SSTATUS64_SD
-#endif
-
 /* hstatus CSR bits */
 #define HSTATUS_VSBE         0x00000020
 #define HSTATUS_GVA          0x00000040
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 97ceff718f..41951a0a84 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -459,7 +459,7 @@ static const target_ulong delegable_excps =
     (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT));
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
-    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
+    SSTATUS_SUM | SSTATUS_MXR;
 static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP;
 static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
@@ -788,6 +788,13 @@ static RISCVException read_sstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
     target_ulong mask = (sstatus_v1_10_mask);
+
+    if (riscv_cpu_is_32bit(env)) {
+        mask |= SSTATUS32_SD;
+    } else {
+        mask |= SSTATUS64_SD;
+    }
+
     *val = env->mstatus & mask;
     return RISCV_EXCP_NONE;
 }
-- 
2.31.1


