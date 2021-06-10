Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrFtI-0001pq-Ha
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 04:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFtG-0001in-Sj; Thu, 10 Jun 2021 04:18:14 -0400
Received: from mail142-29.mail.alibaba.com ([198.11.142.29]:40039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFtE-0008NU-PV; Thu, 10 Jun 2021 04:18:14 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4265272|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.2439-0.000735694-0.755364;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047208; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KQNS9yo_1623313082; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQNS9yo_1623313082)
 by smtp.aliyun-inc.com(10.147.41.143);
 Thu, 10 Jun 2021 16:18:02 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 37/37] target/riscv: configure and turn on packed extension
 from command line
Date: Thu, 10 Jun 2021 15:59:08 +0800
Message-Id: <20210610075908.3305506-38-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.29; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-29.mail.alibaba.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 10 Jun 2021 08:18:15 -0000

Packed extension is default off. The only way to use packed extension is
1. use cpu rv32 or rv64
2. turn on it by command line
   "-cpu rv32,x-p=true,Zpsfoperand=true,pext_spec=v0.9.4".

Zpsfoperand is whether to support Zpsfoperand sub-extension,
default value is true.
pext_ver is the packed specification version, default value is v0.9.4.
These properties can be specified with other values.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9d8cf60a1c..21020b902e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -618,14 +618,17 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
+    DEFINE_PROP_BOOL("x-p", RISCVCPU, cfg.ext_p, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("bext_spec", RISCVCPU, cfg.bext_spec),
+    DEFINE_PROP_STRING("pext_spec", RISCVCPU, cfg.pext_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
+    DEFINE_PROP_BOOL("Zpsfoperand", RISCVCPU, cfg.ext_psfoperand, true),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
-- 
2.25.1


