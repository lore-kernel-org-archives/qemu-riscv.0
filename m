Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nACsk-0000Cy-Dc
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 10:28:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACsj-00009a-ME
 for qemu-riscv@nongnu.org; Wed, 19 Jan 2022 10:28:17 -0500
Received: from [2607:f8b0:4864:20::62f] (port=38745
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACsi-0000c1-2Q
 for qemu-riscv@nongnu.org; Wed, 19 Jan 2022 10:28:17 -0500
Received: by mail-pl1-x62f.google.com with SMTP id c3so2532370pls.5
 for <qemu-riscv@nongnu.org>; Wed, 19 Jan 2022 07:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qEJf89SevVQot2Hj3ZJkC4AKQIDCORDOul1GSl8azAo=;
 b=UxihDh7BDZTIwTgHDq/aJU2xGFH0tM31+tk2mUih511jl5A75G8wg2x6yiW4iTy5F8
 0V8DyjbMJMRvRLgCpirln0aCeoEzgF9Fa8WlTzjSrjffNQZsJDIEHUiQXYESvrDBHDBd
 +WJeK1RM1rxEy4Vh0jrCm1IyBfdlnrikvNl3rZI1W06/2Yh+NOuf43NBo3nF0Yh7tnjx
 Lpz4p1qP3usiZvTFp95l9OJtob5XM+lXK2FoQ8/U3AsD+dRiwaC6+zNXbbpbFuW/ArKp
 nOOshgIBvdQl4uMPfp7LevBjk2Kld1e3rqFIBvDTKgbyZsbsknw+XH9vU0pBd/HcLIKz
 iAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qEJf89SevVQot2Hj3ZJkC4AKQIDCORDOul1GSl8azAo=;
 b=72cXI9jkDyCQ+JSXHJyiEm9vgHIuIoRVW1tme72NUReKL2XVxOPBavobNHZVHM4tOu
 wZY06VGt8+1E/DWcdT1+chcWO8QO6ArFdPV0McnPvz1bKakxY9UqwRYOBVPhIyMi6p25
 NRYN4nWEBIcoPrOHfbKWoXFc1CrqJnkPoqMbC05Aum5T0w5xAmEfFfydXcJrcX096Ica
 FZxqd5awRAt8vIa2QUO/EIQQVPO13jMLI5NSD6vrdspF7tB5bDP0/Mcd0zx/FE5olgjE
 gLBCfDe/U8jAU183kSLKsUmDX2T2vkwkZ/c7OeaGWuLds7ZktbEs2owv4sGFs/Q1tXhc
 8vcA==
X-Gm-Message-State: AOAM532zmKAtzG4fyCnLpA5bdHGvSe+e0O7ASxVt08qbuhxhwCVh1OYw
 ICFMp3IcUtEhT4ktutlX429R7A==
X-Google-Smtp-Source: ABdhPJxqNEc3oZIrDlcNNreMUMWPC4vgxXKQs55vBHsaHfZjGHEkNjwV/tOjwQ4k+dO5rDz5tCpR3A==
X-Received: by 2002:a17:903:124e:b0:149:aafd:494c with SMTP id
 u14-20020a170903124e00b00149aafd494cmr33423129plh.164.1642606090107; 
 Wed, 19 Jan 2022 07:28:10 -0800 (PST)
Received: from localhost.localdomain ([122.179.40.245])
 by smtp.gmail.com with ESMTPSA id 187sm26791pfv.157.2022.01.19.07.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:28:09 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v8 22/23] docs/system: riscv: Document AIA options for virt
 machine
Date: Wed, 19 Jan 2022 20:56:13 +0530
Message-Id: <20220119152614.27548-23-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119152614.27548-1-anup@brainfault.org>
References: <20220119152614.27548-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=anup@brainfault.org; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Wed, 19 Jan 2022 15:28:18 -0000

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


