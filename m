Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dSi-0003vU-Rw
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSf-0003st-5x
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:26 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSc-00080d-3p
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:24 -0400
Received: by mail-pl1-x629.google.com with SMTP id u10so17816484plr.7
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rAe65mQIx6pZoNM/rbKMGrIY0zLbjlJXMGbPmJEv2dg=;
 b=PpDMDk3cJ9ht/ukl1BFiD+aWvRNFw4c3gI0NaizdncvPXstc5dq6vUVok6o8gKnylH
 4Nl3I1o5fY4Ybvck7/+kQ7ad82kmWg/CGbKMwkIe6B5NlV924T5tybQfy/1wVhmnEq1G
 hHcHJWk+p+G+2blp+l9QnB1loJVuL+N9CGk0zSDqDXkOqG8R11R6ec1ke4uD6qh1eRIp
 HyFJxCR8YeJxMaJXvB11fwEZGF7H2YXDfs1kBIzoJ5I5pqCKYloW2mtVxZ8V9MM6DFDc
 bw9weKlddHF4PLRvzzg2PZM/B8t5R1Whr2+oBE4L4dUvc2rr/mLSmmIDlaRRKzF1YaYo
 wbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rAe65mQIx6pZoNM/rbKMGrIY0zLbjlJXMGbPmJEv2dg=;
 b=hyJsZZhPfOk3OBqjw6B2rzjksTi7hdY76zlFgsBRk5B6JfJ2YnAq7Kg6pWgU9PX7dU
 nbKS0RXXRfeyfBkI2jmV5Vr5uo0lWVaciOcIzgPODKuEaYM9EBb0bchdks8YXD50tLDB
 d4IedRwbw/i3aqZfomPR5TgaCKpAM8Ii052pREApynkrMvG9a0I7hJM6WownhT7e1nRF
 fr2/IkV4K1BHnS/fGd5NVgvkHBZy5z6SR1GxbQtkG2LGK2itPpf3jtHHsHwHUeyLsHAn
 umPFCkZwiQy0CZSZBv35amKYyJaiAe9mhU61xjoTu529NHoVz6VkNQb2+BBEthTWhYR+
 NB/A==
X-Gm-Message-State: AOAM531D88RTDAwrmdBnanECbgRz9HGNwLIsWhUKU6kWs35xWSHv0mJp
 QOMBWGBdDrO8rtt6oKADtLXHUQ==
X-Google-Smtp-Source: ABdhPJyyiOt4I0jkYGagOyc0gnQoZWh0jhPsi+c3ByPRuG989v1XGT997lLCLh80biVkVQ6W7DtrgA==
X-Received: by 2002:a17:90b:4d0f:: with SMTP id
 mw15mr7593385pjb.174.1596710960900; 
 Thu, 06 Aug 2020 03:49:20 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:49:20 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 49/71] target/riscv: rvv-1.0: single-width saturating add and
 subtract instructions
Date: Thu,  6 Aug 2020 18:46:46 +0800
Message-Id: <20200806104709.13235-50-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:49:27 -0000

From: Frank Chang <frank.chang@sifive.com>

Sign-extend vsaddu.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 263f2535d8c..c2eda17c0ce 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2329,7 +2329,7 @@ GEN_OPIVX_TRANS(vsaddu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vsadd_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssubu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssub_vx,  opivx_check)
-GEN_OPIVI_TRANS(vsaddu_vi, IMM_ZX, vsaddu_vx, opivx_check)
+GEN_OPIVI_TRANS(vsaddu_vi, IMM_SX, vsaddu_vx, opivx_check)
 GEN_OPIVI_TRANS(vsadd_vi, IMM_SX, vsadd_vx, opivx_check)
 
 /* Vector Single-Width Averaging Add and Subtract */
-- 
2.17.1


