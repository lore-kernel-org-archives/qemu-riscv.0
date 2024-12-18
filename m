Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D15E7718A
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 16:27:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNwoZ-0000KC-T9; Wed, 18 Dec 2024 11:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tNwo8-0008Dd-AY
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:21:56 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tNwnl-0006u1-EZ
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:21:56 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso1011262166b.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 08:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734538881; x=1735143681; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cVF3i0i05M1npQsD0StKr1mzg1mmNVF3OR/zWTYXdro=;
 b=rml6JLqEHvbxqpeygWefUPxj46PvZDymjfUgWGaAfUYxPvGEaZRicVTljMXvzk5MNV
 84vDE4LCgYrbIYEENvxPi057dJVq1wjRn71Yb9TafQgS9PMUCYV0rMNd0Tly9BdrnqSc
 5nDFopZGiMVcYuEUtOldd48eqAyL/lDv19rDp1Y5ohR5+9TbMVgoTA7OS2G3Hyirjxch
 VCQaLf63TD6W/xz8W5Rk2eIBgibUf8ZZlw23SHfikPEgUUvMXuyjc9TMSxEkaEk/XFKk
 2N7wpGPHZX3In93WgUah+7HyFCVi4SLwyQFLwnfHFLlqiq6d5g/o9q42gOHCUKVxORBF
 g+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734538881; x=1735143681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cVF3i0i05M1npQsD0StKr1mzg1mmNVF3OR/zWTYXdro=;
 b=X4LC06a4G3Tlr2wMr4Ub1/XN2/ErQ62ULi9ikwUglz2Gk+s+eOWnxUEi0ZpaJCI8L2
 YxCyHIqK04q+biNB+YcchMALTu9GJDlnX2yBVWY5KRQoOWeFBmONv8js23ZHcTnozAvM
 tlwW0Bz5NCKMRvCAkfTjrMIFO16wYfGybrL9Kur1yeUdtc8VCHDI0StkIlsXDoD4kJNl
 ogJl/t+jdmwt8pb6yIFbtnQbrF0sO2zMDZNmgOqRqgCi5XgGPcrYVaOhL+NS53YzHYWy
 F+rxZYd6M8vu2MsbgWm0ghvdB3ZA08x7ZgirnPa30tjYQv7STmlII80+oHcLMoSAfzsv
 r8Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcM3MDVZHsfEVo3Ha2OtP33GzGhim2rvqoRc3cTihjYzuo6nfGvcTZVn7wLYZV6kIoSQ6fTBIWajSt@nongnu.org
X-Gm-Message-State: AOJu0Yw+4x7ZCKQcwh2GYMyX1pHeyALzAf6sM0jDDYORdo0pzrMd9nJM
 uzOORjve8mAajKE7eziCopjXHqLmbX1m3S6IaUEE2krZ+WfOXnRuiMr3jJlmH8w=
X-Gm-Gg: ASbGncumTE1j+GDpuew4kTYQA/TvmI/K48EtLTE15J/otapCLHnHSPE9khNyopJ9FKq
 PH8+PylWNnMz+mdjS97iMn9fVTfxmr5Foz0q1mAFH5LZbylMQQsI6SK83ZOa2THGHQQZqVVjCTN
 uTWitkhw4CGy0m4eIrIrjEst5NhI721f3Qu8fumEVrsn/2JCnAqGoDOJOKE2WllT340Zfo6lrd5
 1ud+wk9wEXjT6/VbOiGadNoWyNvyL0lgrAuyl4do6pNdf3sgtQPV5Y=
X-Google-Smtp-Source: AGHT+IHANMJYtQfKxB9pocyQoItnUI+mrJdrNbgM791lDHC0yNjHP6qDd2cADVwixGhApwQggg1szQ==
X-Received: by 2002:a17:907:2cc5:b0:aa6:79fa:b480 with SMTP id
 a640c23a62f3a-aabf471fdd4mr308215766b.10.1734538880844; 
 Wed, 18 Dec 2024 08:21:20 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab960689fbsm567383566b.74.2024.12.18.08.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 08:21:15 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7764D60BA6;
 Wed, 18 Dec 2024 16:21:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Fabiano Rosas <farosas@suse.de>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Weiwei Li <liwei1518@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-arm@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 24/27] tests/vm: fix build_path based path
Date: Wed, 18 Dec 2024 16:21:00 +0000
Message-Id: <20241218162104.3493551-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218162104.3493551-1-alex.bennee@linaro.org>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

We no longer need to go into the per-arch build directories to find
the build directories binary. Lets call it directly.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/basevm.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 4a1af04b9a..6f3f2e76df 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -520,8 +520,7 @@ def get_qemu_path(arch, build_path=None):
     if "QEMU" in os.environ:
         qemu_path = os.environ["QEMU"]
     elif build_path:
-        qemu_path = os.path.join(build_path, arch + "-softmmu")
-        qemu_path = os.path.join(qemu_path, "qemu-system-" + arch)
+        qemu_path = os.path.join(build_path, "qemu-system-" + arch)
     else:
         # Default is to use system path for qemu.
         qemu_path = "qemu-system-" + arch
-- 
2.39.5


