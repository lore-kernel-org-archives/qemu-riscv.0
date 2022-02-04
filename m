Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nG2hY-0006Lj-Hq
	for mharc-qemu-riscv@gnu.org; Fri, 04 Feb 2022 12:48:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2hS-0006GT-OH
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:48:46 -0500
Received: from [2a00:1450:4864:20::336] (port=39537
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2hP-00042i-Ci
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:48:46 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 o1-20020a1c4d01000000b0034d95625e1fso9908252wmh.4
 for <qemu-riscv@nongnu.org>; Fri, 04 Feb 2022 09:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CWcEcKKXy+fNKuWe6BdFdObuWK96LmaHxLY4SkbstK4=;
 b=3hevw2QNesbci7wTTJIFASbONBzKqrJqWo7rvebZNHvcR8OHWN1mx+TWcI8ZUV1moT
 rLQZ/Nxekoldc2nKR2DyZkeq+DZXcqBRv21uyCXP+7AtI3k0rCqKraJq4vtle694uvTV
 m7EO3BGRUjkCnMBgivRRL3IFevOwYL9W6BL8YU1oc0A5yqt78MQFZrvbD/GOt7u7yUto
 WTrzc6P1S7EPYRpYO0SU87U1tXo+QaugrUGB6NiDHYQ0GhZC9KRIT0PqLqrzU2Zyo3pZ
 4QMwXl+ufXqvVeh3q7s4To5rm1cObB2aBrl8E0Dwhtlau07FOGImUsh8sJg03qKrbIBH
 oC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CWcEcKKXy+fNKuWe6BdFdObuWK96LmaHxLY4SkbstK4=;
 b=L9avoUbXFeRTEfQBpWQ1AWl99tI2CGmcrHomBKPQBUfbFl9rumAGtoD8ovYcmKxlLZ
 KSHgAxz96Pi54VYqApeGOGg9XxaqGfGJW/f9JcTQ7vcRWyBsLHv/569yd+RbRKR+rv++
 ZOk/LMGqYX03pksN3nquZc4TnYXvi/hIofyyeuCQKdN302k3aFbocnc+17bdTpTMvq4U
 3x8+mimgUEChIwslfX9QWNaNm7V4HIeOLR3htEmnydoNCeLINxh9cN8IzeIRas8FU78r
 nkXkjC+mEE8+nBAamxwubf9fh56uuJHjZ36IyRXnoeRB7eTnJKqnSL6Res+TpZfqUqn5
 WGYA==
X-Gm-Message-State: AOAM532K47Kx/DOR8MATjPJQmbej/tRoSyCst8oRP46Ikd0vFijQ+J3O
 mqLGxXiHtUs2x3Lx32C9v4X6Dw==
X-Google-Smtp-Source: ABdhPJw5BEsQq68aXgZwd2Y7CeZHzNoZ5ofiPJzgomvbNcKV8Rn0xqIzKDpkj5PZJ7C9lrs0NTCsfg==
X-Received: by 2002:a7b:c4c5:: with SMTP id g5mr3085728wmk.139.1643996921989; 
 Fri, 04 Feb 2022 09:48:41 -0800 (PST)
Received: from localhost.localdomain ([122.167.157.188])
 by smtp.gmail.com with ESMTPSA id f13sm11381876wmq.29.2022.02.04.09.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:48:41 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v9 17/23] target/riscv: Allow users to force enable AIA CSRs
 in HART
Date: Fri,  4 Feb 2022 23:16:53 +0530
Message-Id: <20220204174700.534953-18-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
References: <20220204174700.534953-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::336;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Fri, 04 Feb 2022 17:48:47 -0000

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
index aa183d3c17..2afd02d713 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -537,6 +537,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    if (cpu->cfg.aia) {
+        riscv_set_feature(env, RISCV_FEATURE_AIA);
+    }
+
     set_resetvec(env, cpu->cfg.resetvec);
 
     /* Validate that MISA_MXL is set properly. */
@@ -782,6 +786,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
+    DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
 
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c70de10c85..7ecb1387dd 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -376,6 +376,7 @@ struct RISCVCPUConfig {
     bool mmu;
     bool pmp;
     bool epmp;
+    bool aia;
     uint64_t resetvec;
 };
 
-- 
2.25.1


