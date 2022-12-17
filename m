Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6b1l-0003KF-P6
	for mharc-qemu-riscv@gnu.org; Sat, 17 Dec 2022 12:31:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b18-00030A-KE
 for qemu-riscv@nongnu.org; Sat, 17 Dec 2022 12:30:50 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b17-0002dz-3F
 for qemu-riscv@nongnu.org; Sat, 17 Dec 2022 12:30:34 -0500
Received: by mail-ed1-x52f.google.com with SMTP id m19so7664450edj.8
 for <qemu-riscv@nongnu.org>; Sat, 17 Dec 2022 09:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wk4kZcMMisFWgQ9gHzikpbBAxoBtm1ZzojbUpYahP3s=;
 b=FImUCwLooRkHMftIyWdZtUzg3r8gzuJWqATacIo/a2IHDL0VlPpzbNKh0Kqs9s//2A
 fiP77CgQeRNYTkHkiuW3xwUS+sUpvFx+7mh85VdTesGbMR4QkiZFv46f8Ks5zk4Q5F4d
 QPybhshBSKIJ+vFo3Nj3N1cRIfpicTXB0/4OTp+RomhSGV6mF2ixV80MOvF+IKEN/G+6
 4zGKPlBttrdio1Bc1yZoKEOoGwEuLXQ8updTxegKSJbLXP9tD4ULjvDEB1DwTysTttU2
 X5mJmPFqdxLwZE/XR0BdiSNAH6iH/Nk6gk/XXyCnRlUnFOnuffr0OhX8KGJpdb/sp1un
 wgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wk4kZcMMisFWgQ9gHzikpbBAxoBtm1ZzojbUpYahP3s=;
 b=3CbALeeHRPoySVVxyHhsoL+fcRFTg+NlSkXX0yARyiEbF+j+CY/jJJytdUONI6puIY
 idzQ77+OIceAElG7800rRR64LwcKOuHNp/Xt128vtoETrR/2+dmZ757+qg0Pjku2O7Je
 82zVfU5BfKwy4VWw9V370IQ23ORonAtu38wxR2PeU2bwABliNu4fwlD2xp1FR2E2+UGj
 eHIbAlVA6Nkdsf2ZYSwxrnCqh3JBa/jg/IQgcW1348hjyfZSGF9Day2Pw32aN7ZGhHlO
 b7uQoihgx3+G/KT6CLNVSvS4zlD7YJgsJl46YkYp4AJZobfRn63T6iJIn/ZhIlEiNO1F
 0pNw==
X-Gm-Message-State: ANoB5plH/1StReKdmf3rL7Vyhw0ilWGEooys4l9QtUc9/bMjGaOKZa+z
 YqkGFIedXIS6t9lebZ4vUsiemA==
X-Google-Smtp-Source: AA0mqf45QvH8X+0lM3DBpfMGzi/ctagLAILTTUMSvXtML7RQSQ2VFLjDj82fDwwY5MebVnBd+5tA5g==
X-Received: by 2002:a05:6402:548c:b0:461:6f87:20be with SMTP id
 fg12-20020a056402548c00b004616f8720bemr27829816edb.41.1671298232467; 
 Sat, 17 Dec 2022 09:30:32 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z7-20020aa7d407000000b0046b531fcf9fsm2196443edq.59.2022.12.17.09.30.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 17 Dec 2022 09:30:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-riscv@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 8/9] target/sparc/sysemu: Remove pointless CONFIG_USER_ONLY
 guard
Date: Sat, 17 Dec 2022 18:29:06 +0100
Message-Id: <20221217172907.8364-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217172907.8364-1-philmd@linaro.org>
References: <20221217172907.8364-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 17 Dec 2022 17:30:57 -0000

Commit caac44a52a ("target/sparc: Make sparc_cpu_tlb_fill sysemu
only") restricted mmu_helper.c to system emulation. Checking
whether CONFIG_USER_ONLY is defined is now pointless.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sparc/mmu_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 919448a494..a7e51e4b7d 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -924,7 +924,6 @@ hwaddr sparc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     return phys_addr;
 }
 
-#ifndef CONFIG_USER_ONLY
 G_NORETURN void sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                               MMUAccessType access_type,
                                               int mmu_idx,
@@ -942,4 +941,3 @@ G_NORETURN void sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 
     cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
 }
-#endif /* !CONFIG_USER_ONLY */
-- 
2.38.1


