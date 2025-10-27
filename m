Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256F5CCF9EE
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 11:12:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDL9F-0005R2-6J; Mon, 27 Oct 2025 07:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL97-0005AT-IO
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:12:19 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL92-0007aK-J0
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:12:16 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b6d855ca585so471666066b.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Oct 2025 04:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563530; x=1762168330; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ebp/epSF7muaQbMsubBHfpMjof/a62SHlqNtbg8Z0UI=;
 b=c8mudxhtE0Ys1g7ClB3SWybxMtTyTmm7O7MRpoJ7fo+U9sU3Afk0NU+xF+py3+9yK7
 qd9OitsDVcDlW0u1KvLyDErj98bBpxD/uHZNnsZ/FqpGiGO2l/ZjaBirCMhr9PmjoCGh
 gqJI43Zta0Eun3DtKDPkuJAyJ+j1ezmtOJlHH5nACpHNCsoPYGK+JanQi+Gghc0Yh5XY
 E0eyaDrhU9Xa9UBw4GHG/ROpeZ5C9t32nEvUWlx5eRQers2Ql3N3XKhpgq+jhC8HBTyh
 AO+KlGyum2/p2xzNnOHQCKlzPFpbiOqnJ/UdSEtEHLYrUfkQeAzj/BKye48+EOC3ydpI
 vvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563530; x=1762168330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ebp/epSF7muaQbMsubBHfpMjof/a62SHlqNtbg8Z0UI=;
 b=hbZdKx2lXgt6W51Am3GtXzu1oOENY+3cthxF+FLmLoa8Tia2vnWXouJRqkxzoZ2Tvd
 /shtkMlhLUV/W0Yza11kHc1cBEwyGpMym+xY+hlecLTsdiZLcNF4cDwialk4T/U/sCVt
 8R5IRPRH5FSxde2Vn51evOxLQoJLkHvtDIkDobuVthG/7+a9p2HbBmZbEpu2eH2JA5VF
 DsK3nEK//ydHfdSY6aKVd8H5Rb+p+9naLI1pqWbNrygIpoCxpUB0KIIxitkIjLziXLlW
 l7Cpz5wCSZ+BIlJvhAjLKhprPJXXskOXCm0x59EDNmbNaHseyxMY4+hj6Zwq5Kj+sjDk
 9bjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB0E5rjKUgmRk2zasDgid7eUU+TXE/7Mj37OVXmgdPrWH7tpVxRTCRmV+SiNJym4OxEf+X/16wwrw/@nongnu.org
X-Gm-Message-State: AOJu0YyIz0RDp0+JltFIMkqgl/GvfmUkDQVlhvCd20Mp7a21FdVAvH/8
 Zu47tttyp7HWpTFLWcRKcS/RlHfWuziC4KqnZSpfTGwIBraqp6xEkYzFP6lZc8ICl+M=
X-Gm-Gg: ASbGncsVc3djzBBBlbwE15UJkgkuOkRunRSMXJ7WDuEfhI3Jl7wDSZ4l8LJ/dAc6oQ7
 XVYAz+3ks2RCpwN/4qFGrsu1HtNCAbbj6+JWUoUb9kJsWiD3DzWEyCISrPi4Cv6iDx3C3laasbI
 zd/CV9NIFvXi+YGqKvTloX5PHsX3LbJ8OmDYSUscH1oTfWjSnqae5RBNhIRr+VW9AZayRCjG6KL
 eSuT+uFJfdSScP3xhayToLDIxnp5wIZkeDIHC1n4wn5UXbO1bwAK8MNKmQ0wcvjByckGNXWFsj5
 kX571E+JgzrzdOZMKdmPxc8mc8yx8spNUCpE5GkRhRI4SQ22ckPKDHQtrWuWxuTSAYxRPGMoWwU
 V31mEg/FvNQ2Tn7N8ScEyxqEU4ksfNuTz1WlR1jK28sALGZO/pBVMbiDDWE2TLe6MipruCkWxBv
 Uz
X-Google-Smtp-Source: AGHT+IHw+fFt1vxI3afdl5Mm0RuD/0R4AOwToR0nUpX3DiGL1ZjBpMF+xhKh6S1HJdvyALHqhPmlYg==
X-Received: by 2002:a17:906:fe4d:b0:b3c:e14c:e24 with SMTP id
 a640c23a62f3a-b647195b339mr4091529366b.13.1761563529688; 
 Mon, 27 Oct 2025 04:12:09 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853fc258sm721557266b.53.2025.10.27.04.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:12:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5C8A86152D;
 Mon, 27 Oct 2025 11:03:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chinmay Rath <rathc@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 34/35] gdbstub: Fix %s formatting
Date: Mon, 27 Oct 2025 11:03:41 +0000
Message-ID: <20251027110344.2289945-35-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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

From: Sean Anderson <sean.anderson@linux.dev>

The format string for %s has two format characters. This causes it to
emit strings like "466f5bd8/6x" instead of "466f5bd8/6". GDB detects
this and returns EIO, causing all open File I/O calls to fail.

Fixes: 0820a075af ("gdbstub: Adjust gdb_do_syscall to only use uint32_t and uint64_t")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/syscalls.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gdbstub/syscalls.c b/gdbstub/syscalls.c
index e855df21aba..d8bb90cc1c7 100644
--- a/gdbstub/syscalls.c
+++ b/gdbstub/syscalls.c
@@ -127,7 +127,7 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...)
             case 's':
                 i64 = va_arg(va, uint64_t);
                 i32 = va_arg(va, uint32_t);
-                p += snprintf(p, p_end - p, "%" PRIx64 "/%x" PRIx32, i64, i32);
+                p += snprintf(p, p_end - p, "%" PRIx64 "/%" PRIx32, i64, i32);
                 break;
             default:
             bad_format:
-- 
2.47.3


