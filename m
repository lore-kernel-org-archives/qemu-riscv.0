Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oO5uU-00032Y-GF
	for mharc-qemu-riscv@gnu.org; Tue, 16 Aug 2022 19:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oO5uL-0002rG-LB
 for qemu-riscv@nongnu.org; Tue, 16 Aug 2022 19:23:37 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:41917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oO5uI-0007ib-EP
 for qemu-riscv@nongnu.org; Tue, 16 Aug 2022 19:23:36 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so337007pjl.0
 for <qemu-riscv@nongnu.org>; Tue, 16 Aug 2022 16:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=6weW70ppJZUiwtERnOMubUYZFkxo9pTvCG4Cd5BWJI4=;
 b=GxSACgJO0D3qXlrZd0SR7wn40gC8uDNyaVDhyKtBzsuuH+uaErPW7MIcbQDMMm1ht7
 gmzvj1PxIg7YmvPQjT6tQNpKM7F5s0iSq5BjThIdhnvZ/0wjazRepg5uMoH3tiON9QJd
 1acPgyCogiiQ2lGe9R5mYWfFf326Yoa1YoeVsfF/WUpJ0q8GjmlLTMrTTySYbE/EqvGN
 ga8bW5MN/XzUM72WGORpu2Sq7fNrRgJ/ot4XbpsAyGXiRAhl882MgsCNBQWaauhUHB1h
 2IXpiZcHpfCP+e8Gv2M8LlirmptTxVUt94Y8U50QBVuTpil5xbMR1Tbgi/3mor2tqj6J
 899w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6weW70ppJZUiwtERnOMubUYZFkxo9pTvCG4Cd5BWJI4=;
 b=ChTIJImWb05owxjEJTKMtjBOBiCT2TmVZQBYa+BcaA713iq2g6A/dXDppsGPVX1qHC
 bODBsLmfcZPuGyezkW9b6pLCZ3mbl/z5ZouHtYOONIaB2e6eprEJgooOIeehYxcEhdrS
 x7iz4N7GU6kpm3pqWetVdib/dvnTNiCheeYQoINi7NH51Aw1Hl1omzwrXmLo1LEQWJqt
 AJFUSHakwdtWZHlAmmpzEzYLmIQrn8VFz1ZDHw6BHDoSm158R7v7Mo3SSHrOpUqkV7pH
 CPft0DFmBp5wFgINbzE2BADhtk3gD/wC0b80e7UG/HpNYtHfcUwTFC9b6xHyZ2V5mO06
 Ad0Q==
X-Gm-Message-State: ACgBeo0AyyoVDV/b91BLjtBT7V2LtYySWS4OGeXU6iPwgavco011L0nl
 uPZk7GD+R8G6JgcqW+lKl4/L8A==
X-Google-Smtp-Source: AA6agR6w/Ms1609DFOB7EKIdCfc9zLxivPSG2KbDSgA7qJPcpYchkqMv3naZc2u0LzkaZYwvkHlmRA==
X-Received: by 2002:a17:902:7c05:b0:16d:2c63:da90 with SMTP id
 x5-20020a1709027c0500b0016d2c63da90mr23762058pll.27.1660692212355; 
 Tue, 16 Aug 2022 16:23:32 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a17090a2c4400b001eafa265869sm78608pjm.56.2022.08.16.16.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 16:23:31 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v13 6/6] target/riscv: Remove additional priv version check
 for mcountinhibit
Date: Tue, 16 Aug 2022 16:23:21 -0700
Message-Id: <20220816232321.558250-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220816232321.558250-1-atishp@rivosinc.com>
References: <20220816232321.558250-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 16 Aug 2022 23:23:37 -0000

With .min_priv_version, additiona priv version check is uncessary
for mcountinhibit read/write functions.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 07b8b4eb1768..2dcd4e5b2d40 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1640,10 +1640,6 @@ static RISCVException write_mtvec(CPURISCVState *env, int csrno,
 static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
                                          target_ulong *val)
 {
-    if (env->priv_ver < PRIV_VERSION_1_11_0) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
     *val = env->mcountinhibit;
     return RISCV_EXCP_NONE;
 }
@@ -1654,10 +1650,6 @@ static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
     int cidx;
     PMUCTRState *counter;
 
-    if (env->priv_ver < PRIV_VERSION_1_11_0) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
     env->mcountinhibit = val;
 
     /* Check if any other counter is also monitoring cycles/instructions */
-- 
2.25.1


