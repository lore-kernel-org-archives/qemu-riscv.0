Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iBF8M-0005sc-CT
	for mharc-qemu-riscv@gnu.org; Fri, 20 Sep 2019 05:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51853)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iBF8J-0005nI-Pn
 for qemu-riscv@nongnu.org; Fri, 20 Sep 2019 05:23:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iBF4I-0002oy-Ig
 for qemu-riscv@nongnu.org; Fri, 20 Sep 2019 05:19:11 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:43152)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iBF4H-0002o1-Ax; Fri, 20 Sep 2019 05:19:09 -0400
Received: by mail-pg1-x543.google.com with SMTP id d4so384463pgd.10;
 Fri, 20 Sep 2019 02:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=u/XXhvAolCieP6V1RN94aOGfpzypnA1RhoVy7PHOsac=;
 b=fCXLmIG49+wsif6g44N7pNcQD6/9BmxjmVA5KQTrRgjFD2tsRIZX+1PyccTorw7Iib
 dgS9gyUJbhQZeXc0SM2zgwf/Wd7vNxUmUNABsWp3gINu1cKdb9i88/K5Vv8Gwsfu7yno
 aG9HRXbFp/S2ighvtle2f3bqBcPkRb6skyj0TjMHhm1hIaZaI8fjZ24SdnyK5YLDDThX
 boOVG4iXDWqeIRTuXYvVRWoH+exh2cVL29zvUzOPZaw6jX3BvA/zHEY/dE6M/Jx5474D
 x64zAu7qSCUPMk/gmeA+iM+vcJTUAilDGSf2UoBWcZhttyFTsTZJdrEZv2WIOFYQdCZM
 sTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=u/XXhvAolCieP6V1RN94aOGfpzypnA1RhoVy7PHOsac=;
 b=cu2IHxxLQ/I1PR4XEVrRt+0SgtTBeRJ88ifob9Tcs7ultaaiiJ5zEsdtOOsOMIXp1X
 p99K3yg9yg/DB/fceT4b8OJXThPX3vhFzToi+9fQv9bLhvYkRBHe3x2rIZK9cPjmmO4n
 axTr+mQvkZI98qxziuFsNvJS4U9SlKOPgydNDrrJy3JUdrTSxy7Ihxbf4ucqX/HQnYSu
 vw38ChiK4oaDvYvW5sxbCHxZlkKUM3o5ogeyLERufSaQ6/84+Ty6dP8OEQo6iZZW9bIl
 XPXEH1ZCTvPrBhilVB8znfo6JEcsCzd1Y3o41/mYuf0juUUoyuE+JFNRuWAE5yNwzzfr
 /8mg==
X-Gm-Message-State: APjAAAWwKqT65Uf75NFxuaFKTXM0phmd6OYEsho3XA0xbA6yh/bqk9ur
 bLA5XoAVfp2IKcHuI3Dzhm4=
X-Google-Smtp-Source: APXvYqyNkevPjfniTbLQjpKGLV/cndKHIk/8BrfTVG4+L/jfaW16pBBCaSuavhqNn9USlEeQdgcSQQ==
X-Received: by 2002:a17:90a:1903:: with SMTP id 3mr3513369pjg.80.1568971148373; 
 Fri, 20 Sep 2019 02:19:08 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id m9sm1500731pjf.11.2019.09.20.02.19.07
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 20 Sep 2019 02:19:07 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 2/2] riscv: sifive_u: Add ethernet0 to the aliases node
Date: Fri, 20 Sep 2019 02:19:02 -0700
Message-Id: <1568971142-27979-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1568971142-27979-1-git-send-email-bmeng.cn@gmail.com>
References: <1568971142-27979-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
X-List-Received-Date: Fri, 20 Sep 2019 09:23:21 -0000

U-Boot expects this alias to be in place in order to fix up the mac
address of the ethernet node.

This is to keep in sync with Linux kernel commit below:
https://patchwork.kernel.org/patch/11133033/

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/sifive_u.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 02dd761..1ac51e3 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -270,6 +270,10 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
         s->soc.gem.conf.macaddr.a, ETH_ALEN);
     qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
     qemu_fdt_setprop_cell(fdt, nodename, "#size-cells", 0);
+
+    qemu_fdt_add_subnode(fdt, "/aliases");
+    qemu_fdt_setprop_string(fdt, "/aliases", "ethernet0", nodename);
+
     g_free(nodename);
 
     nodename = g_strdup_printf("/soc/ethernet@%lx/ethernet-phy@0",
@@ -297,7 +301,6 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
     }
 
-    qemu_fdt_add_subnode(fdt, "/aliases");
     qemu_fdt_setprop_string(fdt, "/aliases", "serial0", nodename);
 
     g_free(nodename);
-- 
2.7.4


