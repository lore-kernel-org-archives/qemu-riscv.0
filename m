Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04955606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 14:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PgvxOaVC
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWaa6-0007Yi-LM; Thu, 26 Nov 2026 09:36:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWaa5-0007Xz-GQ
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 09:36:13 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWaa3-0001ez-J4
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 09:36:13 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a1fbd52ab6so48457225e9.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 06:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795703770; x=1796308570; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=iR1BSxwzUUC40vPPolihTYt7JyJYZPIAe4hYeiisekU=;
 b=PgvxOaVCwd3/eUEdEMqR1k7mDI9/XxqslsowWAbvDWY8SSWZUAjeyyZQ1SoyvoZxdB
 iCvoxDSoBVCNYNHGWXEFCVCAx4HR1SMZmbNlIoIhWE+t3ODw7opMUVptM9QjqRCmv626
 DybvinuCoSaCTIAnFrUlQht3323iNSkw1gYpa4ZvPVci3rKP+abCGBJr/ur4v1JC0mcf
 RZtejYslVRhYurkqhAQFYQCrBkPsFjCI5H2OaZlcbf/nAyVu+TrKHCk99H+aKJvM45GA
 XV4QHFWCC/2fC1a6Ezil6x8eJ2/fCUexQEHk9wzBuZZ3QsxzLmSF8YQBc2envPImIyaR
 saSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795703770; x=1796308570;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iR1BSxwzUUC40vPPolihTYt7JyJYZPIAe4hYeiisekU=;
 b=wKzqYjlYxAkOkf3A6pTNMXA3B66V4sVosuXgmKL7BGzEOFhF5X9C1qu3yewxkDj55g
 /0lQepE8ZIJJA0BlZIEpO1Z/CwAwYc1RiXDMaRD/aeHB/1pqBptLJOtFN/70atnh8HqD
 p++a4chJfB7xZr1aCDFwS8dixzBCpIVXzFEJiQ2oHu1KxAq44bngaG3VftRiA//6pnFi
 sYMzdH/7u9qZDBaRiK6oxGvjkp2I/f+wikGVE5epZHjrlECtNq9Cbv0Z95OcbY1kONnn
 8Ik4yRlR3nSP6q6bk7gV/7ER95U9bB6qvGtW6wgBmvYAOguIOn8fZ553shr42wj0QPyy
 1EKw==
X-Forwarded-Encrypted: i=1;
 AL+hErEEVjLCxrIY51EfBvf1TlDqNm/W3+N7ngMARsKpvFIdNw6UdPSQ7SCGJwJpMKQX+NrTGtpQLeyC6YMh@nongnu.org
X-Gm-Message-State: APuU4Z9Bs52s41aVAoN4TX5wy109OLG5LzEIP/uyXbpuBATmhgGvk0Xi
 wH+IIWL/w6yGS1+TsdIcRiVBchFulgz7BjDnhwI4fatSxxq/LzpI18hsJp+GosO+9fw=
X-Gm-Gg: AZFdTZelxKuw5uTnQ+Tv6D/e1umw0uPnIpSZ4QT8iANbxWUWGV+yu7pQNi0vzjHfGMD
 7kxXPNHZE43bO4OGKKgkwcDnkZvvNxFr8NuoG6+IOG33uJw/a//lad/6KkKrGP1DOTRxvg0YB0W
 mTVeaPsSYAfjBMyGcQzr4j9JXr9L+9Tb0vKY2AQk4Jkp24gqV5lNGUuO3wqLatrgjRYBHXIGgcZ
 FBZYNQPBVzSdtB7DVrGCos4e8EGmi+FJXKMF8El0L+ZKdeEMEiwI9qmtNL8db59l+BoY0R4gB7o
 ofFx3iYJIEPQB1MsvWFX2flumlavfJbBDOPRnFISJqjtOzB1btDra5PStNA5r3RroFYBt5ZRMrj
 kMzi6tKuy7h7JKBwYpOj7owmSB5a4Ba1zcw34KY9Hs8Y6zNYFR3rtCViXJlzd18qNyAjWhNZCWI
 8sulcOMKJtd37juX/WVEWrvWiaagZGdDX2iniaMMZOa824SrDAOOMLemlRT0cHUPhwNHY87Is3K
 dIGBJCil68UqSu/uW+9NFSwPsZsPSa/ezmB2LujPuytvcV7SoMF/5CxOhFi33Q57lLif9O1UaE2
 VUBZixZSvqOuKE5diUCiJq068npr
X-Received: by 2002:a05:600c:5493:b0:4a2:8c5:5e5 with SMTP id
 5b1f17b1804b1-4bb8881c734mr456826815e9.7.1795703769705; 
 Thu, 26 Nov 2026 06:36:09 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b110c50sm40545967f8f.37.2026.11.26.06.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 06:36:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A4C1B5F9DF;
 Thu, 26 Nov 2026 14:36:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Zhao Liu <zhao1.liu@intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-riscv@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Chao Liu <chao.liu@processmission.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Michael Ellerman <mpe@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH 2/8] MAINTAINERS: make LIU's entries consistent
Date: Thu, 26 Nov 2026 14:36:01 +0000
Message-ID: <20261126143607.2374676-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126143607.2374676-1-alex.bennee@linaro.org>
References: <20261126143607.2374676-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All the commits and s-o-b's use capitalised entries.

Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20261120200511.822573-21-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8c5a40a6929..048ea6a5034 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -367,7 +367,7 @@ M: Palmer Dabbelt <palmer@dabbelt.com>
 M: Alistair Francis <alistair.francis@wdc.com>
 R: Weiwei Li <liwei1518@gmail.com>
 R: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
-R: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
+R: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
 R: Chao Liu <chao.liu@processmission.com>
 L: qemu-riscv@nongnu.org
 S: Supported
-- 
2.47.3


