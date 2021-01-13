Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzjtW-0008TT-5x
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 12:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzjtT-0008OH-Tn; Wed, 13 Jan 2021 12:25:15 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzjtS-000615-EV; Wed, 13 Jan 2021 12:25:15 -0500
Received: by mail-wm1-x333.google.com with SMTP id r4so2322142wmh.5;
 Wed, 13 Jan 2021 09:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=usrEFBYIAmEVHDsTWIk9Dyh2ylL3MFnazze4ohg6L4U=;
 b=n+uHkJVJ6i1JqI7gFzbPdWDu+Gn1CcBZWSKXZ5DOTJ1tjmIRSKgzh0QpZSY52pIMoS
 ya6tE0zpVGf9pYrBpM0V0gdY1hX3kdEEoswJi+UruZDj3KiM8COI3b2Cm+30zvTR1BjZ
 FdxVsiNedQOcHVP9Ar4qTOB3aEe7Ir+xc6wBRyu/nMFcVdqgDfTE03lT5MUILJXR20Nk
 EUnQu7A68Ae4Nb5iP2ZsRqhG8xh78+LEyCFLZF3j4qCJh56hI3SGnzKtTctLMDtVECfi
 1AnBloHq2TlxGjNp3TKAZZUUOGp22B/CKFTdpb40d8wMSeXWG9N+qMQ/h+/6zl4OMqI0
 oVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=usrEFBYIAmEVHDsTWIk9Dyh2ylL3MFnazze4ohg6L4U=;
 b=MW8YCBMiXivJMZAo6BzYrDd1hVPVbdZ9N5zYW8tg+k8WGXZqbpgchF47K5bGVdR+U4
 izVsVyPL+FIWWITLeYWb/Uw8X48h92Cc6GfxOZE0VBn+5U7vO0scQH4w9P3GmNrKiUvh
 T9lf0Ea/ip3D45kgY811D/SY8R9bGC+mIylPtjaUs8GOlR2nuiK2D0wF9JnOzn+tTVY1
 na3XcP0JgHWYYngWvPujFhAgF6wlaRdzY2tXccfOAOUEJJKdZZpMRIbdqMIs7pbSVXBC
 Wmqw07asWKwKAV3YokzKsGas8Dk9wKShX8wmhedlb+VPdDJ9K8QjpwT9UTbtnK4LxoEo
 bE8g==
X-Gm-Message-State: AOAM533GpR6Xb6i9APVnu7+p+/vkPMfcUjHA7EQ2KYJmTwyxtI51iAPc
 FKNyDPVc70IexY25dQ2cFycX4a/xypc=
X-Google-Smtp-Source: ABdhPJyPlpkTHbnTw9WKTtial8bvcn3XXZzC0q06/RaW2FvQp3GMJGSSJImDnrHGCye7YlLnLFJjUw==
X-Received: by 2002:a1c:98c7:: with SMTP id a190mr281162wme.184.1610558711983; 
 Wed, 13 Jan 2021 09:25:11 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id o23sm4912400wro.57.2021.01.13.09.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 09:25:11 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, Cornelia Huck <cohuck@redhat.com>,
 qemu-arm@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 Stefan Weil <sw@weilnetz.de>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 2/6] tcg/arm: Replace goto statement by fall through comment
Date: Wed, 13 Jan 2021 18:24:55 +0100
Message-Id: <20210113172459.2481060-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113172459.2481060-1-f4bug@amsat.org>
References: <20210113172459.2481060-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
X-List-Received-Date: Wed, 13 Jan 2021 17:25:16 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/arm/tcg-target.c.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 59bd196994f..0ffb2b13d14 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1947,10 +1947,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ctz_i32:
         tcg_out_dat_reg(s, COND_AL, INSN_RBIT, TCG_REG_TMP, 0, a1, 0);
         a1 = TCG_REG_TMP;
-        goto do_clz;
-
+        /* Fall through.  */
     case INDEX_op_clz_i32:
-    do_clz:
         c = c2;
         if (c && a2 == 32) {
             tcg_out_dat_reg(s, COND_AL, INSN_CLZ, a0, 0, a1, 0);
-- 
2.26.2


