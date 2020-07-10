Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtsch-0006IA-Qo
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqeZ-0005kp-RN
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:53:15 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:41913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqeY-0006pm-7m
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:53:15 -0400
Received: by mail-pl1-x62f.google.com with SMTP id f2so2097090plr.8
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FknZ1UMbodqKW1rGYXsaRm4nCR1UujTfta8rCOpQVsY=;
 b=j2UcR2vYeJwJJaQNK+0ZXH7q2QVYospdsewxsVril9bfdlW8uJFw7sKZDXGdFjxFS+
 2C05wWqmErF4UgnNJoqZmRkxAP+sGOfEKX1FTTGOFjmuVEUUFmt8ODDOiW9fu6xqvaaZ
 XlxxZkg8uzm1wVANo+jXAIVQTs+1y+UvhegRBdlUlKgLrffv8e361Bk4ytfZTeXJqmcg
 SVlvYa/UNe2u57Bg/RmcHV6Bs6I0At5HncwNb6vFY2bmb/WOrPdhZgZCcuEUUfJqVRxs
 5aDiKNjoY6zfEf1LOLbTgH/qXlR7JlU+ZxIuprM2KhxZ6KAN4NaRGabgQkkJbF5F8eKs
 Of0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FknZ1UMbodqKW1rGYXsaRm4nCR1UujTfta8rCOpQVsY=;
 b=V+CTknLto2fNYR1KtDpdifGx9K9xtU8NmLy20CqFWmeP2MAAV27UX+EkFUy8wXgM6z
 WrZ8nPA/J99zN9zrRSugni4WgM5Pjk/JG1akqVWoye+bYI8Mt7CGiLm/Pg8QPKHasny/
 /B0IrFkpYBTXAS6rdMlZ4EZx8yRrEbuncTTaj0rQfjG0mzU4keydrxoMfafQDBNh7Xl0
 8Uo0okvfRLg35ecZPLUn+9/pg+Kh8XM/Zn9+LIHY/f3dHteGzw6+dbR+K918aGOjDSCZ
 +idrNHOghE1tB1l48ZAI63Hrs350Lkh0uQicNXu1h9e/c1wQ5YoXT42Q76qFyRsaYHyI
 AUqQ==
X-Gm-Message-State: AOAM533Xgqt6VqhhXbqzJ04DG40yZF/2Ck4xeqoAqLyvTZmnEEVELnWc
 pSLswYn2c3zZbXw4P33U5IG+0A==
X-Google-Smtp-Source: ABdhPJw8KC/MoLUpDAbNtLcXzoiVMoj8uUR74T//2nz+zvvKig/pBQSxWpRS6SDsyp2gMcjuRGASeQ==
X-Received: by 2002:a17:90a:6048:: with SMTP id
 h8mr4979505pjm.230.1594378391394; 
 Fri, 10 Jul 2020 03:53:11 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:53:11 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 39/65] target/riscv: rvv-0.9: single-width saturating add and
 subtract instructions
Date: Fri, 10 Jul 2020 18:48:53 +0800
Message-Id: <20200710104920.13550-40-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:59:02 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:53:16 -0000

From: Frank Chang <frank.chang@sifive.com>

Sign-extend vsaddu.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 2 +-
 target/riscv/vector_helper.c            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 53c8dce159..152da0bd30 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2141,7 +2141,7 @@ GEN_OPIVX_TRANS(vsaddu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vsadd_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssubu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssub_vx,  opivx_check)
-GEN_OPIVI_TRANS(vsaddu_vi, 1, vsaddu_vx, opivx_check)
+GEN_OPIVI_TRANS(vsaddu_vi, 0, vsaddu_vx, opivx_check)
 GEN_OPIVI_TRANS(vsadd_vi, 0, vsadd_vx, opivx_check)
 
 /* Vector Single-Width Averaging Add and Subtract */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 47ba264f1f..17a98bebe1 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2324,7 +2324,7 @@ vext_vv_rm_2(void *vd, void *v0, void *vs1, void *vs2,
         break;
     }
 
-    clearfn(vd, vta, vl, vl * dsz,  vlmax * dsz);
+    clearfn(vd, vta, vl, vl * dsz, vlmax * dsz);
 }
 
 /* generate helpers for fixed point instructions with OPIVV format */
-- 
2.17.1


