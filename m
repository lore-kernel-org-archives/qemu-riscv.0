Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hwiss-0005xD-B5
	for mharc-qemu-riscv@gnu.org; Sun, 11 Aug 2019 04:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60178)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hwisq-0005oy-35
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 04:07:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hwiso-0003ue-3D
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 04:07:19 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:33701)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hwisl-0003sa-Lc; Sun, 11 Aug 2019 04:07:15 -0400
Received: by mail-pf1-x443.google.com with SMTP id g2so48249199pfq.0;
 Sun, 11 Aug 2019 01:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=PLWQ6sV23GKeKTA2EXWW/dxs8yz2G7ttB4XskFWNEyI=;
 b=NBJAooUH2h5Bpx2373oCkmXBchgB4GGLx+PLg2qzPS/+fWOY3NqZ2zjMGoCT+zoL8p
 8qW2HZV+IRYgIH0hB/q7YYFroZIA06491XnA9PRB0R7eaabaP5ldr3jW9D5SkPEgWK4s
 KJ+Oz31SDQh7oFKI9tHDwJGrOr9/vPMGoy/0havAoc9Xh2421anS/ONjeIweoSvlQmrq
 NIfvIG7J1vNNX87KmQzk4wmwUkPA+W7WKSiuJbxCM9IIz6x4j2BE3ork7h/0z/4PAfoh
 Xjh0i0zDvkwWX+qo16OLeddr8yURC3Dmqm9RtxgrzjAX876gx62gY7vOhTDxYyFmQbbc
 9d+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=PLWQ6sV23GKeKTA2EXWW/dxs8yz2G7ttB4XskFWNEyI=;
 b=kGR8zKqwSYC3GEurPzgfQyZDX/wsA1i+tMd8tmkFrhuu96rZ6i7AiCqhKV3KdawG86
 mQu7BVWsA7/N/es1Ynz5kMHKPY31R5YNMzGn9rKoQ6oFrqqIaj7KafLjnnj2scZsiYgX
 S+hwlFyyMXc2tHJDirHwFm+e56SDuGOJkgGp38HP2aqUV7fj54Vf7mnjxBqU2CckV8YM
 gTIDnaQnER6BRtHabKDJJzXda6ywTvoAqXMTMhetgXLh5akniMorK9YNr4KzHcuxCzqb
 wL9hcpsg/vX4m/t9pewQG8vyobXYWj5uD4L+vJPsP3u0UtVHUPm3xz1Y/7JTNYokoEuQ
 Gu8w==
X-Gm-Message-State: APjAAAXEBGJENptkL2b03EEZjWgkHjma8GU9dm1JwnHysX/B3wJPI1YD
 ud98vZKtCaBoH84KfJGeBU4=
X-Google-Smtp-Source: APXvYqw3Sg/SQ96mhxX8eP1ehA7bU/tltkD1QQn+QkByqJofzlYmppK4RhD/e5b1LHH8Rm2k7aSiNA==
X-Received: by 2002:a63:125c:: with SMTP id 28mr25175609pgs.255.1565510834853; 
 Sun, 11 Aug 2019 01:07:14 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id v8sm87339107pgs.82.2019.08.11.01.07.13
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 11 Aug 2019 01:07:14 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sun, 11 Aug 2019 01:06:40 -0700
Message-Id: <1565510821-3927-8-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565510821-3927-1-git-send-email-bmeng.cn@gmail.com>
References: <1565510821-3927-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-riscv] [PATCH v3 07/28] riscv: sifive_u: Set the minimum
 number of cpus to 2
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
X-List-Received-Date: Sun, 11 Aug 2019 08:07:21 -0000

It is not useful if we only have one management CPU.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v3:
- use management cpu count + 1 for the min_cpus

Changes in v2:
- update the file header to indicate at least 2 harts are created

 hw/riscv/sifive_u.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 295ca77..f8ffc0b 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -10,8 +10,8 @@
  * 1) CLINT (Core Level Interruptor)
  * 2) PLIC (Platform Level Interrupt Controller)
  *
- * This board currently generates devicetree dynamically that indicates at most
- * five harts.
+ * This board currently generates devicetree dynamically that indicates at least
+ * two harts and up to five harts.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -425,6 +425,7 @@ static void riscv_sifive_u_machine_init(MachineClass *mc)
     mc->desc = "RISC-V Board compatible with SiFive U SDK";
     mc->init = riscv_sifive_u_init;
     mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
+    mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
 }
 
 DEFINE_MACHINE("sifive_u", riscv_sifive_u_machine_init)
-- 
2.7.4


