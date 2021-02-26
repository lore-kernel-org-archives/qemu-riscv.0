Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTf4-0005SW-KF
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTf3-0005Pn-Dh
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:19:25 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:34688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTf1-0000QA-Qc
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:19:25 -0500
Received: by mail-pl1-x634.google.com with SMTP id ba1so4570341plb.1
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NII2+lFi6KYqcRFLS2WasLZwq+NpesJfgYTuWrRGis0=;
 b=DChMboaNX0woDfYbRSWEphcr6FYjiyAE1BAhefLn/hczUJDo5q/GD+SSeK8grmzmKx
 K8FFOi8Pc0WNRc0Si3A5jt8HHqyH0m9HLtl5/ii8kDm+BFftR4B51Qhx+US7rOgTgN0X
 cQAwhMT7hWik/jN5p7JRoMSvEnC1+1rK9rZdSw6PoAgF+YQL0Wan2pHexCVX7ih1ZX/K
 vpAq/koagF4e/mr3FXrBVftyLHmWTTmusoc9qU4onSc46HQWJ3tkuiqKtWhjcuzUhbe0
 fiFY/w1k5+sRXRmzeW6vDyJKOtvl5WH+5lYutWTGUOpK4iFJKD8Lhk6ycYp5UHRFv+IT
 RKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NII2+lFi6KYqcRFLS2WasLZwq+NpesJfgYTuWrRGis0=;
 b=j6+q1a9sIZCXJMTJ/S1HyGvHA29NyRkfeSVj/J/qYK/89oiPl94CSw72c905tvYL8U
 hZnaPLA7qqwIIXxfyoTfBfkDLWOX/g3EaD7ratQL/G6qaJBXP0Tdu+phFFVRsZn1Nr21
 FC1WPOZkuueLEmv6ZWavjekXFwOs6GcGeNEp0KvurkubvHMm/rs9IOTZ9GOhE9xe/jIf
 Okv/ZgIuivWK0F4Z1mRym0whxHRDFQxRR2h6dwuLW7ZmzuhdthzVnl4XRfzcCKrFNx7v
 ROq2LjpN/T413DWElq+bX+2NIT3B8PXWeZ0BhpR86jWLuOPxA7HIW5DRoVWyZ+mqHtAc
 sDeg==
X-Gm-Message-State: AOAM531sprJ5wpdZHQ1NQSDJLTZnjlowP3QQY6bPFm/HgAkzezy2y1Q4
 JdlowiZ//ugYLmbRdsvAjhZEig==
X-Google-Smtp-Source: ABdhPJzISPXEKYl6/ZpzYhQdaD6tcSWDuDULqaRAcAtcywlqhqomejeP5g3z4T+tiyxyIJgc4PXuZg==
X-Received: by 2002:a17:903:2306:b029:de:18e9:f439 with SMTP id
 d6-20020a1709032306b02900de18e9f439mr1017175plh.38.1614309562531; 
 Thu, 25 Feb 2021 19:19:22 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:19:22 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v7 04/75] target/riscv: rvv-1.0: add sstatus VS field
Date: Fri, 26 Feb 2021 11:17:48 +0800
Message-Id: <20210226031902.23656-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 26 Feb 2021 03:19:25 -0000

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index ba4c1c7076f..73e88c2a7b1 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -414,6 +414,7 @@
 #define SSTATUS_UPIE        0x00000010
 #define SSTATUS_SPIE        0x00000020
 #define SSTATUS_SPP         0x00000100
+#define SSTATUS_VS          0x00000600
 #define SSTATUS_FS          0x00006000
 #define SSTATUS_XS          0x00018000
 #define SSTATUS_PUM         0x00040000 /* until: priv-1.9.1 */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 778d5b85e92..098de1abacb 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -440,7 +440,7 @@ static const target_ulong delegable_excps =
     (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT));
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
-    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
+    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD | SSTATUS_VS;
 static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
 static const target_ulong vsip_writable_mask = MIP_VSSIP;
-- 
2.17.1


