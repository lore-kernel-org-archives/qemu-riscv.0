Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9dZd-0000eL-El
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 20:46:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZQ-0000IM-UW
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:46:01 -0500
Received: from [2607:f8b0:4864:20::429] (port=34480
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZP-0007WE-6r
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:46:00 -0500
Received: by mail-pf1-x429.google.com with SMTP id s15so11694348pfw.1
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 17:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V15czMUz/2knKR1M6FlR2coAwKuCvRo8K6+kk8yEwvg=;
 b=KUhXV00JjzlGUeJLc0aMMac40Rqek9zfkurTjJkxXFOQl1oOPYTfPLTbDl12Te49sh
 +hyhJ5GzC60MxjxgrkdJMX+PHN4/HuzmLamDbMbmvIucytvpXetL1yb5NV8YEvs/E8T7
 teiKqFPQ/uPlfaZTCarFjNt+4uclroSwVlfyRgIbRU7/eDHXtpQoWem6cMcKkVINlA9m
 duQlPjwFzaiumRDFghlIg3vg1qWYvNUFBNkaKtqAhQIMxPHzQut7nO21u1wKbU+A5xH1
 ozMiyOsnfPNbKQ0QRHgxUdtdqANOq5TJxaNIvxO/awCJmhXlF/2Mw7Qg7+QitHFqoB5g
 HApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V15czMUz/2knKR1M6FlR2coAwKuCvRo8K6+kk8yEwvg=;
 b=4+78wKyl2IG4F4cg11ogsaOAt5OhMvIBUS+MdPAh8uco9NJhDRvzGnsLH3WPQYGpUQ
 p4Hibsb9POnIbv3eME1ZzrZ63lg1KSoYPpopj3lg3I8Akik00hupFbUZqBN8m5+y2pQt
 Ca+iiWPPZJgG+kVQp2CRfU362pcqcviyrnLO1+4iChL5sgDbrEb23RLoKMAekzu8FfKk
 hfjVzbvBt+7FD986o3osR1YfxHkqf7XH+ipxWBGioBvqOjBSBceZpsLBxEqVXeYBMAW7
 WtJzIDI3GBK9JzVazbhoTdt9ZpnTQIysCXAA2072vPF9u8C04ta3m7v4CYLDC60ZjTJT
 XYZw==
X-Gm-Message-State: AOAM532MynoPuEFfhN+IHR52bn8X6Y0igG9e9RBewU4M9X3I1AisSQHy
 cdc7xoeGZilYlp6dRsZTIe6w0g==
X-Google-Smtp-Source: ABdhPJyD98zBvg9cAPV+uU/Z6vFVtUQUYGh0laZXLvycJj7MsbqYMP8fAGSDZYRfLdPLd9FK9Fc9BQ==
X-Received: by 2002:a05:6a00:44:b0:4be:ac48:6341 with SMTP id
 i4-20020a056a00004400b004beac486341mr23723950pfk.44.1642470358030; 
 Mon, 17 Jan 2022 17:45:58 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:45:57 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 09/17] target/riscv: rvv-1.0: Add Zve64f support for
 narrowing type-convert insns
Date: Tue, 18 Jan 2022 09:45:12 +0800
Message-Id: <20220118014522.13613-10-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
References: <20220118014522.13613-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x429.google.com
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
X-List-Received-Date: Tue, 18 Jan 2022 01:46:02 -0000

From: Frank Chang <frank.chang@sifive.com>

Vector narrowing conversion instructions are provided to and from all
supported integer EEWs for Zve64f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 58f12366dd..9fa3862620 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2826,14 +2826,16 @@ static bool opfxv_narrow_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_narrow_check(s, a) &&
            require_rvf(s) &&
-           (s->sew != MO_64);
+           (s->sew != MO_64) &&
+           require_zve64f(s);
 }
 
 static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_narrow_check(s, a) &&
            require_scale_rvf(s) &&
-           (s->sew != MO_8);
+           (s->sew != MO_8) &&
+           require_scale_zve64f(s);
 }
 
 #define GEN_OPFV_NARROW_TRANS(NAME, CHECK, HELPER, FRM)            \
@@ -2882,7 +2884,8 @@ static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
            require_scale_rvf(s) &&
            vext_check_isa_ill(s) &&
            /* OPFV narrowing instructions ignore vs1 check */
-           vext_check_sd(s, a->rd, a->rs2, a->vm);
+           vext_check_sd(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
 
 #define GEN_OPXFV_NARROW_TRANS(NAME, HELPER, FRM)                  \
-- 
2.31.1


