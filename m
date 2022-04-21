Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhKlh-0005Bo-95
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 20:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhKlc-00057u-QO; Wed, 20 Apr 2022 20:33:52 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhKla-0008Nx-PG; Wed, 20 Apr 2022 20:33:51 -0400
Received: by mail-pg1-x52c.google.com with SMTP id t13so3241143pgn.8;
 Wed, 20 Apr 2022 17:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k03hqsrN3r2DAcpcEZo3Qmaha1XCoOaXcqqhAGM9cU0=;
 b=qfbK/YVww+veIVQb6g8pekVxYFSInAitfMQ4btBr/DIapSEsPv4Wl5lSkm8CS40FzB
 sAGveyrnbk2jWSzqnl/T8TZg2TRk7Ss6RvsbDSavJiCGQr0QHw9EIzZwYtVnA3ARJpzQ
 mvK7K4WUAxavYPtAPRS7qUo6ra9SaNr+jpH1TaciWCcD6oqANO5yXWqyz0Ux/WdtgM88
 +jYvDfawcSBagHgMQuQ+nLojom37vFA/0aTLwhbs1+dLymohS4I1iUNLSVYrmQGI5V/S
 JshHhNCPKZ6ezGijiRxZuqY9fwcWBt5w0uJO+DpTEBXHrtF/6bKSQbaC59juZ/u57XRc
 Ui4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k03hqsrN3r2DAcpcEZo3Qmaha1XCoOaXcqqhAGM9cU0=;
 b=rF59MYUG+f9PNgmFH9o9fRZLpfKlIrOH0oHtjpJQik511mC7171InjgNybDIoAjRVs
 M8R4UvJG2TXtfXW3Pkb8WmgAjSD0JtM9ZhZHBbLJciNiqQm3xz19LWYSsD3akuHG3KMP
 XiQSLZHF3dHZIZhTdv7L3SwSsI6WT9x+GDziZ+eJCiNiVgGf8Dd9NKDNvFuKp+7erKFg
 e6yHmtKgSg1T49DcAE8B2Y2EEeZQdRy0jnkHpMKcVo433QbM48OdnP39Ko7+WxyrQVNF
 yDHdzO5dm2z2H/e+qdtuQvEGtlzRhAu8rr2x3QJQPXJjjpjC63Uq54Tr/ZSS7XmDgZ0l
 1IIQ==
X-Gm-Message-State: AOAM532X0kgd0la4raGEE4Xu4IP5e3XKhsgn+LIvDyIYHT0qC3JtBXif
 NQ4qOky7G+EtRYRPuEF2wxg=
X-Google-Smtp-Source: ABdhPJwEa7XXGI53bvyBP1KcxJGov+qyqcF6RQC42+4rrltmlHDs3PzHF6/7PKt1qBS5+JoSslkAPQ==
X-Received: by 2002:a05:6a00:1505:b0:50a:641f:c688 with SMTP id
 q5-20020a056a00150500b0050a641fc688mr21898157pfu.86.1650501228922; 
 Wed, 20 Apr 2022 17:33:48 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 z6-20020a056a00240600b004e17ab23340sm22981969pfh.177.2022.04.20.17.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 17:33:48 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 6/6] hw/core: tcg-cpu-ops.h: Update comments of
 debug_check_watchpoint()
Date: Thu, 21 Apr 2022 08:33:24 +0800
Message-Id: <20220421003324.1134983-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421003324.1134983-1-bmeng.cn@gmail.com>
References: <20220421003324.1134983-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 21 Apr 2022 00:33:53 -0000

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


