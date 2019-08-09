Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hw71l-0000YM-W8
	for mharc-qemu-riscv@gnu.org; Fri, 09 Aug 2019 11:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50713)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hw71j-0000YB-R8
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 11:42:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hw71h-0008QF-Ud
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 11:41:59 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:37146)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hw71h-0008PC-Dh
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 11:41:57 -0400
Received: by mail-pl1-x644.google.com with SMTP id b3so45162887plr.4
 for <qemu-riscv@nongnu.org>; Fri, 09 Aug 2019 08:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=1N0mIyh5t8eVenXRm3PmSJuWeZ0AYiNkiWHu272Cug8=;
 b=JKbKK+KbdfXoV9FaeFHdlxOgEmWNEvRysMHVRs0Wa1QDVkXrz3sQrqVvmHzzaMgXf0
 KYciDrXlDWnD9uBKK8b3pGQfyfb2eb6rUGqEWzYx9gybZTzwWlzhLN4bvcDEH7fD61/Q
 3x+G+DCc+dhsZUt7tEOrW3J9QDbTsBsij0Ts4TmCwrXCdTNffwsI+UnL0FQa2/GXBmK7
 5ei22cJcv5BtL6kOEurdy9UmiLAhYNa/cxD9AXAVUW+bJL7+n4prVUh0R6ZPWmR6Cg9s
 YndGCQbgueEfxFJAgw44wifI92VKt4aaZQZOQ5TwP1TBOKS9ApahxIYI9mSWcfyJRN4M
 VisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1N0mIyh5t8eVenXRm3PmSJuWeZ0AYiNkiWHu272Cug8=;
 b=PsdjUO3GE4qB3u+EeE+dvQkj8/s6Se7+76tXekR/nEMqpJDtZLHTT4tlMIc1mEHeRP
 +HUDbjsVKNMiMm6bGSbQ1WFKX1VnJCqe8JJfxMB79dedMBJQnPqEPdZsxIFYTVRGLtQd
 cogtsMBNGzwN0xYtJakbGRmXd0t+xhRaQcbQn1Ti2rEZlWylFrWegnO6XKXDMxd85ogA
 2ZmwGyr0DcdT/rFthmbU8s6X0dJGt1xGaib3ZsR60QTGAmWl9K81rX1i0K6EWdPbmnAZ
 Q+T7c9KCAghdYZ2FZgoWer6KWoAYUT+Z3v+48d4iwVkEf7Osivl/9HIRVZcn+iNxMncY
 3TTQ==
X-Gm-Message-State: APjAAAXnYNWWhLps8HNS0iclDxCpmXWZXnjwdVMTAFOLbkMhk424Feqj
 nDWKs3IEvXT48iUWthsY4wk/Xg==
X-Google-Smtp-Source: APXvYqwOAbPFfPgZkrRJ7pinJJdA5PnXjFdRDhHy5X+G8pAZg6ZU6dtglfSpl/PJQhbeuzBZebuPVA==
X-Received: by 2002:a17:902:2be6:: with SMTP id
 l93mr19920795plb.0.1565365315993; 
 Fri, 09 Aug 2019 08:41:55 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 67sm80452179pfd.177.2019.08.09.08.41.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:41:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 philmd@redhat.com, Alistair.Francis@wdc.com
Date: Fri,  9 Aug 2019 08:41:50 -0700
Message-Id: <20190809154153.31763-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-riscv] [PATCH 0/3] decodetree improvements
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
X-List-Received-Date: Fri, 09 Aug 2019 15:42:00 -0000

These are split out from my decodetree coversion of the AArch32
base instruction sets.

The first patch has been tidied per review from Peter.  I now
diagnose nonsense fields containing no bits.  I eliminated the
unused integer argument passed to the named function.  I improved
the documentation.

The second patch is new, a suggestion from Phillipe.  This then
enables the third patch, tidying up the existing usage in riscv.


r~


Richard Henderson (3):
  decodetree: Allow !function with no input bits
  decodetree: Suppress redundant declaration warnings
  target/riscv: Remove redundant declaration pragmas

 target/riscv/translate.c          | 19 +-------
 docs/devel/decodetree.rst         |  8 +++-
 scripts/decodetree.py             | 76 ++++++++++++++++++++++++++-----
 tests/decode/err_field6.decode    |  5 ++
 tests/decode/succ_function.decode |  6 +++
 5 files changed, 83 insertions(+), 31 deletions(-)
 create mode 100644 tests/decode/err_field6.decode
 create mode 100644 tests/decode/succ_function.decode

-- 
2.17.1


