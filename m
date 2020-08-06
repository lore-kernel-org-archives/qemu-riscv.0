Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dQr-0000qT-86
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dQp-0000nm-Qr
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:47:31 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:45777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dQo-0007gq-9j
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:47:31 -0400
Received: by mail-pf1-x435.google.com with SMTP id f193so14310342pfa.12
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JhhKAsR91SYfmxUttL/rCv3V8bKpI/rdJvfDRiicAew=;
 b=F9MMox5BjdqLkXHhf6LblJ+dQWaKwh9hyv1K9sENj7GuOEZfngB7wHtCKeVMGxNuxi
 0OpjKIy4CvhziiUYr4yXRS4kr/F0goOXpQlVA84NxC1okaUDC0RpqKTAHiSwCIH9yRMY
 BVa++V2DQ8BjX2D3ZFSiqTFZaEC6olNb/HCCl/krOd1wr0cba4LC/T//THuR8KAqBzHk
 PFHit3tfgM9iHAtV86WVhWk/DY35A4V2686oW/sfdiIJbZzAwIjmENqpXX90qYjDL+8B
 UJXmgPA6wbPNcKAEmwCTh/REITYOiHggbI7o2zAnl1LiZe1YDTj3BeA6NxkyR49H+iES
 n4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JhhKAsR91SYfmxUttL/rCv3V8bKpI/rdJvfDRiicAew=;
 b=sMWHQjFNPAsXgdatIjlNiimf+zx2bBzWIQWBp+AUC/f7QhCkYwXU045YXzdjr4zqAe
 +0hJb+cdzexGC6FSdYWBIJxa28aRhx/Xo1lohXaA7FCKcnkVQmnvzCm+FRKd3pr8MjLb
 cGPMQnmV9Yj2XQsQViaI69TJbGrLCpoetESjcT2a6J3rhaX9eQmbjZANGmxbbJXuVEEb
 A6WxNRrK8ygyCCtqb2aZBoixsce/48a96uVg0bGwazM5gfLZw2EsfSMCPdfXrtfysdIB
 Sng+Vf6OsLe142QSB7MjXkyrh1q6Rfe9J85iJqqQvDnHRF06rjIGCDz3OojY1BpqCcG9
 OPfw==
X-Gm-Message-State: AOAM533OhkO76fPwY5+fH4gDoLihRjqiuCwudsn1/GQrZoIt014MKqOH
 R9nbbD9jzWBoX7YyKNrqXhw0iQ==
X-Google-Smtp-Source: ABdhPJwtW8vbQ8rGZJt/CxrFGqK0AicXcYprsdy7n4uUw/71EmyxSwZcYrIqA2i7/wQsNQxxDum0DA==
X-Received: by 2002:a65:43c9:: with SMTP id n9mr6575182pgp.452.1596710847850; 
 Thu, 06 Aug 2020 03:47:27 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:47:27 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 04/71] target/riscv: rvv-1.0: add sstatus VS field
Date: Thu,  6 Aug 2020 18:46:01 +0800
Message-Id: <20200806104709.13235-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x435.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:47:32 -0000

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index a8b31208833..5b0be0bb888 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -422,6 +422,7 @@
 #define SSTATUS_UPIE        0x00000010
 #define SSTATUS_SPIE        0x00000020
 #define SSTATUS_SPP         0x00000100
+#define SSTATUS_VS          0x00000600
 #define SSTATUS_FS          0x00006000
 #define SSTATUS_XS          0x00018000
 #define SSTATUS_PUM         0x00040000 /* until: priv-1.9.1 */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b0413f52d77..46c35266cb5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -365,7 +365,7 @@ static const target_ulong delegable_excps =
     (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT));
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
-    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
+    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD | SSTATUS_VS;
 static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
 static const target_ulong vsip_writable_mask = MIP_VSSIP;
-- 
2.17.1


