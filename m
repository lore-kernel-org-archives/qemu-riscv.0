Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAxZ-00081P-SU
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAxY-0007yH-PW
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:22:44 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:46122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAxX-0006G1-2k
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:22:44 -0400
Received: by mail-pl1-x642.google.com with SMTP id d7so642462plq.13
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QSJ1bGauDFTOgyu9hOGxlnkT/w4hfR8pkrBU4Rw5V5g=;
 b=HjhZ2F4gv7Uu7C3rXpDpLHw4wz8hiqlxT6qS8+x4o2TE//yGi7O48zjIgE6fUSLhDM
 5cVuY7s5ATOoA9RB3lA7Kh3fRFHoS873Hwo7lZqiIIfLwZ6XPFV4M21VEZ+M/6E2/imX
 Lb6VNcH2xE4vmAOGZBvDtQKjSv4AezK2naRlC2tOruCvxShsP3VFMFZ272VYahy7F7o9
 0uMDo3EEY6YsMTDF29AwUWvsdJy9YybZI6mfrB29tCIGpgm1kuP8PLGvkZEcPDW2Ry8u
 zFArc7Xt8AO53HbMA1Lwj1dDhryAdchSkrjDiGzlkeo5L0dfsgm5TTJ+INXrmk9/spDk
 Malg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QSJ1bGauDFTOgyu9hOGxlnkT/w4hfR8pkrBU4Rw5V5g=;
 b=mTA84g0gZWpvUR+dEKGsmLVUqm96JFsDHWfdCLhMW2OaXXHlhgtK/VXOhuM3Cj+6mt
 9SULsd75AbxS+t1ip/dcxVqRECPK8t7+sZZaj9YQY4VgKDs7l+ZBm0OHZK7bvpEiPMQJ
 o2Y0JE7CJK8033SiFOsEGQ3si7TFw2LZoWlo9XhkeQ00DmwCVBo++9h08UornQiPjLz7
 n8SOIqgiqyQg7IBv56YWPMTQ1o4RizH5p2erBEezyMD+hOfeULt0wlPoCF2T04lTRf4K
 J0I/1Rvsf3Run8m7Vksx5H6Qa7R4kxPQSMJ3fp9ctO18q6IWw9FhdEcOI4F4uNG7z7hS
 1TLw==
X-Gm-Message-State: AOAM533Bybx1xKyxYsId5tnKPboUOe7P0GkMGzbkLDrAx1pv/V+YnYRg
 maxQYYnYjqCDo9ZGzXDz/L3hLg==
X-Google-Smtp-Source: ABdhPJzuOYtwL+PSMas3So5P3JXz99kBSBRC++2v4n11BJfk73CrHvsRD8suY2dOP+SsFPXLzSn+mg==
X-Received: by 2002:a17:90b:400f:: with SMTP id
 ie15mr8864355pjb.94.1595409761871; 
 Wed, 22 Jul 2020 02:22:41 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:22:41 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v2 73/76] fpu: fix float16 nan check
Date: Wed, 22 Jul 2020 17:16:36 +0800
Message-Id: <20200722091641.8834-74-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 22 Jul 2020 09:22:45 -0000

From: Chih-Min Chao <chihmin.chao@sifive.com>

      16     15       10         0
       |sign  |  exp  | mantissa |
  qNaN   x      11111   1x_xxxx_xxxx

  The mask should check  exp + msb of mantissa

Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 fpu/softfloat-specialize.inc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fpu/softfloat-specialize.inc.c b/fpu/softfloat-specialize.inc.c
index 44f5b661f8..fe7a5e79e4 100644
--- a/fpu/softfloat-specialize.inc.c
+++ b/fpu/softfloat-specialize.inc.c
@@ -254,7 +254,7 @@ bool float16_is_quiet_nan(float16 a_, float_status *status)
     if (snan_bit_is_one(status)) {
         return (((a >> 9) & 0x3F) == 0x3E) && (a & 0x1FF);
     } else {
-        return ((a & ~0x8000) >= 0x7C80);
+        return ((a & ~0x8000) >= 0x7E00);
     }
 #endif
 }
@@ -271,7 +271,7 @@ bool float16_is_signaling_nan(float16 a_, float_status *status)
 #else
     uint16_t a = float16_val(a_);
     if (snan_bit_is_one(status)) {
-        return ((a & ~0x8000) >= 0x7C80);
+        return ((a & ~0x8000) >= 0x7E00);
     } else {
         return (((a >> 9) & 0x3F) == 0x3E) && (a & 0x1FF);
     }
-- 
2.17.1


