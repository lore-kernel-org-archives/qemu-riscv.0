Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmYtg-0006EQ-TP
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 07:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtA-0004r5-TW
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:49 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt9-0002QZ-6z
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:48 -0400
Received: by mail-wr1-x429.google.com with SMTP id j11so14219575wrd.2
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 04:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299825; x=1683891825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Lv2amYuxnL/rjHsnpYSrIfjZprlyKOd0sUgv/cdui0=;
 b=dxAvSN0Za8XtSpewBHotI+liYkI3R0XrGZHy6SfbuCEyIm+MtuFxfbEFSzIPpEJAdS
 fisDH/mrWbVKN0sPmo21Uj+sNykOQQEIsaJt+/3JqfN2mDEIEuU4OFGaTGnoamkefCxj
 6WvLu1enXEJvVTVFvl2YD2p/u3jHl8RZ3xLOpWUJV9cDapiclgm5Kbd2hZZq2H3byg0D
 NR4ED99Azidh5iIcL8mFWah1sux7Vc6gsJmIA088+/ENagtw3NOl8gVMpmskUuHdAbWo
 SH7ASFGp4zmfIeGVXUTgOm2eKloNo0G7Qgz2JmRFvO7pmRQvLFgXywDDVRC4bd4iZ39T
 7pdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299825; x=1683891825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Lv2amYuxnL/rjHsnpYSrIfjZprlyKOd0sUgv/cdui0=;
 b=rfUrcPaLCiI3HcolLtvyS8hu6mXdtsveiQFEmOuI4317kMq+2/fDvF+5WRq2TiQw8M
 B1okUfphopVCvaCIsD1NxZgblS0ERYmxXsLpVdf3vjkSR6OlDgmJEad9FAQTWiZrfjgn
 qpOMbZ3ogUEJObxnQUeom8XEebL0hMx4dZ2/I9ef3UgQNvAcAA1OfiyyevoT2+Vm8LIo
 qEOvZpFzPvvjG/vxS8yGQhf0EPTa8RJ6J2QEEV8Fdi1vcqYqL5juAAZ1rRUunJD8KQ0c
 AfZ34+taZrA/87SitCURr1wfujcFeOnwGm7JD5M6CWpMJAhufluDK+ovsXKkEdgfMzOp
 UiOA==
X-Gm-Message-State: AAQBX9cohAsyFsCrltsNlbOb2XZe1folX1cYpffwPVBnyLZQZIucXMTP
 E/n/RCNWBs5EbJyg59tJ84MOj+FAFJw+qszUXgQ2sj4r
X-Google-Smtp-Source: AKy350bSlVpqpYgiKK0h4iTEx4tEv+WydjbMlJhSii4QBrwUS0TqB1rs+7le7vC9RiUctWb0rMnZMQ==
X-Received: by 2002:adf:f2c5:0:b0:2d1:70cc:66e0 with SMTP id
 d5-20020adff2c5000000b002d170cc66e0mr1541381wrp.44.1681299825582; 
 Wed, 12 Apr 2023 04:43:45 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 12/25] target/riscv: Introduce mmuidx_sum
Date: Wed, 12 Apr 2023 13:43:20 +0200
Message-Id: <20230412114333.118895-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 11:43:49 -0000

In get_physical_address, we should use the setting passed
via mmu_idx rather than checking env->mstatus directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-13-richard.henderson@linaro.org>
---
 target/riscv/internals.h  | 5 +++++
 target/riscv/cpu_helper.c | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 7b63c0f1b6..0b61f337dd 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -37,6 +37,11 @@
 #define MMUIdx_M            3
 #define MMU_2STAGE_BIT      (1 << 2)
 
+static inline bool mmuidx_sum(int mmu_idx)
+{
+    return (mmu_idx & 3) == MMUIdx_S_SUM;
+}
+
 /* share data between vector helpers and decode code */
 FIELD(VDATA, VM, 0, 1)
 FIELD(VDATA, LMUL, 1, 3)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 291a1acbf7..29ee9b1b42 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -842,7 +842,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         widened = 2;
     }
     /* status.SUM will be ignored if execute on background */
-    sum = get_field(env->mstatus, MSTATUS_SUM) || use_background || is_debug;
+    sum = mmuidx_sum(mmu_idx) || use_background || is_debug;
     switch (vm) {
     case VM_1_10_SV32:
       levels = 2; ptidxbits = 10; ptesize = 4; break;
-- 
2.34.1


