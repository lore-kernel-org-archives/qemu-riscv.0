Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B52C5B572
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 04:06:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyiPp-0006Nn-IX; Tue, 25 Aug 2026 00:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stephensportia@gmail.com>)
 id 1wyiPn-0006JX-NE
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 00:05:35 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stephensportia@gmail.com>)
 id 1wyiPm-0007e9-27
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 00:05:35 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-cb5b8572b70so5097175a12.2
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 21:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787630732; x=1788235532; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aobazBPH903Nn7eCzJVoO7AB8KnEtMzG35AgTewbhFg=;
 b=ia6OqR71sQgA+I/bhwIw9YHtXoEnl3gRBexfM9eGs9hV1cpjWeXb16RqR0D0+2aKcj
 w/QDz4gWwkrCMZ2QMxzTn2H1zzaicbvX6Nt+AmLWOWifniLoOOz5q2jASR0Mf82dabOb
 yWWFpyY2SQTQh1/997YZ4ahyLIUatb2JL+ZpdAgtl6NlNCC7rgEdD9QTuZ8zEPXNCXqB
 K9faUkHZTx1um35JFt2FnY1BxUpAz+drks9EsTrGeyL71/XCksAzMiL/+jzjo0oSsetc
 GdElLO2eiZJSty+zf8cHPgcq89B7hUrFW8suV95SI0/ZI244Zwielf0cr7KtBJDTKpZO
 pO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787630732; x=1788235532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aobazBPH903Nn7eCzJVoO7AB8KnEtMzG35AgTewbhFg=;
 b=Ld/iihHjg2wfab7CqQSk75ojz381tUnbNeQ/bU+KpHdsZt/6eLN4WLON7mMVplVBwM
 iVTKibJcvVe3NghtUWDH06cNgrQHOZkaEsGlKSka6TLcp03IpSJceOS+C1MDh6Eb0LYT
 3LJS4REcp7jFGCafHP1D3rwmG9mxYS3OvASsJ6qmvyzfu8udUiZujjuhwUQO0VzMeSIi
 RhX94bw89KEnfz3qYQCOHADRfOFyNgXe7Yy61YwUN95Rt2bvIt+ifgJx3skjlbjiBbpU
 StuWUEc0DUBu+tAnGR5nmMV8fIbGrdySHGbuzPuaXWv8SJM6xHszBesg48cGH3Qmrm4B
 Xh4A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq0VQTdqp5Zhi5S4lwRpod+SO03Un/q7MCF649fInyVvNvRa2NIxr9ih6YIhZU18TrMyPspZDtd4G5p@nongnu.org
X-Gm-Message-State: AFuF++niy2gdWiTRvVRjhCJ03QSZdGhbOLtCsUhW+3acxphjODB97cMm
 GpGJSRsl799E9L0PRE0KtUUEkdphQXvrfzIKjNK/tO/1A86K0EXQpEo3
X-Gm-Gg: AR+sD1279NuGapy2zamwKY8DVlfv19ct6CiAoIi+dzdN4/69YjlcS/AqTg1/3pmrZYE
 ClQebsXz8WhvTNA1Uy8n9ePESywDk4dbVDDYu78iGFns8e8nbNUteFPT45iJsjz2WGiYRUiETEG
 tNN1KpHUNxHwXibrbwS0B4bB7j/QZ7GmvkWdonxaB76zjxZ3D8Hfm3As1VeS8ZFIMOuyFsY6iQG
 5ms7St5dmdppAPfR61AeV1YIKAlQT/56fuvV3NT56WYFilEVC3r81hmm+aDDLIBaMMAaZt98mlT
 as2xhsj24M3EncK7gdFCYIk0TzvzvuKhoUWkuGNL+mjehrODFIHWCNRmSiiK6K+yNS5DmKnbaHt
 9G0idTVO0kpV5h1aBHOMfcFauxSLJeapA+tb6XbOM5HzhBX/4OHUwnHdqDWOIE7rsGrcyzuXNOY
 5qqPMtHrbaV0rbfQl/rbCcvzp37jEbGhZEd5jTe9DLKU1dWwRdh5/nwvr3KZYykAFNiV1YLa4wT
 4P+hzhtfLtuutq5AXZ6YbP4lGKQyw99xQ==
X-Received: by 2002:a05:6a20:a110:b0:3c3:bbe6:95c9 with SMTP id
 adf61e73a8af0-3cd301795c8mr57364255637.16.1787630732578; 
 Mon, 24 Aug 2026 21:05:32 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-327f909adc8sm34104212eec.2.2026.08.24.21.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 21:05:32 -0700 (PDT)
From: stephensportia@gmail.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Troy Lee <leetroy@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Alistair Francis <alistair@alistair23.me>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>, Nicholas Piggin <npiggin@gmail.com>,
 Aditya Gupta <adityag@linux.ibm.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Joel Stanley <joel@jms.id.au>, Hao Wu <wuhaotsh@google.com>,
 Glenn Miles <milesg@linux.ibm.com>, qemu-riscv@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Portia Stephens <portias@oss.tenstorrent.com>
Subject: [PATCH 3/4] hw/arm/strongarm: Fix dropped upper byte of ssi transfer
Date: Tue, 25 Aug 2026 14:04:51 +1000
Message-ID: <20260825040452.1322251-4-stephensportia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825040452.1322251-1-stephensportia@gmail.com>
References: <20260825040452.1322251-1-stephensportia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=stephensportia@gmail.com; helo=mail-pg1-x531.google.com
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

From: Portia Stephens <portias@oss.tenstorrent.com>

The strongarm model intends to transfer a 16-bit value over SSI. There
is no machine using this model with a peripheral attached so it is
impossible to know what the intended SSI peripheral is.
There is no in-tree peripheral support for 16-bit transfer, update to
use 8-bit transfer.

Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
---
 hw/arm/strongarm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index e400f0a185..2df895c75b 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -1512,11 +1512,14 @@ static void strongarm_ssp_write(void *opaque, hwaddr addr,
          * there directly to the slave, no need to buffer it.
          */
         if (s->sscr[0] & SSCR0_SSE) {
-            uint32_t readval;
+            uint32_t readval = 0;
             if (s->sscr[1] & SSCR1_LBM) {
                 readval = value;
             } else {
-                readval = ssi_transfer8(s->bus, value);
+                if (SSCR0_DSS(s->sscr[0]) > 8) {
+                    readval |= ssi_transfer8(s->bus, (value >> 8) & 0xff) << 8;
+                }
+                readval |= ssi_transfer8(s->bus, value & 0xff);
             }
 
             if (s->rx_level < 0x08) {
-- 
2.43.0


