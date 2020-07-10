Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscr-0006jT-7x
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqfz-0006Ig-0A
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:43 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:36741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqfw-00073E-5d
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:42 -0400
Received: by mail-pj1-x1041.google.com with SMTP id md7so2456074pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QSJ1bGauDFTOgyu9hOGxlnkT/w4hfR8pkrBU4Rw5V5g=;
 b=MNFmj9LYhfENTei0tAkr9eoOjFeKaQ2uS+MKjcbgt+HEP61OjaA10TZwj5wij8kgx9
 obxSNgGHqB18IiluS++rIGs8eFW7m79wEbzWWhc000e6TX+j9SCUgB9TGjtVQKWqm5XQ
 14bTjTEy5MuysIiSDi5hTmgUvdXCLaimC0DL4doey1zacZKEDq9qT3OqCaT5K06aIzjR
 EolZKxl44uDmfcJm8gzzLwZ5cm08q63rWYz5deGWNs8oEBEQzq/VgptDFjBKe/kuCdfk
 16PRYsE2103KaSbRFYNUnRRXKc0wLzSMU+8DzFChBJM2W/NsGl5fWVPv/sXkE0MGTdYw
 qBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QSJ1bGauDFTOgyu9hOGxlnkT/w4hfR8pkrBU4Rw5V5g=;
 b=kpeAhcu+plLGhr4xamkLzqUZe5flC8LDRZObDA1zrfAQFRIIArxhsOcZV+f546SQsd
 GZQxuXFHGJcQGyopSBXhNx41+fyRhGl3hurP6rMocKDAWtUWYnHUjorT1B9W7LskQTat
 AzSlcRpVuH/qYIRb3p3xxtA1dcF1zMr7F3BW6OR9f3qNf3vw1eJIP+PiACBp05NlZ0VV
 1mrgCkEOvLR6ctcdWjD3K5XG8V27m9J6zMSVP/mRkfszJHannpXG9eaPljCJyaiVksw+
 v7k6WgkAAHj1v+2w0ChduK39EtSmTdyaaUfgwrY2r8+T9y6DLLp3EM7UphRfmSnpkWj4
 X/kA==
X-Gm-Message-State: AOAM530VQZrEulHc9sfo/Nln6yTQpsY2CHD69KvYQZ9eJFhn4SaxRk66
 C2CvPMEv2YemDh7WPEagsvsfEw==
X-Google-Smtp-Source: ABdhPJyMhlKUgfAHDhIFHX/sE8o+NSa4YSGZucN1EP+qSN0RO7SwWaN0RoZy2rh+ip1LI/M43kkAGA==
X-Received: by 2002:a17:90a:3d0e:: with SMTP id
 h14mr4746206pjc.184.1594378478931; 
 Fri, 10 Jul 2020 03:54:38 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:54:38 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC 61/65] fpu: fix float16 nan check
Date: Fri, 10 Jul 2020 18:49:15 +0800
Message-Id: <20200710104920.13550-62-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:59:04 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:54:43 -0000

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


