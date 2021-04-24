Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1la93V-0007tE-Up
	for mharc-qemu-riscv@gnu.org; Fri, 23 Apr 2021 23:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la93S-0007rI-4X; Fri, 23 Apr 2021 23:34:02 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:4877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la93P-0003tc-Mf; Fri, 23 Apr 2021 23:34:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1619235239; x=1650771239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yp6F0Q+Swib2+GJbDoLfYqYlTDrfVWqPKtiCYQ7+Cww=;
 b=LnQfjKGQ0I7Qjx6itPvM3sZODvOZl8aKB1u2maCOu2HX2cStdl9kdlT5
 CXmWyBXCIdkCLw6tpoIRNWs+Chn7dNuTw13qgucixGPDKn+t5cBNEAtpm
 elr3ycA0T1NEpvbMnB6Ck7eiJSKoELclCGYTVHOSxL9+TjdmAXmEm54PN
 7dUEpdjxoPKbT0Kzs1wnrX1xeQR3J+Qjdg+VVQqH8awZw3hD8Z/i3yPY3
 Dq/tR0hBggietXSXyp5sRye1JrImjzq9I/KYP7gWFtcxYvRV8FcJ1S13S
 YemgSEvP8MsMmz+a/A6ywfYlGlBBR58OlrUphIno304y4uAQz0XcmjMlG Q==;
IronPort-SDR: 5nPqheNVlKC24PQ47pAXSwz2krMYys0hrc7aZoFxuHk3+ZonLROzdhFea95leyKarlZPQV9fxg
 2mDAdGYUZJUuQMLNZzaK6Rdr9iRvzQjDfd0WV6kC++AP9j9EDb7XskFX2cBEbwYe3XfejxyHBT
 F6GBvyvBF9jVY8rB2k0uow7TAr3szmAliEM8sFF/pW40+XAow1zUKvw9Nc6cvjOm3OJaUP4eR4
 ZH0wzsk54ubVMMr+KvIthK3Pe6p7UfiZu6zozLpUp/rpakO480xwgtRaBhRRrZC90VX4b2vpun
 G+Y=
X-IronPort-AV: E=Sophos;i="5.82,247,1613404800"; d="scan'208";a="170655709"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Apr 2021 11:33:57 +0800
IronPort-SDR: CiSB7jx8U/XRKf70YZQ95mPvlSlz51r1zgG5HL4AJNki+4EmxqpN0OTah827e0cz8vEDMRN7Gr
 nGxrjECx/NvSspEiKlaDhGLAAywDz3OUWBkdcv7hPoD66XeV/4smCcCxEm0Zq2obqVufUFqXdt
 BHy5PGIaBwBxtFZyIh1kqtf919X4Ay5UbU0RNbA5/YRmBGMpRIb/+Y9ocHuAmpkBsFNPR0F1eE
 smquiOm1gZuDCJ0gWafMC7cNOJr1QURfRMg1LXM5g0zDPbZnlOTrYvM8HdEupsl+nxClTcQCjY
 15Jx3UT4udSzROh5aKZxYo7Y
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 20:12:59 -0700
IronPort-SDR: pbKqK1lvm2f91sgfUHrFmwApT/ynhnHmZ7JaDkZlOTZnSONE6kSXg3yLv/+Hh4L+V1/85XpfEJ
 IP+pOo5f1kdWKl+0+q6mHXPizg+YYKU3+tSP4JUeQ/jmYGUfOSQdJ+mmAovi/ShjgqvojPS/L1
 ejPFLXkkOvfptMFL/4U58E1SsvOD1LySX+O7qY+8NHB2etOb2SBcVw/cU51NMvwZXFdNF6LMjo
 luVFpDte0mhuGU/5dO2jcC4lufjAxRQRw7l8AtLw+YoHrIfIfBub3F88AoBLm2ll6Gy9g4M0ks
 2GA=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.34])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Apr 2021 20:33:55 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 06/10] target/riscv: Remove the unused HSTATUS_WPRI macro
Date: Sat, 24 Apr 2021 13:33:48 +1000
Message-Id: <e095b57af0d419c8ed822958f04dfc732d7beb7e.1619234854.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1619234854.git.alistair.francis@wdc.com>
References: <cover.1619234854.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=7413b051c=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Sat, 24 Apr 2021 03:34:04 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu_bits.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index d98f3bc8bc..52640e6856 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -396,12 +396,6 @@
 #define HSTATUS32_WPRI       0xFF8FF87E
 #define HSTATUS64_WPRI       0xFFFFFFFFFF8FF87EULL
 
-#if defined(TARGET_RISCV32)
-#define HSTATUS_WPRI HSTATUS32_WPRI
-#elif defined(TARGET_RISCV64)
-#define HSTATUS_WPRI HSTATUS64_WPRI
-#endif
-
 #define HCOUNTEREN_CY        (1 << 0)
 #define HCOUNTEREN_TM        (1 << 1)
 #define HCOUNTEREN_IR        (1 << 2)
-- 
2.31.1


