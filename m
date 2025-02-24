Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57475C021B5
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 08:25:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tmTm3-0000f1-Bg; Mon, 24 Feb 2025 03:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tmTlx-0000SM-0S
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 03:25:05 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tmTlv-0001Ee-60
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 03:25:04 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-221206dbd7eso79643715ad.2
 for <qemu-riscv@nongnu.org>; Mon, 24 Feb 2025 00:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1740385501; x=1740990301; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YYEOMkvva/1IHr6h82yrTDeY/QvDiMhqXdSRY7LyxdI=;
 b=Joz7cxhw3ODLjJmwcvh0CAlJ7sNtBWTgHVWdzXZHPMZ7KDn/qETXzc1dPSKaQzD94G
 AoPkUNifBoGABjjRYJdVeTBw85QZRqks+bER5Ecavd6DPTr791o3Ym6YWThJJEIClpze
 S+2nR3vm3LOrN47ecbNN2egldHVKxyh+I3mzF3tAiOI7NeEhLO1yw2Zk4PU5qZoRLT2s
 t8GIvr78V0QMK/SAq+XVB8guGWLanm5k8P6Y9I1R2hHByz5MM3lIr5w5Gd+4ZlqNj+Kl
 bzEIesJqynLWRf2jWk3KbEIaGE1RNhLkrZYjA6quCIZOdsk0unHOMtLoC3xM0tQmbS1u
 Sz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740385501; x=1740990301;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YYEOMkvva/1IHr6h82yrTDeY/QvDiMhqXdSRY7LyxdI=;
 b=vDd6ghOWSWyu39EKMSf1/4s/VdkSIb510lFJEVNxN8VKicvcZrRK2TTJxOcPuBsh2M
 J42F1HTT8HUuMOf0AbJg86r/voIznlprEOY2U1JTw881Qv2bi+ImAE/Sy52htN4TReJm
 wkvuJLQWlI5aU9JF3CBGcB7MblDxhiAHEPTfC5oCS+uN+tzZvwzEoGk4h9za0VyJlvnf
 GLIOrWg+dqjEfDcnUpHomVwqPuf4GBdIUio4uGXcnkhiImnsb6B6pv2N5XodweOdx8z/
 MUb2Rj9yxqJG6OtsrepwqJxnuOKbQNdp5Voxo2UqbzBk6ZT0ZtJml4aiDFtdFOyg26Fg
 HqQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuKPw+WfnG+Bfv2X3nuMd4WN/nmgZ68IojxJnlKUN0Z5bT7uDvpGYq2rxHuju/ema960WxGcQ6wdh6@nongnu.org
X-Gm-Message-State: AOJu0YylA0Li/P0pLybdmksEY3w3B+xDoDNrWIEixBpHuOkk2t0WYVg6
 oLkDog4mBl1fmetaWE72oWiL2rOiuOJGQGlkVFstZVw8URMXQHII4WCc4DFhCok=
X-Gm-Gg: ASbGnctU0NRKh8lUcgWQKGvUafyaTLMoDaHypthZ/VCoo4V8lth7Ii0K71fVnxNzgxr
 7A+q0NP/TBkH/ii918a4R37yo089cYZqarG0AIwh1CApMWkCjdb4fy2q4sldUPSqGwIlVnbt2XR
 LTBZZY/ywKD4BRmyWizBy9DHKSr4h0M5OgFIUcjgd25zNSeR5pnu3SgGSm+1D+UgvcyU1bJHz/b
 e3m5uYynX1jHTExkIfGFpyhsqqQ88IOwoCJ69nFKfA4zxNhx+hg85oYKTaXJOrj8iuRoKnrVbeI
 jro1QjYmVYDSZHEAUKWHRvycfw424xGB6oCgI9TKQJBCi3EMuYwRFCei
X-Google-Smtp-Source: AGHT+IHqru5QSjb9BmEx2XWBaNez57R75JTp0uS3W11selVagBhbIoeymiUkALT2yo/ICfOQA+nkcA==
X-Received: by 2002:a05:6a00:8c2:b0:730:7d3f:8c6c with SMTP id
 d2e1a72fcca58-73426d9002cmr18051654b3a.22.1740385501536; 
 Mon, 24 Feb 2025 00:25:01 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7325c88d74esm17714914b3a.149.2025.02.24.00.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 00:25:01 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2 8/8] hw/intc/imsic: prevent to use IMSIC when host doesn't
 support AIA extension
Date: Mon, 24 Feb 2025 16:24:15 +0800
Message-Id: <20250224082417.31382-9-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250224082417.31382-1-yongxuan.wang@sifive.com>
References: <20250224082417.31382-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x631.google.com
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

Currently QEMU will continue to create the IMSIC devices and enable the
AIA extension for guest OS when the host kernel doesn't support the AIA
extension. This will cause an illegal instruction exception when the
guest OS access the AIA CSRs. Add additional checks to ensure the
guest OS only uses the IMSIC devices when the host kernel supports
the AIA extension.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 hw/intc/riscv_imsic.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
index dc8162c0a7c9..8c64f2c21274 100644
--- a/hw/intc/riscv_imsic.c
+++ b/hw/intc/riscv_imsic.c
@@ -375,12 +375,21 @@ static void riscv_imsic_realize(DeviceState *dev, Error **errp)
 
     /* Force select AIA feature and setup CSR read-modify-write callback */
     if (env) {
-        if (!imsic->mmode) {
-            rcpu->cfg.ext_ssaia = true;
-            riscv_cpu_set_geilen(env, imsic->num_pages - 1);
+        if (kvm_enabled()) {
+            if (!rcpu->cfg.ext_ssaia) {
+                error_report("Host machine doesn't support AIA extension. "
+                             "Do not use IMSIC as interrupt controller.");
+                exit(1);
+            }
         } else {
-            rcpu->cfg.ext_smaia = true;
+            if (!imsic->mmode) {
+                rcpu->cfg.ext_ssaia = true;
+                riscv_cpu_set_geilen(env, imsic->num_pages - 1);
+            } else {
+                rcpu->cfg.ext_smaia = true;
+            }
         }
+
         riscv_cpu_set_aia_ireg_rmw_fn(env, (imsic->mmode) ? PRV_M : PRV_S,
                                       riscv_imsic_rmw, imsic);
     }
-- 
2.17.1


