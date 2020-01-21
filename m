Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iu39O-0001nK-26
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jan 2020 18:41:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58884)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1iu39J-0001f1-3V
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 18:41:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1iu39H-0004rj-2q
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 18:41:32 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40415)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1iu39F-0004q8-Mx
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 18:41:30 -0500
Received: by mail-pj1-x1031.google.com with SMTP id bg7so2407459pjb.5
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2020 15:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to:in-reply-to:references;
 bh=Eswd/iZsVKMQNZDhJhB6RGXioT8oGHLH2OtVyxEhoVI=;
 b=g5jzp4VEzZtEYjyB2n+UMYhAJVojVzgtSlGuSgaIGVI3Xz9DZs6es54aY49CvGBcr0
 uPEX7/6LOY8042zKWOvTCeffJ092IixvFbkrSvbsrvrepJKjgnVQHTmjFR0fxx0VuCK/
 rFNgQ0/y8zPagTCpREDtT6wtOLnk60kP36/gvpj3Is0Dn9MiK0uO+XC1yYDmWqBdLq82
 eddUZB4Q+toID6CE3QtGNRZ7upxBNhYJQAebKkaYzlknhkBeBZkKZQJGCrawhUiZXAOU
 PE2cRqzz4h7JKgt4n77ZYb9KJ92pYB54fNpe6aUHG+jP11TPMmXQHiiwTKxCiPaITWAZ
 Ej3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to:in-reply-to:references;
 bh=Eswd/iZsVKMQNZDhJhB6RGXioT8oGHLH2OtVyxEhoVI=;
 b=HHFyKgj5DpH211KpFiDOlrzt1ezqzwQh1yBLRybM2Evzg9lYfUhODPREbviIWDFh5t
 qV3aqXsuU5GZ6IQQDsbEJ4siOumeWkupYDR2YimJk3ocYezLqDOluDIh91uIAS7+bKpA
 zKSXuAVhm6mTlmDF2fu43qewXos/cgDFwWRgWi800/ZfTj7plesi3wideLiUPgMcfYLg
 82XzFNY8/zHykpx6Yi5cbKe0M8V09ojbIMUlETY1vCMIrk0PzSeRQjBqy8cZiUgeyfHo
 rXQO+EvDgKb4HHq5Cqwms7odjeEmZFamsbKjuFRGjHAexgfP2k+Ro1bceGV6dzcw7yMZ
 0Syw==
X-Gm-Message-State: APjAAAW5FoE5N2NsEdg2iL505PNqkspVl+WExi09NqDOqo/xKd79WvTA
 MENEPS/yNNcrrTki9rH6NIaryg==
X-Google-Smtp-Source: APXvYqyapoWzSwZDcjb0Z6XQ1Sm7nP8kOBmwfpPwwxspCOGCABxo2x5O63fDZI54cl5hLP8uF06cjA==
X-Received: by 2002:a17:902:124:: with SMTP id
 33mr7798768plb.115.1579650088186; 
 Tue, 21 Jan 2020 15:41:28 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id m14sm555650pjf.3.2020.01.21.15.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 15:41:27 -0800 (PST)
Subject: [PULL 4/5] target/riscv: fsd/fsw doesn't dirty FP state
Date: Tue, 21 Jan 2020 14:57:01 -0800
Message-Id: <20200121225703.148465-5-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 ShihPo Hung <shihpo.hung@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <20200121225703.148465-1-palmerdabbelt@google.com>
References: <20200121225703.148465-1-palmerdabbelt@google.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1031
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
X-List-Received-Date: Tue, 21 Jan 2020 23:41:35 -0000

From: ShihPo Hung <shihpo.hung@sifive.com>

Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/insn_trans/trans_rvd.inc.c | 1 -
 target/riscv/insn_trans/trans_rvf.inc.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvd.inc.c b/target/riscv/insn_trans/trans_rvd.inc.c
index 393fa0248c..ea1044f13b 100644
--- a/target/riscv/insn_trans/trans_rvd.inc.c
+++ b/target/riscv/insn_trans/trans_rvd.inc.c
@@ -43,7 +43,6 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
 
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEQ);
 
-    mark_fs_dirty(ctx);
     tcg_temp_free(t0);
     return true;
 }
diff --git a/target/riscv/insn_trans/trans_rvf.inc.c b/target/riscv/insn_trans/trans_rvf.inc.c
index 172dbfa919..e23cd639a6 100644
--- a/target/riscv/insn_trans/trans_rvf.inc.c
+++ b/target/riscv/insn_trans/trans_rvf.inc.c
@@ -52,7 +52,6 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUL);
 
     tcg_temp_free(t0);
-    mark_fs_dirty(ctx);
     return true;
 }
 
-- 
2.25.0.341.g760bfbb309-goog


