Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ptU5Y-0003Lx-Gk
	for mharc-qemu-riscv@gnu.org; Mon, 01 May 2023 10:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ptU54-0003Ez-Hc
 for qemu-riscv@nongnu.org; Mon, 01 May 2023 10:00:50 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ptU52-0006Iw-22
 for qemu-riscv@nongnu.org; Mon, 01 May 2023 10:00:42 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6a606135408so2428392a34.0
 for <qemu-riscv@nongnu.org>; Mon, 01 May 2023 07:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682949639; x=1685541639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FJg9Z757wkoktYD9WwpmRyspyW4Py5K0/MXLwUgCBlw=;
 b=E4P9LoFjlC/NyAb6kQEvSmfHZbbc7SdJjfJ6sduir2MnXBswh3EdqFngSob0L7BfcW
 zLi7qHnao27RnqAK6USgE7wIZvDhBfO+9rzP0eva9323EVQiRt9z/+MVjs+CBWitzC0J
 ZjZ5Gphwpkzu69HmAypAtJuxfpmfVwB06KtaPkRFEWpU+TnZwIkjg6MZJQ178qm5igTC
 bTmbMKNvdSt45CWD7d4rb2cAmtTMUM4HtGE68onTmX1Lx3kiwB6cznnhZEPEQ7fIETe/
 Fn5RyWaXkNmMfwHfFUxPGB70P0IjgZ3B2hyRFkct5k/fZuxNbIcaR5LSTtCwim1/9piw
 QQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682949639; x=1685541639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FJg9Z757wkoktYD9WwpmRyspyW4Py5K0/MXLwUgCBlw=;
 b=W1/k8BEPBTKnfmRDYYAx6AgM5Qjp8+Roc+q4vZznp4TEuGR8De8ufyPt8qDIh+ozid
 1T7dB1H+mBgtXokWKkeT+drpQVLTHOk1HUo8dLuPkEvKqWXZcj24btIxV0wWuL6eI/da
 /plJQ1RkYJGokiUPm59eVL6u1a7uTeP8KOE6IPblhI9IjMytQRGNYDCVLXL7KtjA0nzV
 yQoNN9/JuMSdt/TjM5WKkX8sPBV2cHJhdfUv17+9KNjPZsI+2YK9ZuvEZqI7Up5wiuE7
 CN75RrS0sFJ4V+3l+JGUnEQa24Kj39sIwOIPyx+dFbP11rLCHPDPFD0Okmti5aKlQ8V6
 QuFw==
X-Gm-Message-State: AC+VfDztMws5nube5IWljnp76ilnvwZtbIXJ3l1lrLr+aqgk7Tb9wupv
 eo0Sv8IERfxBc4fY7e2eumXP+Q==
X-Google-Smtp-Source: ACHHUZ6HSLlv/2Tg3Ktcqgodk7CZoCY5wfGTM4fPqrUdlHgJsx50GqmZ2EB8q+anLwbpdr5BiMjEQQ==
X-Received: by 2002:a9d:7a93:0:b0:6a5:fd48:90f5 with SMTP id
 l19-20020a9d7a93000000b006a5fd4890f5mr6776430otn.18.1682949638831; 
 Mon, 01 May 2023 07:00:38 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 f12-20020a9d6c0c000000b006a44338c8efsm10744342otq.44.2023.05.01.07.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 07:00:37 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 1/3] target/riscv: smstateen check for fcsr
Date: Mon,  1 May 2023 19:30:18 +0530
Message-Id: <20230501140020.3667219-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501140020.3667219-1-mchitale@ventanamicro.com>
References: <20230501140020.3667219-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=mchitale@ventanamicro.com; helo=mail-ot1-x32d.google.com
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
X-List-Received-Date: Mon, 01 May 2023 14:00:59 -0000

If smstateen is implemented and smtateen0.fcsr is clear and misa.F
is off then the floating point operations must return illegal
instruction exception or virtual instruction trap, if relevant.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/csr.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4451bd1263..3f6b824bd2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -82,6 +82,10 @@ static RISCVException fs(CPURISCVState *env, int csrno)
         !riscv_cpu_cfg(env)->ext_zfinx) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
+
+    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
+        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
+    }
 #endif
     return RISCV_EXCP_NONE;
 }
@@ -2100,6 +2104,9 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
 
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
@@ -2173,6 +2180,10 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_hstateen(env, csrno, wr_mask, new_val);
 }
 
@@ -2259,6 +2270,10 @@ static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_sstateen(env, csrno, wr_mask, new_val);
 }
 
-- 
2.34.1


