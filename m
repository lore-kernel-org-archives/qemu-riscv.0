Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k5Q8Z-0004Cm-1q
	for mharc-qemu-riscv@gnu.org; Tue, 11 Aug 2020 05:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k5Q8W-00048X-Sb
 for qemu-riscv@nongnu.org; Tue, 11 Aug 2020 05:00:00 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:39803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k5Q8T-0005UK-M5
 for qemu-riscv@nongnu.org; Tue, 11 Aug 2020 05:00:00 -0400
Received: by mail-pf1-x443.google.com with SMTP id u128so7253622pfb.6
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2020 01:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=M1/+lOZ3eparg8aTsL9UyW6fv03iFO6q1sofLNzR6pU=;
 b=Y/s45AAZ/jqdV/jvhnnTqDk/ExAahyjXO3UrxR3kS8ruuKalIhkmD0j+myFvHhyAjQ
 1OziUe8NX45n8d5bdQSGGomsR0NWEpMA2YtcsSuZvaL2vftf3zvy3zLzbheiJ5bju30L
 bO3EOr9dFm0amFZ/GWtFmPJFkGjnFAz/XqtQMFeZ1Zutu9TYEFaUXJC+nNDWlBW5rRKk
 EmBySFG5oboS+5Pre7JBvkPg/sMtxNG0BS+vDsi1Rsi4+IfiBTka4DxkblPsOOxmSudy
 Q+VG/seKa6SJsBV4MgmqpLhNXT4IH08CS8QunTGre3r8KFz3XVmiMgwdfSY0LawAZjqj
 ueng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=M1/+lOZ3eparg8aTsL9UyW6fv03iFO6q1sofLNzR6pU=;
 b=IPuguqy1o8YjSoMrF69RJG8YHosXEO5bWzt/nyjCQoz3SXd/4G2YEUhpkMeE2jfaUx
 GlUBIMol4WA2nBjJD0vpvJrkEfqJImSrj7lVLhwjCWPwJ5N/oETdrGctnZfyYUZs64Q9
 gUnaYMF3iuAHaQOIQi6q277smQ2lo5Vhqs6lA5405vPJ6RI5ZBgUuHJfWr1ECb9QgTas
 IamYNGBmUJrc6pfPjk/KOlAVKAd1CQphDa0jF2RDJB5/cz9USvaxYUwMnsLFdFV/Z1PC
 15NFRFKP3WF4VU2p3A5oVf8XguAp2e/8zE+Ih5Kg4K60Li848ErAQNtA0vwlJAbF+oC8
 4CIQ==
X-Gm-Message-State: AOAM530OFjOKEFXHJPnhnyg5CE+1TfGJpZAHVS+OBjgFF9E5Tjyo1sqp
 DWZ/faGwt5psaoluPRG9/IteFA==
X-Google-Smtp-Source: ABdhPJzrJ4IuuFf+rKOGWkFJpKbJDJCIsdRwm1IsxT0xFwEpUmIrrvgkM4jh57nMkxlln4EUVnBfwg==
X-Received: by 2002:a63:f84f:: with SMTP id v15mr22210pgj.386.1597136396176;
 Tue, 11 Aug 2020 01:59:56 -0700 (PDT)
Received: from gamma11.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id w10sm1282499pjq.46.2020.08.11.01.59.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Aug 2020 01:59:55 -0700 (PDT)
From: Chih-Min Chao <chihmin.chao@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH 3/3] target/riscv: support 'x-k' in cpu option
Date: Tue, 11 Aug 2020 01:59:26 -0700
Message-Id: <1597136381-17296-4-git-send-email-chihmin.chao@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597136381-17296-1-git-send-email-chihmin.chao@sifive.com>
References: <1597136381-17296-1-git-send-email-chihmin.chao@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=chihmin.chao@sifive.com; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 11 Aug 2020 09:00:01 -0000

zfh extension is still a draft and is not included in master spec. The
related field, 'k', in MISA is also undecided but has been discussed in
reference link.

  ref:
     zfh spec: https://github.com/riscv/riscv-isa-manual/tree/zfh
     misa field: https://github.com/riscv/riscv-isa-manual/issues/414

Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
---
 target/riscv/cpu.c | 4 ++++
 target/riscv/cpu.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 228b9bd..8ad8782 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -469,6 +469,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             }
             set_vext_version(env, vext_version);
         }
+        if (cpu->cfg.ext_k) {
+            target_misa |= RVZfh;
+        }
 
         set_misa(env, RVXLEN | target_misa);
     }
@@ -509,6 +512,7 @@ static Property riscv_cpu_properties[] = {
     /* This is experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
+    DEFINE_PROP_BOOL("x-k", RISCVCPU, cfg.ext_k, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6a077c1..bdef2a8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -281,6 +281,7 @@ typedef struct RISCVCPU {
         bool ext_u;
         bool ext_h;
         bool ext_v;
+        bool ext_k;
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
-- 
2.7.4


