Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyYY-0007fl-Mu
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYX-0007d3-5w
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:57 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYA-0005Ym-8r
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:56 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 r21-20020a17090aa09500b0024663a79050so1796601pjp.4
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fIirSFwi2yILi+El/t2TPjJhZKpm7okvdpXO8dD7jMw=;
 b=GZnDTfw+ocGP8T9EweD/v0n75UlL02443JTIUxqAwOyd/QnRde6jlMnlyjuYQJUQC/
 /jVp2HVxTV5uMmdf7qylbwGdZnHw2cPzp+YQi4pEUffws+ZvuRdfojhMLr326JhQ6yjX
 aCcaiejN9peWdMpeK3EXS/8pbslh+nxL6drKWL96qUpoS7xBR2inqGo9fnXy7E6fTgXV
 n/T3WoT+jhTPJPB0aOh/WKTKFZcB/IlJur9+7BjcfirVvbqQ592yefPM6pZjG1kxxD8Z
 oSqCnKq15X2iQiDoGvajZTZ2GWLKeoP3qJtLe81lUrvnaelV+sb5u0Mb6TlaG88EpcBF
 qCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fIirSFwi2yILi+El/t2TPjJhZKpm7okvdpXO8dD7jMw=;
 b=IIohIPk1eyjk3p822gO1h0rGDn50jk1jWW/AzuaccJZEklYlVecPDrqW5oUXEVyywx
 gBIGBNTOwc12g0o8mD71uQ6GIKHcsvzjXnbPsv4CsqZAoIP36qCYUSOwXiy0LoufAVhY
 /DbmwaRguw9wmG0MDQL+T5v4SkkOAV0ipkdcY7qp5QxxzL4RnQQz4KXs/u+VDBqMNhnR
 Gdjnz6Fxmu7q5q/lfORz/MBrreMu7VL+Za/TZqJrZLRu95RIx74H8T98qARSnxTWOLD1
 QcRaYs6abCpY4LX7KC1uB2ROtbOrrAj9GmHR6TuJzoCuNswvuNxnJFE+1JXAoJVw5xmn
 rwGg==
X-Gm-Message-State: AAQBX9eBavT2i3TVZixpWsgz+Dzp8ZLq9S5zCbFvz38DmQuYLiVHf6HV
 I7L8SBvTPXU7Zy/Wrs/8f9JrMA==
X-Google-Smtp-Source: AKy350aO3XRsKNdmSR8h9ug5B0hcrMQEwOtStTKXx4Ntg8HwjiyJOJWDJkxP7GSVy/9Od5gGcbUP4Q==
X-Received: by 2002:a17:902:d093:b0:1a5:1e67:2500 with SMTP id
 v19-20020a170902d09300b001a51e672500mr511896plv.29.1680921813479; 
 Fri, 07 Apr 2023 19:43:33 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 19/42] tcg: Clear TCGLabelQemuLdst on allocation
Date: Fri,  7 Apr 2023 19:42:51 -0700
Message-Id: <20230408024314.3357414-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Sat, 08 Apr 2023 02:43:57 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-ldst.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tcg/tcg-ldst.c.inc b/tcg/tcg-ldst.c.inc
index 6c6848d034..403cbb0f06 100644
--- a/tcg/tcg-ldst.c.inc
+++ b/tcg/tcg-ldst.c.inc
@@ -72,6 +72,7 @@ static inline TCGLabelQemuLdst *new_ldst_label(TCGContext *s)
 {
     TCGLabelQemuLdst *l = tcg_malloc(sizeof(*l));
 
+    memset(l, 0, sizeof(*l));
     QSIMPLEQ_INSERT_TAIL(&s->ldst_labels, l, next);
 
     return l;
-- 
2.34.1


