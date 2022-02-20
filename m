Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nLi15-0005CA-VJ
	for mharc-qemu-riscv@gnu.org; Sun, 20 Feb 2022 03:56:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nLi0y-00058s-4t
 for qemu-riscv@nongnu.org; Sun, 20 Feb 2022 03:56:24 -0500
Received: from [2607:f8b0:4864:20::52d] (port=46949
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nLi0s-0002ca-P3
 for qemu-riscv@nongnu.org; Sun, 20 Feb 2022 03:56:18 -0500
Received: by mail-pg1-x52d.google.com with SMTP id s16so11629712pgs.13
 for <qemu-riscv@nongnu.org>; Sun, 20 Feb 2022 00:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XEutY4POa29lyzxgECGttyMAKU/w3NXEAg9h4SeGwb4=;
 b=KVbds/Mp1zeMrbCITclCrKOmRw2V0V+s0hU5MSXXRbRKfNi82D+dshbFMDOEoQzDSL
 EcY5EkX7R8y9ALossg/CUiJfW37Dfx4GJQPradFbfoJKQomKw7/N94pFO+dDmv9sZpBZ
 Z+2gh9fOYQi6UqCj22/OYdC12IBlDPK0lRZZ8iFHVzHdy2QXguAF2njdvnCUN2VUZjC9
 ba1YWFXB8vCR49kMfuAcsg/2fIEHA6xiFORRSl4vuWkJFkFj1zxFnDr+CEkeYz35DzAx
 gKhA7lBKcjspem6GDv8tOhkAC97mGdE/P1KRBFfid+CLevVo1Bb4oxQvPOtB5UfnjNSW
 8fEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XEutY4POa29lyzxgECGttyMAKU/w3NXEAg9h4SeGwb4=;
 b=dRe1tPP1uYYyh+ZrnktWjnos6Xdn3Fl5JYnp2HT443NL0nfMzXWEtGDXjAe27kKQsH
 rdeDDi4TFyJ4Wy65jTmE0SomSlUxb/IdHN+uRDgNZGLSD317Zh+8ImrwQf2t/XIkpo26
 aj5gmGhZfZw01fGQhEBIj7ZhW6eKg1lB5ADQFAK1W8kank0XrJFyw6pnPh5pINxXQGLF
 S/o4Mw804zgIctCzhOi3L3SvRo9AUIszrL3NGpe+f6r/rdP44ENn08mkvmFyMT1m/XF5
 w0k7gb0wVMi5+01iwB/Gp6uzJf0D+5U8BwPTh1JQcywYce3/NbtI743MImgEJdxa2ToE
 NXrg==
X-Gm-Message-State: AOAM531T5ZdTj/nYStDPFlJhn4afvqGdrHOtzPW9jJVmIMSZKi/9NQry
 F1LlIWPIJLU4GkLDNSpqrbu4Fw==
X-Google-Smtp-Source: ABdhPJwr2UXc59spJMzSqjCMayNEpOOVmcfMbcOkUyUNP6jZGJsn+YYQYNloL+faHc0XJ8CHm8B8vg==
X-Received: by 2002:a63:d04b:0:b0:373:3567:a3d0 with SMTP id
 s11-20020a63d04b000000b003733567a3d0mr11978750pgi.455.1645347373414; 
 Sun, 20 Feb 2022 00:56:13 -0800 (PST)
Received: from localhost.localdomain ([122.162.118.38])
 by smtp.gmail.com with ESMTPSA id q13sm9317220pfl.210.2022.02.20.00.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 00:56:12 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v10 4/5] docs/system: riscv: Document AIA options for virt
 machine
Date: Sun, 20 Feb 2022 14:25:25 +0530
Message-Id: <20220220085526.808674-5-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220220085526.808674-1-anup@brainfault.org>
References: <20220220085526.808674-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::52d;
 envelope-from=anup@brainfault.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Feb 2022 08:56:24 -0000

From: Anup Patel <anup.patel@wdc.com>

We have two new machine options "aia" and "aia-guests" available
for the RISC-V virt machine so let's document these options.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 docs/system/riscv/virt.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index 08ce3c4177..1272b6659e 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -63,6 +63,22 @@ The following machine-specific options are supported:
   When this option is "on", ACLINT devices will be emulated instead of
   SiFive CLINT. When not specified, this option is assumed to be "off".
 
+- aia=[none|aplic|aplic-imsic]
+
+  This option allows selecting interrupt controller defined by the AIA
+  (advanced interrupt architecture) specification. The "aia=aplic" selects
+  APLIC (advanced platform level interrupt controller) to handle wired
+  interrupts whereas the "aia=aplic-imsic" selects APLIC and IMSIC (incoming
+  message signaled interrupt controller) to handle both wired interrupts and
+  MSIs. When not specified, this option is assumed to be "none" which selects
+  SiFive PLIC to handle wired interrupts.
+
+- aia-guests=nnn
+
+  The number of per-HART VS-level AIA IMSIC pages to be emulated for a guest
+  having AIA IMSIC (i.e. "aia=aplic-imsic" selected). When not specified,
+  the default number of per-HART VS-level AIA IMSIC pages is 0.
+
 Running Linux kernel
 --------------------
 
-- 
2.25.1


