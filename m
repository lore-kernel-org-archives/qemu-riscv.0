Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jTtOB-0007AG-9Y
	for mharc-qemu-riscv@gnu.org; Wed, 29 Apr 2020 16:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53444)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTtNP-0006MW-9C
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 16:33:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTtK1-00068G-FO
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 16:32:15 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:7549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTtK0-00065w-U8; Wed, 29 Apr 2020 16:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1588192124; x=1619728124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uth3SOy7J70UXYgMlMkEumsDQFWDBmDIt0wImRmilQQ=;
 b=CInufT5QIry+5TVFNuDGmECWHSosy5MAMd+fJ437Kd/LH61T7H7HTX/H
 8kwsSV0alIOQgR6DyiV1/Zd2PzgTKwnSNwSJBlhXRodz+FfDMpgJrz4cX
 Rp2Snp0m6yRrImQVwBUhVctyrZfvsNLpQnZ5XmmIgTH8WnuvJU1yf/XgV
 OQU1qr7jWyqB+GQrPt9MspDmh3OVkKxjXeOBn3pfiTt6rCYi30UskESB5
 0T8uV0arXVf/hHvaC06RzVUadBJpqY0Wm5vqPw/k4qsviTRy3jWXUqm2G
 kjV0g2eSDkG3L0qFf+nEPUbLpFYhHlMxVMhqkcLXNBrVxKgufTqMqPW08 w==;
IronPort-SDR: b27eH1A+s0qP/z64xg7nWNYBHR+UI9ZfJirahk/AkctP7Q4/Q+VgJ3MdSYfOW/+F6GTlmZKLbt
 3Pb82dDMvQ1sEgZlJajte22rzOd2mHc+jhJquZu46wentsKsU6bvDehv556YxTAdpUGm8c1b0D
 INI1X/KDWEAnTd5K8EghRO/KbYH3SGGFEXa6sNStb5wosMtk9LFk8pjy7PVWWofnpg0mQMcV64
 FQq0HplZ+Ixy/jEEmhOK9XSv8kqMBwPtCj9NZ5LOunagAdSbXpCxK+BDsZlJtBVLZZuYGrlvAD
 7NE=
X-IronPort-AV: E=Sophos;i="5.73,333,1583164800"; d="scan'208";a="136507038"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Apr 2020 04:28:39 +0800
IronPort-SDR: Kis4ERPScIy2758QWisgEwJ2CNGsJAAZefnpuhm5lEZxKMYUaBZa5QVk2UY1MC25AbekU1Ec/+
 q3mFcEohof4dWsl8h0UqXP+wR/Hth2HKA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 13:18:44 -0700
IronPort-SDR: qg+Tyy5KToGzlMg6u7XK3w/0KKOHfI75CiQs7Eq+0CDK2/irXonsp0/FG1uvELBsYaM4jWrCFN
 +N/8c50BFh6g==
WDCIronportException: Internal
Received: from usa004631.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.56.145])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Apr 2020 13:28:39 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Cc: palmerdabbelt@google.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Corey Wharton <coreyw7@fb.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PULL v2 08/14] riscv: sifive_e: Support changing CPU type
Date: Wed, 29 Apr 2020 13:20:00 -0700
Message-Id: <20200429202006.775322-9-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429202006.775322-1-alistair.francis@wdc.com>
References: <20200429202006.775322-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=381fbd49e=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 16:28:37
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 216.71.154.42
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
X-List-Received-Date: Wed, 29 Apr 2020 20:33:00 -0000

From: Corey Wharton <coreyw7@fb.com>

Allows the CPU to be changed from the default via the -cpu command
line option.

Signed-off-by: Corey Wharton <coreyw7@fb.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20200313193429.8035-2-coreyw7@fb.com
Message-Id: <20200313193429.8035-2-coreyw7@fb.com>
[ Changes by AF:
 - Set "cpu-type" from the machine and not SoC
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_e.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 646553a7c3..b53109521e 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -123,8 +123,6 @@ static void riscv_sifive_e_soc_init(Object *obj)
     object_initialize_child(obj, "cpus", &s->cpus,
                             sizeof(s->cpus), TYPE_RISCV_HART_ARRAY,
                             &error_abort, NULL);
-    object_property_set_str(OBJECT(&s->cpus), SIFIVE_E_CPU, "cpu-type",
-                            &error_abort);
     object_property_set_int(OBJECT(&s->cpus), ms->smp.cpus, "num-harts",
                             &error_abort);
     sysbus_init_child_obj(obj, "riscv.sifive.e.gpio0",
@@ -141,6 +139,8 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
     SiFiveESoCState *s = RISCV_E_SOC(dev);
     MemoryRegion *sys_mem = get_system_memory();
 
+    object_property_set_str(OBJECT(&s->cpus), ms->cpu_type, "cpu-type",
+                            &error_abort);
     object_property_set_bool(OBJECT(&s->cpus), true, "realized",
                             &error_abort);
 
@@ -219,6 +219,7 @@ static void riscv_sifive_e_machine_init(MachineClass *mc)
     mc->desc = "RISC-V Board compatible with SiFive E SDK";
     mc->init = riscv_sifive_e_init;
     mc->max_cpus = 1;
+    mc->default_cpu_type = SIFIVE_E_CPU;
 }
 
 DEFINE_MACHINE("sifive_e", riscv_sifive_e_machine_init)
-- 
2.26.2


