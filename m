Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gMiT5-0003bQ-Ar
	for mharc-qemu-riscv@gnu.org; Tue, 13 Nov 2018 18:51:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gMiT2-0003Zy-NY
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 18:51:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gMiSv-0006cf-2N
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 18:51:35 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:35138)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gMiSr-0006ZB-4b
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 18:51:25 -0500
Received: by mail-pg1-x542.google.com with SMTP id 32-v6so6460259pgu.2
	for <qemu-riscv@nongnu.org>; Tue, 13 Nov 2018 15:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=v8thlYChsOVWo1muMkMOtoqaVRzSIwN5qBNyohP/GZI=;
	b=g/0ZoLa/6hOSVcbxsf6LhvQmJ78j8RGRzY77SQsviG3VLBbDF0Pku4DZnTArlQg3zv
	34YKAz5jnytHkObVj3/jRBrsyDNSV72zpGcyBhtvrOr62fUsXGpHKhAxhOnoJHmO5qjH
	X6LGbvIOtsMJjfuXluocDcG13F7nhGW1fiWI8BsSt1rpQcXFsXYTUBuDosuVQ0erqWB7
	aiQJMf8XKutg4F4jzqDwaNd9S5Fm4Okq9eB9ynnM1jnyhRGDJzQlxuGIVBiTUDC2aumR
	V78BGwoLH9tJzZMMyqtlPYAeGi1wxaAwqEUkHSptv2B/oZ5K/dhjV1/PI4G9MaZ+SE7v
	bxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=v8thlYChsOVWo1muMkMOtoqaVRzSIwN5qBNyohP/GZI=;
	b=MFd91MroQXJsyzwbrTxMqX5KZE9kU0+NKrr34KYbo2ucWbmqotUR7YwRQsmjwK+2f6
	osALSEMvRzmk69t1YTjAayOVwzXC17AdIfIHKTw0C5kIjkTLWqekAkL01ho2DutD7cXD
	sXC1jjnNowGtMZVDrfNQCqgQ8DIIVELgYDRYWCqel0X/aq7cujD48OALehO0tR9Pw6pg
	xmCiHShjP45eaosOI4SDnvmdj1dOeauBR+tU/d06J3jSysBEXawX+6il5XWqyaUyVhq9
	HCKJxtdmfXOD/+adGIkzIsxN8GJVrBoFG6QA+85PCxsOcFV14RHH3DuqTepR3dtFtZlZ
	8ecQ==
X-Gm-Message-State: AGRZ1gKB+cBFKCUelAKKD/tP6nznGdy2WKfO/JDFhNX9/MmbNgKKpesK
	vlC8bXcBm4FLHVF9hBEvUBCYfQ==
X-Google-Smtp-Source: AJdET5c4PqvB2Q/qFxqFjPa+fVPck1GCrvW4QGad3rhTRDtQbe0SXHBWQSB5lCmdNjfKtKDhe3VEXA==
X-Received: by 2002:a62:682:: with SMTP id
	124-v6mr7240462pfg.161.1542153082487; 
	Tue, 13 Nov 2018 15:51:22 -0800 (PST)
Received: from localhost ([64.114.255.114]) by smtp.gmail.com with ESMTPSA id
	u5-v6sm25512059pgk.46.2018.11.13.15.51.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Nov 2018 15:51:21 -0800 (PST)
Date: Tue, 13 Nov 2018 15:50:44 -0800
Message-Id: <20181113235045.14155-4-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181113235045.14155-1-palmer@sifive.com>
References: <20181113235045.14155-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-riscv] [PULL 3/4] target/riscv: Fix sfence.vm/a both
 available in any priv version
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2018 23:51:37 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

sfence.vm has been replaced in priv v1.10 spec by sfence.vma.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/translate.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 5359088e24bc..f44eb9c41b48 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1292,10 +1292,14 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
 #ifndef CONFIG_USER_ONLY
     /* Extract funct7 value and check whether it matches SFENCE.VMA */
     if ((opc == OPC_RISC_ECALL) && ((csr >> 5) == 9)) {
-        /* sfence.vma */
-        /* TODO: handle ASID specific fences */
-        gen_helper_tlb_flush(cpu_env);
-        return;
+        if (env->priv_ver == PRIV_VERSION_1_10_0) {
+            /* sfence.vma */
+            /* TODO: handle ASID specific fences */
+            gen_helper_tlb_flush(cpu_env);
+            return;
+        } else {
+            gen_exception_illegal(ctx);
+        }
     }
 #endif
 
@@ -1342,7 +1346,11 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
             gen_helper_wfi(cpu_env);
             break;
         case 0x104: /* SFENCE.VM */
-            gen_helper_tlb_flush(cpu_env);
+            if (env->priv_ver <= PRIV_VERSION_1_09_1) {
+                gen_helper_tlb_flush(cpu_env);
+            } else {
+                gen_exception_illegal(ctx);
+            }
             break;
 #endif
         default:
-- 
2.18.1


