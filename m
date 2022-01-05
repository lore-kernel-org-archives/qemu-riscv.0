Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4wYu-0007vW-ED
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 22:02:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wYp-0007pF-4E; Tue, 04 Jan 2022 22:02:02 -0500
Received: from [2607:f8b0:4864:20::42c] (port=45629
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wYl-0007RF-Jt; Tue, 04 Jan 2022 22:01:58 -0500
Received: by mail-pf1-x42c.google.com with SMTP id u20so33906632pfi.12;
 Tue, 04 Jan 2022 19:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5bL+vAVfqamThQbeWL59vSKO++Z8CFNPuWObUfqmti4=;
 b=Qf6MWi6zCBhvZotZHxY2ZiZUa87X4lpf0ohnyoOmgZeYlOC5UXOsVxq7Nf4S1AZax9
 xNSUhIDnd+dBczTL0y7u4iXvVz96u7z/eCKl40K0vd+eSuV37TfcxzjGLBABLTV3R5Tt
 ppjxHLRHriRwqVFsRjF9smc980SDf1+uM8lilTNy5Ug6Nm4kb+sFFQpC2T1xBW/BpbiW
 ZzDngrTvV7ACyKWJ0LpNFkUrYsnyDHptU6P9kr5DMOiQz3xH4bP9DAGtUKrcAhsSQ8Ok
 UE28hwNHfaCNeB4xSdf5sgU0S7gZNXyley8NkmXmIl1eja7v7yDzKGFQGeiBBCx/WmyF
 WcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5bL+vAVfqamThQbeWL59vSKO++Z8CFNPuWObUfqmti4=;
 b=rV5iyoXBH+3y17N7cOmN9oCuwlGT067OxdnfgIZqxt9TX67rA6L5wLc6nbBKEOjcw+
 e+/KbLsFUdLg/VPuj02MOYK9cKXRkEPeq+kKqZWatkhkMP6kbc8TLVgiFgghiwcgXjIo
 aukTV+FRHwjE3EXsTEtGjpSPFaCP8GuGsZYEpHp6jzVcmlftKU8LT/8wv29h4ZN0TJEe
 97CM+FVuc5ZWzovssUG1uzxhUqCfk1Nqn0xJRWDIAJSSNvg2OShVkuTWQNSwyOMqZo3s
 hiJW0PVLTR11n2zQnMf2DILm5oawp0uAEjZU9XvR2n8FBHvPzPqCmbP9hh8PwZXDtz/C
 oBQw==
X-Gm-Message-State: AOAM533vYvNR+8yDNsi5HkZ/IDxEcUj7LT03axd2p8/vg+Yo5fyiKrzV
 Ddd+eurVYloT+QfH7bXHqJ8=
X-Google-Smtp-Source: ABdhPJxJyhot7qV/EDoSfvQtyfryk7aeT41e0hYX8WfCbR+B0kzkmVymBJlNH86tMr+6HvFV15bnLQ==
X-Received: by 2002:aa7:91c3:0:b0:4b0:eebe:49c0 with SMTP id
 z3-20020aa791c3000000b004b0eebe49c0mr53931672pfa.6.1641351713126; 
 Tue, 04 Jan 2022 19:01:53 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id nu14sm23011pjb.17.2022.01.04.19.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 19:01:52 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 7/7] hw/core: tcg-cpu-ops.h: Update comments of
 debug_check_watchpoint()
Date: Wed,  5 Jan 2022 11:01:26 +0800
Message-Id: <20220105030126.778503-8-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220105030126.778503-1-bin.meng@windriver.com>
References: <20220105030126.778503-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42c.google.com
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
X-List-Received-Date: Wed, 05 Jan 2022 03:02:03 -0000

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


