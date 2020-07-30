Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k15Et-0008La-Rq
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 05:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k15Er-0008K3-Gy
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 05:52:37 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:34749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k15Ep-0000d3-QA
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 05:52:37 -0400
Received: by mail-pj1-x1044.google.com with SMTP id c10so1749960pjn.1
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 02:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vCoG+ztVSwCxxwzBdEr+Idws45vA2SXXrCmuJf3XgXY=;
 b=hAlhCvz7x04uPFhqoV5CHt56toz9FZ+9mBZopR8NJt3yj6Naa4lLbvTS5ToWd8RIeM
 apxTIopMVcrKkfi7MPKS6Zpbs/hosTKsmq7EAC81qC95wgfLdDeCBEvLXLcqKGk1YjQc
 Y1IUtBZDTb2JJwurGksxUbWyeb00UJLTwn8HSSYe8kILsh1lUTI64ZaKYbHq/Vr2wGyg
 LNZhbY65aRMw53Sf7i27kc2j0XbxdyaV94Ow3MErKCW00HG7BuBWOSFAlIoVzIoL+oJ3
 jbP5oo8UZjC8GHFEE5i73rLrGjzwBlvGaCyaeAYOvNL/qgBnRIrPUbsP+uOSKm2dDUK3
 aXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vCoG+ztVSwCxxwzBdEr+Idws45vA2SXXrCmuJf3XgXY=;
 b=maQydfqnvROXdcR5ycrgvEFKsmFApCG1q4bL9olw937SrLK8STM4mRADV/0GYXKLlU
 fKmd4ekwZuRpWAyC5SQBsW3H3DDM1yKJLpKUM0TMT/OM3Wgy21rXsoc3KnsAqP1bJhHs
 y2V7nDQGnckOl9BpXYZmbOyFq/Yfema/tnQBAF0oSQptO4rp6FPX3L6w4otLLJdlwulL
 xcBSjFW6uk6COk2b+gyj/NoDa8rFoseZY/Xjn1ekvaeVDKFzShQ1/hYJmdpBkjidUQdG
 uzFpgPKGd3Hq3B4OdxJHUdbFV3ONgMtr2MHNoi9ZAFeKH06eGIx04XIq0xe1fQSU48p/
 oHfw==
X-Gm-Message-State: AOAM530TIopxDFqNhZPEIqqz+Q2s7xq+dk8OQJFlBN+C8+BpJ5iMNtON
 HaeO6i1V6udozJy9L/natxYLCQ==
X-Google-Smtp-Source: ABdhPJx//wwKm3qx6SqHBy4DtL/s0vPUXttEk4e9E1nmZmsCuA5Gjf2BTiSLMpGPHynE0sWqXwQGPg==
X-Received: by 2002:a63:9dcd:: with SMTP id
 i196mr32918759pgd.378.1596102753580; 
 Thu, 30 Jul 2020 02:52:33 -0700 (PDT)
Received: from gamma11.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id e5sm5040654pjy.26.2020.07.30.02.52.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jul 2020 02:52:33 -0700 (PDT)
From: Chih-Min Chao <chihmin.chao@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Chih-Min Chao <chihmin.chao@sifive.com>
Subject: [PATCH 0/3] float16 APIs and alternative sNaN handling
Date: Thu, 30 Jul 2020 02:52:21 -0700
Message-Id: <1596102747-20226-1-git-send-email-chihmin.chao@sifive.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=chihmin.chao@sifive.com; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 30 Jul 2020 09:52:37 -0000

These patches are separated from riscv vector extension 0.9 patchset.
The set includes 
   1. alternative NaN handlding
   2. float16 comparision APIs.
   3. float16 to int8/uint8 conversion APIs

Chih-Min Chao (1):
  softfloat: add APIs to handle alternative sNaN propagation

Frank Chang (1):
  softfloat: add fp16 and uint8/int8 interconvert functions

Kito Cheng (1):
  softfloat: target/riscv: implement full set fp16 comparision

 fpu/softfloat.c              | 109 ++++++++++++++++++++++++++++++++-----------
 include/fpu/softfloat.h      |  55 ++++++++++++++++++++++
 target/riscv/vector_helper.c |  25 ----------
 3 files changed, 137 insertions(+), 52 deletions(-)

-- 
2.7.4


