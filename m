Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdz8p-0008H1-C4
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 14:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mdz8j-00087L-4I; Fri, 22 Oct 2021 14:19:37 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:38624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mdz8e-0004sV-2q; Fri, 22 Oct 2021 14:19:36 -0400
Received: by mail-ed1-x52b.google.com with SMTP id r4so611848edi.5;
 Fri, 22 Oct 2021 11:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qRkVlY5FpL2EgGFei+8X6hixFzpDnG8xWG9BcSES9JE=;
 b=HIlQXsBFBdYIhl5XXZJn9Ybm1Slfqg4HssfNv62V6stswIRG24EHJrE5speYO0BHqi
 QgaS7LgHvAFrEmrzSMp7jxJLFAMi1McQba2AT7rQZulbRk966uA7MEBO5vhT0pk2ENTs
 xYxAdEgCeVLnWujYz8a72/5Ym1ul9cuULLtDvy1eKG2uwDs+iWYWijwDr1eopj35y2JL
 ANLViTxqqWVHMe4FEczDJO13XDuu5AO5266EuFZeMLfLiynDVf/GsS4Ryvcur8W4KpaV
 Uo9NraKNWVRUsR40T65Oo39ymcOge6lZqeIKAbGhu2/h+l+1LP3AuWTZsmijcnM6NXYI
 FwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qRkVlY5FpL2EgGFei+8X6hixFzpDnG8xWG9BcSES9JE=;
 b=pH63uoSeX75ChpigB/VUF14r7D6++ZNH3sgEw4bSt6eBTULNaHHSkWqKcjCZkRVDj2
 J/j2HyygfZwn+re53KyoGvy072edQfME6u0VkyYCytzMtBFXUv2PXsyqtKYRip5w1Hul
 7Xk7btTt0xy5HT4TCL4xNPMJ9AZI08VD84N/pfBfnc1v/bIMJ63DpL6EIPe0qv2gWtRg
 jFxjcvrtqN4FdOtz3D5AjQKKsgsIbh/tC68ZTBk+Ia/XuNgddWzUiTm3E2W3HlJ1Jrr6
 mnsJBN/TxYJeXXu0uYdMxr0mJ8CTLffHkvQ6rDK7QD0ay89t0bjIWpHLvXoX6xRx6gB8
 R+Hw==
X-Gm-Message-State: AOAM5305L9Fuo3ExCKmq5AZJrjlarzri9DniEEUQ6v2VuttQe7cuSyu6
 OwY9r+fz8Vd7srjIUXSx0VY=
X-Google-Smtp-Source: ABdhPJxFx4bcgRYW7ZncEOKm6ZZ6me8HRLQqbb/XKEuqileJPKY4f0EtyP1HP4woyYh+FcHFkDZvpg==
X-Received: by 2002:a17:907:e94:: with SMTP id
 ho20mr1389226ejc.243.1634926769705; 
 Fri, 22 Oct 2021 11:19:29 -0700 (PDT)
Received: from neptune.lab ([46.39.229.76])
 by smtp.googlemail.com with ESMTPSA id p22sm4233079ejl.90.2021.10.22.11.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 11:19:29 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v16 8/8] [RISCV_PM] Allow experimental J-ext to be turned on
Date: Fri, 22 Oct 2021 21:19:10 +0300
Message-Id: <20211022181910.1999197-9-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211022181910.1999197-1-space.monkey.delivers@gmail.com>
References: <20211022181910.1999197-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 22 Oct 2021 18:19:37 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 16fac64806..7d53125dbc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -562,6 +562,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             }
             set_vext_version(env, vext_version);
         }
+        if (cpu->cfg.ext_j) {
+            ext |= RVJ;
+        }
 
         set_misa(env, env->misa_mxl, ext);
     }
@@ -637,6 +640,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
-- 
2.30.2


