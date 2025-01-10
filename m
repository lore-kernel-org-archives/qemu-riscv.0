Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128B4E77188
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 08:24:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tWAHd-0000VJ-H7; Fri, 10 Jan 2025 03:22:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tWAHF-0000Ny-K4
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2025 03:21:58 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tWAHD-0008ME-Qn
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2025 03:21:57 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-21654fdd5daso28560695ad.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jan 2025 00:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736497314; x=1737102114;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UKy96d8r4jHtyTvK2W+7wl1ztaYGPUzMssxRhp0rSko=;
 b=WzHdDBNz6rRLrRqOeR35lTHF6bo0MNzUmUqQa8RGS1GFKf3ZMS1FWqwW/at4jmQvSB
 90+Fj3y6gkV64DDPgTWBBR1QD9Ssei9D8+JMbgt6p0/LH4thi64UiVw4+EBfw27VEsSF
 5HwY4nXycQuT1AhwPpswOmmDQpxNO6oYVzhSl/U4mY+OtLZNP/xgaFG8/Urc6BYhpvSd
 MhBHfr3moUr573V8Z8hEA/lZ4pUGIVMd0A7DPrLALuohqFfjAUPRuFEZ+xPKgXptxy9j
 gd3Yv/DXhbT1H8uv0AHiPx8WEdOjGP7T3UBNtfIPk6tYr/y+9LTZcX1swNhDgULt5Vw2
 tpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736497314; x=1737102114;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UKy96d8r4jHtyTvK2W+7wl1ztaYGPUzMssxRhp0rSko=;
 b=a7P0lRDwwDBmExJN3I40LNABImNTHoM+jErEAUFoVqnEiMrq6+B+L14wIoBy/Lm9ZQ
 eVfaJkV9UtxvWZtTrA/G6ITLN4uypG9YgBgUrpcc4uL6MgbufYJCO6ltN28U3Z45Qt9q
 gzzrS/wDbQR524kjny9tAUetF1jk5vY1QnNKSASlRSh+5+HF8HjqMHXgXnQFgWC3DAyy
 pUtgQEdNHsw+ML8kp0UWr8iIWCmEfd3jTlrGEdbmfO6qpY+KO2UqQinqlnfmjUPlVAMs
 AHT6/UDiEFJCbOV8gqpM3gtV+tV/70OpJci4bcjCi3T2mIrstCHalEWkplsjgOyI3C/7
 7SUw==
X-Gm-Message-State: AOJu0Yy+ByRZyLQakTY3z2ib1/HOUEiVx8cm3+Boy61AAbOBvjOX4ACb
 gtYSwkVYnq7vA4OB8f2lmvYKtl+hDL02BuYIaoQ3my3Ww/rcg2d7EF4Kn6eLdDs=
X-Gm-Gg: ASbGncvSUPPESyJ/zuiO7Mm0QYzSfKudH0eLaB7QXA2hBFIFPhk7tTmfBxJXhYHvNBn
 HBAiRX+QnJRetuQwXwhGfFJqypcSTa7zVjjayOqNe6Y9iE7ZZq0etYdSFQqkCHIOWjkKyBNQB5+
 lNFPZdOmhKrgHfAJqu39/jIZ0Y8iRI6GRO3bOSYqwZHqKxswvxJnA2FYNu+EMrrFGbU8EoIo+j6
 RWtnGCjWLcSuLaz7vDUIqC7PMj1s/+5BgDRILD4Iw4UspQ4AIU5NJHBVBCE14XJz+i3sQ==
X-Google-Smtp-Source: AGHT+IHNZaL1rMHrYGOk50lXxKaZZfowryvI7gJ1VDVwQD74bpZAtfxS8P/rNI2D3mWTx2TtGiJ50A==
X-Received: by 2002:a17:902:d4d2:b0:215:9642:4d6d with SMTP id
 d9443c01a7336-21a83f55157mr141221365ad.17.1736497314520; 
 Fri, 10 Jan 2025 00:21:54 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f22ee09sm9278715ad.200.2025.01.10.00.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 00:21:54 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 10 Jan 2025 00:21:35 -0800
Subject: [PATCH v5 07/11] target/riscv: Add select value range check for
 counter delegation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-counter_delegation-v5-7-e83d797ae294@rivosinc.com>
References: <20250110-counter_delegation-v5-0-e83d797ae294@rivosinc.com>
In-Reply-To: <20250110-counter_delegation-v5-0-e83d797ae294@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: kaiwenxue1@gmail.com, Atish Patra <atishp@rivosinc.com>, 
 palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com, 
 Kaiwen Xue <kaiwenx@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Kaiwen Xue <kaiwenx@rivosinc.com>

This adds checks in ops performed on xireg and xireg2-xireg6 so that the
counter delegation function will receive a valid xiselect value with the
proper extensions enabled.

Co-developed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 49648ddc95f0..df748dffa38c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2159,6 +2159,11 @@ static bool xiselect_aia_range(target_ulong isel)
            (ISELECT_IMSIC_FIRST <= isel && isel <= ISELECT_IMSIC_LAST);
 }
 
+static bool xiselect_cd_range(target_ulong isel)
+{
+    return (ISELECT_CD_FIRST <= isel && isel <= ISELECT_CD_LAST);
+}
+
 static int rmw_iprio(target_ulong xlen,
                      target_ulong iselect, uint8_t *iprio,
                      target_ulong *val, target_ulong new_val,
@@ -2284,6 +2289,17 @@ done:
     return RISCV_EXCP_NONE;
 }
 
+static int rmw_xireg_cd(CPURISCVState *env, int csrno,
+                        target_ulong isel, target_ulong *val,
+                        target_ulong new_val, target_ulong wr_mask)
+{
+    if (!riscv_cpu_cfg(env)->ext_smcdeleg) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+    /* TODO: Implement the functionality later */
+    return RISCV_EXCP_NONE;
+}
+
 /*
  * rmw_xireg_csrind: Perform indirect access to xireg and xireg2-xireg6
  *
@@ -2295,7 +2311,25 @@ static int rmw_xireg_csrind(CPURISCVState *env, int csrno,
                               target_ulong isel, target_ulong *val,
                               target_ulong new_val, target_ulong wr_mask)
 {
-    return -EINVAL;
+    int ret = -EINVAL;
+    bool virt = csrno == CSR_VSIREG ? true : false;
+
+    if (xiselect_cd_range(isel)) {
+        ret = rmw_xireg_cd(env, csrno, isel, val, new_val, wr_mask);
+    } else {
+        /*
+         * As per the specification, access to unimplented region is undefined
+         * but recommendation is to raise illegal instruction exception.
+         */
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (ret) {
+        return (env->virt_enabled && virt) ?
+               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return RISCV_EXCP_NONE;
 }
 
 static int rmw_xiregi(CPURISCVState *env, int csrno, target_ulong *val,

-- 
2.34.1


