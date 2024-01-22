Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4444C47DD9
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 15:04:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRvo5-0008NQ-Kd; Mon, 22 Jan 2024 10:01:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rRvnu-0007ff-Kt
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 10:01:38 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rRvnn-0001mK-4U
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 10:01:38 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e7065b7bdso39372375e9.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 07:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705935689; x=1706540489; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eZ1nEd8NJNCNQAO45v/M0dXLXOT0Wd7jVxF+jov+Saw=;
 b=UaTURhoga0TQBjd2b0BbokXnAANv7P51vw4dAEqGA7ctPfvRN4j6RYlwxi2AS+VeEY
 yiT9w6z4sjcxIfPd939FgrmRVU9xTocN2OcIMgqupRpf387Ht7FMpbC2NOqgOo+vXF59
 +Tw4H1sis1IUFxz98ntpyFy2HLiy1HeI6XJGWyaQRA6pxdJonYkqewDYxYgWsMLD61nR
 4g/bhR5AJcwkxVdouyJfCl8DBVbLAnSt0VCvbymC2VFLbdKkizTIo8YOZiFxpizf4Oq7
 WWqJRbgRV/IZZa2g6XmF26eAr2npkCLs94ow2hDQKG2ZewDXhyAa6MqL4Vxs8K1SKsn/
 iSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705935689; x=1706540489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eZ1nEd8NJNCNQAO45v/M0dXLXOT0Wd7jVxF+jov+Saw=;
 b=SrSjIYBss/oHaQiES1B2b4rF6QBujPYbPbXXPZPLfTpkWloaQpDoIF7cPy19xM3sXa
 KC2T+apt0hSlKVrOLqnaSNm2tpl4cGofVwpDMbiDfu62HfCJGVDBLVwT/7lIjV8GnZgA
 UsOMAxzc1SGE8Tl++cU4/frWfiIRKhWu+FdPcEKoAv96wdDwnHL8GWUD8ArJqnE3MDq+
 AMWa9KGsEoY0fw6sO5eX8xJtm7kZODd0El05ktc0DR59LGlUuBDM+zwGjxksT6NoUznu
 qsU/5LGcDhcrK7bKOfhvDztkN/GWvHA2hCi5DC9mRgNSVwflBXrjsaods/WBn42Gr3mK
 hcJg==
X-Gm-Message-State: AOJu0Ywm3yNihZm7AWgcWLhHlO7Uu+VpWOssqqs/tjpCzscLqn4V/Vs6
 w8n3U7DNOc6NP7TNFZH+wdwAy+k/L/venM6znruoBtzp8XRKrAe6vylYsh9s/mQ=
X-Google-Smtp-Source: AGHT+IEwv0U3gluOvjzxJUPlNZ0yWsCpKsoao62m327xZ8POdVEwgy/zDswLP5yfB02fCPKJ5stsXQ==
X-Received: by 2002:a05:600c:5403:b0:40e:a666:4729 with SMTP id
 he3-20020a05600c540300b0040ea6664729mr1258496wmb.278.1705935689716; 
 Mon, 22 Jan 2024 07:01:29 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 v21-20020a05600c445500b0040d62f89381sm39534890wmn.35.2024.01.22.07.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 07:01:28 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E12235F9D2;
 Mon, 22 Jan 2024 14:56:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Laurent Vivier <laurent@vivier.eu>, Yanan Wang <wangyanan55@huawei.com>,
 qemu-ppc@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, John Snow <jsnow@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Woodhouse <dwmw2@infradead.org>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Nicholas Piggin <npiggin@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Paul Durrant <paul@xen.org>
Subject: [PATCH v3 18/21] contrib/plugins: fix imatch
Date: Mon, 22 Jan 2024 14:56:07 +0000
Message-Id: <20240122145610.413836-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240122145610.413836-1-alex.bennee@linaro.org>
References: <20240122145610.413836-1-alex.bennee@linaro.org>
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

We can't directly save the ephemeral imatch from argv as that memory
will get recycled.

Message-Id: <20240103173349.398526-40-alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 contrib/plugins/execlog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
index 82dc2f584e2..f262e5555eb 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -199,7 +199,7 @@ static void parse_insn_match(char *match)
     if (!imatches) {
         imatches = g_ptr_array_new();
     }
-    g_ptr_array_add(imatches, match);
+    g_ptr_array_add(imatches, g_strdup(match));
 }
 
 static void parse_vaddr_match(char *match)
-- 
2.39.2


