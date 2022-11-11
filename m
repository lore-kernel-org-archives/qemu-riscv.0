Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1otYj1-0008Ae-8t
	for mharc-qemu-riscv@gnu.org; Fri, 11 Nov 2022 13:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYit-000861-3O
 for qemu-riscv@nongnu.org; Fri, 11 Nov 2022 13:25:53 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYim-0005Gd-Fx
 for qemu-riscv@nongnu.org; Fri, 11 Nov 2022 13:25:49 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 t25-20020a1c7719000000b003cfa34ea516so5894669wmi.1
 for <qemu-riscv@nongnu.org>; Fri, 11 Nov 2022 10:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kIPHK6op8WfT+LuyUEUjPy9me25/GAi6rKKy/+XKxJ0=;
 b=XDQdgaEEYl9OP3SbewpFNKKQCGkTSxrf959z8bsOyzzLTs5GgxAOXfAnNbBMTs2R43
 Ot91xlWiiHI69BMXBErNw8/a4MQCrXtDKCSYnX91ntnCzja2dkznCtDNZ56AgEBLOA8k
 fN5Y8YqV/J8HDu+vtt0hNUbW0mo4xhS+u/9RiRbLqBAYf2pMfMu6hTt66sYrvhXaE1FU
 gQ/QHXNpWrMwWn31s0EWU0ItkIYg6miPOS66nNKpGOxqimA1QQTIqXsWcr+zqTyDi/vf
 jTZ/M3ttY04jghepwxpW7C8C8o3MjjfCi522QcoYLGUdKYeKR0Z5mwIDudSyraPPZtD/
 rH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kIPHK6op8WfT+LuyUEUjPy9me25/GAi6rKKy/+XKxJ0=;
 b=a9M1KJqtoTYffLPzX5kSGfJIKOGnolWBTsfrXEH7edg1bvbWlrDOmeXtyaguyaPVDe
 BTbmtSaHoBgg7qjmPR6YJZaMTS35YVb1IxEh5f8W9nTQRoPw5/5UFLBLFJ9mbIXIawE3
 JkvGvg4cTe1waLWkr46QmQL3Q+R97WZ5+89UccdMWQ72aJx1eVBJ9kPS4drXF3fNN6Dk
 P2T1p+5A337oDZPPhVQHOSwieemYtu+DLG6NswHt6CPrE2ZoTx0l08Rhs7LtypPc1xYH
 9PW1XAjq13IeVbaMOv5jIpFpUvWw+h5Qx8FCwR5g3J4rgdpwYhb1MxFsW2lo7OTmPSAM
 V5fw==
X-Gm-Message-State: ANoB5plvJcqx6ebhURK36MIaCnJhEWZtxRMjlfZGypyrgEtzSSXGap6F
 iDJ0iz63ahvVxHteBgef5hHfOARwB3AMrQ==
X-Google-Smtp-Source: AA0mqf5p/4IItR+2i45oxsv2ufuvpmReAF2wpmKiqDajbJ1STalmURi1Hda3uUniBmR/3xQivaKZVg==
X-Received: by 2002:a05:600c:511d:b0:3cf:9a6a:c72a with SMTP id
 o29-20020a05600c511d00b003cf9a6ac72amr2161651wms.168.1668191142863; 
 Fri, 11 Nov 2022 10:25:42 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a05600c155400b003c6f3e5ba42sm11363679wmg.46.2022.11.11.10.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 10:25:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D05821FFC3;
 Fri, 11 Nov 2022 18:25:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH  v5 12/20] target/riscv: initialise MemTxAttrs for CPU access
Date: Fri, 11 Nov 2022 18:25:27 +0000
Message-Id: <20221111182535.64844-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
X-List-Received-Date: Fri, 11 Nov 2022 18:25:54 -0000

get_physical_address works in the CPU context. Use the new
MEMTXATTRS_CPU constructor to ensure the correct CPU id is filled in
should it ever be needed by any devices later.

Currently the tlb_fill function isn't using the set with attributes
function so IO accesses from the softmmu slow-path will not be tagged
as coming from the CPU.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 278d163803..e661f9e68a 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -761,7 +761,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
      * correct, but the value visible to the exception handler
      * (riscv_cpu_do_interrupt) is correct */
     MemTxResult res;
-    MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+    MemTxAttrs attrs = MEMTXATTRS_CPU(env_cpu(env));
     int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
     bool use_background = false;
     hwaddr ppn;
-- 
2.34.1


