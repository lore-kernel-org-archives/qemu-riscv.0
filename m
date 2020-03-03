Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vmB-0005MJ-Ko
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:51:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45150)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vka-0001pr-Cr
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkZ-0004M6-GI
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:32 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:47059)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkZ-0004LN-BU
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:31 -0500
Received: by mail-pg1-x536.google.com with SMTP id y30so650540pga.13
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=31wka75p/+LkTDvlGbLqLyelOm3o2IEFpYTMuOMAQQA=;
 b=ilLggs6Pg0+r3RYAd3BAokWMyOk3kc/kpMEzbaAvkBSgbXdlcUkz+Hf4M4PU0cCWYP
 CbmR1UGRezGhpesHvuvIrcN7w4Uv6I1YWVJO13bFZ/PQLsIZpqmtbBN4fcRpRRgXLRvg
 oFPZmni38vDzG8Zy2+TY9bacvvBDoZ3MLefUNabMev0QcW+T6329Z713Slj/Iu3k6bmR
 3NHmi4HG6NmHdkkA3oexe4mD+OihumUq0XkIJkEu4n91ro27JQ0oTl4oyePTtxjoHy7T
 FgJAIx8JjrORIZJBcvuW2WWH7AJNRNtX3jUcZGaR63KCnm+nOF+88C/fVu0rO97aVKlo
 g33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=31wka75p/+LkTDvlGbLqLyelOm3o2IEFpYTMuOMAQQA=;
 b=U81K/X3BiUjntshbtt8MwDM04D2357DmFQ8xQPAPM8MZiAJQeXwO/I1S2XHQCxWbT+
 7kwM0sUl2M0KSnK1p4S+KoaIkgFuFD8VDhEbEyWmbqgLHtkNUZfDZB43SY2Fv2zK4Ky0
 ALHB9K8Opj2P2wKJSRaA2UTrr+dPPZ0ZlzaApupaXlJrdcjTPmSpiKYQbYqZ3aCVOi69
 KxeO9r/EG5zXOt1Jt6nHnkBGO4eTpdFegVPw0o15YnB7gHNYZhXd4B6K4KSEavmOxlul
 celFmtNSdAaWOK4ls9qApRfP5wlzIOm96YC07oVp8FN5g123pocxvfxMlVjsiOyIEFEH
 kvMA==
X-Gm-Message-State: ANhLgQ2JLp1oW06pom+M/WfCjfztfKGe3MXufIyzDBD0rKVcXyv7ZcJQ
 m3iwdhAiiJV4OoKAwpRDEkoT+8aJP4xbBA==
X-Google-Smtp-Source: ADFU+vu3IGzBXmDZP9Ucs6XyAefiMzc8rQtbXmkGHE9pjAWGkhPOcfMD0Fk/9LihSZlJY5LitU/SGw==
X-Received: by 2002:a62:de42:: with SMTP id h63mr1612267pfg.188.1583196570022; 
 Mon, 02 Mar 2020 16:49:30 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id o6sm23908819pfg.180.2020.03.02.16.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:29 -0800 (PST)
Subject: [PULL 19/38] target/ricsv: Flush the TLB on virtulisation mode changes
Date: Mon,  2 Mar 2020 16:48:29 -0800
Message-Id: <20200303004848.136788-20-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::536
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:33 -0000

From: Alistair Francis <alistair.francis@wdc.com>

To ensure our TLB isn't out-of-date we flush it on all virt mode
changes. Unlike priv mode this isn't saved in the mmu_idx as all
guests share V=1. The easiest option is just to flush on all changes.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index ccf67aca05..a8b114ae16 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -181,6 +181,11 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
         return;
     }
 
+    /* Flush the TLB on all virt mode changes. */
+    if (get_field(env->virt, VIRT_ONOFF) != enable) {
+        tlb_flush(env_cpu(env));
+    }
+
     env->virt = set_field(env->virt, VIRT_ONOFF, enable);
 }
 
-- 
2.25.0.265.gbab2e86ba0-goog


