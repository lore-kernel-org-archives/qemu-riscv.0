Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jdzOK-0001MO-DX
	for mharc-qemu-riscv@gnu.org; Wed, 27 May 2020 12:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=40961fbaf=alistair.francis@wdc.com>)
 id 1jdzOI-0001GQ-QA; Wed, 27 May 2020 12:58:54 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:17592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=40961fbaf=alistair.francis@wdc.com>)
 id 1jdzOH-0002AL-AN; Wed, 27 May 2020 12:58:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1590598733; x=1622134733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vDZd4fWZoZGped8sJN4wTNf8wH4Xep9G/tkQsk69CK0=;
 b=Ue0PU/XgqLFYscUJxJicA7wt5amUxvvdSwGFHx4yykMZpwzXnSCWGlEu
 /HCU7EayHAsB9cCS9t+bdrB6lxOS4rVQREfoGH9IJSAHPoLTOjpUkZpcW
 ZJzEnoDUYHxFEAR1eMRArEgIKJnN/hTRspfFVpu06C/XjV76F6Q9Dr6LX
 y1ZACwto3MUsikxoJQubXZkK6xNWgH8CSAe7sQP9hp7sDG1vbgIO6cX8j
 I/uybCvUdWf6qSNfLcq7abXAVwSdUU+btpChtIEiii/ulr3/QIkRuJCEV
 bwWFvSo30WV981wGynnx+MPjZ5O71z4Kfk7HjGg3QxTmSzHsuwV2X5sSs w==;
IronPort-SDR: xFGoS2dOQJ2fxmyFFKf9b3nC/UxvBeWGLZCZLaKK1A7IuEwBSmRTojY+lUIK8vF/gS/5fHpBlv
 bfF74CBlF5P4dMNjSVf4BCIu9Nvx04PtKY4h25ZWQqY/m/15DWQ6OPrbWYce+xbNdSNkGsNEcW
 EFHrD4EVfjtaF4YM9xmcc9B/vIq7shru4siSvnwSmd9SAuJxBO/Jeydb2JrbVOBG14TYGBebSc
 NyT7e0f1RGJ/WAMnHK93qZ/kchuDuw6whH03102Qt2wnWGYjMxbF0yat2SCCeEDurkqDWcLyL1
 OyQ=
X-IronPort-AV: E=Sophos;i="5.73,442,1583164800"; d="scan'208";a="138633214"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 May 2020 00:58:51 +0800
IronPort-SDR: jGC2TgpL8JPdxtyEk7wex8zoER4tsIxmHbaXEqwrFnU+UHMpgHXX13RNE67Oo0I9XSyrKVoicM
 H6oLmFMWNSUuSxr5KFad1ctLgUOyzGBVw=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 09:48:42 -0700
IronPort-SDR: NkvRZAFV6dHsAHZKgc/JSPUzqB0QGvMcJyUu+5m+FUafBhrII8MpAPOFoUdhGzQgdvN3Fdcmb7
 nVjZ+/w7DLnw==
WDCIronportException: Internal
Received: from 71vjjc2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.57.96])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 May 2020 09:58:52 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, alistair23@gmail.com,
 bmeng.cn@gmail.com
Subject: [PATCH v4 02/10] target/riscv: Don't overwrite the reset vector
Date: Wed, 27 May 2020 09:50:17 -0700
Message-Id: <35cda0fb7d3ad4781e47a1e7e13cce326d391570.1590598125.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590598125.git.alistair.francis@wdc.com>
References: <cover.1590598125.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=40961fbaf=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 12:58:46
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 27 May 2020 16:58:55 -0000

The reset vector is set in the init function don't set it again in
realize.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
---
 target/riscv/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 059d71f2c7..5eb3c02735 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -133,6 +133,7 @@ static void riscv_base32_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, 0);
+    set_resetvec(env, DEFAULT_RSTVEC);
 }
 
 static void rv32gcsu_priv1_09_1_cpu_init(Object *obj)
@@ -180,6 +181,7 @@ static void riscv_base64_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, 0);
+    set_resetvec(env, DEFAULT_RSTVEC);
 }
 
 static void rv64gcsu_priv1_09_1_cpu_init(Object *obj)
@@ -399,7 +401,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     set_priv_version(env, priv_version);
-    set_resetvec(env, DEFAULT_RSTVEC);
 
     if (cpu->cfg.mmu) {
         set_feature(env, RISCV_FEATURE_MMU);
-- 
2.26.2


