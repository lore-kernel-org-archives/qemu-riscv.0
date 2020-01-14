Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1irJDz-0006eq-CH
	for mharc-qemu-riscv@gnu.org; Tue, 14 Jan 2020 05:15:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39291)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shihpo.hung@sifive.com>) id 1irJDv-0006ZX-P2
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2020 05:15:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shihpo.hung@sifive.com>) id 1irJDu-0003lS-LP
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2020 05:14:59 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:33006)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <shihpo.hung@sifive.com>)
 id 1irJDu-0003l2-GZ
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2020 05:14:58 -0500
Received: by mail-pf1-x442.google.com with SMTP id z16so6368447pfk.0
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2020 02:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HAzIVuP0bmBD8pCxZRV0faJXmCFnhedWNqbSK2+xQQE=;
 b=dSuK0nCkduYNrO3mW4esWh3FMlCq9BcXxSC0BifAw96dhAiX3z/7STZAzghRVtxp4u
 6nT6FwhwaE0dgAy3xU3b63iH3iEtX3QNsy1zACgVP8rkMM4uro5+k/01SdckE5r1c1dn
 MjGy33FU8iSdvnIL+mD+nW7MopYNLesppcRP8CFHmeIK6MMWQTwldMEtwhRDDDvtfzug
 7DSAiZNE61HpiUSPbv/ugSmC/+GhWcfNOuTG417ebEzy+lMBQdJy/lcOCWx2RiCHOyeX
 DJcRHPJFPj7KrLIAB9y3nsHuymDFhwJHrol0orveLLYjGh0erVw+08MTJRWNRrabcT//
 U9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HAzIVuP0bmBD8pCxZRV0faJXmCFnhedWNqbSK2+xQQE=;
 b=DNrUVcTQfxnaxPfEpi8Xn9njUUmq/AtShmAAdAd8uERSvn7C/x1NSi/PayJPc+mlup
 qbFpB0PrcD8zJQm7EeYdThhRkaGHXjxDPlv1d6opK9ESf4bSPxAgXPBWh2Q75oLxu1d1
 3rul6jSB3lGqW2cbdy8y6105T1Jb0l5y+3X1uzGPW6f5gczsy0cIlpFUeUXwGnL4OLRO
 iktjG6PEg9B/8JFvss2TTXsfhSHntAEQZk1Oza6YdqXM9+L5OADVnM+6Dum65MrXeXKv
 IUVJYojalVrKnh9vuUiPW26BBFWzto3yW9yoVpkX3I5UbQeH94VPnwmgNyTHDUEeAlpX
 GehQ==
X-Gm-Message-State: APjAAAUM7JaYcUG3PyTxsYYk4232Tjcet2bCbDORZl9t6GsZJxHN+pFV
 +GFZ/ebkQvXMa2x5Q9MeJCdijkF9iZGliA==
X-Google-Smtp-Source: APXvYqxezoIsj/9TH+Evy5DJDgOYpfevoZjjywpPyjhPL3lzDuRpfqIRHleEvjoN1lMDkVfEr7BP7A==
X-Received: by 2002:aa7:90c5:: with SMTP id k5mr24639714pfk.143.1578996897445; 
 Tue, 14 Jan 2020 02:14:57 -0800 (PST)
Received: from gamma04.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id k23sm16158583pgg.7.2020.01.14.02.14.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 14 Jan 2020 02:14:56 -0800 (PST)
From: shihpo.hung@sifive.com
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 ShihPo Hung <shihpo.hung@sifive.com>
Subject: [PATCH v2 3/3] target/riscv: update mstatus.SD when FS is set dirty
Date: Tue, 14 Jan 2020 02:14:00 -0800
Message-Id: <1578996840-14863-3-git-send-email-shihpo.hung@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578996840-14863-1-git-send-email-shihpo.hung@sifive.com>
References: <1578996840-14863-1-git-send-email-shihpo.hung@sifive.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
X-List-Received-Date: Tue, 14 Jan 2020 10:15:01 -0000

remove the check becuase SD bit should summarize FS and XS fields
unconditionally.

Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
---
 target/riscv/csr.c       | 3 +--
 target/riscv/translate.c | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index da02f9f..0e34c29 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -341,8 +341,7 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
 
     mstatus = (mstatus & ~mask) | (val & mask);
 
-    dirty = (riscv_cpu_fp_enabled(env) &&
-             ((mstatus & MSTATUS_FS) == MSTATUS_FS)) |
+    dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
             ((mstatus & MSTATUS_XS) == MSTATUS_XS);
     mstatus = set_field(mstatus, MSTATUS_SD, dirty);
     env->mstatus = mstatus;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ab6a891..e825ee6 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -395,6 +395,7 @@ static void mark_fs_dirty(DisasContext *ctx)
     tmp = tcg_temp_new();
     tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
     tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
+    tcg_gen_ori_tl(tmp, tmp, MSTATUS_SD);
     tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
     tcg_temp_free(tmp);
 }
-- 
2.7.4


