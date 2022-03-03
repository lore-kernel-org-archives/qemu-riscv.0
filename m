Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPqbJ-0007RH-2z
	for mharc-qemu-riscv@gnu.org; Thu, 03 Mar 2022 13:54:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPqbG-0007Ki-VS
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 13:54:54 -0500
Received: from [2607:f8b0:4864:20::c32] (port=40881
 helo=mail-oo1-xc32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPqbF-0001lF-IL
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 13:54:54 -0500
Received: by mail-oo1-xc32.google.com with SMTP id
 h16-20020a4a6f10000000b00320507b9ccfso6818776ooc.7
 for <qemu-riscv@nongnu.org>; Thu, 03 Mar 2022 10:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KVrxFJG9XKBpol7NLsKIXCTAGZL6CqEwO0MNz8y3nng=;
 b=QEklmtMv+4cB1kAvuhgrcvidwEgXat61HJnbb0BrBo5wPe75J/7Uw4b7FtTI188tG4
 2m7HwTW1Du2gDwzLqdB4Y3EPa1UP/LlJ9MiqBunEYcFp9fH4lyDZ4lMQDce4yRIoo/Jj
 y3AkXx3sz/4wrltjlF2f8/KSrKjA0U08kpEc9VJqAwj4STKs5JNx5SdxUnIyWvcHq0Lt
 UyFVPQq8qY1kpp/n4x50Ty81Ur7GT0ANuSBXjNqD3YAODjuFmij55fWTHBuXcpBde7pa
 fYT9t1JAFdA3/IR+ebIEtk5wRWLvQaWBJ2X6KW5cATlHbDPQjUFNHqLY+Qx5QwKHlTcf
 x4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KVrxFJG9XKBpol7NLsKIXCTAGZL6CqEwO0MNz8y3nng=;
 b=kUmwdFx31CLKPqL2L7C6sjC/lBqbPA5JihxLT/ofWX1wOnUvju37enOnFnGUZTbNmv
 cEw+xTXIIV7R8wiDRgjeeSTxKFSbLbJPUGPuAjB9M6+BltZwSEzuOmwVcVcbY7KIjf5T
 5gbU8IB5hOlb5g+BU6lNxz8Uq3EEUUgrgOYsDAVD+IYbCYkF21OWEZ4UcAP7D/KzA1pq
 VSeIe8vLQgarCINpAhVl1iIX1twDh0qLg5jxyy6Imova6oGSaWXHcMPRpOb7Yq5Su/1H
 TImm/5rArr5wsTcnnQxKtLAXkxsmByXS+spmbj9n3fjzU+WyIftSjxbCqdO/sFgwJL9y
 PvfQ==
X-Gm-Message-State: AOAM5337+xHyP8Q2Kr0oDsLaQ/c/QedBPE03KZblNk4rd9SW2zOLmHxZ
 oun3U4nY+7E8+TrRavuEvXpR+g==
X-Google-Smtp-Source: ABdhPJwX2p++7KN9Jh5qD18EABRv9cstK+nZAkqt9XUBrBQR4F1MTefloBnmu/XXe3OThltTHUoQTg==
X-Received: by 2002:a05:6870:6394:b0:d6:e1a0:22c5 with SMTP id
 t20-20020a056870639400b000d6e1a022c5mr5082494oap.138.1646333692560; 
 Thu, 03 Mar 2022 10:54:52 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 u24-20020a4ae698000000b0031c286f2e0csm1331052oot.29.2022.03.03.10.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 10:54:52 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v5 2/6] target/riscv: Add the privileged spec version 1.12.0
Date: Thu,  3 Mar 2022 10:54:36 -0800
Message-Id: <20220303185440.512391-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303185440.512391-1-atishp@rivosinc.com>
References: <20220303185440.512391-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc32.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 03 Mar 2022 18:54:55 -0000

Add the definition for ratified privileged specification version v1.12

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index cf748102efa2..7f67e920c650 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -86,6 +86,7 @@ enum {
 enum {
     PRIV_VERSION_1_10_0 = 0,
     PRIV_VERSION_1_11_0,
+    PRIV_VERSION_1_12_0,
 };
 
 #define VEXT_VERSION_1_00_0 0x00010000
-- 
2.30.2


