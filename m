Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lH6W4-0000hZ-4m
	for mharc-qemu-riscv@gnu.org; Tue, 02 Mar 2021 10:00:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH6Vv-0000Yx-SA; Tue, 02 Mar 2021 10:00:43 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:36015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH6Vt-0005X7-0z; Tue, 02 Mar 2021 10:00:42 -0500
Received: by mail-ej1-x635.google.com with SMTP id do6so35842463ejc.3;
 Tue, 02 Mar 2021 07:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BKerV/D4yrodfK5Y4jXpbSJ4FniyHeyLnN3PSysyF8Y=;
 b=kMJ4BRTh216WsJvtpwLF9Q/JYYJMAxN/RnMYJEB28v42yYEMfCi1+F73iF0EulNk10
 7/byMCvtfp4uKTVybvY+WVO3cJ8+l5e9oij5b2MTY1Cmatr0y6Mg9c4usGvYlQibo/w5
 rncAxPnVMgL2/Fpfh1YbjDD2CSQxsfsPR5ZICmMI0227Q8Ssh91RmolTEMZOEvANYbnV
 ER1tqcNI2xm9Fgz/l+E0YxZbq5idig9AFmzulLjyFJJHq7DbwrCy1iHDKJXF6WAFe1tI
 9wCjPXmWtO9lkKCGYITJuZfHvEaP/MaykF1l7qjgrIuBbF7AbgsMDhPWixuKqXVuxkQj
 SgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BKerV/D4yrodfK5Y4jXpbSJ4FniyHeyLnN3PSysyF8Y=;
 b=dDRmIxsIybNwPKQ70gzPwCU/3vib3/BvnjzRhdXx9E9xW6ZDzwSn9QWvV+xORore5t
 ciuatM7nT0wLSeMLyjIeetYrQNs/y+IP/+v6uDRjmn4s30SlwvUX1KUv3x+yINXd9X6j
 PWUJigD3+ynjGSzzYIGvvtHdEHWVbhBJNgGyGWUoPHcjousJ34z/l/TV6K+/NZEcgN5x
 iHa1b5efEnfN2c9cTwLEJpxojB+V2GRW5egAvW0PN9Xv8f9JfWdq2ojBfCLxY0xwQjDO
 0EKrfLZy7IyWprusEO/EwP8E2DVl7XONUdgXl/b+UuMhdlBkFilfS6SeS5I/vyj9H8W1
 7/aA==
X-Gm-Message-State: AOAM533xX+OyFL5y5MV2B/kcMvLY/BwtDUM+1zTOBitq5QBX4cWTkmBp
 R1L1ah4V8Ev2ythNiR0yLwYLUelpgmE=
X-Google-Smtp-Source: ABdhPJxxzAVZkhW4qSE2UIDQzizpVfmV8D6N4Y9vZCqMDEoygSHGBL6xNtZfG8RqIeFMECe388OMLg==
X-Received: by 2002:a17:906:503:: with SMTP id
 j3mr20942376eja.172.1614697233003; 
 Tue, 02 Mar 2021 07:00:33 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i2sm19546374edy.72.2021.03.02.07.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 07:00:32 -0800 (PST)
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
Subject: [PATCH v3 18/27] gdbstub: Remove watchpoint dead code in
 gdbserver_fork()
Date: Tue,  2 Mar 2021 15:58:09 +0100
Message-Id: <20210302145818.1161461-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x635.google.com
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
X-List-Received-Date: Tue, 02 Mar 2021 15:00:50 -0000

gdbserver_fork() is only used in user emulation where we can not
use watchpoints because we need the softmmu slow path to detect
accesses to watchpointed memory. This code doesn't do anything as
declared as stubs in "hw/core/cpu.h". Drop it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 gdbstub.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index 759bb00bcf0..eee4301b5e6 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3349,7 +3349,6 @@ void gdbserver_fork(CPUState *cpu)
     close(gdbserver_state.fd);
     gdbserver_state.fd = -1;
     cpu_breakpoint_remove_all(cpu, BP_GDB);
-    cpu_watchpoint_remove_all(cpu, BP_GDB);
 }
 #else
 static int gdb_chr_can_receive(void *opaque)
-- 
2.26.2


