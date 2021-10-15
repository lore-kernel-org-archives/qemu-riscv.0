Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbH7V-0006Hu-Rd
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 02:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbH7U-0006Fq-2b
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 02:55:08 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbH7S-0008Tj-DQ
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 02:55:07 -0400
Received: by mail-pj1-x1032.google.com with SMTP id ls18so6573763pjb.3
 for <qemu-riscv@nongnu.org>; Thu, 14 Oct 2021 23:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nKCJJwccUEvcdgbG1LfcoOeO+wP2JV9/kud3YWJqE8U=;
 b=U/3QeeRSGvDOVcKo18yR+/ReD+wAg9/kiBbZMRWgkppyTvZOQ+u5mqjproNvViS1tD
 pTwrVVX1sIDSfw1tcpp+3HpcuvMocIwSvixVI3llmbDbu/aNr9BOp0XnHrWCc/FmNZBX
 Sln78UyrA3JhDkZTKObMol67NO0dyhz2omW4uw9Wrd7663s4QDffBL5EkmYFoxMTBf4p
 CVHl2aw7F8BPZgpTCB8xMFepWtI5LYvpLtqPFYLKwPgfJmZc3E+Fuy3hxW65trDXHtN3
 z1u/VJCjRxUU3kaYuW4ZPLaUgq5u1fbQItkc2uv9L/3ZxDbNEufcG+l9hEqOQrExAqbZ
 8XZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nKCJJwccUEvcdgbG1LfcoOeO+wP2JV9/kud3YWJqE8U=;
 b=7lLapmjNWJJWloKWH+xgI3CuQbZanlWQHIWofpuHdPSNZCG0XsOGrHlC5ePsq51E0R
 DyFgL/uD8rvd2Iv9bcgQaq9y1RGKap5sj7i4Lm+87FVWZXpltTh71Cr/mNnfa5vFPD/j
 nKcAj2hsAgVBmL91s38ThGlAKuCBVqcTOljtfCpcBL5Nu1erwJtL7BvZvgAcHZr9yhi/
 vfIW6O/kiVSvLxWyT1r2gBvvUoYMcikdViVWxEOQOgR9lyozXremet+bi+NzGt5p9ElX
 7KkSgwMsiLrCaVRYdL+ml32GvR0wVbRHrWagOYkiBva6MaPvars+vpJUD4XhUoMy67zG
 jlAA==
X-Gm-Message-State: AOAM530WkbCmX99lE/hKEvXeJla98XacYRGSu3I/ddeh+IZLOb66LLcg
 M/7tlaWWHLfRpgv30kPWiKU9ig==
X-Google-Smtp-Source: ABdhPJyfRYd3J9LtWmBSDVCl5+0kPkjqaYGPKc09GSRmTvi2s9D6RaEfxNZaQLO1m3YCvwzfo4YgZw==
X-Received: by 2002:a17:90a:5502:: with SMTP id
 b2mr26300431pji.154.1634280904824; 
 Thu, 14 Oct 2021 23:55:04 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id d6sm4105059pfa.39.2021.10.14.23.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 23:55:04 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [PATCH RESEND v3 0/2] add APIs to handle alternative sNaN propagation
 for fmax/fmin
Date: Fri, 15 Oct 2021 14:54:55 +0800
Message-Id: <20211015065500.3850513-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 15 Oct 2021 06:55:08 -0000

From: Frank Chang <frank.chang@sifive.com>

In IEEE 754-2019, minNum, maxNum, minNumMag and maxNumMag are removed
and replaced with minimum, minimumNumber, maximum and maximumNumber.

minimumNumber/maximumNumber behavior for SNaN is changed to:
  * If both operands are NaNs, a QNaN is returned.
  * If either operand is a SNaN, an invalid operation exception is signaled,
    but unless both operands are NaNs, the SNaN is otherwise ignored and
    not converted to a QNaN.

This patchset add support of the above alternative sNaN propagation for
fmax/fmin, which is required by RISC-V floating-point v2.2.

Chih-Min Chao (2):
  softfloat: add APIs to handle alternative sNaN propagation for
    fmax/fmin
  target/riscv: change the api for single/double fmin/fmax

 fpu/softfloat-parts.c.inc | 19 +++++++++++++++++++
 fpu/softfloat.c           | 18 +++++++++++++-----
 include/fpu/softfloat.h   | 10 ++++++++++
 target/riscv/fpu_helper.c |  8 ++++----
 4 files changed, 46 insertions(+), 9 deletions(-)

--
2.25.1


