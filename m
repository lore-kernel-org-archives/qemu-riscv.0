Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6b0b-0002Fy-Qm
	for mharc-qemu-riscv@gnu.org; Sat, 17 Dec 2022 12:30:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b0a-0002Cb-02
 for qemu-riscv@nongnu.org; Sat, 17 Dec 2022 12:30:00 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b0Y-0002Rd-58
 for qemu-riscv@nongnu.org; Sat, 17 Dec 2022 12:29:59 -0500
Received: by mail-ej1-x633.google.com with SMTP id kw15so12883699ejc.10
 for <qemu-riscv@nongnu.org>; Sat, 17 Dec 2022 09:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Je6pglm7Ro/G6/Hw82+zaiN4Czg7YWpLl/0Q2PSll9w=;
 b=GtUaV+75kc/w2Jz9y6r/nJ0UXl5KQ9zRbxRmQxJApuJqSpXejlL04qdNyMDJZAF0Sd
 c7hb2VL3FVp+WZjsMksKpWTI8AtikUc68bY3ruW2CqV3ESSKydsEnZ2b+X2oRE/24DIz
 gGDdPT2WsiklD4zZ8h8pGe5pgiY7Z5/9RAbS4yWntEgX6RDhQ2aP3f6TqZ+rMFkqkOSF
 3ur44FGMR9tQImO0CndosOLQOONsdMZLCETwu92SLfn0xssvLS3NqWGM2nAyYzd6FMUB
 TP2YOxP3+O0lgxLz09QCXkpNxHcmbYOqYaKI08g9NOoXwW5oVWIZ1J3lkiIZ3ZtuBplq
 hAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Je6pglm7Ro/G6/Hw82+zaiN4Czg7YWpLl/0Q2PSll9w=;
 b=u5fWkBn9GdeXMLMTA/JmbK9sSZpVITVsDVMtIhGmNgx98AGvbCh6htOv7n7wn5aRyI
 t9HeD5RqVLglgw55KS3jQxp4vVHTPFyNRBZhWyZRxmWVd99jcZztwx0uLaD7ixzAUgQf
 H1o4JLeS7xmSK523RRdrrwxHRxdTsb/pNm2Svw1RDJsre1TA7l/UaV0F8suY/Um+0eSj
 RWWpFPc4AfKIcVKji71rahwyJj1SlOX4eVAEWYmFZ++O9dlBXqU+NcmT+ipfPm1LY1Qk
 c69JVtOPDa5EZOi4fEbWW9jbkfcsCFZjypGN+fswsnIcsCZeT8gHeweKJaiA9auQPhD5
 A5SQ==
X-Gm-Message-State: ANoB5plNOpMqu/Ymwnva6tMPwcpsmBSr7OLv0sc95muwnOFsi1A2aPzh
 qVyWUIMVkzivoV7HUhBqdGuREQ==
X-Google-Smtp-Source: AA0mqf72Pm4NY4wNp46CZqXV4Nvqqb64mTPo5WGko4tfGBRcVj0ixpsUx8E+tmqvXqstRrhMA/coNw==
X-Received: by 2002:a17:906:9f1e:b0:7c0:7d35:e9db with SMTP id
 fy30-20020a1709069f1e00b007c07d35e9dbmr43794106ejc.15.1671298196789; 
 Sat, 17 Dec 2022 09:29:56 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a170906a10100b007a1d4944d45sm2239662ejy.142.2022.12.17.09.29.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 17 Dec 2022 09:29:56 -0800 (PST)
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
Subject: [PATCH v2 5/9] target/ppc/kvm: Remove unused "sysbus.h" header
Date: Sat, 17 Dec 2022 18:29:03 +0100
Message-Id: <20221217172907.8364-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217172907.8364-1-philmd@linaro.org>
References: <20221217172907.8364-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 17 Dec 2022 17:30:00 -0000

Nothing requires SysBus declarations here.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/kvm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 7c25348b7b..78f6fc50cd 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -32,7 +32,6 @@
 #include "sysemu/device_tree.h"
 #include "mmu-hash64.h"
 
-#include "hw/sysbus.h"
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_cpu_core.h"
 #include "hw/hw.h"
-- 
2.38.1


