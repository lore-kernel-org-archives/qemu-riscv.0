Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED8A606A327
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 14:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Fp6FhS/y
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWaaL-0007kw-DK; Thu, 26 Nov 2026 09:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWaa9-0007bm-PZ
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 09:36:17 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWaa5-0001ft-8p
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 09:36:17 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4bb6adaf0f1so61654595e9.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 06:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795703772; x=1796308572; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Nsk3fLPm7OZUWnuZkBr+3MNBAw9oM/IWgRRZixghfFo=;
 b=Fp6FhS/yz+IQpr9YkMZGKRUnZ7fC5HFiNa2km9zTCBeVctekg3UynPEZ5c78WVv7Im
 wUY3Z3jmvU54c/zBw3YEhHAnR2QCO/DEADHFAlk0otGnLlnkbIG+48FjgX4Nxgk9vmsg
 PT/K+1Pfvh8gVCLh7KnNqk7cU8gWi1wYLPzBnrgD4dPB6fbdiv3kb/bWHlnLHhJgJk9K
 /D8xQfclvUl1PCx3nIsFXGuwDniJkyZYDDRv2m4j23waOlKwlM8krFIktFYSrdlunz9n
 i9+653ZW5G0vpOJYPmlDhW/UxTB8kyYgOPgTPwvebpcoEeflO6ZOnkq0t0oEC+uBwHvI
 RK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795703772; x=1796308572;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Nsk3fLPm7OZUWnuZkBr+3MNBAw9oM/IWgRRZixghfFo=;
 b=R4YzyQoEbSmuEwukCYhXm4oCLG8xDRfNc1Z4JxodilgwvaNIedq/caUCCJKDEy2Pf+
 GxaYAskSl209TDs6Dim1n00ByR0t4EQDg2w0Z3y+1n5HvyhWJIwW8lslb954JtarB8Ev
 rkyzIoUPdZ/Ja9HoYbAj5x5E4P8E52yH7wALkhwt7ZzWCd7S20WG9eywEDnmCkfOjvIo
 wIu6ZYriZbMcah6Ai5YtV89S8qlLRXUYgG3cD0eVAP/Vlbdi7+PGFUHec9zArq4fzqhW
 AoOKvfpMK+ZbsS77XWiChEW5XgFNC15jiV30oGJ/ka0AXXuJ/UXDxoTbvC+5q/hBlRvv
 HgVQ==
X-Forwarded-Encrypted: i=1;
 AL+hErFrqWcuw/X4chYbpE9sYEZvTMssq/cQYd+kCDJ4Y5A3Dn4Z58Xw6u24pNbgSMLuq9WdJ8oJfRLaFlOR@nongnu.org
X-Gm-Message-State: APuU4Z/Vt9bwGDLOWq5PSoQiik92W4ppDAaUtit4icki/3RPElxtle6Y
 uct53QGF984MtA9SH3x4QtC5FRP0mjb3/WLJZ95F4vtzonzf3aRsa/cWtC4KbDmjSJE=
X-Gm-Gg: AZFdTZdR63KXIxcrvdOXY38oVeMizZHJ0Szpr807NimOnxHQKisbg2qwIMNGchaDaC3
 QdE2gMhx+dvaDm+tGkPQXTB8CaSZdX5zjbE4ZhztGenSO7shDcz8gAGMTsx6/qTwcwtGpFe35Hg
 RZJ11XeaRxlsn+JIjSm9AjzqhaMvhaMlVeouXi+tu64uenZL1NhJdyWRLq0NPbKYRKWxaK/fkC5
 WsUKhHjj2cbNhUMw+ZB2JNuNhrAnCOPaEVQCiUErNbEATHsB9SpQ1F/OXmkiztEvIy46ytoJKNa
 Ii4zC+XHI7/I4FwRjcY8/K7V2P1IbWBl7JkDfNqEmgUsBsOwW7OX0/odeIC6EMKoDaqSJ0Cfp7z
 VvhJRdLkQn69C5TUUHuhPu+9KQBSOhSbDcOR1CTiBOwe9IANZUbIYBroBhy2UeYFULpkewqsiES
 yToIXFYdM7E6ALonpA8mXuMlyOMyJUSamTHLlq9+/BgWpbMrw6V/sXeRB1t6c0wQhpVIFzqa1LJ
 NruaaJ9f8nIh9iKtP2jQrCMg7gnb1soF1nJ93iM2BYxGwyxMVuBxmfXGLD7uD5jrRDbxVNbQF+X
 WPWYwzAV3Z0kP/0fq+uOnD70T1ue
X-Received: by 2002:a05:600c:5303:b0:4a2:1a:a11d with SMTP id
 5b1f17b1804b1-4bb88785d24mr412664495e9.0.1795703771390; 
 Thu, 26 Nov 2026 06:36:11 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb90660cb4sm566256175e9.2.2026.11.26.06.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 06:36:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D1E095FA33;
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
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 4/8] MAINTAINERS: update security reporting links
Date: Thu, 26 Nov 2026 14:36:03 +0000
Message-ID: <20261126143607.2374676-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126143607.2374676-1-alex.bennee@linaro.org>
References: <20261126143607.2374676-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We've updated the online pages but we should make sure MAINTAINERS
doesn't point people to the wrong place.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-ID: <20261120200511.822573-23-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf701b11cf1..ad9dfc43898 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -82,9 +82,7 @@ F: docs/glossary.rst
 
 Responsible Disclosure, Reporting Security Issues
 -------------------------------------------------
-W: https://wiki.qemu.org/SecurityProcess
-M: Michael S. Tsirkin <mst@redhat.com>
-L: qemu-security@nongnu.org
+W: https://www.qemu.org/contribute/security-process/
 
 Trivial patches
 ---------------
-- 
2.47.3


