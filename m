Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgTlZ-0002Gb-Ko
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 11:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgTlX-0002BY-GE; Fri, 29 Oct 2021 11:25:59 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:40529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgTlV-0007Z1-Nf; Fri, 29 Oct 2021 11:25:59 -0400
Received: by mail-pg1-x532.google.com with SMTP id l186so10204096pge.7;
 Fri, 29 Oct 2021 08:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MPJNHEzOaguIJ/8jQidAjMz4+aBCj3iYvGvX5z3WD34=;
 b=Y/+hj244R+HVLOzBFxSPmPUr0IMcU7R/ng+39ziOoSeHLyMcuRweZQ15gMeBTnV9mx
 U3cLG4Z12Q0Bw6zpYbatuAyGoiUCiPkfqR25f8rl/GrApr3A1wnWxp08VO2yfh+pVesX
 tPLIwz39xDBYz3wKmq7Cf6FmfBpcHTAtjV6pDrzWXBGZXh6EULPnNa9REWdqNsiBr4J7
 UmtDEMQH3Vhkytgpj0O7ibAMZW+K2lA122aLY309xsRetTYPK2Gu+DRuGDQkQaa1BSRl
 UbQKxMWckLx9ePbexIiE0ndjwviFYfFvhanfNKrlILx7y8evbdiUxFdx9oCZPhaAyVGa
 BAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MPJNHEzOaguIJ/8jQidAjMz4+aBCj3iYvGvX5z3WD34=;
 b=kxmxiEFls+L1IGFwu/WCVoZWxeEwVBisHYsR1aSKGfRpoUF4AREhyJWZQ+A4TxjgfB
 I+tAZcbVq1VBDkICtz06zXC1evGZA6cr+RARoYqyu6aEH2trzAN5gQEbBi8fxSxBHp82
 lOSH3Hn/+Zoam4DwgICTkCOuV8W96rSeW1lgfwR4142n9SkIe1uNoD4XGVZwiJsYHESm
 jXvYzxSHG/5Z6j5ZarBvPYJeL3CF3Ym5Kt6CSyJBkTIUNl3da09FuG+smHRj9jcHAArz
 /iCrzDoeExhsh2yX00HfPOHjfSWgG1ft1uKtYWyJPadUHA+TVzVl67saKptwHek9rOIE
 AwHQ==
X-Gm-Message-State: AOAM530HEGRz5mgUpPcbwfaML/vlnOJ3NIY0qsEFu7xomv+LwU5LYfyD
 +tmp7p5S31QHLnsknDZuuhIbZ3GsZ2Y=
X-Google-Smtp-Source: ABdhPJyF6eoXDGkttbzhjhJzJoJIcVtCGvTRfMm6cJ6UhQeCZGx5WwnI8bIJNPxvjhHwP+k9qZRUgg==
X-Received: by 2002:a63:6c4a:: with SMTP id h71mr4142181pgc.173.1635521155832; 
 Fri, 29 Oct 2021 08:25:55 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id q12sm6645790pfk.65.2021.10.29.08.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 08:25:55 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 5/5] hw/core: tcg-cpu-ops.h: Update comments of
 debug_check_watchpoint()
Date: Fri, 29 Oct 2021 23:25:35 +0800
Message-Id: <20211029152535.2055096-6-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029152535.2055096-1-bin.meng@windriver.com>
References: <20211029152535.2055096-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 29 Oct 2021 15:26:00 -0000

This is now used by RISC-V as well. Update the comments.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

 include/hw/core/tcg-cpu-ops.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 6cbe17f2e6..532c148a80 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -92,6 +92,7 @@ struct TCGCPUOps {
     /**
      * @debug_check_watchpoint: return true if the architectural
      * watchpoint whose address has matched should really fire, used by ARM
+     * and RISC-V
      */
     bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
 
-- 
2.25.1


