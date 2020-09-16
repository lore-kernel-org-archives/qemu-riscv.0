Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kILb0-0006O3-MP
	for mharc-qemu-riscv@gnu.org; Tue, 15 Sep 2020 20:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kILaz-0006Jo-50
 for qemu-riscv@nongnu.org; Tue, 15 Sep 2020 20:46:49 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kILax-0001Wl-Jw
 for qemu-riscv@nongnu.org; Tue, 15 Sep 2020 20:46:48 -0400
Received: by mail-pj1-x1034.google.com with SMTP id kk9so648275pjb.2
 for <qemu-riscv@nongnu.org>; Tue, 15 Sep 2020 17:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dqbg1+YUD56oz0mEVRHEVZEpbEBWoWejpoX6YFZKEQU=;
 b=V4SZ0rI5iaEkHjBOYajV8wfP166DB7wHEjOLKMGwCBLD0HZlXs+HqwlB9dyXR6h5YD
 eXylJy52HH2bIJx+N6TbnJ/29tJ9gFGq+TfoZv3Zo2+eAfC4A7a94wqY2UrUFAmCVIsk
 tssV5c6rNM7E5S7A2Xq0EE11VI6ivpzcqMfOlSIY6tdyWZV+zij/ai1pArOZcUS4VMQA
 Ys+/kq37QgJeROu4ay8yPMki5IFXVOLKmaNvqRORf9YgSwIOkErvZ3AbjYV0zV4noqPT
 mdZ94XDQ/9wsFWBIaDHewPKZXN3RErshA+oPQcne0LwFzmcenkTneWQQJvyhlNjsNfHl
 3XMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dqbg1+YUD56oz0mEVRHEVZEpbEBWoWejpoX6YFZKEQU=;
 b=J3V5SDxyhEHcS4uDQko1OUPLZiAb+D1ahfFwKzMfbP3ICfOk9bC8MEueMtPOPl5PUA
 xXanNR2YMufLDR9WGVVlZBRKTWG9kMvC7IfkLsJ2P52Qa6BtBFwUxlU5dboAr8ahLuwm
 gwil8OwhFzk1HCwENCmhnlJzSb9Rmq1yK23ZYIJE8cB0DM+bQuEN1Atj2zC7txZEdk5r
 TVMVcPAm6vGmf2eFyoZ3JdCex3wePx+P0m+gQE/X24ncfWWnT3sIYTKVdylF3xSvhrVQ
 1te9ddiXDUXxFAQ9e0Dhr3nYZt+p2bTR49JjAp+ATWWBfof1Q0DvzUq0Eks/fmh9aD8U
 kWrA==
X-Gm-Message-State: AOAM532tvdDVE4hqLMnsdFMlcLTtZ9HyNpk853Ksy0qCf4PIEPhdlMb+
 xlVRD116nSeQzdcbjCQ4ZA+E7Q==
X-Google-Smtp-Source: ABdhPJyB0a6HD1odyvXgF/38HdPTjf6DkmeoNFdyBFVad/ZfeBolhbcsjiNw6CZ4BFbrhrH4EdL3bw==
X-Received: by 2002:a17:90b:793:: with SMTP id
 l19mr1728901pjz.154.1600217206348; 
 Tue, 15 Sep 2020 17:46:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id kf10sm611723pjb.2.2020.09.15.17.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 17:46:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 5/6] target/riscv: Set instance_align on RISCVCPU TypeInfo
Date: Tue, 15 Sep 2020 17:46:37 -0700
Message-Id: <20200916004638.2444147-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200916004638.2444147-1-richard.henderson@linaro.org>
References: <20200916004638.2444147-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 16 Sep 2020 00:46:49 -0000

Fix alignment of CPURISCVState.vreg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: qemu-riscv@nongnu.org
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 57c006df5d..0bbfd7f457 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -628,6 +628,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .name = TYPE_RISCV_CPU,
         .parent = TYPE_CPU,
         .instance_size = sizeof(RISCVCPU),
+        .instance_align = __alignof__(RISCVCPU),
         .instance_init = riscv_cpu_init,
         .abstract = true,
         .class_size = sizeof(RISCVCPUClass),
-- 
2.25.1


