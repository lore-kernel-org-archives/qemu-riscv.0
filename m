Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOwAU-0002Qv-4n
	for mharc-qemu-riscv@gnu.org; Fri, 19 Aug 2022 03:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1oOwAS-0002QH-KO
 for qemu-riscv@nongnu.org; Fri, 19 Aug 2022 03:11:44 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:42757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1oOwAQ-0001QP-QE
 for qemu-riscv@nongnu.org; Fri, 19 Aug 2022 03:11:44 -0400
Received: by mail-pl1-x62d.google.com with SMTP id w14so3415858plp.9
 for <qemu-riscv@nongnu.org>; Fri, 19 Aug 2022 00:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=CI1AKmkemxUcLvSjLX87Pw8BxdL3SvMWjUkCdZTOrHc=;
 b=DQ7xXZ2ZRQcFhSiNUUVu3mrujQfO0frFmie7Z+U6GOq4BhCip7kMWh6Oz2Jvx5qZ/3
 fH8ZIuWLwNWnmTddfAegtgceqQIAGP+umsnzFqWqsDey0ii/nhdSvq3E+0p0+D5G1eDD
 loFRB8CIQ23odGki1R0mRfvwKTjbHo+lVvbcQ8IkOq4P2iyat9xme3FSQw7Ig8FNv0ES
 kWTGNB3CdvsqrnSJdOSS5MsSPVRBSGNZXbYCizBauDu8zdgouYNJ+tyB9vNOX7nKQSVg
 ySCNrl+UecLNi2qEtguiQUlVA9TFx3H2EDVmAZXfUX1rQn65UVxY0isBQOOTnsHuayoj
 wrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=CI1AKmkemxUcLvSjLX87Pw8BxdL3SvMWjUkCdZTOrHc=;
 b=7ql+t8U7Wi8AIqH8CGI8ljfNcPVleDkUSVDJY9/M0IC37GJUQVpmQdE8xNJgZf6elp
 FRi/IY28rffUEY4x8oiFUY/Z8CrdxW9383+frxxw+tL1Hb79/BNvlTAtZ9wXz1lvXDZR
 9kxoVwOTy0s4BAQ3+pRo+M7Qt0CuPtfhOWmtCvFmeFeMKM+l8qsliwcGkZ8+coyuxg4b
 u8mrLEHgEJoqa3HcV+M9Ne2rHkWyrOYNt6VQCEFroOmsW+NIJH4iQoocheD8iUrKp7Xu
 ifHbsTHRgfpHf50/IrkzfhKtMeKdqI7068wzQffI9inuzpuyg1KZ2obnSJtK4UUNaUfz
 OGGw==
X-Gm-Message-State: ACgBeo1qVZMaIn2XCXcHJY+wkz2jbsudw/n9zKq4d0ofDF8TljcJfl1G
 0a+lkWXHz2ZrirOuWW6CDKXWQw==
X-Google-Smtp-Source: AA6agR7kxnK+R9BbzMHyc0bYjllxT+Q3vJaVHx82DVUrNvLgKqvhwV967/8CCbTIV/tbkyII2GNQUA==
X-Received: by 2002:a17:902:c943:b0:16f:15a0:d497 with SMTP id
 i3-20020a170902c94300b0016f15a0d497mr6268771pla.80.1660893100303; 
 Fri, 19 Aug 2022 00:11:40 -0700 (PDT)
Received: from gamma24.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 ij25-20020a170902ab5900b00172bc4e0fb7sm1303192plb.250.2022.08.19.00.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 00:11:39 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Tommy Wu <tommy.wu@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] include/hw/riscv/sifive_e.h: Fix the type of parent_obj of
 SiFiveEState.
Date: Fri, 19 Aug 2022 00:11:36 -0700
Message-Id: <20220819071137.1140627-1-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=tommy.wu@sifive.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 19 Aug 2022 07:11:44 -0000

Fix the type of parent_obj of SiFiveEState from 'SysBusDevice'
to 'MachineState'. Because the parent of SiFiveEState is 'MachineState'.

Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
---
 include/hw/riscv/sifive_e.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 83604da805..24359f9fe5 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -41,7 +41,7 @@ typedef struct SiFiveESoCState {
 
 typedef struct SiFiveEState {
     /*< private >*/
-    SysBusDevice parent_obj;
+    MachineState parent_obj;
 
     /*< public >*/
     SiFiveESoCState soc;
-- 
2.27.0


