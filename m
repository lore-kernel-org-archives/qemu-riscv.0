Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23CCCA5FD4
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 14:04:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCdrb-0004Cn-5I; Fri, 02 Oct 2026 10:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xCdr7-00046a-0e
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 10:03:39 -0400
Received: from mail-pj2-x2a.google.com ([2607:f8b0:4864:39::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xCdr4-00086A-7c
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 10:03:20 -0400
Received: by mail-pj2-x2a.google.com with SMTP id
 d9443c01a7336-2e2d58a3b05so32440675ad.0
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2026 07:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790949793; x=1791554593; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rdntiJw+i8aSECp89xSpKJRa35ej9a/hc4nosI/BmRw=;
 b=eoMXfUqFgtQFS8bTu54GRZgksVZpc2Nw5nrclq+zQiNMPEd3cqSncHrrUszztPKdAe
 NAz6m4FtmDHIXGDTREFssXGT1Ldhry3sPIwmr30KgUhRs5DNM+uhrr3ZlI0L6cnGbX6K
 GHHA2573b4JELZvOy2F896M9PACFO/sLvphkZgHT291ORuaD2v2BSN8g4xWJKHV+OuED
 TeLTlM4LHRYMsakFWOkyM4E0CV8v+V94rl62epOtFMSSYOnLoypZZ2MM7Q5cPst5Nb2N
 +mYnFSXfA6ECcWlv3LzSigLmNSWywD9cPgPTfkDVdOaFqdMn7Ww3NV2l0iWUoB2mB2fW
 AeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790949793; x=1791554593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rdntiJw+i8aSECp89xSpKJRa35ej9a/hc4nosI/BmRw=;
 b=JfRXflMrRWhizStcgNghjO/qG7s7WsIg8Hkh9RXwznAqbnxoOP6kCeu7CIeKjbqzs6
 wc+s7cXUU+bSRKdMzQLHp0c/K7Qw5qbgJZy8h8Ys++ggSqeijzaACL5/iOAOe7B2nmS4
 /LHXn5dShH7yjMqMokD2pD4OgZ5peeu6Uj62msw+ylUUQ+63D3ImlNnMoPTiQf8xfeTe
 XG4j7MYgDCgWhxcUYY8dIHz8TvE8srVl0Rx9nK68kRc53w0rH/P5Eu7PdFLYEemwubsY
 Hsg8U5Q2yvuC0jx0kIen5mVC6b7UaCmrVJ+v5+27SuBniVXc7Wxk/3YEHF96AEmHV4G8
 HyUQ==
X-Gm-Message-State: AFq9FYIkbaqdt7esXWr6XQxW3wt4JgQuUG9prGEin6HtkIUptWbp5/15
 78Ic2IDJGxjRGbMYBUyCuVzWctMyGbthhWsmSlScbERut3afBOggwV+1
X-Gm-Gg: AYBFou3GGAV/SvaHSK5SFirOyE3wDlhn1jERkSomOiu/YhPD2jSlzcEJK4tWL/gIPeg
 oF1p0Q45RR3ZFzZDFBCsrc0wngVErrrahmtSAftT0ZoWLlSCOyM7JVCVkIuMB7evQIi0r2AL4j8
 LQrx/nO/YJnrKSVnytnGyZC1rF6HtMxnr4a77UBCdhvSK0X3h5F42lvU73spr4wBdKcjI+zMEBn
 Zi7GCUVMBsy6hTsk2e2cijXieUyyYmbG+xeCO8ZPbvaXhoGDCt20fQHLrPENYcwXwA9MgahdnLq
 8ifgACKirTfwc3iFM2v5hjA2UD5+4CdmIweG5zvsKbpeY8BoQp7x/YMZ565aRjmKAGDwTge3xhn
 Q9lW4ZzAkBSqzx+i0zy8hUFiaqqdkj8dY5Vv6q+Btv+9x5fTdOm2nXq5WCvvlfm28myMmKZpP4m
 IOGD0Xu13sRgoAxLIM8mCfUgQrH1L3zTLgNn8xOGVXmRPsUaztMxrowVfLrvkWL/10M33B3ImZ/
 GtnnOezstAsBuym
X-Received: by 2002:a17:903:186:b0:2dd:ad74:ac7c with SMTP id
 d9443c01a7336-2e49b67da5dmr26511775ad.23.1790949792627; 
 Fri, 02 Oct 2026 07:03:12 -0700 (PDT)
Received: from dt-VM.localdomain ([101.207.27.235])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f723a77sm7996165ad.71.2026.10.02.07.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 07:03:12 -0700 (PDT)
From: Tao Ding <dingtaodtdt@gmail.com>
X-Google-Original-From: Tao Ding <dingtao0430@163.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, chao.liu@processmission.com, farosas@suse.de,
 lvivier@redhat.com, pbonzini@redhat.com, Alistair.Francis@wdc.com,
 Tao Ding <dingtao0430@163.com>
Subject: [PATCH v2 4/5] qtest: fix k230_decomp_gzip test integer handling
 issues
Date: Fri,  2 Oct 2026 22:02:44 +0800
Message-ID: <20261002140245.30214-5-dingtao0430@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002140245.30214-1-dingtao0430@163.com>
References: <20261002140245.30214-1-dingtao0430@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::2a;
 envelope-from=dingtaodtdt@gmail.com; helo=mail-pj2-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Cast slot to hwaddr before multiplication to prevent 32-bit overflow when 
calculating the SRAM input address. 

Resolves: Coverity CID 1685516

Reported-by: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Tao Ding <dingtao0430@163.com>
---
 tests/qtest/k230-decomp-gzip-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/k230-decomp-gzip-test.c b/tests/qtest/k230-decomp-gzip-test.c
index e80113fd28..249c8ae82c 100644
--- a/tests/qtest/k230-decomp-gzip-test.c
+++ b/tests/qtest/k230-decomp-gzip-test.c
@@ -46,7 +46,7 @@ static inline hwaddr k230_sram_addr(hwaddr off)
 static inline hwaddr k230_sram_input_addr(unsigned int slot)
 {
     return k230_sram_addr(K230_DECOMP_GZIP_SRAM_IN_BASE +
-                          slot * K230_DECOMP_GZIP_BLOCK_SIZE);
+                          (hwaddr) slot * K230_DECOMP_GZIP_BLOCK_SIZE);
 }
 
 /*
-- 
2.43.0


