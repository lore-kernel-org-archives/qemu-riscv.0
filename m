Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lH6W2-0000dA-Jy
	for mharc-qemu-riscv@gnu.org; Tue, 02 Mar 2021 10:00:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH6Vl-0000VS-Lk; Tue, 02 Mar 2021 10:00:34 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH6Vk-0005VP-3l; Tue, 02 Mar 2021 10:00:33 -0500
Received: by mail-ej1-x636.google.com with SMTP id hs11so35820760ejc.1;
 Tue, 02 Mar 2021 07:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j69ZoSRYfJYVN8Pr/CO14wOKQXEUVXgfUZYW8ZzPgjs=;
 b=rx9c/Fp9AUXsNAby0S9o6a2kG8PE2rgPupHi+3ITK7y6g/MlNm85u6c1dfOTRUg5T4
 mr9Dv+AZ4B2Cv/jzmK/uVX9r0mFqHypc4TMWTJUiDO5m2g2xZ2XoEMVdnD3acdVbfm1s
 v+VSLYD5w9iAURWQDp3bSY6EjRNuyfsk6kG6I+AjOtorVqFif2NJj2gg2J9YdQkWQ0zs
 qtLh+P+qAL/vYTmxBODFSfqUKzZw6gTz/DNBA02OjTbwgu6GIFUCFtS43egEh4/hIuq+
 f/V/vpVK2aN7CsfnoqFDHIsNf7fmouwJyoKzh7DBw/JsQbn5gsjiN1fLR6qCQiLxsCrA
 TyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=j69ZoSRYfJYVN8Pr/CO14wOKQXEUVXgfUZYW8ZzPgjs=;
 b=hoGeCdRUkgUZNk7EifqUJIOOlOEsPSBuPnxfNW1QqlR/vn56ScF4t0JGplVUQ1RWFr
 eFseVcotv/8TL3tNxmVA585pTCdnxZjv4rVkFYTYAODwfwKv+OqIiUhPqcuvVecbJmTd
 qJRGxFoTYqYOseZgP/bk/hDjLkCcYc8GN0FK3Zzomj5U440Gzn7q90MQP9/+2OeDjcpc
 dMDmo0TNIFB4r1SWe2y8W6CPIUE2Qi9F1zmGdSgQTVxmJyb7YCpKLuaAfoMvlfZ6vz/w
 0GH4phUyz18tGB8lIxJxEsMFqaTpbBppGqgZtdXCCuRHEV1rrdz+NeqvYrnysvJg/ODH
 notg==
X-Gm-Message-State: AOAM531xihqTkOpafBMUHV2Sgd7XUeejcZQbxF7sTphSaDah1H9XSWwe
 +X4qN78lcWP57IpA2MOSkz7YLImT068=
X-Google-Smtp-Source: ABdhPJxCZHaZgGw3rdREFUDJZbblbpV4aRAL5G0RgH7jbrGgCSzoR86eMC0dVNm51ZsxLWNdq9MDMg==
X-Received: by 2002:a17:906:1352:: with SMTP id
 x18mr10628239ejb.545.1614697225830; 
 Tue, 02 Mar 2021 07:00:25 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j14sm17921369eds.78.2021.03.02.07.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 07:00:25 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Michael Rolnik <mrolnik@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stafford Horne <shorne@gmail.com>,
 qemu-ppc@nongnu.org, Anthony Green <green@moxielogic.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Cornelia Huck <cohuck@redhat.com>,
 Claudio Fontana <cfontana@suse.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Walle <michael@walle.cc>, Marek Vasut <marex@denx.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Taylor Simpson <tsimpson@quicinc.com>
Subject: [PATCH v3 17/27] linux-user: Remove dead code
Date: Tue,  2 Mar 2021 15:58:08 +0100
Message-Id: <20210302145818.1161461-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Mar 2021 15:00:41 -0000

We can not use watchpoints in user-mode emulation because we
need the softmmu slow path to detect accesses to watchpointed
memory. This code is expanded as empty stub in "hw/core/cpu.h"
anyway, so we can drop it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/main.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 81f48ff54ed..d7af3ffbc22 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -200,7 +200,6 @@ CPUArchState *cpu_copy(CPUArchState *env)
     CPUState *new_cpu = cpu_create(cpu_type);
     CPUArchState *new_env = new_cpu->env_ptr;
     CPUBreakpoint *bp;
-    CPUWatchpoint *wp;
 
     /* Reset non arch specific state */
     cpu_reset(new_cpu);
@@ -211,13 +210,9 @@ CPUArchState *cpu_copy(CPUArchState *env)
        Note: Once we support ptrace with hw-debug register access, make sure
        BP_CPU break/watchpoints are handled correctly on clone. */
     QTAILQ_INIT(&new_cpu->breakpoints);
-    QTAILQ_INIT(&new_cpu->watchpoints);
     QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
         cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
     }
-    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
-        cpu_watchpoint_insert(new_cpu, wp->vaddr, wp->len, wp->flags, NULL);
-    }
 
     return new_env;
 }
-- 
2.26.2


