Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pL2g7-0003di-Jc
	for mharc-qemu-riscv@gnu.org; Thu, 26 Jan 2023 08:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pL2g4-0003ch-Aq
 for qemu-riscv@nongnu.org; Thu, 26 Jan 2023 08:52:33 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pL2g1-00043T-JQ
 for qemu-riscv@nongnu.org; Thu, 26 Jan 2023 08:52:32 -0500
Received: by mail-ot1-x334.google.com with SMTP id
 g2-20020a9d6b02000000b006864bf5e658so833580otp.1
 for <qemu-riscv@nongnu.org>; Thu, 26 Jan 2023 05:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mxEbgjU5aR+oYquuJNQfmH8bDfSRZI4C/R+GpocfbUU=;
 b=bAvDSRmBFUuJkmr4IsvIij0ABtll3YYYB/6wTXyyku/jVNEdS/8QKX/dhEkn3mlij5
 KxIdRClG/LSNDRfwHLtzvTvt/GZqrAJypwSKwAY4OJUskXfwDqsnZoCndXuFsiNZQYE5
 3pu8daJDu1r8RUumLWmYFmdA7pxgjqqPisUqWwKby9kfi/Z4ROCac+VAb2tMWG3uOky2
 t68RMzdjhUZI6lWncEXvmwBA4pFQQ9x/8x2Fq7YFwHKYW0lryG8NPY4+HKuC1/jYvZN9
 jbBnp/GIaGHH0SwEnfuhXV2sev3HD5B4IVR+zbuEUHKmHPDyHXai5XrpFke8OsO3Ay83
 LYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mxEbgjU5aR+oYquuJNQfmH8bDfSRZI4C/R+GpocfbUU=;
 b=4eEnPzm9CNLG2cI3pfDh+Oe1KqhGW4oOzB9c7uHzwxNDtfJ7MlH/EOe9HNM7Ttuz/k
 bF0R+v1quYJ9heEdLfDrymylOKZrpRc18H0vs2Y0USg4nVPq0rkySUqpO53eLOh6s/DF
 YUzeTXlBlBzZOIPdU4G85PiFjh7zjiQlHxZDCdA8cBOU/P7Mswk9OI0l8pDV1mhdlWSt
 EzR+5VtiNrYffXwp/z3PSs3z4bbljCw+B/C6oZQiT4xg7Nwa9YH9xHrouSBGAHxNlzIL
 ihG4Y6B4XUU5fYCYJ7cYZWM+g3LCfjSkHNZBKRRhlZowGd2wW1Xk+NAUk05sK5kFGJsT
 rQrw==
X-Gm-Message-State: AO0yUKXdlpUepV7A/VXhqG7y3eCUme/f3zlkucusgSL+9pMc+OWO2D4/
 hRI6W/cF99D/TkvEVpFaBLly82FQFvBrQuV+lTM=
X-Google-Smtp-Source: AK7set/k15wnJxSWRgAyFRWeZR7ga6ybjDtDjFSyKgTKNCavX825cV1qqIhzP+u4p7YCOKLPqOa8pQ==
X-Received: by 2002:a9d:174:0:b0:686:4528:8b9a with SMTP id
 107-20020a9d0174000000b0068645288b9amr1078715otu.13.1674741147487; 
 Thu, 26 Jan 2023 05:52:27 -0800 (PST)
Received: from grind.dc1.ventanamicro.com (200-148-13-157.dsl.telesp.net.br.
 [200.148.13.157]) by smtp.gmail.com with ESMTPSA id
 w19-20020a9d77d3000000b00661b46cc26bsm496323otl.9.2023.01.26.05.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 05:52:27 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 1/3] hw/riscv/boot.c: calculate fdt size after fdt_pack()
Date: Thu, 26 Jan 2023 10:52:17 -0300
Message-Id: <20230126135219.1054658-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126135219.1054658-1-dbarboza@ventanamicro.com>
References: <20230126135219.1054658-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 26 Jan 2023 13:52:33 -0000

fdt_pack() can change the fdt size, meaning that fdt_totalsize() can
contain a now deprecated (bigger) value.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 3172a76220..a563b7482a 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -287,8 +287,13 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
 {
     uint64_t temp, fdt_addr;
     hwaddr dram_end = dram_base + mem_size;
-    int ret, fdtsize = fdt_totalsize(fdt);
+    int ret = fdt_pack(fdt);
+    int fdtsize;
 
+    /* Should only fail if we've built a corrupted tree */
+    g_assert(ret == 0);
+
+    fdtsize = fdt_totalsize(fdt);
     if (fdtsize <= 0) {
         error_report("invalid device-tree");
         exit(1);
-- 
2.39.1


