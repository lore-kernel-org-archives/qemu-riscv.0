Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zi-00007E-2Z
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zT-0008Kf-2y
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:12 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zR-0007sG-Ea
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:10 -0500
Received: by mail-pj1-x102f.google.com with SMTP id y2so1791503pjg.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832928;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FJ3kazGOVFLnf4MghwTEirDnBq83iazSIg0TJyibaMc=;
 b=hnKMQUuVoWneCpN53EdiLiUuq+qqkbkG+lYAy8NtU1mGV8pQm62oN1JJMP9JvKBTLl
 loPPCn7QbfyIXy9zi2UKbFlHGQlATi+ShifJlzETPyVqb/KaDfCh7HioTUylblkqvg84
 Yn8wTkSO7zsRLbTatKDDuA32/UWZo+AFGnbd916MIflMB4G4ZNCER58zwB50kmk7G3gn
 yOioWd8wNRvFR00FBnTZr8sMj21Zgx2c7Pijf8HnvQ2BRYge1TVR3bfZPAC+GlIvpTZb
 mdUd2kb06CDcdOcMvPxrlU+mI1LaFHZrAlVRlq5S1wXo7PXuNAIBZb+1i5//toT/KQWi
 6VHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832928;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FJ3kazGOVFLnf4MghwTEirDnBq83iazSIg0TJyibaMc=;
 b=xsfk8kC2sFQM5zBuwfe74aocddVs5o9S4RJm65bsXO3nc2Y0YJ+t670+AEqBqfhhz5
 PmSK+22qdpNF9pEn7WRV6bEX9hvBmCkIINp+V35UjRSINaC6JtT52lZiPDkV2CRVDkgQ
 JZta2bbAOBuvfxytX/1yme1bmcGPbg1jdsQbs7kFSml5hdByozZc+4LcpI3dmDsbfRm+
 b1xAdz/p7r2mQzxAcsglYNXlBsoWZyDBeueOSuz9BgGEX/nPJGeETKm0hUqhCjk9o+92
 H2dQZQWWBIXT+WS1a8yboOHHgTSJMSmnORAnb2jHOrUZOjfp5NA3r8pMdo2spYM8Sq5a
 KNfA==
X-Gm-Message-State: AO0yUKXfC3GHl/7RRgBBogCn2m6T1GH+SoaZSMyPicSRee9Mx1GWb30a
 k/oIw1lO/4F7p70Ha1XNQwpB5710jlOid0yn
X-Google-Smtp-Source: AK7set+b00eHBhEdehWuyWQvxlIt6cisRGFxsZUgBNsLei8ii2CuahMvOU/EfitfhBIWxj+WB74CFw==
X-Received: by 2002:a17:90b:4acd:b0:236:a3c2:168a with SMTP id
 mh13-20020a17090b4acd00b00236a3c2168amr888247pjb.33.1677832928439; 
 Fri, 03 Mar 2023 00:42:08 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 w19-20020a17090aaf9300b00229bc852468sm2934170pjq.0.2023.03.03.00.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:08 -0800 (PST)
Subject: [PULL 38/59] target/riscv: Allow debugger to access seed CSR
Date: Fri,  3 Mar 2023 00:37:19 -0800
Message-Id: <20230303083740.12817-39-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:12 -0000

From: Bin Meng <bmeng@tinylab.org>

At present seed CSR is not reported in the CSR XML hence gdb cannot
access it.

Fix it by adding a debugger check in its predicate() routine.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230228104035.1879882-15-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 10ae5df5e6..15b23b9b5a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -459,6 +459,10 @@ static RISCVException seed(CPURISCVState *env, int csrno)
     }
 
 #if !defined(CONFIG_USER_ONLY)
+    if (env->debugger) {
+        return RISCV_EXCP_NONE;
+    }
+
     /*
      * With a CSR read-write instruction:
      * 1) The seed CSR is always available in machine mode as normal.
-- 
2.39.2


