Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kVVaf-0008A1-Vv
	for mharc-qemu-riscv@gnu.org; Thu, 22 Oct 2020 04:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kVVac-00087h-Bo; Thu, 22 Oct 2020 04:04:52 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:46731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kVVaY-0006tj-No; Thu, 22 Oct 2020 04:04:48 -0400
Received: by mail-lj1-x242.google.com with SMTP id c21so920165ljn.13;
 Thu, 22 Oct 2020 01:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WmDOUqzmm4YvxIZYkfaW1jt4NlCUvEDA4fCo/yUiw8I=;
 b=MONxc6Yr1Bu4tf5cGOiZDyt+vbrBLdUXx0oOPTJP7C/FqLJY1uDArajfYK0PHEMDDm
 UxYjv3I3BFQ/WZfqzVRur2pW+BSpPg+5EvkXKgVVd/awhckcMh9CbWww51kDZyyjJSpG
 UZo6twHIa54FhR8EDL/ArqBQoGJM5zTQUDJ7kAc4NKqcIeL97caBDJRI5FubgdfLmMOw
 YXhwtqDM13YD02hFS74D0uZmFn1DjLcCsVErmg6hkQ83aEQcqXuILaSNwOJMC+mw3pxV
 1JeCYylTiTVCfGj1MwAzpM8nmLujMs2TUVFQjkNE1p7ua57Gssz9l/3gWu6GbC8EnWK/
 YkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WmDOUqzmm4YvxIZYkfaW1jt4NlCUvEDA4fCo/yUiw8I=;
 b=RdLK7/W6rB3UimUTOUG02U0cOhWrFIR0TP+niF3/2OuOhLPrJ961Hp0mS3iCVFNkDq
 fKxFlWrHmZYvGDLY20EphcZR9X9oa7Nj1nYbaMBMH0ZfaE/JU6xGQzuiV/t6mIPsPuu4
 dq5xDwL2E4xFw8LZFQC16Tc9e481EbrxSkw22MK3+PXMS3JqtfhGSh4NKHCyj6kwUHZL
 zCcd4MKhwa+fCx/1fyC5exz/kaYZoPNRnzDDUYL2FV/rRXxV4sngzKA7xRfxuLW4RJmO
 A8al1gnusi8SmJaGplz3jXnygvCQ/hxZMeJN8zaU/Zw2PBfDNP1dzVsd4F5hVW4/V6Vl
 0efg==
X-Gm-Message-State: AOAM5338rqBBLdr9jDf012A5580eiEehvA+QTfY78CpICrJ/40YNPNX7
 hOcMcLuI8ComjDgyLdZMeCM=
X-Google-Smtp-Source: ABdhPJz5n0W1+jDT2RzptwxiHZGezwvpWL7fyJyFSJn8pRK5rpSug2CR5wLjgTa9kAUfX9f+x1d9sw==
X-Received: by 2002:a2e:8787:: with SMTP id n7mr552819lji.111.1603353883855;
 Thu, 22 Oct 2020 01:04:43 -0700 (PDT)
Received: from neptune.lab ([46.39.229.104])
 by smtp.googlemail.com with ESMTPSA id l8sm143682lfk.203.2020.10.22.01.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 01:04:43 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v6 1/6] [RISCV_PM] Add J-extension into RISC-V
Date: Thu, 22 Oct 2020 11:04:35 +0300
Message-Id: <20201022080440.10069-2-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022080440.10069-1-space.monkey.delivers@gmail.com>
References: <20201022080440.10069-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::242;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lj1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 22 Oct 2020 08:04:52 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
---
 target/riscv/cpu.c | 1 +
 target/riscv/cpu.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0bbfd7f457..4e305249b3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -516,6 +516,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index de275782e6..eca611a367 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -66,6 +66,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVJ RV('J')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -277,6 +278,7 @@ struct RISCVCPU {
         bool ext_s;
         bool ext_u;
         bool ext_h;
+        bool ext_j;
         bool ext_v;
         bool ext_counters;
         bool ext_ifencei;
-- 
2.20.1


