Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrWxs-0000fo-9R
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:04:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWxj-0000Zg-FS
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:04:17 -0500
Received: from [2607:f8b0:4864:20::62f] (port=38525
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWxg-0008OU-Au
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:04:14 -0500
Received: by mail-pl1-x62f.google.com with SMTP id o14so10991359plg.5
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DWOZNBjy2UD9L9cTxRsKNeUHvaqk8YVnIwCrDORJ5OA=;
 b=TQ97G1XzbdFVPSJY8unCjKmpZBIhkv+TwbGWUllpBJRD8kEK6j4CL93avb0Ju/ghmn
 vAlL2DW+gVRS32vV/OIPkH7qrKAzKUAU6IJFjNex8/bGqD0Z8SjTAsFCoUs1t1+q759m
 QtZryQ39HGf5xW+UCk46rfRunbUzYpLPYkjuvhONb8E/RtL3fsy0Fecklmet87cnaf24
 LIgaDcfug4es9U4j9xE6bsRj4q0H9JqcDr2szGxAwBdd0Ph+jj2OPvqZqf/8U3XKh+K6
 QNTgd2ZAcz18NN6NjS57ODABxvBatiHMomXWd3PcMj2S+pB79EPt5ylXdmgEHSf/SX0O
 jqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DWOZNBjy2UD9L9cTxRsKNeUHvaqk8YVnIwCrDORJ5OA=;
 b=zGXo7oCEjSrV/JYCuyL2j4V6/gZ6QtF0n2KlkzPaML6tL13tVRpgo2LuksbGeyowUv
 EN+ZvXchbtwtgIwl99s101E22LYbBk8Bu2DLxHGh2d1nYL9ZS7To4CKC0TcGNpVNGrDv
 eeUhOiXhONWQs42MOl6uFP/Z9TuNKvYieGHFp/r16VSGymrgnQmrR62uV5iV+shEHf+e
 c4qcgdZ5GKuQ7V2rYRAf+1OWnQdgyjlDE7FAZbQ74dS43x0RaALlHy5D+5zHQ36/Onv2
 wkSOkD0Lwj15YC+PaHP6Xw3hgxARwVMbHgDZHJbEPR8e72rfTt/B9YEdrO4MDAKOqtjL
 0fCQ==
X-Gm-Message-State: AOAM532Jx1tSjuW3YovSdKu49h7gtstSc4nTIXgMgLGgUWzQO4njIat4
 4IA2Wr62EK3VPPHfvg61Vd0w9Q==
X-Google-Smtp-Source: ABdhPJxZDcoiWb7uktvSXWcHi8DNPfuugFn1Q/a1ZAEJbZeB4N2rjVJEEXwHBPOoIEfvkZeYOGwsEQ==
X-Received: by 2002:a17:902:c204:b0:142:2441:aa26 with SMTP id
 4-20020a170902c20400b001422441aa26mr57061091pll.84.1638155051205; 
 Sun, 28 Nov 2021 19:04:11 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:04:10 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 05/77] target/riscv: rvv-1.0: add sstatus VS field
Date: Mon, 29 Nov 2021 11:02:25 +0800
Message-Id: <20211129030340.429689-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:04:17 -0000

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
index 72a716c9990..bb62da7549d 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -409,6 +409,7 @@ typedef enum {
 #define SSTATUS_UPIE        0x00000010
 #define SSTATUS_SPIE        0x00000020
 #define SSTATUS_SPP         0x00000100
+#define SSTATUS_VS          0x00000600
 #define SSTATUS_FS          0x00006000
 #define SSTATUS_XS          0x00018000
 #define SSTATUS_SUM         0x00040000 /* since: priv-1.10 */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index bb500afdeb5..83f4dbd8241 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -463,7 +463,7 @@ static const target_ulong vs_delegable_excps = DELEGABLE_EXCPS &
       (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT)));
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
-    SSTATUS_SUM | SSTATUS_MXR;
+    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS;
 static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP;
 static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
-- 
2.25.1


