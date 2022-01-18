Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9rPj-0007vU-AK
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 11:32:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1n9rPh-0007q2-KR; Tue, 18 Jan 2022 11:32:53 -0500
Received: from mail-wm1-f49.google.com ([209.85.128.49]:37586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1n9rPf-0004zO-CS; Tue, 18 Jan 2022 11:32:53 -0500
Received: by mail-wm1-f49.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso7218152wmj.2; 
 Tue, 18 Jan 2022 08:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BEIuM8Ewuht3Tz73m5zUaWGnW4vxR/IXUenLHgVYYoY=;
 b=X+1WBz1r1uj0YecRU1BpEK3cduyr4gX2uzBRWF96zC4D75bsWmbyZBhuwVbg8UWWNh
 CuZul6gUbjpzD50JoTmw61ryANToeFKJgFm4XgE7bQfhfFyAxFMwwodukNT81PF05ekC
 Ot98nZU0DAD5uFSmVQtEaCY0Nl1RsDPqttCgMHaRLhX+Q3bE+PVOXVEihFCHf3M//Fm3
 /+8fsygd3znmdliNRQ1apSb6Sv9Q4hZ1p9VCQ1JJWLv8h/fWniQn9oBPm6snXOjvD7Dy
 rkKkWhLtoXaO8ugx11x9QnbN+q1mMfI0MTPzMcw6DA/CwGpeEC3HEOUl/BiDd2YLoABU
 oL1g==
X-Gm-Message-State: AOAM533cFO6hw/oN4HmSyPtWf7JkNx4g+yNdwiziEClSCuYkVP5fFxls
 cWzuZRx1dnOYye2L3K/CjJw=
X-Google-Smtp-Source: ABdhPJyyxnIicK9LAoGUmkyywHHlBylXroaZiWq6pj4WJKIilfBwx6EbQu95ElRyyB2/s3Q6HBYazg==
X-Received: by 2002:a05:6000:1a8c:: with SMTP id
 f12mr20012994wry.628.1642523568625; 
 Tue, 18 Jan 2022 08:32:48 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172])
 by smtp.gmail.com with ESMTPSA id m7sm2649985wmi.13.2022.01.18.08.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 08:32:48 -0800 (PST)
From: Christoph Muellner <cmuellner@linux.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: Christoph Muellner <cmuellner@linux.com>
Subject: [RESEND] target/riscv: fix RV128 lq encoding
Date: Tue, 18 Jan 2022 17:32:45 +0100
Message-Id: <20220118163245.2596468-1-cmuellner@linux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.49;
 envelope-from=christophm30@gmail.com; helo=mail-wm1-f49.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 16:32:53 -0000

If LQ has func3==010 and is located in the MISC-MEM opcodes,
then it conflicts with the CBO opcode space.
However, since LQ is specified as: "LQ is added to the MISC-MEM major
opcode", we have an implementation bug, because 'major opcode'
refers to func3, which must be 111.

This results in the following instruction encodings:

lq        ........ ........ .111.... .0001111
cbo_clean 00000000 0001.... .0100000 00001111
cbo_flush 00000000 0010.... .0100000 00001111
cbo_inval 00000000 0000.... .0100000 00001111
cbo_zero  00000000 0100.... .0100000 00001111
                             ^^^-func3
                                      ^^^^^^^-opcode

Signed-off-by: Christoph Muellner <cmuellner@linux.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 5bbedc254c..d3f798ca10 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -168,7 +168,7 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
 
 # *** RV128I Base Instruction Set (in addition to RV64I) ***
 ldu      ............   ..... 111 ..... 0000011 @i
-lq       ............   ..... 010 ..... 0001111 @i
+lq       ............   ..... 111 ..... 0001111 @i
 sq       ............   ..... 100 ..... 0100011 @s
 addid    ............  .....  000 ..... 1011011 @i
 sllid    000000 ......  ..... 001 ..... 1011011 @sh6
-- 
2.34.1


