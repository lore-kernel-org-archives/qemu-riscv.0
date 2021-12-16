Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxino-0004W1-JV
	for mharc-qemu-riscv@gnu.org; Wed, 15 Dec 2021 23:55:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinm-0004Q1-VP
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 23:55:35 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:18178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinl-00041i-5j
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 23:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639630533; x=1671166533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3X15HcUvQRy3KpgAj7UNFaQ0IIYxsE7ynJ42gJyEVqg=;
 b=OlTI8Jb0U37K2vY3JMGGm6VwXKPXjkI5HMXWn+E+P8ZprI31wf6jUQZJ
 mJDnsAiGok/rYmbUtbfYhGb/VDx5/8wYhDjV5Yjp8LH8MR2zGzeUkUC1T
 2meO6ONd9rVfgWNAsYNF060PniTghYj7IQCz3aNYndfQDLtryjtnZIhQD
 U1TMjEUIXAPnmMsoFruBeRNZoBFRambyjR11gAh4/ECGDKp6ympUIoLJt
 aYyBbDxwSVNPATy6vUzojdJN6EuKH9L9VKiAOjR6R0WDoi77/xMm43wrC
 KJ7eDW02A4jXdVDlkLu7kMzg3D/xKZXkOKcjUyudXWk7lXV1hSfc8ST4H A==;
X-IronPort-AV: E=Sophos;i="5.88,210,1635177600"; d="scan'208";a="187354604"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2021 12:55:29 +0800
IronPort-SDR: 9HezgTAcGs9uhTjrm9rQhYI2Wosv3fV/aalQpY6hL8IrPV4q/qGjB/TaYkVGV4tIRzIC7rB25a
 2X+ew9dA1TZC/Wa4GnR91nokNvYCGx2s1w/AOf3JmwTwIfkfq0whwGf6/zNEmFbEDX47wS0P89
 MHlffzlu/t2OsVB6Wf7NGYg6HUqruId8jQ0doGdCoJtHDkKLDeWkP69gygGlB0XlzJTp9A08qL
 XufmQN011nuV/alpDY5LNtYQitnk7PbZd4X7bjhIH7hC13LrKCPc/Zt4IbGOHTSWr5B4dwZUw/
 KhB9/3ldwdBUmFzoda1GkUk7
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:29:51 -0800
IronPort-SDR: 2z+dg4PjVSbTjR3N11VLQocEzODY/Qupkabcf146nZT2u4YocZ9AIiBlYaff+iyKZgNMKwYi61
 QQ2FVAnvoMXssobQMBLaOtJXB2CwBBEdxE3uv6QhtrWrswL2PoWrG9ztBLHB21+SpCB5e2ePR5
 ju/2X9ZWOj6LSxwdYFl7r1xRkfcWT2fnDClfT8kHyiQRuitdgu/WyfpqmqkQeiZ1g2ZiZNJpM4
 vSqJosmPlWMJ1U9DZirRh3OqsZXmdq847t+abKRFiS4eyLabZnU0vxFhPFgRdFVEwIWKXE3e7Z
 g8Q=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:55:30 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JF0DJ6hr2z1Rwnx
 for <qemu-riscv@nongnu.org>; Wed, 15 Dec 2021 20:55:28 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639630528; x=1642222529; bh=3X15HcUvQRy3KpgAj7
 UNFaQ0IIYxsE7ynJ42gJyEVqg=; b=Ieoa19D+IXxSdKlUIz63VrlHuR/7Auulnt
 A/wgMtB2Nu4vX06xI1gMQMEx8sD+apV9tSOGPGkhWhjStTS+2woaX+6Y7PLzC2pB
 RtFmzOGUfHgE3gcAKktJTtsIFWq34P5iyQknjrh7BRdZx+6BwapyM6uGF6qd75dT
 Gx+8IwguvLWwEP6RhE4Pp5Bp38Vk/gFvPM80aJvxapiSVECOX6xfIae0s+IvyJPW
 ZMKalVH6+HDTyzeV9i7PpVIEBdcCA7VyZt83CcIpGl1IaY9goVFawVCmlZWgydDK
 Fc2Zy7Ztnmp/pcAlvJFLCLKN9qQYVza34BYL3Rgq0O8yAWpAV6Mg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id XJOCt-3VU4BE for <qemu-riscv@nongnu.org>;
 Wed, 15 Dec 2021 20:55:28 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.66])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JF0DC5rj7z1RtVG;
 Wed, 15 Dec 2021 20:55:23 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v2 9/9] hw/riscv: virt: Set the clock-frequency
Date: Thu, 16 Dec 2021 14:54:27 +1000
Message-Id: <20211216045427.757779-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=977d27bfe=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 16 Dec 2021 04:55:35 -0000

From: Alistair Francis <alistair.francis@wdc.com>

As per the device tree specification let's set the clock-frequency for
the virt CPUs.

QEMU doesn't really have an exact clock, so let's just 1000000 as it's a
nice round number and matches the sifive_u CLINT_TIMEBASE_FREQ.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/472 (RISC-V virt)
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3af074148e..41a85cfc60 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -202,6 +202,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s,=
 int socket,
         qemu_fdt_setprop_cell(mc->fdt, cpu_name, "reg",
             s->soc[socket].hartid_base + cpu);
         qemu_fdt_setprop_string(mc->fdt, cpu_name, "device_type", "cpu")=
;
+        qemu_fdt_setprop_cell(mc->fdt, cpu_name, "clock-frequency", 1000=
000);
         riscv_socket_fdt_write_id(mc, mc->fdt, cpu_name, socket);
         qemu_fdt_setprop_cell(mc->fdt, cpu_name, "phandle", cpu_phandle)=
;
=20
--=20
2.31.1


