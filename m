Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOPI5-0003RP-GR
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 15:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mOPI4-0003Pf-8w; Thu, 09 Sep 2021 15:00:52 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:36811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mOPI2-0007Kg-Q7; Thu, 09 Sep 2021 15:00:52 -0400
Received: by mail-ej1-x629.google.com with SMTP id bt14so5640380ejb.3;
 Thu, 09 Sep 2021 12:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tu4nrprveGRcZ58eZVRoRC7ws/LiCkJYOGqT/9U5aoo=;
 b=IY7Qb2Xui4SWIRfTQdxlub1NHEa3sv1p2HVxckyLX7rczQqGyBsf2fkA7K60c6821C
 X8iZuUylFV2Fe1M8uEUViEPddstqqf59cFHM8wVc6G+CpDZWuO9JhoxwBPHX9hFUWGvj
 FNyBPsDQCcXIR6ovHhoeyWwOHKdx0zOrCFrH3SQKDod8TWEsFN4sRMeuzYWvp3bgFThQ
 +6FEcB1KIHBm//rKooYuvJY9lfQAvK3kYFx6zI78caLCbhzOOJ7OXQqtrsh4RcqHMaw4
 QRTTseXHnjkPTvMhCbC8nvnAuV+XA0I0mp5ArkoK0qN0hL3orbcfn+ykb2D/BzM/6YTN
 C5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tu4nrprveGRcZ58eZVRoRC7ws/LiCkJYOGqT/9U5aoo=;
 b=WjfsAP3bOKgTrPjAfREoakgzOA9fPuf2cTNz44GkWgMS8N0giw1T8mNZkZlTWQBh+h
 UEUYhDVYo8tY7w5EwtjneYtCaFV9wpQHNFFIJTpFwOFEzRfph0XrCJmm4Kz4f08F+tNr
 sauF1Xc8N1nGHLnu26lQRzgysmsc4IbVpdS0+yTRTyjntGzPcCebcVBd3wQZkn0nQOd4
 LasvvYMzmXG2vWC1BmW1jYG91a3gI7fh9QlFRrZvLMaab+Y6ow8aDRj7LMFa3M6Vu/pK
 2wsmaAUHIFb34OxgPh7PxjFJV5hZaVwIuE4Cn3j35YXdS1y5RQ6UnnG3IeBUpeVVgD4N
 Vl8w==
X-Gm-Message-State: AOAM532u7tb4lKhmjbvB/+n4shaJkATiW6U3Tv2cpeCRCiSnHLEujzD8
 daoG57IdZuoMpIbL7PyR3KI=
X-Google-Smtp-Source: ABdhPJw5w85W30oQZgvD963HsTcUKJXGAsh3p5+RU6Fd8ylVSufaXRVlJCsJQHM45Seh3auG/Qt0Ew==
X-Received: by 2002:a17:906:408c:: with SMTP id
 u12mr5096187ejj.413.1631214049107; 
 Thu, 09 Sep 2021 12:00:49 -0700 (PDT)
Received: from neptune.lab ([46.39.229.233])
 by smtp.googlemail.com with ESMTPSA id c17sm1514588edu.11.2021.09.09.12.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 12:00:48 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v11 1/7] [RISCV_PM] Add J-extension into RISC-V
Date: Thu,  9 Sep 2021 22:00:27 +0300
Message-Id: <20210909190033.1339448-2-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909190033.1339448-1-space.monkey.delivers@gmail.com>
References: <20210909190033.1339448-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 09 Sep 2021 19:00:52 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf1c899c00..451a1637a1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -68,6 +68,7 @@
 #define RVU RV('U')
 #define RVH RV('H')
 #define RVB RV('B')
+#define RVJ RV('J')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -292,6 +293,7 @@ struct RISCVCPU {
         bool ext_s;
         bool ext_u;
         bool ext_h;
+        bool ext_j;
         bool ext_v;
         bool ext_counters;
         bool ext_ifencei;
-- 
2.30.2


