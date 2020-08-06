Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dT2-0004Ts-RT
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dT0-0004PO-RO
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:46 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:37977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSz-000844-28
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:46 -0400
Received: by mail-pf1-x430.google.com with SMTP id d22so6391615pfn.5
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=La0dMO1EDgYzAK0UH7rJx1lpxEeCZ+SwiTkARPgIAro=;
 b=Cy1E4wOBmKf3E4tPP25ocinfFgXo8DWw52hVG9wuhQChlb+OHvPjo+BcJt8JV1gO1i
 KUOOTmD8d2N53vU6fVxaEviqXEKQ1DZYwgyygFy83u3AXwX6vmvSqx1mq2dKEavWBn4E
 +aEo0HvsVEIdGKheXGudVIUYSL0YWAXgyFVQTTdy37hzIRtTyfqFC2/B3jyHGTAnFLeJ
 hlMO3dqf8aio6pZT37EYUD8UrQBWOFw0t3+mLuRSzOSzvaiA9QYB8W5NECS1ZVl227jT
 PUapNlNJjJj42wv+7/3a2lb0vBZvmOm2k2geh7w5bzNR/J780C+VnuIZRXg8g9SNHtMD
 mrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=La0dMO1EDgYzAK0UH7rJx1lpxEeCZ+SwiTkARPgIAro=;
 b=bNbGmpSXRBee/j8LjHsEdWFTnNBfa3vEB9ogESPh9GucHMXLkQ9j8FEYjlfBT5f2g7
 uF8Hi2o4C2opO0hTeaXmIQrlrmNrfK5cpBVn/aR03+uk9VfZ3pf/pXM25SaPLp3P7n2/
 lOEgP8XF1aFwW7mfZyMS5AxEwq34bnuKOFWvuchKRUBUXuyJMoQiqcvDDIWusCVIg2f1
 KAc7Q6mC8sVrdzv5mGh6pEcataxZhEnIrFl6LitmdT+B80Ar8UrOGbFyMHdEds05IHNK
 gLOoTg+7EEkjahzknJZEwTQG9J0DpJjdLiWp+JUSfm+VE/T0OY/DAXhEbUT6FSxMVBtn
 M+Ww==
X-Gm-Message-State: AOAM5329NrgorNmWKR1r8ZkMFZqjaRRIls9ZdXPERsCBZIb15eVKlPj4
 F/pmPKHgRu2kzPSJC9nk1uxkOw==
X-Google-Smtp-Source: ABdhPJxF0C5XE7WQJpvkMyUq496/h9MzP3bqhYx36lkrYqxLhJis+nCE5tX+hoSDhxOsVK6WLauzWQ==
X-Received: by 2002:aa7:9e1e:: with SMTP id y30mr7143741pfq.120.1596710983826; 
 Thu, 06 Aug 2020 03:49:43 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:49:43 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 59/71] target/riscv: rvv-1.0: single-width scaling shift
 instructions
Date: Thu,  6 Aug 2020 18:46:56 +0800
Message-Id: <20200806104709.13235-60-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x430.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:49:47 -0000

From: Frank Chang <frank.chang@sifive.com>

log(SEW) truncate vssra.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 64bd4aa239d..2a2133a588b 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2360,8 +2360,8 @@ GEN_OPIVV_TRANS(vssrl_vv, opivv_check)
 GEN_OPIVV_TRANS(vssra_vv, opivv_check)
 GEN_OPIVX_TRANS(vssrl_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssra_vx,  opivx_check)
-GEN_OPIVI_TRANS(vssrl_vi, IMM_ZX, vssrl_vx, opivx_check)
-GEN_OPIVI_TRANS(vssra_vi, IMM_SX, vssra_vx, opivx_check)
+GEN_OPIVI_TRANS(vssrl_vi, IMM_TRUNC_SEW, vssrl_vx, opivx_check)
+GEN_OPIVI_TRANS(vssra_vi, IMM_TRUNC_SEW, vssra_vx, opivx_check)
 
 /* Vector Narrowing Fixed-Point Clip Instructions */
 GEN_OPIWV_NARROW_TRANS(vnclipu_wv)
-- 
2.17.1


