Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lH2Fu-0001d3-My
	for mharc-qemu-riscv@gnu.org; Tue, 02 Mar 2021 05:27:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH2Fs-0001YX-OC; Tue, 02 Mar 2021 05:27:52 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:35912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH2Fr-0008GO-6O; Tue, 02 Mar 2021 05:27:52 -0500
Received: by mail-ed1-x535.google.com with SMTP id l12so24482147edt.3;
 Tue, 02 Mar 2021 02:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sZzqDSzbsexD9Zh3aq/wd1p0b53KS/Yn8zf4kVHZSu8=;
 b=C3VIutOQ4snDMas8WGz4Eq0p3PRH6FNWNO92X7rY5mbfYX477lNZZGR4VVP3Ji8btv
 Fu/VuNP8Ha633E687ZFIC8LSvXQI44CP3k+PPrKQtAN3YOYO+UeSMTvmpyM6+pCZk6Fi
 JlW+vV340tpRIX6XHxZqcBpFAeBtekvvVN62Xr4+cQ3Qomi7SSEWsjW7ecL37ydyZXXA
 zr7Txx9+4uuKzEIj+VfTkJNEa6Nrt8SZcKCZXcfzjTtOtVHk4gKi3hwE1zNeHahQBGDH
 iWKnGxrkWlvbVaocp9Mtb2NjfGK8vt5Jwn1XD2fWnNsdDqPUp6UfTS4q/H8uRPaqh9hZ
 Y2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sZzqDSzbsexD9Zh3aq/wd1p0b53KS/Yn8zf4kVHZSu8=;
 b=rL656dPBDAOHxcejM1IJxzqFX5yf+6BqZ4rym6dowu3V8g/rVnztEwUfgfUXLT2ayl
 /PQ580JY3bLN1VugvWou92Fakc/g1/OJR7GnrDwvQUEyBL7RQTMS0018ou1TvEvfXaw1
 VcjH9oUu5cZCgP1thdi9768w40D7e5ZMVd36YTnDy/Pu4ROCimyXVG6hE1owC8du1r+3
 ZAStVezRN/BVQVbT9xikifVYrQXRBZHo18b14soY6xQwyFzwTzeu+//CGpVxz/kgOMGs
 fAmGit4yChXA+C8sqjZJgyfcLW5TqU2qDk1T6sOStdrgnT4OiLkrMQRZwJkIDbnflSEV
 ui7g==
X-Gm-Message-State: AOAM533Dh2jvwQxOEp8ql173XI6E9+ilc4hmwjoBByEFAXlYsvByxoUA
 U+CsUPGYyjgYZD4LuTMDJ87jbvTZ8WQ=
X-Google-Smtp-Source: ABdhPJwqnVUa07ao13D+aDsQOtvYkhHlMbnQO3QZuuRT2q1H0Wx8pFQJeCXrskLyQpBsXETTbLtZSA==
X-Received: by 2002:a50:fa92:: with SMTP id w18mr18340311edr.172.1614680868034; 
 Tue, 02 Mar 2021 02:27:48 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f17sm17965537edu.28.2021.03.02.02.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 02:27:47 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Chris Wulff <crwulff@gmail.com>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Greg Kurz <groug@kaod.org>,
 qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Anthony Green <green@moxielogic.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Claudio Fontana <cfontana@suse.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Michael Rolnik <mrolnik@gmail.com>, David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stafford Horne <shorne@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marek Vasut <marex@denx.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH 1/7] sysemu/tcg: Restrict tcg_exec_init() to CONFIG_TCG
Date: Tue,  2 Mar 2021 11:27:31 +0100
Message-Id: <20210302102737.1031287-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302102737.1031287-1-f4bug@amsat.org>
References: <20210302102737.1031287-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
X-List-Received-Date: Tue, 02 Mar 2021 10:27:53 -0000

Invert the #ifdef'ry to easily restrict tcg_exec_init() declaration
to CONFIG_TCG.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/tcg.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
index 00349fb18a7..fddde2b6b9a 100644
--- a/include/sysemu/tcg.h
+++ b/include/sysemu/tcg.h
@@ -8,13 +8,15 @@
 #ifndef SYSEMU_TCG_H
 #define SYSEMU_TCG_H
 
+#ifndef CONFIG_TCG
+#define tcg_enabled() 0
+#else
+
 void tcg_exec_init(unsigned long tb_size, int splitwx);
 
-#ifdef CONFIG_TCG
 extern bool tcg_allowed;
 #define tcg_enabled() (tcg_allowed)
-#else
-#define tcg_enabled() 0
-#endif
+
+#endif /* CONFIG_TCG */
 
 #endif
-- 
2.26.2


