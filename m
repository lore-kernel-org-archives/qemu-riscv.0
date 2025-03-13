Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07731C282DE
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 16:43:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tslaq-0003VF-DD; Thu, 13 Mar 2025 12:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tslad-0003Lg-2m
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 12:39:23 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tslaa-0005dj-Sm
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 12:39:22 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-301302a328bso2507058a91.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Mar 2025 09:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741883959; x=1742488759; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bYYGOsy+zcSjxVOnigwMonGaAhWbZB7W76ZyOX5Jlgc=;
 b=aC4VCAoPc7kCgFR9CbYieqTDpfu6vlK6GW4NxpxryYtlJcXnTMxpg83PoNJPkAeHJt
 +wMOnLTvEmp15jilYmwubF1zElzC5dnpJGFWrHzP8tWwkyip0Ww93tqz5pgzJRraFZG/
 5QWsfZXLLgFnKwClEAkqKSIekXv51bZv1tVISZYleQBIy/IaJwwlRRG1zz4BHAzE/JnY
 6brS9Vcu4uMEiRrmlksHO5+I7GFO/xJLnchYsOcaMPTJdng63cHp8+sMLnfSw4fpr6hH
 sAuxzhI5rSMXgNJcj0b9WeGr7nmMeiqiFBnlkPvxI1MitZkgSSMt0hHnw0D534sXX/kR
 /5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741883959; x=1742488759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bYYGOsy+zcSjxVOnigwMonGaAhWbZB7W76ZyOX5Jlgc=;
 b=AbTjxRlW97kMG/f7ZxzEMTCZzRlWOEbS/cl0dv31vmpeimeoarq+ZtiUjruDNimQSj
 R2HK7vKo1mL7gA1ii4IBJ7O7qW0FPrrOBBCO9gJEAqpVWZ21heIZuMORmjZ00mB4MyUX
 yAt9nfJHdAW6f3bYu1tN8ysH2ufLjQMO/njO3rx2e0w/QWGLg8wwNB6GGyj/4yKfi53m
 +vdvpnZ3Jf1ts8a518+BR8rw7DT8P26dPqfsRADsl2tNX2q57DlkAQ2fs6ZxD2Kus7Ak
 1ucDNzl812MZ8F4migmc5c4V4m7OlaXN5rik/hpm/A9Xq0FmU6RUMUn9Uz8ijhnJ5W2r
 LqGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUBco0rvCKacwY6CCTJ9l9vEWIrs5ylk3qDHFQmMDb9pYtI+UPH/n7b2sC44h1fC4C/XT7YfxivMnz@nongnu.org
X-Gm-Message-State: AOJu0YxvwTGovRd89/rbHt5QS8sMGg9gq9VWZa5I1d2Gjseke1aPSNyA
 zBO+X4QtlBOhnQ1p/uHjzW0PwYBRlECGnjMwgJk1Zvu6Y4CP0AezpdR3nGhUERk=
X-Gm-Gg: ASbGncsEh5rD82ium3dGeqrZbez1Xbg4FweKxDnfFnEi9d+2yNdwc0cHEEpMFxNz2at
 x7qKm3x/hTq5DB8vQiA/auIOwAtKdJlFBPdgWeuXiT6rgYyMD5NcO0QENICUh32phutpRrot9pJ
 IdE+a/vK5WpGunzwQ1tJUH6gAjiZJQWPfQiL5GNPFU0IKh2DmkPiwJeFNFt5S0U0DQwqPNxSr6E
 Tcjshx+rFMAmDPEN2KRVHCqmMCciVCwk+InGwz5+PzUBZUhUgcMFIilI2CbB3AMkvo/uz84MQBy
 ACn1kdgYizfFVdEYE5EpNnD98TcnU+bEpyrEtcKlE7AQ
X-Google-Smtp-Source: AGHT+IGIP+en0Aj0eYAe+7XhNeZ6W7zp31secPtMQkoPMAwiLZjQzktFWA/FDeyZICzvqUiJA1imgg==
X-Received: by 2002:a17:90b:54c4:b0:2ff:52b8:2767 with SMTP id
 98e67ed59e1d1-3014e8619f7mr247106a91.19.1741883959525; 
 Thu, 13 Mar 2025 09:39:19 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:19 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, manos.pitsidianakis@linaro.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Anthony PERARD <anthony@xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 07/17] exec/exec-all: remove dependency on cpu.h
Date: Thu, 13 Mar 2025 09:38:53 -0700
Message-Id: <20250313163903.1738581-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102a.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Previous commit changed files relying transitively on it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/exec-all.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index dd5c40f2233..19b0eda44a7 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -20,7 +20,6 @@
 #ifndef EXEC_ALL_H
 #define EXEC_ALL_H
 
-#include "cpu.h"
 #if defined(CONFIG_USER_ONLY)
 #include "exec/cpu_ldst.h"
 #endif
-- 
2.39.5


