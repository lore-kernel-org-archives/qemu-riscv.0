Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648A9606A326
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 16:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wde75VUy
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xPMwz-00062m-H4; Fri, 06 Nov 2026 11:38:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPMw4-0005pO-CO
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 11:37:09 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPMw1-0006P7-Al
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 11:37:03 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-491846221ffso737141f8f.3
 for <qemu-riscv@nongnu.org>; Fri, 06 Nov 2026 08:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793983020; x=1794587820; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oUo4+D9Mg8LRDc34U8PXawCEJelkdTLuEOZ0iDVwa0o=;
 b=wde75VUydq1NjKsbaQYp/l2wZ4G1wHI39sCx6CR4zXcqNOcce4eNDc71Qu4NiH8kSu
 Hqi9TPrfiFUFrjWv2KmTn8KagG2SvsBhaNpymmnGX5np+/8Hu16MsA4aJ68EIlmlwCk6
 EtKGODnKGxeznTId4WtGFThpxKM2IcuEVOCK41CL48UpPbpcVX52yNF1zIRRVG/uTLHT
 CXN51edRu0w/MvE3VcPLbbzGryFxvTxorOTQb41ixHGSOBBfZPLvo9PSxW9zL0AjFEPX
 /H2jPoxHqBCf67TlkVQXhlci5C6pgiN5eYBise+xt5DEY5YPtvN6sUbnWOYFYlWzPa9P
 joCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793983020; x=1794587820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oUo4+D9Mg8LRDc34U8PXawCEJelkdTLuEOZ0iDVwa0o=;
 b=YQ3KIqqXAHPQKVQdNTmc3pFU6bCKX3vcpvC9Az43yz07mDZgoNGa494Q0wSbpSoXWg
 n9gEEnlecRfNza3qmmoLcNe5cSXCmcg4TLVS73cFTpeh4kEtroRXVzAy82yRbZp1olgd
 mTK3tzE0LHQ88hS6ESDTy8YEa07lOAd1rdECc+WCyBLede/moIquL0c8G0oZdAx0RK3U
 BjhOgmnbN1PYbxO/kqWXAH4Yb59hcGY0A8ssVm5/KisHlVz4f+TMdyh13u2Sk5N+OpcW
 E1xmB51syz376irZaISQmXGe+3x6Fy1z8ctulx4pV7R6jenrs4/tsJnnDqg14h3HL8e1
 MaWQ==
X-Gm-Message-State: APuU4Z+qq9vVemqbRL2YBkycTNoUCXrZ+1VD4HKHSRMqFZVyP7WBSiPX
 ue6tt1DJDF5GafBGcTNwU084Ry1j3eFokP2ST1Hgor3b0RZExRVUF/wZl+SJeQNK98A=
X-Gm-Gg: AYBFou0yzUVuqkV4AJjaXkmjF8T+iji3SK/Ocv8MKSZFrrgLGDrM79Pf9QEow7nuBPa
 VxPeoK6etAYiQDg2Mvc5XJYTSqZaQVvtXiMI3O9FI5NyL0UXaiQX0lzsXuKPeSvXNdA1wL6tZAt
 PkLvutjeWHSsNRrkfG1lOEJNbcTnMf1SB4KRTnVlPu3uBOs0O7U2TFIq4gBl+o2+ICMsO+BwiTX
 FH5wDkCLGdiS4dYSJ1V2ESt66+FIxM+Q3ip4AeJISL9QF8qxc4oFZxgNc8eurWqU7q9f/uc0YvY
 S69i+obH+tYFxQpazhoLAgiq1TBLeD0hI3q2t/AhQAgT0Y5bumP+F9FU89AGlEkaVrigf5VFj5Q
 Mzqr87tMC7iwzWhTncaWkReJ3wjd9rvL8g/OEIkbpygc251XArvTYxQiKxgRJofAC1PAyuB8i66
 6OT8uOFutEFnt+lA4dmlCjYgpLXom3RkvkGWrg1/3L/7WYIouS5zzMQlnd7Zl9zY7qndESUhZL4
 qTvtUZt5O9gKzfcDxzoMUdvkAOBop1zf9ydk5DL3NzwVyweXrDp+MWl0+EdT0ot1eumrLJ+N/KE
 UvWh9lPU54XZLI61QcNbWCyHBfuR1Fld7zBSrrnDO0m76wr29NsOSLL94gQ93sKD4cBeTfOxtpP
 n0uDAz0wdazJ29GZ4bkygWT/t4o3wI4ibdQ==
X-Received: by 2002:a05:6000:2c03:b0:493:28c4:331e with SMTP id
 ffacd0b85a97d-49328c435cemr3559926f8f.28.1793983019907; 
 Fri, 06 Nov 2026 08:36:59 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d3d60e78sm4517912f8f.1.2026.11.06.08.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:36:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v2 for-11.2 1/2] hw/watchdog/wdt_imx2: Set vmstate
 minimum_version_id to 1
Date: Fri,  6 Nov 2026 16:36:56 +0000
Message-ID: <20261106163657.3825938-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106163657.3825938-1-peter.maydell@linaro.org>
References: <20261106163657.3825938-1-peter.maydell@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In commit d9abd0253be90 we made a non-compatible migration state
change, and set version_id to 1.  However we forgot to also set
minimum_version_id to 1, so the state struct now incorrectly claims
it can accept migrations from the old version 0 format.

Bump minimum_version_id also to 1, so that attempted migrations from
the old QEMU fail cleanly.

Fixes: d9abd0253be90280 ("hw/watchdog/wdt_imx2: Remove redundant attributes")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/watchdog/wdt_imx2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
index f8129625e58..abb8edfae25 100644
--- a/hw/watchdog/wdt_imx2.c
+++ b/hw/watchdog/wdt_imx2.c
@@ -224,6 +224,7 @@ static const MemoryRegionOps imx2_wdt_ops = {
 static const VMStateDescription vmstate_imx2_wdt = {
     .name = "imx2.wdt",
     .version_id = 1,
+    .minimum_version_id = 1,
     .fields = (const VMStateField[]) {
         VMSTATE_PTIMER(timer, IMX2WdtState),
         VMSTATE_PTIMER(itimer, IMX2WdtState),
-- 
2.43.0


