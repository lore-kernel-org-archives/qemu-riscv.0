Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vkF-00010h-Bg
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44689)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vk6-0000w3-CZ
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vk5-00045x-92
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:02 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:33699)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vk5-00045d-4S
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:01 -0500
Received: by mail-pj1-x102b.google.com with SMTP id m7so490663pjs.0
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=11a7NIMhd3gpRKr3KvBv9bMb/iOBc4dnUF9RcuuDB/U=;
 b=sdVKJ7RYKhbzocdUPeMdVkhOGAgNPqFTRxSayEleVtT77FgOH/bl2KLRBVT/FlXMxI
 9KxQQzB3WSjL9gZUD6pVma+Daow8iv7Ptuc5EEpvxNz6fQl8VV2cmoBHJO5RJYehVy15
 U4+T2UuFkgxOSR1hsXhrihSG/6eUxDUw5V4sE2Iwwhwku8sP8MtsivW/rXtEn5OEKH97
 eJj14a09z6ngBQl0RS7CDiLveI1JvlNIFxw+Eg2Pys3jB1dqGktDOzMFz8fRNPt4vqDs
 vqg1HXSpZ7a8QG/DRFGPo2bw+axLHVLP7JtA2TD2nRdged5o4Bs8hhK42A2X/KfMpq3N
 2AbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=11a7NIMhd3gpRKr3KvBv9bMb/iOBc4dnUF9RcuuDB/U=;
 b=nJd15iQMxb6ck+U8a8LDfJ/iFh9niNPBmbYBcCbgyKpCVVVVlZpgWSdsqbsGUJ25bt
 W0vh12AhyS1ZAJi4o5c5bhY++TrUlw7WlcHaZ7avbSy7ozoGEShmp01ONDgakS5/imlz
 j5Sg/qtD5ZUmd/Y/A7XsolYR047Nxm/CjgCsRR8PVMO1nVYCPQkZC7Un8E3nDAqbCXxe
 6wNoDoDbUakUBrCt5aeb85LZHmbp5fwS2/1y+fqcd1b86Dw8NbCVXCciqhjAAQFj3yCR
 nkUE27vrqU6xBlgd/P+fJSJJVT7P0A51r4Hd93ijM6vYcku4zi0Rz59Ln/ADjR2Qt6kH
 4LvA==
X-Gm-Message-State: ANhLgQ2pazrSScnBy5NTipZj+Lz2ugKfgmENxgK5nbySRtbkOLRQAU0p
 JGEI9N1q8/ofBz0FNk4Axd2VXA5U/1aAVw==
X-Google-Smtp-Source: ADFU+vveOm9WETVG6en/Um/PkNxRnF2iSsSH3++tZKX7ih4UuINneoUMaS1ULThCICkRSVNXjkqcZQ==
X-Received: by 2002:a17:902:302:: with SMTP id 2mr1772352pld.58.1583196539571; 
 Mon, 02 Mar 2020 16:48:59 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id 72sm12534071pgd.86.2020.03.02.16.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:48:59 -0800 (PST)
Subject: [PULL 01/38] target/riscv: Convert MIP CSR to target_ulong
Date: Mon,  2 Mar 2020 16:48:11 -0800
Message-Id: <20200303004848.136788-2-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::102b
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:03 -0000

From: Alistair Francis <alistair.francis@wdc.com>

The MIP CSR is a xlen CSR, it was only 32-bits to allow atomic access.
Now that we don't use atomics for MIP we can change this back to a xlen
CSR.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu.c | 2 +-
 target/riscv/cpu.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8c86ebc109..efbd676edb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -224,7 +224,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #ifndef CONFIG_USER_ONLY
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", env->mstatus);
-    qemu_fprintf(f, " %s 0x%x\n", "mip     ", env->mip);
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ", env->mip);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mie     ", env->mie);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mideleg ", env->mideleg);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "medeleg ", env->medeleg);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index de0a8d893a..95de9e58a2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -121,7 +121,7 @@ struct CPURISCVState {
     target_ulong mhartid;
     target_ulong mstatus;
 
-    uint32_t mip;
+    target_ulong mip;
     uint32_t miclaim;
 
     target_ulong mie;
-- 
2.25.0.265.gbab2e86ba0-goog


