Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nACrS-0006R2-NL
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 10:26:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACrR-0006Lf-Cj
 for qemu-riscv@nongnu.org; Wed, 19 Jan 2022 10:26:57 -0500
Received: from [2607:f8b0:4864:20::534] (port=38487
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACrO-0000P2-TY
 for qemu-riscv@nongnu.org; Wed, 19 Jan 2022 10:26:57 -0500
Received: by mail-pg1-x534.google.com with SMTP id q75so2945510pgq.5
 for <qemu-riscv@nongnu.org>; Wed, 19 Jan 2022 07:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1GVP1+tizrJyU2/+6CbvcCVlYw+KyTfPxuHOE4U9bx8=;
 b=WtdJo2P9G9DfNuVDwLK5TJjkOOmOe4NdN6WoNsO3Av5RmhRAnBVnlcYaD5oeszIXot
 AX6whr433lECLJcGQdt2YLMI9lzsTookJ1AKD+McmpFdQVgxAwGmXQC4YSTu2cc0wMuT
 KrJD7TpZCzv8WscSowUEi/2dpolwsc9ZYuxbkF6Yb+b/W/IjUV+mG1wq7bv/ZvZe5z3h
 fxRiRCR2GHKboZMiDGB/Uo3PKjc4bSFdp4yQTXcXUSx3yVG+4Va7+F9WnKb1cWDGo+qm
 pJBpCy0DVoTtyxLGwh1aC9mkBQB7ufa8Jb22ISLQQsr0FKmjmRxuOsryZtgysJtUver+
 XsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1GVP1+tizrJyU2/+6CbvcCVlYw+KyTfPxuHOE4U9bx8=;
 b=VqlG5zj1rF/sfKI95jRhe2QmeS23iEL366bdlDA49gW+ajnshQKgNvzKCJJKf75sjy
 GmVrm+Xf1CnllZ6/EIaDnkEgHXv3BCpKTff/SoMndzyBhGLJe44JkLuDTsdtZ2m8E6rm
 uXiuWRLwMeECT/evtPMUoSziRH8dUEr4g11mQhalc0BGpmz66pemOVrpwSPXIanY26FE
 /+FMo/JkIv+faaPevv421a4voEIVc98APklNy9WE6DXw88DYqbOFWBhlrdIz2vCnUvkR
 0CyAUYQrZ6djxvfyGBpSO2h5exvh4uJ0E5si5ioMSwuvc5xFtkBrT3nmCBvUlC1O8Zon
 X1ng==
X-Gm-Message-State: AOAM5314nOyMFdH17Hg7ZqDB08K/ga2WqBh6KE/3xoTg9wgxyYJ4PlGB
 wNoN3Ri6tIY0lxlWN6O0bhfAMA==
X-Google-Smtp-Source: ABdhPJxCdtMkkN1kSUzAnOSEqSRZbWxjIUOnqLlpILuvJEYyvCk9jJY+oxNifguyW9wE77+Wr/ol/Q==
X-Received: by 2002:a63:3e02:: with SMTP id l2mr27516737pga.412.1642606012267; 
 Wed, 19 Jan 2022 07:26:52 -0800 (PST)
Received: from localhost.localdomain ([122.179.40.245])
 by smtp.gmail.com with ESMTPSA id 187sm26791pfv.157.2022.01.19.07.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:26:51 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v8 06/23] target/riscv: Add AIA cpu feature
Date: Wed, 19 Jan 2022 20:55:57 +0530
Message-Id: <20220119152614.27548-7-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119152614.27548-1-anup@brainfault.org>
References: <20220119152614.27548-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::534;
 envelope-from=anup@brainfault.org; helo=mail-pg1-x534.google.com
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
X-List-Received-Date: Wed, 19 Jan 2022 15:26:57 -0000

From: Anup Patel <anup.patel@wdc.com>

We define a CPU feature for AIA CSR support in RISC-V CPUs which
can be set by machine/device emulation. The RISC-V CSR emulation
will also check this feature for emulating AIA CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f24b6963b0..070d741297 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -78,7 +78,8 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA
+    RISCV_FEATURE_MISA,
+    RISCV_FEATURE_AIA
 };
 
 #define PRIV_VERSION_1_10_0 0x00011000
-- 
2.25.1


