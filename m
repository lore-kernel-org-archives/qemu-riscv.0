Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2Wm-0005ol-Cw
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Wh-0005Ow-QC
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:10:27 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Wa-0001vm-Up
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:10:27 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 o2-20020a17090a0a0200b00246da660bd2so576216pjo.0
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7nPBJFUV0lX54ZMpUCSnQezprz128nst/H5IYSZCsHw=;
 b=xPcdzdZ9UkQ78ZaG46ssh58/8aRUmtMJq4wJokaY1I7LTj/DFzQQ6NWwmwM3je1Qn7
 SlqADWZM7IYl2uGAvZLZWzqEO3kAfymOeQAYnSnZaLmvSTMV4E306XhJncC8wrPqoOda
 mwSecMVE78syy4gvMjiCt1E4oIdg6Aspdk/kMN1/sQrQ14CC/FuOgZIwxzVtrUFgjbRL
 4SeRx2GOUIxDpJQNqo58/tdONyCCbZhXyyRTePEfF2EEkgXcmHEAuh2k5O35Zg67unyh
 exIY9U1po5DNzK8syyITKoTVUzWA3gN2B0RoIbom7HqC9suXBdaiHNLXi4py3uVcXeKg
 Jipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7nPBJFUV0lX54ZMpUCSnQezprz128nst/H5IYSZCsHw=;
 b=Lg4QjnTVTLzP7lWqQkk1bgvoW94Xmm0HE7+dNrkwALD+vJfrGpbCSxp3j6NZIABj0D
 jA4jxLRSV5qIzEE7dhNacUpj3n8PgPQWd51xGk1S03MBxnxqxjz2gDx3PQj+HFKInoEp
 B3eDAKBPn+uFNbjGWB0rrG3L4j503fdgEVzjzzlO+T4Rj9AmDeBNlJRxsALZ+hMFt0t6
 /QBQaViwoBHbImk243/7gpqi/NaLzSC2OKcGvVX3mqPeNmCPovBMf9rp48InAmZ62nnM
 +H+21ibUP33Ja2FaXDKb6qqMxOt9eTsYUmRDkFBz1DF4+wRWbGtOOH4OFlb3fFN6Jtm3
 Ij9Q==
X-Gm-Message-State: AAQBX9dI6m7/ihSYx4EhfDAGCAMK3MoskEcG+ZjxSuugTFC8RpK6fD8R
 KmvVCpz6Tp+PkTESzxbuWiwrOA==
X-Google-Smtp-Source: AKy350av2/kxgo1Frn49QgNFI/BguOP3PDbz45V54IAT/KJ/IJ5cjk5W2iRJplwt6baM9YFuidLPcQ==
X-Received: by 2002:a17:90b:4c8e:b0:231:24c1:8028 with SMTP id
 my14-20020a17090b4c8e00b0023124c18028mr1627545pjb.29.1681175420066; 
 Mon, 10 Apr 2023 18:10:20 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1709028a8c00b001a63deeb5e2sm2652130plo.92.2023.04.10.18.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:10:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 51/54] tcg/ppc: Remove unused constraints A, B, C, D
Date: Mon, 10 Apr 2023 18:05:09 -0700
Message-Id: <20230411010512.5375-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 11 Apr 2023 01:10:28 -0000

These constraints have not been used for quite some time.

Fixes: 77b73de67632 ("Use rem/div[u]_i32 drop div[u]2_i32")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-str.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index f3bf030bc3..9dcbc3df50 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -10,10 +10,6 @@
  */
 REGS('r', ALL_GENERAL_REGS)
 REGS('v', ALL_VECTOR_REGS)
-REGS('A', 1u << TCG_REG_R3)
-REGS('B', 1u << TCG_REG_R4)
-REGS('C', 1u << TCG_REG_R5)
-REGS('D', 1u << TCG_REG_R6)
 
 /*
  * Define constraint letters for constants:
-- 
2.34.1


