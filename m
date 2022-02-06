Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nGdh9-00083i-5A
	for mharc-qemu-riscv@gnu.org; Sun, 06 Feb 2022 04:18:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nGdh6-0007vN-C2
 for qemu-riscv@nongnu.org; Sun, 06 Feb 2022 04:18:52 -0500
Received: from [2607:f8b0:4864:20::330] (port=36709
 helo=mail-ot1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nGdh4-00012p-K1
 for qemu-riscv@nongnu.org; Sun, 06 Feb 2022 04:18:52 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 d18-20020a9d51d2000000b005a09728a8c2so8850445oth.3
 for <qemu-riscv@nongnu.org>; Sun, 06 Feb 2022 01:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EyU4+THqr3Y8pJWma7DCKWkG8X88FhKyF8Z3F935mXk=;
 b=DeEJuJKdoj0NZhvR5f7t3V/hpuY+3ezAjLO+WtuShf4YFEmrKAeUXNBnf6GOsyW/1t
 MoHsmtljrC8pUzJhd80DicVXhkB4Pzv4f/lNn/vzdu2Zb0uC6ACabqgnPReiY5bEYrYq
 LfFIb2vXPHZHgL4qAozr9zCXQc6D4SVS/1SAY/9hp7DpyKNin/nN7SXtuApWG3oWOWBw
 kAHV8CQQDD5OguezBSyeMDRs+2Ts9iRVicuV6qI3KURsWb3CNyFgvnjkdjkphwpHBp/k
 BIk+3ihOwlTMxz8xut/FUHyV6tLuZ/E0ehnXPY1inaiskPZXScx3eni9V5LrUFypES+H
 9trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EyU4+THqr3Y8pJWma7DCKWkG8X88FhKyF8Z3F935mXk=;
 b=wlwli/8W0rLHaTjhrjm6wZbUbSdFtDa8AdTBk7WEOxuiN/59NLrXUgHfCC2WeSMyiw
 1iZI0YCbGgApwgqTIl1GHBZnPZ68zDdYkD92tb0UYZElwI3knfNayQZMND8GTuJK7V/J
 mHzicIW2FSW0bIETEzsE/DFw3y4ATsv+22z13WvqChUGMsi61N7ItvRHtsHsAME2faqr
 rknCCXmooAAfkmI6U89FGwRr+cmvLmTSy3dMvZnz2vtCDXKPjeJe1tcaqQQAzAfR/Yj6
 1ho8UbKu6ej9NCMsDEWtfG2rlrMnOb7Zz3f3is+uVEzNYsC82PeqCRBF68S9XkLTaUp4
 fhIQ==
X-Gm-Message-State: AOAM530wvloOb+ZwS4GEb/pDo3vkc+DAstaDHuuq41oW63ypEexSq9Jq
 Dnex+W3K2rPE14/uCvuBewqjSg==
X-Google-Smtp-Source: ABdhPJxsK+rSquopr6U5ArkFnbkEZKOVK6ZAJDDTF7giz1xHdift55ZNJiWoK29tfTqHVKgCkwRLRA==
X-Received: by 2002:a05:6830:839:: with SMTP id
 t25mr2405711ots.372.1644139129698; 
 Sun, 06 Feb 2022 01:18:49 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id 1sm1596841oab.16.2022.02.06.01.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:18:49 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 2/6] target/riscv: Add the privileged spec version 1.12.0
Date: Sun,  6 Feb 2022 01:18:31 -0800
Message-Id: <20220206091835.1244296-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220206091835.1244296-1-atishp@rivosinc.com>
References: <20220206091835.1244296-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::330
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=atishp@rivosinc.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 06 Feb 2022 09:18:52 -0000

Add the definition for ratified privileged specification version v1.12

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e5ff4c134c86..60b847141db2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -86,6 +86,7 @@ enum {
 enum {
     PRIV_VERSION_1_10_0 = 0,
     PRIV_VERSION_1_11_0,
+    PRIV_VERSION_1_12_0,
 };
 
 #define VEXT_VERSION_1_00_0 0x00010000
-- 
2.30.2


