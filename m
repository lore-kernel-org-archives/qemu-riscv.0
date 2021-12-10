Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvams-0003od-5w
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:57:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamj-0003gX-T1
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:57:43 -0500
Received: from [2607:f8b0:4864:20::1030] (port=37459
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvami-0006E9-E6
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:57:41 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 cq22-20020a17090af99600b001a9550a17a5so8859815pjb.2
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e7B4kkyAgX6xNHNolowLfJIRFBVDjfOHM3MrmL545wY=;
 b=HyD4p8qM48RFLiwd1jsfMQe+jkoG1HNnyiEWGKy/Vt7bEuNPYPAQaFkmlGuwawC9Nh
 E8Fw/Kyv1PlD8dbuPJd6Ng1edJxpVMQLCNXuym7AskyUC6khxZJIqqpNHvQ5QkdDb65u
 2RyLX7zphT16YFB6/8P3tA8I1kep6a5ioF7wxNniWiXpcDp1KsLmlGisyae7sOwWo8rz
 LRKCf92RxhekTCtUscga2AUUnr9LX23uBaUsFApJOYDqRVDT66HI93SMNzu/clyGN+mw
 dhoOluv4ZTVcN4yxuCJou8+bHbXNa12uh7crdVs0eDz86mbxMjI243YpecwF5UTgPizd
 w+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e7B4kkyAgX6xNHNolowLfJIRFBVDjfOHM3MrmL545wY=;
 b=fK62UZbcb4IXbryiZ92XEjzAhyndFdpUZ1ITFzNiFGYwM9dGftTibvKCHpFVPKaWTH
 mQKSA/CPUo41bK2jFrKXXVZ4HGj/CbQ7NUYVtVOl+XzTn8jbtAgWGexMnqmt+3JsmoE0
 l8wS93puAV0l7kkdn8/0VnSk7dN+u4pCpsuFJ2F7/1pVs3maXtyTMx0Wn4e3neJhVQES
 xnP6pJ1WrUo0N6Osq85On9tAcmNeTGixs/HhfKxwlah004jizPIZAYm6uSLkppe4ZVph
 F4dBWMbgpPIGMNY9k2BgwVnzQEQCGobDkyu22yVQsHJT6TTVZ3u5bdGd928YrOCWZl5L
 pUkw==
X-Gm-Message-State: AOAM5301O1q94ApTAPbzYhZLb2Z8d2A/4abQC5bjUpf319TEgRqTpYGL
 Q7znJvKM4ejpTlWMCZWkUCrorQ==
X-Google-Smtp-Source: ABdhPJy1cekoZ25sOiXlwXVAuXBeGlL9X3FkPwuD6kBv3MrcB9zCe1mxlNVKkSrXtcGb444pGWKk6Q==
X-Received: by 2002:a17:90a:670e:: with SMTP id
 n14mr22100258pjj.144.1639123057639; 
 Thu, 09 Dec 2021 23:57:37 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:57:37 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v11 05/77] target/riscv: rvv-1.0: add sstatus VS field
Date: Fri, 10 Dec 2021 15:55:51 +0800
Message-Id: <20211210075704.23951-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 07:57:43 -0000

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 72a716c999..bb62da7549 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -409,6 +409,7 @@ typedef enum {
 #define SSTATUS_UPIE        0x00000010
 #define SSTATUS_SPIE        0x00000020
 #define SSTATUS_SPP         0x00000100
+#define SSTATUS_VS          0x00000600
 #define SSTATUS_FS          0x00006000
 #define SSTATUS_XS          0x00018000
 #define SSTATUS_SUM         0x00040000 /* since: priv-1.10 */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index bb500afdeb..83f4dbd824 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -463,7 +463,7 @@ static const target_ulong vs_delegable_excps = DELEGABLE_EXCPS &
       (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT)));
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
-    SSTATUS_SUM | SSTATUS_MXR;
+    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS;
 static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP;
 static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
-- 
2.31.1


