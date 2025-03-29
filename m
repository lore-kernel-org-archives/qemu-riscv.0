Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A036C36008
	for <qemu-riscv@archiver.kernel.org>; Sat, 29 Mar 2025 14:48:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tyXR8-00086V-VZ; Sat, 29 Mar 2025 10:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tyXR0-00082M-H0
 for qemu-riscv@nongnu.org; Sat, 29 Mar 2025 10:45:20 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tyXQy-0004Re-Kw
 for qemu-riscv@nongnu.org; Sat, 29 Mar 2025 10:45:18 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2ff6e91cff5so5483919a91.2
 for <qemu-riscv@nongnu.org>; Sat, 29 Mar 2025 07:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1743259515; x=1743864315; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gkbRCb6rMo+FRkmwvN4Cwi5OUmxu8ym9SMSTXIcZ3bc=;
 b=F3If+k8B0r2M1DAFm4tAzpEgXvSFpI5obsWgDD+3JVt6xB4K+lC9qUuuV9r+UWKb1W
 XMH5JO2RH6DwZXyFW9L31TWIS8GsO3rRgvMut6ZJaZVPHIb83mEJ2XLY8FB0ZqgGzCXP
 sy9vQs8L5dgQd1yIhBvVqfvMPy7PjiTWoeYehcGOEZ+pV+Iudeg+yFPSibQqCajCRM40
 O98HX7vaxhjxa4ZpVbUsqy37cf/m1zRymO13+kN54iH75zyUeVIgrFXdk/kILnOQ34OZ
 r/9UaQU2JbT1StWYf4K3Nkh6wyRVIv6bXJCFRx5WmSH8PJJ2NK1NhR4ix0sft93oZsvp
 0uOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743259515; x=1743864315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gkbRCb6rMo+FRkmwvN4Cwi5OUmxu8ym9SMSTXIcZ3bc=;
 b=wHVCMbBt3X8PZeX7IBNxeju0SZVYoWxbPEk+AXWUH2BJAqX0CIGdNZ54Jn7bgVdUNI
 A6m3rgdheqKcaLfcNX+9d6m0L4NcVZqETcRM2lDxtt8TC9G7OpVfOrVDEj2ri2aSWjUJ
 33OZ+b9R8pJluPqwoUGWOkaiWntMzUy/LwUSkMc4g5OmYeFtD+rgBXJh69YddJhP25Kd
 G/j62ZvkF8eJl8V+eUXg80rdjTdbL+nirz/lkvZl3mzu5ETZSEHjHtJiWgsG78lWCp4o
 v3ND1Mpewq82zrDx/JvhmqtyE/m4z47IJoOoNunRAKsIpe1ZuDg9L/xogoPRW74ooX+J
 cWgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9QYdHaqASRzZZ1kM2iP1obg/aCSHHdGw3pEzF0Plq6asUiaIfq3uMUuvGNqQ+/+464qqDlHkFUwuK@nongnu.org
X-Gm-Message-State: AOJu0YwfImjHGUI30KKHBd8UbBDvJqePRNsyIhVGbggAtY1QlsNULnnt
 NNObjEkiEfLRnJ0W2YyCv36qPzU0Ud8pLfaiUvyDRW3+fKWpJQwyJROxC8oL4xw=
X-Gm-Gg: ASbGnctOC39KTcXY92RGkZs9PKdE9qYc3bJ9DknBkqqlILVsVRUOxtnp9TGf3o+LW9S
 ZzIU6BY96z8teK/rTxnRTIf7rdUh945iosfNhuHlvmnDgF6MGgfa3uykFYsxA+tOBom28o/3uaV
 n2mlEaSwcPq9wtxkm/kAoOQPujq7c6rglulxgbWDQEcELhauG1WDEetTmwLCwzaoNE6LnrC2RG/
 6YdQ1dtpGpYp1Jsd1XYfFZ0dskbTrYRgxYFXxP5PMtBIIT4bgGqiRGAnqLVvQJ8ZhkS8EFsE90e
 bDbdujeKEB5QhxMICVaJhaYSKbyulOZqHth5IEIgC4cWfN0DLeiUYjSPHEkRAqamK4uvYsGNBLM
 wTbNwrtaJr0JOkw==
X-Google-Smtp-Source: AGHT+IEDXl5TGEAia+5YpR5IRKpJl7Bmh8MBv7E7A/Knq9PyBrHJvzyS669LJ1jY0fJEIsn5QCW3Pw==
X-Received: by 2002:a17:90b:2e4e:b0:2ee:44ec:e524 with SMTP id
 98e67ed59e1d1-3053215b4c4mr4718266a91.35.1743259515025; 
 Sat, 29 Mar 2025 07:45:15 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3039f6b6bcbsm6737196a91.45.2025.03.29.07.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Mar 2025 07:45:14 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, antonb@tenstorrent.com,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH v2 07/12] target/riscv: rvv: Apply vext_check_input_eew to
 vector slide instructions(OPIVI/OPIVX)
Date: Sat, 29 Mar 2025 22:44:41 +0800
Message-ID: <20250329144446.2619306-8-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250329144446.2619306-1-max.chou@sifive.com>
References: <20250329144446.2619306-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x1030.google.com
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

Handle the overlap of source registers with different EEWs.

Co-authored-by: Anton Blanchard <antonb@tenstorrent.com>
Co-authored-by: Max Chou <max.chou@sifive.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 2282b89801c..f397ae46446 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -639,7 +639,9 @@ static bool vext_check_slide(DisasContext *s, int vd, int vs2,
 {
     bool ret = require_align(vs2, s->lmul) &&
                require_align(vd, s->lmul) &&
-               require_vm(vm, vd);
+               require_vm(vm, vd) &&
+               vext_check_input_eew(s, -1, 0, vs2, s->sew, vm);
+
     if (is_over) {
         ret &= (vd != vs2);
     }
-- 
2.43.0


