Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSOsJ-00022d-A8
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 15:59:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSOsH-00021r-Ow
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 15:59:33 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSOsF-0000PQ-1N
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 15:59:32 -0500
Received: by mail-oi1-x22a.google.com with SMTP id be34so1002841oib.10
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 12:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=09ZQJbw5CTXBaxf3eDUNip9Hu4yCQQjmffyHijK++a4=;
 b=dT6TlTBopAV9Tk6EXpjj7juK08L6OXe3ffYzqmUc6PA+qrPeRkqGI41VmLm2SvrYHj
 dezdrTazf3Tc1ug5sWiHnw1DiTIx+hUOUFJkjvD4yOfsT2m73B7XzwpXWLmFCZGEpKl3
 AL4Zn5zwdlnOVMil/0pL8g2Y/ZP2vHV1h6LfN+bqCxvnf+AxJ8/9/syawBCeJsml8/kI
 BsgLZ8R1SIocdaIiNMm3JaKLMfIXPMLJMas8ktpTL/TbuH1QOY4R/l/yGBmVH9j2M7o4
 cCXBBhxSguqrHGhyfjlpecnk5wM6RWY1UODPM35CL4UI8vLWaAw+EQXsxFiBwZToEpP8
 CVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=09ZQJbw5CTXBaxf3eDUNip9Hu4yCQQjmffyHijK++a4=;
 b=KdG6+4dJ28HpqslKaaJZxwUfAoocMEFuPbz+ThJV+sj+cJlpHIL5LAgA9WcA/BsWe8
 DH93dhfzEv8A3PQA3T9DphS31EVP/fwj046EsEwXtuohrckMNeeo4qhPTvoxuy0OijPj
 uyobjoM+R/8Xamigp3SW5CljNMZM4TOK5hAk7AgYt/FTQaUmkQSveszwd4gVR5dNre+t
 sHpgj5kYQUGu1QW/nbM4/IGb4NVxzxzdPa9QvNG/Vi0pzRwnvgoACmy5gbhQKLhJaXst
 XFG7k3U7s0Gr3beLx+9NwqeIQQat45482WaE4ZoiL+C9pLc2lrakbOkWxLnn1w8KaNix
 H9XA==
X-Gm-Message-State: AO0yUKX9rVXz7zvdqajSH29jSYSMtZQJZAlB3MC5Et8RWNV1wzuGoEGb
 4PHemqQGMjTmCuFwZCQkhvSjOQ==
X-Google-Smtp-Source: AK7set9iEBZFfozMDSWb49zLTR1QCG9x7Qs380KB5D4xXIJ56gub+3YhAyhfBHtFvbUT4pir1k5+Bw==
X-Received: by 2002:a05:6808:3a93:b0:36d:ea30:7bdf with SMTP id
 fb19-20020a0568083a9300b0036dea307bdfmr1421570oib.49.1676494770038; 
 Wed, 15 Feb 2023 12:59:30 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 p125-20020acad883000000b003436fa2c23bsm7761563oig.7.2023.02.15.12.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 12:59:29 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 4/4] target/riscv: add Zicbop cbo.prefetch{i, r,
 m} placeholder
Date: Wed, 15 Feb 2023 17:59:11 -0300
Message-Id: <20230215205911.695745-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215205911.695745-1-dbarboza@ventanamicro.com>
References: <20230215205911.695745-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 20:59:34 -0000

From: Christoph Muellner <cmuellner@linux.com>

The cmo.prefetch instructions are nops for QEMU (no emulation of the
memory hierarchy, no illegal instructions, no permission faults, no
traps).

Add a comment noting where they would be decoded in case cbo.prefetch
instructions become relevant in the future.

Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Signed-off-by: Christoph Muellner <cmuellner@linux.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/insn32.decode | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3788f86528..1aebd37572 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -134,6 +134,7 @@ addi     ............     ..... 000 ..... 0010011 @i
 slti     ............     ..... 010 ..... 0010011 @i
 sltiu    ............     ..... 011 ..... 0010011 @i
 xori     ............     ..... 100 ..... 0010011 @i
+# cbo.prefetch_{i,r,m} instructions are ori with rd=x0 and not decoded.
 ori      ............     ..... 110 ..... 0010011 @i
 andi     ............     ..... 111 ..... 0010011 @i
 slli     00000. ......    ..... 001 ..... 0010011 @sh
-- 
2.39.1


