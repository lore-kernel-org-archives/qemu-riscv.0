Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCAB606A326
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 16:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wzw3NsKf
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xPMwV-0005rt-R6; Fri, 06 Nov 2026 11:37:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPMw2-0005p5-E8
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 11:37:05 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPMw0-0006Ot-Ab
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 11:37:01 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-490c3ae81d3so532427f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 06 Nov 2026 08:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793983019; x=1794587819; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=M1m1Iu2vqaoZc/EaTd9O9TTTPYMif4rFTGp2681SKeY=;
 b=wzw3NsKfddBoQzPtnl7g47vm6YlnB8qA0JHWJ1KYnYdJkHEOlR3R/D3+OZX70xNz0Y
 YhpwMZ3nvdNwpzsDPLqmKVrWAhcy/k95i3p4A3c+MnIXIW/Xobj2nyHL5zbdhwBaRLRj
 WSNenzqbeEnVkixgwl3ZkJ3D9QpRwXRIMRfvpUUw2K4EChw6UeUUq2/qnHT8CLX/nYN6
 IYJhO0PGIpvQVoGANEzP3zIW0e37v4jFUkhfHyZKwLwX2BylQKYnfrIdDnPrRFcFBSqm
 c4DMs7ZTD5bJyanACTxfUzsvC0HiDBSGvBYAkk4B2L7q2U7JwZd1qrb5LRStc/VspFdK
 w8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793983019; x=1794587819;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=M1m1Iu2vqaoZc/EaTd9O9TTTPYMif4rFTGp2681SKeY=;
 b=vf4uY6UZwcOzN+BU/iyaR7+h6zRWvAtl80HzOzkKFj48N1GyGQGL/t1thLUZEE6hM3
 wJKmzyhCl5pwaHayslV3LIyqtydB3bq6mYjOPzE8emzQxLKNmD5YyCG6q4Cr76dasS2h
 mMYLyKl0yVVSAS5pa1mE4mM1p6hsIGtT+gkcvtlDq38Nz5JMQg6JyBNw1DaXpiXuIcaG
 6NiKhqh9vht1gCrtwsx09rutv2HqBScXR61X8U5b+Ainb/3W+2oGDrDomx/tQU/u410f
 jmqU32WTDIaRnFjRhrfVght55q65bGsQcp0+2r9/aZPABYGXqEQnbUkYZ/4QuxTfW0AZ
 t6rA==
X-Gm-Message-State: APuU4Z/MBngtJ9isoyagOsXhNhOb78drCrRWIpN/77fSDwT1lV1z+04f
 t9z9xq0mFsWMLvOqe+WlySMXCiO1bZFw7IubO/BIzZTtprQZOOIBTZ1feQ7+E8gRqB4=
X-Gm-Gg: AYBFou1pRZNCjMmBskb5wTvl76oFR9B3Pp/iucyn27vKbbjajrefRJWNXAA7NEhrRZ3
 ZR7P67QpOGhxdWCZuX5tWKDKuN4p1THS5/tA716hSNSy2MhN0XSh5NaZ0mWreD2KkGTvlEdjgcv
 Nb4OuA5ltyxYgf/3rLTQv715seT+dVATW8E52w7WOQ8UC9u8crVBb6oXbBvxUnZbfVWjjxqBCu/
 rDNwxSP8R3wOhceh+a4Afze1MEG8Jxo8oDBPuqoG/MRTVQthshGzzr1LvVdGk8tIE8E7HTt7fb5
 1l7fHugPcScmkQAGUVKqzhfq+B3NxPc1wMDUX6e5F4VZ90Bd37EcaL1EvpcqlTbmrHRFM2UQtfm
 ze4Tj0vlCKyNwsfPuo6Oc0D2+g1nG5nEu7leB9HkBLuIlgLJnO/hKELItxVCLsAungCbVOvBqDY
 /Y4ma8TuIfsDRbPd3dsxwLQorkZS0+5u/Tj7N6h9x8zNTtxBwhF41ozr/hLCDlsXT8kDpG0lKJ5
 Zh8VGA44bVHamTDFbBeyzR1CmDiFbGzyV9p8otGNG4iQPRsjlJUNlk0kyhO/BdKrVlTHFtm4hQV
 F0HHwcYwNfjM+PjUuseiiUGhovy0Qg8/G1C4avVhkB8LbARTWdaK1yiqaZQm3zZigyR7yS09iBN
 HncesqykPG3k22G8ZhlMyx5fSnOf2VWSJBw==
X-Received: by 2002:a05:6000:3112:b0:488:823d:5086 with SMTP id
 ffacd0b85a97d-4926fe2c06fmr5701818f8f.0.1793983018690; 
 Fri, 06 Nov 2026 08:36:58 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d3d60e78sm4517912f8f.1.2026.11.06.08.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:36:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v2 for-11.2 0/2] Fix 'version' arg of VMSTATE_PTIMER
Date: Fri,  6 Nov 2026 16:36:55 +0000
Message-ID: <20261106163657.3825938-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The VMSTATE_PTIMER macro is defined to pass a 'version' argument of 1
to VMSTATE_STRUCT_POINTER_TEST_V.  This means that the field will
only be used in migration when the vmstate struct that uses
VMSTATE_PTIMER has a version_id of at least 1.  This doesn't match
how we define other VMSTATE_FOO which don't take an explicit
version_id, which is to use a version argument of 0 (e.g. all the
common macros like VMSTATE_UINT32 are written to pass 0 to their
VMSTATE_UINT32_V counterparts, and so on). It also doesn't match
how we define VMSTATE_PTIMER_ARRAY.

The practical effect of this is that users of VMSTATE_PTIMER in
vmstate structs which explicitly or implicitly have a version_id of 0
were actually not getting their ptimers migrated.

This series:
 (1) fixes a mistake in wdt_imx2 where we bumped version_id
 but forgot to bump minimum_version_id
 (2) fixes the macro, and bumps version_id and minimum_version_id
 for the 2 vmstate structs that used VMSTATE_PTIMER and had an
 implicit or explicit version_id of 0 (vmstate_xlnx_csu_dma
 and vmstate_k230_wdt) so they cleanly fail migration from
 old to new QEMU

Changes v1->v2:
 * wdt_imx2 is no longer affected as it had a version bump for
   other reasons, but patch 1 is needed to correct an error
   in how we did it
 * patch 2 now bumps version on the affected vmstate structs

thanks
-- PMM

Peter Maydell (2):
  hw/watchdog/wdt_imx2: Set vmstate minimum_version_id to 1
  include/hw/core/ptimer.h: Fix 'version' argument of VMSTATE_PTIMER

 include/hw/core/ptimer.h | 2 +-
 hw/dma/xlnx_csu_dma.c    | 4 ++--
 hw/watchdog/k230_wdt.c   | 2 ++
 hw/watchdog/wdt_imx2.c   | 1 +
 4 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.43.0


