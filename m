Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7asP-0001uU-0Z
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asN-0001rH-Nz
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:19 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:55792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asM-0005Dp-2t
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:19 -0400
Received: by mail-pj1-x102f.google.com with SMTP id 2so7475966pjx.5
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=G8xY9EjYzT0XnuzWLh9hgfRhkrBj0VFGlmYhXAzpEgw=;
 b=lHj1amz4ok9zTImu+WblNSxcqc/q+D5YpCE2cxZ2VBb+JDOKHrMrILUX/Dy/JSKRCl
 ZcBxYgocQsABUZg56JWjPtMSuT3ai6nRWx9nSPtayzycG40ze6F9dIvKYeSc5AJ4voKR
 nCv9vRANQhLcU47EBHyQw85aBqzmT3bIhgRrXmvxZXK1Hk7tHN1AnJxuqlBTYi0OdkLz
 GG7ein4AGp2+LlUpJQyyKp16KmcCuhW/HgUQLmbtnmEOeyc+iRqgobq3kCYuOrpVDMO1
 SJRYVvoVszhuaNwC/KSTeh6lX9pg2mRjJyX+Kw1hiRvBuLT9sOoI9iyT9LRCewFcWZWB
 Efcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=G8xY9EjYzT0XnuzWLh9hgfRhkrBj0VFGlmYhXAzpEgw=;
 b=AMwsgd4nsXLbOqDis9zn8ftfzyoxAvcoj0I3AGSlh3nGCLoRJSpT16uH6IppRC1/rn
 bLW4g2I+DghzSnbt4dL8S4nhBh2Gv0mF6NyB9TeqpyjpxsisR/o4kMhISXXVDJ8Z21ii
 KzkZW7aiEBoLkFrfJjMo6WGfqD3zm+vIG3jTj+nECHJ5vk8CV6sRsRiTGUWBkaqnMPs/
 oIX7JcqUYeY6BAUXUI99L2qyAARP1s2LKHgrUCtcf2XfrtWJyzU5oz1STXRM2zMvwEKj
 jyOrf2hKV6weeZvVkbASxr5wnFCeDFJPIhChhIVMliIzwb7i50zi7ouprnnqGeanNNWr
 Mu3g==
X-Gm-Message-State: AOAM530EZ/5cAa1jpELeRC3491uNlVRj11FgmY7e6b06W/x7IP7M5tbH
 Afc//i9zXk/O3+XtkpS5hKuwVw==
X-Google-Smtp-Source: ABdhPJxFcHqznGu54/4/lAuGGEXeV8phSSmDJXGNLoWOWUnWVrPJvVHb/x0+2ygRDMKOtEG2Pmin1w==
X-Received: by 2002:a17:902:6ac3:: with SMTP id
 i3mr9406278plt.21.1597654336828; 
 Mon, 17 Aug 2020 01:52:16 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:52:16 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 47/70] target/riscv: rvv-1.0: single-width saturating add and
 subtract instructions
Date: Mon, 17 Aug 2020 16:49:32 +0800
Message-Id: <20200817084955.28793-48-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Mon, 17 Aug 2020 08:52:20 -0000

From: Frank Chang <frank.chang@sifive.com>

Sign-extend vsaddu.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 809280f4c5c..ef100254830 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2341,7 +2341,7 @@ GEN_OPIVX_TRANS(vsaddu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vsadd_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssubu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssub_vx,  opivx_check)
-GEN_OPIVI_TRANS(vsaddu_vi, IMM_ZX, vsaddu_vx, opivx_check)
+GEN_OPIVI_TRANS(vsaddu_vi, IMM_SX, vsaddu_vx, opivx_check)
 GEN_OPIVI_TRANS(vsadd_vi, IMM_SX, vsadd_vx, opivx_check)
 
 /* Vector Single-Width Averaging Add and Subtract */
-- 
2.17.1


