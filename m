Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE486C5478C
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 17:04:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1reeNj-0004Pb-Rv; Mon, 26 Feb 2024 12:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1reeNL-0003pM-KJ
 for qemu-riscv@nongnu.org; Mon, 26 Feb 2024 12:02:49 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1reeNI-0000mG-ER
 for qemu-riscv@nongnu.org; Mon, 26 Feb 2024 12:02:47 -0500
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d24a727f78so47076991fa.0
 for <qemu-riscv@nongnu.org>; Mon, 26 Feb 2024 09:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708966962; x=1709571762; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t+Lu1aUTzILJv+8PeOqcfRU9ypZOJg6L0bg1/V/uBfw=;
 b=doABZ6ewQ7esAxNthv3kgVmKdmnhmbZvZjyyAGbXlsG4tV13qppCd5N52JlBzxyXB4
 h5jOqcrFwuOi4s7Moj/ZmBDeBE/lWcqj4kt3y1B+17ZOh/Dn6BsdKw8TGZdMpwGyrw7Q
 HU6/1tblj8yNRTaCVEGjc/Xyp6miMddUq+4hrv3VlOx3TyHxCiwwQZx3XhSqvNKT9zFu
 mLo3EoxDpYxcs8B5pKT1OyjAUNR9re0u7F5dQ8Z5rdvN0eXOb/XyoAedTIe4cy0jR1JZ
 D0m41kepm9qkKeqDRfoxjt3eY0qu5A1R9dk8ZVGuMJhaXadx7Kp1YIj63i7t3vj+CDMk
 6M/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708966962; x=1709571762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t+Lu1aUTzILJv+8PeOqcfRU9ypZOJg6L0bg1/V/uBfw=;
 b=ovhup5tpv2DJ5zrJ+CDj5knNkYVsuy9U9WYBpEshClhPQuRmq0/kbx9NA6NCH+dODy
 3LFMHl5EwWcPXkDMyh05g0YzL8dfLc1pbMlxx7hbUuS1WW9a4WVjGMkGItrwe1LvKZa1
 5Gz1IfZO9AIJz/xZiv4pmEIWY+rWLflGw74e61yG7M7wwn7HSpc7awD8hhWepNTiJ3UK
 1xQYmm5l4Q1k/EPmXEBwZTbTNqASibH5/XkCAJmtjL+5idP/K1wADd9g3MZ0kKoij6VN
 jqGKPfjJhHEPEJBW0xTAvt8UXCmK4vfsgqQVNjHn/NLWNrC3a+svYSh8QxYQscwM0YYN
 xSYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM404cE8ANEK3Vdudififd1PsHGm5FCS1Vwj+dhIuz6PMoaF1mn26QTfqnm2NUCNRkkgYJx9GoLtB4vdMEb/NLEo48XSs=
X-Gm-Message-State: AOJu0YwCK6VCuGahUKUb8JZJGYEKGJ8faOgm3xKOCxt2DMR4m1P9A6rU
 hibLxbZz5c5JNdErB/4pAxzejeV+4/qqwBYUQY15++jx6LDZb2A8VdQoELHnpCk=
X-Google-Smtp-Source: AGHT+IEvy/Dv9/G1HtfCIPS1qljPMysCpVRZPiDVG/kbIEDAJVSr7euuk5/zXWEhyyCStLcWcKYjoA==
X-Received: by 2002:a2e:be8e:0:b0:2d2:864c:8220 with SMTP id
 a14-20020a2ebe8e000000b002d2864c8220mr3908224ljr.5.1708966962301; 
 Mon, 26 Feb 2024 09:02:42 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 bh21-20020a05600c3d1500b00412a5903673sm3262250wmb.26.2024.02.26.09.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:02:41 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 24EBC5F932;
 Mon, 26 Feb 2024 16:56:49 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-riscv@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Alexandre Iooss <erdnaxe@crans.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-s390x@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Brian Cain <bcain@quicinc.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 25/27] docs/devel: lift example and plugin API sections up
Date: Mon, 26 Feb 2024 16:56:44 +0000
Message-Id: <20240226165646.425600-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226165646.425600-1-alex.bennee@linaro.org>
References: <20240226165646.425600-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This makes them a bit more visible in the TCG emulation menu rather
than hiding them away bellow the ToC limit.

Message-Id: <20240103173349.398526-43-alex.bennee@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/devel/tcg-plugins.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index fa7421279f5..535a74684c5 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -143,7 +143,7 @@ requested. The plugin isn't completely uninstalled until the safe work
 has executed while all vCPUs are quiescent.
 
 Example Plugins
----------------
+===============
 
 There are a number of plugins included with QEMU and you are
 encouraged to contribute your own plugins plugins upstream. There is a
@@ -591,8 +591,8 @@ The plugin has a number of arguments, all of them are optional:
   configuration arguments implies ``l2=on``.
   (default: N = 2097152 (2MB), B = 64, A = 16)
 
-API
----
+Plugin API
+==========
 
 The following API is generated from the inline documentation in
 ``include/qemu/qemu-plugin.h``. Please ensure any updates to the API
-- 
2.39.2


