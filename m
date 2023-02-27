Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW7z-00036f-BJ
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6a-0006xG-TM
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:20 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6Y-0000gF-Sg
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:20 -0500
Received: by mail-pl1-x634.google.com with SMTP id z2so5507416plf.12
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cc505buS8ZqTwJy0cVRT4/uSaARbJr2+/eIoFYK/Stw=;
 b=YhcOvwwbiX6cL1Sdo+8L9MSukEeppnPOyBa4IG5upsnYugKpfhDtmgulzQPyY08alC
 t+J8F+gaWMN50jyk51AkkEUvsN9IU9Ei2o7SF1AwngIp5nMXBeMJJflAFpebcQaTxYmL
 GUdKqM8tCNjMt49RWemQpVo73gRTLcePqpuhvUofW/q/ROIynWBU+AeaTbkOq7PDbxCW
 R3lA6lQQeo86L8gbudXyW7xQzxwEGriwlCisYIrR/AFE8d/oFddZXPhDAHmOTFn7MY2a
 FfWnC0wvlHq89P047NAaUaBwGZ7thI82zdISSvboxOciZg4PBHFaQCEHFtBUaxlbgSxa
 W4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cc505buS8ZqTwJy0cVRT4/uSaARbJr2+/eIoFYK/Stw=;
 b=EisYFcdA4wyel5YoHcuFI11D+z7VGqwzN94Jo1ePI/ddFlt1mNKljmIAmh3MuXiDus
 QX6HxSymLMWf3Ea/X57PlU/jB4wgi9o/PlpMDEu3LRGsnkz1Vw+ipYxz2jqGdzzcCNfe
 wZKw4IHcmQlm5ibGXV2+ud6IPF49xYEFGDY+KQLmGqra2wl0fkq3iuDR7Y78lEIEgHry
 KtdNvv638+i7CZ2KNoEqoAfgSws20zq2Z7SbHW6tsWpvKgvZd61DHpl2TNO/RskAX1mk
 lNcLZPWMAjpPvhUVtSR1Qum1ACre8QRPPkxtj9WVu/YeCMLTHiJNz3d+MnvL0wkjAzEy
 6Z2w==
X-Gm-Message-State: AO0yUKWiY3ifLuYj/gaYoiTOpJ/wSZV+vu0iTvOt8TmDoZEEONk4Tf7R
 PZ51OZNE6aumaiHIRwQMsSqJvw==
X-Google-Smtp-Source: AK7set8AZWbh2VkdZGS4BMyJbx5p9nqGprP02GubM/x59LaX87pl61TldYIrMvAYgYQEFACaYfPxSQ==
X-Received: by 2002:a17:90b:4d8a:b0:237:d5de:5e68 with SMTP id
 oj10-20020a17090b4d8a00b00237d5de5e68mr5558160pjb.49.1677475878019; 
 Sun, 26 Feb 2023 21:31:18 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:31:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 67/76] target/sparc: Remove egress label in
 disas_sparc_context
Date: Sun, 26 Feb 2023 19:24:56 -1000
Message-Id: <20230227052505.352889-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 27 Feb 2023 05:31:21 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index bdf464f802..560fb32e28 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -5727,32 +5727,31 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
         dc->npc = dc->npc + 4;
     }
  jmp_insn:
-    goto egress;
+    return;
  illegal_insn:
     gen_exception(dc, TT_ILL_INSN);
-    goto egress;
+    return;
  unimp_flush:
     gen_exception(dc, TT_UNIMP_FLUSH);
-    goto egress;
+    return;
 #if !defined(CONFIG_USER_ONLY)
  priv_insn:
     gen_exception(dc, TT_PRIV_INSN);
-    goto egress;
+    return;
 #endif
  nfpu_insn:
     gen_op_fpexception_im(dc, FSR_FTT_UNIMPFPOP);
-    goto egress;
+    return;
 #if !defined(CONFIG_USER_ONLY) && !defined(TARGET_SPARC64)
  nfq_insn:
     gen_op_fpexception_im(dc, FSR_FTT_SEQ_ERROR);
-    goto egress;
+    return;
 #endif
 #ifndef TARGET_SPARC64
  ncp_insn:
     gen_exception(dc, TT_NCP_INSN);
-    goto egress;
+    return;
 #endif
- egress:;
 }
 
 static void sparc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1


