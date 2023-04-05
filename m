Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pk5dr-0006Ll-K2
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 12:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5dl-0006C4-Hm
 for qemu-riscv@nongnu.org; Wed, 05 Apr 2023 12:05:43 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5di-0007XG-Vr
 for qemu-riscv@nongnu.org; Wed, 05 Apr 2023 12:05:41 -0400
Received: by mail-wr1-x42d.google.com with SMTP id m2so36729089wrh.6
 for <qemu-riscv@nongnu.org>; Wed, 05 Apr 2023 09:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680710738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qSZpkYKC0E9O8rqY27roK0ybv9W9NQfMeuFKqLZI7LU=;
 b=wqNCwi876yROugf5tN+kiLbImBLgk+uYIjohRocygCiSXtq0GiLxJMZsXSek6pHpVR
 +vfvjXSlWK4qWKr94gcOADBrEVPqgm5CfvJ9deGOWUrdCVM9PHovYkwZHujef3O8MtOZ
 eXzc0P4Y5NXAVWdLu6uqolhV733Ybgg5UBVQpSLnRk/q1N+A6GEHjHvVwc3QqBqwAdiy
 BNPfLSrZgGarjn1j7MUV3SoT0FiNvFRNxXYmemHmO/109VPWZrGM4pBbcOVF8ud8YiU5
 ASlPsQUvC0UDNDeGKeDi0tm00GS1Eunn4AndcQhBbXGrCKw7wvhL9RVtanHs8lJbVSrB
 h7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680710738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qSZpkYKC0E9O8rqY27roK0ybv9W9NQfMeuFKqLZI7LU=;
 b=5Py1irSlNYbaPnFv5OWR3owlDOJe+2aRmjgoESBm/V61eg4QBkfLFG78LRrTi1rcBV
 2iAl9NBnGtLs/RbwXkfFDrj1rddFnuB3TqWM4pZtf6SnYyYcbhYMsnvnZteoAFmXmhPd
 ANzEcg6aI9mzkQ4cft/12cJwteKg9+A6VLqNcqFaa6j26GMSvmYPWs3W5LhhckkKeH4m
 Oa5zSS4JfCe7g369M9XVwN5KCiqQotXFt7wpnZHMjel44Q9QkaPtOdR5Qf1FRKFVVOM7
 HByieL4kJlwkoXnU9x1Exd39mrDQzsdeW2rvLAw/OPec5NXSaHUwMcOBgb7u7h91Suz6
 1HWA==
X-Gm-Message-State: AAQBX9fNwUevrb5WiY1YY+hykgD4/2cT8zoqIHmlKJErPxUhP7iyDMdO
 ju2c1kN68TLStxBGHPK+DhE6PQ==
X-Google-Smtp-Source: AKy350aZffoChxbCPg7M2fAcOye2AlE3AkD3kI7o7RFqx/SUBuZegFtLbCZIhwjdYIeXSthO8Irkcg==
X-Received: by 2002:adf:eace:0:b0:2ce:a098:c6b8 with SMTP id
 o14-20020adfeace000000b002cea098c6b8mr5030406wrn.55.1680710738191; 
 Wed, 05 Apr 2023 09:05:38 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 q18-20020adffed2000000b002c70851fdd8sm15263762wrs.75.2023.04.05.09.05.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 09:05:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 07/10] target/arm: Restrict KVM-specific fields from ArchCPU
Date: Wed,  5 Apr 2023 18:04:51 +0200
Message-Id: <20230405160454.97436-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405160454.97436-1-philmd@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 16:05:44 -0000

These fields shouldn't be accessed when KVM is not available.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c097cae988..efd1b010d5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -945,6 +945,7 @@ struct ArchCPU {
      */
     uint32_t kvm_target;
 
+#ifdef CONFIG_KVM
     /* KVM init features for this CPU */
     uint32_t kvm_init_features[7];
 
@@ -957,6 +958,7 @@ struct ArchCPU {
 
     /* KVM steal time */
     OnOffAuto kvm_steal_time;
+#endif /* CONFIG_KVM */
 
     /* Uniprocessor system with MP extensions */
     bool mp_is_up;
-- 
2.38.1


