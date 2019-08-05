Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hufQS-00011z-4E
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 12:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58875)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufQ8-0000re-KG
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:01:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufQ7-0003IE-9O
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:01:12 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:43105)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hufPv-00030A-Kl; Mon, 05 Aug 2019 12:00:59 -0400
Received: by mail-pl1-x643.google.com with SMTP id 4so29643615pld.10;
 Mon, 05 Aug 2019 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=f9PQmlfQeDqkgAxVIzIdpihcuyDKDyeBO3ktymhGoVg=;
 b=Ef3awCl1yWbpHa6THaVFKLpXyrlDe/nYStbwjg/N2DsgPWvCmEgSp+UWIrKfyoAgh2
 2Ykxy8vEJhv/yaY+IkGoDQ4Ae6EhJ5q9yu2gqS2LMQNW43bjzWTlSgRgv1s8pALDGbXi
 Dti5CSaaTnopEtrgNl9DNb+H7Ige4jyrb103a+vPgI0p6jNQQCIOoKOmiXcw9sjFZuSI
 oXyDnsrGY/DInZB4IHgGHvyrYwnBGTenNvQh/1neburkLHTvsEm98j7ZI0qnU9I5cTyB
 wc7rhobAOPsA4cLGCMOCALtwEQeIBtHRHpETyzEbnTOmP7HmeEeYhWWDRoE6nZwXVlxF
 4x8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=f9PQmlfQeDqkgAxVIzIdpihcuyDKDyeBO3ktymhGoVg=;
 b=BUvb/h4SKm1z9cQ7s26YmSyh+OxFWe6e8cUsonhQ/KhtfeExcEaNRvMu7UOv+6FoMX
 0W+6nhZBqanTjFJkpcsomE8xX+T5hzamqnfF3qw/Wq142DRy+Esv6jpE8TbSaQNcljJe
 bUomjVsnqOPzDpU3MQYa355C+iX1wG3wC7w58+XY8Qt2sVdps8CmkVC1zi+u0mbtzIxR
 E3xjsu82E9cDQEPeoVSRqMuShYJo49fjOCV1+xfPAYNObmVkPK+PFkYV1C9IevSRJhx/
 Vd+TR88X+jFbV6zLn66lqjUovta+HgZei98AWypAKNz4Co+aZCJisQ2TRwsV8X8N6qn8
 /f4g==
X-Gm-Message-State: APjAAAXvU0Ti9WrOP9YOSG73IggaRO7oo4r4KwbfTvBd49xJZTiQa9z6
 JnkRS4x8hnkNwFX0+T+lpC0=
X-Google-Smtp-Source: APXvYqzLsQ4eWLdmtMEF1XR1V7vcVwYdDGwsGgpEw1+A7Urjyyxst1aO9W/k9LHICR6Jwk7MVkxemA==
X-Received: by 2002:a17:902:9004:: with SMTP id
 a4mr21290081plp.109.1565020852142; 
 Mon, 05 Aug 2019 09:00:52 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id d18sm47728793pgi.40.2019.08.05.09.00.51
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 05 Aug 2019 09:00:51 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Mon,  5 Aug 2019 09:00:17 -0700
Message-Id: <1565020823-24223-23-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
References: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-riscv] [PATCH 22/28] riscv: sifive_u: Generate an aliases
 node in the device tree
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
X-List-Received-Date: Mon, 05 Aug 2019 16:01:17 -0000

The Linux kernel SiFive UART driver expects an aliases node to be
present in the device tree, from which the driver extracts the port
number from "serial#" in the aliases node.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/sifive_u.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 061d6d4..9945b82 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -283,6 +283,8 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     if (cmdline) {
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
     }
+    qemu_fdt_add_subnode(fdt, "/aliases");
+    qemu_fdt_setprop_string(fdt, "/aliases", "serial0", nodename);
     g_free(nodename);
 }
 
-- 
2.7.4


