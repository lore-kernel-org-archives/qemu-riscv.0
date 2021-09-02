Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLoTQ-0003q3-EU
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 11:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTC-0003lL-5t; Thu, 02 Sep 2021 11:17:40 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTA-0001un-KW; Thu, 02 Sep 2021 11:17:37 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso1723300wms.3; 
 Thu, 02 Sep 2021 08:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CsKFO6zpXeyiIJnaYsonUL0fU8Qtt9qHYNbRlJRsUy0=;
 b=msgoovyFZuYTFvHAVUWUcCjWeKOKX4/fQ6x5iV8uVuCuT5rENjJGT7Fi8gKdKImTio
 DTpGFYCfw4rll3/rw28+7h/IaCPuko7zVIUcFE0tQsdNOZfJ2wQjzKdS4Xfx4UTWbO+7
 DGFf/PpopUkXuymVg6YWsO6N3YLJF8uh4vvV+trJgaEzbQGXX/gyiLlggAPNmBngw2tl
 YLsB/DFcIgycuwYBpuMl9JRZ+k8EZ/6TW42fGwY+XJMvHn4lwe3XKDAaHmIJVqNMN/Bp
 gAtfXhq/PaIsaRo4z+o2UGnxJeRORTSUr5BKUhFZufBsIeEFGjPyToZ1JIVE+fuT37wj
 LDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CsKFO6zpXeyiIJnaYsonUL0fU8Qtt9qHYNbRlJRsUy0=;
 b=AbumzIhjwNmSdAulMKZQB/HEwAfJnoFQZoNGb6J7j4TYxbmExGPeo7PSLGOcE14+Hz
 nopMgsi4eMMeUDCr+VGVabR1yyLfOQTJc0EeJD4yv8JVkeaFQJ2sUd8i4tbmazbkBMjZ
 AqUkQ43abcwAYUiek3KO/3TKDzBtPKYiYWV50Ed4fPt5EaU1tuvSRCRG1qO2WlLoIP9Z
 8dEmb1HxC68ymI03H5HznmCTSEimarSXf+AcbjAJYy/hMSLdpAzOmZxv6jXDHfNocoEu
 AtieYpzKV6IPuhepqDOKWOmf00gS1XGcdkVcocZ9TkYc7H3hEcuN2MK20tWMzjgsb8TW
 PUPw==
X-Gm-Message-State: AOAM531hnJesAJ+pguc5ZKNHlMTNXe/HSGXtw7/folrLpcYxGpRaj7Vr
 jBTBTbodcrNN7cx5RbWGSlrh5MJ2644=
X-Google-Smtp-Source: ABdhPJzg8hVRFyP0FkM7hBwLY6gryRcnsYlqDYRSHpQuo4OZJkYpIQrU140K4ZRlnTTpvOqGl5YOrg==
X-Received: by 2002:a1c:f709:: with SMTP id v9mr3768889wmh.124.1630595854067; 
 Thu, 02 Sep 2021 08:17:34 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 y23sm2023304wmq.30.2021.09.02.08.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:17:33 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Warner Losh <imp@bsdimp.com>, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Chris Wulff <crwulff@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>,
 Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <ehabkost@redhat.com>, Marek Vasut <marex@denx.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Greg Kurz <groug@kaod.org>, qemu-riscv@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 03/24] target/i386: Simplify TARGET_X86_64 #ifdef'ry
Date: Thu,  2 Sep 2021 17:16:54 +0200
Message-Id: <20210902151715.383678-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 02 Sep 2021 15:17:51 -0000

Merge two TARGET_X86_64 consecutive blocks.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/tcg/seg_helper.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 3ed20ca31d7..dee7bef68c6 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -929,9 +929,7 @@ static void do_interrupt64(CPUX86State *env, int intno, int is_int,
                    e2);
     env->eip = offset;
 }
-#endif
 
-#ifdef TARGET_X86_64
 void helper_sysret(CPUX86State *env, int dflag)
 {
     int cpl, selector;
@@ -984,7 +982,7 @@ void helper_sysret(CPUX86State *env, int dflag)
                                DESC_W_MASK | DESC_A_MASK);
     }
 }
-#endif
+#endif /* TARGET_X86_64 */
 
 /* real mode interrupt */
 static void do_interrupt_real(CPUX86State *env, int intno, int is_int,
-- 
2.31.1


