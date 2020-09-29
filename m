Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKwS-0002TD-Qi
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKwP-0002Nz-BB
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:05:34 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:51264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKwK-0001hX-Q8
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:05:32 -0400
Received: by mail-pj1-x1032.google.com with SMTP id l18so42485pjz.1
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eJkF95S++8ts21B9MX1R8zk9iQWf6ozpEqOweVzBcy8=;
 b=dqz1SJfadJs6YftjEXdB65L05AUPjCGwogY59sLYsTC1NJnumydIAc5u7faiBP5k+B
 As+Dn23w96+9hxhLfprHwV/ffvrKRoPKbwuk0of/HDdrVzJS7LCfdVJpt4h77AhpPE39
 0mpgCb4PL46YPMNwvqoes1KRSLIJ0dcaPW7zYW4/KeaMkrrulCf48aVSWNIpgsa6No8i
 cpmYLTNye6zXNiTe50MSU9Ww80AAkaa2xGlJZpA49c8O6r7KHyn2gJQoZgFokAnbjENw
 icaIPOMHyiE9zUqmsgT6rMca9rWPibECyPvYjOrHKOy0n2mVU7LVC9MJX5h1xHJJev6l
 Au+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=eJkF95S++8ts21B9MX1R8zk9iQWf6ozpEqOweVzBcy8=;
 b=bcA2jyLGItEtyL3+kK81byCi/9YSAv2avZpcMnzSBy4u/OznzY++AHv5hG1NxGNO5H
 PFFUCO22dWJ1WXfiLgfJOh8icJ7FlFuDxwyg1S7lDRbrXHVY8dFiHLI0QgSEB57oLxWq
 1RtxbEZIo9t2O9fx2eFqDU53dNGYowxrJMUNz9UOgvOhBQgL8E/TTAZepqazvlI2ctcZ
 0OGSB4LSede/DzkzC68ns8qOK5ajU21kxpyN6ay+4n8Nyfgh+BZdqT399PhsE4NhKZXc
 76m0Tpwamkpl74/apjGIPvLpcYTL4GYq918o1Gbbp6PXgIw6whBfY3xfnbbhNaBlmfDM
 6AkQ==
X-Gm-Message-State: AOAM531LGiJ0m+q2kPtK8tm6Hz4H+xKoXPJQfk7jnrAySj7oFNrTaOzV
 OqoSlXEEug0asA4CNThKfHT3ug==
X-Google-Smtp-Source: ABdhPJyxgSZ5EBFFM6e/fXQwCGdglWu5N/HIJWrKRxEEYZUNTr1lFZUGbArHJYe/fsSKFwazPlskzw==
X-Received: by 2002:a17:90a:9708:: with SMTP id
 x8mr5305276pjo.213.1601406325008; 
 Tue, 29 Sep 2020 12:05:25 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:05:24 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v5 04/68] target/riscv: rvv-1.0: add sstatus VS field
Date: Wed, 30 Sep 2020 03:03:39 +0800
Message-Id: <20200929190448.31116-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 29 Sep 2020 19:05:34 -0000

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index a65d3ab2b3..d77f790dec 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -425,6 +425,7 @@
 #define SSTATUS_UPIE        0x00000010
 #define SSTATUS_SPIE        0x00000020
 #define SSTATUS_SPP         0x00000100
+#define SSTATUS_VS          0x00000600
 #define SSTATUS_FS          0x00006000
 #define SSTATUS_XS          0x00018000
 #define SSTATUS_PUM         0x00040000 /* until: priv-1.9.1 */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ca04b44aea..05aca3243b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -423,7 +423,7 @@ static const target_ulong delegable_excps =
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


