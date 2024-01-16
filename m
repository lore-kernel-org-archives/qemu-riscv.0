Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCADC47077
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 10:49:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPgzW-0002Ir-HT; Tue, 16 Jan 2024 05:48:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rPgzQ-0002HP-49
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 05:48:17 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rPgzM-00077x-Vb
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 05:48:15 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e857ce784so2985795e9.1
 for <qemu-riscv@nongnu.org>; Tue, 16 Jan 2024 02:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705402090; x=1706006890; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G/4qvFydeTk/PTjvN3m6e5JXTCJ82jFvWrg8a2aPdvk=;
 b=gYduNJ+GoH2ojxtkIaed/zMNDw+oTBJvokN7UVyr50B2Y5xri7vfDlnnVBvdJR9JeT
 XSuo5+kP1Roo/4fEEVFivgD2LysniRXuSlBEVKunMTish+6PHSQ2LXlQh/RaA1SSMiym
 deV+KTxfMALQ0HRBbakhoYsm/bW/WmY8FLU1ZyN/GAJoFNrnXj8IFk5BYPhauguVX3m2
 ypkHVkDHpZVFnJqKuXD36Hre+TA8PDjbrOO563zqKa2GkMdEYDRrLVRfdSJfdVbv34X0
 aDKiJuGlrRCl7jdWWNWyWEU5ec5ZHYG2dp9eZkFg7I8paUumi3c+11aihbAdP9tLob8f
 J8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705402090; x=1706006890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G/4qvFydeTk/PTjvN3m6e5JXTCJ82jFvWrg8a2aPdvk=;
 b=wiCrwrAeSu14So+05Bzj7Hobk86vbsAEkpmU4tI6KzxOYnuz9I28tZPJdBb/av8MI1
 9EHWqlp91Ujju2HLAm9wba7O3XryJ2KqeN5ub4+MiB+TINwOa6tEGpVyNmhp/pnp+t1/
 f6qZqKB0Vl5pUX2Qds0Zox434m5nMxsLTx5Gs3d4EciLNnSb657rzudbmngGuuvbPLuk
 TfsdiBqqqViTvXx1XDRt9NCvpwb2Fyk6Oabpb/xt3KHscnocEfVF+xrvdk9Sh1zjyC41
 o4yz45rWwsX+zK/jjSuEz2OwA4/dBo59T1IWadJ4JmHj8XbcH6rWs78+CW1GfMtNpePf
 GEOg==
X-Gm-Message-State: AOJu0YwnbVfgLVPOvvyzZWo4hxJjVvBfnDVTkd1HRZ1fL5LzjH5kbP+T
 VDWF2eHEI0kzdGfdmRRFshTUwLdjqzQx6A==
X-Google-Smtp-Source: AGHT+IGgoVM2Jm4CS4tdVvTCAZqRqOTfS5A8Ri47em4OimL0M3LMpgdOqr9ziPq9MJ2sCk2yxA3H2w==
X-Received: by 2002:a05:600c:138f:b0:40e:44b5:511e with SMTP id
 u15-20020a05600c138f00b0040e44b5511emr3513410wmf.99.1705402090436; 
 Tue, 16 Jan 2024 02:48:10 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ay12-20020a05600c1e0c00b0040d802a7619sm23143545wmb.38.2024.01.16.02.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 02:48:09 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5BB9C5F8CE;
 Tue, 16 Jan 2024 10:48:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PULL 01/22] hw/riscv: Use misa_mxl instead of misa_mxl_max
Date: Tue, 16 Jan 2024 10:47:48 +0000
Message-Id: <20240116104809.250076-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240116104809.250076-1-alex.bennee@linaro.org>
References: <20240116104809.250076-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

The effective MXL value matters when booting.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20240103173349.398526-23-alex.bennee@linaro.org>
Message-Id: <20231213-riscv-v7-1-a760156a337f@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 0ffca05189f..bc67c0bd189 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -36,7 +36,7 @@
 
 bool riscv_is_32bit(RISCVHartArrayState *harts)
 {
-    return harts->harts[0].env.misa_mxl_max == MXL_RV32;
+    return harts->harts[0].env.misa_mxl == MXL_RV32;
 }
 
 /*
-- 
2.39.2


