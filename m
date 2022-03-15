Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nU0rG-0004PQ-M6
	for mharc-qemu-riscv@gnu.org; Tue, 15 Mar 2022 02:40:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=066bbe4b2=alistair.francis@opensource.wdc.com>)
 id 1nU0rA-0004MZ-3R
 for qemu-riscv@nongnu.org; Tue, 15 Mar 2022 02:40:34 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:5727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=066bbe4b2=alistair.francis@opensource.wdc.com>)
 id 1nU0r8-0008Ez-9i
 for qemu-riscv@nongnu.org; Tue, 15 Mar 2022 02:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1647326428; x=1678862428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uH+FnFzokSTg9hEnoprqBqYtSFmT3D4puqtd1m9I0kM=;
 b=opm0SPbnNv69q3AJMm64uwQqfmMASpfTIeVpNB4JJJ2dwgg1gXd9nLGm
 RQByl1skC4mB898E/HTMvoh9pvDtdnvPaccmUBfO77jligOkae44FHvBU
 NzpoHADi+OqFuoH0uqS/NlY/qjG+KkkzgZB0w1BTAfHeQSMTMSo9fiUx1
 8uyPRIuXM0Bw2ZVbFgdBrfv7T0XUE41btjQYr+u9Txw9kWj3Wch5OWd5v
 zOKAZuAalNoPuBF83Mx+6/dSaC0ezcPEHGon6qb/n4OGihDOG+Nojr3ul
 N+nM366ToLCLwCfWNEXk6zd8FLwic9DDgsQZJCvS+ZO3LFVmNT7G2cm/t Q==;
X-IronPort-AV: E=Sophos;i="5.90,182,1643644800"; d="scan'208";a="200224268"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Mar 2022 14:40:16 +0800
IronPort-SDR: 4i0itdqu+qf7oYAzI72DYlwxd3TdKxS/QQ7T4DkhI9/ww8981GDwQJ63ZV58Q28wWu0LMt7OZw
 9PEuE6aqw/nJf5Y54VhR8hMZJhbkoppgVtkxuTXc6xy+jguxfwGhASeZDJMPVK35knJnv1esYU
 5+8iKzR4mUd/Xp/t+zVulvkSl7j0d3nyJp9O+Rm3c5IpR9ZH/pa7eMuNN5ZdLrKx6lrs4n+wR0
 pqAy9WNuTVhz93smc6TxTkkPbJsFVrflGAA3uHW9pXQs+5cJHW4kyhLAM2b2ta4krQIKHB0MZz
 iwU7QCbskvmqrU9/2zV+5xH5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 23:12:25 -0700
IronPort-SDR: kqiNvpveG4k2X1l7cigN/EQ0RRsPxqHQLMZkM/Pq7jC+Bjwq4EY9/zaPFymyMcDWlkPc8u/PM0
 6SfSleMDeyrjaC8UmFo2IZP41cwWkdgpYK6ZySnkZ4BlNoZ3NLecDYNPJKUxEx4lYafnxPKbjA
 GZIsxP1x8iyzndNwO0SpM7eXEkNdN0pCq5JzjD+9FFGNi4n32ks+SeNAUo78XBedxOi12EU7rh
 /sW1EraZbqjE/TNMZBgKc//WRJQYfAo8OBZUxLqmHOc91TZhcrGnlEyO9rWYDEd9UyH+yMq3my
 iD0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 23:40:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KHkLB0Wdlz1SVp0
 for <qemu-riscv@nongnu.org>; Mon, 14 Mar 2022 23:40:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1647326417; x=1649918418; bh=uH+FnFzokSTg9hEnop
 rqBqYtSFmT3D4puqtd1m9I0kM=; b=h2k3Y9mkcSePcXpw+4F3rdE9b8XqZNEa1a
 AgzBdY/FDgwfTqUv9LWILrySFrv6glsHJuMFlNxM/kOfdEgPSKbOEpj+Tao3FZoG
 mkKIrOblMu0X14+uSkVmEgjZnBeSA8THsv7+o5WHVg5DHuub9XF+vjnJiu+FBPKN
 S83qB5OOV0LnqdZ/wrAg2BNmYr7U5uJiCdcjpdBMN2WVb5bGt1jm2SdRDBxvkIdz
 dFI8Ggt0QVwi5WNBwhbAhyMyltR+vKSvhvXFUpJat+xqcBTCs8c0H1j3Ee53mvR8
 R2c1pIAemoZ7pd+rBH59H2vQCk/Jj6BG+gNtowxTySXkTkLZw30w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id KyHRxYAWy0LL for <qemu-riscv@nongnu.org>;
 Mon, 14 Mar 2022 23:40:17 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.107])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KHkL64fdCz1SVp3;
 Mon, 14 Mar 2022 23:40:14 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>, bmeng.cn@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 1/2] target/riscv: cpu: Fixup indentation
Date: Tue, 15 Mar 2022 16:40:06 +1000
Message-Id: <20220315064007.3600746-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220315064007.3600746-1-alistair.francis@opensource.wdc.com>
References: <20220315064007.3600746-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=066bbe4b2=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 15 Mar 2022 06:40:35 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddda4906ff..a4120c7fb4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -709,11 +709,11 @@ static void riscv_cpu_set_irq(void *opaque, int irq=
, int level)
         case IRQ_S_EXT:
         case IRQ_VS_EXT:
         case IRQ_M_EXT:
-             if (kvm_enabled()) {
+            if (kvm_enabled()) {
                 kvm_riscv_set_irq(cpu, irq, level);
-             } else {
+            } else {
                 riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level))=
;
-             }
+            }
              break;
         default:
             g_assert_not_reached();
--=20
2.35.1


