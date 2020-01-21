Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iu39K-0001jb-PZ
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jan 2020 18:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58845)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1iu39H-0001dt-GW
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 18:41:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1iu39G-0004rB-B5
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 18:41:31 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:34554)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1iu39F-0004oo-LK
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 18:41:29 -0500
Received: by mail-pl1-x644.google.com with SMTP id c9so2058741plo.1
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2020 15:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to:in-reply-to:references;
 bh=hY7S+SF926n6ouIjHpuwLDOoGx0oWtblsPQ8kOr7Bwo=;
 b=fhK0Xmzn8XReFmYk2KEsMa8tvwOu9EpbxMxOv8JtwtADiCDmvvTBppPp5EoScznAxo
 g19pnD82LFUyzEHiLx+hPfRfGlg5ANqR8SCgpeZkP7YRbhlGdgkg6Zffe4I5XhdYbw2e
 LQ6v7PWn0XXvUfDsuA4P8qKBSRcckgxxq3ZrmgkOUKLdznQz+Qzd0xPiMUrOveOAiBhZ
 KSlZLZbUfgbEJa39Ni1pUsNZ2YB3oQecyGnHwIy50lwmXuJvraoD7O5BI8WsxM8VxE8s
 +NlhDAn2+PXHEqV/4L4mVY88k+JIWMj4NHXe2NSKLcHRprQbK52ViynK1muhMk5Xvpq4
 4MFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to:in-reply-to:references;
 bh=hY7S+SF926n6ouIjHpuwLDOoGx0oWtblsPQ8kOr7Bwo=;
 b=iZl/+TQ/weeOwAJwuzkwvy1+YA7o+IH5rbThYaCJJT/rLT0iGFo1pfSCtN3ek0n8DA
 Ehhs/dHPh4xxraRiG9yCviRegO9MyIPXac9eQyMmPPzDu0F0bYsaSJjRcByt2GtwR1gL
 PT/hdkls5C5YqanF96PuO2qh45nKX7avu2CgLWfnMzJFyz/sjYXPwxkmB0B9Ra5mSPbR
 wyShd/ZYd3MGzLz1RRyATPZhZ7u/es4nrs+MTVRCM17y3AFJJDZdsmMhgkJzoSUNeS/o
 GGGv5O5sCpTUkhho+Gqcn2arULcXtjW2ghFe/YXzlOEKKXTDAHd68ZI8GkgJFw50vMj+
 t4rQ==
X-Gm-Message-State: APjAAAXWmvGiU7r7xqF/AcfFLQBl+Fwthr8HAMYh2fJe7mHuShWjDRSf
 25DBLr/uDoQ6LYv/lZBNBuvTpw==
X-Google-Smtp-Source: APXvYqxfOFxbHY/6D+Cr+vLzePiUdC+VazBWttvxJj4NGdZfqmVF/HpKPEMOT9wSSxxHAc2AmbnFGw==
X-Received: by 2002:a17:902:a504:: with SMTP id
 s4mr8082628plq.333.1579650085715; 
 Tue, 21 Jan 2020 15:41:25 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id b19sm43513137pfo.56.2020.01.21.15.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 15:41:25 -0800 (PST)
Subject: [PULL 2/5] riscv: Set xPIE to 1 after xRET
Date: Tue, 21 Jan 2020 14:56:59 -0800
Message-Id: <20200121225703.148465-3-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Yiting Wang <yiting.wang@windriver.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <20200121225703.148465-1-palmerdabbelt@google.com>
References: <20200121225703.148465-1-palmerdabbelt@google.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-List-Received-Date: Tue, 21 Jan 2020 23:41:32 -0000

From: Yiting Wang <yiting.wang@windriver.com>

When executing an xRET instruction, supposing xPP holds the
value y, xIE is set to xPIE; the privilege mode is changed to y;
xPIE is set to 1. But QEMU sets xPIE to 0 incorrectly.

Signed-off-by: Yiting Wang <yiting.wang@windriver.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/op_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 331cc36232..e87c9115bc 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -93,7 +93,7 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
         env->priv_ver >= PRIV_VERSION_1_10_0 ?
         MSTATUS_SIE : MSTATUS_UIE << prev_priv,
         get_field(mstatus, MSTATUS_SPIE));
-    mstatus = set_field(mstatus, MSTATUS_SPIE, 0);
+    mstatus = set_field(mstatus, MSTATUS_SPIE, 1);
     mstatus = set_field(mstatus, MSTATUS_SPP, PRV_U);
     riscv_cpu_set_mode(env, prev_priv);
     env->mstatus = mstatus;
@@ -118,7 +118,7 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
         env->priv_ver >= PRIV_VERSION_1_10_0 ?
         MSTATUS_MIE : MSTATUS_UIE << prev_priv,
         get_field(mstatus, MSTATUS_MPIE));
-    mstatus = set_field(mstatus, MSTATUS_MPIE, 0);
+    mstatus = set_field(mstatus, MSTATUS_MPIE, 1);
     mstatus = set_field(mstatus, MSTATUS_MPP, PRV_U);
     riscv_cpu_set_mode(env, prev_priv);
     env->mstatus = mstatus;
-- 
2.25.0.341.g760bfbb309-goog


