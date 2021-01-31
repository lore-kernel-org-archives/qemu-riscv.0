Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6AgA-0002kI-VP
	for mharc-qemu-riscv@gnu.org; Sun, 31 Jan 2021 06:14:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Ag8-0002e8-Qm; Sun, 31 Jan 2021 06:14:04 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Ag7-0006Y0-70; Sun, 31 Jan 2021 06:14:04 -0500
Received: by mail-wr1-x435.google.com with SMTP id a1so13468735wrq.6;
 Sun, 31 Jan 2021 03:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UVDP5iZ65cycEwd/7jK5GwJYW+9woRIPB0EI+jBBZJo=;
 b=H1VKl/jLoZuALreDrzHs6jlJJtI4s79PnyL65Fvkl559kD9TTO17/wUhjhNnr5kScT
 QqnnPVAbLkjv+sAPUcEO3jmvccBu7FAqhvC/PefidCgeN43qeMjJhE4UfOfJ+N5ZkUSY
 iVefVaiXTReTEkXxOt+JPv4rKLBeA5QwprmR22cZugwbQVarE2SdF7/af7EcRv2stro2
 zNFRLWlS8MFXPRxBSDbeXVwVKUBcC7aNs1LnH47iw42iRmvEuvpDatknxNCuor1qiwLF
 gQKcDvDFASkjrOgQaHZdRgwAHx6m3Qc3lsKOJ7Et81s8nsly93n4nGXuUKlr8CWszXeP
 oyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UVDP5iZ65cycEwd/7jK5GwJYW+9woRIPB0EI+jBBZJo=;
 b=TIShEJeep7wyb+AAaIK6YZFA4VVHFyNY4V27+qGVNpYAbbsp34j2aiHqlUcZy1B8B8
 IfN2k9NFp7hP+IbOB4dQWJO2wHm4NOTMWaLY4iuMElAmkqc4C2b5mZRHzW25Gp0Mx74N
 6oOaNADpcXhm3N98g5uqXNOnaRQBzUs31vLbYD8fPL8JfvWqF/2CiIyseIGQ+JqvAehe
 E2aZQMB6rQM+Z3Ov+AXRWRr3hTVVVi0jRYUiFekOSw/GtFHnJcp3dBJygbnUNzDIY2wM
 GtpVJcGbg8JOYUkFU4dM/8QyCUFtfjWw8nlHTPyf0bX9/lEqlb1Znd3ybqUMsfQyVB1v
 WYxQ==
X-Gm-Message-State: AOAM53179OoogfdEtn/Ww9fAx0FMYCHHVtnvIpGlcwmv41y4q6DDhOxK
 XKVmRCO3KOuiLNwONHy3MeZV0Sc1eac=
X-Google-Smtp-Source: ABdhPJxkPyi7k+bbTRrGn1kJUzqknXAJNH+OD/SNSOUMw81yzPYOXWCbbKwCfP44+Y2JXFpoeOojDw==
X-Received: by 2002:adf:9148:: with SMTP id j66mr13801208wrj.28.1612091639958; 
 Sun, 31 Jan 2021 03:13:59 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id l11sm21775517wrt.23.2021.01.31.03.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 03:13:59 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Anthony Green <green@moxielogic.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Walle <michael@walle.cc>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Marek Vasut <marex@denx.de>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Rolnik <mrolnik@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 06/10] target/i386: Move SEV feature to target Kconfig
Date: Sun, 31 Jan 2021 12:13:12 +0100
Message-Id: <20210131111316.232778-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131111316.232778-1-f4bug@amsat.org>
References: <20210131111316.232778-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
X-List-Received-Date: Sun, 31 Jan 2021 11:14:05 -0000

SEV is an architecture feature, move its declaration to target/i386/.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/Kconfig     | 4 ----
 target/i386/Kconfig | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 7f91f30877f..3d67c172dab 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -1,7 +1,3 @@
-config SEV
-    bool
-    depends on KVM
-
 config PC
     bool
     imply APPLESMC
diff --git a/target/i386/Kconfig b/target/i386/Kconfig
index ce6968906ee..27c76c554c7 100644
--- a/target/i386/Kconfig
+++ b/target/i386/Kconfig
@@ -3,3 +3,7 @@ config I386
 
 config X86_64
     bool
+
+config SEV
+    bool
+    depends on KVM && I386
-- 
2.26.2


