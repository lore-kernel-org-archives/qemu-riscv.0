Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUbre-0008Bc-Gz
	for mharc-qemu-riscv@gnu.org; Sun, 26 Sep 2021 17:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUbrc-0008AN-DD; Sun, 26 Sep 2021 17:39:12 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUbrX-00076x-5x; Sun, 26 Sep 2021 17:39:12 -0400
Received: by mail-wr1-x432.google.com with SMTP id w29so46110441wra.8;
 Sun, 26 Sep 2021 14:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zn/EeFiHzDUyaGhXtsd/E2eXxlWN4jO4U2XJ3ypuRU8=;
 b=TusnAc1oGYHvPlvcSQLjOn/YShIM3N+QvWAZlUMwNDBu1uvHUYutfOjrPDO4kfj8sX
 b+9+ls89Fi0fRVdtyFsqDEK0fgaD3gOMV5P0CEpsQ1K//tjLEdXsUYStw9o3B+zyrDi1
 0K0sOZlegd0Ge98hiFS3UxXweYTR14ZI+7lKO83GETPK579ITIPV2Hx+dNQPk3WvlOaX
 7So0iMatCiCDWBrFq3ATQ3YPTSRbRqgBIFWWO0eB3hNDcMktRGezL05YpoJ8auklCPQp
 KigcmDpFCnwRbFMXrhGSMjsnVeUsGu3QFjO99BNJIU9g3TqZ5vcfpZ3dkx9VG3rQrR1H
 XlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Zn/EeFiHzDUyaGhXtsd/E2eXxlWN4jO4U2XJ3ypuRU8=;
 b=4eXgtdgwWvlTnn68LJ4zMtnmFxDo8yc6KEtmx+1BJ2jHY7mRkjjEZ97KF4qJrdDpiS
 OuzYKLVKXIbfoKMEfa2cdf8aFO4G/AN9AKD7zfTyoapPG+8u6Xu+4bBddfXAdSDfW+rE
 T1gYF7kGycyzUHsqQLwuyWAh2dRaRamxJ2Dq5O513UcuCLc8XA3aYJyjRE0JikR9tdV1
 kn5aUyOiwAHXLvv8+bLPRkyBKXIM8v5wWne9SVheyS/mxNjnTwj0/12AWtJGP/r/f0Ml
 FHpqZZLcRfv7o9isTNE5tUlRYfpcyM/qCONsdvu51rGeKCsS5GQeB0pcBNBSbEprtscn
 p/ug==
X-Gm-Message-State: AOAM533zhO47khku1OiiGC9xE8Af4w5iwW/X2gOy1j/+nWJiaGvJXwOQ
 bk0D4r2Hq8sT/RjI63y2O44Qdyg7PfA=
X-Google-Smtp-Source: ABdhPJxiVb52ouDAu7b9pG6QN8xK6OND6x6i7sqCdqaARk4Tph92KlBMWliKcuKPocFbggL8vNiDqg==
X-Received: by 2002:adf:a31a:: with SMTP id c26mr25367673wrb.307.1632692344935; 
 Sun, 26 Sep 2021 14:39:04 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 4sm13854324wmv.42.2021.09.26.14.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 14:39:04 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Joelle van Dyne <j@getutm.app>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] tcg/riscv: Fix potential bug in clobbered call register set
Date: Sun, 26 Sep 2021 23:39:02 +0200
Message-Id: <20210926213902.1713506-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 26 Sep 2021 21:39:12 -0000

The tcg_target_call_clobber_regs variable is of type TCGRegSet,
which is unsigned and might be 64-bit wide. By initializing it
as unsigned type, only 32-bit are set. Currently the RISCV TCG
backend only uses 32 registers, so this is not a problem.
However if more register were to be implemented (such vectors)
then it would become problematic. Since we are better safe than
sorry, properly initialize the value as 64-bit.

Fixes: 7a5549f2aea ("tcg/riscv: Add the target init code")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/riscv/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index dc8d8f1de23..5bd95633b0d 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1734,7 +1734,7 @@ static void tcg_target_init(TCGContext *s)
         tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffff;
     }
 
-    tcg_target_call_clobber_regs = -1u;
+    tcg_target_call_clobber_regs = -1ull;
     tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S0);
     tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S1);
     tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S2);
-- 
2.31.1


