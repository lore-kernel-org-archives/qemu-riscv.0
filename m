Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pT7Rr-0002gr-EW
	for mharc-qemu-riscv@gnu.org; Fri, 17 Feb 2023 15:35:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pT7Rp-0002f5-T4
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 15:35:14 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pT7Rj-0006Ss-UV
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 15:35:10 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1718822c152so2435627fac.7
 for <qemu-riscv@nongnu.org>; Fri, 17 Feb 2023 12:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h8I3/loqCXLPJq7Ot2kL3eJ1UPZjr/7NB5ZYHvYcxs4=;
 b=hXlYR+c/vmtjgfPiCUTY2Egvj7W8wG+htq8q1k1Ot9eRL5PxM/sctvLKXh0GQ5dor1
 A2KWh3UKhfGMaFV5MaH5obMlqpUbmgsXyaftIx2HTjkjZbosrFSorvYZB/26sNYbWLbn
 i57ZW+0letC+xpBRJrBG7qXyEs5GLIG/mewnnCukqqwlPNzBTshbFYxeflE63kNLjesl
 SNP4tZacMPLiH4j90OP8ulSYXrACWX9FwobNn9EH3h4TmwPCUrq/guKSS5e82wzrljKL
 E2y1aPW6Tk+v8XlWe2vdBl6rPsTXktFQKLyiUDlso7fWQ0uS1fgIg8zFrN6vfv+kdxBV
 sxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h8I3/loqCXLPJq7Ot2kL3eJ1UPZjr/7NB5ZYHvYcxs4=;
 b=8KOFSc/3eHQE2bstfj1pFwyIZwvkPOV/sv1GKAxtCW2UieL11XdNZ1nR9E00a54q6w
 +Vzdj84qR51uPO+7OD9xg3ByJjUExn02+KfBz8HNjwc6vRxQmgzs+JpsU2EWZ24GGT1F
 U45wdqgmO4xorWCDGsGRI8yHNsXxqHhlxqpx77r1DSoTd+v3rhlTYiSWD5dT1HE9ghGM
 HeoEs719i3WP4whWn1nIKOZjC8FBSXWFzzvVI9Fvc+tDrsjGnIUlNSz03CwMbCwM2wYV
 9+5ckA58OeN3BlxH1/oD/aYowXNHI38Vgsx3NdXlcimbbA2Bc/GD/ZMV8qPv7F2yBTcq
 a2kQ==
X-Gm-Message-State: AO0yUKWKjBBHZsgUYURirT0+Gq47ntTwDchp9tCgUmEd8cg+oW5OgCeo
 s+hx3il+TlSUXiV3cPYsQEy9uw==
X-Google-Smtp-Source: AK7set9wTy5XMNG0AfZzG70AeWXPVGhlGN0uQo1qyDKSbFIXWJeh5j1rzHnfWcDkLefLUReNexsHCA==
X-Received: by 2002:a05:6870:171d:b0:16a:16cc:8a0a with SMTP id
 h29-20020a056870171d00b0016a16cc8a0amr3712563oae.28.1676666107281; 
 Fri, 17 Feb 2023 12:35:07 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 ef5-20020a0568701a8500b00152c52608dbsm1125616oab.34.2023.02.17.12.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 12:35:06 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 dbarboza@ventanamicro.com, richard.henderson@linaro.org,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: [PATCH v6 4/4] target/riscv: add Zicbop cbo.prefetch{i, r,
 m} placeholder
Date: Fri, 17 Feb 2023 17:34:45 -0300
Message-Id: <20230217203445.51077-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230217203445.51077-1-dbarboza@ventanamicro.com>
References: <20230217203445.51077-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
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
X-List-Received-Date: Fri, 17 Feb 2023 20:35:14 -0000

From: Christoph Muellner <cmuellner@linux.com>

The cmo.prefetch instructions are nops for QEMU (no emulation of the
memory hierarchy, no illegal instructions, no permission faults, no
traps).

Add a comment noting where they would be decoded in case cbo.prefetch
instructions become relevant in the future.

Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Signed-off-by: Christoph Muellner <cmuellner@linux.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3788f86528..1aebd37572 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -134,6 +134,7 @@ addi     ............     ..... 000 ..... 0010011 @i
 slti     ............     ..... 010 ..... 0010011 @i
 sltiu    ............     ..... 011 ..... 0010011 @i
 xori     ............     ..... 100 ..... 0010011 @i
+# cbo.prefetch_{i,r,m} instructions are ori with rd=x0 and not decoded.
 ori      ............     ..... 110 ..... 0010011 @i
 andi     ............     ..... 111 ..... 0010011 @i
 slli     00000. ......    ..... 001 ..... 0010011 @sh
-- 
2.39.2


