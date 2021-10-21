Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdacm-000334-Ku
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 12:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdacj-000316-NF
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 12:08:57 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdach-0003Ey-L6
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 12:08:57 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso905927pjb.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Oct 2021 09:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m7OUVTx25oQSsDRJEnA7yaoPsyv8LfufAE/tWYxlbYI=;
 b=Evt5cXCMmQHBe5Jioq7IKWsbXuUFfxPj3hggQcXBeqdcqcK/dcc/rVLqt0QS1O9zJ2
 R+XoFI3lxpUYp2A0RMdpXLtYPmfG0W9wz+GqAb5ZcsEktZv2lfk07FkuY46e16bmfXuN
 ul4EsmLMag/E6R+KSKbvWybJjR4ivTHVpCDHGmqIBbEJWrV83Xv+rEG7udK2nbcpsOeI
 VDYtGpek2BbQqgGZajOAkK2JNhx4Edm9/xiG2SeLCN9yTJdM1cUejHOkK2g4VFOL1VoN
 POYF3DC1X8Vg6M2p2aDUexHKQLtURgC5nKIh2Gv+hoxXwq+Xvb7pvq0rB46Ny6k29Mdl
 1wNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m7OUVTx25oQSsDRJEnA7yaoPsyv8LfufAE/tWYxlbYI=;
 b=b6ZZqfpjEo4HuxQH/tWnwjoud2XT+gU9eS0TxEX86L1i0rUfBai3Glc9JkAFRyqd/r
 fAatBcUyMZ8TFN8CnWJeczAGSFhQAqzaif9kN8tT25RfjSKN+pyPcDWqbLTQDmbrHslV
 xCdsZOSRo8zJr0c1BYwnB8qipGkA0kAYanb+gmLu3TjJvCoC5JnO3brTPxdcxqo03uP8
 PnvGUK6LoMeq4tsyP3EBioqQwzHHDWCj+NG5b2lflraipUQ6wJ7oJrqsKWCzuc5TxZY4
 Wn8UZB/W2n2Hw+aVzQPgSWykyuzJSt5VOQMb168gWvh50LCL97pIPaph20hXKvDE/yf6
 51NA==
X-Gm-Message-State: AOAM532Q+Bssuj0i7dolFn6UPCTO0ccenreC7+I9VrrSKMiuUk2h9DYR
 gDsFY/cADBLMehma7oOFJkL7KPrpY1Z+RQ==
X-Google-Smtp-Source: ABdhPJxJjxeZSqOUIg0LsFdLpsbemQtxbwYIbknCgNdRVxYW+Mni6LDo2eOLX7QONEcxKhZ76FyqFw==
X-Received: by 2002:a17:90b:4b4d:: with SMTP id
 mi13mr7503768pjb.187.1634832533084; 
 Thu, 21 Oct 2021 09:08:53 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id r13sm5752505pgv.21.2021.10.21.09.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:08:52 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v5 0/2] add APIs to handle alternative sNaN propagation for
 fmax/fmin
Date: Fri, 22 Oct 2021 00:08:44 +0800
Message-Id: <20211021160847.2748577-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 21 Oct 2021 16:08:58 -0000

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

Changelog:

v4:
  * Add comments to describe why we tie RVF version with Priv version.

v3:
  * Change API names from *_noprop() to *_maximum_number()
    and *_minimum_number().
  * Pick softfloat min/max APIs based on CPU privilege spec version.

Chih-Min Chao (2):
  softfloat: add APIs to handle alternative sNaN propagation for
    fmax/fmin
  target/riscv: change the api for RVF/RVD fmin/fmax

 fpu/softfloat-parts.c.inc | 25 +++++++++++++++++++++++--
 fpu/softfloat.c           | 19 +++++++++++++------
 include/fpu/softfloat.h   | 10 ++++++++++
 target/riscv/fpu_helper.c | 16 ++++++++++++----
 4 files changed, 58 insertions(+), 12 deletions(-)

--
2.25.1


