Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dQk-0000bz-ES
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dQj-0000Yp-34
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:47:25 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:45476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dQh-0007fx-BW
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:47:24 -0400
Received: by mail-pl1-x643.google.com with SMTP id bh1so14209374plb.12
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=drhHEFRj8g8xHCSfNMMcorRHdIOXXyDjguE7cUlbARg=;
 b=HTsbhsNiWdRH7+GXR2q2E4suNGcQodAoazQTqbM30FKCskNYfBgF9ACq6siXvBsa0K
 0r91KxcOombT4AdvC9PbGdSYIYooNOaeSyJ0T5zKq5G9CP7UAfu0b4gm1WTSuiUFBuEY
 vazvdJpJ27XoPfViCpyFpNrjzhQCzMuZrGTYxF56RLOrSXDGVcnUVWVz7/pOOwVjhvgL
 PE3/JPcp+H0Pb1MLQa67LuL23p5qX/jlFSQMD0rXzKzHo6C9SaauemEqH7VRqDtOFDQa
 sASqdxmo2pE0aUHpDdSjVCzod4XgaHRzuwsldifKv8W8JUd+mGN9oIE1IdLImYlGLm4E
 hvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=drhHEFRj8g8xHCSfNMMcorRHdIOXXyDjguE7cUlbARg=;
 b=dQzWEF3bhRXZm5ywklO2a4JuJrlgQBJvLrJUNWB1QdU/3oym41u00leFWbpClfzTfD
 hP8cL3du8S9AYnUeLOQS4njRNHYS04QRg9hpB4KohTopJlO4JluA9p69aZJhho9wSYLK
 a9k0HaquOtncL/uTAQ0LSvquTUiBboFjDfZHDVaZZbFOMYe5Oedh5jzWWTesa/IV5w9z
 6tfj8Bzgxy0wVMNy31f6TvfV5limXGYj4Mv5Qyg8o5t1ttsgx8YuddOCsN5Ekte6WzWg
 UZKXhDLGaeM8jL9aeiNOnOHgxb0DOS3ylUO/EE9ntzJa9BObUKmRRYumiT2+QtEGuvuj
 z38w==
X-Gm-Message-State: AOAM530jHqo1GkLDzzWDJLaEC7R4jHPXyYhRDUkP3UhuCF90iffcw+dV
 46xUWjtNYrrUjDXR64Q3QIRWAg==
X-Google-Smtp-Source: ABdhPJxMRJClA+Ba/98FqwTLmdOvZLuSoTg+TwzTooHznYT7iL6nOt2yRr5TlNVSbNnC/82pBF2fzw==
X-Received: by 2002:a17:90a:6285:: with SMTP id
 d5mr7885742pjj.85.1596710841785; 
 Thu, 06 Aug 2020 03:47:21 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:47:21 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 02/71] target/riscv: Use FIELD_EX32() to extract wd field
Date: Thu,  6 Aug 2020 18:45:59 +0800
Message-Id: <20200806104709.13235-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 06 Aug 2020 10:47:25 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 793af990673..43ba272c09b 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -98,7 +98,7 @@ static inline uint32_t vext_lmul(uint32_t desc)
 
 static uint32_t vext_wd(uint32_t desc)
 {
-    return (simd_data(desc) >> 11) & 0x1;
+    return FIELD_EX32(simd_data(desc), VDATA, WD);
 }
 
 /*
-- 
2.17.1


