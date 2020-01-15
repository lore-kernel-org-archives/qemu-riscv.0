Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1irbzz-00064i-LI
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jan 2020 01:17:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58929)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shihpo.hung@sifive.com>) id 1irbzy-000644-0G
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2020 01:17:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shihpo.hung@sifive.com>) id 1irbzw-0003Y0-UY
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2020 01:17:49 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:46318)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <shihpo.hung@sifive.com>)
 id 1irbzw-0003Xa-Pj
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2020 01:17:48 -0500
Received: by mail-pf1-x432.google.com with SMTP id n9so7983991pff.13
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2020 22:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=C7rZrXWGvUQilz0cFhEieglVy8N0UYyJSI47SoBpqAc=;
 b=Ykx0DH9iYvkunRwc8+XQ/oDMrt2MF/fNHWFBbnKBsyk9i/bvp8b9F8thN7mms3yhiF
 MX3L7zgWK1wBuArTW14GhQ7O2+X+pr6UGTSewBf4moA9spVfi5t9RPMDKXu+JA2s2AMA
 ogvJqKn8vFS3AkGspyr+T2qlKQsJldwXUcI7Qc1WKdoS7gDPgmpCebmEdnWPJ10iJNHG
 HFnxuFSjHVol1Hu7Y2PDkO+Dd6vYiHCATb24fCzFt7gQs1oZa5JcvbHrFmGFjKQ4qMwp
 YsV5MUD0LUtM1p0EV/LkMvpFr6aHWQZEPat44XzX/JO/gNQ27X5IBqr78GKa1zGYo1eS
 Gb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=C7rZrXWGvUQilz0cFhEieglVy8N0UYyJSI47SoBpqAc=;
 b=eB1PohQ7c+CqHcIqy0rRMPFl+PbBrZkYP8e4TtBATKz5mkmdFoihPVQ6BkBLSicHej
 qlvgY7Qzzwj8FlebVl4fuvEa1DqBiLsPx0mErS7+iwHYpHQ5fwdIFb90z7MOK9ivzW6h
 A95H4/p/xbs6/XDzO4qBZnfRXtFwZvyV9W0aUWejWPMhENiQPK9vUlDh5pQOjJss9DcT
 /yrOjLdvS1fW1AVmEsWdwglq7l0cHnD9uaaGEhv+ar0iYeSow4nwlrjmIpF6XglqT67F
 bN7b+6mWKiM+SAeVVnmYHyO9hSOXoWxRzvcO5MDtCxhBXzXV8NKC2ozhCF3FEI8DK/pW
 VUlA==
X-Gm-Message-State: APjAAAUZJ4nS8Oub8GZ+HT/9jn9UwSvrK5OEkuWdPQhmDA6qrI8txU4+
 0/ODBeyBX+c+hbNh8mv2ELChfahQddgFLg==
X-Google-Smtp-Source: APXvYqzcNarjWaN8TCrnEYQPUeQ2fGj8zVdXfhDMsE2DqmJdBFWNsmYzaWzkio6u2yx78gkoLN4D1w==
X-Received: by 2002:aa7:84c6:: with SMTP id x6mr28507213pfn.181.1579069067627; 
 Tue, 14 Jan 2020 22:17:47 -0800 (PST)
Received: from gamma04.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id w123sm20633601pfb.167.2020.01.14.22.17.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 14 Jan 2020 22:17:47 -0800 (PST)
From: shihpo.hung@sifive.com
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 ShihPo Hung <shihpo.hung@sifive.com>
Subject: [PATCH v3 2/3] target/riscv: fsd/fsw doesn't dirty FP state
Date: Tue, 14 Jan 2020 22:17:32 -0800
Message-Id: <1579069053-22190-2-git-send-email-shihpo.hung@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579069053-22190-1-git-send-email-shihpo.hung@sifive.com>
References: <1579069053-22190-1-git-send-email-shihpo.hung@sifive.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::432
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
X-List-Received-Date: Wed, 15 Jan 2020 06:17:51 -0000

Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvd.inc.c | 1 -
 target/riscv/insn_trans/trans_rvf.inc.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvd.inc.c b/target/riscv/insn_trans/trans_rvd.inc.c
index 393fa02..ea1044f 100644
--- a/target/riscv/insn_trans/trans_rvd.inc.c
+++ b/target/riscv/insn_trans/trans_rvd.inc.c
@@ -43,7 +43,6 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
 
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEQ);
 
-    mark_fs_dirty(ctx);
     tcg_temp_free(t0);
     return true;
 }
diff --git a/target/riscv/insn_trans/trans_rvf.inc.c b/target/riscv/insn_trans/trans_rvf.inc.c
index 172dbfa..e23cd63 100644
--- a/target/riscv/insn_trans/trans_rvf.inc.c
+++ b/target/riscv/insn_trans/trans_rvf.inc.c
@@ -52,7 +52,6 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUL);
 
     tcg_temp_free(t0);
-    mark_fs_dirty(ctx);
     return true;
 }
 
-- 
2.7.4


