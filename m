Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vkr-0002Xz-CP
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44886)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkI-00019B-Go
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkH-0004Cp-K8
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:14 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:39571)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkH-0004Bw-F3
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:13 -0500
Received: by mail-pg1-x541.google.com with SMTP id s2so665680pgv.6
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=0wZeGuDyxxT2VXK+x2HGJY5RPxs/tRKAPEIo8LLk5uY=;
 b=XRz8aHvw9mwXIJllfEdN32Joh0I3Q5KyN9t1qf2pl3aow0+Oz/XbUVVORg3OxrvMCH
 KbI7ckgAJfYWV61vCmwZdEin6oZ2iV3raqj0SMUJ2z7/KqPESE6n14xqv9ju/SQyyqqi
 zpdbQ8n8MmsNIp6VMJfKnoLw2gGYAnAreSETe2N4k7K6yClqi/KRi1TVnD6JOHp7umWW
 pDXznfp2zVwIhMw5JERt580AO0VUlx/g6CjUNdob333xB269aqXJbGbxbJsTbEpZc9Op
 NAaa8fLqQqv4mPCbJiJlJLJHqlRFwH2RZ2+dkEIUXJ36FkX4oIAbI4EmU13GoDrW9ljy
 LX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=0wZeGuDyxxT2VXK+x2HGJY5RPxs/tRKAPEIo8LLk5uY=;
 b=FqQUai1Mf/i1r4Dr0fFjo7d6IVou2sI7XsVswLPIAjoSPfn7OZ9neOd8EJxLr2J/3N
 OwvaCMPyX0XW+vTRgO1Ied8v/GU8m2FY8Drdv47aiJwUYkufzX/leasPeCUwsK2+tQey
 USM+u4xj8ArJUV83vsQB4Jx7IlOv5bEdRKc8+OdfLcpdbuToC6ovIa1Q1WbroigWttxE
 CON6HDJTuZrS3exuRwsIZ7aRITGnWmceznQcLyu6OfIbCsZavoSNstCk2v/Oe9BZd7d5
 JA3rxh4lmxDszFLTus7ck+qRAehl6Na5FtMh+JLO60I/FpTWh3yyU+fcrPoPjY/d+KpA
 tOHA==
X-Gm-Message-State: ANhLgQ3ac4BE4w5DNO3VLzJJOYW2RAH2ZCJLUAcOPSDsefVibdV3/Xye
 oAR9AiCZ1Baip2U/9M/mJvA6GLsDH0iNFg==
X-Google-Smtp-Source: ADFU+vv5Ipqs5xdMPzfxCudGrPEMJ6k4idS0ZguWp8X8ocBZ5hk1TF1s8F+brQviKvny+Az8eeOlFQ==
X-Received: by 2002:a63:8dc7:: with SMTP id z190mr1524728pgd.39.1583196552103; 
 Mon, 02 Mar 2020 16:49:12 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id 186sm8168133pfz.145.2020.03.02.16.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:11 -0800 (PST)
Subject: [PULL 09/38] target/riscv: Print priv and virt in disas log
Date: Mon,  2 Mar 2020 16:48:19 -0800
Message-Id: <20200303004848.136788-10-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:15 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/translate.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d5de7f468a..eff064dc44 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -810,7 +810,15 @@ static void riscv_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 
 static void riscv_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
 {
+#ifndef CONFIG_USER_ONLY
+    RISCVCPU *rvcpu = RISCV_CPU(cpu);
+    CPURISCVState *env = &rvcpu->env;
+#endif
+
     qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
+#ifndef CONFIG_USER_ONLY
+    qemu_log("Priv: "TARGET_FMT_ld"; Virt: "TARGET_FMT_ld"\n", env->priv, env->virt);
+#endif
     log_target_disas(cpu, dcbase->pc_first, dcbase->tb->size);
 }
 
-- 
2.25.0.265.gbab2e86ba0-goog


