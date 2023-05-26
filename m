Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5A7C77B73
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 16:24:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2aDo-0000f6-Kd; Fri, 26 May 2023 12:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1q2aDn-0000e3-E0
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 12:23:19 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1q2aDl-0005Ls-81
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 12:23:19 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f6a6b9c079so7090875e9.1
 for <qemu-riscv@nongnu.org>; Fri, 26 May 2023 09:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685118195; x=1687710195; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0PfD6CiCzOb2myd3zu5oxlakXRkLwHYULmFDVbdeGFA=;
 b=tU1765oZBRHioqfg8eYP1BLDKiXsg9rA6FS+BgAh5LvDO6vfp2K+mpGMzJMZX+BrVz
 9+RgkOy5MQzdEMhcnINFciiNEYY8Ut0s9uSo+nkQZN7OA3gxMcIWMqR7NtmshrvsImx4
 hvNJOAzx0mZ7Jtm6CAWBAKjeKeCCUEYnfcjfH/SaW9pY8xPnTr6yw1I1tDilTG4lg0iw
 trxQB8R3wk2wAkSuNCqVPuMA1ASY+B6JrRspzztvKpK+pxSohPBDp22phiW1TsXBVXig
 3atC3+qY06jPXGLKE/S1cywMujC2mder590Y3eYjK+N2zJbY+9nv96KQK0yGnnQzL7nX
 w+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685118195; x=1687710195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0PfD6CiCzOb2myd3zu5oxlakXRkLwHYULmFDVbdeGFA=;
 b=AVwR51G92vG32eVJ9YJZl7AhQiYgDYcZr0MA+qDm5H35DdskfV9Dv3mbCHFCMEFuaI
 TXV9WSAkSWoIMyl7u3lAW3zVoi3BB1CNXxfHCGq60crEb8ylSNMjxwhKNNHzo38Fha7v
 lLetUW3/LFsqgvzWsbUdPcxqoVjo7o4+eNl2g5WtvsFUeJ8aAPt7MWueZDzEvM11oLix
 aNkidngpLlPsZ8eCy+2AQxCtHdzpaQNLfgDYvwc9PKxC4oZdXUANERWq2UuCQNpR2kqc
 Oaic9yekbNPtKEXWixdhajhmGKIOiSuPLpNTPON+VBDsj/fAK3o45fQnSkKHkbVo0cWS
 aRtQ==
X-Gm-Message-State: AC+VfDyLWbsi9uVF6tytwMaBWzGWAmm4/MmBDPhnwXH6dHpZacYIjqla
 EVCixeL/8G3SBycQJ1twJMZUeKDFSoTnLZc5FBk=
X-Google-Smtp-Source: ACHHUZ6cm9asLTwyQ5xQrzZPWRrRcRpfYF4pUMZQXrBPnvnnHu33sKKrbABiUG4mg5sDo2H+LjXkJA==
X-Received: by 2002:a05:600c:d5:b0:3f4:2973:b8c8 with SMTP id
 u21-20020a05600c00d500b003f42973b8c8mr2077213wmm.26.1685118195479; 
 Fri, 26 May 2023 09:23:15 -0700 (PDT)
Received: from localhost.localdomain
 (cpc98982-watf12-2-0-cust57.15-2.cable.virginm.net. [82.26.13.58])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a05600c294b00b003f6129d2e30sm9312090wmd.1.2023.05.26.09.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 09:23:15 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, apatel@ventanamicro.com,
 rkanwal@rivosinc.com
Subject: [PATCH v2 3/6] target/riscv: Set VS* bits to one in mideleg when
 H-Ext is enabled
Date: Fri, 26 May 2023 17:23:05 +0100
Message-Id: <20230526162308.22892-4-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526162308.22892-1-rkanwal@rivosinc.com>
References: <20230526162308.22892-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

With H-Ext supported, VS bits are all hardwired to one in MIDELEG
denoting always delegated interrupts. This is being done in rmw_mideleg
but given mideleg is used in other places when routing interrupts
this change initializes it in riscv_cpu_realize to be on the safe side.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 target/riscv/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index db0875fb43..269a094f42 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1280,6 +1280,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                                           riscv_pmu_timer_cb, cpu);
         }
      }
+
+    /* With H-Ext, VSSIP, VSTIP, VSEIP and SGEIP are hardwired to one. */
+    if (riscv_has_ext(env, RVH)) {
+        env->mideleg = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP | MIP_SGEIP;
+    }
 #endif
 
     riscv_cpu_finalize_features(cpu, &local_err);
-- 
2.25.1


