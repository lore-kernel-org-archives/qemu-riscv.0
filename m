Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOQdi-0007UP-H4
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 16:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=87996f883=atish.patra@wdc.com>)
 id 1mOQdR-0007Je-GN; Thu, 09 Sep 2021 16:27:01 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:38860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=87996f883=atish.patra@wdc.com>)
 id 1mOQdP-0000Qk-PJ; Thu, 09 Sep 2021 16:27:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631219219; x=1662755219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KlVm9ArR4IJetr50BN064+0SmCXOWsrWRCRAaqdEjFA=;
 b=RJ0yG5WVBfwlhCi0zd5OwJ3u7h+gKLY6zpKX3hHV8t4gcUNnSRD577w6
 rms+7ggqtz+WXa8/2LL0GylqHoHMnCB90t2A4QA3yAtie+pd0sdq6ucOS
 FnsO0M6RvntvbbVa+VRFl0L7F9OPxS/V6CMG+nAPk4kmG6GlDYcdwVIpe
 HaWBTsLp8GWNxsJTl7l+/qjbk7ajwFx/k7iOTOP4FD0mFIIHNSk6gh1ix
 uea2hRk7UnYQUHAVXSxTufaxCdsCw+a7coc7ftmRdTjxy/UxSDhQq0J5V
 gRpWuBQezGGa6TBiIEu6KsyMrzqPxwkYxUgYvjz8pWgXGC0QbKFowMYaR w==;
X-IronPort-AV: E=Sophos;i="5.85,281,1624291200"; d="scan'208";a="178710295"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Sep 2021 04:26:51 +0800
IronPort-SDR: EiQPClv4bbG0LppVZ7dCUxaPZD+PkpbyJ02T7QPlIc6IGqfLgHYlWLoASWLFq7VJ6/KmaRXNBj
 WYWYl/4Z4KaxJDtiyALzrNNh49OzdHWJBvP0ius2P/6nIVBxD02RQM/PwvEr2bm04OiGKbgM57
 tFDEoCccEJe2DGknixqsuPh3IGy15S2TsCo0WCBBlBBcmLvH8E5F7rnz/Rp76rZcrc6giI5vvW
 2mgrlH1kdg38i8w1x4BmnjL79LWRURqNNAfU9uV+W7n3T3c0os938XAzCzVB2dw3sxqtCVCXAI
 zZaubtvOyrdxAUVDXfMnczdo
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 13:03:25 -0700
IronPort-SDR: EvX5IFeQwuz66jqqGJiykoXzZ9WeP4TzcZjMxExBRCVklKudfK4/Zbkmw+KqfiGiRTuuo7dAhi
 Tk14TmZSC6UHPs/uPiGEk8HnC2wFKj3Rfhk5SCkbHd5hT5KYdpyW3OkgyxBOaHEFWELoarKEoP
 wLQaSiqpnsize89/YsxFQOsA2crU21uWeXXzrGdqvCfgkl4wq+3PRq6ny/RmVrHlbg2T36fntx
 CaD/0xocZ7LUe9VTuT+cI4smHdlPbtkEFMJSWyd9uBimzM9teT5teKXh9DAFjVArv2zJHNFVaY
 MbU=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Sep 2021 13:26:51 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [ RFC v2 2/9] target/riscv: pmu: Rename the counters extension to pmu
Date: Thu,  9 Sep 2021 13:26:32 -0700
Message-Id: <20210909202639.1230170-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909202639.1230170-1-atish.patra@wdc.com>
References: <20210909202639.1230170-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=87996f883=atish.patra@wdc.com; helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Thu, 09 Sep 2021 20:27:01 -0000

The PMU counters are supported via cpu config "Counters" which doesn't
indicate the correct purpose of those counters.

Rename the config property to pmu to indicate that these counters
are performance monitoring counters. This aligns with cpu options for
ARM architecture as well.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 target/riscv/cpu.h | 2 +-
 target/riscv/csr.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 991a6bb7604f..7a486450ebc6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -587,7 +587,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
-    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
+    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf1c899c00b8..5e67003e58a3 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -293,7 +293,7 @@ struct RISCVCPU {
         bool ext_u;
         bool ext_h;
         bool ext_v;
-        bool ext_counters;
+        bool ext_pmu;
         bool ext_ifencei;
         bool ext_icsr;
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0515d851b948..c3ce7d83a6b2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -64,7 +64,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
     RISCVCPU *cpu = RISCV_CPU(cs);
     int ctr_index;
 
-    if (!cpu->cfg.ext_counters) {
+    if (!cpu->cfg.ext_pmu) {
         /* The Counters extensions is not enabled */
         return RISCV_EXCP_ILLEGAL_INST;
     }
-- 
2.31.1


