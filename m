Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9S8B-0002HT-Ck
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 08:33:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5x-0001Ul-EO
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:30:52 -0500
Received: from [2607:f8b0:4864:20::629] (port=37390
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5t-0001Cg-NZ
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:30:49 -0500
Received: by mail-pl1-x629.google.com with SMTP id n11so19282988plf.4
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 05:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qEJf89SevVQot2Hj3ZJkC4AKQIDCORDOul1GSl8azAo=;
 b=PBO41w1f7KyjSi3ltr5jfWLTf6tOq00KWOWkK47luy2WjglhssEACIYw6YNk0B94zL
 IAfagHzYwwfweAPFAemyCBISo+GcA2t21ZeL8sh6yiANh8ezA73LQEDmM69f5fDcOOMi
 Rdfa7hme3iqT/gf6YRi6rQIKGJWKfyZ3EfdzhUI0jExQXJT4Ma+7cBrFXJ8a0zgSjdsl
 rM8pKM9MoESYMxfj++bdvFfnHLQnXHViIqDFi+5urB6JZm1nZI1As8i6KxrCiJmQu7Mb
 6n1INj3RTzE0cgXyK0uBBM8dz2jSlMiIdkab5dJ1u7cMR8AU1Vr4yzbyy3oI19bsTdMK
 8C6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qEJf89SevVQot2Hj3ZJkC4AKQIDCORDOul1GSl8azAo=;
 b=gQudpDASwvhA5U57Dp8C4O0CfVq7sRnaVOXPWmMloKCLOG9mbzxjywFIIbJmVYvi1B
 oEa85SpOqcK8uyUEd3E155N/ESZwhVPmFQH7idcWsIfvyXJa2xQWuOCP1x/A6UAxL7Es
 3BkOFaR7h/COptKsQekKetYX3shhM+WCUWVzFbeWo1CV1UsIA7rrqFXa6r8JiqvmVyJi
 8ABcRW7Kw6KOGyisQyBTO4TCK9nvTW6MiPUJ9/4ZAMPfb1ofl++KX4gxDXmeAQj3RASB
 PlVZNuZdpTno9t8fAjjj00nu0hVDsdwOHq3sRPTh4lM1KWKxTS9voLOi7VPo4Zs48xWl
 MICQ==
X-Gm-Message-State: AOAM532rjo0NLQrHrJqeBD7NPPqKraWCtAwYTS3iuKbsX98AGubwNA42
 foqsWksKFd3jmycVuL+sOtTSuQ==
X-Google-Smtp-Source: ABdhPJypn6ZJztkfH4qe/Z+muk/uatFPLpF6ktH9QijxXhY/ImneVw27USSeUGrV1S73mSthVEmf2Q==
X-Received: by 2002:a17:903:11c5:b0:149:a8cf:37da with SMTP id
 q5-20020a17090311c500b00149a8cf37damr22626511plh.132.1642426244369; 
 Mon, 17 Jan 2022 05:30:44 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:30:43 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v7 22/23] docs/system: riscv: Document AIA options for virt
 machine
Date: Mon, 17 Jan 2022 18:58:25 +0530
Message-Id: <20220117132826.426418-23-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=anup@brainfault.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 17 Jan 2022 13:30:52 -0000

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
index fa016584bf..373645513a 100644
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


