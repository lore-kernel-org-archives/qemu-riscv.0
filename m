Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oYPN9-0001dx-Aw
	for mharc-qemu-riscv@gnu.org; Wed, 14 Sep 2022 06:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2494fb295=alistair.francis@wdc.com>)
 id 1oYPMz-0001Yi-2T; Wed, 14 Sep 2022 06:11:49 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:25189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2494fb295=alistair.francis@wdc.com>)
 id 1oYPMu-0005xH-9d; Wed, 14 Sep 2022 06:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663150304; x=1694686304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pNWl8IM1MsLajN7za4iGpFuA1MTWfHXAzD+Zatfx0XA=;
 b=CYwbwqb+hCewPVoxzJPeTDYtalZeh7xwyQaASlpTm7ymTcaO1/VRb04k
 MwtFdD6WQNQLS/S9WAFlpVobDH77zufdj4ZG9PrgPnhV4UhZ9dODBNjCU
 8v5RKik+ZDp2yonLYjmuSkMYFWsApZMdsXoiBVRLh1YHd0Cz4kNQSCxJQ
 WjZdyKY4FxxKKJQPEMFe3+GdajbmzhvRmMkpGPSEtCuSJN6S1wcTFJx32
 kg3ksMFq3CB0M9bRmsBBfTY7J98KGFcT2gADgFf/6EijaQfc6ytP2757I
 HMdIPB6IirMU7H8IUjDjWjt81lovsSqLbT/JPJ4WF8fTHf7E5ztfjOxhx g==;
X-IronPort-AV: E=Sophos;i="5.93,315,1654531200"; d="scan'208";a="315604493"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Sep 2022 18:11:37 +0800
IronPort-SDR: XYOF+cqRyvhZfRGC5zCfu4F1wlHu6L/7EcoMJJZbiL3l0EdbPQkwLVqFTeqIiFSr1hH7ajwxrb
 i5GccZY0nQLWBD7LoqD7jEE8AgJXZStpb9iO1Gw2f+G2IuqGf0Lksn36GVHMKOvfl4trG37Vno
 Jvdh+fZDSigNfdZys9ojJ1veqBGXT/Fv4AOH6xPOVgXTOv3MUWHXUpgltPs1RtU+vmWnouIfeB
 /jZBZj4fit/rkUcIYOHlSc9k665qC1EXdcQkP6Ad9GVYyoZ6gUg7HuReKdywbib1wHiBvmvOAv
 SHUGApbgV2vgQMieeRRbbdxN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Sep 2022 02:26:23 -0700
IronPort-SDR: h0opXXfn9C7XbAKlc25dtdKEkmSiBDSjRmIyd+D0pY0yG1aRvDz7cQyfAOtEkGgHBBmptSTYEJ
 UkjIISqpG+wQyDfIONWdNTP0twhKo1frd5koYURAZTUUYWfLND4pqAW+rwGfWV9nmZhpUaY0IO
 Wf/bmcZQyYgGv7502zCb4MFmbQ6SR0MhquG4gNsVMYiual/Wp6lt2vRDPwhzxMxi0/zalmEVoE
 6Lc5DKEGZmK5X74HJu8CnTMJmawIswdjFnVCTa3abToIPoPmudsJ1fUxKgUbOAtmo5egDGMuuc
 KCA=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.107])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Sep 2022 03:11:36 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
Subject: [PATCH 2/3] hw/riscv: opentitan: Fixup resetvec
Date: Wed, 14 Sep 2022 12:11:07 +0200
Message-Id: <20220914101108.82571-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220914101108.82571-1-alistair.francis@wdc.com>
References: <20220914101108.82571-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=2494fb295=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2022 10:11:54 -0000

The resetvec for the OpenTitan machine ended up being set to an out of
date value, so let's fix that and bump it to the correct start address
(after the boot ROM)

Fixes: bf8803c64d75 "hw/riscv: opentitan: bump opentitan version"
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/opentitan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index af13dbe3b1..45c92c9bbc 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -142,7 +142,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
                             &error_abort);
-    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x20000490,
+    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x20000400,
                             &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
 
-- 
2.37.2


