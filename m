Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F33C5478C
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 14:54:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1reypR-0003aA-B0; Tue, 27 Feb 2024 09:53:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1reypM-00037g-FU
 for qemu-riscv@nongnu.org; Tue, 27 Feb 2024 09:53:04 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1reypD-0004mq-59
 for qemu-riscv@nongnu.org; Tue, 27 Feb 2024 09:53:04 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33aeb088324so2792014f8f.2
 for <qemu-riscv@nongnu.org>; Tue, 27 Feb 2024 06:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709045571; x=1709650371; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zMZ+pFdg1P4n/cHnfp4DZXoxUsYEnk+lXnRUtGdShK8=;
 b=xqkX1NvW/laAo0Kate1dR9vbLT6ho6Ye/MgFXKN5LXL1PRw2ndhPtG9r7T5dzJ6xbS
 2FgurRRiTttgJTNsuinc0jDHYLG0zoux+A+usQPZQhii7IeTnkDdERXWLiUS7cM7QwLO
 6e8B1ARbZBMNtCS4D/uNt3UUfCgnt5AYhBspraAlhWUX/+GQz6nrEfW8hC9ypJ4v95rj
 SJwKlvQcoodl7Cd06hnCnlVtUT+TE4UnMFlB86VRBYMZ5enTbHR2+m6B2u1r9teCF5Nm
 DKm0dTEtjE4UwkbIrtXzGG8+o+ZApgffYbgN17zC8hXlffQgQphQEIFLsOwe9hR4IG40
 30sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709045571; x=1709650371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zMZ+pFdg1P4n/cHnfp4DZXoxUsYEnk+lXnRUtGdShK8=;
 b=hk+9spwVnc7/AQztCiY/II2Mlqhoc3Nc9tB5yycV8RZYEVcaTa/oPDGMZGAr7RDVFI
 bzq0nN/BfwAcsYMCJf+edHsOmsFYGA0IhaRKPbYQ5GuX5Se04CrYSenqJUEibz7OVOlT
 cAKQOTGIO+DKY7paBP+WIzuUTHA+cWH9zY5Vi+B3vWmZ4vM0H9KNjgAe5DkNWzqLI7Bv
 IFi4VheMtrgBmbbkYwHj00cOfZFGdVIQOtzIUyyQ18ELBAGASYazvSOA1LgK+Z5/3k+k
 +JVfMs9MNiHXYUY4PDTzJ4NyPNE3AaRK1LaxzbRMxCGtnFoP9hypEDJsLPSvs9b35lDR
 W46Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVIErwOdfwouJz03k4io5oGoCOakxW1k8n++RheDUzDubSi2rwwA27tYZqjeW57qZujMiPx+1qIZF2coedsM64f3SBIgk=
X-Gm-Message-State: AOJu0Yz71c0qNBovUwfu8DO3kG9BxfESXc9HaqjRQ33ClDi0j2Kk54tY
 RDaTTsIzWEc2vdT9T9NxvtvHiourYOQfOpdITtSWBy/82iMUI7tkY6aPROgStGU=
X-Google-Smtp-Source: AGHT+IETg4WzZNvk2wvxIlG8WU4ie4CylKMnEVrxvPc9V0SjG/5PGdsV3osnYR8Nnzi3wt6/wFwmLQ==
X-Received: by 2002:a5d:400c:0:b0:33b:26de:ea with SMTP id
 n12-20020a5d400c000000b0033b26de00eamr7173413wrp.37.1709045570784; 
 Tue, 27 Feb 2024 06:52:50 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a10-20020a5d4d4a000000b0033d13530134sm11454355wru.106.2024.02.27.06.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 06:52:50 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 280B55F92F;
 Tue, 27 Feb 2024 14:43:38 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-arm@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Michael Rolnik <mrolnik@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-s390x@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Brad Smith <brad@comstyle.com>, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 John Snow <jsnow@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brian Cain <bcain@quicinc.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH v4 28/29] docs/devel: document some plugin assumptions
Date: Tue, 27 Feb 2024 14:43:34 +0000
Message-Id: <20240227144335.1196131-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240227144335.1196131-1-alex.bennee@linaro.org>
References: <20240227144335.1196131-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

While we attempt to hide implementation details from the plugin we
shouldn't be totally obtuse. Let the user know what they can and can't
expect with the various instrumentation options.

Message-Id: <20240103173349.398526-44-alex.bennee@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/tcg-plugins.rst | 49 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 535a74684c5..9cc09d8c3da 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -112,6 +112,55 @@ details are opaque to plugins. The plugin is able to query select
 details of instructions and system configuration only through the
 exported *qemu_plugin* functions.
 
+However the following assumptions can be made:
+
+Translation Blocks
+++++++++++++++++++
+
+All code will go through a translation phase although not all
+translations will be necessarily be executed. You need to instrument
+actual executions to track what is happening.
+
+It is quite normal to see the same address translated multiple times.
+If you want to track the code in system emulation you should examine
+the underlying physical address (``qemu_plugin_insn_haddr``) to take
+into account the effects of virtual memory although if the system does
+paging this will change too.
+
+Not all instructions in a block will always execute so if its
+important to track individual instruction execution you need to
+instrument them directly. However asynchronous interrupts will not
+change control flow mid-block.
+
+Instructions
+++++++++++++
+
+Instruction instrumentation runs before the instruction executes. You
+can be can be sure the instruction will be dispatched, but you can't
+be sure it will complete. Generally this will be because of a
+synchronous exception (e.g. SIGILL) triggered by the instruction
+attempting to execute. If you want to be sure you will need to
+instrument the next instruction as well. See the ``execlog.c`` plugin
+for examples of how to track this and finalise details after execution.
+
+Memory Accesses
++++++++++++++++
+
+Memory callbacks are called after a successful load or store.
+Unsuccessful operations (i.e. faults) will not be visible to memory
+instrumentation although the execution side effects can be observed
+(e.g. entering a exception handler).
+
+System Idle and Resume States
++++++++++++++++++++++++++++++
+
+The ``qemu_plugin_register_vcpu_idle_cb`` and
+``qemu_plugin_register_vcpu_resume_cb`` functions can be used to track
+when CPUs go into and return from sleep states when waiting for
+external I/O. Be aware though that these may occur less frequently
+than in real HW due to the inefficiencies of emulation giving less
+chance for the CPU to idle.
+
 Internals
 ---------
 
-- 
2.39.2


