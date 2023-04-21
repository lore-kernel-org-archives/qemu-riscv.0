Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppqne-0001Kn-1B
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 09:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqnd-0001KK-Bh
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 09:27:41 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqnb-0003pq-SY
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 09:27:41 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-546de76c23eso1057505eaf.0
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 06:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682083658; x=1684675658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qTEuK/TipxDMuIwEPwLq6RIPLKqwF8JtMA6wZHqbIok=;
 b=GOuOVi7BPulimjHF/C4zItmnc08mTEytxJQVTBfZKZDaUhrgvRP/fZ0RePpEXRQKkP
 IFvLGKYyAbSY4nU98ysvUa4TYkv/eN9cEVwU+do7FpWVU2T0w2PqztXkRp163qhwENR7
 H1iBbdHZntEFfqdk7Z8xelTtz/VK8mu6D4jD+xpghbEkM+v8GZav2d9xIvCX01fVeHJW
 DcJNajDk2gip/h0VmhhFlUkqhTAWUr80FdIE+acEqT+FZgidDHyBWDY1oz7sTGbn76P2
 Vft8+BvoUMMXrWgFGYJUs/5Uo6JAYJKpbHv/ald+dwx7ZxTep2Ma5M2HwiarUp6K1v4o
 ohHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682083658; x=1684675658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qTEuK/TipxDMuIwEPwLq6RIPLKqwF8JtMA6wZHqbIok=;
 b=VOINn/YdX4swnFPwSaXw7YdIsnqCa4OG0DAqqaiqTPmPb0fSA2rjlCAe7gmXHojh+o
 bdg4RbljJ+HAei7CmBoW7bY5XKo5nMeBlLqpCc6vXUsDv89xb0zNqrI2HAuLRAJVgW11
 u8pPsWCBSBwNjc2y8zmvgMKCPS056QPLR4/80LLsdkhEZs4Ovk8UwF6iGLP3oaLcFo/+
 T4UuKvHGl2IiVszMKWW+G4Pes5g7LxYsh2Lfn8/A23sT7jFycnBXoh+gJTtvQx2d/F7Q
 Jvmck3BuiAV6h2beaETCt7gCnxVBjJsNUUpXuVJKntFQ35QdCz7kU3cwKPL2mK11uhYK
 W3gQ==
X-Gm-Message-State: AAQBX9eYVZ3uOr4wV9+mZQF4N8gExSsyJyUkfvmnJjm1Q98y0f0RyjUI
 Mli0Cp6h9pnujEte0CVeVM6c6Q==
X-Google-Smtp-Source: AKy350bRATVbUPPThlId0NdnPzY+Ymtw5SnOUPswiKecIhvCp/63tpZOYxVUVLqpRXptrDJ9EFZ1Lg==
X-Received: by 2002:a05:6808:651:b0:384:67e1:c9f7 with SMTP id
 z17-20020a056808065100b0038467e1c9f7mr2550971oih.45.1682083658603; 
 Fri, 21 Apr 2023 06:27:38 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 r84-20020acada57000000b003895430852dsm1623359oig.54.2023.04.21.06.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 06:27:38 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 02/11] target/riscv/cpu.c: remove set_vext_version()
Date: Fri, 21 Apr 2023 10:27:18 -0300
Message-Id: <20230421132727.121462-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421132727.121462-1-dbarboza@ventanamicro.com>
References: <20230421132727.121462-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 21 Apr 2023 13:27:41 -0000

This setter is doing nothing else but setting env->vext_ver. Assign the
value directly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index feca13aefb..fed7b467e4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -252,11 +252,6 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
     env->priv_ver = priv_ver;
 }
 
-static void set_vext_version(CPURISCVState *env, int vext_ver)
-{
-    env->vext_ver = vext_ver;
-}
-
 #ifndef CONFIG_USER_ONLY
 static uint8_t satp_mode_from_str(const char *satp_mode_str)
 {
@@ -834,7 +829,7 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
         qemu_log("vector version is not specified, "
                  "use the default value v1.0\n");
     }
-    set_vext_version(env, vext_version);
+    env->vext_ver = vext_version;
 }
 
 /*
-- 
2.40.0


