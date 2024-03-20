Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EA8CD11DB
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 07:27:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rmqMF-0006CI-Sk; Wed, 20 Mar 2024 03:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rmqME-0006CA-SI
 for qemu-riscv@nongnu.org; Wed, 20 Mar 2024 03:27:30 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rmqMD-0003id-EH
 for qemu-riscv@nongnu.org; Wed, 20 Mar 2024 03:27:30 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6e6c0098328so5249473b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 20 Mar 2024 00:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1710919648; x=1711524448; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F4pSOxGw1iKhj6JyuEVr4nPf5e0kX4KKw2u4riiw7+w=;
 b=i5qUIyyEuMLVoIMSvxIb0s3pH5oBFZVCr9sgbhJgtCLIEvLXbthaUuLmTN14GjKj1I
 8yHH12/+aFnO95pCf/RQZO+/M0pMUwSUp6sHlwiWhe5rL9oHTOIgBF8T6CIIfLF5uJ60
 ojMzn3wDDPTBT5uSwTtMvjq8jr0CirmTA8qbZWeAQsrdGBt3okL1hnB5OryCdHqB9IHL
 DFYE9FrFXHn80CEE9dcdiGm3OOTwVUBpDAJ2Gtyky8ypOl4Vj6LAaSYLFxB385BbCAPn
 tlEiGsmUn48ApMPL6nhA7OGlAg58IicBK3fMfXT2LnLg1nsjghe3HKbpPjf7DBptGd7V
 ivag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710919648; x=1711524448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F4pSOxGw1iKhj6JyuEVr4nPf5e0kX4KKw2u4riiw7+w=;
 b=g1AuvJiWg4gVocd+fGPvQEOBYde2HcqXETSXLaoIrzRk13mbwOzwzDyV11i6a4veIR
 nF5SIwvLm3tIw7j3S4CcMqoQN48F32zaOlBfQJfl6Kcz7ick+d5eRM9RaU8KXrbCo9bN
 2JjSr6++83btDBEv/PLQG0iaJDAZGWPZpE2Pg7irhwkW3IaDFQfTC5yN2YxLoDjZQzlZ
 s08/eoQIRchW/60MalhdPARbs+G9kDx5jIZILKPjehmFbLfPRNbUVwmqAhjwnHP7c+uw
 Zmq9d5GElpatZXi8BBBBp0QMQOqO3p50UBuCZ+3vQbfH57jjqpH5udcaMKaR56U0eH/7
 nyIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz8YzpjqUU1l8Xbp7CvdXX3p65ZX9RVAWs0/XKQDBQILzVCjvb2ZmldE5knasfAyZD1vteDevVLYdTNc0TRB9/xG/2SwE=
X-Gm-Message-State: AOJu0YwAiCwtQaVL1j4+SkM/VKfvtIIgRXIt34KA7dtqKDwvwzGOdpX/
 ZIhlvQh1d5lKSn5rvaCB87b6Ri9/Ysn3CaMu/rr9Vl9yQ+thIUuEp3o7VTy/eug=
X-Google-Smtp-Source: AGHT+IFYCuEmNtVd+9qnOCTZtfYOqG1HPFg+QY6lvWC3uksv5rI+PSVqHTwuWOAitDJ0Lc1zXFlFlA==
X-Received: by 2002:a05:6a00:2304:b0:6e7:2e76:5358 with SMTP id
 h4-20020a056a00230400b006e72e765358mr1233025pfh.29.1710919648075; 
 Wed, 20 Mar 2024 00:27:28 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 p10-20020a056a000a0a00b006e6b45debe8sm10811376pfh.78.2024.03.20.00.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 00:27:27 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/riscv: rvv: Check single width operator for
 vfncvt.rod.f.f.w
Date: Wed, 20 Mar 2024 15:25:04 +0800
Message-Id: <20240320072709.1043227-4-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240320072709.1043227-1-max.chou@sifive.com>
References: <20240320072709.1043227-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The opfv_narrow_check needs to check the single width float operator by
require_rvf.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 6cb9bc9fde..19059fea5f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2817,6 +2817,7 @@ static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
 static bool opffv_rod_narrow_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_narrow_check(s, a) &&
+           require_rvf(s) &&
            require_scale_rvf(s) &&
            (s->sew != MO_8);
 }
-- 
2.31.1


