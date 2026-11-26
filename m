Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80729606A321
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 14:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qEhhQNyK
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWaaP-0007ra-2f; Thu, 26 Nov 2026 09:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWaaB-0007cw-5y
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 09:36:19 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWaa5-0001gG-KY
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 09:36:18 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4b467581b98so68967515e9.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 06:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795703772; x=1796308572; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=eC4yZ6tVjmzFcfPW+oquwB2kkMrMSem8XviYNNZQKvc=;
 b=qEhhQNyKbo9B+YMeC5eDNI6MHaSvxOy+4esIHgZT/FJ9X7bZJR8krZBOFz8dfwDn0u
 qUsqHKLsY3Uz9wtYvk52cZ8iHe5fktSMD9a0mbmSUKne/l8WAi/eAUFUMkxJOHYvftGM
 gudYa7pjzfMQGLafTGbL/dBsa56Rr+Yr54W9akQAvLMfcihOh9PNctc/z7ilYLiDBLKi
 ZYuAxK+ktnfemh9VveL9FDgxDfLZtygWmDNs5BfDzIzzVN9gdMAlwJMdeLqWGs9hSEYD
 GcykWtvFgZSik6DR9AoMbuK4rFlfGmKkGpDj6MAG7WFfohAoJ3i637cuVogL6IWgwnwF
 G/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795703772; x=1796308572;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=eC4yZ6tVjmzFcfPW+oquwB2kkMrMSem8XviYNNZQKvc=;
 b=FBFH3ISyZUQxmEMohgrJ2QUiEJDGpTFglnfxFo9ywVwLVage9uCyNDvuZNy7Bks3Bi
 wxTTDMp2KKfcngW6Ii88R35AUsGV5MdSpTx/+it3osqeAW7ssk4BVe3gxb2qRSjp0G3x
 AoD1t3iBxoW05AncjDRPFdUyChzbqIJS8FFHBN8AxrohcxSI2kp9+ucVa2aN3DUiPgMz
 qMZB+1EZKc+s6t6Y+PbjnFwSaSpIBSAVUXEcEOGOIvs2kz2+iRopci+iFagCNjBvf/Tr
 +YmJM25AVsU4vF8Spb1PNnFpgSygk0LCTJ94aCk79l2yzWsVlINr0HFt284ZrVc/UxcM
 VaeQ==
X-Forwarded-Encrypted: i=1;
 AL+hErEMZJrQYwDwoKm3UP/Yy/5Qir0XpOBnHlhvuNKzv97wSPxleqUbil0DTy/tpQlQaAbyClSIExOVIZKr@nongnu.org
X-Gm-Message-State: APuU4Z+msQUSn2YdGxEXlwyQoM4mZJvK8K5D/oVyytCMO0T/4WYA1W8o
 hYnsxnFENYcdxRrMtscV4I4ItywWXJ4kY+AUIjzJGzMUAUO4ODgGSp/5cF2X9J/RVCI=
X-Gm-Gg: AZFdTZfMmDEf4E2To9ddqSw4Rvxa5nZElqY7a+PbE0ZHmvyoE0u0wPwdV4ZlNbbOrWp
 8BoJ8NvvwHAPRy8H0FfCbqpAYYYWAGzqh71Bf6NHimxIIxeBaYiKm1Q6Hm3tZpTRAuo2EZUQL7a
 yqyS7yE7hyTmHE+Xc6LcJzT2u6yzKRJ81yzJy8ahE4o7yAqh0HxZOceznBpDiqIywfZnZuObNzE
 /+CR94utBE91U/h0tCgYCrApKExLU1kq2Zycrgv+aCbVDjf7SnKX+fMqh3JTSMFB/tJNwWvs3a+
 Mw4Qi3/usEr6+s3hEb6+jFXJnBzfdO9zBVW86Py2eqAFmSipZSz2cTVMG/mfTCa8uLcPPgTTVq1
 Gn+zOQ0lnodpT6kARpY+ar9w88lDxw/iIEhwZbNuCvpAv72mnj4XC60XAE6dFuIvFYdcCBgLijb
 XT3i6+n1/18sFd/vy0EXep1wBIwkgbxKqflFnP0knEvu0JtCc5TtAV/w5t24fTZxDBR698cmueI
 tt5BPDB0rIS0evEsiFKlm7hp/q88XhzvqLnj+/GNOY6dadOkWYMQ6vFK0BDUs7RPBH4Y954DHvj
 4BuLi/KPB8Wwldhwmm2CeiVENHqdsA==
X-Received: by 2002:a05:600c:470a:b0:4a1:d459:db4b with SMTP id
 5b1f17b1804b1-4bb8893071fmr428405395e9.24.1795703772069; 
 Thu, 26 Nov 2026 06:36:12 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88442693sm547554165e9.1.2026.11.26.06.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 06:36:11 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 15BFD5FA5F;
 Thu, 26 Nov 2026 14:36:08 +0000 (GMT)
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
 Brad Smith <brad@comstyle.com>
Subject: [PATCH 6/8] tests/qtest: remove unused prctl/procctl headers
Date: Thu, 26 Nov 2026 14:36:05 +0000
Message-ID: <20261126143607.2374676-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126143607.2374676-1-alex.bennee@linaro.org>
References: <20261126143607.2374676-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Brad Smith <brad@comstyle.com>

Commit 6cbde91a2758 ("tests/qtest: use prctl(PR_SET_PDEATHSIG) as
fallback to kill QEMU") added <sys/prctl.h> for PR_SET_PDEATHSIG on
Linux, and commit 49e9f8644b03 ("qtest: kill orphaned qtest QEMU
processes on FreeBSD") added <sys/procctl.h> for PROC_PDEATHSIG_CTL
on FreeBSD. Those calls were later replaced by -run-with
exit-with-parent=on, but the headers were left behind.

Remove them.

Signed-off-by: Brad Smith <brad@comstyle.com>
Message-ID: <awPwS_xYsv2v9oKu@humpty.home.comstyle.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/libqtest.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 7f66c1bbb3b..f39a39b85c7 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -21,12 +21,6 @@
 #include <sys/wait.h>
 #include <sys/un.h>
 #endif /* _WIN32 */
-#ifdef __linux__
-#include <sys/prctl.h>
-#endif /* __linux__ */
-#ifdef __FreeBSD__
-#include <sys/procctl.h>
-#endif /* __FreeBSD__ */
 
 #include "libqtest.h"
 #include "libqmp.h"
-- 
2.47.3


