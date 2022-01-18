Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9dZb-0000VS-C0
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 20:46:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZB-00008K-9Y
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:45:46 -0500
Received: from [2607:f8b0:4864:20::42e] (port=43892
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZ8-0007ST-BN
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:45:43 -0500
Received: by mail-pf1-x42e.google.com with SMTP id 78so11699971pfu.10
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 17:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1m+JcT+vHGXeGWQ9nN6B6HxWx0BHiVNJzT6xLLRo3aA=;
 b=CfJbFooD44MwHND8HZqhz3sPXE3B0W75erLKJqsmmYhYvHzbWqbg9tuxOsiS6j5o0G
 WRRXkGjCyTP2osYFwNAw4kKThb0ZcqxUONfTjtns1UGpuHIOUfL9N/F5nt06PtJVf7ND
 AfEX0u5kL9HCPDIzoaeUxa/ZMTvfkRb+XGSuvhf6bu8G+XlCTkxwLiVpKf8LIKodyMFH
 u6MsUsp54xoEl7WPbz8WBR8B7zUKNVfp4EuBBkUWt3pl3n6PIxquvSHWWQ8a9Rvr5L/i
 hqL6qomQA+nXW5FHhxPQCPWSRV2i9rxWvpj6WI5UfKCXxYQTspsY4yPZITPnEAkDTSi4
 4HTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1m+JcT+vHGXeGWQ9nN6B6HxWx0BHiVNJzT6xLLRo3aA=;
 b=wLY7caec3yZIxG3x9/LndItU9/9GuxNFlSkk3hUWdpvAAHFOKbhyV9xak3vVJN+SL3
 p05Hry00Xjo14ursckLAAM6x77Hr3xIfa8p2cVJ2IwHRAPYO38Gqj2aSPD/StsEf1v5M
 tS/w/CfbnpFy1O1CZDXZ2FQTYE5cyow+vkprUZeVkyj5zFQeBO7C/FXaAduVs2IMpEeR
 xCwWZN5fG2NtYDGGmPIljJyGCeJknlkmvkiTpem2dGlDy+x22b9eAb8Ob3gzPTEYJSjK
 DFsGhCnyOgtk+OJj7sGe0HFoov3ggB9c7/6V0XsoDehSMr3lAnq/HUS1HA18rpGh6ECi
 mrNA==
X-Gm-Message-State: AOAM531wRNX4QoHGHaWy0j5ZpQ486Nk6UkrfGwaBVKjFgSAMuECk7z1T
 +/TokY3fnWi6eBDf1ntkZuMXjg==
X-Google-Smtp-Source: ABdhPJxjIpC7JasRuqXdS3PWWQePvD7fssU5yVlPvD3+vQ6BBPreiDjEBZvdvdi7PMxNPDnTaA7C5Q==
X-Received: by 2002:a63:6b44:: with SMTP id g65mr20987877pgc.175.1642470341056; 
 Mon, 17 Jan 2022 17:45:41 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:45:40 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 04/17] target/riscv: rvv-1.0: Add Zve64f support for vmulh
 variant insns
Date: Tue, 18 Jan 2022 09:45:07 +0800
Message-Id: <20220118014522.13613-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
References: <20220118014522.13613-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42e.google.com
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
X-List-Received-Date: Tue, 18 Jan 2022 01:45:47 -0000

From: Frank Chang <frank.chang@sifive.com>

All Zve* extensions support all vector integer instructions,
except that the vmulh integer multiply variants that return the
high word of the product (vmulh.vv, vmulh.vx, vmulhu.vv, vmulhu.vx,
vmulhsu.vv, vmulhsu.vx) are not included for EEW=64 in Zve64*.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 39 +++++++++++++++++++++----
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 0bf41aaa1e..e64dddda28 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1908,14 +1908,41 @@ GEN_OPIVX_TRANS(vmaxu_vx, opivx_check)
 GEN_OPIVX_TRANS(vmax_vx,  opivx_check)
 
 /* Vector Single-Width Integer Multiply Instructions */
+
+static bool vmulh_vv_check(DisasContext *s, arg_rmrr *a)
+{
+    /*
+     * All Zve* extensions support all vector integer instructions,
+     * except that the vmulh integer multiply variants
+     * that return the high word of the product
+     * (vmulh.vv, vmulh.vx, vmulhu.vv, vmulhu.vx, vmulhsu.vv, vmulhsu.vx)
+     * are not included for EEW=64 in Zve64*. (Section 18.2)
+     */
+    return opivv_check(s, a) &&
+           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
+}
+
+static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
+{
+    /*
+     * All Zve* extensions support all vector integer instructions,
+     * except that the vmulh integer multiply variants
+     * that return the high word of the product
+     * (vmulh.vv, vmulh.vx, vmulhu.vv, vmulhu.vx, vmulhsu.vv, vmulhsu.vx)
+     * are not included for EEW=64 in Zve64*. (Section 18.2)
+     */
+    return opivx_check(s, a) &&
+           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
+}
+
 GEN_OPIVV_GVEC_TRANS(vmul_vv,  mul)
-GEN_OPIVV_TRANS(vmulh_vv, opivv_check)
-GEN_OPIVV_TRANS(vmulhu_vv, opivv_check)
-GEN_OPIVV_TRANS(vmulhsu_vv, opivv_check)
+GEN_OPIVV_TRANS(vmulh_vv, vmulh_vv_check)
+GEN_OPIVV_TRANS(vmulhu_vv, vmulh_vv_check)
+GEN_OPIVV_TRANS(vmulhsu_vv, vmulh_vv_check)
 GEN_OPIVX_GVEC_TRANS(vmul_vx,  muls)
-GEN_OPIVX_TRANS(vmulh_vx, opivx_check)
-GEN_OPIVX_TRANS(vmulhu_vx, opivx_check)
-GEN_OPIVX_TRANS(vmulhsu_vx, opivx_check)
+GEN_OPIVX_TRANS(vmulh_vx, vmulh_vx_check)
+GEN_OPIVX_TRANS(vmulhu_vx, vmulh_vx_check)
+GEN_OPIVX_TRANS(vmulhsu_vx, vmulh_vx_check)
 
 /* Vector Integer Divide Instructions */
 GEN_OPIVV_TRANS(vdivu_vv, opivv_check)
-- 
2.31.1


