Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgops-0007jf-Hg
	for mharc-qemu-riscv@gnu.org; Sat, 30 Oct 2021 09:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgopk-0007bM-Pr; Sat, 30 Oct 2021 09:55:45 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:40506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgopg-000163-Ej; Sat, 30 Oct 2021 09:55:43 -0400
Received: by mail-pl1-x631.google.com with SMTP id v20so8695187plo.7;
 Sat, 30 Oct 2021 06:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jq/AJG1e94yzZN5jEfbJDx8a9/xfRXa5WXTkgDnhylM=;
 b=I2GhaNWWEqBf+5XlHKzNMrw1Pq7IHqP/u8MgvazzzKFTstPEPvhLN46Sz+kgaigqvM
 ESSSn9pPMLg3Wa9F/JqbsBkGZsPNvnw2sB5SttenCi755NlwjVMNoTh9Qm/AI9YyeOkT
 0Kdt9N2TztFc0Kn6ROPEwhvXrJndLLDC3t2bw+Gb6IGrlUm1bxP1n9oqsP1ehchO3KCl
 pkVNXqlyUSB14R7uuKOHOMA91sY1MhQ5r3Lzm40nIH+vcR6OewssnFv3icMwjaeNEsDt
 UrdmcZSGsNXO41nl+Yg+LjrjoA4Y/2GMkz/MBGDctJ93afEkzLKld+RXvEVxTEY0k3nG
 IX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jq/AJG1e94yzZN5jEfbJDx8a9/xfRXa5WXTkgDnhylM=;
 b=yI8jP1xNGc35O835NRp6RBAmfsFn+TPNOA18kljPrtbvo1lC2EnNwYy6vlmYUioQo+
 IILwxCDnMcbg6Q6KuPO7k6YPy2xj/UOle9xD9DGPAeYmF6BkOIIMq4aiAZT4uSiUpyCK
 kd8uiecQ0BNxLBD6CtJYD8zDRiSYgjgkaqBqnaqt0CVyr7Jj4YECdjejmJsyXxvtXovM
 ObTXxPzi5JhAabGxIeVs+PFqZ10+fXxFMdi/Tgm3vHSQJtYy1ZmrvObHSazaJemvFhMf
 zsjFzE9y/guf3sKY5mqZZXaXvnLIXHlOF8S2nIh6tuEn1V0vQVhfMeRdEWeYJkxA239u
 jvhw==
X-Gm-Message-State: AOAM532kcZ6aYsWd37AGE1u3oKg9OxQMuf+hAcDYvb6fJstFrt8MGSNd
 tRilhUUPeGoZx/xgnPQZ21U=
X-Google-Smtp-Source: ABdhPJyXlyaEW5pm+BSu6HyWjC6xdGDrbSn1DIHni2dxAAp50CtGFG1WSRhjx0uB4QdYRbpVcr4J/Q==
X-Received: by 2002:a17:90b:17d2:: with SMTP id
 me18mr17850864pjb.98.1635602138202; 
 Sat, 30 Oct 2021 06:55:38 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id f19sm3645911pfc.72.2021.10.30.06.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 06:55:37 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 7/7] hw/core: tcg-cpu-ops.h: Update comments of
 debug_check_watchpoint()
Date: Sat, 30 Oct 2021 21:55:13 +0800
Message-Id: <20211030135513.18517-8-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030135513.18517-1-bin.meng@windriver.com>
References: <20211030135513.18517-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Sat, 30 Oct 2021 13:55:47 -0000

This is now used by RISC-V as well. Update the comments.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---

(no changes since v1)

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


