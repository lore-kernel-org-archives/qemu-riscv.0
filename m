Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6IgI-0003qL-SP
	for mharc-qemu-riscv@gnu.org; Fri, 16 Dec 2022 16:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Ig9-0003iq-1o
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 16:55:41 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Ig6-0003Aa-FC
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 16:55:40 -0500
Received: by mail-ed1-x532.google.com with SMTP id i9so5487167edj.4
 for <qemu-riscv@nongnu.org>; Fri, 16 Dec 2022 13:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nvZo37ZGtVvWlqFUnT7DRRxDMf6Z0v34B1J4o3P2gxo=;
 b=QS0A4bcmsLrLzAvLNYrOY5w8cZdoY1wwxif6xMojgWQOAiFtUT0tyaroPGfboOpQ2M
 9tTkUTUiUIvNuaxXdEl79rqJPjrVybuh5vKsJrfjDWzWk/3saSRlFFqHnJp4MAJrOX8y
 /ORKMsnJ9Xbrv0tjAgP7a65XJR0xgndOa8Hc12o+v4ZHAsJNmSGQKK7pMY9zrikKGhy5
 gMx3W4y4qmn8yUBQJfvGteoFvNMU+DJXU2QDEOefmTnGQfb+v6778f+oNfaGDVbVBkAu
 zRV6hWtnAaMFaCOXfSpnNctLyz2SDDScekUo/i5qbeEyy7GQ0s4N1/3cDFH5OVYtr3FL
 y2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nvZo37ZGtVvWlqFUnT7DRRxDMf6Z0v34B1J4o3P2gxo=;
 b=q0LMVBmoPeQxFchtnMbqw19lZYDl8L/z0WkgZjEnv9Fi0JnlkXgDfjpL92Dchk5/qT
 TzGcFF8ZUpjgIUoeDNwBDj5EEGKZF7OQ/eLfSSjmMd2yic30+Po3EYHFdHEdEpkpm6Au
 G19DCb4Sm6W/oFyt8lAErx8E0ZMytLoL00y18TQF6AFTKGjbkPw3/m1QVMVV8ZwdnmKD
 lnnn6TPc9wc5BJSPPHIP/kgycFiRC66QAzYpaYHnHg6nuvtZ1nVuyihEPi1K8cYqYZMC
 k672fCHVVRoVh9Ly+twBPabb/YWyWw+rrXBNuVuJDaAKIHyqSZcSeAOMLW0Gw4wMQwjS
 UvDg==
X-Gm-Message-State: ANoB5pnLW/8985/cLgG9e8LPsSAXpnD85o6CbQmLa94MHMMv+FECdaB7
 oBWUW5hcR9FYibY/BdA/Qx5geg==
X-Google-Smtp-Source: AA0mqf5kfpZN4t4L2lET0LgUlbZyIuAzHNhhqhUt6pU5qluuvLw/vvtion/rV3n/7E9moXZb6GvBmA==
X-Received: by 2002:a05:6402:2989:b0:467:4df0:7185 with SMTP id
 eq9-20020a056402298900b004674df07185mr27588064edb.4.1671227736819; 
 Fri, 16 Dec 2022 13:55:36 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 cq21-20020a056402221500b004678b543163sm1338647edb.0.2022.12.16.13.55.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 13:55:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Marek Vasut <marex@denx.de>,
 Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <eduardo@habkost.net>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Stafford Horne <shorne@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>
Subject: [PATCH v3 2/5] cputlb: Restrict SavedIOTLB to system emulation
Date: Fri, 16 Dec 2022 22:55:16 +0100
Message-Id: <20221216215519.5522-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216215519.5522-1-philmd@linaro.org>
References: <20221216215519.5522-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Fri, 16 Dec 2022 21:55:42 -0000

Commit 2f3a57ee47 ("cputlb: ensure we save the IOTLB data in
case of reset") added the SavedIOTLB structure -- which is
system emulation specific -- in the generic CPUState structure.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8830546121..bc3229ae13 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -222,7 +222,7 @@ struct CPUWatchpoint {
     QTAILQ_ENTRY(CPUWatchpoint) entry;
 };
 
-#ifdef CONFIG_PLUGIN
+#if defined(CONFIG_PLUGIN) && !defined(CONFIG_USER_ONLY)
 /*
  * For plugins we sometime need to save the resolved iotlb data before
  * the memory regions get moved around  by io_writex.
@@ -406,9 +406,11 @@ struct CPUState {
 
 #ifdef CONFIG_PLUGIN
     GArray *plugin_mem_cbs;
+#if !defined(CONFIG_USER_ONLY)
     /* saved iotlb data from io_writex */
     SavedIOTLB saved_iotlb;
-#endif
+#endif /* !CONFIG_USER_ONLY */
+#endif /* CONFIG_PLUGIN */
 
     /* TODO Move common fields from CPUArchState here. */
     int cpu_index;
-- 
2.38.1


