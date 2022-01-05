Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4wfs-0007aD-1Y
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 22:09:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wfp-0007Xc-Tl; Tue, 04 Jan 2022 22:09:13 -0500
Received: from [2607:f8b0:4864:20::1031] (port=37735
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wfm-0001yr-IX; Tue, 04 Jan 2022 22:09:12 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so1990196pjj.2; 
 Tue, 04 Jan 2022 19:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k03hqsrN3r2DAcpcEZo3Qmaha1XCoOaXcqqhAGM9cU0=;
 b=Tr9AjbeEaky53mDQSY0wD7+6h8s3i+xcQR7q9E3hepQL6Q7pL5tNXGKinC7KDbwgSI
 0mKdLmmkpimmq84uOQwnbgjB43s0WLB26s6jyUZT0uCW/IGhVU78BHIATYbp2wxB1EaE
 jzHrZw8nS1zxg9dIdhLXsfFwV+nYxoPEdI7EjyNwkJObS76zDvr6LtqKNBtd0Sqy/QQo
 /hgrU4L2V75iaL9ueHy35RTTZC7Yd7ql6dM+pm2G7mdd8IpFzBSyFaqn+5l1krWba1t0
 eKyeRVXGr6SrFoQ7E9XwvTyb1w825QdUpPi0ffYod94efzTxX2py4iF/ULxYJqL+LuuW
 biZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k03hqsrN3r2DAcpcEZo3Qmaha1XCoOaXcqqhAGM9cU0=;
 b=bRkcVEHlt5W+84u5a7jorcUxGmnaybNMAC0fdqHv7BP/n5tDCyE5k0aghupXFruRqN
 nncC7vMdcIDkbNlazsxloNlWlSPbZXMo8Mdlqk68rX4yTxfAS5BlK4bol5YG0DibWjjB
 J2bv4fdGvDP+ksIciiKRucAFJUg1sAiLoY5+iEFHQVtk79IMhTUT7NXXqeYgD/vrP262
 QzYpetoYO7e/O/IhA+AVDcMHcxxZ0Nu/dzdwUqEfgaFljs+vpC2d+i22V7xjoPwKYfcO
 g8pjRSf+KL4u8ZN7f4KN8j/xX8r0u0DkbOt8bkZoFBWMJmhPNVirkRqR4/WoZAy12dpI
 fqgQ==
X-Gm-Message-State: AOAM53069sYk69BbFnWevm/Q1uDB5fdZFj9pdY1N1EjHicXDuN8K7sFJ
 3pByUI5Yxuo9ISe5BTfFe70=
X-Google-Smtp-Source: ABdhPJwc3QNQFKCJX/Ztbmrulq67knl8h6bBIESHheRutsnwxXXBDjCGXdwjBU7Le1ciJjIvjVKxvg==
X-Received: by 2002:a17:90b:4017:: with SMTP id
 ie23mr1702040pjb.109.1641352149224; 
 Tue, 04 Jan 2022 19:09:09 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id t191sm36206889pgd.3.2022.01.04.19.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 19:09:08 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [RESEND PATCH v3 7/7] hw/core: tcg-cpu-ops.h: Update comments of
 debug_check_watchpoint()
Date: Wed,  5 Jan 2022 11:08:44 +0800
Message-Id: <20220105030844.780642-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220105030844.780642-1-bmeng.cn@gmail.com>
References: <20220105030844.780642-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 05 Jan 2022 03:09:14 -0000

From: Bin Meng <bin.meng@windriver.com>

This is now used by RISC-V as well. Update the comments.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 include/hw/core/tcg-cpu-ops.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index e13898553a..f98671ff32 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -90,6 +90,7 @@ struct TCGCPUOps {
     /**
      * @debug_check_watchpoint: return true if the architectural
      * watchpoint whose address has matched should really fire, used by ARM
+     * and RISC-V
      */
     bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
 
-- 
2.25.1


