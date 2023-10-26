Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB29C25B48
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 15:21:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qw2AW-00084A-KT; Thu, 26 Oct 2023 11:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw2AI-00071H-VG
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:20:55 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw2AH-0006OQ-Hy
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:20:54 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6b709048f32so976543b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Oct 2023 08:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1698333652; x=1698938452; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7L+eMQC/hP6kOAoEfxyL11NalUi4Lht4i6fwiKN8tz4=;
 b=AS0nEYNB2jg5IIKP/w968Bvw/W2eCSWo56/y3q9skrUHbWUw8OZ2mGoM+tRE+5MIEY
 4W3uVwomm2GFmE+3pbPJykvLm/YXOFN6DKQuyl+HtikV1RWx3ZUjaPn3mKn2OJchijRT
 IBsXuh3pBmc9sTYRKbe1RulbvD0jy6FLo85+vjTd4ZSaf36THfsydvUnro+pSKzexeyc
 RuqzTnZtDXCRgCtgZ8TTUE4hcQdrtAuPcjjViMz+xvT6o1/VHQTzRzt79uR2VbFR1Dsd
 rDzHBaqPrQlz0SGW5Cl4uq8zhc5detBDGgl66jtZ7ahyXvenzVIQl5aRIgpAyUz5ynu4
 ZEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698333652; x=1698938452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7L+eMQC/hP6kOAoEfxyL11NalUi4Lht4i6fwiKN8tz4=;
 b=jujRPmY2mkZOWQMltVH+x9vmqUMeN8orngN2paw+XJuPUm6lBOvC5OnJ4tDF1sSrol
 wLOhkruv63gCJnjG4MyxgK7rnez1bWjXTWwN5KeUXYDGUgHLBqiT9rb6lSgYyXVfcjSv
 wcdjlar7QjDSZ7wJFaEUyf+0lnBcd3w6FK/9GJB3A0stUruuqSjvKoNaPNHUf2DFIw57
 3il0u7ORcrryfQDbDV1qWHmTvIM+Jie8dHuO8s6rI8Kaz+qnzgZUsrvJrSJvfwKz0lhe
 y9kN/e192T8vC/gdR0bPzeur+mw4Z770eFqfOrwmF2HrgxT7UxXdmlJBxmwKm7N9p2wW
 ExbA==
X-Gm-Message-State: AOJu0YyMr0Ve+K0UFwCElI0fcpnlrPw7SLq/xszUCDnu05fmG/x+inCk
 qo85Fno0i1YdtgJl8kZTnqdDBg==
X-Google-Smtp-Source: AGHT+IGKu9WMNbw++ORMqavID1xllBD/XgU7Yv97zI78954IQO4RcL+kPdRwZlDuCtxGH8A3LMcXKg==
X-Received: by 2002:a17:90a:3d86:b0:27c:f1f8:2628 with SMTP id
 i6-20020a17090a3d8600b0027cf1f82628mr16905769pjc.47.1698333652264; 
 Thu, 26 Oct 2023 08:20:52 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 nv18-20020a17090b1b5200b0027fee011cebsm1326061pjb.10.2023.10.26.08.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 08:20:52 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH v2 11/14] disas/riscv: Add rv_fmt_vd_vs2_uimm format
Date: Thu, 26 Oct 2023 23:18:18 +0800
Message-Id: <20231026151828.754279-12-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026151828.754279-1-max.chou@sifive.com>
References: <20231026151828.754279-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x42d.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Add rv_fmt_vd_vs2_uimm format for vector crypto instructions.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 disas/riscv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/disas/riscv.h b/disas/riscv.h
index 8abb578b515..b242d73b25e 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -274,6 +274,7 @@ enum {
 #define rv_fmt_vd_vs2_fs1_vm          "O\tD,F,4m"
 #define rv_fmt_vd_vs2_imm_vl          "O\tD,F,il"
 #define rv_fmt_vd_vs2_imm_vm          "O\tD,F,im"
+#define rv_fmt_vd_vs2_uimm            "O\tD,F,u"
 #define rv_fmt_vd_vs2_uimm_vm         "O\tD,F,um"
 #define rv_fmt_vd_vs1_vs2_vm          "O\tD,E,Fm"
 #define rv_fmt_vd_rs1_vs2_vm          "O\tD,1,Fm"
-- 
2.34.1


