Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i2cwj-0003qc-SJ
	for mharc-qemu-riscv@gnu.org; Tue, 27 Aug 2019 10:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47278)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i2cwf-0003k3-9Y
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 10:59:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i2cwc-0003xy-Lm
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 10:59:41 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:35369)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i2cwS-0003n3-DU; Tue, 27 Aug 2019 10:59:28 -0400
Received: by mail-pf1-x442.google.com with SMTP id d85so14308283pfd.2;
 Tue, 27 Aug 2019 07:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=Yi7UvJSWpjgfFbNixgh5ya3t0YpLigDwkAwMsTmzWc4=;
 b=p33f5w0e9w1pfr0gCSa0wyPhGHhjHVyqwmWvCSCHONxnjCratIlXqMddYDoVndNR1F
 ZRVMhHb+scbdD9Y01TnYGes0Gat6KD2UcJJPyDb35YlKRUvk7lBUyUmjOvxMvn9oWbgv
 EUAt+OTQnWsoooRS0/tubwE94U5/lL/W5D9NRmUGjBISARV3TmvpTp2XZcbAreob8vWX
 aS/vEeoDHlnv7Zoaj4A8Htlm7kz1S4MlHBNmq7zyXikNBZJ7IBaB1D/eRLOnV6M2rJ6a
 l64ypSC1F3SAiX9/7NK6Nk6BL4D8VhY3OXMgg63osac8Ndeet5Kxd28BrLMB8kFdRD/x
 fYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=Yi7UvJSWpjgfFbNixgh5ya3t0YpLigDwkAwMsTmzWc4=;
 b=lVjDJbRiBF4Q/Kmly+ztHV9tL9nIdhSOvhcUfa6KhuzGS2yfXNI5YkPoDgMRixMVHQ
 J4s+K5bzSVzAj4HO94x2ECeMYVcF3CeyDIM9hX/T/L8EQE4Gm6PeL2zoSNe+Q816aF2K
 iTLUurzK3nz2tWWaz3Y7zJGtef/+lkwAtVN4gLIEKUfAhvM4n2C9CO9VLevEEkP3nM/u
 2BWPN0Ndqsty719AJ5XtQSGnRT2xxpPZWZQjMNCQaAV2qurXz8VrSf4PmPEa9TTNOIIU
 /1oacEuycuOU51vOfVbtNVut0EcbGGj0Q2gFGiX0jfrJMockLwffTuNf0tvnSDFo0SBB
 bIuQ==
X-Gm-Message-State: APjAAAXQQhbjrfA9TDPW5SBz2kCb5va36ko4Fczdl66Fn93Qd2xu2MMK
 49jsqUehBsWCy5EN/Svw8QI=
X-Google-Smtp-Source: APXvYqzdTXl4mEiVJj60mvMKorPC/nGSgLLWR2R2XoO2gyc505AcvDbiHirbwoKGu0QGsWeH/rCAVA==
X-Received: by 2002:a63:29c4:: with SMTP id
 p187mr21929117pgp.330.1566917958474; 
 Tue, 27 Aug 2019 07:59:18 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id j15sm14839344pfr.146.2019.08.27.07.59.17
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 27 Aug 2019 07:59:17 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Tue, 27 Aug 2019 07:58:38 -0700
Message-Id: <1566917919-25381-30-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566917919-25381-1-git-send-email-bmeng.cn@gmail.com>
References: <1566917919-25381-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-riscv] [PATCH v6 29/30] riscv: sifive_u: Remove handcrafted
 clock nodes for UART and ethernet
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
X-List-Received-Date: Tue, 27 Aug 2019 14:59:44 -0000

In the past we did not have a model for PRCI, hence two handcrafted
clock nodes ("/soc/ethclk" and "/soc/uartclk") were created for the
purpose of supplying hard-coded clock frequencies. But now since we
have added the PRCI support in QEMU, we don't need them any more.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v6: None
Changes in v5: None
Changes in v4:
- new patch to remove handcrafted clock nodes for UART and ethernet

Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_u.c         | 24 +-----------------------
 include/hw/riscv/sifive_u.h |  3 +--
 2 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index a7225f9..f14217c 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -87,8 +87,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     uint32_t *cells;
     char *nodename;
     char ethclk_names[] = "pclk\0hclk";
-    uint32_t plic_phandle, prci_phandle, ethclk_phandle, phandle = 1;
-    uint32_t uartclk_phandle;
+    uint32_t plic_phandle, prci_phandle, phandle = 1;
     uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
 
     fdt = s->fdt = create_device_tree(&s->fdt_size);
@@ -248,17 +247,6 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     g_free(cells);
     g_free(nodename);
 
-    ethclk_phandle = phandle++;
-    nodename = g_strdup_printf("/soc/ethclk");
-    qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_string(fdt, nodename, "compatible", "fixed-clock");
-    qemu_fdt_setprop_cell(fdt, nodename, "#clock-cells", 0x0);
-    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
-        SIFIVE_U_GEM_CLOCK_FREQ);
-    qemu_fdt_setprop_cell(fdt, nodename, "phandle", ethclk_phandle);
-    ethclk_phandle = qemu_fdt_get_phandle(fdt, nodename);
-    g_free(nodename);
-
     phy_phandle = phandle++;
     nodename = g_strdup_printf("/soc/ethernet@%lx",
         (long)memmap[SIFIVE_U_GEM].base);
@@ -292,16 +280,6 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, nodename, "reg", 0x0);
     g_free(nodename);
 
-    uartclk_phandle = phandle++;
-    nodename = g_strdup_printf("/soc/uartclk");
-    qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_string(fdt, nodename, "compatible", "fixed-clock");
-    qemu_fdt_setprop_cell(fdt, nodename, "#clock-cells", 0x0);
-    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency", 3686400);
-    qemu_fdt_setprop_cell(fdt, nodename, "phandle", uartclk_phandle);
-    uartclk_phandle = qemu_fdt_get_phandle(fdt, nodename);
-    g_free(nodename);
-
     nodename = g_strdup_printf("/soc/serial@%lx",
         (long)memmap[SIFIVE_U_UART0].base);
     qemu_fdt_add_subnode(fdt, nodename);
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index d2b9d99..3bb87cb 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -76,8 +76,7 @@ enum {
 enum {
     SIFIVE_U_CLOCK_FREQ = 1000000000,
     SIFIVE_U_HFCLK_FREQ = 33333333,
-    SIFIVE_U_RTCCLK_FREQ = 1000000,
-    SIFIVE_U_GEM_CLOCK_FREQ = 125000000
+    SIFIVE_U_RTCCLK_FREQ = 1000000
 };
 
 #define SIFIVE_U_MANAGEMENT_CPU_COUNT   1
-- 
2.7.4


