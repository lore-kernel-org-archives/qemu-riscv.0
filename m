Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvGdy-0001Io-QI
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 03:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36658)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGds-000117-To
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 03:45:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGdq-00087J-ME
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 03:45:52 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:46624)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hvGdh-00081E-LY; Wed, 07 Aug 2019 03:45:44 -0400
Received: by mail-pl1-x643.google.com with SMTP id c2so39457513plz.13;
 Wed, 07 Aug 2019 00:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=Wi1uWTJXrzaEQAGgBpmZ9b82tg3gieSlyDYiCRVFIX8=;
 b=hoGEkF4u64ZPEoACNDcZREc56ok/796NVXYm3nOQ6+EOvoAUQ3BFeKIlHZIvCOshaj
 OY0AN1e0Hc6dnG2fiqjjTIIrC4Hm+icPVLlAK4D5I6aJjZaajvxtgmWetdABtbPXSDCy
 RoPvKl+LuQat8Fyx0A/hCvjbDVxZsVp8H34xk1RI0Gh6h3iEpw/kzyXmySieMn33I0mj
 9j8tDd9kxpLXf4r8DGrLh4/mpoXC6/Xn/ue3xVhTiMW9zEClh7EyhAidvVDj8n3rvIJw
 eOiWyMjODMH+EHM9uDiqXGg+munPGn/I2HUTCp6I/br4IXi+/+edveXKZricUBBv8wbI
 51Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=Wi1uWTJXrzaEQAGgBpmZ9b82tg3gieSlyDYiCRVFIX8=;
 b=hFZHpsEORIABS0m7wQmCtR/VYnyZxzRQe+7CgB9zfWtDv4owEuzDgoRcv5tTzWBaQ7
 x0qPKrer2J9LiFhM6PxpF/XEn6qtz6+XWjprbtXDbhLHR2Aah9wPcwoSwyMhREepLpnW
 QuBJwvvxWTXRdTXnAIkmr+XDgoQGqbD7FoGoeur5UtYsQQvpf4gJZ3k1Sum8ZAHNb+iq
 PKa0LXdX/jzhl35jnGF5M57Bj60UH9h2lWXeqKhNMZrGNm6fI4Dy4ZEGwCf8s8Dwy+/M
 XgZ4++UQaYSKcTsgcM3sKQ30E555TFyzpPTR5rw2CSqRIwGsMTIPZ8uIfF5ZeW1Hm+JC
 06+Q==
X-Gm-Message-State: APjAAAXoiWvLiizeJdwVjru4+QbLzbOKKwddG3iLH/AQmxwtzH2a7lw6
 4Kk4n2j8ojHIe2wNSkF2fZA=
X-Google-Smtp-Source: APXvYqxHEiOIhVpgpFEGYS8/ABYKXr4zkiwiZ4ehBzKOwiOkH65cVRfJSHY2hAfr4/I8rTJ2/8RcXg==
X-Received: by 2002:a17:902:694a:: with SMTP id
 k10mr6861035plt.255.1565163939165; 
 Wed, 07 Aug 2019 00:45:39 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id l44sm20154449pje.29.2019.08.07.00.45.38
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 07 Aug 2019 00:45:38 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Wed,  7 Aug 2019 00:45:04 -0700
Message-Id: <1565163924-18621-9-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-riscv] [PATCH v2 08/28] riscv: sifive_u: Update PLIC hart
 topology configuration string
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
X-List-Received-Date: Wed, 07 Aug 2019 07:45:55 -0000

With heterogeneous harts config, the PLIC hart topology configuration
string are "M,MS,.." because of the monitor hart #0.

Suggested-by: Fabien Chouteau <chouteau@adacore.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

Changes in v2: None

 hw/riscv/sifive_u.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 91f3c76..fe8dd3e 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -373,10 +373,11 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
     plic_hart_config = g_malloc0(plic_hart_config_len);
     for (i = 0; i < ms->smp.cpus; i++) {
         if (i != 0) {
-            strncat(plic_hart_config, ",", plic_hart_config_len);
+            strncat(plic_hart_config, "," SIFIVE_U_PLIC_HART_CONFIG,
+                    plic_hart_config_len);
+        } else {
+            strncat(plic_hart_config, "M", plic_hart_config_len);
         }
-        strncat(plic_hart_config, SIFIVE_U_PLIC_HART_CONFIG,
-                plic_hart_config_len);
         plic_hart_config_len -= (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1);
     }
 
-- 
2.7.4


