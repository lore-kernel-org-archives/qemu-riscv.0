Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pS0uZ-0005Vz-QD
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 14:24:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0uX-0005UI-W7
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 14:24:18 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0uV-00057x-QY
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 14:24:17 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 38-20020a9d04a9000000b0068f24f576c5so4694151otm.11
 for <qemu-riscv@nongnu.org>; Tue, 14 Feb 2023 11:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cMFKPH9qknFFr+qQ/mVoscH7RvpHHWaMtNC96kfwxRU=;
 b=ou7UVa0qsdi1+o7Rsw3a4nH+NECl+G4fMq/G3lkrlP+qh/VGmyOKlEweXDw8t9yc7M
 jxiE/YP2vCldpi6Uz7cd8g9nIj1INDVRneWCZHZkXUVgtGc2uaPVOEccRhXzmhH0tT1k
 TeqSccfPG6aoEFUFwQ7sC5CLgAngl/bAlktywoa1m5ZesA1ECDH/NGfv5IC3zvrnokdJ
 Ue3r2xJMCQEzrgNeyMFAcdA7Dckv4WEFX392I8r2P0HbrAoGBQKSoUom2R2Xro5CZjjk
 cj4iX5gVEjhrERm8T2onR1lFbNflY3JUBOLQgtZ3V8PsC24nynGKtseNuMBNEHRCblaw
 0bQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cMFKPH9qknFFr+qQ/mVoscH7RvpHHWaMtNC96kfwxRU=;
 b=jABxtYHGrWgDfMC/YNJtqNDL3mxe6Xno++KPzBldg1LOpWnXLPkE/g8OOIapJoA0UL
 sa4Yvi7j0Jrs23XArzzlDC+ikxS39cq6tIvI4NQ3BH4ArNQeOy58Z1hpSUpFo8vlN7Qe
 IfWCsEuT3OXH1Cr94wdAAyJS8bC3cbi0CZGgriXAN8g9i1eRFY+rsGoz4WQz04lREXMz
 vYfNUox3DQBiodEZB5ZJ3EZOCHRPP0hWGeBdNyCGolOXyJaBfUoaf8GNka+fMn8wr9XS
 /q4gK/Kgid0a2PndiFIRfjUKanAAbsGk8rf5a/i8Khxvuvx4IcTPZ98ZItq8YeCfRcEy
 fu9Q==
X-Gm-Message-State: AO0yUKWf99aILxG6VxUc8y++PX7m9m0iXWgn+aK1B2pLGdDLqNJq2FsL
 yU6AvR0vzGud+HLut2fpqVOF9g+W+u7S+DCm
X-Google-Smtp-Source: AK7set+XbA+zLLL5ZIIWpsSm0XcBjZ3LkW+otShO4lPVpWysoX4HZbVMB0SBVD5Tl+wDxAyfhdRhGw==
X-Received: by 2002:a9d:57c9:0:b0:68d:3fc8:7c11 with SMTP id
 q9-20020a9d57c9000000b0068d3fc87c11mr344143oti.12.1676402654699; 
 Tue, 14 Feb 2023 11:24:14 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a9d6185000000b006865223e532sm6653752otk.51.2023.02.14.11.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 11:24:14 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 04/11] target/riscv: remove RISCV_FEATURE_MISA
Date: Tue, 14 Feb 2023 16:23:49 -0300
Message-Id: <20230214192356.319991-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214192356.319991-1-dbarboza@ventanamicro.com>
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 14 Feb 2023 19:24:18 -0000

This enum is no longer used after write_misa() started reading the value
from cpu->cfg.misa_w.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fe572b83e9..00a464c9c4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -89,7 +89,6 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA,
     RISCV_FEATURE_DEBUG
 };
 
-- 
2.39.1


