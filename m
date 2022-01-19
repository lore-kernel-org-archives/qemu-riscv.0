Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nACsU-00081Q-Jw
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 10:28:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACsR-0007qH-Oe
 for qemu-riscv@nongnu.org; Wed, 19 Jan 2022 10:27:59 -0500
Received: from [2607:f8b0:4864:20::102a] (port=36697
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACsQ-0000YW-6R
 for qemu-riscv@nongnu.org; Wed, 19 Jan 2022 10:27:59 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 i8-20020a17090a138800b001b3936fb375so6791959pja.1
 for <qemu-riscv@nongnu.org>; Wed, 19 Jan 2022 07:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CnHH56RqfoB2RJzhhfZR7f6puxrawvCR54T85x1CXEM=;
 b=pm33744mSbETIHzlSPZ5BoX7TSbrcaik3YNtZGgmVTHJt29klTbHZm9E64GHRt4Rau
 teiHWIEL3CVoZElu3vzkOLSfUJ98du7GtmL+ZgZm+ceyMn/euPmvd8/cbJMm0WK23LcL
 9HsZmhbQPPYZcWQ9dQJ0ymgEU3hCkHnDQAuyVMsCTuExvzWtOhgwtwbK/d1wd5EUR1E/
 +6VeQviwhoUqOrIHZEhNRN+IehF/y64ecHMAU/+yqs+WAR85E7Y6ItWeCu5JHoLZL1zX
 w97g3LGdEjqCe5DPa0qXvuFFrHYB7PRgdP6rJ4bX8bRqu/ECyVFtTADyUse1e87cHxAr
 oPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CnHH56RqfoB2RJzhhfZR7f6puxrawvCR54T85x1CXEM=;
 b=G5e00Wa4DaBom4xrTZS1RhucMfPblTQYX2iNnVrGrKTINLwGfwZaGewS27y2Vz6DEU
 /Er8bymTWpIUPcaGCpVmNHRPKjqUVJJ08RULZZ8yTxDC8nDlUgYqRgHNE5LeZKm2Suay
 H2xC7gjjEhwMTvtOOPikmgnLylNqFcGM/EeMLOzbpmcv5LpIoZ5hll2bnoxyQPcyKpb+
 CVr7vqrf6LsQ03PH2EaudiCp+O6Wh4GPZEWer8nOYbTVefya2T6t/VITzMS8e/pMElAk
 i4zKpG5H+JAmeyNORhvDRPONTOgzm3JJBhLZ401UO6tsog/ylRAblZqW5EOujWGi1Zy1
 mxgA==
X-Gm-Message-State: AOAM530nls38Vs6s+CRTOKPA+0yYczIRrJF6c/H9AVk5gwHzGzHddMNx
 +L0bWwiJr87flRX/I/EW8smw5w==
X-Google-Smtp-Source: ABdhPJxe1w3frYoNS2FHJ7zvr510pvLtnCJRf4u0Hx+39u05MmmKEBxxdjFQgV4s000Xiu8cM8h1+g==
X-Received: by 2002:a17:90a:2e81:: with SMTP id
 r1mr5029697pjd.174.1642606065867; 
 Wed, 19 Jan 2022 07:27:45 -0800 (PST)
Received: from localhost.localdomain ([122.179.40.245])
 by smtp.gmail.com with ESMTPSA id 187sm26791pfv.157.2022.01.19.07.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:27:45 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v8 17/23] target/riscv: Allow users to force enable AIA CSRs
 in HART
Date: Wed, 19 Jan 2022 20:56:08 +0530
Message-Id: <20220119152614.27548-18-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119152614.27548-1-anup@brainfault.org>
References: <20220119152614.27548-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=anup@brainfault.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 19 Jan 2022 15:28:00 -0000

From: Anup Patel <anup.patel@wdc.com>

We add "x-aia" command-line option for RISC-V HART using which
allows users to force enable CPU AIA CSRs without changing the
interrupt controller available in RISC-V machine.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 5 +++++
 target/riscv/cpu.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f137c4bffb..2668f9c358 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -508,6 +508,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    if (cpu->cfg.aia) {
+        riscv_set_feature(env, RISCV_FEATURE_AIA);
+    }
+
     set_resetvec(env, cpu->cfg.resetvec);
 
     /* Validate that MISA_MXL is set properly. */
@@ -749,6 +753,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
+    DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
 
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 058ea9ce99..9d24d678e9 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -387,6 +387,7 @@ struct RISCVCPU {
         bool mmu;
         bool pmp;
         bool epmp;
+        bool aia;
         uint64_t resetvec;
     } cfg;
 };
-- 
2.25.1


