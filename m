Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nG2i8-0007Hi-CR
	for mharc-qemu-riscv@gnu.org; Fri, 04 Feb 2022 12:49:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2i6-00079v-C8
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:49:26 -0500
Received: from [2a00:1450:4864:20::32d] (port=36709
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2i3-0004Dd-6b
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:49:26 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso9939017wma.1
 for <qemu-riscv@nongnu.org>; Fri, 04 Feb 2022 09:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QNnaZkIXpPRbtWA7ShgFZN0d59sV6eg5/LyFV0oNLa0=;
 b=o1vTZQb1W6pI2oM1io+5Q0cnQfHtHOSvaRDCx2qLAop1U5JSME/o776KWwpiNf+Daq
 m++zxRJ5IGdSiq6E5rqo4Gp50Tya6zgeme5eAB5M+q+FaSdn3LhQEz+9dtCpJcFZhDnE
 Rwwes6nj4z+pX9dk5jPf3ZWjAneV/3E4Lu2HkeUYnAaIxJsqbfhdq9nMG+OMsmeqMKBI
 egKrmcpecQJaLWMKeTFlXispjuCm4B8xRk8sNWpwkj9cVGTHTOjtkjZlQvYczzbXGcbt
 Z9beLUqNDK+9UkscByagPCGg6tLaOPJkpILpJ1ktQA9/v+tmaM26HVcvz7jQvjjLs+Rf
 mZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QNnaZkIXpPRbtWA7ShgFZN0d59sV6eg5/LyFV0oNLa0=;
 b=nn2X/TyMMKp+l5RgUb6gdJ9cxSkQllO52n5q8LgKZY8tRjqzoID4BQrbb73Pzi7lGl
 xurs51VpkLG5CvczqcSjEddVNem8lwKbt7FZteOMYts+dLRUM7EY6DJ2aIP15sczEZke
 DB0pRgWGVd8zKqGRaT7apFq0sscJJHMhr66O+9lpHg6XEHu3vWsa2uQUdg/KGLzTz8or
 pTSQYURFMGHSGtIkInQGu40KErzmoA4jWo6ZYhLISzr8DgnpGteMbwL8y1oO18Y8sFZU
 e2W3rJKQRH5NSYrFeJqfNFjVPNQMe/UT7uurqt/+2fsXHtgBW8I/NRvmbeNwkw3xiypE
 rSjQ==
X-Gm-Message-State: AOAM532i7XkhNaORLKATImBtGxdFt4f0oG25h2Fjwm5gK/6xlcSFZNwY
 MykTgES5cJq9Gj5inFnzxAGaVA==
X-Google-Smtp-Source: ABdhPJyN2N0SrdjzujgnPFPho1XspbmjTUOq9s4WUxU6GsKU13s5IjLbr2KWlso8BLJ+HbJI34e1hQ==
X-Received: by 2002:a05:600c:2dd7:: with SMTP id
 e23mr3188825wmh.65.1643996961801; 
 Fri, 04 Feb 2022 09:49:21 -0800 (PST)
Received: from localhost.localdomain ([122.167.157.188])
 by smtp.gmail.com with ESMTPSA id f13sm11381876wmq.29.2022.02.04.09.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:49:20 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v9 23/23] hw/riscv: virt: Increase maximum number of allowed
 CPUs
Date: Fri,  4 Feb 2022 23:16:59 +0530
Message-Id: <20220204174700.534953-24-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
References: <20220204174700.534953-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::32d;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
X-List-Received-Date: Fri, 04 Feb 2022 17:49:26 -0000

From: Anup Patel <anup.patel@wdc.com>

To facilitate software development of RISC-V systems with large number
of HARTs, we increase the maximum number of allowed CPUs to 512 (2^9).

We also add a detailed source level comments about limit defines which
impact the physical address space utilization.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/riscv/virt.c         | 10 ++++++++++
 include/hw/riscv/virt.h |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index dc1b3dc751..367d01d3a9 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -45,6 +45,16 @@
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
 
+/*
+ * The virt machine physical address space used by some of the devices
+ * namely ACLINT, PLIC, APLIC, and IMSIC depend on number of Sockets,
+ * number of CPUs, and number of IMSIC guest files.
+ *
+ * Various limits defined by VIRT_SOCKETS_MAX_BITS, VIRT_CPUS_MAX_BITS,
+ * and VIRT_IRQCHIP_MAX_GUESTS_BITS are tuned for maximum utilization
+ * of virt machine physical address space.
+ */
+
 #define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT)
 #if VIRT_IMSIC_GROUP_MAX_SIZE < \
     IMSIC_GROUP_SIZE(VIRT_CPUS_MAX_BITS, VIRT_IRQCHIP_MAX_GUESTS_BITS)
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 7898c574af..78f450eb60 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -24,7 +24,7 @@
 #include "hw/block/flash.h"
 #include "qom/object.h"
 
-#define VIRT_CPUS_MAX_BITS             3
+#define VIRT_CPUS_MAX_BITS             9
 #define VIRT_CPUS_MAX                  (1 << VIRT_CPUS_MAX_BITS)
 #define VIRT_SOCKETS_MAX_BITS          2
 #define VIRT_SOCKETS_MAX               (1 << VIRT_SOCKETS_MAX_BITS)
-- 
2.25.1


