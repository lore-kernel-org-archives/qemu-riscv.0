Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lKeuc-0000V8-N3
	for mharc-qemu-riscv@gnu.org; Fri, 12 Mar 2021 05:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKeua-0000NF-8r
 for qemu-riscv@nongnu.org; Fri, 12 Mar 2021 05:20:52 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:36941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKeuR-0005Hj-V7
 for qemu-riscv@nongnu.org; Fri, 12 Mar 2021 05:20:51 -0500
Received: by mail-ej1-x62d.google.com with SMTP id bm21so52318056ejb.4
 for <qemu-riscv@nongnu.org>; Fri, 12 Mar 2021 02:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VFsaVWTC97aLR//LGQcQaZjZ1M1CfqA4RZVl1EZCMSk=;
 b=AED4BGQeXcQJTIpKYLHzdqiY9MkCONC/WW97F5pi9+KSmCESx6DbrPepzxNKSjAQxz
 1D84rguFVvhzuOxs+uo8cYf5QP2+qZuaBBZd8Y5x0vNN3Z09hMn7MftkMIYLL9+tmCvw
 asS5kXhb9zcfQ2PmKbGkzTg70J4UAT0bBYqrGu0shBMWin74ZOXFCedo+4R+6HJfQeMv
 4ArcASEdJ6XhQiZfk0McK882iywLcq4jSWIYbcY2eHDR1SXWpWR5W44jWsu8r73zE3vC
 ByBj8FFOZ8SmgecQac6+651h1xOAe9Y9tWMPTAku0/QIjSD74Wlo3zXyI6kWbYJylbvf
 k7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VFsaVWTC97aLR//LGQcQaZjZ1M1CfqA4RZVl1EZCMSk=;
 b=Fn1bU2NKZlN/2pIVid+hJab/pKXjg2RABxeaT+SOvZJK50f7c/of7AAmHyvP8nwQhT
 jHrQGCk3bB2DG8/kYf6sMrxtJdUKA89h411r2lXh4D6PW95+wp62TpAmWm4mxV8+MIof
 gHjMN8Yq+ANxuRz1E5CG7UJGUk40JMsKiNQYlEchsuzes+RlU07fzOOT1+goSPiq5sV5
 tUEdKaupLWTpXuUiXSgF0YW92BV4z3eNmxVBKbjddfAewTZaqdJq4TotP2Lgh2aXZWGg
 80ddNOFFux2wSQ0pXZ8sKSHUfdoeWZj5ebiFly2ZtPhwXKamImZaLC/rumoP9dPgtLG7
 rHoA==
X-Gm-Message-State: AOAM530nyO/lmz6m+/XWUwz79Cp++Pgr7/DDxkQcg1scTHmU4HtIRbPY
 550aekVLgoJk/2+bn922BFrLKQ==
X-Google-Smtp-Source: ABdhPJwL3XO8S+QWMLrCm28Y1ol7WHmuehkctYEF5v5aHqfXYKIzJCflQQden7dFzWp8PFep12AVMg==
X-Received: by 2002:a17:907:20c7:: with SMTP id
 qq7mr7529899ejb.528.1615544437474; 
 Fri, 12 Mar 2021 02:20:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y2sm2599440ejf.30.2021.03.12.02.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 02:20:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 120661FF90;
 Fri, 12 Mar 2021 10:20:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: keithp@keithp.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v5 4/5] linux-user/riscv: initialise the TaskState heap/stack
 info
Date: Fri, 12 Mar 2021 10:20:28 +0000
Message-Id: <20210312102029.17017-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312102029.17017-1-alex.bennee@linaro.org>
References: <20210312102029.17017-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 12 Mar 2021 10:20:52 -0000

Arguably the target_cpu_copy_regs function for each architecture is
misnamed as a number of the architectures also take the opportunity to
fill out the TaskState structure. This could arguably be factored out
into common code but that would require a wider audit of the
architectures. For now just replicate for riscv so we can correctly
report semihosting information for SYS_HEAPINFO.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/riscv/cpu_loop.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 6767f941e8..74a9628dc9 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -135,4 +135,9 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
         error_report("Incompatible ELF: RVE cpu requires RVE ABI binary");
         exit(EXIT_FAILURE);
     }
+
+    ts->stack_base = info->start_stack;
+    ts->heap_base = info->brk;
+    /* This will be filled in on the first SYS_HEAPINFO call.  */
+    ts->heap_limit = 0;
 }
-- 
2.20.1


