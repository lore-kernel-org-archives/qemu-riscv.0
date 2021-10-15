Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHyl-0003Az-17
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyj-00036E-G1
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:50:09 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyh-0004g9-QK
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:50:09 -0400
Received: by mail-pl1-x629.google.com with SMTP id g5so5899933plg.1
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SM2GN5c2iMKzW4yQ0BrDUcxNnTTdCEikfLjRv9YcrEU=;
 b=PtbO9/zzrGhqvrs82GAQA2suJwhLNti2tCfH7KwWOHF+HAYG9349yAgbBaxNC7h4jp
 mqqJoVHnCIX0S8/UOxXuSfvfkd9ZM6QfA/baARRnxP1jOmrcGJAi1srjGUbloqSvb4Eo
 t9Od4oQQtPW1imGr+J5ZNC3dyTt++EBzCHWV2OT7GwecGfFCDFR4sBvfmB5hZTl8NNuu
 ogTzCG8JGKa3yGc40d/sAPwI8zH1/zcpK1IjHZqPqDGTuwifumcxt6AbPQShmB5znXgb
 Zet42l9tr3t1hhcfySrAKzsU2LNPwWT0KziA4s+/kX9wstZAn6rttuHF7/+9iWV2JJSJ
 +mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SM2GN5c2iMKzW4yQ0BrDUcxNnTTdCEikfLjRv9YcrEU=;
 b=1RlOnv69CcRmSSnddxPKK/ua/ZtUhqt1U+KwnGruXrGQEZIDjimXQ81dc9Vh31jxRD
 Gxl30P9Kro6liwsJn6Z4/408Ajzy6o9R7PtEThpbSuXhcIy01Rrztz73K5yaY7rAAwTI
 L8A4G/1l43Mj4f3WLBrEvJAHl48cFIIRALQbWbKjDVKMY9nqWUwKCelvqMqRR3hQlOsb
 Ww1Kxb1X54E8w51G3f2TQLpWB5iE/2+60btMVspZvXV/fvShZews2VUVu84/WybbewJb
 6FGx/MzKgiIIxo0Gj+QWtcF+g3Ym6D9o+/tv2R6RpIQtakuZssCOErHx2tOidkVYEysS
 uVFg==
X-Gm-Message-State: AOAM530uUMrMn9YOfUAUCz+jwOwDjp0KAhhgoJQ5TegV30dgTXg7EbC2
 7/fhsof1IPQRfNDkQ3R7MdzCnQ==
X-Google-Smtp-Source: ABdhPJxpOsSUk3D2WIJuM8+F6Vh7yoQKpLDRabmJZr5i/nfOLmFJVmdL9APLPduSZHx7u3YF8HqbWw==
X-Received: by 2002:a17:902:ab50:b0:13f:4c70:9322 with SMTP id
 ij16-20020a170902ab5000b0013f4c709322mr9643197plb.89.1634284206495; 
 Fri, 15 Oct 2021 00:50:06 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:50:06 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 55/78] target/riscv: rvv-1.0: single-width scaling shift
 instructions
Date: Fri, 15 Oct 2021 15:46:03 +0800
Message-Id: <20211015074627.3957162-63-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:50:09 -0000

From: Frank Chang <frank.chang@sifive.com>

log(SEW) truncate vssra.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index a30da823d25..40061fc304f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2029,8 +2029,8 @@ GEN_OPIVV_TRANS(vssrl_vv, opivv_check)
 GEN_OPIVV_TRANS(vssra_vv, opivv_check)
 GEN_OPIVX_TRANS(vssrl_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssra_vx,  opivx_check)
-GEN_OPIVI_TRANS(vssrl_vi, IMM_ZX, vssrl_vx, opivx_check)
-GEN_OPIVI_TRANS(vssra_vi, IMM_SX, vssra_vx, opivx_check)
+GEN_OPIVI_TRANS(vssrl_vi, IMM_TRUNC_SEW, vssrl_vx, opivx_check)
+GEN_OPIVI_TRANS(vssra_vi, IMM_TRUNC_SEW, vssra_vx, opivx_check)
 
 /* Vector Narrowing Fixed-Point Clip Instructions */
 GEN_OPIWV_NARROW_TRANS(vnclipu_wv)
-- 
2.25.1


