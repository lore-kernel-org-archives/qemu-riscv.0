Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWDw-0006Gi-Mg
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:38:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCm-0003As-97
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:37:44 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCj-0002il-2c
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:37:43 -0500
Received: by mail-pl1-x62b.google.com with SMTP id n6so4165818plf.5
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VjZP4LY1Wxefy+0rLrks1q4QR8IjH+TMsA5bjteWWKA=;
 b=Ysgcfs9rzRtL/UfwmholIWix5qpAaif42x5oQNvsRF1ffo9R4gFXRAbIdPablttr+h
 EM2MxebuFqq3Oi+Ywm0wJZADqJb+TDVf8TRv4hYRvd6pxXd4EXCPTIUwmZlVHZgpc2SF
 9LeWU41hukxSy30xY1hgdjEXD6gQNXyRazYFSbCNyrF0uciAuYgtoT0eyiXyG+1kHX4l
 iCIcALqQNti2kDM8DJ3n7UsEb09q+foVRcnqcjHumbxM09uc1lYR5O7dLy/iD+GujUdW
 6sfFFznlSkrYTvDgdAMXAsNRyysT74+03WctOEv82dxiYvxdOAf9aeSyCNp1wHI3pAlo
 rSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VjZP4LY1Wxefy+0rLrks1q4QR8IjH+TMsA5bjteWWKA=;
 b=FdHYJKyvmgaEFegRY1qWXEEMrWgP6KcLhqD39ZewWHw3Yt49IklFACni7r6qGn9lLp
 vbsZMjKwyenPvtx6ardYQQAO1YBGPbgPx88zRrcsgf14IGyJz9DUMbVsZ6R9ihQD+RUP
 tEuMbTdbBD56WOlgpoEnUqUUmjnBTHH1fWp3X0SPprIoGbjdU4L70TOJ8dg7M62QWnJJ
 li97gaNalUdA6jNO4auuDDNctwfdN36blfmL/1yt6e7RSYJ3+S+19fEPV+PICHZt0HkJ
 kA7rxRf4G4EPhdk9bMB4fMAVxgbNLOsC0dcTRHgwYnSTBWx/jV2GR9aUj2Uaq2L8bkzD
 +wCQ==
X-Gm-Message-State: AO0yUKWyLEvem5b2ZL8J/7mlbwZw1qtJz35F944RH4d6F0em07L0USeM
 QROWImYg0QDR6olNwRXqukIDQA==
X-Google-Smtp-Source: AK7set8LZwIkRMnMLx6GwpxCf9/Rr5S+wVCTra3aqUFcKOTbKRe4JOxU1aYZYE+3O/aQHjkO/kwuLw==
X-Received: by 2002:a05:6a20:3d18:b0:bd:17a4:c35f with SMTP id
 y24-20020a056a203d1800b000bd17a4c35fmr27404534pzi.23.1677476259344; 
 Sun, 26 Feb 2023 21:37:39 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 12/31] tcg: Add tcg_temp_ebb_new_{i32,i64,ptr}
Date: Sun, 26 Feb 2023 19:36:42 -1000
Message-Id: <20230227053701.368744-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FUZZY_BITCOIN=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 27 Feb 2023 05:37:45 -0000

TCG internals will want to be able to allocate and reuse
explicitly life-limited temporaries.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 8d896bcbf4..0c2041bcf7 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -892,6 +892,13 @@ static inline TCGv_i32 tcg_global_mem_new_i32(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_i32(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_i32 tcg_temp_ebb_new_i32(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
+    return temp_tcgv_i32(t);
+}
+
 static inline TCGv_i32 tcg_temp_new_i32(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
@@ -911,6 +918,13 @@ static inline TCGv_i64 tcg_global_mem_new_i64(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_i64(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_i64 tcg_temp_ebb_new_i64(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
+    return temp_tcgv_i64(t);
+}
+
 static inline TCGv_i64 tcg_temp_new_i64(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
@@ -923,6 +937,13 @@ static inline TCGv_i64 tcg_temp_local_new_i64(void)
     return temp_tcgv_i64(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_i128 tcg_temp_ebb_new_i128(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
+    return temp_tcgv_i128(t);
+}
+
 static inline TCGv_i128 tcg_temp_new_i128(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
@@ -942,6 +963,13 @@ static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_ptr(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_ptr tcg_temp_ebb_new_ptr(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
+    return temp_tcgv_ptr(t);
+}
+
 static inline TCGv_ptr tcg_temp_new_ptr(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
-- 
2.34.1


